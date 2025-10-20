Return-Path: <linux-media+bounces-45046-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D241FBF1B6F
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 16:05:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D5FD54F6D82
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 14:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BEE22FE06D;
	Mon, 20 Oct 2025 14:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H81aqAeA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D401D5170
	for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 14:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760968959; cv=none; b=owcLgGSs6IiWQizDXBjmuOHHis8o/cammIelJq1Fg6HcZEKnxWbYoaOJushCWhrMDnLzQrR5g9pd48o1tp6/yH6K9MPJcyzJ+0a5L3GAc+Ma3tFb00sbZjt6CqMcgFGmkLmgcXrP+XCjQUluSfI7wVjRRn6CxueYFl1aXXKBJRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760968959; c=relaxed/simple;
	bh=IYen4mKaE/kpKiZVRAkWmTZYn1urfQk7brDzCsv319k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qc+QSVpleYz7tf59vBSPEdhErrmy0u//FPFzOJ/tT6ro8jIXXIrlXSQjQEGNs2BaB6FnzaZ+s/7A3bWC+y3j+E7lup+4UA8TdRVZTeZNTCPTUoQrY4EQKRCdURJtPumtEI18ae8ji8IJPqQFJdHFUsSgUf4STQa96x5MS/8WhUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H81aqAeA; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3628a233510so6367781fa.3
        for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 07:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760968955; x=1761573755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gJp2fBpcjCusutwlkqxT9oQcDrmYwLlKVvwo/QslnqE=;
        b=H81aqAeAfinwSthPoonv2Sh07WUvAm0Rxlfpzf8pKBiKjYEoQlRw8Hete9721uSY8I
         4T8QufPmQIeifh3YN7g7kmk+bd3ujHC2S8T0dOll42413B/qCChdiNEPJDqaQznmAA5Z
         TuU/tGo4Vv1i4DHYrXv9cqjgCX8ybx7ZBatE/59kDi4M4UwYU/VfwynWHvG0/OQQ9ii7
         UHDVQqO8QtuCXM+Y9H3KYf3HjPMXaZp7jATwPShOb/EvowowZq27r/by4MbeMzzf/nWh
         VtaoGEkBFOQwvWcK8hvVloV154Aa8Kyv/6+Dat7NURvizgEvpbFiCHOGpYgtsseNKl3k
         AU9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760968955; x=1761573755;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gJp2fBpcjCusutwlkqxT9oQcDrmYwLlKVvwo/QslnqE=;
        b=oNe+nKDksX/JA+RgYUgLTRhlK3CB5pGsT3dsVC2hCQZ7IvJDXvweRqJuIkG1iZl3QX
         UhxWbdAVE3Y7hOKxnXtDEtib58ZXQywtPaQO8af6dBovulPhAwT+MUOKbtD5GNIjJR7j
         mZxcX/4UwDxA18m6CQd+aP9SsWmNZ0ARCk+p381YaMn5iShhFeaGJQ3NyJAKVPhjJ9EI
         HKaHj9rPsFPY9Krr/sFu0ij0AcYujgJw88rHMGv2TO1ZhQ7UxXCGeg38rQpvurgDsfLP
         Ox6GoG1514K3XXMpxfcsSYklQkmx4TeCU2BbRk7ME0ZAwtcxxB3qaAm57YPWd1aQrYZ2
         nLhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWtp9Ol4GYaTP1PSgoWaPSykuRldEWa1e2UK41Z9GJlIHxBY4IVziLrAT3pwQNdIFv/GdAXLO6LUQPEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzV4v4ht1gfiXfD/LzEX8jTnO3Yk7H00SEquWZwwFsYh3JY+urx
	qApDt8gjytWRPcvp04giIq/g8zlHfO33Jl2Zze6YKEY874bQeoR6oZuxJh988KLIpLc=
X-Gm-Gg: ASbGncsYq1SH/Am5jR3cK2yMbtyk0gPreI2LHymLtCT9u6/HGQ8nKDY8QHFC3DuYJCR
	H8uvUxCAJVBxaBzkYMWUmoLKSpGvcq6sda71R6mjLVpsf2ks4MEJ+Tqh/iPV434OiMBCOOhy79v
	Jurp6/QV3vKEAKAC695K2kf9zsOWreTaAKNhRns8EuKoptXyw9M3WVINbt496ZkmNlqzyJ/WUD2
	jyD2aSvcuhCFR66XpVUD/G+7v8OmYpwOK+zICG2ctIc3A8SNyR2TI+jbItUAsKn6dWj3up/dXEF
	RIefttaP8nIc8dQsmB4KzmAgOLrN31FxrvqIsq+DpmsnxGX0O7Y+XjOhYfc95WxjqrThwsmG+JY
	e+dX5wPEYRvb/Hco9+BFOig8Bkcjh/1LOQgj/DrWo7iSBjpBi6aQJm+vOjT9Pq6EMH7LqwvCP+3
	rjWzvstYU+BmW/diavTc8VNzLxemLNKznpTbKgdGdWI6Y=
X-Google-Smtp-Source: AGHT+IFjvGE/DY31KxTNTTPZ0VENUkE1XZO+/yrsdWZupnyulVF2s0a5bxHOzsTH96wXwt3npeo5Xw==
X-Received: by 2002:a2e:be83:0:b0:337:e43b:655b with SMTP id 38308e7fff4ca-37797767e73mr23794181fa.2.1760968954070;
        Mon, 20 Oct 2025 07:02:34 -0700 (PDT)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-377a9508d89sm22639131fa.37.2025.10.20.07.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 07:02:33 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH] media: qcom: camss: Do not enable cpas fast ahb clock for SM8550 VFE lite
Date: Mon, 20 Oct 2025 17:02:27 +0300
Message-ID: <20251020140227.2264634-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clock is needed to stream images over a full VFE IP on SM8550 CAMSS,
and it should not be enabled, when an image stream is routed over any of
two lite VFE IPs on the SoC.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2fbcd0e343aa..fc838b3d2203 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2561,12 +2561,11 @@ static const struct camss_subdev_resources vfe_res_8550[] = {
 	/* VFE3 lite */
 	{
 		.regulators = {},
-		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb_clk", "vfe_lite_ahb",
+		.clock = { "gcc_axi_hf", "cpas_ahb", "vfe_lite_ahb",
 			   "vfe_lite", "cpas_ife_lite", "camnoc_axi" },
 		.clock_rate = {	{ 0 },
 				{ 80000000 },
 				{ 300000000, 400000000 },
-				{ 300000000, 400000000 },
 				{ 400000000, 480000000 },
 				{ 300000000, 400000000 },
 				{ 300000000, 400000000 } },
@@ -2583,12 +2582,11 @@ static const struct camss_subdev_resources vfe_res_8550[] = {
 	/* VFE4 lite */
 	{
 		.regulators = {},
-		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb_clk", "vfe_lite_ahb",
+		.clock = { "gcc_axi_hf", "cpas_ahb", "vfe_lite_ahb",
 			   "vfe_lite", "cpas_ife_lite", "camnoc_axi" },
 		.clock_rate = {	{ 0 },
 				{ 80000000 },
 				{ 300000000, 400000000 },
-				{ 300000000, 400000000 },
 				{ 400000000, 480000000 },
 				{ 300000000, 400000000 },
 				{ 300000000, 400000000 } },
-- 
2.49.0


