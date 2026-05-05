Return-Path: <linux-media+bounces-60341-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOnULUOW+Wkh+AIAu9opvQ
	(envelope-from <linux-media+bounces-60341-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 09:03:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E5C4C76C3
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 09:03:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 91A28302DCF4
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 07:01:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0FA13DC4A9;
	Tue,  5 May 2026 07:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PDDxS1pD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iGFDdSzh"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A303DB622
	for <linux-media@vger.kernel.org>; Tue,  5 May 2026 07:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777964447; cv=none; b=sRqy4Vk0gSlr/D+Yda10TfsZtr0tLku2xo+VrKJhTao3f/c6CZyIaAPqK3u2oCuR/fTC2lQmObBIQpcWDv2vzWIp1V0JZwzlOL6FjuN33BHcIfbYxZSbh0MWtBL15MBWFl6R6ua8EHovvXbBFRxANlQjwIUYAwctxLuzlIOxG6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777964447; c=relaxed/simple;
	bh=YXK+1kgquuMBIXjQrVSRCBE4q5ESQLclNWvU0QR64sE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ts3VLrNzgJm5UcUqscWo4GsQazmIijCcCvpOfETbpL/l/2y3Zxl406/sOlBIIwxMqL2rmsUyQ5zCXsB5xac5xRlvuJIpm+ZQZt0pkuIHxSyHJrDaoSke4ge/QVrbCe3lf5nkwmoCt+IQZgbkb2P5EXf5gqf5YbWQkcqurNGI3j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PDDxS1pD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iGFDdSzh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644K0W07299673
	for <linux-media@vger.kernel.org>; Tue, 5 May 2026 07:00:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3FtecQ4utCQQhYZ1lQ2laqIkmzIbFQvnTmfCWCJD5gc=; b=PDDxS1pD8LTZlUzF
	WRykcGdhCXhawKasfeSjVCkLIlNMhm5jqbVk0D/cLGHx9hkHF95P9xmvKSUTVLJf
	A2nVGzSLgpBJxPcHlJMIRX4aw49M3kkyut/N7iY/U9LEqYA0HOt/lfXT9kbPAUHL
	VJTjx9o3vzAORfYg1uCdDYO4gROTB5ShpsEgGgl1Uk7dfclsiZxCXOIRNTlqWv1T
	q+tuDnIx+MSNPD6qLEEjFXB147mEkujX6KtBs0hgv/oodf0B/DRZhjW6vb9WDrn6
	ISdjmB72L/725wVhT5+GvNe38DtTx0ljgZnCKeI/qZGkJNI9NKWJyyx/gpLqnOS+
	f+fb9Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvndb8v1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 05 May 2026 07:00:44 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-362d9dd9a49so5292892a91.0
        for <linux-media@vger.kernel.org>; Tue, 05 May 2026 00:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777964444; x=1778569244; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3FtecQ4utCQQhYZ1lQ2laqIkmzIbFQvnTmfCWCJD5gc=;
        b=iGFDdSzhjvSymWvFwX0MAqzJ2KiHxNd6SGOmGvydPPZsMvuAJJLGwSgV6pM3b8HS9L
         aoPbLxDYNDjsN6SciIIJoyPnCnfEUF0XC6mfxFoQKuV6gTxbS6muxewmj1SciSi7JofY
         q69npDb1TkBvOoaPZ09LwrYbeRiq7FZFyk2R3Ma+AxYngjiYbbE2rK7fkhiVupWkmXFd
         J82aPLk+aOng8m+57IRFYJQuK8+BSH7En4sSDDHvLytOu21OuLC0UceSAuaAG5DGdJUo
         w+xQZgMo8DsvCLe0606qF6q/3v1CnsZRZoOAGpD2tUqQdQroYpYbGxbx7fFTm6Hbx2hu
         EJqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777964444; x=1778569244;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3FtecQ4utCQQhYZ1lQ2laqIkmzIbFQvnTmfCWCJD5gc=;
        b=QMHQORWBpziK+PnURehdSpN997PjkwteQkHM5bUaV93XEva2L5DSKPRgZoRoMD98ri
         Kj6Zm7u9WiguWcH3Fi7nNhP4Pj35kIxASnILJFN0eGBsQBVbO+rrbWr4GgXrmVXed/7S
         dolzUfZN++u/Eilgh1Vzehjab5MkfHAIUR0MCZsn+1UDuHxRKw74PLGrdx+aqcUxyTBJ
         i9YwUdCyGKB6ylqMQcnD2Qr4Gu9FK02yn+5sFf8foix0AUOBbBB56NmYdHIeXVpgWEDU
         SxONwM9493N9kL6nkna/+5matJqPpa0r8bZrvUI2D+C2C8hMNJUCKTu1ily+Cdnt2Bf1
         iP0g==
X-Gm-Message-State: AOJu0YybhnPDqBwzx4WIz2FXBpuB4aSz0AydF9HEzvW2oADCL5ryQKCu
	zpYnb/MYnVwgIq9tQQNoB371Zu9vULbQzmlVtcjw/1bbIeMJQcLNZTDHSHUYwTFLM+mDYDcUPmw
	U6tdfDpoEDWH14P62P91mmS24pcsxrWxrN8y59pmCzKU2iTyR58ukqjRgCtUfgAvAhw==
X-Gm-Gg: AeBDievzwOFKGcoXVTCRMds9CLMEHPGMewJ79PmUBhT5Np7SJC4f8AWlx9bLdWxuxne
	SnffdiRFfS1Seu/edsVT7ZHDMxcHMbe1o8Y9HwbcISChReQx8OvmjFNQNpiF/6ozgbHmWJYUPdf
	toD/HhgQDksi26owqYFkL0cNfVCBawGAHn98X9OtWJtBteUB+5ycxIj0P40syuRLUkCYYVpqrqE
	TMbOutX1HddqR3kkBy+PDoDHSJJrNqOF5BWBjZVylj/6eol47bsdyYuCzJXibq2es0E+H33SWVe
	d/LYsHEnQDVGbUhHyFQ/OWjXOnHSjBaoDQvIIMjJoqAw7d7ovakeJDJZiIHmqyriRZkHUw02uPs
	q/vCncJPcRaoKP32CriZGkR6M9yAdc/Pncyhh2J4XjtJgX18gsCq4V1FOoDEQnS4taQ==
X-Received: by 2002:a17:90b:5112:b0:35f:bcc2:c351 with SMTP id 98e67ed59e1d1-3650cd70549mr13312378a91.6.1777964444116;
        Tue, 05 May 2026 00:00:44 -0700 (PDT)
X-Received: by 2002:a17:90b:5112:b0:35f:bcc2:c351 with SMTP id 98e67ed59e1d1-3650cd70549mr13312139a91.6.1777964441588;
        Tue, 05 May 2026 00:00:41 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364ebec73aasm13840146a91.2.2026.05.05.00.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 00:00:40 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 05 May 2026 12:29:23 +0530
Subject: [PATCH v4 02/13] dt-bindings: media: qcom,venus: Remove clock,
 power-domain, and iommus from common schema
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-glymur-v4-2-17571dbd1caa@oss.qualcomm.com>
References: <20260505-glymur-v4-0-17571dbd1caa@oss.qualcomm.com>
In-Reply-To: <20260505-glymur-v4-0-17571dbd1caa@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777964421; l=1505;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=YXK+1kgquuMBIXjQrVSRCBE4q5ESQLclNWvU0QR64sE=;
 b=REQWCbQT538q2OfZtlZ8zIjExLWixsiRImG7cUZ40McZz5JR0uUkATzy47T0Xgrc//JP5rRzN
 Gzye7WurnQfC4PYei3rXmcB5CVGYRoloioAa7TSJTJN4AmwWU+cfWXg
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: M2KOaYe-2xabAR1_dXptgNHoravroeRy
X-Authority-Analysis: v=2.4 cv=d9jFDxjE c=1 sm=1 tr=0 ts=69f9959c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=oAqX9iOIqteJqTbqMNEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: M2KOaYe-2xabAR1_dXptgNHoravroeRy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA2MiBTYWx0ZWRfX7AsnFVTRnCvY
 XwMBAJKdGlJozfpLmXO+kTHHZo8sAY/7Md1296JhVmvDpBeZV++1x7EnLDT1hBkvonUa1CYxhtW
 GjxxgOfUsoz3bF+QQydVn1S5pH8GuZaTMHkorfRpA7WLW3beVs4+wJES+5mHvtD6/rAHWCr1I4e
 xSZ2jZQwePVu1qndju3C0JrwjSQix22qRxLePVgJTlhvCBCbmLpK+H0XKdoNX4r8bIZuithLXAK
 pDewhTLkVMjnoRqVl0ej4QB9QbyWB4L2LyUqJVjVa1qEfQGCbmNQJ7FwZ8s5suVNMk8I9I1iYAg
 DJl5Q3nWo2EwvmOG6lKiXGd6qB1MMjYxZOFXqP4fZd3Sh2fLIpwDt7TruLPZ6ou8+zX9kLpzng8
 woWUthdFRf9mg7oGoeQR/HcNWYdGegh9JktQXnar8QgxjjveBbNr8AanxidI41RlnaUE0+zVEsI
 CIZuf6unlA+fyMmlGtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050062
X-Rspamd-Queue-Id: 75E5C4C76C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60341-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,linaro.org,gmail.com,8bytes.org,arm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

The common schema defines minItems and maxItems for clocks, power-domains,
and iommus. This suggests that the number of these resources can vary,
while in reality they are fixed constraints per platform.

Remove these constraints from the common schema. Each platform specific
schema already defines its own exact fixed constraints for these
properties, so this change does not affect for any existing platforms
that use the common schema.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,venus-common.yaml | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
index 3153d91f9d18..5d310783720c 100644
--- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
@@ -18,35 +18,15 @@ properties:
   reg:
     maxItems: 1
 
-  clocks:
-    minItems: 3
-    maxItems: 7
-
-  clock-names:
-    minItems: 3
-    maxItems: 7
-
   firmware-name:
     maxItems: 1
 
   interrupts:
     maxItems: 1
 
-  iommus:
-    minItems: 1
-    maxItems: 20
-
   memory-region:
     maxItems: 1
 
-  power-domains:
-    minItems: 1
-    maxItems: 4
-
-  power-domain-names:
-    minItems: 1
-    maxItems: 4
-
   video-firmware:
     type: object
     additionalProperties: false

-- 
2.34.1


