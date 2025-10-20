Return-Path: <linux-media+bounces-44981-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8C0BEF82C
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 08:45:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3A0B54EC99B
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 06:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 655902D8DBB;
	Mon, 20 Oct 2025 06:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DWI7b02W"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8E22D94B4
	for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 06:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760942719; cv=none; b=uT2rnX3WlaPwohszvM+7jJUXOwZp+z+ftakNwGbuPQJExmcFf0jjiypzTcSwc7+EZrDTNVPcDof9He+fR5i3d5uiIkzPB4sszKiWhLDr6pRgbKnWNQ9AerilTJgyLLqd6toKhhHSp1y5koeP/jexrQ1wedr9NgcewSP3cLBJR5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760942719; c=relaxed/simple;
	bh=rtC3C9uGt4UHU2rn8ibGjqy0rKI3FHFok7NncAPdX+U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TFLcHgj2bC9JurXJEfaZJ2QzbtkdEPGhaf33Loi0ZYs9cKDwQI5/MysKnBK9ntP9FVzxT8EcQsdhfBoWE3Au1LrUsvk7TjcHdY4Pz9Ulfz/SrPtNWeqs1OYbyiCZx5zA4cl/UK9BoiopW7gX8ijSJVEv+BKJBHYlF0VCuIoxRng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DWI7b02W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59JIPjGf009409
	for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 06:45:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3qj1hX2tzkLQMkkvq7DvgBbML5xuWRY1vxvwpXBVNfo=; b=DWI7b02Wt6xk/JR0
	JiZBjmIgHysOpmUo0s5EwtmCpscN2yWiLBDfqf+N/vQoo2HpsnpLxwVq0DF/mXy7
	SRDa4UhCdqUWSRZcVkFqtQloG9NwldcNbclPT8XqnHkOdkM92b4wSh5Jkk7z5J+x
	VVNkRcHtFVA2qr83Wou6OC3a4ZeyxlsF1MNP77jA0tWH3nnjZKnOcFWOxcAFHCrl
	ca5By6oyUEm3tQDlZ1vwkPfc04cR10AotH3GU42M0fff5sIBLzZRkFib0MBfLSJj
	Ph3MGFiDxpc/Nv4yuU5APrZ3raxKjL8V/LJmWDTHBPl3ehqfcXLVlWK94fpsW+Yq
	OsBfmg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3nfbt3x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 06:45:16 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b67c546a6e3so9487791a12.0
        for <linux-media@vger.kernel.org>; Sun, 19 Oct 2025 23:45:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760942714; x=1761547514;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3qj1hX2tzkLQMkkvq7DvgBbML5xuWRY1vxvwpXBVNfo=;
        b=huPJ/fJ1uJu/0eTVVjeKt5Qb6IL+259vls12CmPyHatj8l/BHJ/snfwY0IfdtjDA3d
         g9ngNXTSQKwZ8DbatG2eHtigDuSgDCG7EZ+85+75KTdvsfyFGX8ojkV1TiQk7BJX2KP8
         jE5diHjx3B0mq0H0yWcCdRflAg8V9Yuradr8lrAlmXqzfHUXeIBSR4CZikQ0OY0DGXL1
         vee+jZONOY2ocIe8UUAt9ZttlQm27nEjVHm7OcrJel5w5tDc/Uz9TfAUfQlP8256WF5Q
         3xdo+2KDjpQ/WqsQR+jblROKEGE4K0X1ndgxjmLCUrlZdfKeHcU/8IWZICnIYZt8wOAu
         qcOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXA3gnQGBggn9QK/CsilgQh2jhsKls4aEATCCTFMPCd8rySbc+6Vtkb7hs7jdhzq955oTxOjOq/m6ZjSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgpN5mpygVXKDxsGaeHmTBmlh53PH8CHiTwBA44w2YYkBj/zDK
	Oj1cPTkaHJXxl0k+Ki9zQlEDf6TZAtPwfo5XoErhk9cvOIUQlXBtX/UTyqsabhuEWlnjNzVU66z
	p/SHZuNbhYyioCqncAVbWmZq0zjUckm0t6E35zC9Isr/O0/e3BAKZ4UbXfE3f+kKEDQ==
X-Gm-Gg: ASbGnctWHZRbanHIWfcQXTnp3gT3JjWGe+9MZQtEYWoG0E8ctArBa2OxcEvK09d+vNQ
	LLX1P9EQkgeuYSCB/IFD6NYGgn4MtzENNh8B4DBpKUgpI1sh0JTmLohFao88AySGnhYvmVUTnBD
	eg0meHIzSi4mcHAAPztX1tGy6C6ePQx/hOtxYFFNeR7bikSqw9LZwlnqPjWIdsQjZ6r/ij5czwk
	L38ejo6Pk3Q4MnhlfQZUFsrp/rRWuTEpgmJ3Lp0jRTNzqsP1R59UItRTs+me+EuR2vSSKi5ZVMp
	+ny1BaSiPI6BzH5WgRwQph/WCAgG+BrbflgdFZ3xCmm7dccYs/lh9rAXTyfbZ5WJ/gTUErhovhK
	DwzOWwEZFbjEEoaDlViTAjyjF2TfLqeViuhRlJf9ZzmMYmIiIbyfjPC1ujs1H7QZRBWk+Mw==
X-Received: by 2002:a05:6a20:7489:b0:32b:810c:2ba5 with SMTP id adf61e73a8af0-334a8652285mr16399824637.59.1760942713711;
        Sun, 19 Oct 2025 23:45:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHad5TbzH1sKjCzYpmQGbmCOR4jWr/A8NyZHnhGcDceZbOeyhSYzqUYFrWu/OhNtgqfN1z6lA==
X-Received: by 2002:a05:6a20:7489:b0:32b:810c:2ba5 with SMTP id adf61e73a8af0-334a8652285mr16399786637.59.1760942713297;
        Sun, 19 Oct 2025 23:45:13 -0700 (PDT)
Received: from [10.133.33.90] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a76676a2esm6818005a12.15.2025.10.19.23.45.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Oct 2025 23:45:12 -0700 (PDT)
Message-ID: <8ba56bfe-d0cc-4f9a-93c8-0c361d5c59c8@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 14:45:06 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] media: qcom: camss: Add Kaanapali compatible camss
 driver
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com>
 <20251014-add-support-for-camss-on-kaanapali-v2-3-f5745ba2dff9@oss.qualcomm.com>
 <0fe25ca8-8dd4-42c7-a818-a803a256f42f@linaro.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <0fe25ca8-8dd4-42c7-a818-a803a256f42f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 5_CL1kuFlm222KZxoH3ZMyItJPbZMrcB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyNyBTYWx0ZWRfX8QYJm0CCFFpX
 dMRJZ7XTiDnjrILN8UPZelmKbEjTr3981t2X78RbgEVKy5cqE2dgDXee50q/edaoIu2dohuoVEp
 IueGMWJUe819OGQZzkkAU9pcoNKt0aWiE+9g5Yy3n2XNyTjAgixEnyVCsJhn5NvXfI5Y6S7anCs
 gn6nL6u8OuKHWxgiZGuH0OC0q38rTLnWqChT1wxNkVAqbg89O0Zs+uVQ7/TmMZB1N9wD/NiLsmk
 pjSegY/hSxqUpTA4fElFOGfWYq/fpeDYWBFvD/Z13WakPK3pcwOKqwoiVuYFHtwpK50kzCKAtX0
 Ii1Ec/KFCE6nDkR/wh9mCz6Cyg+v1Z95mSxvb53hPXS8CoNN1yd8SE8GUv8t2A9G5VI0lTbCy5n
 5J498UMR9E1JwP+qQWQ7oCT7JBc+fQ==
X-Proofpoint-GUID: 5_CL1kuFlm222KZxoH3ZMyItJPbZMrcB
X-Authority-Analysis: v=2.4 cv=EYjFgfmC c=1 sm=1 tr=0 ts=68f5da7c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=zPKo-_adG0ZnOV3uB6kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180027

On 10/16/2025 4:55 PM, Bryan O'Donoghue wrote:
> On 15/10/2025 03:56, Hangxiang Ma wrote:
>> +static const struct resources_icc icc_res_kaanapali[] = {
>> +    /* Based on 4096 x 3072 30 FPS 2496 Mbps mode */
>> +    {
>> +        .name = "ahb",
>> +        .icc_bw_tbl.avg = 925857,
>> +        .icc_bw_tbl.peak = 925857,
>> +    },
> 
> Looking at other implementations I realise we've been adding avg and 
> peak without too much review however, wouldn't 925857 / 2 => 462928 be a 
> better value for the average ?
> 
> ---
> bod

Ack. Thanks.

---
Hangxiang

