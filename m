Return-Path: <linux-media+bounces-51519-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ON6NFUPNdmlWWwEAu9opvQ
	(envelope-from <linux-media+bounces-51519-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 03:11:15 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E09483746
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 03:11:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9C73A30011BF
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 02:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40AA626F471;
	Mon, 26 Jan 2026 02:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WM3+tfEo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fi1JMiDv"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AC62367D5
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 02:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769393395; cv=none; b=OK0AnhR5efVnR44LpTlaqs3drJdXluxygmcNzu9M0KvItQnNYCMILT2lCTUTr/p54Ayf37oHx0k2i5X2rcw91LxNXA1Ki3zY4h0foF6IS3BmXd8+KZMXXljOYqo1obLiObl5iPLo+/MmdK0TGDlzwvmsvClaF0XjS3DEDnB8yo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769393395; c=relaxed/simple;
	bh=ORuGJu/GYm3ysLTNkCgLVjQpY7Kb/lBszYo0stjQqf0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VeSa7LiqvvRQgVajkUdtNdGcKKFiTYOfavSA6115m1NQEVfaeu15lpZBcUqrGQCGhb+Q+VxXU3Cl+YDWdNU7IluP2HaszCxrf/9Nap+Suz/UqEiX+ffXT36yPrUpCjJyqzHh+H3muaKOZh/ROshlq3UFa0mRx8+AhRAg8GMKDlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WM3+tfEo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fi1JMiDv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60PGU20V193629
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 02:09:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j/zW9gokZY/MJ8KbPgs9FrhMrPwOjvcqW0w4aTXvpFo=; b=WM3+tfEotiwK4gai
	Yot+Mq7P+ULEMhSUcLTPM+YTk80pTYz4DNf2OIPUapfKnEw5NNNvqcOoGMYhqIUR
	DqIFzWi/kA/eSF9GxUMbl+gWTzZRk3FAqJUoONDAZ7USxIVJazTMclR/5YGzxzhg
	5Dcb2t5KuwlCMmKyRROqzCRnmWNDxdruHXZDBsEalO+ILW0EtAy6LMiU4ZEi5dqq
	mrE3hs2YhCf5qQazzxY9GtqzMrZLVBQr/ku1Inz1CJGnQTp+awcDJcx6fPkEhwhd
	TlqFPXWFgpJh16uBM5pdTIOpJMrMZqkKjGNiYd5zuLsO0Ry+YEBEJrsHgM54OfRX
	326gUg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq9f32u3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 02:09:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6cfd52556so1095908385a.0
        for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 18:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769393386; x=1769998186; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j/zW9gokZY/MJ8KbPgs9FrhMrPwOjvcqW0w4aTXvpFo=;
        b=Fi1JMiDvXuvuAp1HeVS6M1HKeXcHHUXZAOrGQ7fFel3NZCHQUqykV5VPN2S1lfxr0N
         1YzR0Oe6ueRPbZikBzTxYR7ZMajYl+caNgI/NwfXKn4Nao6eUudBi2XopG9AC1V4chLi
         sXvrnwSOOFyvguxDWbjGt4rtEl4ZtZoyPrtQo+t3elCvnlV4Dik5pbrK3RO3YV7JqMN/
         /5RTFqU6T7wTpU3HU9CdiTO/GE8SXvbJ7h0IMuH5U/C8iQ1ZD5kdIxpuNC9gAjRraoPl
         7oKTGMvBAqVT9uStcvIE03KDFXkih3gkhHB/9wfMYu7WjB9xQx2d/R43HNCgzAiI8R8c
         bbYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769393386; x=1769998186;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j/zW9gokZY/MJ8KbPgs9FrhMrPwOjvcqW0w4aTXvpFo=;
        b=OQ7FtCB87wT9rCt7YRFjlhY7espp/5dnyWXd1JCfN4x0vC4noSTpFiESDtUeSCUC3+
         +1ZF5NtfNcNysQbGqg8VPSGD1GnwfT/RMUM7ynSRVi7gd5ykfGrqxeMGCYSsNB3VdpX1
         aIPayOBZg1brfL1ag8ALaaig++1oeo/w2Bker8+FKTVtvbiPMqMjRO/cpclEZYuLbLQZ
         CBNki24HAcdvQst+4vWpfItIC7NRpIhjwG0JrzG0ednjYrYH7pm2xR1QoDMk6ssNzKqX
         S6dcG4PE3x/fJ3reONaI0dASfjAMI/P5KfJOdUpuvvdLsXHVfeBpw6qVTxSfvw2GytOG
         s9Vg==
X-Gm-Message-State: AOJu0Yzd6Qn7Gv15yOTYgeWT3jHwsmt7yeWRzfPFvGimluH1skKbOdvT
	IZKBkg3Hpx1xCNNUjXeb6OfPC1FGpgzaJLwSnogJlyv5Y5SK1vS6hYaztu29DmBlxUt3qoAH+G1
	l5f1Oa+WPSiuU3LXDJQgVKR9sQzyZcMHlASY0vaLNu2u/pJxWYVpvuk2IpvHa2/eohA==
X-Gm-Gg: AZuq6aJCwVmj0BVf3OsfVTrzcFclVdkRE3KLCmOD66DRxgPSeoUPrbzmhtBSvOp7SAu
	BeQv6HXt56w+4Mu1u1cKXQSIcc/PEN41hxQGX9Ajri2PDyNvOP8ynegQ0w1oD5iuQSwdrk0oPZ0
	zFvSlqhjKMhjS2FqxcA+mRbAfPugmDVliaoLDjf1FxMKuvjx5cW4cTZH/FEek9sTdQah5n83Tqp
	3XgJOXNYMleN4h/FSQypfHz/lQZK9L/J2wZDLnB1bZrmZ973IW4Qxg+TtKQO3FsiOr+uzoxQ8cL
	PFDjVVJbuQvEMstJbBC3kIyoD0cvlHiAPrV/TeOjMGM9Dy28pzmMlhuT88v+CdcUDv0G5cXarVt
	TpIL+SvIv42HvkmNC9ierm4tCk+hQVv59h0MbA7ifOqgKVS7Lnj6it6I/SuIB1vluZVLpy1z67l
	6XuvmD0SzM+g1npp3hTm82uJs=
X-Received: by 2002:a05:620a:4489:b0:8b2:eefb:c8ab with SMTP id af79cd13be357-8c6f97f1f17mr301984185a.19.1769393386271;
        Sun, 25 Jan 2026 18:09:46 -0800 (PST)
X-Received: by 2002:a05:620a:4489:b0:8b2:eefb:c8ab with SMTP id af79cd13be357-8c6f97f1f17mr301982385a.19.1769393385804;
        Sun, 25 Jan 2026 18:09:45 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385d9faed52sm22778201fa.2.2026.01.25.18.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 18:09:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 04:09:38 +0200
Subject: [PATCH v2 3/4] media: dt-bindings: qcom-sc7180-venus: move
 video-firmware here
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260126-venus-iris-flip-switch-v2-3-b0ea05e1739a@oss.qualcomm.com>
References: <20260126-venus-iris-flip-switch-v2-0-b0ea05e1739a@oss.qualcomm.com>
In-Reply-To: <20260126-venus-iris-flip-switch-v2-0-b0ea05e1739a@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2059;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ORuGJu/GYm3ysLTNkCgLVjQpY7Kb/lBszYo0stjQqf0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpdszkpTr/VPHkkuT9HcCfpMxBHxaVhafAYwYFs
 K1tScWkbkWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXbM5AAKCRCLPIo+Aiko
 1WSBB/4nUNFRz9f9fzYxkkloaoLvcfg/AJ4Q4pjsvQEWS4vEztUQzw3AD1cMxerJdMJ26VvWB2O
 +ak2D5cQKLMpOdfc3oka/bS3fPqylm2BgyNftcMlbxG9RIHsVRCNYJd6a+zhOvrDQIOSgnWhzUe
 fxdLb1f70R+mmshIgz0DMKoRXKTip9RqCQ2Cvs2vcDXb6EdLa0f6rSToL5hj+P1wAAMpIY6rtgi
 YER20nm9M9C8cwYHSR7Y5Zug6Ajj00KJ631AJD7jFADt+m7bzLS9S1esEKouVkoS63nT+4hJcEF
 pQwLM+lTaVpnS7y8bWK3/QO7hsopPpij1DeGSqHKzmCEJFjj
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=YLGSCBGx c=1 sm=1 tr=0 ts=6976cceb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=yfaF6CmWL1hJmoVWH6AA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: fkVf2BldiDlWJURqkO0qVwhND-9JDvkP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDAxNyBTYWx0ZWRfX+VYu6XK4xacs
 bakAE237L3ep8gZr6VY14QQZspgHq+D8TKvYYf5qAFl6i7yUwOUDC1t7B9Ts59bMQlMqTzrOUwP
 1iU7kbLX0Pn8/8vINL0/0SISpABCsiC/yp2Y4edPxltfan4H8aWReiRH2hdR/9UvKNeRwCp/yqN
 oJWEmCk4QWlYfYp6/igK9zCyw34+3rKpvOT/68zBl7bZerrTFqJBZztmOwVguZzWMf/cLEluk7A
 wJak/62gZvAGZ1mhd4SFkri6jGYC1eVFSLoMAxX0N4vS3/+6VTI9OgCVlP4J0HP+LJPk/PYGbgN
 W7tXsGcVaiPpNGv8fjByXU7MEbTh18CQc8owk7HBjpw5GzOr64qMCRqDnRjDmQhPjVCj0PZEcU3
 uD/eT3P4eWXeAISzqtL1ZUPmk0IoTtlOjFMIM9S1LME8rjqf8D2BVm6bkqpjnBCP7cBEmMwi+bP
 JQVkQE5e4QWJ7CeYyjw==
X-Proofpoint-ORIG-GUID: fkVf2BldiDlWJURqkO0qVwhND-9JDvkP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260017
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51519-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9E09483746
X-Rspamd-Action: no action

As SC7180 is the only remaining user of the non-TZ / non-PAS setup which
uses the video-firmware subnode, move its definition from the common
schema to the SC7180-specific one.

Future platforms that are going to support non-TZ setup will use
different semantics and different DT ABI.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,sc7180-venus.yaml      | 15 +++++++++++++++
 .../devicetree/bindings/media/qcom,venus-common.yaml      | 15 ---------------
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
index bfd8b1ad4731..b21bed314848 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
@@ -91,6 +91,21 @@ properties:
     deprecated: true
     additionalProperties: false
 
+  video-firmware:
+    type: object
+    additionalProperties: false
+
+    description: |
+      Firmware subnode is needed when the platform does not
+      have TrustZone.
+
+    properties:
+      iommus:
+        maxItems: 1
+
+    required:
+      - iommus
+
 required:
   - compatible
   - power-domain-names
diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
index 3153d91f9d18..59a3fde846d2 100644
--- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
@@ -47,21 +47,6 @@ properties:
     minItems: 1
     maxItems: 4
 
-  video-firmware:
-    type: object
-    additionalProperties: false
-
-    description: |
-      Firmware subnode is needed when the platform does not
-      have TrustZone.
-
-    properties:
-      iommus:
-        maxItems: 1
-
-    required:
-      - iommus
-
 required:
   - reg
   - clocks

-- 
2.47.3


