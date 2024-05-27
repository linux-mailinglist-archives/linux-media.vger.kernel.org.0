Return-Path: <linux-media+bounces-12036-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6614D8D0F27
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 23:12:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98DF71C211F1
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 21:12:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D689016C854;
	Mon, 27 May 2024 21:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SIgGiWAm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF9C16B75C
	for <linux-media@vger.kernel.org>; Mon, 27 May 2024 21:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716844151; cv=none; b=Fp1THV9rU7Vg5Ly9HzAz2M75lyYL+Tp9OuqNG7p8hjbU/pEKzjD45B9gAsf3zPdWKSu4lX+DbYvR4wAQp4ijtgj3KPNtjfk5Jpmih/RrexHX1TWJQUa7w64JFRCejs7MGnxi7Dv2PKzMcesrTxhKa9O49a5/EyA9SnldYyDYP8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716844151; c=relaxed/simple;
	bh=YTzf7p9jPjImSwT7T/FubIWDNPXlqDUQZ9SE9jMD+/s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jX38k3DanLktaLh5w7C0nf2udy+RZ9J7Nj4VeT7BaOoaLYs4zKdLZrkPniPTxK4yT3H12mrEHmUoaa/v5LTF/tpfwLpUWY3BZE4xfcazzic22hYVi/sCCqdOEjHbrLm4eLxiN1Aa4YQCvAASnTmo31NOmyzrYKo0xwQN1KHeP/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SIgGiWAm; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-794ab13bb88so13589785a.2
        for <linux-media@vger.kernel.org>; Mon, 27 May 2024 14:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716844148; x=1717448948; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5cEAIpCHBHS4CpppuQZOsAxg9IlPyhk1N0Yb+SULR3M=;
        b=SIgGiWAm6Ptk7/DNq0J8FqDLOmuHfZf4Ak/X0ClCQe5RTnjb3l+PkeCf/Vsf6vJQoY
         xjhSIJs7utvCgigjQlVJzIEIKMU/pGJdfwEbuMjOVGpCU2zB0CeAIyJRNgTp8ihl3Z3b
         KWOZN7PYfBzXdlMXaqvF6Ej4PIepCxYrr9Dys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716844148; x=1717448948;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5cEAIpCHBHS4CpppuQZOsAxg9IlPyhk1N0Yb+SULR3M=;
        b=b0Dz8j+ef6a+TYuboSsj2Q5hHgxF8GIZ3IQBWL9jpKc7hidXkmEuC0ifGCuaJ6TEaJ
         6JtXoThRjhNMCPn9i3+CBUXXBCXWsuVD1rWSA07sL0qgqm3ACd+v2IMXw/JC5u6t9nri
         totolSXEa0uhfotNdGagBujpT/gcuOpRhBqW/RKxcE4wepnyXK/Yrx80HM+VuqbUEeY6
         FSNdfK9kEDiHUx4lh+bv54UgPzYr+TF78NUoZS4t9rta8pr6k2gobWn4QOAH19YjPWGb
         V+BLp3G1VyIXuAoPsDrBaEv+Ax+qEzPUfLmwtGustDDNJlfLMvb6woW/gX3rxU1XnZKA
         6wHw==
X-Gm-Message-State: AOJu0YwGHSrKC2X/kyEPzegMKs+YnwZKLmG32msG26sJv8iCfJ8iakAr
	PyYC6jurvOdzvJmMAWDJeKMF2oOuouehpPMZZLf0n5wV72SRVxz+2oUqi0Scow==
X-Google-Smtp-Source: AGHT+IGAYysdbshm47o1LkG9bleprTOKR64YuuW5s31mQTt68Az23X2+n4bKsIArHsfPK4uZOPlyMw==
X-Received: by 2002:a05:6214:9d0:b0:6ac:710:3ea2 with SMTP id 6a1803df08f44-6ac07103fc7mr82965526d6.6.1716844148230;
        Mon, 27 May 2024 14:09:08 -0700 (PDT)
Received: from denia.c.googlers.com (125.135.86.34.bc.googleusercontent.com. [34.86.135.125])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ad850a6dc7sm9511866d6.93.2024.05.27.14.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 14:09:07 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 27 May 2024 21:09:03 +0000
Subject: [PATCH v3 13/18] media: venus: Refactor struct
 hfi_uncompressed_format_supported
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-cocci-flexarray-v3-13-cda09c535816@chromium.org>
References: <20240527-cocci-flexarray-v3-0-cda09c535816@chromium.org>
In-Reply-To: <20240527-cocci-flexarray-v3-0-cda09c535816@chromium.org>
To: Michael Tretter <m.tretter@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>, Andy Walls <awalls@md.metrocast.net>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

plane_info is not a typical array, the data is not contiguous:
pinfo = (void *)pinfo + sizeof(*constr) * num_planes +
	2 * sizeof(u32);

Replace the single element array with a single element field.

This fixes the following cocci warning:
drivers/media/platform/qcom/venus/hfi_helper.h:1009:36-46: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/hfi_helper.h | 2 +-
 drivers/media/platform/qcom/venus/hfi_parser.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
index eb0a4c64b7ef..dee439ea4d2e 100644
--- a/drivers/media/platform/qcom/venus/hfi_helper.h
+++ b/drivers/media/platform/qcom/venus/hfi_helper.h
@@ -1006,7 +1006,7 @@ struct hfi_uncompressed_plane_info {
 struct hfi_uncompressed_format_supported {
 	u32 buffer_type;
 	u32 format_entries;
-	struct hfi_uncompressed_plane_info plane_info[1];
+	struct hfi_uncompressed_plane_info plane_info;
 };
 
 struct hfi_uncompressed_plane_actual {
diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
index c43839539d4d..3df241dc3a11 100644
--- a/drivers/media/platform/qcom/venus/hfi_parser.c
+++ b/drivers/media/platform/qcom/venus/hfi_parser.c
@@ -157,7 +157,7 @@ static void
 parse_raw_formats(struct venus_core *core, u32 codecs, u32 domain, void *data)
 {
 	struct hfi_uncompressed_format_supported *fmt = data;
-	struct hfi_uncompressed_plane_info *pinfo = fmt->plane_info;
+	struct hfi_uncompressed_plane_info *pinfo = &fmt->plane_info;
 	struct hfi_uncompressed_plane_constraints *constr;
 	struct raw_formats rawfmts[MAX_FMT_ENTRIES] = {};
 	u32 entries = fmt->format_entries;

-- 
2.45.1.288.g0e0cd299f1-goog


