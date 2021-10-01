Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1007741E838
	for <lists+linux-media@lfdr.de>; Fri,  1 Oct 2021 09:19:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231217AbhJAHVB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Oct 2021 03:21:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:43584 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231164AbhJAHU5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 1 Oct 2021 03:20:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 452E8613A0;
        Fri,  1 Oct 2021 07:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633072753;
        bh=AEsSquGUeAt0ZrwXXis1b2MypMNhTwNvCOkT/Lnrt+s=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=cuGt5d+hqWtB25ZTwY1jw6awBjArAPbTP/Pnnqqej6gnPhBg84+F3MTOFrrGtwEsO
         SvkEn2h/AH0VHkeJfY5QHcHRqtIP08D3cgDT15r8Rt60skeozo0ph6xfERMDNwMNv3
         9UJDU500ajvTdzdV1upG6/RQ1zm00fsBBAO2hEJoFh54Lx++1JDVGNzXeBwHZLNBJu
         wG0/S8iGsB2skvxHmv5Z7EUDt26qeOKFfCQUMbXciOuiE5zOuNOm8ZhQ58BZ9Cy0Me
         Z9eFJuFTc5UghrhzxDU3PUGO2xS9k/QWc0E1UC3NN0SA774CNFfVn6oXEzStNLqukp
         av9c0Wbz7FP/A==
Date:   Fri, 1 Oct 2021 09:19:09 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Debucquoy Anthony <d.tonitch@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: Grabster AV 350 no audio
Message-ID: <20211001091909.16f24ed9@coco.lan>
In-Reply-To: <YVXA2vZtsdzJD5Vs@toninux>
References: <YVXA2vZtsdzJD5Vs@toninux>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Anthony,

Em Thu, 30 Sep 2021 15:51:22 +0200
Debucquoy Anthony <d.tonitch@gmail.com> escreveu:

> Hello,
> 
> I have currently have a (Grabster AV 350)
> [https://www.terratec.de/details.php?artnr=10599&lang=en]
> (and 300 that work even less but I will do another thread for it I think) 
> 
> I can easily get video output out of it with /dev/video0 but the problem
> is that I can't get audio by any way

...

> [ 7275.368159 ] em28xx 1-8:1.0: Identified as Terratec AV350 (card=68)
> [ 7275.368163 ] em28xx 1-8:1.0: analog set to isoc mode.
> [ 7275.368192 ] em28xx 1-8:1.0: Registering V4L2 extension
> [ 7275.497387 ] tvp5150 9-005c: tvp5150 (4.0) chip found @ 0xb8 (1-8:1.0)
> [ 7275.497396 ] tvp5150 9-005c: tvp5150am1 detected.
> [ 7278.429769 ] em28xx 1-8:1.0: Config register raw data: 0x50
> [ 7278.470775 ] em28xx 1-8:1.0: AC97 vendor ID = 0x83847666
> [ 7278.490776 ] em28xx 1-8:1.0: AC97 features = 0x6a90
> [ 7278.490782 ] em28xx 1-8:1.0: Sigmatel audio processor detected (stac
> 9766)

The em28xx devices use an external chip for audio, using AC97.

As AC97 is an industry standard, it is possible for board vendors
to replace it with different chips. They do that with time, selecting
a different chip when they need/want.

The boards entry at the em28xx has configurations for the device that
was used at the time the code was introduced, but this may not be
the case anymore for a newer device.

Anyway, the AC97 chips have several different entries. From its
datasheet:

	https://www.digchip.com/datasheets/parts/datasheet/649/STAC9766-pdf.php

It sees that it has the following input lines:

	pc beep
	phone
	aux
	video
	cd
	mic
	line in

They also have a "Master" volume that the driver sets to be in 100%
(but some apps and pulseaudio might reduce it to 0%, causing the device
to be muted).

Anyway, the AC97 Kernel support will expose all lines reported by the
hardware via an ALSA mixer. 

The AV 350 entry assumes that the "line in" mixer entry is the one 
containing the audio. So, it will place the volume for such line
in 100%.

However, maybe, on your device, some other input was used instead.

If this is the case, all you need to do is to open a mixer, unmute
the right line and manually increase the volume.

-

There's a separate issue that might explain why some people
are using a different card: some boards require a command to
enable some pins (called GPIO). Those are used, among other
things, to enable/disable some external chips. In the case of
the original AV 350 that was used to add support for it,
it used some of those GPIOs to enable the AC97 inputs.
If your AV 350 requires a different setting, that will require
to patch the Kernel, but it is more likely that the problem on
your device is just due to a different AC97 volume.

Thanks,
Mauro
