Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3808C1BE74
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2019 22:14:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726325AbfEMUOK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 May 2019 16:14:10 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:41526 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbfEMUOJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 May 2019 16:14:09 -0400
Received: from localhost.localdomain (unknown [IPv6:2a02:c7f:1887:5d00:8d7a:f2f4:69ff:77c4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0F0009C2;
        Mon, 13 May 2019 22:14:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1557778446;
        bh=sm0cNdym4g0tH1VcpDV97bQ80rs75je3AI3MNFGjvG8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Xgz2Z3/mCdP6ZAYqFW5Zy9s5I9c+vIERi7w0LO+kmtOPoEa89jgX27ncPfHSuU0+A
         4Zd6C31baNUAEJlUnTQZhxdUOQPDljOoCGSYmd4FlT2K7yR78cxY0ag931GBrd80FI
         x1FxEhyviJSvruW1EvfLhFuIAv3lL51vIwstcCok=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v4 2/4] media: vsp1: Document partition algorithm in code header
Date:   Mon, 13 May 2019 21:13:53 +0100
Message-Id: <20190513201355.994-3-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190513201355.994-1-kieran.bingham+renesas@ideasonboard.com>
References: <20190513201355.994-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The image partition algorithm operates on the image dimensions as input
into the WPF entity. Document this in the code block header.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/media/platform/vsp1/vsp1_video.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/platform/vsp1/vsp1_video.c b/drivers/media/platform/vsp1/vsp1_video.c
index ee2fb8261a6a..9bb8a24870bd 100644
--- a/drivers/media/platform/vsp1/vsp1_video.c
+++ b/drivers/media/platform/vsp1/vsp1_video.c
@@ -173,6 +173,14 @@ static int __vsp1_video_try_format(struct vsp1_video *video,
 
 /* -----------------------------------------------------------------------------
  * VSP1 Partition Algorithm support
+ *
+ * VSP hardware can have restrictions on image width depending on the hardware
+ * configuration of the pipeline. Adapting for these restrictions is implemented
+ * via the partition algorithm.
+ *
+ * The partition windows and sizes are based on the output size of the WPF
+ * before rotation, which is represented by the input parameters to the WPF
+ * entity in our pipeline.
  */
 
 /**
-- 
2.20.1

