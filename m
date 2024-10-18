Return-Path: <linux-media+bounces-19868-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8D99A3FE0
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 15:36:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4504C289A4D
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 13:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE4BE201261;
	Fri, 18 Oct 2024 13:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BRF68a/D"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6822C200B99;
	Fri, 18 Oct 2024 13:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729258506; cv=none; b=imyFHYIVnSOEikc+6zE71Hwz9EEMvAm9dbGc0ABpXScfsApaZ0GZyJ+DP85Dny0a+35XXdySX25tfmNj4jJIHWOv+rlIsytN126VfoUBFzVR8yUuGOSfn66RDai8MaPU4s6FTfdC0KHrteErHpDF4hzkxcbeIfOaURkl6ML7YjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729258506; c=relaxed/simple;
	bh=oSyANygK9+1tRoO+oi3cs/pvQ7TK/hoTnUQN/5DMMXU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EZ8mPg2sCYHy8VlXLxgxyIVSgjhsfF4jqAIX5tWksUdEPpz6ckPytBlFlwI1hlvqUCiWZX/i61DUEFaVHbw9PaTyaCNdT8NlX93KaR04rJT0gj9GS9dHPv+d8W/H6c2fcSRZ9sfzNaaG/KZTZLaN98umZ2DpPtFZtdYUMKLMrzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BRF68a/D; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-37d3ecad390so2334281f8f.1;
        Fri, 18 Oct 2024 06:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729258503; x=1729863303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pNupP9JfUiIRbpMOXQPiRaKCecULdi37qatyogUW7qs=;
        b=BRF68a/DonXVgA8RGUk8BEqZyEavornq/NpKN+3I1kU3WJX+f2RPP7YU4xHB2+SqNB
         OHKEu8TfTh9iDNbMolcJshWp4/Q0c1wpnrIC3NFUwsrorsd88bruwWNMWXSduJM3JtjF
         KitA4w1s4Vicr5dmDoOI0dt4aA0Afv9I0rGWZCrt3rJBzlZMxzfQZZvs0anO8ZDpaiVk
         b8lA3Ad49XS/ajY/l7ylUnCJe7k+RGj4JmExkZAhWj0srGWD6VoKzlL4jw0AMAStVKpA
         xS+D+Lb2z4reMbhHi1lilLTTJgjvNjcPymbXXmqEj6bo/7rskM9NymiseRefgJFYMW6U
         wKEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729258503; x=1729863303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pNupP9JfUiIRbpMOXQPiRaKCecULdi37qatyogUW7qs=;
        b=BIyTl35dIbcg+MOYdVzptBZwuLCl9SmGhdBvxEDyYQUrQ959g4V0jDzj1nzfAXgAaS
         VyTeuwIEzNOmyw5dqrkLoFAyYfbeJK0gKCFmDtmcCf3yhp1dJaPj5fQUzmrSdcFsdDih
         BUJ7YLP5RDmKJKUrh0lr/DWjywdE1ARaDkqfQdeVKcS23yAusxxt6ZZhP6KWZyOo+bk8
         1hGuLjQ5XZPsmxurF+GpKK92dNYhBhZ3XnEqE3y7UHjCozPRUuWOBrbugaSVkQDVb4N6
         SoXOfOojBbLhR/fpfLdhepPQ6OY1hydRkgLwQmBXU7w+zQV0ZHVE+f04Yjo5H2Aoasye
         wjRw==
X-Forwarded-Encrypted: i=1; AJvYcCWbhWiE3FsFOwOd6EsH6Yov5Kdl94FRp1jJIZAwAb8+PGAKkynBGaH4SElRacC0s2pdbmcApJd4bQILbcF5mPTz5J4=@vger.kernel.org, AJvYcCXYWBJolQnE5YRscLo15Qgo2Dd4FK4Ai49h9MiGufhFSvNK6+GRJ4pxGyxWMSHZ7c8tj38Ib8MWmRTGdi8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj0voQ45hdVw33wopobiTlXywG1gzUO5jGq6wxwJmx8ZX1tzjn
	bxZPni61zzQ/RRpnAfliGuy26pMxNI4zoVvJ1qZTU2jPWcGu//8k
X-Google-Smtp-Source: AGHT+IEpTLxPT893iOVRNmvS+Yy6Q+T2QH3HC398BRU/YouQqBGsgy9A3VoKYc4HN54SvcHPgOBqbg==
X-Received: by 2002:a05:6000:2184:b0:37e:7027:c86f with SMTP id ffacd0b85a97d-37e7027c9eemr2118365f8f.9.1729258502532;
        Fri, 18 Oct 2024 06:35:02 -0700 (PDT)
Received: from localhost.localdomain ([2a06:5906:61b:2d00:d416:f456:3869:adaf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43160e0a7acsm24320475e9.22.2024.10.18.06.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 06:35:01 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v6 07/23] media: rzg2l-cru: Remove `channel` member from `struct rzg2l_cru_csi`
Date: Fri, 18 Oct 2024 14:34:30 +0100
Message-ID: <20241018133446.223516-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018133446.223516-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241018133446.223516-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Remove the CSI virtual channel number from `struct rzg2l_cru_csi`.
Instead, pass the CSI virtual channel number as an argument to
`rzg2l_cru_csi2_setup()`.

Suggested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../media/platform/renesas/rzg2l-cru/rzg2l-core.c  |  1 -
 .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h   |  1 -
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 14 ++++++++------
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 43da91c4fdc3..89be584a4988 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -72,7 +72,6 @@ static int rzg2l_cru_group_notify_complete(struct v4l2_async_notifier *notifier)
 			source->name, sink->name);
 		return ret;
 	}
-	cru->csi.channel = 0;
 	cru->ip.remote = cru->csi.subdev;
 
 	/* Create media device link between CRU IP <-> CRU OUTPUT */
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index 8fbd45c43763..4fe24bdde5b2 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -53,7 +53,6 @@ enum rzg2l_cru_dma_state {
 struct rzg2l_cru_csi {
 	struct v4l2_async_connection *asd;
 	struct v4l2_subdev *subdev;
-	u32 channel;
 };
 
 struct rzg2l_cru_ip {
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 7cd33eb1939c..9ab7ef33c9da 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -301,7 +301,7 @@ static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
 }
 
 static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru, bool *input_is_yuv,
-				 struct v4l2_mbus_framefmt *ip_sd_fmt)
+				 struct v4l2_mbus_framefmt *ip_sd_fmt, u8 csi_vc)
 {
 	u32 icnmc;
 
@@ -319,19 +319,20 @@ static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru, bool *input_is_yuv,
 	icnmc |= (rzg2l_cru_read(cru, ICnMC) & ~ICnMC_INF_MASK);
 
 	/* Set virtual channel CSI2 */
-	icnmc |= ICnMC_VCSEL(cru->csi.channel);
+	icnmc |= ICnMC_VCSEL(csi_vc);
 
 	rzg2l_cru_write(cru, ICnMC, icnmc);
 }
 
 static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
-					   struct v4l2_mbus_framefmt *ip_sd_fmt)
+					   struct v4l2_mbus_framefmt *ip_sd_fmt,
+					   u8 csi_vc)
 {
 	bool output_is_yuv = false;
 	bool input_is_yuv = false;
 	u32 icndmr;
 
-	rzg2l_cru_csi2_setup(cru, &input_is_yuv, ip_sd_fmt);
+	rzg2l_cru_csi2_setup(cru, &input_is_yuv, ip_sd_fmt, csi_vc);
 
 	/* Output format */
 	switch (cru->format.pixelformat) {
@@ -466,12 +467,13 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
 {
 	struct v4l2_mbus_framefmt *fmt = rzg2l_cru_ip_get_src_fmt(cru);
 	unsigned long flags;
+	u8 csi_vc;
 	int ret;
 
 	ret = rzg2l_cru_get_virtual_channel(cru);
 	if (ret < 0)
 		return ret;
-	cru->csi.channel = ret;
+	csi_vc = ret;
 
 	spin_lock_irqsave(&cru->qlock, flags);
 
@@ -489,7 +491,7 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
 	rzg2l_cru_initialize_axi(cru);
 
 	/* Initialize image convert */
-	ret = rzg2l_cru_initialize_image_conv(cru, fmt);
+	ret = rzg2l_cru_initialize_image_conv(cru, fmt, csi_vc);
 	if (ret) {
 		spin_unlock_irqrestore(&cru->qlock, flags);
 		return ret;
-- 
2.43.0


