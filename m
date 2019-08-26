Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F25C79CE22
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2019 13:30:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729521AbfHZLaV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Aug 2019 07:30:21 -0400
Received: from mout.web.de ([212.227.15.14]:50797 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727487AbfHZLaV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Aug 2019 07:30:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1566819015;
        bh=NDDBQeniwvykUYvWAnkiqE0F+AhwDVn7oqY/ssqAmwA=;
        h=X-UI-Sender-Class:To:Cc:From:Subject:Date;
        b=d8vPUzi9hNfFBbLR1TzRXPjmasmqcqiEXStLty5tbThvGiaHMse31nJ0J2PVNHkS2
         aKtY9/mB3uj34pcJporSNQ0XI9H4vf0VugKKa+UIfU8uUSxCcww1vdcG82ShdTBVjz
         2gEdsi/3aIA5Rk9Y8gQO1RYHpiWpfaz4reJEu+S4=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.135.136.115]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0M8c2V-1iNC8C3KVP-00wDaB; Mon, 26
 Aug 2019 13:30:15 +0200
To:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        Jia-Ju Bai <baijiaju1990@gmail.com>
From:   Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] media: em28xx: Fix exception handling in em28xx_alloc_urbs()
Openpgp: preference=signencrypt
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <ce8f4240-1d81-87fc-c900-713ddb0bc4f2@web.de>
Date:   Mon, 26 Aug 2019 13:30:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ldhEMwBe/Pg1nGuyVmzq8r5K6PYxFe6XJH/4Ay9hzxpxQ2j0Rt+
 1LPGtoOsGHOBOFYCwfSM2FhDn0WQvg3nTvrlS7o195dpOJdTnQEeTKEw6bXYVef9Wbxxvwq
 qJtcHQBXbRsSi0WjVvatoRwqSEsHWBBCXba01oemD79hXcj+KiMT9l7nSO8XQY5BqY5IDIK
 zxv2Tq1HSKuaMomZUEYVw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:VEfYyOK2bg8=:L5mOlvJhjTXk6NNNzQOlj3
 ygIZPr0ZNyjR6vWpTNihlM3LjGmef3kCC089nx56kTp1AzNGTEVNBf1J1aUfnk/1YEp0wdlCf
 QFtkS+r7UA1DEn9BSsB5SY/UorKVm9mu8GubrY4hd5ra9Qh18B42H4Wol9DkEWaHndPooESYU
 aJAJcDxJangYu9du97xoSWHdSEqN0/tnw2sSY6MADlv38PEF/FDv9VAABUPx4inuyg/K0rL2S
 886ohN9WT7+UNvLyttdXCQB2tSmU8TACKTAkHHWMQ7YyYwyl/KWU2FkDVcijZerdqCI3jNiJC
 Ml7BYBNNc7zmJCdivxf3vE9hhGze2RMDnd14hZMuPLk8nH5VxuoxpY0ew8sbpaxUlShbP72DY
 efvVSkVrHP3HAY2usubfyUrG3oHsP0nFc02VDwUEcXGuELtOuq/I8o7G5igjisvcnyFt1EECB
 suJS0VIquOHueSpuKZQJ4v60g6uVziVcrC2vTJnDoX0gbn1S9a5XbWM5hvV0bZcF4su8pBNJ0
 3KZNvUakvLQCqwZYyN9aB3+1u8f5DH+ege+uyCZOp4QEXVtNz5Sv1lnxCrL0A/u2DPzYiFhDX
 n6i8CZcwN2lqj8DCk24yXMlWcI8nXVx2rrFs6AbBgQ1jLkxTOY10MJGxZlBGtIcchGOpE0LuW
 BfhV9bHSraVQDN2o7x2oCPXWKbqAbVWUfEPliaqsE5cVYTljoV/xPvG3wNHYrTRsQ3V8YKIQm
 KofQyQjt2AyY16NGJcF9lH74wa7Dw8yA4UEgirul68V7kBaBErHM44pjUiQTxWvHHZtYXxiL4
 Cc4zDBpglyIRBH2nvcLgmoaVn6C8aM7FtTTGLc/aVlvX6Nv0c2fI4VnSmp1vFTBtHFG0tMr+m
 gZkGNK+lwSFNYvfoou21GJThyAmIui1TyEqgcvFId8QEgYnwTG0tp0iF1pY8QX9apa+V4bd4a
 sKDYw/UdxBFj0rNKeAMWkzSHzCrgLOEoOgxfoHJ2VXSYtiu9qyNpjmhzRnQJNEopmnGXF0cc9
 5f4KOfMi3QlgPqmPmgfp0sbNf0fSrUAHMD+eKp+wMxPCYDy7OBR1LbIUYNGC7hIDjS+7gRhby
 COTm9xLMJjT373NwrByv074fSO9Jm1X51cXhD6kV295QSE93UY16EwyBTdcga3ItwbC8lQDe7
 06wiw=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 26 Aug 2019 13:14:02 +0200

A null pointer would be passed to a call of the function "kfree" directly
after a call of the function "kcalloc" failed at one place.
Pass the data structure member "urb" instead for which memory
was allocated before (so that this resource will be properly cleaned up).

This issue was detected by using the Coccinelle software.

Fixes: d571b592c6206d33731f41aa710fa0f69ac8611b ("media: em28xx: don't use=
 coherent buffer for DMA transfers")
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/media/usb/em28xx/em28xx-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/em28xx/em28xx-core.c b/drivers/media/usb/em=
28xx/em28xx-core.c
index 2b8c84a5c9a8..e6088b5d1b80 100644
=2D-- a/drivers/media/usb/em28xx/em28xx-core.c
+++ b/drivers/media/usb/em28xx/em28xx-core.c
@@ -931,7 +931,7 @@ int em28xx_alloc_urbs(struct em28xx *dev, enum em28xx_=
mode mode, int xfer_bulk,

 	usb_bufs->buf =3D kcalloc(num_bufs, sizeof(void *), GFP_KERNEL);
 	if (!usb_bufs->buf) {
-		kfree(usb_bufs->buf);
+		kfree(usb_bufs->urb);
 		return -ENOMEM;
 	}

=2D-
2.23.0

