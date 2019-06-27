Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 094F358A4B
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 20:57:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726590AbfF0S5P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 14:57:15 -0400
Received: from mout.gmx.net ([212.227.15.19]:41329 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726563AbfF0S5M (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 14:57:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1561661815;
        bh=8zy/CF8eq6vCciU1LYPKVRt1nppxuwPwBxjk8BgMHCI=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=OiMdz/sG7vnUhoMUouJV7XUASaR917O5b29ggMTZrpM+aNhu4zax4rINDSp1y5TAz
         i73CVq6TdG04Vx5YZSOzXzYS2SsMH5lDzBi7z046mTd0HStJHXmvlGxnvoc+3rmmyv
         qsF0nftIgZhok+qENMZFTeZ8EdX9Qze76+0MUf4o=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.111]) by mail.gmx.com
 (mrgmx002 [212.227.17.190]) with ESMTPSA (Nemesis) id
 0LqQzp-1iBDQV3k81-00e1fu; Thu, 27 Jun 2019 20:56:55 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devel@driverdev.osuosl.org,
        linux-media@vger.kernel.org
Subject: [PATCH 16/31] staging: bcm2835-camera: Remove check of the number of buffers supplied
Date:   Thu, 27 Jun 2019 20:56:13 +0200
Message-Id: <1561661788-22744-17-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561661788-22744-1-git-send-email-wahrenst@gmx.net>
References: <1561661788-22744-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:B9slWFuCxy+02ZPi3VQFLXOYRQyTHeed6m6D9LbksOSlspD/mcl
 lUiQc25qvasefDg65qcaQ4JyNgnfNb6utBdEqNMz5Kzd/Q5lZzxp737BxT27weFFSOXQH8K
 H3kBji/p3t46KVOYuclYZ/FXqCcavbNEGml1l++aU24MR314GHcc/gKlgd4dKOxCIB9uDTA
 LlfQvA2olDokT3FAdW8Bg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5Pe78/5ZErA=:j2IiReNY+mN7+vbsSSS1nD
 W0M8UFWxE99aSvM1mQtYylv0ZqO8Bhhs7ASsoNj8EdRZrV09dgGG5/YsHtS5DFJKTQom41q3t
 wzShstS/BBmS4GuVEZ5G91nVVpHSzHbhwmKCaHYE9czAPaUYT2GOs8SeOyBZiptZA2liOecuu
 A7rWaOg7aGGpWmC1bRq4A9Z2rw0n0AsrJQHW+l7/Ove6FFA+yIiuzqgCSydbylxx98k+9JZYI
 MB/3jFzOGm/Y8gegBJGRC1Qix5QxO+y3+9ouQeK7/BBsoUJbTtqUpWAj5en15m0myHxj7gyIT
 yQbOfSSZ6afFE84vnpzepG+7hFOos65n7HC+lBM3bbI4bRAnT4i7w4graVTpfxEaFYlie4IlA
 iRZU9X/eoWJrSt9CLjWf0CDRBi7EaI8PtNFoHmPwNUduFgPaN6wRcvOxGE3iUeXkQA01gb/rk
 dsiUKzI7DrULjuDwCynjpk7KtoXuFakpeRS5eN3R6fOKISyG0kd7MTyYEF+Mho/zd8w8nI7Er
 ioMyD7GyIzLdj1yXeZFeDbbIZI64BZI/jfxtQDMEuScxjptD7ZNl5qpIRlI+gMtPWguRprbvB
 F+UG9mPl62t3FXSUBna7JNbBUZTltuSrxY5vEynldZW7UewjaIwxwBwZZXxq7KJqDskDNdwYZ
 t7O2cCrOcAOROHIAG4LeUcfTu+P2RvqHKcrnIXpREj4EnX+UnpaOmwrp9Wt4epgtsS7VZ5onk
 KZFrf1n/A4bNlpW58xTMhx1fd1TYB1e9lKYUbr7f2eHpAeNxcc9fYeiqbjcp+IntRAhh5f5oL
 hLD1+ub2aJxtBIFoCmQVXgYLclnLrxFXPEUaeajF4B+OvS7OCabTflKlJZWehemcz0iiBjIy6
 FgjJ4b3oliDcmKb5nnelSUgzMWYyP0Vcu487X6qho+2aHIIh9x/7dRwvT7dqvdp+IUwy0HEL4
 ZIckcSqwQgbKofrC6zcjZtyjkXG65ijIkHFriSxhcVifpieV/WO5nPT6a4aQnsVTWZe8u8j+m
 fNKO9fqRzU/w4ew3oTmJkcSk0hsSLyfhIH49Pza4kLDBki5IBrCUC8tWATdTh8Na3Ff+TcUq7
 7YoYkTGzEldgU8=
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dave Stevenson <dave.stevenson@raspberrypi.org>

Before commit "staging: bcm2835-camera: Remove V4L2/MMAL buffer remapping"
there was a need to ensure that there were sufficient buffers supplied fro=
m
the user to cover those being sent to the VPU (always 1).

Now the buffers are linked 1:1 between MMAL and V4L2,
therefore there is no need for that check, and indeed it is wrong
as there is no need to submit all the buffers before starting streaming.

Fixes: 938416707071 ("staging: bcm2835-camera: Remove V4L2/MMAL buffer rem=
apping")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
=2D--
 drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c b/d=
rivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c
index 4d63176..59eb812 100644
=2D-- a/drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c
@@ -1338,16 +1338,6 @@ static int port_enable(struct vchiq_mmal_instance *=
instance,
 	if (port->enabled)
 		return 0;

-	/* ensure there are enough buffers queued to cover the buffer headers */
-	if (port->buffer_cb) {
-		hdr_count =3D 0;
-		list_for_each(buf_head, &port->buffers) {
-			hdr_count++;
-		}
-		if (hdr_count < port->current_buffer.num)
-			return -ENOSPC;
-	}
-
 	ret =3D port_action_port(instance, port,
 			       MMAL_MSG_PORT_ACTION_TYPE_ENABLE);
 	if (ret)
=2D-
2.7.4

