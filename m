Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6B912769F3
	for <lists+linux-media@lfdr.de>; Thu, 24 Sep 2020 09:02:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727005AbgIXHCf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Sep 2020 03:02:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:33734 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726950AbgIXHCf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Sep 2020 03:02:35 -0400
Received: from coco.lan (ip5f5ad5c4.dynamic.kabel-deutschland.de [95.90.213.196])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 276632388A;
        Thu, 24 Sep 2020 07:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600930954;
        bh=evsTuHd3Fp4+7Taw7zaMfgqVvZz1cHE/DTSUFgQDaCk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=TeKiUreKRn7nADFH5PmCNUoZbwkZoEuQFtrpwo9xMGrfWKQN5c2c5nPhG67FOTcIh
         00KelyzysqwjnZB+In3Kipqy9DJOZvI6FEqhdtFFfZVYh4gdVszve8KwTyM7qhWzbx
         gaCGd8ae+TRrxxybjiR2VojEnJJ9HjaOQJzjne2w=
Date:   Thu, 24 Sep 2020 09:02:30 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        Matthew Wilcox <willy@infradead.org>,
        linux-doc@vger.kernel.org,
        Markus Heiser <markus.heiser@darmarit.de>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH RFC] Make the docs build "work" with Sphinx 3.x
Message-ID: <20200924090230.6f3b0ca1@coco.lan>
In-Reply-To: <20200923160210.7cd16161@coco.lan>
References: <20200904102925.52fcd2a1@lwn.net>
        <20200921222639.GY32101@casper.infradead.org>
        <87sgbaqnp9.fsf@intel.com>
        <20200922105656.11043bd9@lwn.net>
        <20200923110106.192e313f@coco.lan>
        <20200923135318.48bb93f5@coco.lan>
        <20200923160210.7cd16161@coco.lan>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 23 Sep 2020 16:02:10 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> Based on what it was described here:
> 
> 	https://github.com/sphinx-doc/sphinx/issues/7421
> 
> I worked on a RFC patch converting one of the media files
> (the CEC one, mentioned at the issue) in order to use the
> new Sphinx 3.1 C domain.
> 
> Yet, it sounds that the c:namespace is broken on Sphinx 3.2.1:
> 
> 	Documentation/userspace-api/media/cec/cec-func-close.rst:23: WARNING: Duplicate C declaration, also defined in 'media/dvb/video-fclose'.
> 	Declaration is 'int close( int fd )'.
> 	Documentation/userspace-api/media/cec/cec-func-close.rst: WARNING: Duplicate C declaration, also defined in 'media/dvb/video-fclose'.
> 	Declaration is 'int close(int fd)'.
> 	Documentation/userspace-api/media/cec/cec-func-close.rst: WARNING: Duplicate C declaration, also defined in 'media/dvb/video-fclose'.
> 	Declaration is 'int fd'.
> 	Documentation/userspace-api/media/cec/cec-func-open.rst:22: WARNING: Duplicate C declaration, also defined in 'media/dvb/video-fopen'.
> 	Declaration is 'int open( const char *device_name, int flags )'.
> 	Documentation/userspace-api/media/cec/cec-func-open.rst: WARNING: Duplicate C declaration, also defined in 'media/dvb/video-fopen'.
> 	Declaration is 'int open(const char *deviceName, int flags)'.
> 	Documentation/userspace-api/media/cec/cec-func-open.rst: WARNING: Duplicate C declaration, also defined in 'media/dvb/video-fopen'.
> 
> Or maybe it has to be defined on each individual .rst file that
> uses an specific domain?

Ok, I was able to get rid of the above warnings, after some discussions at:

	https://github.com/sphinx-doc/sphinx/issues/7421

In summary, the ".. c:namespace::" tag should be used on _every_ file
that uses a different namespace. For CEC, this is not too much,
but on v4l we have 249 files. Lots of them will require the usage of
the namespace directive.

I'm enclosing a patch with the minimal set of changes required to
make the CEC documentation compatible with Sphinx 3.1 and above.

Btw, according with Jakob, there was a bug that cause a run time
regression on Sphinx 3.2, affecting its performance:

	https://github.com/sphinx-doc/sphinx/issues/7421#issuecomment-697710707

Upstream Sphinx developers are working on a fix. So, maybe the
performance for an upcoming 3.2.2 will be similar to 2.x.

Jon,

Should we proceed enforcing version 3.1 to be the minimal one
required?

If so, I can take care of the conversion patches for the
media documents. I guess it should be easy to write a script that
would convert all the tags there to use the new notation.

I can also take a look at the kernel-doc issues.

-

If something has enough time to work at cdomain.py, we may
still have backward compatibility with versions 1.x/2.x
(support for 3.0.x would be a lot harder, IMHO), if cdomain.py 
would get support for at least those two tags:

	:c:expr:
	.. c:namespace::

Those two are the ones that are required to fix Sphinx 3.1+
support for the media docs (although there are other new
c domain tags that could also be interesting).

No idea wow easy/hard would be to add support for them over
there, as cdomain.py currently relies on the Sphinx 1.x/2.x
c domain code. I suspect that implementing support for namespace 
shouldn't be hard, as it internally does that already, but
using a different notation. Support for other tags can be
trickier.

I guess support for :c:expr:`foo()` should also be easy,
as this doesn't produce cross references. So, the code
could just convert this into something equivalent to:

	**``foo()``**

(e. g. into a bold monospaced font).

In any case, if we go to this direction, we'll be limited
to use a subset of the Sphinx 3.1 c domain notation.


Thanks,
Mauro
