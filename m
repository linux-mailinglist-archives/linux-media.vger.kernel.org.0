Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4610058C78
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 23:10:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726497AbfF0VKJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 17:10:09 -0400
Received: from mout.gmx.net ([212.227.15.18]:59483 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726426AbfF0VKJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 17:10:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1561669791;
        bh=xdTAATWF8qX6yvXCOv29YdhPGUUPpJi7l7udO3XOz3o=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=eh0rZ0J45FuY/n5E4be49hyEsA37PoCc2+4E/PHiBSK7lCRrDptyda4gD0kWyuAvz
         PrOHIo7Hqi//pKQ18kN0WOjudFUFGK2gr0+EQdgTr9RdRg9IBnNUqKLJruf7eSrrWB
         I8JCo/Mn3sr1PHZeRf5bp+yiLM4y7lZscxCeIglc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.111]) by mail.gmx.com
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1M2f9h-1hhztI1mox-0049H6; Thu, 27 Jun 2019 23:09:51 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devel@driverdev.osuosl.org,
        linux-media@vger.kernel.org
Subject: [PATCH 30/31] staging: bcm2835-camera: Set the field value within ach buffer
Date:   Thu, 27 Jun 2019 23:09:28 +0200
Message-Id: <1561669769-2498-4-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561669769-2498-1-git-send-email-wahrenst@gmx.net>
References: <1561669769-2498-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:4p9yOIhIrBTeY/wdnhkFhlYsxDf8BdSb0lYlxYcw2+9Vz6In7NX
 4cP0I6lDzSRKKuBytlRDRK0xrHTB7ACIcOl9DieNvK1jFc+ufRd0rReoLe2iX3gpZ8PhbQz
 IASrz/oLgKDRk4lCN59DFHobxwqGHwe80LwpVTgDO/JZOVGiyzW3H2P2mGHxIHpihVV0PfL
 /na5UGu+9jWfsJLE27D8A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:rQHcc4g8hC8=:AAy4aEqkn1m0W9xIIDySBU
 oh3Evqj4xbse6o61KfZlJjpfmCbdXi/IUkoHmfQ1Rv8a/xeGWBjXW6PDb4kZZ30UFuz4alRXU
 FNmdbIQI0ZdCzNliyM8ykBo++fxfFjRkJMrWF1uNh2/E+bQwwKzoZY2funCkntAx/WE8noVED
 datZfkE6SmuBDtf3j8iiZzDjBYasIqjrobqeOLe96mno6Jf7dcU4bmzHYp7IQPN0j7nLHL7i9
 41+BrxhqK6GfVHP28S+vMw5JCRN2xc3rOQzrYZlLs+AfLDYqqCTTtoKSlHbtn+xHhZJbznu0M
 JGT9Xe/eUDYaqW3ETycs9m2VcIXIrdIyOXdS19CUYcAPDsyNhYqlHM5055tXb6A3pRaHcRHWW
 zS9ceVypNhvPaBJs+Hotc9FM0JSapYnSl1rHpbZIBzrracNUmEtsqzOqXZxDz7Xf+rpgarLS7
 dX09UdQLL96dM9zj2dl6LPwXe00WWcYMVvxS3lEHQD63rh3CaW537dGxE1En1waseKp4okXz/
 Ula4r5ISnjzlsB2t97+XGdbHq1nK2KcTFR+XNM+AycurOsQptl/mqJOw2Fd7TzwqH5pGLqDKV
 PlCSzaEEYI8Rirz+EZSDxD3rJyLZkNALUYKePiVdVF1ZHvky9PLL362CMBo72RpDJ5Fr81pQG
 3aPbhV3LNsh2Crmh6VArK7iLVyNWhB3zum62eNr4+4OC5cpy/tmtkxcPnzPhpuuPsaX8PnmqR
 /eMlUO6NhvH7sSM3xlxCKLAuiiC/qBT1gP7QETXvzkr/p3+RDic3bbyM4yBZpMCCNLLRonuSh
 f6DXaF6xwXZwFa1HeFg6hwzOmXpMKemml7vWehVlv/P9LZFlbq4O9ABQLEcoVjGymzS8EdL3Q
 lwLjn2yRHeIiiYfuWfPiQc8FW1pR6Y01yivUlm+0tRpFhxF8Eemm/WjlHFUcjisspAvdrDHBD
 klSGgb6XbBibS9FotkMUpBB0QyuwJ4gCdjlS6bPlqQjWQp4aODB6qa8Q+g+OGJ5Mo1REeu7rq
 qugNDIHRdNRtdtfE8uGDvNBJzZVOfrmhHbF19JOnUZ21BxpXBY9iRx1yeBeiVJA1Hmb4Wrizw
 79+xRaH+Zb0x5c=
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dave Stevenson <dave.stevenson@raspberrypi.org>

Fixes a v4l2-compliance failure
v4l2-test-buffers.cpp(415): g_field() =3D=3D V4L2_FIELD_ANY

The driver only ever produces progresive frames, so field should
always be set to V4L2_FIELD_NONE.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
=2D--
 drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c=
 b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
index 705644c..78d5bca 100644
=2D-- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
@@ -420,6 +420,7 @@ static void buffer_cb(struct vchiq_mmal_instance *inst=
ance,
 	}
 	dev->capture.last_timestamp =3D buf->vb.vb2_buf.timestamp;
 	buf->vb.sequence =3D dev->capture.sequence++;
+	buf->vb.field =3D V4L2_FIELD_NONE;

 	vb2_set_plane_payload(&buf->vb.vb2_buf, 0, length);
 	if (mmal_flags & MMAL_BUFFER_HEADER_FLAG_KEYFRAME)
=2D-
2.7.4

