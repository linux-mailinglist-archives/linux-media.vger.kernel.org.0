Return-Path: <linux-media+bounces-16205-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8824A950502
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 14:32:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A205282E79
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 12:32:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4595219B3D7;
	Tue, 13 Aug 2024 12:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QMn15TvD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F610199EAC
	for <linux-media@vger.kernel.org>; Tue, 13 Aug 2024 12:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723552293; cv=none; b=QYNCYC/mtV4HbMj4ZbJfs7xTcLBZkZDt7AK7l70QcaJbF/hMGeRVWZ5G3uYVY4g3st9DMgG/oaggxG15rsNmzoHPwhmEEO8d22GZl5DOKU+zVb+7SzhjRKPQwTlnT1wa2k+DLSxkeJdmrUBGpkzYaV4QfpylXCCki8ncscgcpVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723552293; c=relaxed/simple;
	bh=ZL1NQsUr+liQywEoPKyXYweeFBwJ9jb0tSJpH+9ycBc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=he5jeQw9TzbAHumhqqbF8IF8+hIJr7D6yWSLu2tK/wkE7wdFy89TpyhMTaGT7PMsayB8oBlu6inxdJFdc5Z2F5Z8PbdX7r/o7Zc7rt5Ev9JERbG3vO/tZqO+UgPln/XPTBmazvUzfbzVC8XsUGzFtHb/0CWhSD9L7treMeOIGLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QMn15TvD; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6b95b710e2cso34936226d6.2
        for <linux-media@vger.kernel.org>; Tue, 13 Aug 2024 05:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723552289; x=1724157089; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SPUEi7uFjzY/rlu/HW/qtzhNgJ8EHrsVhU1gvPc5vvQ=;
        b=QMn15TvDv7mlw3QTOAGW/Y5rko3pr7VharwKEr86efGIgyVGIOIi++LbfDZTDGW2IX
         hYsKDB/xGqqZ48QJRuxU3dhXT3iBbSM6zNyYL/P/LGlxHkYh6elIGHo8EIEH+zPDnCZR
         6KKC5Z24qfC5SuEqTDuPkcjKlljfWQidAdaxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723552289; x=1724157089;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SPUEi7uFjzY/rlu/HW/qtzhNgJ8EHrsVhU1gvPc5vvQ=;
        b=iKv2C5x7R0v1LtYaZBwAgaBK1CxJ9qb3ZSkGn2nwEHkuOF/tqMcyYg3TGQZo3tQgXF
         nDbDe/eEyjruhncDf3KVAaAuIZpbHxVjdNDk3AWyOjdFH5E6X0n1J4+LS7qayF86VejA
         0JF79pBTKlqKuQ+pFvEHHX3TLg4b+1piht7PTS28K5dsQzVfitWYSxZyDFvV/dFxpN1G
         Yas6AE4Xjz9s+JV8ldhS5KHxYiELQb3NFf4ZfbQUCgE3spDDyROKXcUhKUXDqf3sE2YW
         yCk7sUGTvL7bkxfanX9o+qTozsWuV18cjXVPX86l4e6NQ9hWKVKL9o7C/e5KzL+vTAV3
         m+Ew==
X-Forwarded-Encrypted: i=1; AJvYcCVh7KCp28r6EfVsqNHKtaEFaBHzJIwV3WMkkJ9LVloJdpkxIS3Nqlf4HUytsyHOvZHXoYfuuKqpwrGOoDPKI6Y5u+Pf2lQE/p/1KwQ=
X-Gm-Message-State: AOJu0Yz5v9KTYMqpK39SBSKsljlR8RGbLZ7eymy7drrZvX11Csd2zwIo
	K2yGBSRA6NL280vD0Flw4YK2+VOuSrTbeINVyhmeXCeI+FGMEKKDy+GG6FaGCg==
X-Google-Smtp-Source: AGHT+IHWcYMugnNAohBPlXl4Q5k2szXJLte2T2nQmFxv7LgGGp8+7SOgzgt3nTX3WjhN51/yObzS/g==
X-Received: by 2002:a05:620a:3193:b0:7a1:d022:a3ae with SMTP id af79cd13be357-7a4e15b9c43mr381001685a.56.1723552289433;
        Tue, 13 Aug 2024 05:31:29 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4c7d66093sm337126685a.12.2024.08.13.05.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 05:31:28 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 13 Aug 2024 12:31:23 +0000
Subject: [PATCH v6 03/10] media: venus: Refactor struct
 hfi_session_get_property_pkt
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240813-cocci-flexarray-v6-3-de903fd8d988@chromium.org>
References: <20240813-cocci-flexarray-v6-0-de903fd8d988@chromium.org>
In-Reply-To: <20240813-cocci-flexarray-v6-0-de903fd8d988@chromium.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

The struct hfi_session_get_property_pkt is always used to fetch a
single property. Make that explicit in the code and avoid a single
element array at the end of the struct.

This change fixes the following cocci warning:
drivers/media/platform/qcom/venus/hfi_cmds.h:194:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/hfi_cmds.c | 4 ++--
 drivers/media/platform/qcom/venus/hfi_cmds.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.c b/drivers/media/platform/qcom/venus/hfi_cmds.c
index 3418d2dd9371..75f4a3d3e748 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.c
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.c
@@ -402,7 +402,7 @@ static int pkt_session_get_property_1x(struct hfi_session_get_property_pkt *pkt,
 	pkt->shdr.hdr.pkt_type = HFI_CMD_SESSION_GET_PROPERTY;
 	pkt->shdr.session_id = hash32_ptr(cookie);
 	pkt->num_properties = 1;
-	pkt->data[0] = ptype;
+	pkt->data = ptype;
 
 	return 0;
 }
@@ -1110,7 +1110,7 @@ pkt_session_get_property_3xx(struct hfi_session_get_property_pkt *pkt,
 
 	switch (ptype) {
 	case HFI_PROPERTY_CONFIG_VDEC_ENTROPY:
-		pkt->data[0] = HFI_PROPERTY_CONFIG_VDEC_ENTROPY;
+		pkt->data = HFI_PROPERTY_CONFIG_VDEC_ENTROPY;
 		break;
 	default:
 		ret = pkt_session_get_property_1x(pkt, cookie, ptype);
diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.h b/drivers/media/platform/qcom/venus/hfi_cmds.h
index 42825f07939d..b158fcd00dd6 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.h
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
@@ -217,7 +217,7 @@ struct hfi_session_resume_pkt {
 struct hfi_session_get_property_pkt {
 	struct hfi_session_hdr_pkt shdr;
 	u32 num_properties;
-	u32 data[1];
+	u32 data;
 };
 
 struct hfi_session_release_buffer_pkt {

-- 
2.46.0.76.ge559c4bf1a-goog


