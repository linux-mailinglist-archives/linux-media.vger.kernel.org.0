Return-Path: <linux-media+bounces-62814-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Gf9DeLUFWrRcgcAu9opvQ
	(envelope-from <linux-media+bounces-62814-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 19:14:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C235DA6F9
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 19:14:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 522273036083
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 17:13:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3465840626F;
	Tue, 26 May 2026 17:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JPII2p9y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eg7Z6HOL"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F43B4048A7
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 17:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779815587; cv=none; b=j6bNFzVx6lPmbuORQY/gRs0zixjXRiPLGiFXGjxfqWC5/MYFlBzfp3Qt1z3efa7ZlW7oA4bNacb8SwvD9EgWnW8D+wSL705NEjlgDz1i4Lh6bPnaf6B803fxM/hgcfAWNQ3Ig7e/x70FQODZc6mXIXyM50Rj+EKGcI2damfdrTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779815587; c=relaxed/simple;
	bh=dcopeyyySnOd9fL3v2swYiTB5ACAPgg1PSgm14bzBCc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tWNMtQ8Vrr5PEw+36LIduVA8O0ihteFH8KvM0BAZ/GwXNgK86uf778Bw75SWbiIi6vcUEkPIxOQ+7vmLoahollG5ak0loHu5LeByTSXTCa3H/meuDRMLLAAf1Us17STNzUEOk6l5MAXIdae5YTidufETZ99vn3msh/BzMVyah4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JPII2p9y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eg7Z6HOL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QH1DFk2995532
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 17:13:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6gMLM31lPewnCBaPI066p1pgy4In0RFum6QqFLaJ934=; b=JPII2p9yDr0AgFhE
	gBA7YeCXlr5AHJCIhlRaxmhzdJnXkug+hm7a7F9h/Tf+lgA8VF/w3obLVxis9HGY
	0P4pbPDPFA/Tx8G6yojWiFBpoKeGvduw/2WyjQw1/NMjq9dQGReyssObJwHfpcyE
	a1CxhObFWf9SYjmpKamTyOaKdCSzz5a5XjHDz4Oiz7ftccM+SuKrVWOHRMpPJMNt
	iIkO9Mi9KVhGOlMPjsWnL0R9ByMb9m6zSJ7gRM3Wrt/RfIBReADm4HnKQdrnwq5B
	lMmxAc8hPgh0PXlJtN2I0OsrpQuQ0W0knSD5VbJ6Huw357w0GaGAUpLMd2KKUauO
	N6yvRA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edcnnry7t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 17:13:04 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c828acf7c1dso15151603a12.3
        for <linux-media@vger.kernel.org>; Tue, 26 May 2026 10:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779815584; x=1780420384; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6gMLM31lPewnCBaPI066p1pgy4In0RFum6QqFLaJ934=;
        b=eg7Z6HOL/ZnsnLocQDsUOwFDxh6IoYGNWBcOnOq3piu6jPnrmvXoabamfyL4olXagi
         7sEXIqObYpbFujC/UWpXRexFbG6GscHNk6t+ZjtrdSIgDg6MZTQfsl4NJ/YLE13IG9Ry
         HtfvrOsRXGyrosOxhJJqV8Hl0F0irr8QFAvQGBAsRkS2nqimzmCDiP9PRTsy/2upbnjn
         m3o1sjx5d5mU+ibwkf801p+6o+vl3olDu4rS2kHl2FTMx4z2kcDnfkVbZrur9C+H7e4/
         Vk70sVlLUNaWWpnaW88GPsgFH8aS+in7Fy3balf757PzaYzB+gAuhiPfNIyqEpNHsZ4U
         J+Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779815584; x=1780420384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6gMLM31lPewnCBaPI066p1pgy4In0RFum6QqFLaJ934=;
        b=MYTZ0SYa9HFWSh0CfsBEvsqpXvWvy5ZzG/XssO+aJTZFPr71wV1sCwRpxMKBBso+pT
         zzMROSnsg8HYgeVe8EgQcMCMe+FqWy83/S6KSJJipW0KZ5iWg4BgSwkgzKxyM+gOPn4Y
         eh2Ci4Q4HORRsO2kWhPdiRcMWSqXBGFU10e4vQcMWq++yFBpywr2LflIOCVPvyYkJFX2
         eGL/5qI+R9mQ+Tl3bi0mG/8xKP7hJJ0SPuU65RknSDt5FkwzTk3V1yUjRUD71lfQgS73
         y+qxs9JI8IQobeCNMXxT9FmZRZ6cZVm31bIzLxgePbuQyDr0Hr6X+K+hvBweiBg9cHHg
         yqgQ==
X-Forwarded-Encrypted: i=1; AFNElJ8QTNdZu/f8VqMugnmg3n2Dp4nBluOIaCGOSKbQ5tdGnrfc0OsCxzw3s6Qqx/20qF3T3xAB2OwnGfVtAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlSHgaYi5xlSa0YVNjLfovYGgGpwg1RX+XEq7WnoVkLa3Y4E4/
	xdPXePbv3UyFhh9WKJGf5uv7aWgw0Upn4qCRnSfvacumh0VknC4+yIeIWIaaRRb4WmKln9NCH/K
	cwyxAVl6q9mfQTN45oY0qAhD8qilNDqEfQxdKNoXSOq6k7tiAtOONKKXg9XndZwwC7g==
X-Gm-Gg: Acq92OEnFXDzg8hnT+O/i/+bxHYojayLuwtZCB6XvBqo6Oq7vZAGspKSRHlFs5yZrGm
	ravDjDVAkYvgUA6zYKv/GnoyZ97UJBuxU9QmpFmPiX+/uOeaSGNzTFBjBmWQ9EhV6uYeooKYBbN
	hhlpvgdo9Bae1+Pi04lsuPialtlqZ7sXmr+lBhPLarVlgqYuGo20eBYH4eFCgd5YwfbRphqKsBY
	fRnNxAJ2ek6RPAvr4QyfqsDbnJ1Q2rjd3DtpBRAYJA/a5XJ06Ez6XF5X3bWpnYugJRptMXdqunf
	W54mLgiyK1NLclkrZLKxqDRcz+HW4fa+6c/u53xrr85EPlIYgHtbQLxTSVim+y+t+BpZK4DVL16
	2uWISxuxJjZorEYiUjYWRVCjwzf53qqgYT+HNeQ6skMl4V7ZQJpOn
X-Received: by 2002:a05:6a00:3010:b0:82f:355a:857e with SMTP id d2e1a72fcca58-8415f68c23bmr19307748b3a.47.1779815583689;
        Tue, 26 May 2026 10:13:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:3010:b0:82f:355a:857e with SMTP id d2e1a72fcca58-8415f68c23bmr19307714b3a.47.1779815583182;
        Tue, 26 May 2026 10:13:03 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84165009761sm15736235b3a.60.2026.05.26.10.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 10:13:02 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Tue, 26 May 2026 22:42:45 +0530
Subject: [PATCH 1/8] dt-bindings: media: qcom: Add Shikra CAMSS compatible
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-shikra-camss-review-v1-1-645d2c8c75a7@qti.qualcomm.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
In-Reply-To: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: 001JFyRRZziHzFMSAeMUNZWPiToPfPLW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE0OSBTYWx0ZWRfX/AegleLL7OZl
 MLDOUkdnsIV2guZdxp/4yPs5ULYQtC2S5eY3IioBvdvnpVTSaQF5cYAm3Nt7s9ALd+Mlqmaox+f
 qIBmXSVVy31+Fclpu30T8Vkljqbz3rwgR8PIoEZcPLABBl7WtcJTN14xQrg28GUs0orisdA7WX7
 cStWjaaxGD9I9FEZKCirLJqDl44e7Cy3EtAQcQwtUsb63gQ3awBCrvyAg401tpyShtztsN3q0EI
 lIAnCBo2sBRLclSzMSSfzAMLryMoGA6SBP7p2ldXbOaZwY1op/fcxXtFPg33kxMlIhFEdxFPCCD
 kazWOUCetoWT6mIkreHY4NaoczYN74ThZSrybs2FlZLdKbXZVA/1st4naLlAc0FFOBbiPjmLLhI
 tzwkw53dj5fC4wKhbPcqyxTdM5yCO6zp5/qKXZJITGHr1vP6HR8gLpCIYzCBSRrl3+PGavwbnzx
 1QU/ZYbgCxJf2eLUY/A==
X-Authority-Analysis: v=2.4 cv=VPHtWdPX c=1 sm=1 tr=0 ts=6a15d4a0 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=TW5Qit177qQvJ9gbTQAA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: 001JFyRRZziHzFMSAeMUNZWPiToPfPLW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1011 impostorscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260149
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62814-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,qti.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,oss.qualcomm.com,nxp.com,pengutronix.de,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nihal.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A5C235DA6F9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Shikra uses the same CAMSS IP as QCM2290. Extend the existing
qcom,qcm2290-camss binding to add the qcom,shikra-camss compatible
string.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
index 391d0f6f67ef5fdfea31dd3683477561516b1556..7b1469d6a1601413a1a32dc452d7d1fc85aa9eb8 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
@@ -8,13 +8,16 @@ title: Qualcomm QCM2290 Camera Subsystem (CAMSS)
 
 maintainers:
   - Loic Poulain <loic.poulain@oss.qualcomm.com>
+  - Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
 
 description:
   The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
 
 properties:
   compatible:
-    const: qcom,qcm2290-camss
+    enum:
+      - qcom,qcm2290-camss
+      - qcom,shikra-camss
 
   reg:
     maxItems: 9
@@ -76,6 +79,7 @@ properties:
       - const: sf_mnoc
 
   iommus:
+    minItems: 1
     maxItems: 4
 
   power-domains:

-- 
2.34.1


