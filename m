Return-Path: <linux-media+bounces-51898-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AExFI5g9fmk6WgIAu9opvQ
	(envelope-from <linux-media+bounces-51898-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 31 Jan 2026 18:36:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0872EC34DA
	for <lists+linux-media@lfdr.de>; Sat, 31 Jan 2026 18:36:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5E29F305A966
	for <lists+linux-media@lfdr.de>; Sat, 31 Jan 2026 17:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AD0D35EDDC;
	Sat, 31 Jan 2026 17:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cOGeBMpx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dY4gWm1e"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DC935B621
	for <linux-media@vger.kernel.org>; Sat, 31 Jan 2026 17:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769880842; cv=none; b=DUd1+RnClZIZHnRb5+PMK1ccPIvX1HvXUwhN7X5qwBUXzXjnanLN3DT8rW0Jkl2l5xfV1d6NhnXYLg8a5LM1d3yTTWqDlFxwfghkww++w8UgCBMkFjK70xcWhSaeizqzZ3qGAx3H/4YR6b8ETnqtOFl9qw0rUfRNBM33dDR62FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769880842; c=relaxed/simple;
	bh=08Sn8ZyMBT+vHAsuVDVND86rYKzAvCUVmrUVd6L26SM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z2ln2BkMykcVJTraCVDSylVyczzq2WSq4Hco7V4wI0O/r2Rlzlt79yn/KKed7JlF1augWKjmT/MI7fk9aTGVG56fyipURKvJXn+65dDV/QyNAhKMdmtL+p5g1j1mljcnB05VNo2DDYeeAw7Ijto0zO4wJXydt/nKwuImIHzqAFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cOGeBMpx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dY4gWm1e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60V4SqwD3956224
	for <linux-media@vger.kernel.org>; Sat, 31 Jan 2026 17:33:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	szfYc8EHy+TFmXH57kCGj8OpDH95rbeoFaUQxs6n4Sc=; b=cOGeBMpxx42omYFK
	HqL3Xsw0dg/9Vgmzy4A98uAqLdjmUnNSrKhb/3YSZ25ZfrhyqTzv9dRNCF0+OZZa
	/cPkYx4M4Tmfm7ZCAQv9wTYXWDt+skzpi3wo20/iGBR7yLUDhPAd5kNnyNceXkOL
	HnL8jWCJkglUcLGqsiCcZ3SOyqbfT+zYQHKjnizbnKNNa/hYVy039FYVugDt6qHZ
	7MAfGLnvf3F4STYw0zDdD+qHqwK+el+1GNPmDsfQ7D0QJhBXs9B646mRmSHjWxWv
	RGVAf2Xx6sf6/OAG8lSvm6EQZxFHiCIZNCz2U9r1ZPI76nuyL+yoCpXLZ+peQdWi
	QCHx2A==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1are9760-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 31 Jan 2026 17:33:57 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-948a8f9c09cso840969241.2
        for <linux-media@vger.kernel.org>; Sat, 31 Jan 2026 09:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769880837; x=1770485637; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=szfYc8EHy+TFmXH57kCGj8OpDH95rbeoFaUQxs6n4Sc=;
        b=dY4gWm1e+gSklHM7t4iD0zcgRrvH+ULHxVhYF/u/V3N9kZVBtN1pePtwHoN0V/JPZn
         KAN89/B4Z6L2mCfceS/SWBzS4CsYBRhlSn2ga84XuNreoUdeqgfbz0KBJz2HtuQppMZ3
         UbfNQ1dlHjIQpSEvcZnnu6CbQ33Gh1k4a2sG3NvQAw7ZHYEs9NhS5sSw2O/9WNVvfdjZ
         ZMf/eoRDMn1D8z1HUZJaPyETjLSzMbFtwrR8WOZC+oQ9Xmqb1fY6BCuuAdb9wjyrZUTe
         IgrMfm9zaefrH27j/vh6Gd6jRYyEM09vJxBqY7nt7w1LnOYpNEgO0SzrpkTGWeQpiaFH
         HrNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769880837; x=1770485637;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=szfYc8EHy+TFmXH57kCGj8OpDH95rbeoFaUQxs6n4Sc=;
        b=edyo55SwbsKHvQFA8T+64ivSKD5bGsWCJ6xp5J9MeVplhf6Ppw3IoLnznpXsl1HECQ
         hgNFP9nUBhGbImk/sbRe7WtenyahPPveFyJAFiON2YRHO4xBuAlr1XHJOI69l98jR/3f
         DByGsQqJF65tsQDztZ5EEgW6jzp3uqZRxlMqfk+FQ8GdcfwrsssFzYz1JX82AmbFoBj9
         tIoZ59O04NmNlNkkcy56NTeIwSL7ldHc/nku1m5bfYloqU+G0Wme39FaAAnxUX5Lu1jY
         XrMcltv+4OfrUVqRYsF48J9yPS16vhQvZlbG7FJJNE6acjVFZwPM1pGrHY6OPa/DYOPy
         B/lw==
X-Forwarded-Encrypted: i=1; AJvYcCUNw3A283MlDv+AXD8yqoNlbG8CvbbClEgcxnCVU7p0syGQG8A0w2Yc9u/MdWiP5f2AA8zrIE5RkC2eow==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMnJ7hIYSJ7xlRfZpYo8yD/ZtMAFxKhA8xEj3QmABcj/3ctSqZ
	bVPqgGF0gl1Az1QaIdAwv3rjoplqOs/NK1kLX2ANEl+YsSmsF7eTts18FeONiFe2z2c0tGJxH7P
	pew0z7aBw/6eUMcRdHfNvTG788LxdNg2E+CuFPHsC7hiPk7HpgrFj24M+DXY2VpzqTQ==
X-Gm-Gg: AZuq6aJfOK3RKqF2N32IwRzLgIX6iZr6QB8TJeA1ppJA7gCNDq0PYQdi/2nERWNfpad
	1fJHQc7HmeaJs3pwfebqnu6aANms5Rg+fJ3jyZll6DVTs6hpqhcq6nCRZYl4rg76B7mr5GV04zY
	i1Dk1lpuIIiK0dpXf19do5KQge4Z+1yd6y2Jdyq3lQBp/IOyYhk1E4xvM+WjksoXAwiw4YBK9c5
	TpCM58XJP0T7Z/yY5ANzXf1Km7xZ+kNJQjPbE7w5uGtGodcyre/r39z3rCPdhbooSuBuOg/WyrZ
	hDlggGudq71tBKOm35JoJOo6kJ9Zm1edvwD/uiAEAXm9BtYiohP0JB/Vm8zMmZ76vZXJPYt2eTt
	FdZNo4bnxG1k8ZAopz08CL98jzbhpfs/h67voDb4lIoCowWJD7xhbJU4n5unBSUIe+m6kL7SI3p
	XrOhJ8sDg5NXkI8x++KewA/4w=
X-Received: by 2002:a05:6102:3a0f:b0:5e1:866c:4f8e with SMTP id ada2fe7eead31-5f8e26b8e65mr1754964137.39.1769880836728;
        Sat, 31 Jan 2026 09:33:56 -0800 (PST)
X-Received: by 2002:a05:6102:3a0f:b0:5e1:866c:4f8e with SMTP id ada2fe7eead31-5f8e26b8e65mr1754939137.39.1769880836266;
        Sat, 31 Jan 2026 09:33:56 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074886f0sm2443236e87.24.2026.01.31.09.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 09:33:55 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 31 Jan 2026 19:33:45 +0200
Subject: [PATCH 3/8] media: dt-bindings: qcom,sm8250-venus: sort out power
 domains
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260131-iris-venus-fix-sm8250-v1-3-b635ee66284c@oss.qualcomm.com>
References: <20260131-iris-venus-fix-sm8250-v1-0-b635ee66284c@oss.qualcomm.com>
In-Reply-To: <20260131-iris-venus-fix-sm8250-v1-0-b635ee66284c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1866;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=08Sn8ZyMBT+vHAsuVDVND86rYKzAvCUVmrUVd6L26SM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpfjz+zPoqz/eoiJnacBH8iva/2sQYAP1Xwd6Qq
 Zx1CTX9cZSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaX48/gAKCRCLPIo+Aiko
 1f9mCACUMyec5d/jvLJJCjWu5RjdehqEjU6vG1zasXi0iQQOPDTG98NZQR3hUN7rX/l91qP0/Rz
 k5GRldL+vN/9F/ct/8PkCOZtbBpvk4euAW2HlHY1I77lZvAIIFn2LYWpaDYktrV84QKGjvoDSYv
 05Kl60lfLs0+hkDazpjgY7YDvlFKt3/kifI3+36JGpnKExUq0j4lYypCtZjpwnWi17IXvsck3HU
 xI8Z4RZC+5BMoaceBiEZQffBSWQl6n2+JSj9UBSVjkuBKZ17Y8ykt1Kkab/4FpW229oavY5uB0e
 oy+1B4CkA9K+7i4n9ShUKLa6Hpj6Q8mHcVQ/zWQDOY9NUbeU
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=NNfYOk6g c=1 sm=1 tr=0 ts=697e3d05 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=V4YYwRrX08S5_i0GLdQA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: pYK-6qxNkxi0jwpK0ZzWY6T53FmMnkiw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDE0NyBTYWx0ZWRfX9MmiYUJ2QreY
 nbLlLpmQOcERVOAm1HcHiDdJO0sj+EFrpx+St0Cr6Jz+uHa9vFdPH4b5466OQ+VW2Nq5BTI3ZiX
 UjYspyiJT1jWcfetAFs1d6RhvlamQ5jAS9ooHUFpXg6oOnfnkpM+l3ylHEp14L0+3SFsdFJgkck
 rO9oK7CiloPW2S+Oo2xW/XBVMd1STZ3+OiFRm3W2xxjTKYrA5FX6hidIll3Fg+6nB+Jj7vX0xX8
 kwRvfY2nLAAc4VvOjgYDJFRM3JUbcmIwISvConmW29/vDNqJo4oqKnl6ZMcO3JD4YtP2uZfsiVy
 DbNKippQW4MPO5+zfxhYknOigPrZLot+xoLyzAKmVX5mFg6vu1GjeA6+40ffOpjmN27EZ8aYcyo
 TuB9CAmKQsGHXxq47W1118Yx1mMaioL0BQtQ+5wOjohhMMNAShinXtcLSdWtb04RkYnkWyFj9aX
 M0/BxaVuzpF2ozJLXNw==
X-Proofpoint-ORIG-GUID: pYK-6qxNkxi0jwpK0ZzWY6T53FmMnkiw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-31_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601310147
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51898-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0872EC34DA
X-Rspamd-Action: no action

First of all, on SM8250 Iris (ex-Venus) core needs to scale clocks which
are powered by the MMCX domain. Add MMCX domain to the list of the power
domain to be used on this platform.

While we are at it, drop minItems from both power-domains and
power-domains-names, it doesn't make sense from the hardware point of
view. There are always 2 GDSCs and two power rails wired to the video
clock controller and Venus. Disallow passing just two.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
index da54493220c9..04cbacc251d7 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
@@ -21,15 +21,14 @@ properties:
     const: qcom,sm8250-venus
 
   power-domains:
-    minItems: 2
-    maxItems: 3
+    maxItems: 4
 
   power-domain-names:
-    minItems: 2
     items:
       - const: venus
       - const: vcodec0
       - const: mx
+      - const: mmcx
 
   clocks:
     maxItems: 3
@@ -114,8 +113,9 @@ examples:
         interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
         power-domains = <&videocc MVS0C_GDSC>,
                         <&videocc MVS0_GDSC>,
-                        <&rpmhpd RPMHPD_MX>;
-        power-domain-names = "venus", "vcodec0", "mx";
+                        <&rpmhpd RPMHPD_MX>,
+                        <&rpmhpd RPMHPD_MMCX>;
+        power-domain-names = "venus", "vcodec0", "mx", "mmcx";
 
         clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
                  <&videocc VIDEO_CC_MVS0C_CLK>,

-- 
2.47.3


