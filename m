Return-Path: <linux-media+bounces-51895-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +H00Nxg9fmkvWgIAu9opvQ
	(envelope-from <linux-media+bounces-51895-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 31 Jan 2026 18:34:16 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B9CC33E2
	for <lists+linux-media@lfdr.de>; Sat, 31 Jan 2026 18:34:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3C4503004922
	for <lists+linux-media@lfdr.de>; Sat, 31 Jan 2026 17:34:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99C3835B648;
	Sat, 31 Jan 2026 17:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lEOcxqkF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UFao3Zyt"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441D634EEE4
	for <linux-media@vger.kernel.org>; Sat, 31 Jan 2026 17:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769880838; cv=none; b=bKO9Jui/iG2nsHc6VoHb6Q25wQw3HAZtYdpho8zHDxEoR5WNYHMIeFIW6qSokp+HRZp1/JrorThO8osRBx2tkIMvN+eFuMpt+bjJRoFHhaIa0uEUJwXjK+U/QGUGuA5bv5//tC/8WzYJqYL6wiN1diw6NAbjdMEOluixmuE0diY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769880838; c=relaxed/simple;
	bh=gxIXe2a72VsWyLP2OTPzaK3zyONPcQ3zGYwdMGiHXoU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TjJE3XOgIfYCtYvzSJbuHH2l7qaZTzYwkL4KBdkgz44ilKuayQBiBflYFR2rKR9uJiV10lbeQ+wheVgZuOa/seIkYRxl2AzcBsVF9CVb1gBhNjFjNTgyPY8RTOfTs97VOss4MRXYS6+jEG2cNzijDDw5N79khzYhhu/dVPFLbXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lEOcxqkF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UFao3Zyt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60V4cJqg4075688
	for <linux-media@vger.kernel.org>; Sat, 31 Jan 2026 17:33:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LnkMkrPaYIJyBxXxsPgIey4l4FW1EJfwbRE7eWiesw4=; b=lEOcxqkFZ/RZCfGK
	0Ge8jPYyCALiI+ejQnwxN7XLdXyxRVjurjE+5Tu4b3EcoRCaYPXMtrepL74q+Pf5
	svUPnAITg9tfer24qCtjmJ/kp0s7kuPUDY0Ol/Diive1MUzVbGOi8WKUXs1wy3PS
	5s9dDMsLC4x/Cl84FXoa8e0y+6Adkebg02ZlPcXQlei2HNFoWf9gVAPV9F9ix9a+
	+pAKNQI3KHf9HPqi1AtBO9pHO3FxlEbnYralrf5XBsfbb6kkyzvGOWOW6/us/GCa
	YSVfSrP/kGOQNTKA6DOtv8b7hmA1BsLK81kAWazVl3sCudIvo612jIpligh3D1rK
	ud8gkw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1avx16q6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 31 Jan 2026 17:33:55 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-948a8f9c09cso840919241.2
        for <linux-media@vger.kernel.org>; Sat, 31 Jan 2026 09:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769880835; x=1770485635; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LnkMkrPaYIJyBxXxsPgIey4l4FW1EJfwbRE7eWiesw4=;
        b=UFao3ZytVD7Md5AXkkCLKIraYPc1CdJOXNECfUnG6GUe8daeYXsHJsi8g8+t1OlCEi
         zUq4H0PSv3sxQ+N3+hzm1B4uQksWV+cZlJOJBGJCk1l51dKvCy1Szs1OISResPwpO/UX
         xh+0u/5LMTql2wav8AIF2Ur4gHqQaNAU2ikOS4Nh93LGMP0Vz6lehY9OOyUHBQ1a4NCF
         WE4dYu7JN5Wfa7XrtndSIKYmgBPSHFzvk0bSSRfEvLtzhCC51+qK068VoaUwjgI0jtws
         lzUQX6er6WTf2sc8zvGCh/O59QN6YAAE8ZCpQct5ptJWeeIvgTWSnFxIvlOTXZajfBT9
         lT1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769880835; x=1770485635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LnkMkrPaYIJyBxXxsPgIey4l4FW1EJfwbRE7eWiesw4=;
        b=Q6NN/hyzP6AF/U2vKtf/84IhMXr+7kztNSyvbdavfZFdeSUzezhk++fLn9i+QPnFUM
         LY80shcrkyZsjSGNL+lGo1DBoYc0SFoXQkMtKCpx+EMoXX1qTFW2DHMQmFBgXQjnihVs
         sfCm5zwLh3LhzeP1+oT/4kyO42byOepc7RPrPf0r466Yf8uIOW0NReZq6gFIqBAEAhaS
         2RMi269G1D1l/X/qJqGDJ2OZDf5RMAYratyKKzWIoSvclRn/YsFXbjqq31qiQPLg+5E7
         v079H72/42HddypBrTg3ZR0RliHhfVV1t8/1E4OC9RNbvVbmka8v9iTxjexjjLrolVR5
         qr5w==
X-Forwarded-Encrypted: i=1; AJvYcCUfHRM+a3wcH4OB5A7mFfRf5wJOC7FLW/wWDR2EfOcZH7fy6y4eG6gbWqjg5R2K9fUQ3kQV+1GBMAKqnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQZ1KifKTIEAKZN26QpYf46fiL6NQkr9Uj8pCHUj6ifTah4FmS
	jhQ2qpT3sXvyuWyZnHnYJw6RqQU0oMznX8umzS0LB58Y+YvBmrncE21Li+DeBpVWspP9b1pYgwA
	wWc0gV9egqctqo8KtOqxQOc65Pq/MCRstmHUUSAQUQxwSgfygAY5YSq8c5ZAzHtqQ9A==
X-Gm-Gg: AZuq6aJgTJqFz96CAf2hRf+IY3WwM1Q4DBY4+d/ZME9jz5pIeeNiI10fG2j2wl0S8w1
	BSjwJOB0V70s3dhVGBTwGmydXUXyRKyAmEKmN9/NYTlXCV+ZEufNYkZOO+qzRycF/tgHs9+P1VS
	Ako2wqG//zJpZePnUVjF1y+K7pgH/VQ5pIsikxR2A/WYnIg0D+WiTG/aqVGjkcSNVgEDcg53UB5
	HurcUn6QknnwxbfjF/HrZ68hyQsM2GvP1rNfvZIfFHFBqP8oqqVD8JMU8d6Rbd+PYEMjBAYBT6j
	c50GXxAxnJYZ+JwiTDMcK0/CHqe3r9BN5rTBLEmslluEaIzBJZ9WSxp1nIlHgD+dwbBTNvXKb3O
	JtXd45IGZJrwIbm7xO6AR3nJ0jW5fRKIc/AeAj/YEIWeOT/9CA+th+RTxHginM+0prIc3zJrXJm
	HxCltnHfTweNm6BmWW7BhG6KA=
X-Received: by 2002:a05:6102:3f09:b0:5db:e909:aa0d with SMTP id ada2fe7eead31-5f8e2680347mr2120373137.37.1769880834495;
        Sat, 31 Jan 2026 09:33:54 -0800 (PST)
X-Received: by 2002:a05:6102:3f09:b0:5db:e909:aa0d with SMTP id ada2fe7eead31-5f8e2680347mr2120358137.37.1769880834040;
        Sat, 31 Jan 2026 09:33:54 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074886f0sm2443236e87.24.2026.01.31.09.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 09:33:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 31 Jan 2026 19:33:43 +0200
Subject: [PATCH 1/8] dt-bindings: clock: qcom,sm8250-videocc: account for
 the MX domain
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260131-iris-venus-fix-sm8250-v1-1-b635ee66284c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4456;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=gxIXe2a72VsWyLP2OTPzaK3zyONPcQ3zGYwdMGiHXoU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpfjz+eoeVMfDYYw75vpqNs7V1E+zQjHrSxMmSv
 +LTxLC7m1eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaX48/gAKCRCLPIo+Aiko
 1WyDB/9U/zcHxjkGDm8rSQS9eHLureXekhc8AaFnvEnAw+TqC6ZC2I6DeWjAwmzfIKbM8OO/+mK
 Sho3VOV0JofuRh+M0Ctv/N8guezhTnhMQfaVAnPVPCM8QelFYPIB+CGWJwNzUGX1+nYXCjK7fd5
 LDWH1NOXB7jGb1YfAeTU6tFZwf9bVGcTgo789JoUD06JDJ4FmF6euIJKG7tesH4KfMCoQ6L6He5
 Y4o9Tv+xTLUuDy+aXO/Ht63YTjbtQ99LfPAif9QwPjZj8ajq5VMmb6yc7k4mlg9HnGErujSlIk0
 Jb+GOcMbL+1WPG2lW9h2iQ3YWtRRwy2RhwAmH3D8KjfuLFBC
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: HnJus2XpbyVBGrmOgITeUC1OZcobKUxV
X-Proofpoint-GUID: HnJus2XpbyVBGrmOgITeUC1OZcobKUxV
X-Authority-Analysis: v=2.4 cv=P4w3RyAu c=1 sm=1 tr=0 ts=697e3d03 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=-c0xKrEOHdUQarD6WDgA:9
 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDE0NyBTYWx0ZWRfX2D0eIaR3B+gl
 gVlxNVrf0h5YDY/qj7XxB+eKL1UvYcp4kTKnN/Iyef8tfHPSQfyt90uUnegoRI3MP0B6L8MZcSo
 ELmwBjpc+yX+DT/14tWMSZq/pGV6tuaNhwjxhC0JqF5wxrk91S2vG5c28FrXXtr6JlePpYhamUz
 wXKMS/pkVGjJ5hQUEVj5Wqtn3ulil6sAGzZ/14VgH9Rf2BpucCjAJ7zOtXziQ77WxBQVChzawqV
 Rui0l/6Rz0uM4krvm/6OKw3iwCAks6a/VqsqwezwHi5HGqCzgiKDrKsZZWPKeLiPbhA15a+G2dt
 pnEM1MPAZ3hGgazEd2evr1mnn7bd1snBidFFeYaP7HLh10nFdYHdXWb6eClZQZnvrE2IL0RxAUz
 hkVftHjk/PTrMUSTRzVGQt7u9AAZQMiorseadmw76acxqFMzobr4BXxjU90lZLWstzZ9Dz9sScw
 3H7QC+0YTVZIwTXuqeA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-31_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601310147
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51895-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,quicinc.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C7B9CC33E2
X-Rspamd-Action: no action

To configure the video PLLs and enable the video GDSCs on SM8250,
platform, the MX rail must be ON along with MMCX. Split the bindings
file in order to provide separate file utilizing MMCX and MX power
domains.

Fixes: dafb992a95e1 ("dt-bindings: clock: add SM8250 QCOM video clock bindings")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8250-videocc.yaml        | 80 ++++++++++++++++++++++
 .../devicetree/bindings/clock/qcom,videocc.yaml    | 20 ------
 2 files changed, 80 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8250-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8250-videocc.yaml
new file mode 100644
index 000000000000..94264c309c65
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8250-videocc.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,sm8250-videocc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Video Clock & Reset Controller
+
+maintainers:
+  - Taniya Das <quic_tdas@quicinc.com>
+
+description: |
+  Qualcomm video clock control module provides the clocks, resets and power
+  domains on Qualcomm SoCs.
+
+  See also::
+    include/dt-bindings/clock/qcom,videocc-sm8250.h
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - qcom,sm8250-videocc
+
+  clocks:
+    items:
+      - description: AHB
+      - description: Board XO source
+      - description: Board active XO source
+  clock-names:
+    items:
+      - const: iface
+      - const: bi_tcxo
+      - const: bi_tcxo_ao
+
+  power-domains:
+    items:
+      - description:
+          A phandle and PM domain specifier for the MMCX power domain.
+      - description:
+          A phandle and PM domain specifier for the MX power domain.
+
+  required-opps:
+    items:
+      - description:
+          A phandle to an OPP node describing required MMCX performance point.
+      - description:
+          A phandle to an OPP node describing required MX performance point.
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - '#power-domain-cells'
+  - power-domains
+  - required-opps
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+    clock-controller@ab00000 {
+      compatible = "qcom,sm8250-videocc";
+      reg = <0x0ab00000 0x10000>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>;
+      clock-names = "bi_tcxo";
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+      power-domains = <&rpmhpd RPMHPD_MMCX>,
+                      <&rpmhpd RPMHPD_MX>;
+      required-opps = <&rpmhpd_opp_low_svs>,
+                      <&rpmhpd_opp_low_svs>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
index f4ff9acef9d5..8676c7e22b4c 100644
--- a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
@@ -19,7 +19,6 @@ description: |
     include/dt-bindings/clock/qcom,videocc-sc7280.h
     include/dt-bindings/clock/qcom,videocc-sdm845.h
     include/dt-bindings/clock/qcom,videocc-sm8150.h
-    include/dt-bindings/clock/qcom,videocc-sm8250.h
 
 properties:
   compatible:
@@ -30,7 +29,6 @@ properties:
           - qcom,sdm845-videocc
           - qcom,sm6350-videocc
           - qcom,sm8150-videocc
-          - qcom,sm8250-videocc
       - items:
           - const: qcom,sc8180x-videocc
           - const: qcom,sm8150-videocc
@@ -128,24 +126,6 @@ allOf:
             - const: iface
             - const: bi_tcxo
 
-  - if:
-      properties:
-        compatible:
-          enum:
-            - qcom,sm8250-videocc
-    then:
-      properties:
-        clocks:
-          items:
-            - description: AHB
-            - description: Board XO source
-            - description: Board active XO source
-        clock-names:
-          items:
-            - const: iface
-            - const: bi_tcxo
-            - const: bi_tcxo_ao
-
 unevaluatedProperties: false
 
 examples:

-- 
2.47.3


