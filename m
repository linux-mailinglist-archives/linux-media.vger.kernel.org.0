Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFB5F3F1838
	for <lists+linux-media@lfdr.de>; Thu, 19 Aug 2021 13:31:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238581AbhHSLcI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Aug 2021 07:32:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:57592 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231210AbhHSLcH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Aug 2021 07:32:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0157C60F11;
        Thu, 19 Aug 2021 11:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629372691;
        bh=8pd1ouX1VqEjwrfhm7rFU7lcY+9aqpJwyQGUIK2YB/o=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=OU684YEFzUphGMdUPbt5gmmuAz4kC0qPLRi+gaeEhfQhf1lfqUGQvAXWgFqb5o7fD
         6o/SWB0pBziboKRVrEHZ2c1UVHnZmgTKhncBhYpxf+kukflkVgu5vYs7MxzJoZ7uH7
         Z5qhaz4IH3ADgcDajZlF1U9Wtm4C9CtlsVBp8F02BETvruL6RFin2RImPiVSndu5+v
         AsYiZmyTbmICXYvjiC/On8xc6sjk0n+i43Bt7KTxShdsBrP1xj31sHTbRoJuCWHt68
         PHMhRagq+/Dwkuz0jXUldBJLmVxh0nDoaMpOYSVbuJBaS6zN1XQyBn1WLWFuVsY4gB
         arO24d8HyPYYA==
Date:   Thu, 19 Aug 2021 13:31:28 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Soeren Moch <smoch@web.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [Regression 5.14] media: dvb userspace api
Message-ID: <20210819133128.45ef4353@coco.lan>
In-Reply-To: <4e3e0d40-df4a-94f8-7c2d-85010b0873c4@web.de>
References: <4e3e0d40-df4a-94f8-7c2d-85010b0873c4@web.de>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 11 Aug 2021 14:15:02 +0200
Soeren Moch <smoch@web.de> escreveu:

> Commit 819fbd3d8ef36c09576c2a0ffea503f5c46e9177 ("media: dvb header
> files: move some headers to staging") moved audio, video, and osd parts
> of the media DVB API to staging and out of kernel headers. But this is
> part of the media userspace API, removing this causes regressions.

There's no regression: a legacy driver (av7110) for a device that stopped
being manufactured 15 years ago and that doesn't work anymore with current
Digital TV transmissions was removed, together with the API that it was
implemented inside such driver's code.

More details below.

> There
> already is a RedHat bug filed against this [1], and cannot be resolved
> there, of course. Please revert the above mentioned commit.
>=20
>=20
> Linus,
>=20
> Please help to keep the media DVB API intact. From all my previous
> experience with Mauro, he would otherwise just ignore this request and
> later claim: it was removed and cannot be brought back. The userspace
> behind this API is a program suite called VDR ("video disk recorder"),
> which was part of the linux media ecosystem from the beginning, is still
> part of linux distributions like RedHat/Fedora, Debian, SuSE, Ubuntu,
> easyVDR, yaVDR, is actively developed further, and runs with a bigger
> community behind it.
> =C2=A0
>=20
> Mauro,
>=20
> From many previous discussions you know that the av7110 driver, the DVB
> API, and especially also the output part of it, is in active use.

The av7110 hardware was developed up to 1999. Its Linux API was implemented
by a company called Convergence which has long gone (they stopped working
on it back in 2004, afaikt). The av7110 production stopped ~15 years ago.

This is a legacy hardware, which supports only the first generation of DVB
standards, and had an integrated MPEG-2 decoder. As most DVB transmissions
use MPEG4 or newer encoding schemas that didn't exist back in 1999, it
doesn't make any sense keeping such driver upstream nowadays.

The API that got removed was written to control the av7110 MPEG-2 decoder,
and was never integrated at the DVB core: the av7110 had a driver-specific
implementation inside its code.

Besides that, the API was never fully documented: there are several ioctls
from the now removed API that never had any in-kernel implementation, nor
had and descriptions at the specs. None of the current upstream maintainers
have any glue about what such ioctls are supposed to do, nor do we have any=
=20
av7110 hardware to test it.

> I also
> asked several times to pull the saa716x driver [2], which also
> implements the full DVB API, among others for the successor cards of
> saa7146/av7110-based so called full-featured DVB cards. I also offered
> several times to maintain both drivers, and the related API.

The saa716x driver you're mentioned is an out of tree driver.
We don't keep APIs at the upstream Kernel due to OOT drivers.

Btw, there's no need for that: if you have an OOT tree, you can simply
place the API headers for whatever API your device requires.

-

Now, if you want to upstream your driver, I gave you already a
way to do it in the past: we need to develop an interface that it
is not dependent on any hardware-specific functionality, but can
be evolved with time and can support different families of codec
protocols. It should also be properly documented.

Those are the goals already achieved by the V4L2 codec API:
it already supports MPEG2, MPEG4, HEVC and other types of codec,
and can easily be integrated with a DVB device via the media
controller API.

Thanks,
Mauro
