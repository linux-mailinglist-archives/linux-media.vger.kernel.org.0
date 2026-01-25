Return-Path: <linux-media+bounces-51482-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8O/lGwcZdmnXLgEAu9opvQ
	(envelope-from <linux-media+bounces-51482-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 14:22:15 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA9880AB1
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 14:22:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D243302593F
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 13:20:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E62522E406;
	Sun, 25 Jan 2026 13:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HTxOHf3M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hIUjCFhg"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8643126DD
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 13:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769347228; cv=none; b=alU6ug3wNBdb1Ac9cBJ9QifBo2jhjLuQIGgmBJp1V/dMPltTRx+mA5y0Nbc5sRFNYlwXGbnuFz3hwD/pIFmGD939ymOG+r3yuYW4OrIdW37k4B7lohkd0+EygX0nDpQC35EXNjVGq3j8RECC47L+VtQZEahp+vRrNv+yLSarMVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769347228; c=relaxed/simple;
	bh=hLnX9O+jNkWp4eIwqeLrNV1GLUMHqOPIj1AAiPtuF4g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vb0+G7FfuvfzADshdPltI86AWuTPqeXD/g213/FelZecdy6e5mK9CF6BwgROKdJHcQpw5lqyShFrIXpdTg2tDMc0IEyyVpd4nG09uTREgHsC5epEdrrPcuYpC8MSwKPYbY9Wcoj3yLSAZmM6NiUs/9ahucPHg4ZBeJlHAeaELMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HTxOHf3M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hIUjCFhg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60PBKGKJ3479783
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 13:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AKNJUo95dhWW3QqNfHAa9QPKochcB0AESW4u0Ff6SDY=; b=HTxOHf3MmmwuUmVn
	BJVkRo4OU9JyhDrTbbsekGBoKIYsETs+zRvK2000RSBako/fIDncmL5p7/bN5AUB
	yUE7MQHC0Xc4ogrEBQ8TDM5n4+Dh3Uuz+oSNwkqvVnuLFKHx0PqVRxm8IYNCz3b0
	EzT5JFOB1SD6v8MfbdKkqUzJOOHnWASOMtVvNZWca/DF+GcqrjZJUqYLGjii36ed
	PISidraUs2jZ4o85ek3OaBkAFz/PoLjDA0w31Om5UavFWUHJgPD399NjiSwyJLdV
	iGDULFrTUbC+G51HdUFOsrCQSyF0ckAcWEuN5Pkf/h1K5/gF3ZgZAThD6hSMPkl2
	4mcOwQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq9qj4sh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 13:20:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c53919fbfcso954138785a.2
        for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 05:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769347225; x=1769952025; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AKNJUo95dhWW3QqNfHAa9QPKochcB0AESW4u0Ff6SDY=;
        b=hIUjCFhgOltp73Dx01Y8oh7WQrMQOmFThiLTTghx2gcKZDfVuJwmACW4UyVuA69TD1
         L27I1YkWp8jQLdDlxumVsh0uJRK9IpYgHZbZOmiQTSNJYnhPC0EaAFg71DfVTVzMhHK9
         jmhtStZKezkI7VU6qmH+qvCPiB1h6Pf3Z4yqckxHCWtd4U3zKLnmNDaWnYNDmHb4aMAR
         Rwpq6CUSHmXAVN0vf2587a8TdeE4hfqPbl8JKHN7yg0CrPDCM1x5hT+1QMO+KmQqGVBe
         csRlGbs+pYrJx8hjtmT3JDlww/c4dgx3mroJoc2l4heYIKxvO+BvVELQvfIt3iVt3Udi
         g4ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769347225; x=1769952025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AKNJUo95dhWW3QqNfHAa9QPKochcB0AESW4u0Ff6SDY=;
        b=S5DxjDxSI5VgBI2hhSfxK3M22jXDftuCJWvt0DoC3SeFkWk8hegGN48YYehjQ+I7Tw
         0jFH6w7b4WaRuLJtbMD+o6SLN0EspYU4OV2NyBTUcdLy8jCs5B7dAV6lgY++5ycddFr2
         7JpqwhJGH7tfBxpXExkOUvE+mG09ngVUj8CMNT1goew14GUPr91cwpPnm2XhkWmkLSgN
         TMg+xT3Y/cLb0s+xorytdoL19EuGqyfdS86GgOVat92B59HzgDdxmRUSA4mxRLD+i90Z
         m76V7cpvzw5Yffda34KuKJPqPuAnEFaQb44C02FL7BB1kz6OKq7QuNf4Jbe2/gPNRNeV
         mxNg==
X-Gm-Message-State: AOJu0Yw5EWwJgeLJvesN9tqt6Sc3oGbeW3TspuiGui6k2P+TWrUXBVMx
	WGjwwa3oQNzASBxqlk+EcsywoypY5YNnYIcHBe+lEasK/sV+4/xGyS9fXrPKWz74KqRg0rRsNGV
	NRz4lC79JAN81SeMnUMpv3fS+FWhOSDb7Jh/ByAJRawZo749qQAZkJIY9xfGvxwVR9g==
X-Gm-Gg: AZuq6aJtFbf8RCyMMvVKIAxOsxzhIKiXHKGXTGstCqpx+xlwDnRzFrw9Kl0KnogwyaF
	917kpibv+kHlMBjw2zMVWYBGHEuOwooWrD+xm9/vNN4sndnTqf8p4/oycKY7rRMqvYBhFV/MUZc
	Ko5VFHgP0IfxwID9GA/0Pse/uBhzc5RDvAWhQXFo3Z51nBctg0zOfyurR2xId0hx8q+z923Dgwt
	UByYFsJuaJC3t5jz7VILeHk068R/jzNbsewcbWl70KUGBGVHJhLwA7j41LS7wXNMoK5Ctft3lzd
	Wk3Z3Hon9WIJR71T3U0qaOqEZyc4ye0I3+UlEmeogzobcDL3L7dzuTR8rkGw/rLfU3sOCLR+zMA
	IVlM3Bzry6yiW0SaB3IirpbWQDbpVKW/jpedc58v2UjcL+r3KDuLT46Zq0Ni2J+QXYyTI39NTOV
	q1LU4FqikwHocuHUcWE2W+Ncg=
X-Received: by 2002:a05:620a:1929:b0:8b2:dada:29b4 with SMTP id af79cd13be357-8c6f96639a6mr161300585a.63.1769347225136;
        Sun, 25 Jan 2026 05:20:25 -0800 (PST)
X-Received: by 2002:a05:620a:1929:b0:8b2:dada:29b4 with SMTP id af79cd13be357-8c6f96639a6mr161295885a.63.1769347224509;
        Sun, 25 Jan 2026 05:20:24 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385da1706b5sm18901821fa.24.2026.01.25.05.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 05:20:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 25 Jan 2026 15:20:18 +0200
Subject: [PATCH 1/7] media: dt-bindings: Document SC8280XP/SM8350 Venus
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-iris-sc8280xp-v1-1-2c5e69fae76b@oss.qualcomm.com>
References: <20260125-iris-sc8280xp-v1-0-2c5e69fae76b@oss.qualcomm.com>
In-Reply-To: <20260125-iris-sc8280xp-v1-0-2c5e69fae76b@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpdhiTDbVeALeWN1YKD1oR1muEfgt3Nxo52xbi9
 tMw3qgFGgGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXYYkwAKCRCLPIo+Aiko
 1ZUVB/9fga1FbcrjGDtqACvtdvLTggEHjUkBwMjlV8F52M2tcinUrLSDjSBfrqsbWNKwJ9bR3Gk
 fgCHAoWuDXvb+qQQ0T2gdTpCc3irfVP2KeYuPAu8CwM2/9uDtMA0pxuxaRx4nysaKVW5QZcKKkx
 pWuQnKWATv4zrE+XDjQn6q/UIX6bvUz4g1HZd2TtsZC8nsNl93HVJWQ1ELUe8hU1LhXFZMtHiks
 s9xhi8wc+xvZ5R7REwnyYNUugKTHnWuzR+avO7boSbPIsEAiFT4JHKgg5GphSy6cX20At7M31oA
 avpaGcdZnXeKemKlU7o+mfgLBBb84aMpR6ziTPxE9tsHbA2R
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: UhmUd-zDOD9qgeTkJPzc9j-CgRPOhb37
X-Proofpoint-GUID: UhmUd-zDOD9qgeTkJPzc9j-CgRPOhb37
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI1MDExMSBTYWx0ZWRfX3KWjoiJi6AGS
 pSuhp+58dnhC3vktAmWdJMUoltH+pO3aYuesyEvupruMMMbEc4ij78QqMbfVaCiCFJxXRil+jgM
 LCGsawJN11t942+d7zMal12lCclIYXLbS7ktFihOXtjEp8qvt47RTH5D6FkpyO5PtGLD8bIcdws
 MYjsuhOkGEDMczyxZf9F10Ho3Fc+4qtAefqs4mPgRBUucs1XkR+TVz6YWDHA8zWdOLKGcp9irIc
 5LJWorIiM9VlZBsnOds8zdyUybfFVP+4Sp0dLU1PwPASQZ5IsxkKT/02mo6VTLFW+10CcEfA29g
 r8wyxnLloqPjgX1O0T9I9Ye/oN3I7UpWyB4BeD9LsFODUYSCaCxLXCgXXzj9ZfKimU81mqyWFFH
 LGtOJwgajeP6lynnqZCRWKQeXuZ2G7s2+6rl8avs1wRnZ/uaz4pn4kI20ntWHrjU7b7/bPnlPuL
 fLWvNseHaiam5SQJfMA==
X-Authority-Analysis: v=2.4 cv=TsTrRTXh c=1 sm=1 tr=0 ts=69761899 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=gdo2EkX-Jlq9hQkSyREA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601250111
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
	TAGGED_FROM(0.00)[bounces-51482-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,aa00000:email,qualcomm.com:email,qualcomm.com:dkim,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: CCA9880AB1
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


