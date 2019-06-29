Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D45775AAA8
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2019 14:14:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726961AbfF2MO3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Jun 2019 08:14:29 -0400
Received: from mout.gmx.net ([212.227.17.20]:44097 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726906AbfF2MO2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Jun 2019 08:14:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1561810450;
        bh=lqb0GYVfx1zv6fO8FMllOzy0xCPuxLT1hKd8sJfD9HU=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=A3Ac58GtFkjzDPTsuHI66QgLUsSHx7UXS+Be9ozhe/MTT5ZX+NA8C5n0NLLBRVV9g
         qF014PXESDBFwlKvzH8T6VDJ4UPdEcgV4fTKWEosp6mwkSvR0zTOJy0G5dLXgcAP2K
         T51SfbBpXHmrMuo63ZE0akhEBl1bemQeQzYYTpeI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.111]) by mail.gmx.com
 (mrgmx103 [212.227.17.168]) with ESMTPSA (Nemesis) id
 0LfTC1-1iMsrA34qf-00p35n; Sat, 29 Jun 2019 14:14:09 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devel@driverdev.osuosl.org,
        linux-media@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 12/29] staging: bcm2835-camera: Fix missing lines between items
Date:   Sat, 29 Jun 2019 14:13:27 +0200
Message-Id: <1561810410-8829-13-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561810410-8829-1-git-send-email-wahrenst@gmx.net>
References: <1561810410-8829-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:AouCbZc7Dgcy2VJXo5BzkXG8P6sTu0cIpPoIeko7pitM1iIcSTq
 6J2Sv/bRRNbyszHl1LN0b+FgDjflg311LO0lzMVZyNhPU83CGbIrOXnct+wPzZb9d4nkvbs
 /n1J2GjbM637uSOpIKwUHCKfuZkPhHaO0N79w+se5CTamoz8thAPdxL7VXtFdFVmUi+8gG8
 RVvu+eQlPXbAVlAbG0DgQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:O5qRPkUdzdU=:4Ie1ZpOk3U4XKRXkw3H19L
 fhuy7yZLkBAIvZpSNsLhW75FvEu1Lp1zW0TemM7Z37qocomGNkP2wptdFKnBSBSk7yMUugcws
 1NeYqh1lVs7o8NlT6a+sBPfVNex8NdsWrOAkui7LqY1ZCNdb86zioun51QU0PzSWf3b2m2HJn
 q0X2z9g6PCQg707MSL6ugU025dtFGmuUFpLWuHEpiAJLHnm49/7iy9xlSNz/MUb/LjFkXYbv5
 XxD4A8w6eXJSRXUP+ufxisyOUCl6CuijtSdYEZ/iaQpj32dArROu1W7A9N2BPZn2MXOVK/nZ0
 e7xWgPOIr74YdG8b+rVUg4l+e8wBk+LhBUBTkMhHdsehk5mQ43uo6T5sdsc2/nz/WACbe7rnm
 B/2HcniqzXXW3LBAlkSM6nipukleeRieX8zVb/JEF+RlExalbjZ8NPZ/cKHahV0vD8lZEhEVu
 l3A8tKyQHs/Cm/pveWEGYNbKX2l9Gziev5oMOR9pMQaxU606Jyvw8GgdERkh3wW1IBO4+epw0
 0TKIL3bmcxhmz2iK9xYV4Q3+l/k1HvHNNddiEh7GKbDMQGviL7EYN32NM8dO0XRN+IxBpUlm1
 vfY2vRBbA6/M4+F44IxbKpbfQAJW8lmO2HMkzCPA77yv/hDs1zPYq137AJEq4p5MXd9a2D95q
 Q8qWbduO/fSBwP65DToYnt5S4j4On6Vw4Zs+JV19rQ/FO6Ztkc83nLIuSHnMKjnuzTMLnczU7
 gT3bLGmgGCujJcSgBIaa9OPXYbd7D0pocSGqeBFSNNQ9otyPSK6BMQ9KK7ML+WVNJBZZWa+YD
 mJQv27Wmzt4ggpFel2E2njXX5VvDd6x7Irdfer+tOYe/gzK+4VcIqPQwdlgS/F26VCXfjRZtz
 3ZxpP6tNhV0eqDNF62xumX7unnaHOjzyP9oljAwQdOytozkZ0Czza+CZ7iNYrVBDon1w5Zs5b
 zfQcxd2LHYVEHjZfHtNOCitGjNBaY40hO/3FzYrYTHp/Oci6nKkhzzv1Dydzb4SvpfmY8lUJQ
 iPductemKgh8BnWDp4Dng7QT4OgfvViMMjDwh8v4WT2OWYWlQ3uaIXf6v/wi0AlY6B6z/hZ7k
 nWxcwEqAQAhtjM=
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dave Stevenson <dave.stevenson@raspberrypi.org>

Fix checkpatch errors for missing blank lines after variable
or structure declarations.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Acked-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
=2D--
 drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.h=
 b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.h
index 9bd262d..d9f0411 100644
=2D-- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.h
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.h
@@ -128,6 +128,7 @@ int set_framerate_params(struct bm2835_mmal_dev *dev);
 		(pix_fmt)->pixelformat, (pix_fmt)->bytesperline,	\
 		(pix_fmt)->sizeimage, (pix_fmt)->colorspace, (pix_fmt)->priv); \
 }
+
 #define v4l2_dump_win_format(level, debug, dev, win_fmt, desc)	\
 {	\
 	v4l2_dbg(level, debug, dev,	\
=2D-
2.7.4

