Return-Path: <linux-media+bounces-16288-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCC2951A15
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 13:40:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 408D71F21F2E
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 11:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 668531B142F;
	Wed, 14 Aug 2024 11:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CM9vDk4e"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FEA1B011B
	for <linux-media@vger.kernel.org>; Wed, 14 Aug 2024 11:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723635572; cv=none; b=nX+Unq3pqvsc4GQZW+8LIEN6GCfR9pCsZ4kjx6volQXGC1AIv5nx5Rw8iWsfb2/2RVNHfuc4b/iMeNyNB59lyxYWH4fvWTq/bjAOG8FaZVFqpAj0JlFjcMPtNn5CV9OgfBW8qpsFSR66+ilR855wvlOq54I4vk3qXJ1euVTJOAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723635572; c=relaxed/simple;
	bh=+fyewBEAHwhWWYY8SehenMG7FUCiXBxuJ2SmDJj7qtw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=btOn/4ZzwMEKRHEAa2bg2oaZTG0bo55ys+f94IKxNvJRiP+qXFRJHdAZossLDRq92mTRdTIJpy9CVnwxRmagk6kTHwFK1LOCFhFT94PG4QMuFaJlKmsCstUt9q8/00usI+kVTwBKzxKi7K/jVwB8M8dlzP9xUpvusuBDkiNaIeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CM9vDk4e; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6b79293a858so34771556d6.3
        for <linux-media@vger.kernel.org>; Wed, 14 Aug 2024 04:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723635570; x=1724240370; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dW6BndWIicgTEOdzqt9NbfZI8whTCoSZbzVH2/mWmSw=;
        b=CM9vDk4eDQ38IQrHnf+iMZkTAdKLqFObh0EuF0LC8hHmVaUCQYhrVhjsViXNZTTugD
         8uqYmzvXxnT5z1i6AaRAJv5frhtvD50N875HgRHy7aO0MVcV7lHGfVEBn+6j3l6qzbUD
         ueu6p0GWgUYOFxdwee6AS43g5yfCjzQj10Azk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723635570; x=1724240370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dW6BndWIicgTEOdzqt9NbfZI8whTCoSZbzVH2/mWmSw=;
        b=lh4jK6/0UHXFyuhwxZyjBX5uxlYwVk9/sP8US1gVkSSyO9jF3IEfqHbZgBA+1VQvVg
         nM10f16GXolXqn5B/80mXqcTwztbnpDzxYA3dvYQ3kY3z4olaJu4LUujC+9wsySbDWxA
         ug6lOvBcvQ54DjfPLe6jPM+w8x2OgfreJiptBKqQeG7qZTZezJEVERJ0qYJYTM7GZU5d
         HzmsHauW+CvXEPEu45eZFH3WDyV8b8RATw2pDStXyujhEldeZCsz1mOP8RQrcxxmvI8u
         MXbM4ZXcTc/4jpJcQGLJ479TBMCwUS+kcfDeqBjtHYyjjs5EfVU/oLK/Cd44AyZkzmWd
         D4uQ==
X-Forwarded-Encrypted: i=1; AJvYcCV44oYyM6wJTvpB9X6vE3HKvQSpMWpoyR7w/mrofn+01cdkFUbXxFI6awAd1PaXucb5khTffJuZk3arrXM1+KeFTtWsrLEAEzY5Xfg=
X-Gm-Message-State: AOJu0YwFtzNMj0uwdG7NjwAYOKYC/CvmCB3Ha/44YxqIA6yUPEz+1/J8
	UJGZFi4Y8N8AaSpZy15lRssQ9KFkf0Zry36BiAxKeriZ0ZgKRV6JhsD82Ipv7w==
X-Google-Smtp-Source: AGHT+IFccd54QpZdtUkOZ8WHMkTHK/5uPBl6nsQyxjAc07rfGvSQX4JwOVC5B7G3kyUqPv1fefszAg==
X-Received: by 2002:a05:6214:2e46:b0:6b5:d663:bb53 with SMTP id 6a1803df08f44-6bf5d15903bmr32696476d6.5.1723635570044;
        Wed, 14 Aug 2024 04:39:30 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bd82ca0daasm42167916d6.68.2024.08.14.04.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 04:39:29 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 14 Aug 2024 11:39:23 +0000
Subject: [PATCH v7 03/10] media: venus: Refactor struct
 hfi_session_get_property_pkt
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-cocci-flexarray-v7-3-8a1cc09ae6c4@chromium.org>
References: <20240814-cocci-flexarray-v7-0-8a1cc09ae6c4@chromium.org>
In-Reply-To: <20240814-cocci-flexarray-v7-0-8a1cc09ae6c4@chromium.org>
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

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
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


