Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF39146DE74
	for <lists+linux-media@lfdr.de>; Wed,  8 Dec 2021 23:37:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233943AbhLHWlM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Dec 2021 17:41:12 -0500
Received: from mout.gmx.net ([212.227.17.21]:36115 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229533AbhLHWlL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 8 Dec 2021 17:41:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1639003053;
        bh=AWA9692cJSEtkUfRwqBpwz0feFUfCFHaLrm6VZa3cSw=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=K3e4K4wv3mLV22M49S++KIwn57TuBtbDxa3eFCx5h7cijvspOyg+qRbJ5cu6BFmCP
         HDB9LS8rRvUriHSX6W5KYsDQ5viNdvv3nX6iEZQtbJRrVwQV0hDOSZmmPK9c3UeI4i
         nGZxOZbXtpX5g+xJkuJqlGfky3FOX3cCOkuTiMOU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [91.65.60.26] ([91.65.60.26]) by web-mail.gmx.net
 (3c-app-gmx-bap08.server.lan [172.19.172.78]) (via HTTP); Wed, 8 Dec 2021
 23:37:33 +0100
MIME-Version: 1.0
Message-ID: <trinity-7e7d5b59-e213-481b-9b1b-ae9d0819a33c-1639003053723@3c-app-gmx-bap08>
From:   Robert Schlabbach <robert_s@gmx.net>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 3/3] media: si2157: rework the firmware load logic
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 8 Dec 2021 23:37:33 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <842e61352a54e9f1a7f44c4e3250a055c2d45e13.1638958050.git.mchehab+huawei@kernel.org>
References: <cover.1638958050.git.mchehab+huawei@kernel.org>
 <842e61352a54e9f1a7f44c4e3250a055c2d45e13.1638958050.git.mchehab+huawei@kernel.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:fsAwsr9zfamWPubZIHVRKUiZTnQFmXFbS4967f87SArSJaqMcAQGH5KVXQkNABJJtW2CR
 qeg8VLp/lcrB/NP5EZ5UctIaB+rlxJqtkxCbwT/eA/44ZxfoGXIP0mW4wW3SCB2armQO78Rp7M/P
 +/IPAfBNkSeJy86+4yc8x3DMV3BGDrgPZi50iRThG9E1iASS5VpT3gBfyaiXzV+26za6TQ+1V1Uy
 JgiguEwx5ldsYIkmqBrDqFLoTIUSzFXt1Lfi+zCEFAnPzynJtyASgJkjSW4PH7PxNTlTddQQP6UY
 NQ=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:unuG6y316xs=:qGjuVt83faebt5BpjV3vwz
 x0pjZBMQJsLFCuyh/wiQPlVVNumrI79YFg6bmlg1C1c+w9hme0pKcD6j9AZmvv5HyVMYvktKx
 ks3IRclMvAius5kGexynYp2TN/jhn3Doac8aFdw7wQaiddlVouzRigS6RpOP3mL4t4FUgRZDc
 uUduZxkGJrau970D/GkVljn1T34mJ3HwDtGZSfj0CStS0d866DZh7KWuKwlfWY+wSoOmlesPs
 xiU71bK14W7UgAtQi3FMui8ZGmLSj55/N79D+C/th4DPkggyAwJRnqvtqAGv15nkkFtQXaL6b
 wSOkFd5giPP+zExcmFsjCwW23lehpzIXQ2BF0SJk53ETahiI/yQeerd+nlcUyF+lv/lLr7MDS
 Ur/O9H+G8UabrT38OfEUtFZNn9qTEYQ5diev4PE+Ax8KDON6d+ut6KVb0gXv3C+SCT5dVAfqs
 pKM89MfHqdkczcFqzjWM4YlSAkf9v4oyzgvJIlT5AYGvqrmn0W83zFoBIVmeTC9aOnBP3v2oD
 IDITmEp+UdE1x7yp2fnQkE8lz4lLkatVrxzAHCf9c2YZLbdKdlqqsjY85dAnjwtlFOdSx0fVe
 rHlbD5uaYo63r968nkF8/6LUAR1EcrZ0bHGJTrtwNNnwWaGpPJEWLPy86/YRZb2PL6SN6tvFq
 Y1hVxVvlOGxLh1MhruKFzspFL9gMrx3KcdpM9C9roHFM49GITxXSifpLluQnvnrz74t9PS8/B
 vxqvoqS+TQg5hAh5lGWnDk1qr69aX84+O3YwV4WhiDKe6+qGINRxOxiv+uwT13GDTgIZrduwY
 00Ih0uF
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> Loading a firmware file should not be mandatory, as devices
> could work with an eeprom firmware, if available.
>
> Yet, using the eeprom firmware could lead into unpredictable
> results, so the best is to warn about that.

As there is no proof of an EEPROM being involved in any of
that, but strong evidence that all these devices actually have
an embedded firmware ROM, I propose changing that to "ROM"
instead.

> + bool warn_firmware_not_loaded =3D false;
> unsigned int chip_id, xtal_trim;
> - unsigned int fw_required;
> + bool fw_required =3D true;

To me, this is getting too ugly. All these per-model special
flags set somewhere in the code.

I propose removing BOTH these flags. Review of the SiLabs code
revealed:

1. ALL of the tuner models this driver supports have a firmware
   patch from SiLabs available.

2. NONE of them seems to require it. At least all the SiLabs
   drivers allow disabling the download.

So my proposal is:

1. Add firmware download support to all tuner models (this
   means adding some new firmware file names)

2. When a firmware file is not available, log an info (not
   warning) message and proceed.

None of the above boolean flags are needed then. The
dont_load_firmware flag from the config should of course be
kept as it is.

> + dev_warn(&client->dev, "firmware file '%s' not found. Using firmware f=
rom eeprom.\n",

Aside from using dev_info instead and changing the text to
"ROM firmware will be used.", this would also be a duplicate
message, as firmware_request() also logs a message when a
requested firmware file is not found.

So I propose also changing the firmware_request() call to
request_firmware_nowarn() instead to suppress the message
from the firmware loader.

Best Regards,
-Robert Schlabbach
