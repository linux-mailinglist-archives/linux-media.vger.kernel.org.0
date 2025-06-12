Return-Path: <linux-media+bounces-34588-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6497AD69F4
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 10:07:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CFE417A9D3
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 08:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6FEA76025;
	Thu, 12 Jun 2025 08:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ESBURVkE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D06172617
	for <linux-media@vger.kernel.org>; Thu, 12 Jun 2025 08:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749715644; cv=none; b=HYc4bBOJBZ5maBC30a0Avf21J32mPKwbqesaAGEkkFITSMhSnzi/ippuWopPBS4Xr7RV61YBShvyIZiNHJQ+1Cwlvo0vJzF84V1Fa0p7AvW4LVv7RPVwKU0HqcRZO1majSp8uRUFlpz/VlXn03k6qNabR+rY4BCcIqnRzhFfkDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749715644; c=relaxed/simple;
	bh=AtsJ+IxXw+KuC8dwPP3HdyWmqSk21Kq2o1lyXTJBbVk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Geu9ds+sJTe61aNMnkn+an5b8G9GPS0xsU5eqcbpaJiERCxvHTji2dl/J9trtXcOcj/rnrbdeQxVEe0NHEtc7bTzQfm88fiex+EjWx3hkLpo28nOuNcMQhgqCmxoMRn2tpZwGecpFiZwMqkHivDa+1Ln8BNmZ4EN9daHMt7ka/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ESBURVkE; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-450d668c2a1so12642505e9.0
        for <linux-media@vger.kernel.org>; Thu, 12 Jun 2025 01:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749715640; x=1750320440; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+nQf2BZSyAt2CWjF2NvZ+AX3gPhR25QkJsGYwFCerdA=;
        b=ESBURVkETzU6ASQnrTsiqtJpQ3HgYwVGPKp/MYnkcU3k8nk7yhzYXeYxT2kxKl8lYk
         GDJmtUFKuvLwcIvlBoF7JiRk3lpoJgDNiobR9Cmi4BKiTrbAyXmCleB+fZdlEsnVCkpg
         BGog4FfyT5KINdF3fCro0/K9Q9kU15BWS7EE2vKuZhunjWxoKPhQeE0Gmi0ayGQMWYtV
         pb4vN7yin1Dw8K0y/2wSdVNBUgp+q1WlOLYlTJLRrnL2c7iKgKPesWYzD2tpvpMrbN0j
         Um80GqaUYFpuoKKHOPSukYiY5qVv8SKIhKCzphyXP2KAh8A6LQuYUmIQhCtSyNekAxpQ
         FJ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749715640; x=1750320440;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+nQf2BZSyAt2CWjF2NvZ+AX3gPhR25QkJsGYwFCerdA=;
        b=dTYVk3y0n5PA49fFAJ/n0ve3AWDgr1S9mkT7GRFNS4XsPprLo93yFBcm9Wmpr2H0G7
         ZBo0nvta9LbyZmae3odv9K8NnkYvTvzTJd39tQeZy1jOj0gxTg7gj+KdSIZNNeijk5Im
         tLp2buMVt47wwPuJvOmpQlt7xtkHhFT7XzrlTkceDDDW+TR6XYmyMUhJhYGEhESU+Hrc
         DQa7tAizpoo7QbvqgBArZfxKWCi8zaOtkhVRqt1khGSI+aKVb/eXjRsV7OT5c2Dqakp4
         F7J1G9XNowaq2biWPnZoD/Xkh6idxFKYj8bdaqzfBTxWFpt7pEPUYYNV4FtYj7YHOxi6
         4VMA==
X-Gm-Message-State: AOJu0YyEG7nL4OGg5+8mChk9U8rSy8o1hIp9Mfh6YyNCUYIKvoNw0kIx
	qnLrkOFrBxJ/ld9hFmG2QOxj4ExRvsSi0Ks0CQhk39SBuCtLgZ5o788tP4S6gfRAFwk=
X-Gm-Gg: ASbGncs4onANp55PsCHc435f8NOAiOnsEHg0pCxq+KFkNVIBQ0/oE3uHFx9Kh+QH8cx
	RdF9LJqGfNh3zCTl6/kg9SeWMLljWEDEqP2J62u/nzdoQEAyRmzvlE+hvDJhg2r9JF/NbfuJhKc
	GAYa2h1+Pr1mVGoytS+KV5AY3eBkiF5VJVfKJiF1RAD3hMLlJkVJMQ0bRS0CvgHUCLstEs7LNQK
	NE8OpTO+R6cjQ/xFOHMGxCfXPz85Ayib4K4Zmg8IkGndC92aEv4mGtDuQ/QDA/AmHMLfXIq0DPP
	0+6LG86fr/LccqIrr/VXTD/jViYrptcOaJ9FmjzNmzgZ5Vi9WWrWDuAYsMxCzVUEW8dUyRjsF8e
	aJyQY3xg8XNjWWCkXImAzbBY=
X-Google-Smtp-Source: AGHT+IF7PDQ6/yCFsqlgB7Wu8quV4z9XPesjcMh2veIPWxHp3FzT5vhDioJXDj3C3QVyAwVLuesm8w==
X-Received: by 2002:a05:600c:3484:b0:450:d79d:3b16 with SMTP id 5b1f17b1804b1-4532c2b3123mr25508875e9.14.1749715640517;
        Thu, 12 Jun 2025 01:07:20 -0700 (PDT)
Received: from [127.0.0.1] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532de8c64esm12942335e9.7.2025.06.12.01.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 01:07:19 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 12 Jun 2025 09:07:15 +0100
Subject: [PATCH 1/2] media: qcom: camss: csiphy-3ph: Fix inadvertent
 dropping of SDM660/SDM670 phy init
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-linux-next-25-05-30-daily-reviews-v1-1-88ba033a9a03@linaro.org>
References: <20250612-linux-next-25-05-30-daily-reviews-v1-0-88ba033a9a03@linaro.org>
In-Reply-To: <20250612-linux-next-25-05-30-daily-reviews-v1-0-88ba033a9a03@linaro.org>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Depeng Shao <quic_depengs@quicinc.com>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1181;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=AtsJ+IxXw+KuC8dwPP3HdyWmqSk21Kq2o1lyXTJBbVk=;
 b=owEBbQKS/ZANAwAIASJxO7Ohjcg6AcsmYgBoSoq1EceJlwmnwNcsYuowFH2zs5QNvjAdyiiGc
 O0ubvt9pOOJAjMEAAEIAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaEqKtQAKCRAicTuzoY3I
 Ot64D/92ram2pjvNmauahadl2ujo5tVHw0LDmcAmBZrFmuK0Y26Pn/gRmgeUP3BeHBGh+BXy3tW
 X2IkURoUZoRgNQg6Ncotoez92YpR4MKJwrK4leYM0duAx7hCmrl2r38YW87njRxYd+1OJ1OvP+W
 gRj0OCSWJ7N5HE98U5mQLKB/kqJpL41cXwTOBPJSYUd4ZWPCg74RKP7zmIWfyJyjrEmHp+pOBdx
 DIw3o3tzsiojn70CXVWlSVZqgUzpD6NYkhEf5Lp51H79tALh4o3iq+fr3mWx3befsIbWHNvgGCQ
 8Ymy+Ub6ShjdeTpfTu6Mf1/LxYpYLwKupClefLIaiogUqVLlGwdCJ5loV8fYgZ69IRDL0MOEHcn
 XjsW+zW3ADKDbZNZNPHe9uI+txbVPxAaiXUIC2Mb7AQWHiTcqsDVEL3UxdzxoQS4a3N9bNa93fl
 gwV8J6fUNLOfycD3/f35QOXtretH4ZqG66KshXv4wAbzDefdThO2masc5Ae+gsQ3LMbDYUGcvNj
 5xkErCIXDGOm2JyC4r1rWgReiMnn4DE28NvgXeMP550gbDZI1xC7AHmwrTTn8w3ufMBLWhBHVEX
 ZeWtKjKCjfHPBocH+LVUDrmpXlDUKyDPKtqYL1xYyeve3OqxdPxxNi4pKnb+Y3cEy4pJ3Dfz+tJ
 sE/Jmy1P6/PZNFQ==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

The moving of init sequence hook from gen2() to subdev_init() doesn't
account for gen1 devices such as SDM660 and SDM670. The switch should find
the right offset for gen2 PHYs only, not reject gen1. Remove the default
error case to restore gen1 CSIPHY support.

Cc: stable@vger.kernel.org
Fixes: fbce0ca24c3a ("media: qcom: camss: csiphy-3ph: Move CSIPHY variables to data field inside csiphy struct")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index f732a76de93e3e7b787d9553bf7f31e6c0596c58..88c0ba495c3271f3d09d2c48f07b03d2a4949061 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -849,8 +849,7 @@ static int csiphy_init(struct csiphy_device *csiphy)
 		regs->offset = 0x1000;
 		break;
 	default:
-		WARN(1, "unknown csiphy version\n");
-		return -ENODEV;
+		break;
 	}
 
 	return 0;

-- 
2.49.0


