Return-Path: <linux-media+bounces-18936-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE6898BF34
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 16:11:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DE05280D5E
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 14:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B9CA1C9B95;
	Tue,  1 Oct 2024 14:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nkpVpGZz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6B41C6F78;
	Tue,  1 Oct 2024 14:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727791789; cv=none; b=K1OKvK9o22vKkGom6Aqq+XsSW+fn+R8J/mOy5nwtShfEl2ZGw3hnvl8EQAZ7RdmP/24LUHStSdq465zI/mwcUX3RVLHPs4T+mwuNtN+F4zvQR3emcqZtyCbTDDo13y2fsW/ThpHMqXN8ZKiVcjqwwJiYgyQANVuBcwulE+Jhzuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727791789; c=relaxed/simple;
	bh=cvqrPU5OTC8zbfImMPZ7mExotQB/ObnIKlVx6ZeVb1k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TqJVSDamQHdkkTghsnR8H5nBIiIR/jZ1KMuS/5iz8hl7eke3rKK4EJ4fH5r4q+4e2mPSl0yZxUCsBozPd1Y0QZTsw9dp1bQI0/xngWTABy7GgEq1ZQz0mMbaF6UWY+ZPhl22h4PPHI+4EM1W5+6+YzaEiM+K5Zmtv9ZALZWrgJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nkpVpGZz; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a8d446adf6eso58934166b.2;
        Tue, 01 Oct 2024 07:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727791785; x=1728396585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nkSD3jPZKaudZBN97A8tmazlp8/g3UW7C7H7/xfun7s=;
        b=nkpVpGZzXlz5kgTYSbLqowRJTdkbrY+uEHlo/cjYD22je1sh5G0vRyr1hbxpNRy/Qi
         B0lUb/3mXZ7kM5yCfUMOQP2/AblQJxkTOpTFHXpTxfttk1wIekl3qBPsocPhVCjZvkcs
         cWVpoPm4jovB5UeshE45vy729S0P+zDm+x2psTV96mH5bHrJ3UOCmoxvwdo05lzOjsDZ
         nO62PHZOkKo3lkJwF8OKtjK5ZNkXkdQOEp38UW/d2q7ec4EI7+ZriGvLGT2ly5KeI8tG
         UD5/nGiQs4wor0lY+/jlhR3sU+osSJjfJVRJeT3Z+5nFYqKXxbTxP9yulJvQcYF9sD6g
         UqIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727791785; x=1728396585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nkSD3jPZKaudZBN97A8tmazlp8/g3UW7C7H7/xfun7s=;
        b=ffIrJbH4BJ/pERCLb1VznTo7cY1vfrWFbWDgt0eEQsBQDmQM3GPXr9pW9pXuu67s6l
         XKUWAo1MKmHghXdWpQeGYPhsynEJc7krm7yPPsrf1Kv3MqskDAXfeSpUzIIi9CqHxZjq
         tlxyzpDRETpZFzUyZQzCPEx1IngoClj7RPjtmODTZrT3RIK9QDfKptOeWDaBaurAdBIq
         xWfQ9xtU1qQJ6PCn62kWJ9GjPUTx5CSpq+9SYO8VcS/GAvq9nkcdHzCt7W67jZ9tGcWg
         09jmIX2RjN3EPJYb5ebZJEEuFZ8Zwt00Dmv1Xo/DTJv9NeksF2P89c4+ANXtoNDRR4mb
         B+qg==
X-Forwarded-Encrypted: i=1; AJvYcCVZnK41siaOhrzCNqAO6odkFwRVqLSamsDvuejUsT95hKi2E8YFiU03g/l2iE7KjFhfE0y3y9cb/o1BcD9w4D47qao=@vger.kernel.org, AJvYcCWLJEqIkeZCmTfGGhlxBB5C2AH3mzMPUsw4Rwfw8l4VaY9U8twb6BbR+xp3Jq/vGMk/agVJQyFdRnFAICM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi6SEu0Kq7lMAB3T29jzjzuLsCbQme/SI/J2TF2Hi2B++zx1Nz
	Ds7cJegH/zz8VZq85qDDEouSGqjk6HWaC6V+Rwqh8sT2FaVXhbqi
X-Google-Smtp-Source: AGHT+IGEQjI1UCxy4qdcMtP5RUdzj3xESv22ABqrWJ22tgW9Tauvqr+RfvSBIDaW8p/oDHZuCLjpgg==
X-Received: by 2002:a17:907:1ca2:b0:a8a:86f8:4eed with SMTP id a640c23a62f3a-a93c48e8e1fmr1851900566b.10.1727791785289;
        Tue, 01 Oct 2024 07:09:45 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2776de0sm723532966b.2.2024.10.01.07.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 07:09:44 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 07/17] media: rzg2l-cru: Remove `channel` member from `struct rzg2l_cru_csi`
Date: Tue,  1 Oct 2024 15:09:09 +0100
Message-ID: <20241001140919.206139-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241001140919.206139-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241001140919.206139-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v2->v3
- Updated subject line
- Collected RB tag

v1->v2
- New patch
---
 .../media/platform/renesas/rzg2l-cru/rzg2l-core.c  |  1 -
 .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h   |  1 -
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 14 ++++++++------
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 69cd45b26951..b21a66e2ce5c 100644
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


