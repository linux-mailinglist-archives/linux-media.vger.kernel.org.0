Return-Path: <linux-media+bounces-9454-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 583AA8A5B49
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 21:46:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E191286642
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 19:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 738EC16C869;
	Mon, 15 Apr 2024 19:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IYQi8Syt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F411649C2
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 19:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713209711; cv=none; b=aKLWtEumllJyEeG43RckzU+3ZH77IWDNvnxooOQgO0ZyOhYMLmv2bmcAYeOSq98ellkL84ow8fANhU7Tqlfef3MQ9bnzwyB+bXNvkLp5KKhlSRXCExr6mAJop8I+DNfIuH9baKWgrlRgE4hlFo5bzBbvlXTLzIdsYcqRwmrddJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713209711; c=relaxed/simple;
	bh=YppEHZnTLQzLGD2f5s7SR2AaXE+KWzBq1dtSVEVCatk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OiyN/aNUzVE8twyU9mhaSbKJ9hhWYQq3x3OZUWCJgE5ukqygWCrs3PUJ3lF5jAchaky2DrpqCt1g4Ckqco+wTu0qFaOW0pdtHN9HoSh6pDjgWLWvtTE0EFvhAcqeDJGRPXj8+XG6fLtp4BaqEbLzKJGVmDPK0MDeVIrLVx5IwcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IYQi8Syt; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-78d61a6229bso247240885a.0
        for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 12:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209707; x=1713814507; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+lJf0+XIBDdSVuJAMeJcbyaAa+r8UncIi6K0ZFQWngw=;
        b=IYQi8SytxW2a4klOXWOqdV9eUoK+fnBZcgD9f7unUBZ9UoHKuM1/P7QJKHAbu/hNvv
         shmSqKH7rHmDkRHDobZYKhw9h0+mEpNEK8thHsD50vD+6XrN0IgWTcS3myEza7tWDrYB
         Uh4wzrnkOHi45phaxT6ahtPdBTIWX+QLtIlkE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209707; x=1713814507;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+lJf0+XIBDdSVuJAMeJcbyaAa+r8UncIi6K0ZFQWngw=;
        b=NKQANXqpwm60Z2UX5Mm5id0BHkf0zc8keZVks8la+4r2g83wPHOIKmZG13BZsJMbpT
         pIcb/dbrPbVrEa/aH/8Izgo394O91qCSApdR4u6DpjG2cO7DkAjBtJZpMcHeKsEGi02f
         6148As1+hci/gvzdxWU75/nlyPEVL+hI7M72rZJRjahMrR0zgCbQXa0ZLapTzgEQMKd6
         yYjhhUInJUI6o+nhqrvM39tx4kZhsqDKoj/GoFWD1t7A+T3sl3TJGUm/9EdPAboqggxs
         zUNB0Gtzp9bFPwA/i88vw359/vwxwzo9O43lJfUGfkKK2Q2TwPRJL4w+VP2swuqsqlp4
         ktig==
X-Gm-Message-State: AOJu0Yxraego2H1V8qkV/IBBatZMh7esG2NKPPl+msQGICz4phFFM8jG
	53hff5KDOqg8p7rgwXgRU2ExFLWSkNcLmYe4nWW+FO3GGoU4h9q2eH33AZaU8g==
X-Google-Smtp-Source: AGHT+IHZ1e+rN5kElZ/+CBGmltPllmsoOBrN7bu5f4/61aiFTpQ8yq022XA0QecM/v+OB1heBU4SXQ==
X-Received: by 2002:a05:620a:400a:b0:78e:ca18:4093 with SMTP id h10-20020a05620a400a00b0078eca184093mr13235627qko.60.1713209707046;
        Mon, 15 Apr 2024 12:35:07 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:35:06 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:52 +0000
Subject: [PATCH 35/35] media: venus: Refator return path
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-35-477afb23728b@chromium.org>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
In-Reply-To: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
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
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Pavel Machek <pavel@ucw.cz>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

This is a nop, but let cocci now that this is not a good candidate for
min()

drivers/media/platform/qcom/venus/venc.c:611:12-13: WARNING opportunity for min()
drivers/media/platform/qcom/venus/venc.c:651:12-13: WARNING opportunity for min()
drivers/media/platform/qcom/venus/venc.c:629:12-13: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/venc.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index de06e1712d09..285bc1b4d888 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -608,7 +608,9 @@ static int venc_pm_get(struct venus_inst *inst)
 	ret = pm_runtime_resume_and_get(dev);
 	mutex_unlock(&core->pm_lock);
 
-	return ret < 0 ? ret : 0;
+	if (ret < 0)
+		return ret;
+	return 0;
 }
 
 static int venc_pm_put(struct venus_inst *inst, bool autosuspend)
@@ -626,7 +628,9 @@ static int venc_pm_put(struct venus_inst *inst, bool autosuspend)
 
 	mutex_unlock(&core->pm_lock);
 
-	return ret < 0 ? ret : 0;
+	if (ret < 0)
+		return ret;
+	return 0;
 }
 
 static int venc_pm_get_put(struct venus_inst *inst)
@@ -648,7 +652,9 @@ static int venc_pm_get_put(struct venus_inst *inst)
 error:
 	mutex_unlock(&core->pm_lock);
 
-	return ret < 0 ? ret : 0;
+	if (ret < 0)
+		return ret;
+	return 0;
 }
 
 static void venc_pm_touch(struct venus_inst *inst)

-- 
2.44.0.683.g7961c838ac-goog


