Return-Path: <linux-media+bounces-64317-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BffBFUc+KGqJAwMAu9opvQ
	(envelope-from <linux-media+bounces-64317-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 18:24:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F056966252D
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 18:24:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=X3jffM2p;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cGXN5VTR;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64317-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-64317-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 455093069258
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2026 16:17:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE3E53B52F0;
	Tue,  9 Jun 2026 16:16:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE183B42F0
	for <linux-media@vger.kernel.org>; Tue,  9 Jun 2026 16:16:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781021780; cv=none; b=D3+fwz04PAmsQ3JcU0BI1YPhnavHB7uz/8opOouN0WIZlWzdrVDSKIuZQppTc4n94SxaVuhCgYsxohpWS76muVLXVHeqzPx9a6IezNAqczPJ+BfyNQilmwSw9bGl4G6eMlx0bUsDc9oxtPWjNHLVdeSTwGOHM3ndpy70vt2dDyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781021780; c=relaxed/simple;
	bh=ehmCceB1Usjo/FqCtaacHOk9iR5fZCv3ObDqoDrh5oo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VBryscBzPI4VK3HTZlTn1Su8BdbxjvxH7i+xcO2zi9rr/dj4EnZnVUtXq+9IHqADsaDgyuufeReT43in8Gb2EmfsYPfPGeNBvAyAllIsFVRnFBAR44u5hbXWQPTLE2jjOrjHoV6td99vmv3ngoYWFFt6l9P3k7XKEm6sWbVKuHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X3jffM2p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cGXN5VTR; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClKaU2251625
	for <linux-media@vger.kernel.org>; Tue, 9 Jun 2026 16:16:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v6hxQm+uba2YjETvC/dTjEIGekTwygd9HGGBJnvjcwc=; b=X3jffM2puwNmlTpv
	i+8OLwsdruhjqSqLkf6QlGB5WyKN9PQNOcodNAJPr2PEaTPC9WVIdqeoeO722Jr2
	lXDpxN5c2BfpdxlWgGV9PlYsisRps8a4LQNXoplJsrvOsOZJ8/0YGeNtZqCU4p9N
	0f9Kvz5dQep6kt6Ob5Zrm69QQw9oI5XRouV83SvwW7ZbZiW+NDZzdjyp/P2Pf9or
	FwHTrJJWjUPrJInYcHqfeMFcTPJIuVAT9wkW5CB51/iQUJYmPH82PGdyeZChmZrw
	cNNYIfTKgnazMG4O408jAcg6JInCeJiDfgfCPRNhqrr0Bq3PyNiKzh9Km2Mpa7Pq
	vSxkig==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeqgjecm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 09 Jun 2026 16:16:17 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36e09ec696aso9793084a91.0
        for <linux-media@vger.kernel.org>; Tue, 09 Jun 2026 09:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781021777; x=1781626577; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v6hxQm+uba2YjETvC/dTjEIGekTwygd9HGGBJnvjcwc=;
        b=cGXN5VTR1vfivk6LKhpWBLXoVlhavrLrAvsCFyscSLXhWCdCDeL8LM4zB4HXbMrju+
         dAwlBIDjrj7fufxFadoEONcIsFEhdPHcoO0YM0a1V6EZ3s28eDNp19vSD5P5TYoybSjh
         eIbskkzTGbml5K4VTftXgmxVKNcMJ3viIDqx2EZ0zX3SWr2AhcGo2qzWGaB269s4U72n
         +BTPVLbSxxJAV/JUdcT7ctBfoNj/6hACvplI7Vj510TM8PYtlgg0viMBaadH4D2Yskaj
         UM5XwvDWo8nRQXPPi5Q0SjHOzToV8dqsL+RzmXvZ7Da8DEJry+wTem+J3oBZeT20Bta2
         TaJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781021777; x=1781626577;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v6hxQm+uba2YjETvC/dTjEIGekTwygd9HGGBJnvjcwc=;
        b=i8JNuc2S/Pi1J2jwqnv+rdTrOnj9GEXsz80m9ckjQUOgklthk+tKKYaKMvk5jojW+Q
         iUU7v2bYz3ueY3KeqNw2f9yyx5waYrYKQjLKoVF3IMG4f8C3QL/Ug5B+WeUN1Xfz2JRj
         2QWZogITNwX92jn5WneTq1XTM260tLvAsjPnhkYnbnBOBbU+g0zqCH9Ge1e8BX8z1iCM
         eA8rmDdGpMYD1WiLrGeF+rlxJKLZiIOcdUYn2BbF09ktsnEsI+kpPR0J5zKoGENg939t
         n0IqYHLXevoFgP/XSKN8CIF1uS8dkbmCboIEEJjSyOg69kuIn/AReo1UCtQdbz2sc7Bo
         0xww==
X-Forwarded-Encrypted: i=1; AFNElJ/ImtEKcpYhtO+//P4kfomgRlMopaobJefg/Z6d3dZzFoxfnaGnwJ3dTdKiT7WQwnUrG1NQRSkoWM67fw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXkoJT2wIowf1/IXsmGqIEZEQdAP3X7dAGbqrFQNv0MPDzSh4U
	MPL7J5th1ZeEpn72I3bfak4KLPsUoSUrJ2LkgGzRneSQ3xs4ttNG3jaRoOHT5h/8N95jwEQJVFY
	6FC0pl++92IghQIolPHoP8L052BZq32k/hNcDjOXTZ0occerzDm6hdSokdVOmtXK2cw==
X-Gm-Gg: Acq92OHGBwSlo1mXY/zk6F6TboRgmGOCsANX+LSc6V9Y3XXU9gD2qWEpz4xK1wnyfQR
	gHy66CcTIRBnezHrkzQH7bd+uSNRh3X0VdnHQbqt4ljqEShiifbf39QCv317lgLcbkX3QkyGxaP
	QOOX8NIm6WW6P+gNJoZxWVn0YwcQgdD4OZnEJ2zVN9JB+/8IFWmEJU/ar3uATpbh7lNzpsuRCoZ
	XgzdcXQFmONepLwDYIpQ7l62CxugYeSCKd99tqAekQBepIH88tT/7Okd4k0mPZC7TCnIcrLUdz0
	Riv8Qv9/UQxSfTNnZK/oDznZxlJBhl0ZKW0TsHtExspAm/5rRHieakQP/hXmbl7cU8r5t6wglVN
	aaywML0G1MiTNmgQwFbw2GzytKvM53EPZ+lt7BEqAGBUjztnUuYRlL2rfHu/x/XlcuI0=
X-Received: by 2002:a17:90b:5106:b0:36b:afa0:c53d with SMTP id 98e67ed59e1d1-370ee82fd0dmr22403470a91.2.1781021777103;
        Tue, 09 Jun 2026 09:16:17 -0700 (PDT)
X-Received: by 2002:a17:90b:5106:b0:36b:afa0:c53d with SMTP id 98e67ed59e1d1-370ee82fd0dmr22403432a91.2.1781021776624;
        Tue, 09 Jun 2026 09:16:16 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f711e52b0sm20391897a91.15.2026.06.09.09.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:16:16 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 21:45:40 +0530
Subject: [PATCH 1/3] dt-bindings: media: qcom,qcm2290-venus: document
 shikra Iris compatible
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260609-shikra_vpu-v1-1-3a32bb38b080@oss.qualcomm.com>
References: <20260609-shikra_vpu-v1-0-3a32bb38b080@oss.qualcomm.com>
In-Reply-To: <20260609-shikra_vpu-v1-0-3a32bb38b080@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781021767; l=2185;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=ehmCceB1Usjo/FqCtaacHOk9iR5fZCv3ObDqoDrh5oo=;
 b=/E1dPUgVRbNCyXj/0pvlvKpZ8Zlo5cHJ8zELYiTFuncIOpOYVEUAQSwFUp809rhBlBF6EWEVF
 WpnxCjg/UHNAcOXr+hx9vOL2s8yL83eWCL94ZrPyGiuFAOxDztmhS4a
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE1NCBTYWx0ZWRfX8hYs+Nyb4EiW
 JfZwPGqw8lF3jOeiA22ff45vkbYVlkhOfZF6Ap2Z93o7NtpBC6ckFKuX4fwDVoJq9GHRSsN/f8L
 NmgjeRmiIZVa0nTYEat3WsJSvQQRFUt2VQ45VOE6eMj/rU7WR1dGcbd/iVY+3vH851F5evDyr6A
 LS9cUwVgMM7FNLnRVBEePxF0eMSm+i+kvSW+8yklTQX6AxJnSh5/uY9PuBsQsrDFFh+431wBRpP
 MSCn6Gg6AIBfL9yRdODljPvcKPCyLnyhAoOyq2SHJo81G7/mWHO9piUMZ3t6wDegBmWvuYlZyB5
 zzpbjIvWpzKuMHxxmxYTuqzFXi0a08F+slWvue2ysRyTQwcAbCUGrFDSSlnKfV/LxNmBK7NYk94
 ueH3UgmNOCBW8C+Ug3a1ZYRa4MHDEAm2hYCfKojU1q0t76Q+eG97T7LD3UWOjUNprdV2nSprbQs
 yyvAb4+RSLSfXXo4oNg==
X-Proofpoint-ORIG-GUID: YoVWfJtJFmHF0AIEYKgonKmBxqR7CHCj
X-Authority-Analysis: v=2.4 cv=KdHidwYD c=1 sm=1 tr=0 ts=6a283c51 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=vu35gHCjgte05Dde9DgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: YoVWfJtJFmHF0AIEYKgonKmBxqR7CHCj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090154
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64317-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jorge.ramirez@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:vikash.garodia@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F056966252D

Document the iris video accelerator used on shikra platforms by adding
the qcom,shikra-iris compatible.

Although QCM2290 and shikra share the same video hardware and overall
integration, their SMMU programming differs. QCM2290 exposes separate
stream IDs for the video hardware and the Xtensa path, requiring two
explicit IOMMU entries, whereas shikra uses a masked SMR to collapse
equivalent stream IDs into a single mapping. Due to QCM2290’s SID layout
and Xtensa isolation requirements, such SMR masking is not applicable on
QCM2290 platforms.
Since shikra uses the same video hardware as QCM2290 and shares the same
programming model and capabilities, it is added as a fallback compatible
to qcom,qcm2290-venus, with conditional handling to allow either one or
two IOMMU entries.

Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 .../bindings/media/qcom,qcm2290-venus.yaml           | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
index 5977e7d0a71b4fb5681f1c2094439c251366f01f..895533b9756690d075fd7729e3f805c8e72ff0df 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
@@ -15,12 +15,27 @@ description:
 
 allOf:
   - $ref: qcom,venus-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,shikra-iris
+    then:
+      properties:
+        iommus:
+          maxItems: 1
+    else:
+      properties:
+        iommus:
+          maxItems: 2
 
 properties:
   compatible:
     oneOf:
       - items:
-          - const: qcom,sm6115-venus
+          - enum:
+              - qcom,sm6115-venus
+              - qcom,shikra-iris
           - const: qcom,qcm2290-venus
       - const: qcom,qcm2290-venus
 
@@ -45,9 +60,6 @@ properties:
       - const: vcodec0_core
       - const: vcodec0_bus
 
-  iommus:
-    maxItems: 2
-
   interconnects:
     maxItems: 2
 

-- 
2.34.1


