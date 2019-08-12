Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78ADC89C53
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2019 13:06:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728164AbfHLLGY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Aug 2019 07:06:24 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:42931 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728064AbfHLLGY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Aug 2019 07:06:24 -0400
Received: from tschai.fritz.box ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id x89ahQBOrur8Tx89ehi1BA; Mon, 12 Aug 2019 13:06:22 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Maxime Jourdan <mjourdan@baylibre.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2 06/12] media: vicodec: set flags for vdec/stateful OUTPUT coded formats
Date:   Mon, 12 Aug 2019 13:05:07 +0200
Message-Id: <20190812110513.23774-7-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190812110513.23774-1-hverkuil-cisco@xs4all.nl>
References: <20190812110513.23774-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfPu23OXeS15F2EkCTq1OrLKNd/gcIGjdDbmTFq0LSO4sDjpPv0IE0hhOdx/TS34PPlhAMB2HAZmnqGgQOm5NvkJQf0SdVrhWjB/2q7cIbc+9nScNI+SL
 fDx9K8qV4aWOcdImMkyl8GtkCzop59FXww7IZO0YZY2ZPEKPLMb6IDClrVzU+/5HlVZGtFQQ22i4x+OyhG6MpxNZ1b+GS0uJnXetE4F6RVDG7VWe2oKQvEfv
 5MZ0Qv6+v8Kw+UDOva25L03A3fR4L8C0MRlIdFyFWpB1W7eLSE6C8dWSMicsXgBF
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Maxime Jourdan <mjourdan@baylibre.com>

Tag all the coded formats where the vicodec stateful decoder supports
dynamic resolution switching and bytestream parsing.

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
[hverkuil-cisco@xs4all.nl: added CONTINUOUS_BYTESTREAM]
---
 drivers/media/platform/vicodec/vicodec-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/vicodec/vicodec-core.c b/drivers/media/platform/vicodec/vicodec-core.c
index 7e7c1e80f29f..5152f44bcc0a 100644
--- a/drivers/media/platform/vicodec/vicodec-core.c
+++ b/drivers/media/platform/vicodec/vicodec-core.c
@@ -742,6 +742,9 @@ static int enum_fmt(struct v4l2_fmtdesc *f, struct vicodec_ctx *ctx,
 			return -EINVAL;
 		f->pixelformat = ctx->is_stateless ?
 			V4L2_PIX_FMT_FWHT_STATELESS : V4L2_PIX_FMT_FWHT;
+		if (!ctx->is_enc && !ctx->is_stateless)
+			f->flags = V4L2_FMT_FLAG_DYN_RESOLUTION |
+				   V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM;
 	}
 	return 0;
 }
-- 
2.20.1

