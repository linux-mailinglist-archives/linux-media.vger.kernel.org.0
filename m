Return-Path: <linux-media+bounces-45497-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 85338C063BB
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 14:25:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F5D23BAE33
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 12:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC55A31814A;
	Fri, 24 Oct 2025 12:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="mN+fhDLv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17E03164C3
	for <linux-media@vger.kernel.org>; Fri, 24 Oct 2025 12:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761308669; cv=none; b=EbYz1R/vG/5LRzyGCA+b5PCV2yfDv0VIJcCEdT8ViH4Eg0tx79h80V/Bj+soG4WdbxQ8fL6tPCKxB7sEBp8OY2BxL7A96b/YUgQfFwVJCvIIyEp4WwaWM0/ZMVfFcr+qkZ9nJph4xqgiHs7Im0+J/K7G/Q7EuGk8kc9VuJy56Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761308669; c=relaxed/simple;
	bh=vGTb3BL1J9thwTvI0MrCHJROdyGcGXv+mxWeuGtI9Bs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tmbNgO1NrZBhpFRTx3D9n1wmWeOrwon4FRIOlzgOC0KEpnXxpLFZ5/UE/tIU+f1kUJx+5+vUZO4u3vxPlqbAmmlA+eaIcAXJyuZAPQO5vaEnCCV77ljM8Cy3x3GJXxDlH0FWO1zBO+50aHZm5ka3vlAd0R2Uqh05dU0Y/XKURPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=mN+fhDLv; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b3b3a6f4dd4so406493866b.0
        for <linux-media@vger.kernel.org>; Fri, 24 Oct 2025 05:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1761308665; x=1761913465; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5pJmy4lVL9gGRUhGQQf0c/GKuCgm0PZANnLIGInO6iw=;
        b=mN+fhDLv/AIjiqsBFaX+54BFnYWK2owt7E9xSdZOduV4r41JESovutOlIPlON5XcRP
         6+1sXVnz5XDdN6KKhmarTut2axVCdE7KuLusC5WgF9ix8VGjPQZ8mgjc37VKShE889rO
         WkX1L96vZWtCN5EC8oDXrwUEf1G23vT9erFsLbNFzZkKq5EfLAWUqWAmF9dRNz7Z0HKV
         oDhBHthW+CfEc55aTk5TCu9qlqS7HJh0MPZl6qlcXMVQJ+cBYB1e9pQi9VhQoMI7MFdD
         F/LJEACK27D03h3ftE0HHepZ7L27LLMlQaStG9LmpmIGX7JmtYYsFqE+4HHYmupJ89VH
         9dMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761308665; x=1761913465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5pJmy4lVL9gGRUhGQQf0c/GKuCgm0PZANnLIGInO6iw=;
        b=ErWkZ/6OddHXkOzxxVw1lfY1Vv06sBbWC1+JL5VFFxgKl/GsMFuVOVti9wzPmW5xxS
         vxPjx2r80wOoYR3E8EuNJt9syR7xaz2v2L0YFUzhKkwDixDvRwsO1cnsAdD1K9pyvx5l
         zTGVJcsWE2fMqPa1L515KknbSxVrUP1cZPVs5YNNTl58P0OLr9CKP6z062vMVxtD3qGZ
         RaPS9woxMRxgnOrhI9M2mQG1OqOuXRkOsRDLR4QDgiTmlQpJzDDqBtuy7ImRCeVm/qxL
         znxrm6jZVH5nFW9HewHo0ZP1MQmYDkUsO/xLYuaN2nA+8Wu1bdLaM6wZX8g4l1BjDMlr
         DKEg==
X-Forwarded-Encrypted: i=1; AJvYcCWfMDD/r9PDjuFjALIMKE43Mr1kkvG4Q5FznUDx7xU8TvHS4OwoVmZq9+plMPQoUZsoYwoOYv/qxB/s+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yze6ilOzHrJfsMy93d+0AOtQbSa2XX9Znu+MkkdOAID6hCHw85E
	uxQ0pZsfZL0ggkEB94P++WN63tpUzfvltKlKfGyCW/F5HHodtLnnv9o2JN9TbNqzhYQ=
X-Gm-Gg: ASbGncsgCm2CckkZyJxl4pvfT7VdSeCXKPK/A56wZfqRB6GNNiBj/oGij254fI1O/tp
	e9LHSI1CWToW+d1/ANDgYHkptUAlvsSIo1mbGvMm7e3LAcEhf2mwpArAoFBiJSLsFzEOUZWyoEk
	vvvT5rhp7O5B0E45MqV0o2QXScDhbufls8WcjvTi6vJAETDAtejhznZswSg1IqqzgYLef6o8XQC
	9VoAxVzJ5IXyNKA+1gsu14IanErrShYKOCtzEVAwexO5xlTJJklDD5W9fdY/2KNFqMRezBSw9Ty
	TjpPn49uL5xNTGClLyoWDrliyYa6PcwsAoW7kc97BjwcN4frWQFE6uz6nWlSbTEAC/LIUkWfxHx
	+q+4WlyBJy/vuerGEHyZYcT5qtBqQhbLS7MsxhAGMDpsfpg1SbFKgLlctOtJw6yeAkm+fiejfxt
	lVSC3aXwmqAROrXE3psdWdfKLoSKdKsklUjpEy1Pf3uH8eFg==
X-Google-Smtp-Source: AGHT+IEcfM7Lwhh3CoV+X4Ghm5UxddAsitfxAwhxFQ2GUci4UIxjSX5aRxfdczEp+5lUqfYkcS5iMg==
X-Received: by 2002:a17:907:2687:b0:b49:2021:793f with SMTP id a640c23a62f3a-b6d6ffed170mr225840366b.53.1761308664852;
        Fri, 24 Oct 2025 05:24:24 -0700 (PDT)
Received: from [192.168.178.36] (213162084087.public.t-mobile.at. [213.162.84.87])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d513199d0sm507233366b.37.2025.10.24.05.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 05:24:24 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 24 Oct 2025 14:24:00 +0200
Subject: [PATCH 2/3] media: qcom: camss: Add SM6350 support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-sm6350-camss-v1-2-63d626638add@fairphone.com>
References: <20251024-sm6350-camss-v1-0-63d626638add@fairphone.com>
In-Reply-To: <20251024-sm6350-camss-v1-0-63d626638add@fairphone.com>
To: Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761308659; l=15863;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=vGTb3BL1J9thwTvI0MrCHJROdyGcGXv+mxWeuGtI9Bs=;
 b=Qx5f5b1QiaPJJ+AnGHibYlLL/oYl5ibBTJlW7DuIslO4S5C5dnEgZpC1KtgCstARJkktueL0h
 0dhkTnOoNbADvHuLfpHmYWC4GNG89F041HIsVhDskBpSGVBM0mxeXhv
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the necessary support for CAMSS on the SM6350 SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 125 +++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 249 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 4 files changed, 377 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index a229ba04b158..3e44b0c8298d 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -398,6 +398,126 @@ csiphy_lane_regs lane_regs_sm8250[] = {
 	{0x0884, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
 };
 
+/* GEN2 1.2.3 2PH */
+static const struct
+csiphy_lane_regs lane_regs_sm6350[] = {
+	{0x0030, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0904, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0910, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0900, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0908, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0904, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x002C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0034, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0010, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x001C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0014, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0028, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x003C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0000, 0x91, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0004, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0020, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0008, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0010, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0038, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x005C, 0xC0, 0x00, CSIPHY_SKEW_CAL},
+	{0x0060, 0x0D, 0x00, CSIPHY_SKEW_CAL},
+	{0x0800, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0000, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0730, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C84, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C90, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C80, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C88, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C84, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x072C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0734, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0710, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x071C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0714, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0728, 0x04, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x073C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0700, 0x80, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0704, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0720, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0708, 0x04, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x070c, 0xFF, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0710, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0738, 0x1F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0800, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0000, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0000, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0230, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0A04, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0A10, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0A00, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0A08, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0A04, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x022C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0234, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0210, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x021C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0214, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0228, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x023C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0200, 0x91, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0204, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0220, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0208, 0x04, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0210, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0238, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x025C, 0xC0, 0x00, CSIPHY_SKEW_CAL},
+	{0x0260, 0x0D, 0x00, CSIPHY_SKEW_CAL},
+	{0x0800, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0000, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0430, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0B04, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0B10, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0B00, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0B08, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0B04, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x042C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0434, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0410, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x041C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0414, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0428, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x043C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0400, 0x91, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0404, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0420, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0408, 0x04, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0410, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0438, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x045C, 0xC0, 0x00, CSIPHY_SKEW_CAL},
+	{0x0460, 0x0D, 0x00, CSIPHY_SKEW_CAL},
+	{0x0800, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0000, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0630, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C04, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C10, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C00, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C08, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C04, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x062C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0634, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0610, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x061C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0614, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0628, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x063C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0600, 0x91, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0604, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0620, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0608, 0x04, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0610, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0638, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x065C, 0xC0, 0x00, CSIPHY_SKEW_CAL},
+	{0x0660, 0x0D, 0x00, CSIPHY_SKEW_CAL},
+	{0x0800, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0000, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+};
+
 /* 14nm 2PH v 2.0.1 2p5Gbps 4 lane DPHY mode */
 static const struct
 csiphy_lane_regs lane_regs_qcm2290[] = {
@@ -908,6 +1028,7 @@ static bool csiphy_is_gen2(u32 version)
 
 	switch (version) {
 	case CAMSS_2290:
+	case CAMSS_6350:
 	case CAMSS_7280:
 	case CAMSS_8250:
 	case CAMSS_8280XP:
@@ -999,6 +1120,10 @@ static int csiphy_init(struct csiphy_device *csiphy)
 		regs->lane_regs = &lane_regs_qcm2290[0];
 		regs->lane_array_size = ARRAY_SIZE(lane_regs_qcm2290);
 		break;
+	case CAMSS_6350:
+		regs->lane_regs = &lane_regs_sm6350[0];
+		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm6350);
+		break;
 	case CAMSS_7280:
 	case CAMSS_8250:
 		regs->lane_regs = &lane_regs_sm8250[0];
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index dff8d0a1e8c2..336838b1340b 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -339,6 +339,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 			return sink_code;
 		}
 		break;
+	case CAMSS_6350:
 	case CAMSS_660:
 	case CAMSS_2290:
 	case CAMSS_7280:
@@ -1989,6 +1990,7 @@ static int vfe_bpl_align(struct vfe_device *vfe)
 	int ret = 8;
 
 	switch (vfe->camss->res->version) {
+	case CAMSS_6350:
 	case CAMSS_7280:
 	case CAMSS_8250:
 	case CAMSS_8280XP:
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2fbcd0e343aa..3f6515d07af9 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1318,6 +1318,241 @@ static const struct camss_subdev_resources vfe_res_845[] = {
 	}
 };
 
+static const struct camss_subdev_resources csiphy_res_6350[] = {
+	/* CSIPHY0 */
+	{
+		.regulators = { "vdda-0.9", "vdda-1.25" },
+		.clock = { "csiphy0", "csiphy0_timer" },
+		.clock_rate = { { 300000000, 384000000, 400000000 },
+				{ 300000000 } },
+		.reg = { "csiphy0" },
+		.interrupt = { "csiphy0" },
+		.csiphy = {
+			.id = 0,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY1 */
+	{
+		.regulators = { "vdda-0.9", "vdda-1.25" },
+		.clock = { "csiphy1", "csiphy1_timer" },
+		.clock_rate = { { 300000000, 384000000, 400000000 },
+				{ 300000000 } },
+		.reg = { "csiphy1" },
+		.interrupt = { "csiphy1" },
+		.csiphy = {
+			.id = 1,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY2 */
+	{
+		.regulators = { "vdda-0.9", "vdda-1.25" },
+		.clock = { "csiphy2", "csiphy2_timer" },
+		.clock_rate = { { 300000000, 384000000, 400000000 },
+				{ 300000000 } },
+		.reg = { "csiphy2" },
+		.interrupt = { "csiphy2" },
+		.csiphy = {
+			.id = 2,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY3 */
+	{
+		.regulators = { "vdda-0.9", "vdda-1.25" },
+		.clock = { "csiphy3", "csiphy3_timer" },
+		.clock_rate = { { 300000000, 384000000, 400000000 },
+				{ 300000000 } },
+		.reg = { "csiphy3" },
+		.interrupt = { "csiphy3" },
+		.csiphy = {
+			.id = 3,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	}
+};
+
+static const struct camss_subdev_resources csid_res_6350[] = {
+	/* CSID0 */
+	{
+		.regulators = {},
+		.clock = { "vfe0_csid", "vfe0_cphy_rx", "vfe0" },
+		.clock_rate = { { 300000000, 384000000, 400000000 },
+				{ 0 },
+				{ 320000000, 404000000, 480000000, 600000000 } },
+		.reg = { "csid0" },
+		.interrupt = { "csid0" },
+		.csid = {
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID1 */
+	{
+		.regulators = {},
+		.clock = { "vfe1_csid", "vfe1_cphy_rx", "vfe1" },
+		.clock_rate = { { 300000000, 384000000, 400000000 },
+				{ 0 },
+				{ 320000000, 404000000, 480000000, 600000000 } },
+		.reg = { "csid1" },
+		.interrupt = { "csid1" },
+		.csid = {
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID2 */
+	{
+		.regulators = {},
+		.clock = { "vfe2_csid", "vfe2_cphy_rx", "vfe2" },
+		.clock_rate = { { 300000000, 384000000, 400000000 },
+				{ 0 },
+				{ 320000000, 404000000, 480000000, 600000000 } },
+		.reg = { "csid2" },
+		.interrupt = { "csid2" },
+		.csid = {
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID3 (lite) */
+	{
+		.regulators = {},
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx", "vfe_lite" },
+		.clock_rate = { { 300000000, 384000000, 400000000 },
+				{ 0 },
+				{ 400000000, 480000000 } },
+		.reg = { "csid_lite" },
+		.interrupt = { "csid_lite" },
+		.csid = {
+			.is_lite = true,
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	}
+};
+
+static const struct camss_subdev_resources vfe_res_6350[] = {
+	/* VFE0 */
+	{
+		.regulators = {},
+		.clock = { "slow_ahb_src", "cpas_ahb",
+			   "camnoc_axi", "vfe0", "vfe0_axi", "cam_axi", "soc_ahb" },
+		.clock_rate = { { 19200000, 80000000 },
+				{ 19200000 },
+				{ 0 },
+				{ 320000000, 404000000, 480000000, 600000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe0" },
+		.interrupt = { "vfe0" },
+		.vfe = {
+			.line_num = 3,
+			.has_pd = true,
+			.pd_name = "ife0",
+			.hw_ops = &vfe_ops_170,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE1 */
+	{
+		.regulators = {},
+		.clock = { "slow_ahb_src", "cpas_ahb",
+			   "camnoc_axi", "vfe1", "vfe1_axi", "cam_axi", "soc_ahb" },
+		.clock_rate = { { 19200000, 80000000 },
+				{ 19200000 },
+				{ 0 },
+				{ 320000000, 404000000, 480000000, 600000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe1" },
+		.interrupt = { "vfe1" },
+		.vfe = {
+			.line_num = 3,
+			.has_pd = true,
+			.pd_name = "ife1",
+			.hw_ops = &vfe_ops_170,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE2 */
+	{
+		.regulators = {},
+		.clock = { "slow_ahb_src", "cpas_ahb",
+			   "camnoc_axi", "vfe2", "vfe2_axi", "cam_axi", "soc_ahb" },
+		.clock_rate = { { 19200000, 80000000 },
+				{ 19200000 },
+				{ 0 },
+				{ 320000000, 404000000, 480000000, 600000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe2" },
+		.interrupt = { "vfe2" },
+		.vfe = {
+			.line_num = 3,
+			.has_pd = true,
+			.pd_name = "ife2",
+			.hw_ops = &vfe_ops_170,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE3 (lite) */
+	{
+		.regulators = {},
+		.clock = { "slow_ahb_src", "cpas_ahb",
+			   "camnoc_axi", "vfe_lite", "cam_axi", "soc_ahb" },
+		.clock_rate = { { 19200000, 80000000 },
+				{ 19200000 },
+				{ 0 },
+				{ 400000000, 480000000 },
+				{ 0 } },
+		.reg = { "vfe_lite" },
+		.interrupt = { "vfe_lite" },
+		.vfe = {
+			.is_lite = true,
+			.line_num = 4,
+			.hw_ops = &vfe_ops_170,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+};
+
+static const struct resources_icc icc_res_sm6350[] = {
+	{
+		.name = "cam_ahb",
+		.icc_bw_tbl.avg = 0,
+		.icc_bw_tbl.peak = 300000,
+	},
+	{
+		.name = "cam_hf_0_mnoc",
+		.icc_bw_tbl.avg = 2097152,
+		.icc_bw_tbl.peak = 2097152,
+	},
+	{
+		.name = "cam_sf_0_mnoc",
+		.icc_bw_tbl.avg = 2097152,
+		.icc_bw_tbl.peak = 2097152,
+	},
+	{
+		.name = "cam_sf_icp_mnoc",
+		.icc_bw_tbl.avg = 2097152,
+		.icc_bw_tbl.peak = 2097152,
+	},
+};
+
 static const struct camss_subdev_resources csiphy_res_8250[] = {
 	/* CSIPHY0 */
 	{
@@ -4398,6 +4633,19 @@ static const struct camss_resources sdm845_resources = {
 	.vfe_num = ARRAY_SIZE(vfe_res_845),
 };
 
+static const struct camss_resources sm6350_resources = {
+	.version = CAMSS_6350,
+	.pd_name = "top",
+	.csiphy_res = csiphy_res_6350,
+	.csid_res = csid_res_6350,
+	.vfe_res = vfe_res_6350,
+	.icc_res = icc_res_sm6350,
+	.icc_path_num = ARRAY_SIZE(icc_res_sm6350),
+	.csiphy_num = ARRAY_SIZE(csiphy_res_6350),
+	.csid_num = ARRAY_SIZE(csid_res_6350),
+	.vfe_num = ARRAY_SIZE(vfe_res_6350),
+};
+
 static const struct camss_resources sm8250_resources = {
 	.version = CAMSS_8250,
 	.pd_name = "top",
@@ -4478,6 +4726,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sdm660-camss", .data = &sdm660_resources },
 	{ .compatible = "qcom,sdm670-camss", .data = &sdm670_resources },
 	{ .compatible = "qcom,sdm845-camss", .data = &sdm845_resources },
+	{ .compatible = "qcom,sm6350-camss", .data = &sm6350_resources },
 	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
 	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
 	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index a70fbc78ccc3..ae456ff4e612 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -77,6 +77,7 @@ enum pm_domain {
 };
 
 enum camss_version {
+	CAMSS_6350,
 	CAMSS_660,
 	CAMSS_2290,
 	CAMSS_7280,

-- 
2.51.1


