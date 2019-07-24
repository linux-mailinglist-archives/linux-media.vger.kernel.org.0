Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46AE472CD6
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2019 13:05:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727395AbfGXLFf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jul 2019 07:05:35 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:38053 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726981AbfGXLFd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jul 2019 07:05:33 -0400
Received: from tschai.fritz.box ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id qF5Hh3g5kLqASqF5PhNE12; Wed, 24 Jul 2019 13:05:31 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Maxime Jourdan <mjourdan@baylibre.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 04/14] videodev2.h.rst.exceptions: tymecode -> timecode
Date:   Wed, 24 Jul 2019 13:05:13 +0200
Message-Id: <20190724110523.29248-5-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190724110523.29248-1-hverkuil-cisco@xs4all.nl>
References: <20190724110523.29248-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfDWNqzozb7735fkXzFIeUf2gXRZ4mwIu3+HpjdRxnIgHHeTN7TK+uGlzxWe2baeL5wNlQJey/1HLsJb9hMfd4iCtiUehuy5btcaLmdzmRld/R1CMLCtX
 ElomWhoZ7YtP3NJODJpVAXSo/0QqtAGsH+i8wH+3XMQ7aig+GE4+LM6dR8tCX+Q7k9a4xVNAXhHS92eqnu+Gx5tp/2XEd7yzpnc+OV4nXJZT2cJ43JU28CeX
 IFM2sHN1wbfuiIK3szk/JlX16pmsgXEVVCdSnMgtOM9DR6mjx7wFTkr5kmLPc7W5SJcpCRrQ7rHiSRMEJyju55vR1cZruWYYJB+HB7z8tOEzj2bq8vKlffnR
 0k63f34YzhWHVtKMtsFJ1ctCEKBfvG+083N+ukwXnU8X4VtLofw543fytta0LzJgDQV83lahHP8nogjPkm2Vfk2vFHLA1WP9g6G+8nGyjV91W4yPioY14fEV
 BA3C65zptOaLYxo6//5diW4K/8hNpLJpjOcS++gz8CI8K3E9z1xQyI+3B1z7RaoLF0KG7gMTcuj+ZVKaEN5cwpg8ROBzZt+eMdwRU30wm7ZLVdmZjyI1lPbM
 5RaaLuxTfOzQgR9kjTG+nzoFmGMhPtMRM0hU1h/WGdGeUA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix typo.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 Documentation/media/videodev2.h.rst.exceptions | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/media/videodev2.h.rst.exceptions b/Documentation/media/videodev2.h.rst.exceptions
index 0a9a1b386443..b6cb9fa6c8a8 100644
--- a/Documentation/media/videodev2.h.rst.exceptions
+++ b/Documentation/media/videodev2.h.rst.exceptions
@@ -183,14 +183,14 @@ replace define V4L2_FMT_FLAG_EMULATED fmtdesc-flags
 replace define V4L2_FMT_FLAG_HAS_BITSTREAM_PARSER fmtdesc-flags
 replace define V4L2_FMT_FLAG_DYN_RESOLUTION fmtdesc-flags
 
-# V4L2 tymecode types
+# V4L2 timecode types
 replace define V4L2_TC_TYPE_24FPS timecode-type
 replace define V4L2_TC_TYPE_25FPS timecode-type
 replace define V4L2_TC_TYPE_30FPS timecode-type
 replace define V4L2_TC_TYPE_50FPS timecode-type
 replace define V4L2_TC_TYPE_60FPS timecode-type
 
-# V4L2 tymecode flags
+# V4L2 timecode flags
 replace define V4L2_TC_FLAG_DROPFRAME timecode-flags
 replace define V4L2_TC_FLAG_COLORFRAME timecode-flags
 replace define V4L2_TC_USERBITS_field timecode-flags
-- 
2.20.1

