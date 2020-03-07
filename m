Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E60C17CD36
	for <lists+linux-media@lfdr.de>; Sat,  7 Mar 2020 10:20:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726134AbgCGJUf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Mar 2020 04:20:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:50516 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725939AbgCGJUe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 7 Mar 2020 04:20:34 -0500
Received: from onda.lan (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 15BBF206D5;
        Sat,  7 Mar 2020 09:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583572833;
        bh=wlgpAmbKeDguIxSPBByU3V0+cqlnxN7p81t039LeKrI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=QpCrE3KeN+phkLkeQDg/jY0Nx+kR1DdmieLLBfLCm4VfG3Hr4stdXmePsvoqVjK7q
         Qv+QJoRoOqQNCsc8UQKnUqnTkRy3oadV1LNfppCBBptJm9LRtJj/iKrzF4eS7VayfV
         2mwIK2YQR/+UNN9qcm3dqxQxsvlHlBW4ChQbQbDc=
Date:   Sat, 7 Mar 2020 10:20:28 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH RFC 0/2] Move media uAPI and kAPI docs to a better place
Message-ID: <20200307102028.539b7fc5@onda.lan>
In-Reply-To: <20200306154853.7d5c3165@lwn.net>
References: <cover.1583316037.git.mchehab+huawei@kernel.org>
        <20200306154853.7d5c3165@lwn.net>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 6 Mar 2020 15:48:53 -0700
Jonathan Corbet <corbet@lwn.net> escreveu:

> On Wed,  4 Mar 2020 11:51:01 +0100
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > This is something that you always wanted: move uAPI and kAPI to
> > separate books.  
> 
> Oh goodie...Christmas is coming early this year...:)

:-)

> 
> > This RFC series start doing it for the media docs.
> > 
> > For now, this is just a RFC, being only an initial step for it. I'm sending
> > it on this early stage just to rise some discussions.
> > 
> > This changeset basically moves:
> > 
> >   - the media kAPI files to be under driver-api/media;
> >   - the media uAPI files to be under userspace-api/media.
> > 
> > This version keeps including both inside Documentation/media/index.rst.  
> 
> The moves make sense to me.  The including part I'm not so sure about.  It
> seems kind of strange to have the structure of the rendered docs be
> different from that of the plain-text docs; it suggests that one of the two
> placements is wrong.
> 
> My own choice (as you suggest later) would be to keep the structure the
> same in both domains, and to use cross-references to create paths where
> they are needed.

Ok. So, I would keep a Documentation/media/index.rst that will just
have cross-references for the documentation elsewhere, right?

Makes sense to me.

> 
> > The driver-specific information is messy, as each file there may contain
> > either one or more of the following items:
> > 
> > 	- driver-development information;
> > 	- on a few drivers, drivers-specific uAPI.
> > 	- modprobe parameters;
> > 	- List of devices supported by each driver;
> > 
> > The last two are probably contents for the admin-guide, but not sure
> > where to place driver-specific development information. Does it
> > belong to "driver-api" book too?
> > 
> > I guess that driver-specific uAPI could fit at the userspace-api, but I
> > don't want them to be at the same place as the core media API stuff.
> > 
> > Suggestions?  
> 
> That is a good question.  I've wondered for a bit if we need a separate
> hardware manual for documentation specific to a given device.  In cases
> like this, it could perhaps consist mostly of cross-references to the
> relevant documentation in the other manuals.  

There are a large number of Kernel drivers (not only on media) that have
"hardware manuals" inside Documentation.

-

Btw, I finished yesterday the split:

	https://git.linuxtv.org/mchehab/experimental.git/log/?h=media-docs

So, we can now see more concrete examples about how such change would
like.

I still intend to add some cross-references and toadd some extra entries at
MAINTAINERS for the newer files and do some cleanups (on this series,
I kept the contents pretty much untouched), but we can see already the big 
picture.

> It's hard to argue, for
> example, that "modprobe parameters" should be somewhere other than with all
> the other command-line parameters...

Well, on media, several modprobe parameters require a long explanation, 
as they're used to overcome some limitations of probing devices that
don't have any BIOSes and share a common PCI ID (or USB ID) for completely
different hardware. So, just blindly adding them at 
Documentation/admin-guide/kernel-parameters.txt may not be the best
(yet, we should do some efforts to place a short summary of them there,
as I'm pretty sure that some of those aren't refleced there).

One of the bad things on keeping kernel-parameters.txt as a text file
(and having a .rst including it as a literal doc) is that we can't
have cross-references there.

-

On this series, what I did with the driver information is that I placed:

1) drivers release notes:

	- https://git.linuxtv.org/mchehab/experimental.git/tree/Documentation/admin-guide/media?h=media-docs

The stuff there are all focused on explaining users about some
device-specific thing (supported cards, known problems, how to use drivers,
etc).

Those include modprobe parameters, and also other user-facing stuff, like
command line examples about how to do some things. Some still include
some (probably outdated) instructions about how to build a Kernel with
such driver.

2) Development-specific documentation:

	- https://git.linuxtv.org/mchehab/experimental.git/tree/Documentation/driver-api/media/drivers?h=media-docs 

A large part of that are related to things that the drivers' develpers
seem to had figured out themselves. Only useful if someone would need
to touch the source code. They work as some sort of  "Hardware manuals".

The name "driver-api" is not really appropriate for it, as they don't
define any API. They're pure "hardware API docs". Yet, developers
needing such info also needs to know media kAPI. So, while not a perfect
fit, it sounded better than placing them elsewhere.

3) Driver-specific uAPI:

	- https://git.linuxtv.org/mchehab/experimental.git/tree/Documentation/userspace-api/media/drivers?h=media-docs

It covers extensions of the media API to cover driver-specific stuff that
can't be generalized. This incudes some driver-specific formats, some
extra controls to control some hardware-specific parameters and meta-data
streaming (used by some image-enhancing algorithms for cellphone cameras).

Btw, I'm very happy on having a separate session with all driver-specific
APIs. As a maintainer, now I have a centralized place at the docs where I
can see all device-specific userpace APIs, with is a good thing.

Yet, for someone developing an application to work with some of those hardware
it may now need to read on two separate places.

For example, see the IMX driver documentation split:

	https://git.linuxtv.org/mchehab/experimental.git/commit/?h=media-docs&id=da5a18aa27c564cdb4fa6f84026be1c72c1a877c

Anyone working with such driver will need to be able to setup the hardware
pipelines, via the standard media controller API. This is done using
existing applications. So, the command line instructions and pipeline
examples are at the driver's release notes:

	https://git.linuxtv.org/mchehab/experimental.git/tree/Documentation/admin-guide/media/imx.rst?h=media-docs

Also, to fully control the hardware, the userspace application will
need to implement support for some device-specific controls and receive some
events. This is covered at:

	https://git.linuxtv.org/mchehab/experimental.git/tree/Documentation/userspace-api/media/drivers/imx-uapi.rst?h=media-docs

On this specific split[1], I added cross-references at the admin-guide to the
API documentation. Not sure if this is enough or if we would need more things
to cross-reference the docs that got split.

[1] I should do something similar to it with the other split documents.

Comments?

Regards,
Mauro
