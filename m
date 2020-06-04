Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1892C1EEAAB
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 20:55:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729151AbgFDSzW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 14:55:22 -0400
Received: from mailoutvs43.siol.net ([185.57.226.234]:52691 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728476AbgFDSzV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jun 2020 14:55:21 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 35193521138;
        Thu,  4 Jun 2020 20:55:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta10.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta10.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id XznPkMjjbkV1; Thu,  4 Jun 2020 20:55:17 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id D034552118B;
        Thu,  4 Jun 2020 20:55:17 +0200 (CEST)
Received: from kista.localdomain (cpe-194-152-20-232.static.triera.net [194.152.20.232])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id 82AC452123C;
        Thu,  4 Jun 2020 20:55:15 +0200 (CEST)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     paul.kocialkowski@bootlin.com, mripard@kernel.org
Cc:     mchehab@kernel.org, wens@csie.org, hverkuil-cisco@xs4all.nl,
        gregkh@linuxfoundation.org, jonas@kwiboo.se, nicolas@ndufresne.ca,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/3] media: cedrus: h264: Properly configure reference field
Date:   Thu,  4 Jun 2020 20:57:44 +0200
Message-Id: <20200604185745.23568-3-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200604185745.23568-1-jernej.skrabec@siol.net>
References: <20200604185745.23568-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When interlaced H264 content is being decoded, references must indicate
which field is being referenced. Currently this was done by checking
capture buffer flags. However, that is not correct because capture
buffer may hold both fields.

Fix this by checking newly introduced flags in reference lists.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/s=
taging/media/sunxi/cedrus/cedrus_h264.c
index cce527bbdf86..c87717d17ec5 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
@@ -183,7 +183,6 @@ static void _cedrus_write_ref_list(struct cedrus_ctx =
*ctx,
 	for (i =3D 0; i < num_ref; i++) {
 		const struct v4l2_h264_dpb_entry *dpb;
 		const struct cedrus_buffer *cedrus_buf;
-		const struct vb2_v4l2_buffer *ref_buf;
 		unsigned int position;
 		int buf_idx;
 		u8 dpb_idx;
@@ -198,12 +197,11 @@ static void _cedrus_write_ref_list(struct cedrus_ct=
x *ctx,
 		if (buf_idx < 0)
 			continue;
=20
-		ref_buf =3D to_vb2_v4l2_buffer(cap_q->bufs[buf_idx]);
-		cedrus_buf =3D vb2_v4l2_to_cedrus_buffer(ref_buf);
+		cedrus_buf =3D vb2_to_cedrus_buffer(cap_q->bufs[buf_idx]);
 		position =3D cedrus_buf->codec.h264.position;
=20
 		sram_array[i] |=3D position << 1;
-		if (ref_buf->field =3D=3D V4L2_FIELD_BOTTOM)
+		if (ref_list[i].flags & V4L2_H264_REFERENCE_FLAG_BOTTOM_FIELD)
 			sram_array[i] |=3D BIT(0);
 	}
=20
--=20
2.27.0

