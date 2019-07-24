Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3316172D8D
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2019 13:28:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727487AbfGXL21 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jul 2019 07:28:27 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:39709 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727378AbfGXL20 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jul 2019 07:28:26 -0400
Received: from tschai.fritz.box ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id qFRUh3sccLqASqFRYhNLFk; Wed, 24 Jul 2019 13:28:25 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Maxime Jourdan <mjourdan@baylibre.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 08/14] media: vicodec: set flags for vdec/stateful OUTPUT coded formats
Date:   Wed, 24 Jul 2019 13:27:10 +0200
Message-Id: <20190724112716.30288-9-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190724112716.30288-1-hverkuil-cisco@xs4all.nl>
References: <20190724112716.30288-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfOKQTTMBrUPKA8AdqF0tnAbekXx9V31HQbHfRDfygivRoEqNkTH1Qa70J4PNO9IYkGW9KhiT+TEhK1cn1GFfR7i8mqEsP/Jm+Md4HeJsvps30OGeSWkZ
 M40Yv+1pNp/1Jl8/SluAMou7K569DaODns70baEmNBPGPS8fXSAtZ17T77/XSOqpiUpwbNq63KTbhGcdj79lXU5K2LOSAKJpO/DPZM0bmwp9JQfb7j+ybLAh
 W3+gCnzobIyd6a2W6d0ZPA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Maxime Jourdan <mjourdan@baylibre.com>

Tag all the coded formats where the vicodec stateful decoder supports
dynamic resolution switching and bitstream parsing.

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
[hverkuil-cisco@xs4all.nl: added HAS_BITSTREAM_PARSER]
---
 drivers/media/platform/vicodec/vicodec-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/vicodec/vicodec-core.c b/drivers/media/platform/vicodec/vicodec-core.c
index 7e7c1e80f29f..968f73eebeac 100644
--- a/drivers/media/platform/vicodec/vicodec-core.c
+++ b/drivers/media/platform/vicodec/vicodec-core.c
@@ -742,6 +742,9 @@ static int enum_fmt(struct v4l2_fmtdesc *f, struct vicodec_ctx *ctx,
 			return -EINVAL;
 		f->pixelformat = ctx->is_stateless ?
 			V4L2_PIX_FMT_FWHT_STATELESS : V4L2_PIX_FMT_FWHT;
+		if (!ctx->is_enc && !ctx->is_stateless)
+			f->flags = V4L2_FMT_FLAG_DYN_RESOLUTION |
+				   V4L2_FMT_FLAG_HAS_BITSTREAM_PARSER;
 	}
 	return 0;
 }
-- 
2.20.1

