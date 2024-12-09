Return-Path: <linux-media+bounces-22886-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 538609E9327
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 13:01:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C018628358B
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 12:01:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8107221D9C;
	Mon,  9 Dec 2024 12:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="BndbPVXi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D1A221DBB
	for <linux-media@vger.kernel.org>; Mon,  9 Dec 2024 12:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733745674; cv=none; b=GomCI9/ZP5nDKjZN6J58KGgS/MsOkoN+6gLejHk86OS5fL9hrOJ72njUm1OQVLGXoTNK1iO5pvVUWXZwqH2hJNwSDUoqKnIh26lywizvINm7dJqdrFdK+lMpktKmFNQPhROUzJrL8/+9IF4AK629KFXvBPZS+hAe/0kq+SXqI9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733745674; c=relaxed/simple;
	bh=8pFX+27nmjk/7KfdfuKsPNR83Jiahya68QV//JkHJU8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fi49lMOkOKsBZzMhFONlNJHmY0xEPghGVR9aUdjV67TCqscIbCdL6VM+M3QzSrKy9RcDZuRRdhEYIH5KVdfmxDACBUrlGeLw3mt7idL5r9v9dSRR/83yeCgrDFLSpfmbCC7ZSoPhFvqoTOQJ0ly/VNRmwnzvSMITeIKOzdcUZ9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=BndbPVXi; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a9f1c590ecdso758538866b.1
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2024 04:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1733745670; x=1734350470; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0tR6QupvutEPi+0B6/genbHIfRkFvdzSANWIhNibRjA=;
        b=BndbPVXiWkZ2Hymlx4djmvk3gopkES+g2ciCMtH9KuwLm8K+AKenJwUnTmlB/GOHGS
         wMonUq50IRzSn65wKpPNKm98Aq/INhm9tZQp9EMohv2B/OYFNPS6tpm/m0rGXSMckI3l
         6QvvheUI4ft+hvwcntSi7r/aOghQMpsNiQdcUwGVNSbM1YM8a5SErFyLN5cNCcntNJmb
         U8OM2ROcxY1oFdHvdXVxMBNbeoAgV0vi0B3gkYrrqhxxa3PzJOps2TF0xE25omtiNzRY
         R4XD658MZRpjGFdtaRVlxnfoNX2ApzbIHHKesmRu7Xg//cK7epW8/LhBUnjftgwoMW5C
         xRFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733745670; x=1734350470;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0tR6QupvutEPi+0B6/genbHIfRkFvdzSANWIhNibRjA=;
        b=T4jiAoSxaolvxNMavRdnyrMNycNHQa4i9NQn4rykWdYWuFlkqDBcVwn5feZNA3/zX1
         WRCSr9S1MlaBmLI3T7Cu7/gR0x/uKgGKx8z+sF3SwnIdyCHMj3Qgr5VfE/DPJ7OWGZBa
         vZKfFf5nTfFJpuE4p2DrFCRSRqY1DDly0qMpi4ISPJlODGsq/nKPllXEH56phwCdQmzP
         y4pzveat6ClSzNJo2fc/dteDNSBYwCxpIvzcIbY8iKdx7KYXhm/G2vsA3WNIPyx9QMXf
         HFRYTTSeSsHE6AW3vvbdNBEB+4iqdWPWnXhJcRuI23KgRyrzpsyJvQJoVCCOyKXinvjz
         qNEg==
X-Forwarded-Encrypted: i=1; AJvYcCUyX4g3LmgWq1roFFtHDVci9lJiBbXjivCjd00uFApsI1i0O4KWfU4Y1I3ZEK88m7q2gtLZLmLX9lalNA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiLMNh+YVXPTrs+sNRod6MOZSy2cZPsPlpoeOq+2/6rqtVygzG
	wWyKXnDA/IXeJO+d826wEj3uPlDDgljamMgjI+Z/sfTMMnqOeW5/53MMxLyBoyM=
X-Gm-Gg: ASbGncuYYiuerEVidkgseOLCmVxAdSO/XEE4+1mUWW9dDwd9Hg2rsV4VEOsBx5GWnCP
	EzCKkT3h/f91jyH+6iXO9vzRSMVzMHeieCuc23QBv5h1gfh1FJh9OfhwXoEiB8DygR/INvunUkm
	ijpE9ra6bkiqPih9yIxv9IXRcQlDlvy+IRv4IEdKTaWPAdh+rTBYt2cj+rbkHloTwQ1Ct1xKKOd
	zQu8avqQQ4VOO1X2fXfi7gzwEG3M3z7DmHs9lPYnk7TMdD4liN3pd8dbDEcLxr9GMvCmIBfRhsP
	X7Kxm8l3fD0kpu0InTqnu7n65kKJ0S1A58EdqYkm//RZl5uxcjPo2HMCaUHWBTETKg==
X-Google-Smtp-Source: AGHT+IGCASHop4+PMr/ElwoRqpZmRPYooFBqBNoyvG1DRpnbL890d/4qkOvn0rbSSu4AIgl1YOMZNg==
X-Received: by 2002:a17:907:aa6:b0:aa6:945c:453d with SMTP id a640c23a62f3a-aa69cda0d94mr5001966b.27.1733745670385;
        Mon, 09 Dec 2024 04:01:10 -0800 (PST)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa69afa395csm22555066b.71.2024.12.09.04.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 04:01:10 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 09 Dec 2024 13:01:06 +0100
Subject: [PATCH 2/2] media: qcom: camss: Restrict endpoint bus-type to
 D-PHY
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241209-camss-dphy-v1-2-5f1b6f25ed92@fairphone.com>
References: <20241209-camss-dphy-v1-0-5f1b6f25ed92@fairphone.com>
In-Reply-To: <20241209-camss-dphy-v1-0-5f1b6f25ed92@fairphone.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Barnabas Czeman <barnabas.czeman@mainlining.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>, 
 David Heidelberg <david@ixit.cz>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Currently the Qualcomm CAMSS driver only supports D-PHY while the
hardware on most SoCs also supports C-PHY. Until this support is added,
check for D-PHY to make it somewhat explicit that C-PHY won't work.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/media/platform/qcom/camss/camss.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 9fb31f4c18adee886cd0bcf84438a8f27635e07f..b99af35074cdf6fa794a0d2f0d54ecf12ac354d9 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1855,6 +1855,15 @@ static int camss_of_parse_endpoint_node(struct device *dev,
 	if (ret)
 		return ret;
 
+	/*
+	 * Most SoCs support both D-PHY and C-PHY standards, but currently only
+	 * D-PHY is supported in the driver.
+	 */
+	if (vep.bus_type != V4L2_MBUS_CSI2_DPHY) {
+		dev_err(dev, "Unsupported bus type %d\n", vep.bus_type);
+		return -EINVAL;
+	}
+
 	csd->interface.csiphy_id = vep.base.port;
 
 	mipi_csi2 = &vep.bus.mipi_csi2;

-- 
2.47.1


