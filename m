Return-Path: <linux-media+bounces-60920-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iI0mGUHM/Wk9jQAAu9opvQ
	(envelope-from <linux-media+bounces-60920-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 13:42:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6EF4F5E62
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 13:42:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 865473060CAB
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 11:41:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E4C83DA5B4;
	Fri,  8 May 2026 11:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FNyOayMQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fshGi+zx"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D74389119
	for <linux-media@vger.kernel.org>; Fri,  8 May 2026 11:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778240476; cv=none; b=oY1+bVY3/9b2S0S9g3M8kYxpZJ7H4d51X7Tg3SbawK6H77Y4UASE9x12I7Gy3lSUVVup93hbO8CFVkibB65OWsAIH28jj/5e17gHtQIwype2dVW4XJcQU/kW2pxcfaQLw9UixnSsy6zUlU2X6702XEX8TFZgkvO5ZqaSBd7O2Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778240476; c=relaxed/simple;
	bh=UpO0rU0mi9erTIQVebp4pdEk7Xnc5TEa+Cg/sUI09nw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KQsGPQES1EyD0bzWc0gmajCM8ZM2BdYbpi5T2gwpUrGqdJJh4ak2IusppGiiH6c9IEvZeFCjdx2lPmjfhjrpqs2mUX5eDSXM6Hb7yvddaH2WyYxzpXDhOf76dqPUpWu/NR++Xr80cSbkszolq+yg27in5mASgGIA7OSwX3lP72U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FNyOayMQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fshGi+zx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648Ae3Tr2198694
	for <linux-media@vger.kernel.org>; Fri, 8 May 2026 11:41:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ghOFHSQuRa6Ho3W8UeptFZ9B3PI3azR3W1imEZjn6dA=; b=FNyOayMQZgekDSWV
	wwu553aUT2EqbAY+oCGT9hGUfsG1DdscEMmYi/ew6eTYyRF9kEiHGev+XaUfYxwc
	9mZXX6ICNv8w+crVOl3XUK2WIw4rZhEcSe02aCLdbdeTQ6BHp8D3pJcUCMWRgtP1
	UIuXmEoKk856ccQtD9SeT6FsRoO7I0i5zA5Y50IqDh40Cmo/3YY9eaDkZDToOL7I
	7yES11RmInFD4u58t06y49/i59R4ch8JqIubO1Wh9KY62EfJ1OCxLBpzLEeQqhGu
	0X7VwUtxmMNSkSBWkrrFuaHNSkTHzQnn+jQjZaas3JD6TX3spymmAWDN17K85uB+
	B8DX0g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e119sk4w5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 08 May 2026 11:41:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8d60fca52b9so341881585a.0
        for <linux-media@vger.kernel.org>; Fri, 08 May 2026 04:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778240474; x=1778845274; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ghOFHSQuRa6Ho3W8UeptFZ9B3PI3azR3W1imEZjn6dA=;
        b=fshGi+zxVthPFkpbvZCsTGiiYEMiRV9I2ngXeAFu6dSbbY5a8MrkaZkWsjTEiZIkiD
         BYkh5kJLdIUqDoOf8WzMTwIYWnW8K3Qv3QUbWnK5qjfPL4Xx5WqQyKcoZLAAxhClcuqa
         Tp6P/kd06jyOnLw0RO8Va4Me4ecQWsYFbu8YVEBmx3cXwUpoCNB+SkDRfd/i6rnCNV6e
         2vIEjtDH6QEPIaZ8QiU5/O1FAw+KAE2vWA5zRbySySEOq2+a7evL1LEicPopxeTu3hX8
         ngKKuBAueTyVq3g9pksebe0mm/kP1kbxs1lP8/7SOJgAroFTFS6Mx526T4gDudtawsRy
         4daw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778240474; x=1778845274;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ghOFHSQuRa6Ho3W8UeptFZ9B3PI3azR3W1imEZjn6dA=;
        b=K5sHur0vVQvzp6gI3vyRB82ZGuFV8YeMsIFba/pL8XNnF1u7ZUuBM1JHgnMO6/DnM6
         HbNU6ysdEQNcissPw5AVPYR+uP0KWoJ/I6vpw+pMcLMDAgMM+CRSJI3NtbK8Mf3hVAxy
         glZFsIrdMx2UpPdsjAXQFWapz2+Q8MfzhZhsQtW7+9itWr5szrnmI+OdXtpExKq68wYU
         8wKlB8QbI6IBv/qU3iwOXcebAY2TGuvX1QcU2Z39Izx7pNkNFl2IV58bsmru5BrVGjz+
         qGVT1QtAz9XH9W3H8aMWHarLdeMvH7NJs+bt7bM/vjd2ecVVKQENICcr+f/yRa9OiF/w
         lTWw==
X-Forwarded-Encrypted: i=1; AFNElJ92agVV5gEUCX+S4Q5iAg50h6EJBDEu1AFveAwDIl3IRMLDIsbm+6jPmgZNFyoVW3jlKmIlG+7jd04eVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGC5cwT/S3tl+JgDePHlkuMUlwbOwl0ExemCvojlWiG751wYqM
	dv9hRh9EkQld18tHtjlMVeJPyaxRiiK1YCtgOhVHGSiaOzIAHDE5uZ1SRLA6KdsTXjnnqUtKe77
	vEHKeQtZGXnTmY9DeYN55V55IC09PPV1I+qsMf/5F9xAT4d4BnEh9t+choVXFe8tZBw==
X-Gm-Gg: AeBDievtECLq4LfOdg+YW6MgSjlg4qeY8v+OXMH3fvPy/yjO3Eb2BEXLHmJ2ucAz12H
	cWmxVokeGu67ti8h2X7WPOn6trEa+to0Ha2FKxqh21q6GNl4gziTzNxST7COj0ogAEU0AzDZSqI
	o94hSw2DLOzqJkl1VC2hXzA69RnsDtWeB9zBrUMpTuFEGT6zdUJ6lZNkFiAaPChEQNGdzGUJb3W
	Hp7Hyu8YWBnc4FAgownC6zkWC3Hn5ueAW94IWDTMsWxefW4jIlQ1O3SAdC3qULHINAHMrknfBSj
	/BZ8TrCpz8yib5Id/a8blmM84Yfihp3DJc7/ebT8gX/jiIPhlf21R4DgvuSPN+AfbbyNnB7ls0I
	67KXCkbIMDxXpklPITRAk7sQ7t3p8XVTmFokdGP3UlTm8C78wQPuvMmsYlbmPIBerMBqGFd6FBf
	8qmdnb+GXxZVxx
X-Received: by 2002:a05:620a:f06:b0:8ef:b8ea:ef21 with SMTP id af79cd13be357-907bbcb5509mr301029085a.55.1778240473860;
        Fri, 08 May 2026 04:41:13 -0700 (PDT)
X-Received: by 2002:a05:620a:f06:b0:8ef:b8ea:ef21 with SMTP id af79cd13be357-907bbcb5509mr301023985a.55.1778240473393;
        Fri, 08 May 2026 04:41:13 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b8d9eed0sm179193885a.19.2026.05.08.04.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:41:12 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 08 May 2026 19:39:58 +0800
Subject: [PATCH v2 2/7] dt-bindings: media: qcom: x1e80100-camss: drop src
 clock
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-hamoa_evk-v2-2-3ebdca3e4ae2@oss.qualcomm.com>
References: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
In-Reply-To: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778240451; l=1837;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=UpO0rU0mi9erTIQVebp4pdEk7Xnc5TEa+Cg/sUI09nw=;
 b=1N5m7IXU4vcqQJsxsnYsp0BMpMjLjRx9B4fnHZosjGScLcw5C0SgfrQ/U1KxDULZ1OQulzVc8
 1guV2e05li3BYyqi9EsJrtel3LOtrNg7iR+Lh3fDZ3JiPLyMK1MR64f
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEyMSBTYWx0ZWRfX/cHAYkkXcM7J
 +hqvQIqBDmDhVHHevMNr6o9ZFm2LKzzNnzMDgcPaYCrEclYoinm0lcAhwK+wSxq4KPZ/uwrPp/d
 Y3XKgMpTYfyJELW0zAB5t8QncvX+yl3Af90joXI/UfklsdkWOJPUkfYoYgu/kLbJdviEcfx6gCJ
 Iz7xA56Pb6yOdqANJvTPbQU3WrJ+UBjmAB1yVUsWVvEwh8hsZtneUS+pFXJ22leCLplO0ByyErW
 Cr2/oc/Cgp6I5hl7ikuu4ROQyhjY9iUstu8l9QVtA7pAeLEw1R67lIwZsqhNFIAahUwI3GacAb7
 7LX4ZiKyTxx4GrRypJBTGO/w3pHPiaPnyOCxEteY5IG3gCq0TKtZbYEXmqXK/EHUCE1KHUEZ9ny
 ELA7GUDR9XBu5zhAdAZXiolSr0XYRvw6qmFbt9P2wD2gdwyDqenl7P8XAWQN4kfaQ7Si+4J8RPz
 sEOvBxvMSPE2Cj3G0qg==
X-Proofpoint-ORIG-GUID: 4VhbOjTYe1xn7NGtKU3s-grdrzjd0rCT
X-Proofpoint-GUID: 4VhbOjTYe1xn7NGtKU3s-grdrzjd0rCT
X-Authority-Analysis: v=2.4 cv=Dd4nbPtW c=1 sm=1 tr=0 ts=69fdcbda cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=5wa7HSqufaon_BCSTwQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080121
X-Rspamd-Queue-Id: AA6EF4F5E62
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60920-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,nxp.com,pengutronix.de,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The src clocks are always-on parent clocks and do not need to be
explicitly listed for CAMSS consumers. Drop cphy rx src clk.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index 126400772d028811c9efbb1443144ff4f264fcad..afb659b6105f018214a5eaac4dea7fd51c0d42bc 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -40,7 +40,7 @@ properties:
       - const: vfe_lite1
 
   clocks:
-    maxItems: 29
+    maxItems: 28
 
   clock-names:
     items:
@@ -52,7 +52,6 @@ properties:
       - const: cpas_vfe0
       - const: cpas_vfe1
       - const: cpas_vfe_lite
-      - const: cphy_rx_clk_src
       - const: csid
       - const: csid_csiphy_rx
       - const: csiphy0
@@ -252,7 +251,6 @@ examples:
                      <&camcc CAM_CC_CPAS_IFE_0_CLK>,
                      <&camcc CAM_CC_CPAS_IFE_1_CLK>,
                      <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
-                     <&camcc CAM_CC_CPHY_RX_CLK_SRC>,
                      <&camcc CAM_CC_CSID_CLK>,
                      <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
                      <&camcc CAM_CC_CSIPHY0_CLK>,
@@ -282,7 +280,6 @@ examples:
                           "cpas_vfe0",
                           "cpas_vfe1",
                           "cpas_vfe_lite",
-                          "cphy_rx_clk_src",
                           "csid",
                           "csid_csiphy_rx",
                           "csiphy0",

-- 
2.34.1


