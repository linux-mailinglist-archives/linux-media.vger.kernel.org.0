Return-Path: <linux-media+bounces-4912-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4806B84FE39
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 22:10:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0336B28D056
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 21:10:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ADBB364DB;
	Fri,  9 Feb 2024 21:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qck5GOuR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27501210FD
	for <linux-media@vger.kernel.org>; Fri,  9 Feb 2024 21:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707512981; cv=none; b=Qf6OoUAEjr9iBx+VKylabNMjIKC9ed+Hqj5XeFdy/1+c9UMvQEsn/TFJC0jdWPdojxo2kBmI8rF15KxnI688GDunDc45JolpQzATNpErCPJB26JEh0g3j+n+AS/0rYjYui8p4XvC7GVVeropHG7bY6kgBRWmKyd8mWikw2q4KD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707512981; c=relaxed/simple;
	bh=qRFNx2a0sPyBufJHjBf1XzrjeKK7bQ1fasBPqhqnRAw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZtZNO0XnbmeEUkVP0mNJ9eV/lGf+h2WUJMoD/7pEwTrkPCgTJi2sY1UAIStkv/rK5JzyJ7EA3cs/xuDQGWI8jGcxtqLJvrsbqmhsdYrAbOSgQrgNugRJ2vl2/liZ5fVESOgLN6MdZn1zympcYnQcYWc60SGupv701OLl/WoqyvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qck5GOuR; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a28a6cef709so188615966b.1
        for <linux-media@vger.kernel.org>; Fri, 09 Feb 2024 13:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707512978; x=1708117778; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3P4+a9/cIAslmQuzQjL8EtOxDSeXqHOG2MyxLu4mmL8=;
        b=qck5GOuR3v7ACRXwSkYFZmK0ooW94HNt19ZXEcbR9rpLxxIsU6openJ5OAZmwKmUy7
         EicuUxMbLFCrpxukRK1MzQ/Xe73ActwdGTjb4tfvq+WHndyLOzE/PtgxWYYsLNiEu+Mz
         +xrnCgajQqf3otVi/hQc9KFzGY2u00mmE3gCU8dxAx2ZwlrJH3sTn+9u+mUANwGcdm1t
         6k8sFAxzk6yvNJpE01YlkLRKesVrt7CkzLDdCrwqgdQzoMfTG/Ki86PxD26yCjrRGgCO
         Me28FHibNM/dtNAWEdnO67vPrYVvkdbejaIHTyI2aFvud74uCK3mDNgqIYjEMIjc9/ps
         9dBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707512978; x=1708117778;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3P4+a9/cIAslmQuzQjL8EtOxDSeXqHOG2MyxLu4mmL8=;
        b=Qbkp06j0qXTteI2N4ovallELJi9uHrYtuOcfkRhsbQKsbwwpPtESarV8I00xMT6Sok
         ZiuaEVB0zkscKBBhQM+JFW7Bdp0RDScAC8WUQHdS9Q/RBbEq/y81up0dhV5+B8iMGSH0
         eEa4PL1K9beOGVvGGhrw7ZPkOWHyN9kdtfInAlfqUobgaVRBuKxEolHJXynLHRKs9lg5
         OR++JhPCHAf+svXWBX9P2qnekTG8b47fYfYjTK/+Rab8CnDcbiq+HkeyAVpt6fBkNPFt
         Ra071qadiJcW1xc9lmZ95J0s1yipoi5Dm0Hs5WSIWxFeDgkniBpYms09wYkujkgJOhdy
         2hsw==
X-Forwarded-Encrypted: i=1; AJvYcCXUKoEztMyaPQle1GpoMk701fXAcQeHFPcljFdKyJd8ZKrcMhwBZh3NvZj4a0OvrxBiBXJwEskVQYSkomVLyJHMUstkeZX5cPfYhUc=
X-Gm-Message-State: AOJu0YzAt+KT/IZf6d53RKTG5ymBom8jNe6b8SB8rrm8X7dprJZ55a2G
	+fR9pd3tgV2VEPIv8+H1diqHgU46mlLFEZCdTDfyA3ALCCs1a0/afZqXnho6T4s=
X-Google-Smtp-Source: AGHT+IESvxpc8wJ0oVbIuXzOZddHwBQPHFV+gIPXIb3XIuwrUgQYewE9Hvo+UA3RRVD0H7Rz5otnbQ==
X-Received: by 2002:a17:906:6d58:b0:a38:625d:8427 with SMTP id a24-20020a1709066d5800b00a38625d8427mr194776ejt.48.1707512978318;
        Fri, 09 Feb 2024 13:09:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWJzBiZ/TTNm2w+OuWjm83uhJhHA8Ipd+Wffmn6LnhvoVFE5HgaYuovGQ7mgVPPQR6P1xwM2+1PD59mUIS3eQvlefBk9G49se6W4Q3UAolQolIOI6nmOUiNfa1kw8dTh5xzKefk0zqR0kxlc+e5/KjUt/dKg0kqlWiFJ+CQG1xUMoJTKBTjzQZGjIAFNPDNvXSYAXHjo/azPZqHnZ8RJyzqNaKxAXuYPnubrhXx4Hv7Kr7FTNDaW34o1GniGbRPxkINOYeAW4wup9v2MO/PggIqaVTB69j5eAGECWj9NRPC9tSlPJEDODScssRtKDdzX4BBovewQvp3aNc0sGF54XeSyUe9wK2/TwNECPz+BSzSRnPaFlO5Fqwn7F2Eo0ihUszZ+m+9LQPJ9GQEYgD3bfbmJnIYxwxJ+fWPH6H1/JCzQCevpphR7dVb8rvNVNRvcMmWGixA91o3OTn/OwlZnnIERZw2fEQsTxTsUfkxPYisnOkKdHQgs8o3CxXzgVRVqN1PRQ==
Received: from [10.167.154.1] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id cw3-20020a170907160300b00a381ca0e589sm1108516ejd.22.2024.02.09.13.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 13:09:37 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 09 Feb 2024 22:09:24 +0100
Subject: [PATCH v2 03/20] media: venus: pm_helpers: Add kerneldoc to
 venus_clks_get()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230911-topic-mars-v2-3-fa090d7f1b91@linaro.org>
References: <20230911-topic-mars-v2-0-fa090d7f1b91@linaro.org>
In-Reply-To: <20230911-topic-mars-v2-0-fa090d7f1b91@linaro.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707512970; l=2105;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=qRFNx2a0sPyBufJHjBf1XzrjeKK7bQ1fasBPqhqnRAw=;
 b=ORx9bBusFVmbADK2rWtJUBcEaMKTPSaBtKJ/kovOv2DR5ZDBMzKXGN3q535RixmDVP9TEYxBo
 QkrgBcRH+GvD4lqAuzRy1vs/VU0i6gr+kYkXU9uaWRAASqggGyt6wIR
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

To make it easier to understand the various clock requirements within
this driver, add kerneldoc to venus_clk_get() explaining the fluff.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/media/platform/qcom/venus/pm_helpers.c | 28 ++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index ac7c83404c6e..ea0a7d4601e2 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -23,6 +23,34 @@
 
 static bool legacy_binding;
 
+/**
+ * venus_clks_get() - Get Venus clocks that are not bound to a vcodec
+ * @core: A pointer to the venus core resource
+ *
+ * The Venus block (depending on the generation) can be split into a couple
+ * of clock domains: one for "main logic" and one for each video core (0-2pcs).
+ *
+ * MSM8916 (and possibly other HFIv1 users) only feature the "main logic"
+ * domain, so this function is the only kind if clk_get necessary there.
+ *
+ * MSM8996 (and other HFIv3 users) feature two video cores, with core0 being
+ * statically proclaimed a decoder and core1 an encoder, with both having
+ * their own clock domains.
+ *
+ * SDM845 features two video cores, each one of which may or may not be
+ * subdivided into 2 enc/dec threads.
+ *
+ * Other SoCs either feature a single video core (with its own clock domain)
+ * or 1 video core and 1 CVP (Computer Vision Processor) core. In both cases
+ * we treat it the same (CVP only happens to live near-by Venus on the SoC).
+ *
+ * Due to unfortunate developments in the past, we have to support bindings
+ * (MSM8996, SDM660, SDM845) that require specifying the clocks and
+ * power-domains associated with a video core domain in a bogus subnode,
+ * which means that additional fluff is necessary..
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
 static int venus_clks_get(struct venus_core *core)
 {
 	const struct venus_resources *res = core->res;

-- 
2.43.0


