Return-Path: <linux-media+bounces-11024-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B26128BE3F9
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 15:29:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D39701C23460
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 13:29:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFD0416F833;
	Tue,  7 May 2024 13:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AZ9ltb3I"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359E216F29C
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 13:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715087928; cv=none; b=InsfOh1K5pWjcYE+cbHDj9urvT3rxPMlGmcn9ouNCa7tzNlFHYF+0lE1vrmD506ZrTVOJgIe4nuSz+Cok91HYP7BlaV4cJ7hMeahx8g9uolx4BKZ7Y3rM46E5HR3To62Ab0mebWSE1HFV3ugQJFRU2awn4UCZQq3epHDgOQIUlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715087928; c=relaxed/simple;
	bh=P3Bstv/vPDiw+M+/G70Utl3bAIKOevXPnXzJX41+MtM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YvhUvttT3zM22cZ340rXOoFXIgMl934rwWEIQNgGOiyeDkNA6606idKfi4mQJGf6KA7nQ6+oUGyU45u512XoLhzRwYmiJbHOsLs0rBaNwVHqS0UBnaYY0dlcEl9puRWu8MTqBxAKO8akwNTT06cqNaEkgewwMYLQf850fYyC6d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AZ9ltb3I; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-79291d441fbso286968785a.0
        for <linux-media@vger.kernel.org>; Tue, 07 May 2024 06:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715087925; x=1715692725; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AxOzymIGy9oIqpVIjgGXcOBfnvf3rPmoINBWnjxn4+k=;
        b=AZ9ltb3IB86//wjqAH7/jpArg1gKvlnnLw7s02NXnOtuJVXBWw7kooU45uZcNHklBd
         aK1pD4AXZnXMMGAv5kdV2vRa6gjO5ckfFFKqygzSku65tfhXBWoSHHN07jwtrr32lHe3
         exseckclPfoZlET2o8NH98/Ha8qaJQFh8sXNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715087925; x=1715692725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AxOzymIGy9oIqpVIjgGXcOBfnvf3rPmoINBWnjxn4+k=;
        b=PeIIZTWElNlEg9M89a/WY+pdUjdHVCMSjhVKlyWfy/8OJ7J/CFSV6BFmXqhHAlUpjk
         XFgjorv/PPJ+QpexRW7mVgiGiFS3rURssPSZqOIOnLI9aBbG4wfzkNPLbToXs3HkOmxP
         F2RDDyCMvUdgKRwnAi9pbtVRW978MpbtC47SjzcXk70ZBo5qJ0PNUH1EBSCKG/uZxX88
         I6khXydzyEaVsxNCp8YztTNjLQ+cfu4wQfGFbti0O2nrHoAGYtmDlWgiAxmgM3e2U6pJ
         5O5QBqz9iDPg7IMP46k3rX4gkJkvAhlHlIfxeEtlfrYcQfUCJAgbjAPpKNDNgdYR4t3t
         IPVA==
X-Gm-Message-State: AOJu0YyuWebNbebRmL4w3WkWJQ+HK+WcqekUzqksmSyBrZ3hYbshdB0K
	ES9t4ZInmT/U0oRcgJg8xFvHMWaVDqf2LZHXg5MA5FMjIsYoLWQxTLJtY7+h5g==
X-Google-Smtp-Source: AGHT+IFjQZjYTO14egmCt9EZ5CsVr4euVVQfMTbFSXKPd+8yhvIiVkrVYxti26YpbA+ubiSl4OVazw==
X-Received: by 2002:ad4:5fcf:0:b0:6a0:cb53:a78 with SMTP id jq15-20020ad45fcf000000b006a0cb530a78mr15569643qvb.8.1715087925149;
        Tue, 07 May 2024 06:18:45 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id t15-20020a05621405cf00b006a0d19c3139sm4655105qvz.118.2024.05.07.06.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 06:18:44 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 07 May 2024 13:18:42 +0000
Subject: [PATCH 16/18] media: venus: Refactor hfi_sys_get_property_pkt
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240507-cocci-flexarray-v1-16-4a421c21fd06@chromium.org>
References: <20240507-cocci-flexarray-v1-0-4a421c21fd06@chromium.org>
In-Reply-To: <20240507-cocci-flexarray-v1-0-4a421c21fd06@chromium.org>
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

This struct was only used to get the version from the core. Make that
explicit.

This fixes the following cocci warning:
drivers/media/platform/qcom/venus/hfi_cmds.h:77:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/hfi_cmds.c  | 6 +++---
 drivers/media/platform/qcom/venus/hfi_cmds.h  | 8 ++++----
 drivers/media/platform/qcom/venus/hfi_venus.c | 2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.c b/drivers/media/platform/qcom/venus/hfi_cmds.c
index 520ff8a587e6..c5123f2e76fe 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.c
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.c
@@ -151,12 +151,12 @@ int pkt_sys_ssr_cmd(struct hfi_sys_test_ssr_pkt *pkt, u32 trigger_type)
 	return 0;
 }
 
-void pkt_sys_image_version(struct hfi_sys_get_property_pkt *pkt)
+void pkt_sys_image_version(struct hfi_sys_get_version_pkt *pkt)
 {
 	pkt->hdr.size = sizeof(*pkt);
 	pkt->hdr.pkt_type = HFI_CMD_SYS_GET_PROPERTY;
-	pkt->num_properties = 1;
-	pkt->data[0] = HFI_PROPERTY_SYS_IMAGE_VERSION;
+	pkt->one = 1;
+	pkt->version = HFI_PROPERTY_SYS_IMAGE_VERSION;
 }
 
 int pkt_session_init(struct hfi_session_init_pkt *pkt, void *cookie,
diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.h b/drivers/media/platform/qcom/venus/hfi_cmds.h
index 02e9a073d0c1..cd7902743f62 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.h
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
@@ -71,10 +71,10 @@ struct hfi_sys_set_property_pkt {
 	u32 data[];
 };
 
-struct hfi_sys_get_property_pkt {
+struct hfi_sys_get_version_pkt {
 	struct hfi_pkt_hdr hdr;
-	u32 num_properties;
-	u32 data[1];
+	u32 one;
+	u32 version;
 };
 
 struct hfi_sys_ping_pkt {
@@ -239,7 +239,7 @@ void pkt_sys_debug_config(struct hfi_sys_set_property_pkt *pkt, u32 mode,
 			  u32 config);
 void pkt_sys_coverage_config(struct hfi_sys_set_property_pkt *pkt, u32 mode);
 void pkt_sys_ping(struct hfi_sys_ping_pkt *pkt, u32 cookie);
-void pkt_sys_image_version(struct hfi_sys_get_property_pkt *pkt);
+void pkt_sys_image_version(struct hfi_sys_get_version_pkt *pkt);
 int pkt_sys_ssr_cmd(struct hfi_sys_test_ssr_pkt *pkt, u32 trigger_type);
 int pkt_session_init(struct hfi_session_init_pkt *pkt, void *cookie,
 		     u32 session_type, u32 codec);
diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index f9437b6412b9..745c2c0c0d55 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -1142,7 +1142,7 @@ static int venus_core_init(struct venus_core *core)
 {
 	struct venus_hfi_device *hdev = to_hfi_priv(core);
 	struct device *dev = core->dev;
-	struct hfi_sys_get_property_pkt version_pkt;
+	struct hfi_sys_get_version_pkt version_pkt;
 	struct hfi_sys_init_pkt pkt;
 	int ret;
 

-- 
2.45.0.rc1.225.g2a3ae87e7f-goog


