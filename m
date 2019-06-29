Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9690F5AAAC
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2019 14:14:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727034AbfF2MOd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Jun 2019 08:14:33 -0400
Received: from mout.gmx.net ([212.227.17.21]:48035 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727015AbfF2MOc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Jun 2019 08:14:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1561810446;
        bh=uI34PuI3UJ0Vj23e0pDBUSO4cLN7Oo++ZU6cixLGgXw=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=SjIitINHyMg6SZR64Skt58IF/o6+kV2ls+Cv950gThHPA1jbALXeS9f7tLGRQA2jx
         pWqMIfspO6jvW7HC9h+xsVkrQ9lc258u4OnI9DK4wYM6pEgiDqW9hEZVJy9eVV/u/c
         9tvkT90fTNO/BTz9ff4JTuJlJShWSaKU6vcl9Qkg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.111]) by mail.gmx.com
 (mrgmx103 [212.227.17.168]) with ESMTPSA (Nemesis) id
 0MHXd2-1hiIhW0fMK-003JgE; Sat, 29 Jun 2019 14:14:06 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devel@driverdev.osuosl.org,
        linux-media@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 04/29] staging: bcm2835-camera: Correctly denote key frames in encoded data
Date:   Sat, 29 Jun 2019 14:13:19 +0200
Message-Id: <1561810410-8829-5-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561810410-8829-1-git-send-email-wahrenst@gmx.net>
References: <1561810410-8829-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:vR8+uZhLA2j/tuReY3aykspH3dP08vrGsexgtNEW51mDQw81J8K
 +IrnB6W3LJVdLHToFBbZQGVW8m5mJ9Ooepo0XlWWwdQPZrpUkyha1IFm4eO6yuArbLD7bdr
 NPXP8yVpBopUwHmX68UjmGCS5kjRecqLDbZf6lBXEWLI6UIVPqjtMghk4nJ/PWAb0mbTnVy
 fuq/uFP/xnPqevb2YzTQg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:KSLK4Th0A+Y=:QE+5OUbIelXXaeaU5XjFx1
 a2lPLeh3S9Kot13XHCNMsNaQTPhsreUM4vFTyFQUlqwQieSGRlNYNdO4hHsJ5j3NxOfrdlFIk
 phhet2buIn/k2WtbT52sJSIxz5D3K5yVQEm4BDSP5eLEh+JyEGvs4EIHJs83K4ELMKhOuZXWP
 e2pSKmfPTh1d9PvDRkvla/uYkXz/fpVVo1fPfXFgJl6kxkgGOk7def7U6oLb954V02SG+EO8Y
 /4Bz3NoZB+gaIHGetKtEwaXpsvxp7qQWp+5uQMMOPj4GgZoJSWzP1cVzxgE5tmkkz5NEFRhnc
 I0TKRJwB7YSSLTWrfAQJntgDFxyWnlpwLobj6icVqw7PLCRhtbcTOhJHbrKc5ZpUckdH3Kzed
 tefOvi5aRoZ2OIKdWnPUhxr4SL5FEUaoNLvFrimPCRl7nASm3/41bcc3p58fB8M3zMTBQ0BWL
 9AaTDauOAp7boPYfzXGU5yaAcV/5eW9rU++pDYi+gAYu2JP9u0hyjOPhpGnsvLXs9GwtmmreC
 osbWIY0TofRJDSuhuuHCRsyIhpm+jT4AiIjS6+Vd1bCVOq5+3mroi5IMGBH18+rzsUQqEVcXs
 jFnM6/vpGckEFUVeIGmetGSIBc/Xbg5CGyM3wJg4Xg+DjBkqcIA3/QGtlJ/iDOWYFjS0IZ9G5
 6sLhkydfYxm/HNTrCeBwSjpOYg8wzySwqzc6zhBoSD4g7rJcTeSCfg0ubV4P1kpuPHnHDfLyN
 uVZo4NaTqoYGiAPTLEcNUTI0zyP+sq1SUbXIcEAizrwn6q+7htpIOPavZ2JtHjtTh5teOCmV9
 X3NYMGXcn6YKcg3lSufotEpO6f19zUeggN5GX9ukSjZEA28ff5eETh5vh6usTiaj4B3LhG7v8
 TAFFuXCxsh+VGb7ee/uEXSyMOdBitjlCBDlCSwOhvmy4juu+lzivY4UNpzubBlQUV7tEpDmGk
 OEDQpx8K5grJGUWeilm6TZbWUfqm5p/CKnfzurGVIOvFlpy/GO+4EYrOEEbbDuUAYcwzS2mEk
 rrnTg2A1Knq0971l8AgDoxHnIBv+1/gCnjM9BzC4lPryKStXv3bU9mlc/wfumPanuOPwNmIuS
 LU5EfWL+hZpHVY=
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dave Stevenson <dave.stevenson@raspberrypi.org>

Forward MMAL key frame flags to the V4L2 buffers.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Acked-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
=2D--
 drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c=
 b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
index dce6e6d..e81d4df 100644
=2D-- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
@@ -376,6 +376,9 @@ static void buffer_cb(struct vchiq_mmal_instance *inst=
ance,
 			}

 			vb2_set_plane_payload(&buf->vb.vb2_buf, 0, length);
+			if (mmal_flags & MMAL_BUFFER_HEADER_FLAG_KEYFRAME)
+				buf->vb.flags |=3D V4L2_BUF_FLAG_KEYFRAME;
+
 			vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);

 			if (mmal_flags & MMAL_BUFFER_HEADER_FLAG_EOS &&
=2D-
2.7.4

