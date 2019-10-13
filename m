Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A313D5794
	for <lists+linux-media@lfdr.de>; Sun, 13 Oct 2019 21:09:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729489AbfJMTJF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Oct 2019 15:09:05 -0400
Received: from mga07.intel.com ([134.134.136.100]:10072 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729485AbfJMTJF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Oct 2019 15:09:05 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Oct 2019 12:09:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,293,1566889200"; 
   d="scan'208";a="198105089"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 13 Oct 2019 12:09:01 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1iJjEj-000BUd-7y; Mon, 14 Oct 2019 03:09:01 +0800
Date:   Mon, 14 Oct 2019 03:08:22 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     kbuild-all@lists.01.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: [RFC PATCH] media: rockchip: rkvdec_queue_ops can be static
Message-ID: <20191013190822.klfeelozbfx6qrnz@332d0cec05f4>
References: <20191011093342.3471-4-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191011093342.3471-4-boris.brezillon@collabora.com>
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Fixes: 0fb0ad38c9ed ("media: rockchip: Add the rkvdec driver")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 rkvdec-h264.c |    6 +++---
 rkvdec.c      |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/rockchip/vdec/rkvdec-h264.c b/drivers/staging/media/rockchip/vdec/rkvdec-h264.c
index d241afe12edd6..2d62ab739dbc8 100644
--- a/drivers/staging/media/rockchip/vdec/rkvdec-h264.c
+++ b/drivers/staging/media/rockchip/vdec/rkvdec-h264.c
@@ -695,9 +695,9 @@ static u32 poc_reg_tbl_bottom_field[16] = {
 	RKVDEC_REG_H264_POC_REFER2(1)
 };
 
-struct vb2_buffer *get_ref_buf(struct rkvdec_ctx *ctx,
-			       struct rkvdec_h264_run *run,
-			       unsigned int dpb_idx)
+static struct vb2_buffer *get_ref_buf(struct rkvdec_ctx *ctx,
+				      struct rkvdec_h264_run *run,
+				      unsigned int dpb_idx)
 {
 	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
 	const struct v4l2_h264_dpb_entry *dpb = run->decode_params->dpb;
diff --git a/drivers/staging/media/rockchip/vdec/rkvdec.c b/drivers/staging/media/rockchip/vdec/rkvdec.c
index 3531ce0dd3e72..5f07d589e4f9c 100644
--- a/drivers/staging/media/rockchip/vdec/rkvdec.c
+++ b/drivers/staging/media/rockchip/vdec/rkvdec.c
@@ -495,7 +495,7 @@ static void rkvdec_stop_streaming(struct vb2_queue *q)
 	rkvdec_queue_cleanup(q, VB2_BUF_STATE_ERROR);
 }
 
-const struct vb2_ops rkvdec_queue_ops = {
+static const struct vb2_ops rkvdec_queue_ops = {
 	.queue_setup = rkvdec_queue_setup,
 	.buf_prepare = rkvdec_buf_prepare,
 	.buf_queue = rkvdec_buf_queue,
