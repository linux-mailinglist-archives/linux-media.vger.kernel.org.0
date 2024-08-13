Return-Path: <linux-media+bounces-16206-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7675E950508
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 14:33:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74A401C21294
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 12:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2F7919D095;
	Tue, 13 Aug 2024 12:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gPowbZqF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DB619CCE6
	for <linux-media@vger.kernel.org>; Tue, 13 Aug 2024 12:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723552295; cv=none; b=rvbPfj1+pREWlOBW4X4Ymzacu1asqoJaqX0wj0pwSLLO6MCA88rNBegPUvDQIJ5mMJAVZen6JS/3xReEVaslLghQAIxUU+Vr8tV/NkuRlOaJlQnDKXHCrq/NRIrcJbm9PyHg7kaoCuLojtiuIPtMX2TKV3LDF0vuRHiywQWTVtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723552295; c=relaxed/simple;
	bh=pg9ToY3eZZPX52hwA+vpBAJrwr/I05JuqPkuqgNqkes=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H8t3CJanAeEg8L3ajvhxHL25b+Iq/dlMwEsbhzFrGlwklkgcXGf7TaH1ZSvI+l+LyqqstzSEKQfM6LxoHS1p+r19apKhpXDGjlHyaNSxHGg3509XMVYg2f+17aP9NnNo2ePKvnNTT7HQ+AqrjAuNz4/j5oWvBBZnNfvDbg6k2jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gPowbZqF; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-820f047c4e4so1846567241.0
        for <linux-media@vger.kernel.org>; Tue, 13 Aug 2024 05:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723552291; x=1724157091; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PD7uAa+iA+SJ/l3ATpDCq2SdEEBJK/PvJJHcjFH/M0o=;
        b=gPowbZqFUylKRiyV2nH7DSRqKYL6BFDUh9T9YVYglwSFuunFrAh2C36kZCUa++p75D
         eYVUXrkFu71DRvN3fouKLwqLBgjcqUU+4UB4JYBKZvNFglVUsKVTe+9NgoXHgxbD7wQt
         oAf+VmN/E9BKBIHqn+W96ZFaOmFuhhNynRDvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723552291; x=1724157091;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PD7uAa+iA+SJ/l3ATpDCq2SdEEBJK/PvJJHcjFH/M0o=;
        b=ndBwTB3+m/lL0iGYTTxF+o2Rcg0ERe9D5pWAtZYVc8UWuEFmQUc48e9cRiaXfr6IQl
         WluA/15z9wN9QPngdL2+3+eSCStQpBDmu06A7eYJj+3VzF5NNUEqYByPb0EoELn7SEia
         b7lLGo+cOH/mNtDZBbfmSY257M2f/9LbTtwFyyX0Muhk8t+sj7/2odGjNajR9+bydkc+
         VAq7c0rnZmBnRq7adTivr1Ha64aBGrFpSChZm3KmSVXdHGIhxCknAM1lMeNQz+OKj+/p
         xceUCOxkTBSUoMDsuxUG+NU0U4GLqUZaB92X+T4zBYSgtQ/WC5bgaamdzYoEUuLlD64w
         4gtw==
X-Forwarded-Encrypted: i=1; AJvYcCXq3ycA7npsz3RG2kxSTnKizsu/JeMRC0jzY+NWsCVAllYuv3GNjPHMnYgECrjiB1IN3ObZoGRyEtzE9YxgQwY1pyEDSSX5nln7VPY=
X-Gm-Message-State: AOJu0Yz8qIn9VWCda6aAoOeMgCP19UYEEd4a1+VbwU3KM3DxzNw8lhoY
	D0yEjPCaaX6cEaOqSHJCWQLiXLW56GkhZQAsNt72hIDGIyZSY14k5Vm59Qz5cw==
X-Google-Smtp-Source: AGHT+IFVb/FCO4zojDS37rQuslFijZLZCXUsY63IfMRU3vxtSFRIIMGWvVO1eWkt+coPhL2FV4eZdw==
X-Received: by 2002:a05:6102:370d:b0:494:10af:2bc8 with SMTP id ada2fe7eead31-49743ae9e3bmr3816743137.24.1723552291444;
        Tue, 13 Aug 2024 05:31:31 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4c7d66093sm337126685a.12.2024.08.13.05.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 05:31:30 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 13 Aug 2024 12:31:25 +0000
Subject: [PATCH v6 05/10] media: venus: Refactor
 hfi_session_empty_buffer_uncompressed_plane0_pkt
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240813-cocci-flexarray-v6-5-de903fd8d988@chromium.org>
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

The single element array data[1] is never used. Replace it with a
padding field of the same size.

This fixes the following cocci error:
drivers/media/platform/qcom/venus/hfi_cmds.h:163:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/hfi_cmds.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.h b/drivers/media/platform/qcom/venus/hfi_cmds.h
index b158fcd00dd6..01f5463e0fa2 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.h
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
@@ -168,7 +168,7 @@ struct hfi_session_empty_buffer_uncompressed_plane0_pkt {
 	u32 input_tag;
 	u32 packet_buffer;
 	u32 extradata_buffer;
-	u32 data[1];
+	u32 data;
 };
 
 struct hfi_session_empty_buffer_uncompressed_plane1_pkt {

-- 
2.46.0.76.ge559c4bf1a-goog


