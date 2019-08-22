Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 182C79A05D
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2019 21:45:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392221AbfHVTpY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Aug 2019 15:45:24 -0400
Received: from mailoutvs34.siol.net ([185.57.226.225]:56183 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2392210AbfHVTpY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Aug 2019 15:45:24 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id ED4575249F6;
        Thu, 22 Aug 2019 21:45:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id DGqiOdmioE3P; Thu, 22 Aug 2019 21:45:21 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 9FFBB5249EB;
        Thu, 22 Aug 2019 21:45:21 +0200 (CEST)
Received: from localhost.localdomain (cpe-86-58-59-25.static.triera.net [86.58.59.25])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id 3B5BF5249F6;
        Thu, 22 Aug 2019 21:45:19 +0200 (CEST)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        paul.kocialkowski@bootlin.com, mripard@kernel.org
Cc:     pawel@osciak.com, m.szyprowski@samsung.com,
        kyungmin.park@samsung.com, tfiga@chromium.org, wens@csie.org,
        acourbot@chromium.org, gregkh@linuxfoundation.org,
        jernej.skrabec@siol.net, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, ezequiel@collabora.com,
        jonas@kwiboo.se
Subject: [PATCH 5/8] media: cedrus: Detect first slice of a frame
Date:   Thu, 22 Aug 2019 21:44:57 +0200
Message-Id: <20190822194500.2071-6-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20190822194500.2071-1-jernej.skrabec@siol.net>
References: <20190822194500.2071-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When codec supports multiple slices in one frame, VPU has to know when
first slice of each frame is being processed, presumably to correctly
clear/set data in auxiliary buffers.

Add first_slice field to cedrus_run structure and set it according to
timestamps of capture and output buffers. If timestamps are different,
it's first slice and viceversa.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/staging/media/sunxi/cedrus/cedrus.h     | 1 +
 drivers/staging/media/sunxi/cedrus/cedrus_dec.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/stagin=
g/media/sunxi/cedrus/cedrus.h
index 2f017a651848..32cb38e541c6 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -70,6 +70,7 @@ struct cedrus_mpeg2_run {
 struct cedrus_run {
 	struct vb2_v4l2_buffer	*src;
 	struct vb2_v4l2_buffer	*dst;
+	bool first_slice;
=20
 	union {
 		struct cedrus_h264_run	h264;
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c b/drivers/st=
aging/media/sunxi/cedrus/cedrus_dec.c
index 56ca4c9ad01c..d7b54accfe83 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
@@ -31,6 +31,8 @@ void cedrus_device_run(void *priv)
=20
 	run.src =3D v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
 	run.dst =3D v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
+	run.first_slice =3D
+		run.src->vb2_buf.timestamp !=3D run.dst->vb2_buf.timestamp;
=20
 	/* Apply request(s) controls if needed. */
 	src_req =3D run.src->vb2_buf.req_obj.req;
--=20
2.22.1

