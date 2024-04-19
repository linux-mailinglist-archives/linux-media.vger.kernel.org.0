Return-Path: <linux-media+bounces-9745-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8AB8AAC0F
	for <lists+linux-media@lfdr.de>; Fri, 19 Apr 2024 11:53:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CDDBC1F21322
	for <lists+linux-media@lfdr.de>; Fri, 19 Apr 2024 09:53:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C85D312BE8B;
	Fri, 19 Apr 2024 09:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bwinrTos"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC388565D
	for <linux-media@vger.kernel.org>; Fri, 19 Apr 2024 09:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713520177; cv=none; b=B0N16UfOPr7Io8iRw7I13efL12BXqPO6ZjEhXIz7YFO2e/e+ImQERtrPKwiWGFIsfNan053aTKbIiAaFv3QgwyvTXHmH9EFNvsIkJ5n05TiD1Vcu+kOnADGmwfXpoRKZYHyZao4sTfS3t1P6K642qOM+R3JoHNLtNwN0+qknTFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713520177; c=relaxed/simple;
	bh=06mL5EXe9kTunFEegEJRz7Wo9ks6u/t6gIH9sJH9trw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WmIpX9HKsJpYYhoAimhdvs0Yn1dTkKYb9UIpzLlE7Xjwd46Iw/ov5m4LDBW/9ddDH9P1jC2SxM62FNwr4BulYGhsahMlToi2tPcJdDsamnLRXE6VdPeFwJonJDmhSeBiasy30+K0dxwfXBiQ+gIk1z74gbK5s2/Mn+vJDX8xU9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bwinrTos; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-78edc49861aso124940985a.3
        for <linux-media@vger.kernel.org>; Fri, 19 Apr 2024 02:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713520173; x=1714124973; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X5IbU7HBHK5ZSrS81fN3o3XopIPldfFFy8PdyHH7F6Q=;
        b=bwinrTosOtpkn7cIUSG3YaIa1v4Yn5Rj8rXsPkkinHxzbbI7QBbwOe48Vdh6MuGVgH
         NFpLoGOkOoXul8YfzKsBO+p0hvtbuXe2ABnWfQVjWpSGmyRj2nbHszGJ6dYV1RERaXif
         qXvUwGBr/y/U/z1EIyH6N0vMNg2ZuxB+7MnO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713520173; x=1714124973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X5IbU7HBHK5ZSrS81fN3o3XopIPldfFFy8PdyHH7F6Q=;
        b=eIw/MGKPN4ozfjytnbmX57xS1adzOo9XIr3jZKfz6cC/CkWjVgoh+Ef3rG7+YJFxz1
         hMT+YcDN7pOeP4aHbgqpzi90wgVWxje3Xec5nb5NUprHxC42nw5d0CJ+OTgHu7tJG5Le
         OEoAIspuycEIP4/kHZSU3RX5ZvJYhjC1VaLQyB8K73JevOGC9Fc2o/aGlJ+/eOa5DKK2
         tCESZtRWy6+uHPhLINNGD/AKd3cvmS4bH5XwFcUqHl9+tGYHcqbdpqe55eMEDQHLidis
         lSIx1OB3VxMNNcmFZKDzeYaNLufUdQgzx3QIBGcOjDG+EMogQURT51VmVGUvTp/CC+Ag
         uwTA==
X-Gm-Message-State: AOJu0Yyvm/8cT0Wf6UIfbt0si1zvJvHuDwmUYfoJhC0KRKEwfC6sB6u/
	mH4pHjCuiLm5zc1IYSZG7v5i7gD01dejZ+21QLASc9HBeKpYVP5yAoq9Tj0+dA==
X-Google-Smtp-Source: AGHT+IEFPc2doe2D5XWkbZvTrB29BF0kfAeaqeMumnsEPsoEkeZEg2M8kAGfVkDU7KVIwRhvnXAZ7g==
X-Received: by 2002:a05:620a:3b84:b0:78e:dcb8:b4be with SMTP id ye4-20020a05620a3b8400b0078edcb8b4bemr1649647qkn.6.1713520173590;
        Fri, 19 Apr 2024 02:49:33 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:49:32 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:47:58 +0000
Subject: [PATCH v2 12/26] media: platform: mtk-mdp3: Use refcount_t for
 job_count
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-fix-cocci-v2-12-2119e692309c@chromium.org>
References: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
In-Reply-To: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hugues Fruchet <hugues.fruchet@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>, 
 Abylay Ospan <aospan@netup.ru>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

Use an API that resembles more the actual use of job_count.

Found by cocci:
drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c:527:5-24: WARNING: atomic_dec_and_test variation before object free at line 541.
drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c:578:6-25: WARNING: atomic_dec_and_test variation before object free at line 581.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c | 10 +++++-----
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c |  6 +++---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h |  2 +-
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c  |  6 +++---
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
index 1d64bac34b90..ea2ea119dd2a 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
@@ -524,7 +524,7 @@ static void mdp_auto_release_work(struct work_struct *work)
 	mdp_comp_clocks_off(&mdp->pdev->dev, cmd->comps,
 			    cmd->num_comps);
 
-	if (atomic_dec_and_test(&mdp->job_count)) {
+	if (refcount_dec_and_test(&mdp->job_count)) {
 		if (cmd->mdp_ctx)
 			mdp_m2m_job_finish(cmd->mdp_ctx);
 
@@ -575,7 +575,7 @@ static void mdp_handle_cmdq_callback(struct mbox_client *cl, void *mssg)
 		mdp_comp_clocks_off(&mdp->pdev->dev, cmd->comps,
 				    cmd->num_comps);
 
-		if (atomic_dec_and_test(&mdp->job_count))
+		if (refcount_dec_and_test(&mdp->job_count))
 			wake_up(&mdp->callback_wq);
 
 		mdp_cmdq_pkt_destroy(&cmd->pkt);
@@ -724,9 +724,9 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 	int i, ret;
 	u8 pp_used = __get_pp_num(param->param->type);
 
-	atomic_set(&mdp->job_count, pp_used);
+	refcount_set(&mdp->job_count, pp_used);
 	if (atomic_read(&mdp->suspended)) {
-		atomic_set(&mdp->job_count, 0);
+		refcount_set(&mdp->job_count, 0);
 		return -ECANCELED;
 	}
 
@@ -764,7 +764,7 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 		mdp_comp_clocks_off(&mdp->pdev->dev, cmd[i]->comps,
 				    cmd[i]->num_comps);
 err_cancel_job:
-	atomic_set(&mdp->job_count, 0);
+	refcount_set(&mdp->job_count, 0);
 
 	return ret;
 }
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
index 5209f531ef8d..c1f3bf98120a 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
@@ -380,14 +380,14 @@ static int __maybe_unused mdp_suspend(struct device *dev)
 
 	atomic_set(&mdp->suspended, 1);
 
-	if (atomic_read(&mdp->job_count)) {
+	if (refcount_read(&mdp->job_count)) {
 		ret = wait_event_timeout(mdp->callback_wq,
-					 !atomic_read(&mdp->job_count),
+					 !refcount_read(&mdp->job_count),
 					 2 * HZ);
 		if (ret == 0) {
 			dev_err(dev,
 				"%s:flushed cmdq task incomplete, count=%d\n",
-				__func__, atomic_read(&mdp->job_count));
+				__func__, refcount_read(&mdp->job_count));
 			return -EBUSY;
 		}
 	}
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
index 8c09e984fd01..430251f63754 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
@@ -134,7 +134,7 @@ struct mdp_dev {
 	/* synchronization protect for m2m device operation */
 	struct mutex				m2m_lock;
 	atomic_t				suspended;
-	atomic_t				job_count;
+	refcount_t				job_count;
 };
 
 struct mdp_pipe_info {
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
index 35a8b059bde5..0e69128a3772 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
@@ -104,14 +104,14 @@ static void mdp_m2m_device_run(void *priv)
 	task.cb_data = NULL;
 	task.mdp_ctx = ctx;
 
-	if (atomic_read(&ctx->mdp_dev->job_count)) {
+	if (refcount_read(&ctx->mdp_dev->job_count)) {
 		ret = wait_event_timeout(ctx->mdp_dev->callback_wq,
-					 !atomic_read(&ctx->mdp_dev->job_count),
+					 !refcount_read(&ctx->mdp_dev->job_count),
 					 2 * HZ);
 		if (ret == 0) {
 			dev_err(&ctx->mdp_dev->pdev->dev,
 				"%d jobs not yet done\n",
-				atomic_read(&ctx->mdp_dev->job_count));
+				refcount_read(&ctx->mdp_dev->job_count));
 			goto worker_end;
 		}
 	}

-- 
2.44.0.769.g3c40516874-goog


