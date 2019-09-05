Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59567A9E4F
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 11:27:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387405AbfIEJ1H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 05:27:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:37542 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731740AbfIEJ1H (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Sep 2019 05:27:07 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9952B21848;
        Thu,  5 Sep 2019 09:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567675626;
        bh=/v41qPFClF2nhR0vF9NLnbhl2prgKAF/kweG4ZeX8w4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pg8pEJDBI+Tulk12m8DWGmgWMSuO5ZsuyJTqs1vQa5wlf+Aj3F7/IkPW6TjvQzAQo
         72+wC1S6p5brjxr8PoEL7MGG0GlRU00po2g+i/t3k0WitgUuzE2dpRMfb75RdbCDmP
         z+ukF5YSSYZZ+QtRlyNN/QgB/YGUgMdkMbKlYBVI=
Date:   Thu, 5 Sep 2019 11:27:03 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>, Jessica Yu <jeyu@kernel.org>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Thomas Gleixner <tglx@linutronix.de>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: license-rules.txt: cover SPDX headers on Python
 scripts
Message-ID: <20190905092703.GA30899@kroah.com>
References: <20190905055614.7958918b@coco.lan>
 <88e638eb959095ab6657d295f9f8c27169569bf2.1567675272.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88e638eb959095ab6657d295f9f8c27169569bf2.1567675272.git.mchehab+samsung@kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 05, 2019 at 06:23:13AM -0300, Mauro Carvalho Chehab wrote:
> The author of the license-rules.rst file wanted to be very restrict
> with regards to the location of the SPDX header. It says that
> the SPDX header "shall be added at the first  possible line in
> a file which can contain a comment". Not happy with this already
> restrictive requiement, it goes further:
> 
> "For the majority  of files this is the first line, except for
> scripts", opening an exception to have the SPDX header at the
> second line, if the first line starts with "#!".
> 
> Well, it turns that this is too restrictive for Python scripts,
> and may cause regressions if this would be enforced.
> 
> As mentioned on:
> 	https://stackoverflow.com/questions/728891/correct-way-to-define-python-source-code-encoding
> 
> Python's PEP-263 [1] dictates that an script that needs to default to
> UTF-8 encoding has to follow this rule:
> 
> 	'Python will default to ASCII as standard encoding if no other
> 	 encoding hints are given.
> 
> 	 To define a source code encoding, a magic comment must be placed
> 	 into the source files either as first or second line in the file'
> 
> And:
> 	'More precisely, the first or second line must match the following
> 	 regular expression:
> 
> 	 ^[ \t\f]*#.*?coding[:=][ \t]*([-_.a-zA-Z0-9]+)'
> 
> [1] https://www.python.org/dev/peps/pep-0263/
> 
> If a script has both "#!" and the charset encoding line, we can't place
> a SPDX tag without either violating license-rules.rst or breaking the
> script by making it crash with non-ASCII characters.
> 
> So, add a sort notice saying that, for Python scripts, the SPDX
> header may be up to the third line, in order to cover the case
> where both "#!" and "# .*coding.*UTF-8" lines are found.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> ---
>  Documentation/process/license-rules.rst | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/process/license-rules.rst b/Documentation/process/license-rules.rst
> index 2ef44ada3f11..5d23e3498b1c 100644
> --- a/Documentation/process/license-rules.rst
> +++ b/Documentation/process/license-rules.rst
> @@ -64,9 +64,12 @@ License identifier syntax
>     possible line in a file which can contain a comment.  For the majority
>     of files this is the first line, except for scripts which require the
>     '#!PATH_TO_INTERPRETER' in the first line.  For those scripts the SPDX
> -   identifier goes into the second line.
> +   identifier goes into the second line\ [1]_.
>  
> -|
> +.. [1] Please notice that Python scripts may also need an encoding rule
> +   as defined on PEP-263, which should be defined either at the first
> +   or the second line. So, for such scripts, the SPDX identifier may
> +   go up to the third line.
>  
>  2. Style:
>  

If you are going to do this, can you also fix up scripts/spdxcheck.py to
properly catch this, as well as fixing up the location of the spdx tag
line in the file itself?

thanks,

greg k-h
