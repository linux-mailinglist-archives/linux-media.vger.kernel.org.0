Return-Path: <linux-media+bounces-51503-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2J35Ido3dmmTNgEAu9opvQ
	(envelope-from <linux-media+bounces-51503-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 16:33:46 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03614813CA
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 16:33:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 701863013A8F
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 15:33:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 797C2325488;
	Sun, 25 Jan 2026 15:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L1V+T9cB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N9F6Yw5o"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364EC3254A9
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 15:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769355188; cv=none; b=S9yyY6kdKGFVaHoQGO1VRyls9HKFJmk95TtBpiMEN/DXjzYhhFkATjFbfailOm4Nu65Q34lLzZXXPoDWSFHlfkPlKjKLgCBbuLgNARzFx5+wZnRPBehpjXYVw3oeghoui8JY8xlGLCf4J1Ie6HIAC4zQjYlcn2tr+blxraq+C2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769355188; c=relaxed/simple;
	bh=hLnX9O+jNkWp4eIwqeLrNV1GLUMHqOPIj1AAiPtuF4g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fBqnRGdZYFewUVsEfJ/+SCHD+Biwpb3cr3qAMXpttPL4VlMJa6LIezhxOfPbfeMR4OF1Lf5mZ+z0ML4N2aRO5LK4ihAZLEP9PJen/uodGPK8pk3rExgXOG5o88WfNt0/+K+il8IdzI+pYNud9GDPbEgfWC+zkc4Mh6iILLLgTHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L1V+T9cB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N9F6Yw5o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60PCfs4I3641310
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 15:33:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AKNJUo95dhWW3QqNfHAa9QPKochcB0AESW4u0Ff6SDY=; b=L1V+T9cBMR8tvw7i
	s4+IrQgBp9IDEBXcIZA1/CZZBu6GjvSMWNULIQNZqlFyMrNE7g4aGN0AyGTY14bo
	aKWXL6h9uS7LNii+8kLJ2vB4ikuDQfIRWVgd8vXBnZRT2c7IXHQ+FhI1z6wS3b2j
	VZeFMzJaapKMuFLrbOV69Oe15dHYE57tOvPJIQUCNK+qUUXVJjtidNheWTYgyC3k
	aUuj8Vjfi/WhJeXDqWD2q8C83TI85vdrFrp8Eyl+Uq73CQsZPttR9nFnjyPABtRW
	3rUujqU/ehPV9VrJoTNJLWUB+kRicd8BkdokHELkRTAifofZks5h20TbSRLyhNt1
	ZmxdOw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq9qj9v2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 15:33:06 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88a344b86f7so133829256d6.0
        for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 07:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769355185; x=1769959985; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AKNJUo95dhWW3QqNfHAa9QPKochcB0AESW4u0Ff6SDY=;
        b=N9F6Yw5ot7TeVZWJuEb8V4JaYe6F6klB9Att7+VcwTevG8dkmJ/ubPda6UDuui5IxV
         aXnkSOWdpJMNVpYBPkaBVYP5cH3O3ueEhoe9iByYvlqkTc7n5q2exsl6MU+/gxctZN4W
         cdzcWPNCeA/jgrgShbS9E8u3aYq83etI3KocbQJ4KqMX+T1WJNDjxpKdO5+LdetLk109
         kxT4fG42IHKeiu2qwx7UZOlg17F5TqxCQ8WAyMky138XWko2vYyXEUsW7D+eHjnJsgYp
         cpZZS5wqF6SsQotEikoSd3zXCXYUVHgPY8pxeT5PZn7+Dv6ch0ysM/H+lNWrEh5cKLvN
         AZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769355185; x=1769959985;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AKNJUo95dhWW3QqNfHAa9QPKochcB0AESW4u0Ff6SDY=;
        b=MBqZsW5d4O9ghrS9BNCJ3jLKFzv0AONhcos0KduHnzxYOHpE5Gltzo6fSsPMxuPmBD
         IEkRMdNeHlul9lTJcMLVy0JilJ/ABJyTnZYsTHZVM2FCV14ysU3Sc38XQXIXP73xJPI3
         FcvyyVl3ldtBgrCP7VbLgTiAI/qzf35HGKgJem/jlPaRYCilCQ8ExJFxHpCQydlvsfpY
         6JmwAJs8LUg0A/uUT28zmsjy+AH1i+brM677IVslrxt1rbpDlVWMezQHacZHnVhXT70j
         98ObCrW+rhK80vbGzBYdeakxaqihpCASvOsyXt2P8xf77XwKxD5AY5r+engyNMa9yx5O
         wKCQ==
X-Gm-Message-State: AOJu0YzacMfl4PfI++AZtvew2b35oxbCBzWnlL7+66v/y89J7UNWdJap
	TG5ribL9pT3s4oktKcTerteBv7Gh3aNir90ggPMyT9mEB9F28pgAAN7ACakeFYrixZTiz6Wg8AS
	TyEOJmNnY074DAYXNqCjxy82hd6ZwitKmtKCk1Og9uoJSmXDiCXAf6u54wkaSaWitrQ==
X-Gm-Gg: AZuq6aLFX7zre6RVDAoxu8QmVWWszgOs7OwasESDImwnIZ7Z3t+/LC8V3z3RAEzk0hT
	JYkGayOXAOOWkLQ67DJeA+mLDIKBm6BE1A3a+Ywtb/r7GMSwzwY3fZdTJle77mIMmJEQCH9NHef
	D0AlZgbiTaPjo2liZQq71iaAzCQMQFqn3ofWyOYQNNJzVcSKtAWd+NUPXYCvV7ZVUblYF9rD20R
	ydSvZO055hlWmuuHIjCjgayAXATs6sx2gBaT4a3oAozuOBhBGBigxPi1ofrH0+XQfZSlNDwlOGH
	61xvrfwdE572ZIAieX4uMDubRr+MQrOBKHCusM+5AFb/8Pjw+Tvoe4kLVmnVGxRX+gcUnNV09cp
	xD9fNrr9EWCwaHYAlswlww98TVx4EdQ+r5ga4rAfqyiGI+w9LgXxyYy2PY9QPcKaPvxkNdU/gxO
	aFkxTt5rqT+pHu32NUUh/xMMc=
X-Received: by 2002:ad4:5dc6:0:b0:88a:589b:5dad with SMTP id 6a1803df08f44-894b071a436mr23645406d6.27.1769355185449;
        Sun, 25 Jan 2026 07:33:05 -0800 (PST)
X-Received: by 2002:ad4:5dc6:0:b0:88a:589b:5dad with SMTP id 6a1803df08f44-894b071a436mr23644966d6.27.1769355185011;
        Sun, 25 Jan 2026 07:33:05 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385da1a0a45sm19154661fa.34.2026.01.25.07.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 07:33:03 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 25 Jan 2026 17:32:58 +0200
Subject: [PATCH v3 1/7] media: dt-bindings: Document SC8280XP/SM8350 Venus
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-iris-sc8280xp-v3-1-d21861a9ea33@oss.qualcomm.com>
References: <20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com>
In-Reply-To: <20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3992;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=EyYfaE2Cufcr0C/0jDHR82fWre92I+G4XxMx5Yzq/OM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpdjes8MYBCmo3Wm0lvyaJTzAclQ/Nl+tieRCkV
 oPuih9D6auJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXY3rAAKCRCLPIo+Aiko
 1el4B/4vr69MPVnkCtY9YDLjQL+XGXW4slJ4UWKCBWfqVJ5w/1GiILoudJezApXNF2QGlFyp5kH
 hW0m6qtYj231v7x60eDlRVXTYI5GhAgIpHY6TljBIApEWtZ1RtqObuZ217g1y4gZYCzfHHha1Uo
 hq1wcXpBDLNBamMtcvNd2k5YsYLFsyQYZLWB2xKJYQG9eVmdk5PnygYnUWRxRgJu8FxVscKLf8N
 aboJPmB8jQkMVK8+ilKl8giYK+nyMafBvT14lToIM15Xli+9vjOe2wIT7eTH4H43w7ClrchAVqM
 vsXjCyHnia5YWxuJaHxAyUhqkA6ZfwlGp4psfn57WgnXOL0n
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: jq8gy9JHLBk2yxcqpBk8UCZrcD42VZ19
X-Proofpoint-GUID: jq8gy9JHLBk2yxcqpBk8UCZrcD42VZ19
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI1MDEzMCBTYWx0ZWRfX3anKx7uE3Dsy
 XvTdsGsIZuaqKKH018kU7dGo3Mmq/uqfveg5Jrk+05/TQU3QK/mBp+EylPmxnzPi+Gcb1xSTmOh
 rtOxJ7m3r/q+x1+szcmXtfZmZwNFIwzISqHsgTkFsg9+Q1DmceP6w3BVgQjl7X8/Iu1IjgbBrv9
 P3pBrx9GlU7Z4EYndO1PIhvWCnXfvJ54qwfCR5BYCbR5fpoVzy5wCozRVLi5j+Q4n+/XrFHRkAA
 ghHyqEA6a3YtV55SVsNvrjvf4KAxcF+azfHggW+lI3YcLnoYRggCZgEAo2ECwj8Tz8OuUwvM/pY
 TFqD40p70xsZ7lcIaUpEvhNj8Z3wQuUgFVxBm/YH+NhTJg/LlDIYtsqkJo6EXwDIkAMCb76ZU1T
 wCIl6e+NtBVKoP47WU1lkB2r7lscTL04F90Y5jmNXI62lIHGfvfk1nEPVIZMZBjmUowuDxw5KnN
 AgWavEdYKIjWc/tp/lw==
X-Authority-Analysis: v=2.4 cv=TsTrRTXh c=1 sm=1 tr=0 ts=697637b2 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=gdo2EkX-Jlq9hQkSyREA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601250130
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51503-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,aa00000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 03614813CA
X-Rspamd-Action: no action

From: Konrad Dybcio <konradybcio@kernel.org>

Both of these SoCs implement an IRIS2 block, with SC8280XP being able
to clock it a bit higher and  with SM8350 having 4 VPP pipes, while
SC8280XP having just 2.

Document Iris2 cores found on these SoCs.

Signed-off-by: Konrad Dybcio <konradybcio@kernel.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
[ bod: dropped dts video-encoder/video-decoder ]
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
[db: dropped status, dropped extra LLCC interconnect]
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/media/qcom,sm8350-venus.yaml          | 113 +++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8350-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sm8350-venus.yaml
new file mode 100644
index 000000000000..d78bdc08d830
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sm8350-venus.yaml
@@ -0,0 +1,113 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,sm8350-venus.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SM8350 Venus video encode and decode accelerators
+
+maintainers:
+  - Konrad Dybcio <konradybcio@kernel.org>
+
+description: |
+  The Venus Iris2 IP is a video encode and decode accelerator present
+  on Qualcomm platforms
+
+allOf:
+  - $ref: qcom,venus-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - qcom,sc8280xp-venus
+      - qcom,sm8350-venus
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: iface
+      - const: core
+      - const: vcodec0_core
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: core
+
+  power-domains:
+    maxItems: 3
+
+  power-domain-names:
+    items:
+      - const: venus
+      - const: vcodec0
+      - const: mx
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: cpu-cfg
+      - const: video-mem
+
+  operating-points-v2: true
+  opp-table:
+    type: object
+
+  iommus:
+    maxItems: 1
+
+required:
+  - compatible
+  - power-domain-names
+  - iommus
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,gcc-sm8350.h>
+    #include <dt-bindings/clock/qcom,sm8350-videocc.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,sm8350.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    venus: video-codec@aa00000 {
+        compatible = "qcom,sm8350-venus";
+        reg = <0x0aa00000 0x100000>;
+        interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+        clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+                 <&videocc VIDEO_CC_MVS0C_CLK>,
+                 <&videocc VIDEO_CC_MVS0_CLK>;
+        clock-names = "iface",
+                      "core",
+                      "vcodec0_core";
+
+        resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
+        reset-names = "core";
+
+        power-domains = <&videocc MVS0C_GDSC>,
+                        <&videocc MVS0_GDSC>,
+                        <&rpmhpd SM8350_MX>;
+        power-domain-names = "venus",
+                             "vcodec0",
+                             "mx";
+
+        interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+                         &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+                        <&mmss_noc MASTER_VIDEO_P0 QCOM_ICC_TAG_ALWAYS
+                         &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+        interconnect-names = "cpu-cfg",
+                             "video-mem";
+
+        operating-points-v2 = <&venus_opp_table>;
+        iommus = <&apps_smmu 0x2100 0x400>;
+        memory-region = <&pil_video_mem>;
+    };

-- 
2.47.3


