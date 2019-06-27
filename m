Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72C6F58A4C
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 20:57:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726596AbfF0S5P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 14:57:15 -0400
Received: from mout.gmx.net ([212.227.15.18]:37311 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726587AbfF0S5O (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 14:57:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1561661809;
        bh=lZmOeAftlgqo1vdHP3EjpsXSMad709JwC3ovNFUjiwQ=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=YlYRsrJx3moT3XGmZzynd1klvf22rerTxmigVrvdXQWeUPm0hCd/v2PaVgW3NzYLe
         s2qmVG6OPIS/o3vh+X6K4xiE8QVzr+RzviwTjTZYPAlsXYEBWeEGKgKfEuxyHtldvU
         DWJc6xDjkUpBtpljK/+sU26VeQzlFWdQtWaGur5k=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.111]) by mail.gmx.com
 (mrgmx002 [212.227.17.190]) with ESMTPSA (Nemesis) id
 0M9ra4-1hrcBl0tDc-00B3Zb; Thu, 27 Jun 2019 20:56:49 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devel@driverdev.osuosl.org,
        linux-media@vger.kernel.org
Subject: [PATCH 02/31] staging: bcm2835-camera: Check the error for REPEAT_SEQ_HEADER
Date:   Thu, 27 Jun 2019 20:55:59 +0200
Message-Id: <1561661788-22744-3-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561661788-22744-1-git-send-email-wahrenst@gmx.net>
References: <1561661788-22744-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:xRoSxi74f4luJ+Wk+0kZTsX3xHfSkTrMrkgOD1IOPvxzVJjunLe
 uZ+aAlxUHYIg6CvrOviaV/iIGAl9mLUUr3noPuL5j2LLEUogEle+eM280eSTHoYX0PQE3O4
 K1AViH65lOMhThZSKZA5BRSUzVHQtv4k4wCA5YvrJsvrbd+0urJdyCWB61pL8szP6DZ/NFx
 ZrjMX6kZR6umiAFEOP7Eg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:L8WFhcwKCGs=:Ys1zgqTPTO+npU8LQsHmfC
 1d48g2/7lNUJALcj5MPVIlqzwiV0dJcDISjgjozwjyoJcPdkJ602j+CUQ8DxPRl/VO9j0XPSB
 tOxdrTQK+Irfqkx1cWFMXNB4H3Bjam6DVLxPD8N4AKp8OY6nlbjzx6gAKMc9Cf6iEm4n2Vckk
 dDiiLeXYnhaphVOEzjOA5WxGtPSpuROzohdTRHE69Y8BxDvQ/5PVnT8md8hYg2jI1hXBgOQU3
 RMRDVeDbCvZ3lWHNgLGKc9xoVckFEojTXTpe++Kww0L93NhtGCCzEcDx2BeHZ2xDVIAkk+NAu
 4JTJhHFKr7YzJFJrk2uoWop3R4E/YlZP18tKKx7VFfOM3D4I4yTsOK8qM04RbZ30dutE4AWww
 LNtrCz+qqYszluUR4WkjXnqtGkk4j/LzOqW4SpI5DFECQ/e7++x22lPJorQpRI3Sy5u32KN+b
 dlbts5kFLZMr6wsVG3Y3+KLxgHk3pP7VEyDCHKf2tLpZ2NC2QmZteTqS0mpuhbju0z9RyRSW9
 gFY8h5Jl1wYWHXWB8dMYONiU6foQbUkbjIm0ioO+G0q7+swx8rKdsIL9ZmZOL+zMbqHXlxVZ+
 UNUkpq34PifnperGy9ijc9nX1I07ZsjuGWV9E2NsX8Y4EBf8Pt/D2DCUgiWvVCdMcaeIb68ek
 FLn0R4kBlMSoRFk38lNN8AKEeO2MLvqLMsN4/QJZQ6B+iKhRFFjJ1JRmAPcHiWCrIUfVm/GYB
 CzL+oUEq+eu7Di9KxG0C3DqS4H1DIbIQydU7BrVmabeESvALAuwFD4MszV8lXMOkKRCcrhu7d
 K9iV5xY3TA/0N9ohy1x4z5+xN0UBfLbEanZXKIxn8MAH7TxcLTLb8/Yng3mFiVSPPkUhtuk85
 hp/g6vjkKFtF4QjM2I+/3D2gK5jNmeQtXooSfaxfFi0R3stSC569J8GIHS8TwhNZx1m8kkV0d
 SRTnsJ8FMdJAi6Udk7s99uqNGT7t8wW2bp71FkQ6tEidrnnPB1D9+TRJlxX3L1BZEr5089LJv
 YRxTp5ARi7MSfalo6ZbNbXawbN7fyYOD7Fe/xbJAycKkP4mMrSZehY9Kj+Eu0ylxvMvLQJGVy
 +ssb39vGj+6PBo=
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dave Stevenson <dave.stevenson@raspberrypi.org>

When handling for V4L2_CID_MPEG_VIDEO_REPEAT_SEQ_HEADER was added
the firmware would reject the setting if H264 hadn't already been
selected. This was fixed in the firmware at that point, but to
enable backwards compatibility the returned error was ignored.

That was Dec 2013, so the chances of having a firmware that still
has that issue is so close to zero that the workaround can be
removed.

Link: https://github.com/raspberrypi/linux/pull/2782/
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
=2D--
 drivers/staging/vc04_services/bcm2835-camera/controls.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/controls.c b/dri=
vers/staging/vc04_services/bcm2835-camera/controls.c
index c251164..133aa6e 100644
=2D-- a/drivers/staging/vc04_services/bcm2835-camera/controls.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/controls.c
@@ -1124,7 +1124,7 @@ static const struct bm2835_mmal_v4l2_ctrl v4l2_ctrls=
[V4L2_CTRL_COUNT] =3D {
 		0, 1, NULL,
 		MMAL_PARAMETER_VIDEO_ENCODE_INLINE_HEADER,
 		ctrl_set_video_encode_param_output,
-		true	/* Errors ignored as requires latest firmware to work */
+		false
 	},
 	{
 		V4L2_CID_MPEG_VIDEO_H264_PROFILE,
=2D-
2.7.4

