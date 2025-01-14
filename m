Return-Path: <linux-media+bounces-24734-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB69A11165
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2025 20:48:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E0B53A76C2
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2025 19:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AC9720E6E7;
	Tue, 14 Jan 2025 19:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p9D+xOh5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8B020C49E
	for <linux-media@vger.kernel.org>; Tue, 14 Jan 2025 19:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736884007; cv=none; b=TPsADE7XFOMSVebNds9hQvNlZuAg/dPB3sDHElHbOkstn8XBnBUdlnbabwCFFdLMcB+O31ycGJNP7VMwF++Ub7EOAgNA3/060jRYidgB3hMiItBjEv8fVFEkvGb8LeZFAjuPuhuzzDeS0MaKQZdxBtGCPARNzdK7zQWcU9x2oRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736884007; c=relaxed/simple;
	bh=480j+MHZAugg7Y5+zl78Q0vJCjVjz+/xf8ocMQtjZNs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZyL+18OPG+1z+hQXzGeDTsrmgfH4PJJELiFFSjGW39Itbsc6r9FZO9fpiFVoL94yIHOf75rcFOBE09nPyAxkzeYt8uODlkYWKwZpM5z+JG38KfkJuoF1rKc05275kMduKRdknjh1J4qkvlUl4i0TwKSxcyJgSPrc+2wAVXrhKEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p9D+xOh5; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-385e0d47720so436830f8f.0
        for <linux-media@vger.kernel.org>; Tue, 14 Jan 2025 11:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736884004; x=1737488804; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QKxFhfTb4yo1YxqMn8taGRsFCw+s7rIE5P4nCcJaV/s=;
        b=p9D+xOh5fiCp/awCwd/TlQSMpM8hIZdRhf6+u2eUjKyqj72wSxwKLFSb2h3N/bMt1k
         KQ2XLtZeiuopLBjbtX4JX02D8/nU2PvDCMyqrk2ONnN9mir4WmJSrvSikOMSz2CDxK50
         WzVrFjeKQmKD/Z+H24u+JIvK9PR14neuug113lWI4dRw2YFlpJpWo4PreR9tOYl/8NGJ
         4V7v19YUr0+wWyUxrJBxXgSqe+vaqj0oYKU2HeF+ojbYXlhFalwFsS/sMpOtLRI3vMWD
         xLwkgqXS/apD2gFMo7Zjy9g6G2BvlOQuO+01yWdisyLv/k0wXqFanZ3yH7WyFOiINust
         eXtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736884004; x=1737488804;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QKxFhfTb4yo1YxqMn8taGRsFCw+s7rIE5P4nCcJaV/s=;
        b=rx/YEMAyyYAsvGXc3cNLsP4nZGTfuOHUoB2cBRhfEBIYQ4qIGBEwVFs7x8HN5LFYzr
         jQTTnNx5dfGS43MRNgApsBRo0JiZlXPn3W2lUAuzcpJZcOySDn94C86zpkLfh79eOrB9
         xBv6Q0hGqwIDv+c4nHZQcB9scrN2IEGIc0X+g6xs58UzlxSK1xO8S2zMLq1EeDZvCKVP
         fHGbhmOHmBlEvtO5A/Als3DiIZ3VoWxARCSgX9bXQF/+XrOJ+Q/8lyn7OT7yJ4vRQMqV
         DPK/J/KLYSgjlTYwkrKAFBWVZNEVwlLGedSkJBjTOmmquEeU0Kcy7jtTBwUrfvFnLpo0
         t2Sg==
X-Gm-Message-State: AOJu0YwIDN5WvLZ3q8TIlIG1h/KBT/1LJZlWNxYVazENH0D4KhPdMmfa
	xGoSCws++IIFtuWbO1XvS8TeMzk7clgrtPh4e4BG4mf/P526LTqGsCkjuVzzYns=
X-Gm-Gg: ASbGncsoXLngRWlrO0nnt8U9kk7iyUtbltdWd8ihSW9eYxawbX7/z9tjlsZM4bBk3Nq
	fy5iISNvC8aSw8/jfoYOo1X89MZhMtZUJVDDMhz47tEwxDy0ALKMlId7N5QYOPxTFY2dCv6/JHN
	llaGVMuWymGFyNt+wPQX1bBmnr2DZyipnnibATDocQ3jjPg4P8URAgtC203U+2/Uv2hkr14Iam3
	IIJ+37SnSDasXtpSEmBbXwppCQKQCSZCrwE4zmQKIkHzSSEOj2xM//p0dgkj9OQl0Gt6cB+
X-Google-Smtp-Source: AGHT+IHIqPJR45ZJSofiCkjdiL+75NeCbiFkrzobmUhQ6+Goug5A0DldQrwST77JXwNbfHZhZKFFqA==
X-Received: by 2002:a05:600c:3b08:b0:42c:c0d8:bf49 with SMTP id 5b1f17b1804b1-436e2560720mr96529645e9.0.1736884003626;
        Tue, 14 Jan 2025 11:46:43 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9e37c2esm184337515e9.28.2025.01.14.11.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 11:46:42 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 14 Jan 2025 20:46:21 +0100
Subject: [PATCH 5/6] media: platform: Use str_enable_disable-like helpers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250114-str-enable-disable-media-v1-5-9316270aa65f@linaro.org>
References: <20250114-str-enable-disable-media-v1-0-9316270aa65f@linaro.org>
In-Reply-To: <20250114-str-enable-disable-media-v1-0-9316270aa65f@linaro.org>
To: Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Maxim Levitsky <maximlevitsky@gmail.com>, Sean Young <sean@mess.org>, 
 Olli Salonen <olli.salonen@iki.fi>, Abylay Ospan <aospan@amazon.com>, 
 Jemma Denson <jdenson@gmail.com>, 
 Patrick Boettcher <patrick.boettcher@posteo.de>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Tim Harvey <tharvey@gateworks.com>, Andy Walls <awalls@md.metrocast.net>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11675;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=480j+MHZAugg7Y5+zl78Q0vJCjVjz+/xf8ocMQtjZNs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnhr8TVLOLDoSwzOCF05fTFhUsAfhINRWcwUoRL
 QqE4tGn4WKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ4a/EwAKCRDBN2bmhouD
 1zBuEACYkrjaDpY2dKwB8LHyFzrGMOiPT2fOt6Ssapvan1y2YKzJFX487gbdEK5iYBeOZiHXIwP
 DDFEhlCLLa0JmLYIQMPFEC0GAxcLiXs9gZFp9z8jt/50Du0AxlX+7Ni5E9vPfG+9uGmFqYIM2DG
 G8lCTyunu/2/SJnQQvtjf+ojCurrqlR6VkbjakHBhqtbtvo+MilBLyJuognXQqbVwJa/j6iSkco
 H5nrY5aMKr8GwREBxvmCkz1Asn3PEktepExjQlvyTD6Q4oAR2ULMqqNkGr49HDv1yOjhzaCrblz
 DHU8xcnwTlU5Jdw4MpL7/bBWjgnCO8fLGFWIZPLj50wMTR9zHxGiepg09+FQyMXA8O6vTEVKEw/
 DgGX6BidEorNlbrzCFBSPkOxyBU1K9XrYr2Jw6QCrGtQB0+Xp5NRIqyu3LUZVeOps81G+f7L9dS
 HaZmkpseLX++JL2s913XyhMQJ0tMhG4WL3kZRuHcDTb2oIwCwcjyd2PDn5iRlUQSknRWiw+A0Sb
 JzPnFwTCu+hxgfNm5ZYFXvmuXp8JzqRdIfVnvCInGfzAtQmTOH4pdCQkLUCTaNaSBb2bCtdwdZu
 OtEPQRlBQyBa6bo51/Za+5OrtcgfSDnWF9lr30Q8rx8qk/LRDcJP0jICDa/slDgegYy69LjN9od
 cJnDXh8sQFcGZVQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Replace ternary (condition ? "enable" : "disable") syntax with helpers
from string_choices.h because:
1. Simple function call with one argument is easier to read.  Ternary
   operator has three arguments and with wrapping might lead to quite
   long code.
2. Is slightly shorter thus also easier to read.
3. It brings uniformity in the text - same string.
4. Allows deduping by the linker, which results in a smaller binary
   file.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/platform/amphion/venc.c              |  3 ++-
 drivers/media/platform/amphion/vpu_dbg.c           |  3 ++-
 drivers/media/platform/aspeed/aspeed-video.c       |  5 +++--
 drivers/media/platform/chips-media/coda/coda-bit.c |  3 ++-
 drivers/media/platform/chips-media/coda/imx-vdoa.c |  3 ++-
 drivers/media/platform/st/sti/hva/hva-debugfs.c    |  7 ++++---
 drivers/media/platform/ti/cal/cal-camerarx.c       |  3 ++-
 drivers/media/platform/ti/omap3isp/ispstat.c       |  3 ++-
 drivers/media/platform/xilinx/xilinx-csi2rxss.c    | 19 ++++++++++---------
 9 files changed, 29 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/amphion/venc.c b/drivers/media/platform/amphion/venc.c
index c5c1f1fbaa80366d5b18b8f24699eb9c3a18ef92..65b1665eece8cd6efc535281b3be593abaf9ba64 100644
--- a/drivers/media/platform/amphion/venc.c
+++ b/drivers/media/platform/amphion/venc.c
@@ -13,6 +13,7 @@
 #include <linux/videodev2.h>
 #include <linux/ktime.h>
 #include <linux/rational.h>
+#include <linux/string_choices.h>
 #include <linux/vmalloc.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-event.h>
@@ -1215,7 +1216,7 @@ static int venc_get_debug_info(struct vpu_inst *inst, char *str, u32 size, u32 i
 		break;
 	case 8:
 		num = scnprintf(str, size, "rc: %s, mode = %d, bitrate = %d(%d), qp = %d\n",
-				venc->params.rc_enable ? "enable" : "disable",
+				str_enable_disable(venc->params.rc_enable),
 				venc->params.rc_mode,
 				venc->params.bitrate,
 				venc->params.bitrate_max,
diff --git a/drivers/media/platform/amphion/vpu_dbg.c b/drivers/media/platform/amphion/vpu_dbg.c
index 940e5bda5fa391c47552c275bd1266f47d57f475..b726d884086d306cd4298dc46440a2235b311b86 100644
--- a/drivers/media/platform/amphion/vpu_dbg.c
+++ b/drivers/media/platform/amphion/vpu_dbg.c
@@ -11,6 +11,7 @@
 #include <linux/kernel.h>
 #include <linux/types.h>
 #include <linux/pm_runtime.h>
+#include <linux/string_choices.h>
 #include <media/v4l2-device.h>
 #include <linux/debugfs.h>
 #include "vpu.h"
@@ -256,7 +257,7 @@ static int vpu_dbg_core(struct seq_file *s, void *data)
 		return 0;
 
 	num = scnprintf(str, sizeof(str), "power %s\n",
-			vpu_iface_get_power_state(core) ? "on" : "off");
+			str_on_off(vpu_iface_get_power_state(core)));
 	if (seq_write(s, str, num))
 		return 0;
 	num = scnprintf(str, sizeof(str), "state = %d\n", core->state);
diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
index 54cae0da9aca3fd74800b51f79136a261aec241a..d9cf12af05b75c76c506f6e7d72dfc41c9e05317 100644
--- a/drivers/media/platform/aspeed/aspeed-video.c
+++ b/drivers/media/platform/aspeed/aspeed-video.c
@@ -19,6 +19,7 @@
 #include <linux/sched.h>
 #include <linux/spinlock.h>
 #include <linux/string.h>
+#include <linux/string_choices.h>
 #include <linux/v4l2-controls.h>
 #include <linux/videodev2.h>
 #include <linux/wait.h>
@@ -1227,7 +1228,7 @@ static void aspeed_video_update_regs(struct aspeed_video *video)
 	v4l2_dbg(1, debug, &video->v4l2_dev, "compression quality(%d)\n",
 		 video->jpeg_quality);
 	v4l2_dbg(1, debug, &video->v4l2_dev, "hq_mode(%s) hq_quality(%d)\n",
-		 video->hq_mode ? "on" : "off", video->jpeg_hq_quality);
+		 str_on_off(video->hq_mode), video->jpeg_hq_quality);
 
 	if (video->format == VIDEO_FMT_ASPEED)
 		aspeed_video_update(video, VE_BCD_CTRL, 0, VE_BCD_CTRL_EN_BCD);
@@ -1939,7 +1940,7 @@ static int aspeed_video_debugfs_show(struct seq_file *s, void *data)
 	seq_printf(s, "  %-20s:\t%d\n", "Quality", v->jpeg_quality);
 	if (v->format == VIDEO_FMT_ASPEED) {
 		seq_printf(s, "  %-20s:\t%s\n", "HQ Mode",
-			   v->hq_mode ? "on" : "off");
+			   str_on_off(v->hq_mode));
 		seq_printf(s, "  %-20s:\t%d\n", "HQ Quality",
 			   v->hq_mode ? v->jpeg_hq_quality : 0);
 	}
diff --git a/drivers/media/platform/chips-media/coda/coda-bit.c b/drivers/media/platform/chips-media/coda/coda-bit.c
index 84ded154adfe37147218d60278a1c1fac88ecadc..2cb0c04003da750f7108578e274da31778c3f2d2 100644
--- a/drivers/media/platform/chips-media/coda/coda-bit.c
+++ b/drivers/media/platform/chips-media/coda/coda-bit.c
@@ -16,6 +16,7 @@
 #include <linux/ratelimit.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/videodev2.h>
 
 #include <media/v4l2-common.h>
@@ -1881,7 +1882,7 @@ static int __coda_decoder_seq_init(struct coda_ctx *ctx)
 	lockdep_assert_held(&dev->coda_mutex);
 
 	coda_dbg(1, ctx, "Video Data Order Adapter: %s\n",
-		 ctx->use_vdoa ? "Enabled" : "Disabled");
+		 str_enabled_disabled(ctx->use_vdoa));
 
 	/* Start decoding */
 	q_data_src = get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT);
diff --git a/drivers/media/platform/chips-media/coda/imx-vdoa.c b/drivers/media/platform/chips-media/coda/imx-vdoa.c
index c3561fcecb98c7d3cd741c28afcb2a3854eaa0e7..abdff181d417788460b7f6230ea54789b242d436 100644
--- a/drivers/media/platform/chips-media/coda/imx-vdoa.c
+++ b/drivers/media/platform/chips-media/coda/imx-vdoa.c
@@ -15,6 +15,7 @@
 #include <linux/platform_device.h>
 #include <linux/videodev2.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 
 #include "imx-vdoa.h"
 
@@ -117,7 +118,7 @@ static irqreturn_t vdoa_irq_handler(int irq, void *data)
 	writel(val, vdoa->regs + VDOAIST);
 	if (val & VDOAIST_TERR) {
 		val = readl(vdoa->regs + VDOASR) & VDOASR_ERRW;
-		dev_err(vdoa->dev, "AXI %s error\n", val ? "write" : "read");
+		dev_err(vdoa->dev, "AXI %s error\n", str_write_read(val));
 	} else if (!(val & VDOAIST_EOT)) {
 		dev_warn(vdoa->dev, "Spurious interrupt\n");
 	}
diff --git a/drivers/media/platform/st/sti/hva/hva-debugfs.c b/drivers/media/platform/st/sti/hva/hva-debugfs.c
index a86a07b6fbc792fc06db2dbbb3934694136a7813..1cb5bca44939606f39911a41e5f464be888848c2 100644
--- a/drivers/media/platform/st/sti/hva/hva-debugfs.c
+++ b/drivers/media/platform/st/sti/hva/hva-debugfs.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/debugfs.h>
+#include <linux/string_choices.h>
 
 #include "hva.h"
 #include "hva-hw.h"
@@ -71,12 +72,12 @@ static void format_ctx(struct seq_file *s, struct hva_ctx *ctx)
 			      "  | |- SEI frame packing type=%s\n",
 			      v4l2_ctrl_get_menu(entropy)[ctrls->entropy_mode],
 			      ctrls->cpb_size,
-			      ctrls->dct8x8 ? "true" : "false",
+			      str_true_false(ctrls->dct8x8),
 			      ctrls->qpmin,
 			      ctrls->qpmax,
-			      ctrls->vui_sar ? "true" : "false",
+			      str_true_false(ctrls->vui_sar),
 			      v4l2_ctrl_get_menu(vui_sar)[ctrls->vui_sar_idc],
-			      ctrls->sei_fp ? "true" : "false",
+			      str_true_false(ctrls->sei_fp),
 			      v4l2_ctrl_get_menu(sei_fp)[ctrls->sei_fp_type]);
 	}
 
diff --git a/drivers/media/platform/ti/cal/cal-camerarx.c b/drivers/media/platform/ti/cal/cal-camerarx.c
index 42dfe08b765f6bbdb0ab8cca0f7d6d87f2ff18eb..a70814cbada82654e926b12bcde73300107aaa8a 100644
--- a/drivers/media/platform/ti/cal/cal-camerarx.c
+++ b/drivers/media/platform/ti/cal/cal-camerarx.c
@@ -17,6 +17,7 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-fwnode.h>
@@ -191,7 +192,7 @@ static void cal_camerarx_power(struct cal_camerarx *phy, bool enable)
 
 	if (i == 10)
 		phy_err(phy, "Failed to power %s complexio\n",
-			enable ? "up" : "down");
+			str_up_down(enable));
 }
 
 static void cal_camerarx_wait_reset(struct cal_camerarx *phy)
diff --git a/drivers/media/platform/ti/omap3isp/ispstat.c b/drivers/media/platform/ti/omap3isp/ispstat.c
index 359a846205b0ffe9e736c7ed37c22677991cc9f2..f1293d412415d3fe36a87e7aa93a60e7daf693d8 100644
--- a/drivers/media/platform/ti/omap3isp/ispstat.c
+++ b/drivers/media/platform/ti/omap3isp/ispstat.c
@@ -14,6 +14,7 @@
 
 #include <linux/dma-mapping.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/timekeeping.h>
 #include <linux/uaccess.h>
 
@@ -768,7 +769,7 @@ int omap3isp_stat_enable(struct ispstat *stat, u8 enable)
 	unsigned long irqflags;
 
 	dev_dbg(stat->isp->dev, "%s: user wants to %s module.\n",
-		stat->subdev.name, enable ? "enable" : "disable");
+		stat->subdev.name, str_enable_disable(enable));
 
 	/* Prevent enabling while configuring */
 	mutex_lock(&stat->ioctl_lock);
diff --git a/drivers/media/platform/xilinx/xilinx-csi2rxss.c b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
index 146131b8f37e5a30b168164d4eaedc9641d6af31..a5074f05cee50e117256fdb8496b977332757e27 100644
--- a/drivers/media/platform/xilinx/xilinx-csi2rxss.c
+++ b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
@@ -16,6 +16,7 @@
 #include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
+#include <linux/string_choices.h>
 #include <linux/v4l2-subdev.h>
 #include <media/media-entity.h>
 #include <media/mipi-csi2.h>
@@ -400,19 +401,19 @@ static int xcsi2rxss_log_status(struct v4l2_subdev *sd)
 	dev_info(dev, "***** Core Status *****\n");
 	data = xcsi2rxss_read(xcsi2rxss, XCSI_CSR_OFFSET);
 	dev_info(dev, "Short Packet FIFO Full = %s\n",
-		 data & XCSI_CSR_SPFIFOFULL ? "true" : "false");
+		 str_true_false(data & XCSI_CSR_SPFIFOFULL));
 	dev_info(dev, "Short Packet FIFO Not Empty = %s\n",
-		 data & XCSI_CSR_SPFIFONE ? "true" : "false");
+		 str_true_false(data & XCSI_CSR_SPFIFONE));
 	dev_info(dev, "Stream line buffer full = %s\n",
-		 data & XCSI_CSR_SLBF ? "true" : "false");
+		 str_true_false(data & XCSI_CSR_SLBF));
 	dev_info(dev, "Soft reset/Core disable in progress = %s\n",
-		 data & XCSI_CSR_RIPCD ? "true" : "false");
+		 str_true_false(data & XCSI_CSR_RIPCD));
 
 	/* Clk & Lane Info  */
 	dev_info(dev, "******** Clock Lane Info *********\n");
 	data = xcsi2rxss_read(xcsi2rxss, XCSI_CLKINFR_OFFSET);
 	dev_info(dev, "Clock Lane in Stop State = %s\n",
-		 data & XCSI_CLKINFR_STOP ? "true" : "false");
+		 str_true_false(data & XCSI_CLKINFR_STOP));
 
 	dev_info(dev, "******** Data Lane Info *********\n");
 	dev_info(dev, "Lane\tSoT Error\tSoT Sync Error\tStop State\n");
@@ -421,9 +422,9 @@ static int xcsi2rxss_log_status(struct v4l2_subdev *sd)
 		data = xcsi2rxss_read(xcsi2rxss, reg);
 
 		dev_info(dev, "%d\t%s\t\t%s\t\t%s\n", i,
-			 data & XCSI_DLXINFR_SOTERR ? "true" : "false",
-			 data & XCSI_DLXINFR_SOTSYNCERR ? "true" : "false",
-			 data & XCSI_DLXINFR_STOP ? "true" : "false");
+			 str_true_false(data & XCSI_DLXINFR_SOTERR),
+			 str_true_false(data & XCSI_DLXINFR_SOTSYNCERR),
+			 str_true_false(data & XCSI_DLXINFR_STOP));
 
 		reg += XCSI_NEXTREG_OFFSET;
 	}
@@ -889,7 +890,7 @@ static int xcsi2rxss_parse_of(struct xcsi2rxss_state *xcsi2rxss)
 	fwnode_handle_put(ep);
 
 	dev_dbg(dev, "vcx %s, %u data lanes (%s), data type 0x%02x\n",
-		xcsi2rxss->en_vcx ? "enabled" : "disabled",
+		str_enabled_disabled(xcsi2rxss->en_vcx),
 		xcsi2rxss->max_num_lanes,
 		xcsi2rxss->enable_active_lanes ? "dynamic" : "static",
 		xcsi2rxss->datatype);

-- 
2.43.0


