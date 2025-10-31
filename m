Return-Path: <linux-media+bounces-46039-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C44C2319C
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 04:00:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 537004040DD
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 03:00:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3620130AD19;
	Fri, 31 Oct 2025 03:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q6b2y4Pw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TVy/qw79"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14B02248BD
	for <linux-media@vger.kernel.org>; Fri, 31 Oct 2025 03:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761879614; cv=none; b=I1/q/Xh1Q0vEwzpIoPGjIjr/LmvseV27Cpv26TeaF9LKBVWPMWN+O3S94JHYtBu2WIbONaEgFdKzGDWTjqkFE8jugIbCD6Tly3lykaDNvvENVoo27HNZ/UENIpsbYVe5iSkheMBDpAsIEdKScB0COAsj/zlGBlTkQYUalP8JnaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761879614; c=relaxed/simple;
	bh=12ifn/h0FdAmM0zlYgL6vpYfcGA0ATj8ireBxFP4Hvg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NERGKA16B/V1SUqUDMp4pa+YAFrNto/3SL0x/luz7C6+gPU/bKkRWkyp4s0D5Gss8DuM4YjLeUQiENne9EYY7BjY58jNtYh+T8xgwfuBZd4pILGVAXbdqBVrpT8a7lFxn/2rIj2oGchx5G388TAHvyfCJ4Gi/jYK0/FOmR5Z5pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q6b2y4Pw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TVy/qw79; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59UIIs2J3116501
	for <linux-media@vger.kernel.org>; Fri, 31 Oct 2025 03:00:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aIoImiVEY38ckPGZxJxA/BLNldACaExF3yFcJOYBzxs=; b=Q6b2y4PwSFVGJKLl
	SCWuprWTiDpOO/a69RcuQYLWpknL2G4BMrG22b4uhbpZ36J9YgXhFCJneWD9EreN
	7dW+hfadDfpPqda7XaRMSTrc6sAEc5O8k3eybENwgGqvCOj/XGQop694/ajhlXM9
	yxiN5TaDleOhi47OHO62tJ5hKzBSx8N2CLe9TTW3JNhCllCEdxsJHb5BMqDIdt+L
	z7IZGtg3qImdCTu8DU3UyGL3YyhZ3XBsYFEw2ccRm1ktwZEky+k6AUQLdg5wmNne
	lQAa9ZP5d7r5yeW0LqAz9hM4SIV4HC5qA+HryifpF5NmkKZJqlq53nxwZ6UIsMQv
	d7IfZg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a45b42pke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 31 Oct 2025 03:00:11 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b6d53016548so3463175a12.3
        for <linux-media@vger.kernel.org>; Thu, 30 Oct 2025 20:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761879610; x=1762484410; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aIoImiVEY38ckPGZxJxA/BLNldACaExF3yFcJOYBzxs=;
        b=TVy/qw79ZE6Encu1hdYqO50QGDM91xW49cKHOceYMbawUB8Jmn9HOAeCUCR8GzTw+n
         vvSDkr9NisvJRVGvp7JDiE3+VYoDr55ilu0DTZpc6BS1IKlKbFPSOCiAVisaHZhPZdyZ
         iXwWWxrS3OPXSoxPaeGNM+TDZaFAiW0vba1JDpOhAHJXQ6ik1iQU2tfnEMqeFybCRQit
         BxNqToNZuX6o68Un1qQDgtWGNKhhLGMzjENWSPm66YSMheBGkwv1bzPs+EF+M1HKBUKL
         uesCCiu8yu8YQ0VO6lWvJ2GatbHPgcXzM3GfSkE6xUTJt5NSASjG8biXzTyHSWojvuqF
         y2iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761879610; x=1762484410;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aIoImiVEY38ckPGZxJxA/BLNldACaExF3yFcJOYBzxs=;
        b=e1IdFtHaD5H1uqXi/jW028U20/5lVRaOOBTLv+f4snYsS/mCZxj4GCeFMehkvsngDm
         o7ZpV6klkxGf1wuMc6kr53GAl1YS2FqHAFa16agsmG+IsZpHCpHVY/GuZNFBy4gFlTKB
         KtkhXP/ZeSleDX++sa1tA5djeb5NHABJjQloyJ8VSqNGcHgk4Z70nYCGH+5E+xQgHJX8
         Tdi8rlemXP6TP0CvwQZIOrCP2gVJ1tazuRDxeGn9s1efQtooaJG2zzd4PTc2HwD80nmS
         R366Bj5bMQt17LI5CxXiEmlwWWfIPccPwoA+0xRvZtbUoxeYpjZvvhbAvpIZNP9NxMGn
         pwGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVF0pwIRv12RzXEc7rgtX2RtAFp6/B8GEf5fx8Z9fjebypqGPbVfPbJPXrX9RrXcWzUVMFN0DUU7fldw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOYUgkufvI3yjyIXZeQ67BO54DZL3O3b93Gw18W+8wvzKE0W8F
	2xweLhh6qDM4l1J+fQGR9QFFOekul3uDOnFYEF6ilngx+Ws84HcrYuJqOWbqMJecG3TqqhGdMh5
	jO2l0b4P5GBHZlVJgvjqPUjeFF5T1EMKd2+bSSCnPSWAubpO2nIbWmpxGNXJ1TZ2Psg==
X-Gm-Gg: ASbGnctS3qJIA+jERnLr2LQUbPuDVPyhP9A25strx7VS4YFpbC9VlwNyzlqwFeFDuUG
	x1jsn1gCcS4/gNgqYJ7vn54y0+Q1OdDk5PL4lvsJQtK/ACXCS6eFyovs+jO677i39d5I1D91nlP
	3kvo7cQYInrJNcume+cPlL1zCCGNxFdLOvYb7NeVpR7e8umQw39X49phnsSMU5BvXBSTEPxBAKu
	Sk1RD7dBK4fLwbqkxfMjEou2pv2dW+iHWRLh1uDpRoc4e/+p6d1iNV6CD9hSekEK/D4egBnsfa/
	+6ibO8wuit5hYHlJgZda/WJGiLrswDtOajziDPUYMDA8Hcu9Ch5Qyq/z1Jjgtr2c3kS1XbYWBEr
	Iv+EmkD+pI0tNWaJMo2wMwRMZe7fjW5gj6E0Um5nF09EPCX5aPP9Arg==
X-Received: by 2002:a05:6a20:2449:b0:331:e662:c97e with SMTP id adf61e73a8af0-348cc8e5d4bmr2851798637.37.1761879610113;
        Thu, 30 Oct 2025 20:00:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKb2m9Wf2AZlvxL1iP5wTLbiSr7QNBNEp0qYaiCO8kZl4RTjx9EDnWQGDRlbTih2Bp2qox6A==
X-Received: by 2002:a05:6a20:2449:b0:331:e662:c97e with SMTP id adf61e73a8af0-348cc8e5d4bmr2851716637.37.1761879609421;
        Thu, 30 Oct 2025 20:00:09 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7db67cbdfsm352570b3a.49.2025.10.30.20.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 20:00:09 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 19:59:48 -0700
Subject: [PATCH v5 1/6] dt-bindings: i2c: qcom-cci: Document Kaanapali
 compatible
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-add-support-for-camss-on-kaanapali-v5-1-f8e12bea3d02@oss.qualcomm.com>
References: <20251030-add-support-for-camss-on-kaanapali-v5-0-f8e12bea3d02@oss.qualcomm.com>
In-Reply-To: <20251030-add-support-for-camss-on-kaanapali-v5-0-f8e12bea3d02@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDAyNSBTYWx0ZWRfX0B5qrLGXFYXx
 FlE/c/dZ81abY3VHbDBluNWJAhzmB11PVgdmEjGLV2FllQ4reQDlVrWetubzuf4yp2EJWOHD5W7
 XbrZpeg+c6/XfmYn9kruxVfWAoC8oDPo8Wy4Q55aicWakYbrAHxWSXe6sHcNssN7gUrlrzPu8Sk
 OJQhCNvzw8aMHaFelJSljTlihZfik7Y6UUTd1u+7sVarp+DyPlb4QkzZ0SJkZz75Y/ARppQO15E
 qhesqyK0fty0aLkT2wfOMlEz9P9dt/wt7+IY/kdmogGEb7uFBa3YYRKzfj98nJHlDy9GZ2Gsbku
 unmaQkSdohfLL+bxi658yUhCVXqhpHJ6ZG7BizIxTsjG0no2Gd7ufU8ScmQkpIsOvJMJF6gdtHd
 SS0lzKuvUhw2h+sQ9yBXqO7J3jvDbw==
X-Authority-Analysis: v=2.4 cv=KePfcAYD c=1 sm=1 tr=0 ts=6904263b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=AartCDbB9JJyHY4DVtoA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: XX-JeqYxRZ2hQXfJMcEu9Nh8CoG0LZrA
X-Proofpoint-GUID: XX-JeqYxRZ2hQXfJMcEu9Nh8CoG0LZrA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310025

Add Kaanapali compatible consistent with CAMSS CCI interfaces.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 9bc99d736343..9b83ec63e124 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -25,6 +25,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,kaanapali-cci
               - qcom,qcm2290-cci
               - qcom,sa8775p-cci
               - qcom,sc7280-cci
@@ -128,6 +129,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,kaanapali-cci
               - qcom,qcm2290-cci
     then:
       properties:

-- 
2.34.1


