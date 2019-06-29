Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF8295AD17
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2019 21:33:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726996AbfF2TdC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Jun 2019 15:33:02 -0400
Received: from mout.gmx.net ([212.227.15.19]:43191 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726913AbfF2TdC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Jun 2019 15:33:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1561836763;
        bh=zM+3HVUOU7axycZk2m6O4/q65gGOHHHUn7GEz8V5JCE=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=BlG7aSlG1zrMbeZbB4z/5cVTRhToCwcVyUJVekuQYLhk4RPqWoxpjhOFEV7hIerrk
         VWDxQQk7lQvAr+ajhSWNVOFZIqUWSXX6+UTKx3/AIOmGxe7hbR5guIzc+gMMCi6cDj
         cDF8GujlaPH7Tmwm2OzS9h1Vwmx6yCUVPJTpJwTg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.111]) by mail.gmx.com
 (mrgmx003 [212.227.17.190]) with ESMTPSA (Nemesis) id
 0M8ehf-1iSnMm0i0Z-00wCUO; Sat, 29 Jun 2019 21:32:43 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devel@driverdev.osuosl.org,
        linux-media@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 28/29] staging: bcm2835-camera: Set the field value within each buffer
Date:   Sat, 29 Jun 2019 21:31:42 +0200
Message-Id: <1561836703-2528-4-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561836703-2528-1-git-send-email-wahrenst@gmx.net>
References: <1561836703-2528-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:t7r6ePgTJYKgQBXCyGGec452vrCZX+OEPLiqr/kONdcqUHDM1fX
 88fDGseAFHq3+AqTkexP08kd0jMdbwYwmDYo6mjqjXFVrVP6aL6PHhlRclbTwkp3hCjLpC5
 VpUxpgUSJH7IBDe8GpDn+a84WsH0/WuYKXhYad/Kpq1aZPV8qj4fJMFnTMVYWCM9mbDn8N7
 HXAwV5tBRCW29nsdgk3kw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:g0lNzahIomE=:bMs9Ruj4BrOptRA2+kNd9d
 5GWRTt0RbfOpO4g3vXZKT//2wfTIXMP26DmgFQ2sRz5QJYIZ7mVraxLU+wPc5CyWg4NBprG2O
 OK3HsUdiN6kdp4jTB5LMzndkmY6hOY6VPqaqqcvbqFpzISvZGqkR1GBwJvBRKC36O6ur1iUud
 U2mA6B+OCPALw3NYFuriCa8m+MxO8UHxRsD4X0R6mnzrTxV0j0Wq5XTJQqy897prL6hFA0pLs
 34LpEM7QQJma5MPUeZMlggX0euF8g1eGM5N4aNw/hLEoHvMQKejfftpW+FzE5CeYC2XtI514A
 ScFXHa7tp7HxstlRYixWLrBCACRzlu+C7oXPl0tpvnLq6Hx7kmTYPZUqUI8h6869r03Jok7Xs
 4UtD8uh89v6rTOd2EktWDQQw0xkhGVbUMoUF0RzKI4OGBOEK5BcPxUIOjVvWiW8W9jRhytE+S
 lj/VyUHCgsdgUEzpy38QVyK051y9Sas/q03UZ0ihkKgMFjh8U56V3s5jRD7GZIVxEzJ8FkzV8
 dErHSy2smmln0po6A4GlCdgvPoAmwNnRnOi/QNipVNMnauR5CQwuERinjwi6eny+OoggxkBBE
 DX/KL50ysrY5+fRLs1gSLoyMHLSnCxFuwH5AnPkus2CL57CEfqFH2dAjQeEQOTGxcG7eGyi9S
 h+E1AoSe4EyxX3PUKCcBH/cvxyAfnFUqzf2DXztCYyK4boc00mWoAavTzM4q8kaVlPkkKxooH
 eNNVOQlJ3QS35DdSna45GxiIiguIZ9vtuMZjpBsTZFz9eXq4y1IA2g1d3V5Z7gB5Fi0TcjjwL
 G35yAlP7jG+X8aA72j3i17Qp7tqZo/VksWCE7uZZkXnlHcsJpFQYW+RZNBsZZVpuktn4Sh6V3
 QRN/9TaAcItbSGhyO8VZPckE0xSopaHAQxu5PThiBrEh0Zi4qIQFHoKmEBoxufQAviCdrp6GB
 9z3jN88Ir5IDKUmh+adV2+B2127QmXeBAfzCObmdAyZbgR53PXLExSulCYkVaqJnHoJogVB0c
 DxsVbTj/lQR0ZnYzVKkm+pdxtknmgKjb8HhJW3keLiVH2SmsXvFFHhMGlWDtiRrjQVBkB0mgb
 kt1ZJYPS0CJ14M=
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
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Acked-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
=2D--
 drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c=
 b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
index 9c90d9b..ea54cc2 100644
=2D-- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
@@ -405,6 +405,7 @@ static void buffer_cb(struct vchiq_mmal_instance *inst=
ance,
 		buf->vb.vb2_buf.timestamp =3D ktime_get_ns();
 	}
 	buf->vb.sequence =3D dev->capture.sequence++;
+	buf->vb.field =3D V4L2_FIELD_NONE;

 	vb2_set_plane_payload(&buf->vb.vb2_buf, 0, length);
 	if (mmal_flags & MMAL_BUFFER_HEADER_FLAG_KEYFRAME)
=2D-
2.7.4

