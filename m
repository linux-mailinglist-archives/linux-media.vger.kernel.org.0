Return-Path: <linux-media+bounces-44494-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 50704BDC37B
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 04:56:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3C3D84E12E8
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 02:56:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D729328B7DA;
	Wed, 15 Oct 2025 02:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FExM40WF"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFA9264A65
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 02:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760496980; cv=none; b=OkqNUxd8TdjYkxLvYlIChxbDeMOKfRS1hDzLp6/vT4Rs7H4cjWfCP5r0gbyr8wB2ZGls0oQ/MnHWKBzg00rMKKrVkxOqzB2ZB+H8LPW/jIJhqYOvEAL+uWFSaTRf6oEErW995Qic6aks0i82SZlz43XRpsAzBQcDFf59uvM15fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760496980; c=relaxed/simple;
	bh=XiTtG+qO+1qC4sDF1M/ekkwzg3uVl6NdOygd3cj5Ljs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dycAmRs0fSra9BKruObTWT2jq0nFMjhwDGIOhDVBVqaquuI6avisgRvgf/ylSPSfSqhTjEi1eCyKlIlJArsDQCFX2q1j5Ewr8t3oC/J7AjNFXxN9MhFdkRq69UN5YhVFXnTvYuxjfgGrZci9yQjxSm4gBYn5w26ubncAOoExIr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FExM40WF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2sQ55017291
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 02:56:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aJhGwl0+NQVNf0CC7XanGxdHLIYfBFvJpssBFIXoLsA=; b=FExM40WFifCg+RYW
	niLqs05oveRren7c7gFaygxmSzaQsmIwPycTuh4rEDkm5jQ1zOmaVd/qQ3SMr6t1
	DLRTmGPekkDpRlMm3bPEJ71KT1q/ixXxSsrXOoj8o3EcEHqcr4SREhmeUDN7SG5F
	Ez7Demf0Z6Z6OunM7thRDtMycK4XnpmkhKiWgGM5DIkr9HIHMvSHHphAid3Q8wRw
	K540Oj6DUboZ9VoMOJXvGEAT6nGlQaf2hKVro5k433zFbh7skE4ryIw4l75Li96d
	XUTMGUQ7A2pHP13JHbGxsp6dWWn9N9AV6JpZGfBJd9tnjAm2ssGwFnE1bzW9Gkv9
	ERhUYg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rtrt7r84-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 02:56:17 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-27356178876so70640085ad.1
        for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 19:56:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760496976; x=1761101776;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aJhGwl0+NQVNf0CC7XanGxdHLIYfBFvJpssBFIXoLsA=;
        b=nYk7UmF6habG2DBrsn7d6nPqowr072ffj0w7JB350v76SuaonH9R3boOYijs/xHabR
         +tenWCwuF9eg2ofg7KC/mAQdTULDriWJs4eXnvtyV21dePgFz3Ui8gIONc/nKubzA1wv
         flRn+4qaMbs+gOpZN0c8T0o1r8pi5uZWLosz2o4Aht8qrhespC27J10WvF5qMwsXTgQq
         Otzek6ZQnmAV1fg17a2rE96aLCTrk3vIo7txPuz1Q62FykXROYWTcDylv2Nc6BlymkTE
         ikqyN5gyqBeyH2hTr/zjv1A06hQ9oSgrfLttLn/y9hqCYVa6Wsw/i/WxVfvsxGsfIN4F
         HwAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGgRuCBGvwyIyk3SyDzk9nUdsvFH4jMm6pyn+AsBLtiMGLj5sAAnuaJOkgdMsAvqL7K204OBe9WwGASA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5pES9sQcTxTDTXrQ7+hUlZVh0+KWwWH6JDcOYtF/eOUKyUs7m
	CNYrSnqEGWIHYgINaS5wMx+kEb09Sg8R4Nnsw/BZJawJSjSayAcHBgrHh7SdfStO5uZAXjfE3eh
	wwM219QESPvcF+nyKxTLj0qw0XfR52b3c+bXMX7/pGIPtH25N4YGQx3Wl7yO1Z2kVZB9n9W6YCe
	1f
X-Gm-Gg: ASbGncul6/rxiR4YaNiMWQznA4ss1jFxK7mT/SocUnmHCW5/D+obbbGmqsNJhOh+V5r
	Mxy+OP3NAzQWGDJ0FDq+7NlZp2rLry8XCJuEZqIVoO7P1x2KqW0XtNYBD6reGiAL3/G548kQcV6
	JciSGd4Zay7HeIJBV9LqClILJdgn9AgEaK56BQ1WsTPVEOouTucOemU0LR+v5uAfZePSVEWOra8
	5t7qed9gDMb+2/LYdM0PsxQlOyIl5SDhVlEvW/RhCq4V+M+kuT1yDQ1SJ+yEnMh3UY9ECkgK5cV
	ZUUuilcAaq5gh4L/0O6RbMcZ/E6fUXK76p5wihTos/wV6kX7Sf1sQrVUCa4BA29wAWnP7ygPFI6
	Ap/eHmjiMLiEVb1IN0NCVUYBixBo1pyEWZYhavc5k2Aq9SNCbaKhFLw==
X-Received: by 2002:a17:903:2349:b0:290:56e7:8ca9 with SMTP id d9443c01a7336-29056e79048mr161148405ad.52.1760496976259;
        Tue, 14 Oct 2025 19:56:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJRTQ6zDYzFTd5M3LyFSpDAWS/PGQqXDN7RRKhxdpQPmV5rFDp/Fh2Y5nh1Wx3dPb/vjxm5Q==
X-Received: by 2002:a17:903:2349:b0:290:56e7:8ca9 with SMTP id d9443c01a7336-29056e79048mr161147975ad.52.1760496975823;
        Tue, 14 Oct 2025 19:56:15 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034de54d2sm179122855ad.12.2025.10.14.19.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 19:56:15 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 19:56:01 -0700
Subject: [PATCH v2 1/6] dt-bindings: i2c: qcom-cci: Document Kaanapali
 compatible
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-add-support-for-camss-on-kaanapali-v2-1-f5745ba2dff9@oss.qualcomm.com>
References: <20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com>
In-Reply-To: <20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com>
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
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: 0rhFFnR0phMIpdcRS_s8aoEdB8hKTO-F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAyMiBTYWx0ZWRfX9EnhssZhVWTI
 0dqwFw2EMfpTMAGNgMqhJ3kKc6frnMBKme/zOl8u3WYKXX8PaJKOW8BT1HQHrLN3Ogns1CzzAAJ
 H2uICDjdaCMbCaSrQkfEWRC60aL8eZ7LcGma+fHoTd1i0Wnk/J02EHKiGqxlxf94cztmNcvTN9S
 80ZaEcb8guF73z80NddTQLPUNzrXfzOjcEWLu6veG2Z9J3lIwWTVYkUHvZ073SWkrKCRF+h77Em
 +KcQST+DsV2D9vT8RtDpdzVjAz9eKCPuX/Gqtll/oCjqYRQHy5PEWdEkugdbbu0X2OjisJ5qPCQ
 PkWtd+nPFWtYAcuF4vbcGSuvZdV7To0Eo9B4BOEnEU7vZtMWQAtj6Dn6fcAH8V5lVK5rEiS+jSx
 03WvAdijriO25KJs6OHLFDC0xVX2EQ==
X-Authority-Analysis: v=2.4 cv=SfD6t/Ru c=1 sm=1 tr=0 ts=68ef0d51 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=mZPZtqNPFm0sPOGUM0AA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 0rhFFnR0phMIpdcRS_s8aoEdB8hKTO-F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130022

Add Kaanapali compatible consistent with CAMSS CCI interfaces. The list
of clocks for Kaanapali requires its own compat string 'cam_top_ahb',
aggregated into 'qcom,qcm2290-cci' node.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 9bc99d736343..0140c423f6f4 100644
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
@@ -136,7 +138,9 @@ allOf:
           maxItems: 2
         clock-names:
           items:
-            - const: ahb
+            - enum:
+                - ahb
+                - cam_top_ahb
             - const: cci
 
   - if:

-- 
2.34.1


