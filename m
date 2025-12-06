Return-Path: <linux-media+bounces-48357-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DF5CAAEBB
	for <lists+linux-media@lfdr.de>; Sat, 06 Dec 2025 23:12:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B0EAA3065030
	for <lists+linux-media@lfdr.de>; Sat,  6 Dec 2025 22:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD56929B8DB;
	Sat,  6 Dec 2025 22:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dNQYMC/9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFD527FB3A
	for <linux-media@vger.kernel.org>; Sat,  6 Dec 2025 22:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765059087; cv=none; b=lRHwHQK5/i7ahQkgIGmBxfVkSIYx9HMa+hffRtq70GoVUxOIQVNpt77vJmlLgHDilY1m3d6gBpJdDO3RpviE+lswC8e9W5nl9SX/3sQX99OnvUvUDco6vy5UpvD0T4Ln4neNjK04AGOkjE45zEVHYGW5ZrPxnySxBr9MjeRIZ6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765059087; c=relaxed/simple;
	bh=llGFQSxa+VBz3XIigaBz4RTXnirW3szmq+IQwkiEwos=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BiCJ+o29UaMSAtgICOESSlzxmgkw8Zk+Nz6LVYMIZ9XJsyXsnjVWhJ6O9VtJVns/hLznQQ/2v9qtgNs0XeVwxXHWVb8gfhHJYZ2vnALWY4Pt/ODo6cI3yu4NpwwoeLaKND+orecLF3Ad//ktGzghT/nUMoYPIhrDc5TDfU4Ee7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dNQYMC/9; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so30105705e9.2
        for <linux-media@vger.kernel.org>; Sat, 06 Dec 2025 14:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765059083; x=1765663883; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PdNpP3pkyQ8Ai0z1KZFpvSslMVtLjHwOnhFCasQI2sg=;
        b=dNQYMC/9LqzcOWImqX9Dvy8nXdFQEnEdlT2cNdfDSbBJoy82Yi23DPqVZi45NSV4jo
         +e7+67zdE53vMyP6HHAkqklOQzTpfdet0fPxyzWd9mVHd37cGIje+yZOocbLF33p1B9j
         YbbkcS6W7q3/Vsc/rt2EdQL3aeAzMBn8W82JyocFEtQMQZUPgPdz3STckNHQNefijRsN
         6BiCljB6d6iveKvozfix9GqJiwRrCP7KBiYPphCuAmmbn/SPgySm1LH0iK9oWcFi8IRP
         6Uy55gtrV3TDVCWPV3u95dJMp2fvwWwj/+N9KSoSDZQ4UeEpB8zh5VJSCuh7abmAoPDc
         h1FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765059083; x=1765663883;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PdNpP3pkyQ8Ai0z1KZFpvSslMVtLjHwOnhFCasQI2sg=;
        b=Wd2ph4cQhR5WmDOWqWl7HpM2fiCoiVIJqqnSo5W9CsuG5E0p/Ip+HJnOC2FA5pVAyl
         IzuHxc5zAzQzxxRQ7xWxQsKp0bR0bUDDhDOm5uU35bYcphrok8SbSYCM5+Sm4F1KhX64
         WhUJhl4Sm1usNHvf3xQuX2KaJkM22kQz2amNbjwQSNpRoDvmEKvcznU/zUMx7ZiR7DUK
         qAVO53BoMsvsWe4Rs+Hmeo4juWtV939iTDlnmCHmQnkyWpsuCIdJ4BqpE4ROZlwtjjWH
         B6S35mhlJzedsk+cVv28gJp+F8FYOHy3BnEfzWIEnEDa4ePtHltjQaAeSFSFcV/YwO94
         IkuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCrZqeZd0dryRLRVaIecprag/JGtWFolIW9bHLLwfoYCBTl5j1m2ksdkfJnhDJJB4w/nwKppWqAn/h9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDMPXkHIVs5YQGfpUvMbjms5e69Obpe2XHDiMzAPji8xPlFrWg
	uJPNym6RyL15M8YiFw4K7lmL7mycKuWn245S4Qx8lsf0SyLCyq7Y++ZAXmXPyLaCqmU=
X-Gm-Gg: ASbGncsX44E6drVkD7c2H0fLwR2W4oASCr+VLIwRqoVPu9K8YFZotHo2hzipKjE/w0F
	5amMi0wblGvfJZkmvYJXgs4v0/9RZIZUiy092ySodXBUP84RjUbH4B81YSSmVdM7m3zNygsbXBI
	hF+QBOXP+XouxUiOl+vzGDz258wlfGz2TPpPlAfvbB+3fms+e4cES6j2ck1j5HP8lUCsutCrj9g
	ieupoQt7GfGfi8ZY/C1zbNEh4nLYPDq7Q35MDy+keg4flssD4tU0n+wfYbRQKzNaEYzM9QUWDuJ
	nbIyFQDPYQKKnd/oTODO9ptaEHniv+T51md5dNaI5GXjoSIMLXTqldMD5sIMu2HoDKKH+XHgyOs
	acE+sC+kVtXX6aCaYae7VSYTLWduSPDy6X4dz6ZpUoeNwGtd8K2nj0tOF8FM83CQu/SXkKLMo3L
	bgzO5etzRGqItGmLYMvUDdMwRQJzjMiMWagF/uHRsom3yt2mjwMG9o
X-Google-Smtp-Source: AGHT+IGYOQHLbRPRC/EPdOR1ME0IZsoXFZxSohWUfJRKOmie/CI8rO+nUjh/c/Z+R4TW2b7owJEeCw==
X-Received: by 2002:a05:600c:8719:b0:477:7bca:8b3c with SMTP id 5b1f17b1804b1-47939e2828cmr36474655e9.19.1765059082919;
        Sat, 06 Dec 2025 14:11:22 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47930ca4aacsm149576055e9.14.2025.12.06.14.11.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Dec 2025 14:11:22 -0800 (PST)
Message-ID: <f4d29f9b-98ce-4e57-9916-5a37927db2a7@linaro.org>
Date: Sat, 6 Dec 2025 22:11:20 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/5] media: dt-bindings: Add CAMSS device for Kaanapali
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Atiya Kailany <atiya.kailany@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20251130-add-support-for-camss-on-kaanapali-v8-0-143a8265e6e8@oss.qualcomm.com>
 <20251130-add-support-for-camss-on-kaanapali-v8-1-143a8265e6e8@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251130-add-support-for-camss-on-kaanapali-v8-1-143a8265e6e8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 01/12/2025 06:30, Hangxiang Ma wrote:
> Add the compatible string "qcom,kaanapali-camss" to describe the Camera
> Subsystem (CAMSS) on the Qualcomm Kaanapali platform.
> 
> The Kaanapali platform provides:
> - 3 x VFE, 5 RDI per VFE
> - 2 x VFE Lite, 4 RDI per VFE Lite
> - 3 x CSID
> - 2 x CSID Lite
> - 6 x CSIPHY
> - 2 x ICP
> - 1 x IPE
> - 2 x JPEG DMA & Downscaler
> - 2 x JPEG Encoder
> - 1 x OFE
> - 5 x RT CDM
> - 3 x TPG
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>   .../bindings/media/qcom,kaanapali-camss.yaml       | 647 +++++++++++++++++++++
>   1 file changed, 647 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
> new file mode 100644
> index 000000000000..094287c01a79
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
> @@ -0,0 +1,647 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,kaanapali-camss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Kaanapali Camera Subsystem (CAMSS)
> +
> +maintainers:
> +  - Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> +
> +description:
> +  This binding describes the camera subsystem hardware found on Kaanapali
> +  Qualcomm SoCs. It includes submodules such as CSIPHY (CSI Physical layer)
> +  and CSID (CSI Decoder), which comply with the MIPI CSI2 protocol.
> +
> +  The subsystem also integrates a set of real-time image processing engines
> +  and their associated configuration modules, as well as non-real-time engines.
> +
> +  Additionally, it encompasses a test pattern generator (TPG) submodule.
> +
> +properties:
> +  compatible:
> +    const: qcom,kaanapali-camss
> +
> +  reg:
> +    items:
> +      - description: Registers for CSID 0
> +      - description: Registers for CSID 1
> +      - description: Registers for CSID 2
> +      - description: Registers for CSID Lite 0
> +      - description: Registers for CSID Lite 1
> +      - description: Registers for CSIPHY 0
> +      - description: Registers for CSIPHY 1
> +      - description: Registers for CSIPHY 2
> +      - description: Registers for CSIPHY 3
> +      - description: Registers for CSIPHY 4
> +      - description: Registers for CSIPHY 5
> +      - description: Registers for VFE (Video Front End) 0
> +      - description: Registers for VFE 1
> +      - description: Registers for VFE 2
> +      - description: Registers for VFE Lite 0
> +      - description: Registers for VFE Lite 1
> +      - description: Registers for ICP (Imaging Control Processor) 0
> +      - description: Registers for ICP 0 SYS
> +      - description: Registers for ICP 1
> +      - description: Registers for ICP 1 SYS
> +      - description: Registers for IPE (Image Processing Engine)
> +      - description: Registers for JPEG DMA & Downscaler
> +      - description: Registers for JPEG Encoder
> +      - description: Registers for OFE (Offline Front End)
> +      - description: Registers for RT CDM (Camera Data Mover) 0
> +      - description: Registers for RT CDM 1
> +      - description: Registers for RT CDM 2
> +      - description: Registers for RT CDM 3
> +      - description: Registers for RT CDM 4
> +      - description: Registers for TPG 0
> +      - description: Registers for TPG 1
> +      - description: Registers for TPG 2
> +
> +  reg-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csid_lite0
> +      - const: csid_lite1
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csiphy3
> +      - const: csiphy4
> +      - const: csiphy5
> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe2
> +      - const: vfe_lite0
> +      - const: vfe_lite1
> +      - const: icp0
> +      - const: icp0_sys
> +      - const: icp1
> +      - const: icp1_sys
> +      - const: ipe
> +      - const: jpeg_dma
> +      - const: jpeg_enc
> +      - const: ofe
> +      - const: rt_cdm0
> +      - const: rt_cdm1
> +      - const: rt_cdm2
> +      - const: rt_cdm3
> +      - const: rt_cdm4
> +      - const: tpg0
> +      - const: tpg1
> +      - const: tpg2
> +
> +  clocks:
> +    maxItems: 60
> +
> +  clock-names:
> +    items:
> +      - const: camnoc_nrt_axi
> +      - const: camnoc_rt_axi
> +      - const: camnoc_rt_vfe0
> +      - const: camnoc_rt_vfe1
> +      - const: camnoc_rt_vfe2
> +      - const: camnoc_rt_vfe_lite
> +      - const: cam_top_ahb
> +      - const: cam_top_fast_ahb
> +      - const: csid
> +      - const: csid_csiphy_rx
> +      - const: csiphy0
> +      - const: csiphy0_timer
> +      - const: csiphy1
> +      - const: csiphy1_timer
> +      - const: csiphy2
> +      - const: csiphy2_timer
> +      - const: csiphy3
> +      - const: csiphy3_timer
> +      - const: csiphy4
> +      - const: csiphy4_timer
> +      - const: csiphy5
> +      - const: csiphy5_timer
> +      - const: gcc_hf_axi

https://patchwork.linuxtv.org/project/linux-media/patch/20251126-add-support-for-camss-on-sm8750-v1-2-646fee2eb720@oss.qualcomm.com/

Pointed out by Krzysztof in the 8750 patches but the name of this clock 
is gcc_axi_hf.

~/Development/worktree/qcom-linux-next
➞  grep gcc_axi_hf * -r | wc -l 
  
            [git:platform-qcom-next] ✖
48

~/Development/worktree/qcom-linux-next
➞  grep gcc_hf_axi * -r | wc -l 
  
            [git:platform-qcom-next] ✖
0

Please resolve the other inconsitencies pointed out by Krzysztof in that 
thread here also.

I will have to skip application of this series in the meantime.

---
bod

