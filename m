Return-Path: <linux-media+bounces-60741-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NHPFI46/GmUMwAAu9opvQ
	(envelope-from <linux-media+bounces-60741-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 09:09:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E32A04E3E22
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 09:09:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DEFAA3035AAB
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 07:08:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 345F7349AE0;
	Thu,  7 May 2026 07:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GCPoOWjB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kje4w1hG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB04934E761
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 07:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778137710; cv=none; b=JOrKhgmKQSUsM7eARPIOA7+1sv3gG4tFXNs/GKnL5+4SGvlGTNmpJHjlNI6M1TtvorqO7rHEIeLWRAYIvB1qtLjnFhFrT2fhYvzhRVOg4zJKVzPbkZDlosyyoYJNGGmwQqtsZ183J1PwWwQcXUOe3tTR/+DyO7kW3SMDAsJPGNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778137710; c=relaxed/simple;
	bh=ped0zn8zHtOguB0QMsTA6lPQ+hYAYtaBooH+PhpHol8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fxO2DcUlC3fBm4Je7tuRrwyAB2o7Kz3ciqvgalLvPOj7/opHgY5u3RMXcJ186KCq4JuS2EdujwypSO+h/59s+GTSefOmWH4b+Z7gDh6cwUAiKkNWgNqYUF8kwszZGSufkzWd9ZeLkNbdivqomUzBvAQfxVb7USISTqnsISyxpGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GCPoOWjB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kje4w1hG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647440e3150879
	for <linux-media@vger.kernel.org>; Thu, 7 May 2026 07:08:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DY52uMyj8x8JmaVfiE6AN1KUCcHZtly5LcTEKGv0U4A=; b=GCPoOWjBoxXq/hvr
	aVmio8Q8JrmhZt1pyiRm1DS2Zlx3pcIfVI7graWIXoCY23KYda0sCDqb41+/AmBU
	683Py2lNYEourrxKrSdW4c4UTmELN0emoF0AoxANBsgxt9Ar1YqZCSs1A9xiKHQ+
	hnvOBqzRHocS9GAUY980MuU1+8OM6tsy8XV4g0UFVxkmEEgZuU1fxDfD2cTnYEu+
	NhiPv8wAuYy1tA+fYMF8p6c9KdpFwOpju+bZtjokrqZI5zXiH/uKcaizcIMLipN6
	RTwJJIghDso29aUV30bH7nVrMmAy62OPY0Rblna9ZdRb2AgLtnDq68On7ksXj0y+
	KFCUBw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kctrkwh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 07 May 2026 07:08:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50f817c3240so7159441cf.1
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 00:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778137707; x=1778742507; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DY52uMyj8x8JmaVfiE6AN1KUCcHZtly5LcTEKGv0U4A=;
        b=kje4w1hGSvctEtMDrrmE3qneyuZ2r4zXM0zTIGDOKJNROz07ig8fI8P+rtTpYsLuGy
         zzdECd6qPPD7IwEtN/GqidhOb6HM4qBmPmfgRELUz4q6BCFmU4+aMNvl9yTnnQ8+nqv3
         viRjtGiQmQmpeOc9HX32zfxXZvU+1v0CjAbfCthdDYiEkt0oDJjbC9yVU7Q6zKYH1UUa
         be116xprypypOAqZsrLiLS10/lb+KvYobRpzyC269Kjds4CkzBo/rzRTwSEsD//UAf1i
         kVx0MoyLfH9iGBjkHWxf2UosuAO2N6Kx9yy07c9TEoKUdSiCJBamj4srGJETv01uc9W6
         AtrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778137707; x=1778742507;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DY52uMyj8x8JmaVfiE6AN1KUCcHZtly5LcTEKGv0U4A=;
        b=kKIiqik70WNKcPqhlCS7MRqWiPD31QfySWo2z+uN/r32jkEIikIjSCAGlO2fctj+zp
         y7MPrfZJ9Bv5QnL8/1KHoImVibmPw9k4qB8MC5LZIT7n2/wmggFrW3T7xAydl62clbJG
         qZZZCMeXbfWtOLt8dNDZG08Q2U4x0ALc2evtOFlzoloda+B1c4xAaN/1e3rI9AobL47U
         Zb18FD8v41+aNa+L1xX9h4ovMIsbN9oSdrsRu/AP7i8B1z7hfYZ6B+NPAGX7zeyPdQt9
         FH3Ucs8Aq9BsKjfCirEo8HB0/nFO4yreOwEu4NCwVT1Qn6vn6XGvQvUqjd18p+2wcS8u
         UiBw==
X-Forwarded-Encrypted: i=1; AFNElJ+vcjDMlsCNy1G4j7IrFfMP3jAGmNYjY/gUceRWRhSc7dtVEZs8xh992TzWa1PuDBaFpiN6lVlYd7kLng==@vger.kernel.org
X-Gm-Message-State: AOJu0YyW+n22zCc09yYXxMalww5xWIXuoppvLJPwTmnh4nOhi1sKyLmt
	12uz6IUzjGqo1ut+PSHFevbVs9MJ7Hzw/bW5gD7aW4w73tm7GSpxnkWyCjG7Cvc/Qy+nWVmkQlZ
	LDt6yPDB8GdnMXrp4wQT7t2RQQ8pIH7HlRM04Oe5N7Ei+LvVXAme7aL1FEUrSfP4nXw==
X-Gm-Gg: AeBDiesZczXbTXb0idKCA69NuyvUw0NHv5aOXBwHgv/Tce5LlgvYav5cVVf/nYFTxJF
	AC3EShEGfYh8uWZ1dyy0HpsAPvZlayMkONyfnpUUSqa9Zk7M5WweDn2ICGG5pPxS1Kc5HkCN7BX
	nyvoaPY1mitblMo6JgVTHlTXKgcuGyTexr+xLcfDD41CnTwd2MltzqyxUoL0ARoFGa3z7LuYGYZ
	0DN1RiKh7W4bhZbS6vgH6a7dmkxZtMMElhSko6nQGNlZgNj+FH2y23bOS5lCa62B+UEciarUHpc
	2ViGxi1gbgslKp5EhJA/fchXum6swLYKmrsXhtWxfLDxIYzIqmQ8jneIUEGuxWkyeL5oA9CxCDZ
	X8RouXRzBZ11ccsPFgiWzC3hoeZqkpXChJfU7ftBTDQhAENTQD0IxGkbe2R8U/ICeYUWN30RYpy
	Zf9T5+j+EoWW7rAq16oy6Rxw9nxbuANF/60zmj880QZ7CnxyoIPz3C8jyK
X-Received: by 2002:a05:622a:138f:b0:50d:65ec:a071 with SMTP id d75a77b69052e-51461bea647mr96643151cf.5.1778137707193;
        Thu, 07 May 2026 00:08:27 -0700 (PDT)
X-Received: by 2002:a05:622a:138f:b0:50d:65ec:a071 with SMTP id d75a77b69052e-51461bea647mr96642751cf.5.1778137706707;
        Thu, 07 May 2026 00:08:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a86aa338aesm4296784e87.43.2026.05.07.00.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 00:08:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 10:08:10 +0300
Subject: [PATCH 2/4] media: dt-bindings: qcom,qcm2290-venus: add Venus on
 SM6115
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-iris-sm6115-v1-2-0b082ad8eea8@oss.qualcomm.com>
References: <20260507-iris-sm6115-v1-0-0b082ad8eea8@oss.qualcomm.com>
In-Reply-To: <20260507-iris-sm6115-v1-0-0b082ad8eea8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=995;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ped0zn8zHtOguB0QMsTA6lPQ+hYAYtaBooH+PhpHol8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/Dpg+89AtTAZ+p0GTGj3HsNhLOa2vbwG25Q6X
 SbBwZrQ8QuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafw6YAAKCRCLPIo+Aiko
 1cA8B/0TI9p7676sBpqMniKHxUYJrhvkKisA/Y1KN3RiYa89rIH9n8ocbnKFF995SWrgsv7oYYR
 CKTyEIuUYztgNIhfMdg5PGgGqCwCSHoHMpf/AKIUUsfXH5N6YvjSA69XHCSC6YaJMbVojaSl5fZ
 QfIkcZOcozsvmFnQ9BJtbZflv9N9TJt7qsj5ZtJ/UB6ek3hkQBxkWzpgWUU42DZWUG2dxe2AXSo
 HC1MMcmZb+b9tVh36raU/pKpzvhZsZWYv2Qyf6jYVnCySYl2i/iJi5dNQk+62T7P2SrV4EHyuOe
 zIS2NKukgyTeQmnOo7XQBABMqTtqVjzWQj61xam8WuhioCO0
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=XsPK/1F9 c=1 sm=1 tr=0 ts=69fc3a6b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=Qhf5OHDhvhXNivbLZvoA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: ooPTat9rIguHDIfjjLqTyvep7UnQugIg
X-Proofpoint-ORIG-GUID: ooPTat9rIguHDIfjjLqTyvep7UnQugIg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2OCBTYWx0ZWRfX5GdpK4likft3
 zluedAe0D4hDAWyrpEJpbHyL2nq9NTu1YSvMfs8w7IbppeI2hAupOexJXSiyv5ESAWUCBLQwwdM
 Vr437zVMSkCWt38SMZyV/S6rUKgiJzZNgVPe51CZLwQU4YZpgHZ9/+f2vv8SihpS0ja3PtN+njl
 H1LwzP61UfycZ2+166sdgJm6mtSsGmQfLqqGIv5bKq4kT0mDGQMaPTH0dIoafIzaxEre5Qv+UCs
 KQz38HJXFMf24CVtprsRhk35OJqwRD8qm1K8+Vd70RXU6JiRA2l/AREAAKycek9A6IP5gAG33Rg
 igAXKav/jLtwRU7fQicxR9vAXam0sRj67Hs8ynYQ2rdUv8SEqrpddTIoqAGvmRF2Noze+ybDq9S
 a9EuDHNN36OWQIAocfkhRvu832y2Nhca4Gk2oLUDS80ZVJWlOWxd/+xRv61J7e7C2YTNUOxhvh7
 c9mepMWcJUcohYNLIKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070068
X-Rspamd-Queue-Id: E32A04E3E22
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-60741-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The Qualcomm SM6115 platform contains the AR50_Lite core similar to the
one found on the QCM2290. Define new platform-specific compatible, while
using QCM2290 as a fallback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
index 7e6dc410c2d2..5c5933082f82 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
@@ -18,7 +18,11 @@ allOf:
 
 properties:
   compatible:
-    const: qcom,qcm2290-venus
+    oneOf:
+      - items:
+        - const: qcom,sm6115-venus
+        - const: qcom,qcm2290-venus
+      - const: qcom,sm6115-venus
 
   power-domains:
     maxItems: 3

-- 
2.47.3


