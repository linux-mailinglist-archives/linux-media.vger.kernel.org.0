Return-Path: <linux-media+bounces-51481-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIBpJKEYdmnXLgEAu9opvQ
	(envelope-from <linux-media+bounces-51481-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 14:20:33 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C17B80A66
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 14:20:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2E87B300159F
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 13:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF4772165EA;
	Sun, 25 Jan 2026 13:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vb5N+hbG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lap0JOMk"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F671D88B4
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 13:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769347227; cv=none; b=mSvBp6sqdIgPNldP/vdOxOiusbf+VCjxEQId4lzHgh97SU+VuKgwj4RvvNhNqZR4e0bUTePHw8vybvhfnubiWvb9hDhroY5fk+bh6wuCjrdoO04NUlGzM774akoO/kGID3RPbiHNoT5XnHDQTWssSjDbhGbTqMHhTkCMrZzDaq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769347227; c=relaxed/simple;
	bh=skqlWBY/wCYkgVt5IolVW0xx39KoZJtHK2vn1MxojUE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=B4dssUDCWhX4B4xINW0cS2ADi0iBAYy1fSavvD044d+hZWZa4MFCy22GG2u9IMB3rvZTPvcpnn89TiMC+x4ktYkHTjnKtDG8N5NKBan761JqDtFMojqC77TYXj1G+7d5ub1HJZiaYO/pRbNSnffOkUO5POl6PbNXajeN6N2cvXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vb5N+hbG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lap0JOMk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60PCrI8x3958254
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 13:20:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=iwaz8oT5hZR89PDl9bmdg/
	LNNA0vlIFNPHol8Xet/No=; b=Vb5N+hbGq/A5Q3tDEknM/5dIOIWOD7o4FIqdWX
	DSiFhYEwoG7htBAkAWfIB4O+TK725FHywPHhh9yt2/nPw+LIy7ZDEg0VEcfNZydp
	WK4B1utUPkwEGF4CS6UteOIbSrzeMsEF5uXkVsjqNn31jyhDqYnmZQnvF3Kvvqdi
	teM8RxMKBOZYXeEaqB7oHouDVw9D9m9s28r/x63E7j15kve3tUSOb/0dKMGElvzz
	tik1NfKa11q0oLXP/gSiwcY8mlSpaCNQtz22MYlNqBCdx3Hel/2hk+7K8W21UmwV
	Hd/OF/qw0p1ZTAUPCX9U1mpTf+Ua8886uWxsuynctAuOA2ig==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq9f24xr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 13:20:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6ae763d03so380443585a.3
        for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 05:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769347224; x=1769952024; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iwaz8oT5hZR89PDl9bmdg/LNNA0vlIFNPHol8Xet/No=;
        b=Lap0JOMkZ2UpTz2FlEpwWRsLgUpo5RbNnSlF6LL05Zk4FmA61XcmJHFE5hyUtdwa4L
         zgAnDja26AuytyJx7ZQNQbau93m38CvmYWDs1ARDh3peZWdrikDqkSLnsw8lPGgH+jgo
         zKtXOREGHXyJaFaMu7TCSzv8sj5j8vK5cqFOWCzZhaByweYskghTcxsUH1cgbZTnaCYQ
         TL1Y4paQJUB69kUCOQ0RZkSYkxyty8SctG91KbROk7Leo4gIlitz7ikMcLhS5io8mwKL
         SqwLfnieYK8/rsg1YiHRG8OihxlgUoueDErWZG6rAkeN8rLPlHRZ2x7djp4+HSVqA1in
         B+Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769347224; x=1769952024;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iwaz8oT5hZR89PDl9bmdg/LNNA0vlIFNPHol8Xet/No=;
        b=s97CqYePcN0bWJqNMwOE2hYmtFCaRO2NXqWbCACoXzKdWLJv4U0SBv5wEn6itZuLXo
         ctOKpqLQf/qR3KMCRYiqJ0or+vTxxkRfOCsprL+LTsWXQ+v5VucmbZcgwLckIP95oOit
         qywXxuN8dYPLGNnQY9p1llZXr2nMeaGPzG07Tlzn3hwWnGY3r6jae8cgVhwTEO4ym6QK
         KuOoUD0KPcDQ5CubMeVn39jhO607Wzjt+sF8VNG7TJVAOvS5y96/kYT5+2jsVk8v33d4
         wGT3gob/vktZN1qod4ZEbZN3mMlVuZ/ndUUrglw+TBDjlFp6vP9SdDdqbgSLc/vtpr/f
         IMYA==
X-Gm-Message-State: AOJu0YxzW3kEUsWxOPYZg7qvFu8DIPaYD7jxOcRBLpZB4/OOAbZBNjlr
	nvLHWKtTnx1/rKXwEi3I8NABQ0kCcHGo/kvOkSMnMbqsQX67ueQwIScwJdS6g8fgk2veJzt2PXr
	J00qy0T0eCnPZ7+bNGtGIP7HLto2ErBrmg3OK7iRubYvxW1qwB/MJ4Nv/SeJ1arV8+w==
X-Gm-Gg: AZuq6aK//dxhJrf8J/ZvpKAILFDuTO2e15q8ClsRF+onDcBsD2+ch7AWD5rm7EoE66O
	bWzERrAkMC+znmX54WdzBIogX0Y5Bd6ysyGvZPERCkT6Juu6sjrD3LGVDVMvFsATDOdalPWU3ck
	0LBEmvHMRRZ+FMW1BFX5evbCRIz8a87gHP2AouL1tsYuTTWm9j/m58ZBb4oPnLIyFd5Li6uWq/q
	HHCKpekpR5VVzmVxfHN7SeSTW9/xlrJ+5t6sh0Aw94lGjm1I4mKe/VkuwuyjcUUsepfxQuxVnG+
	y5VXD3lZ7xj3xSoy8vvCsfeWMoz/xndSgckKzjaTmXjy3oU6xILEtMgVyEaEiiwQvpBOo2s6Ad8
	9Vy1oeojNwLraKkgqjKRGBoEQZzclWgwkzFoblLCbap7rlWDnZ96SDwb4Wn/XPN6CwTlvM34KlC
	s5lQyH8W7NoGryUmWzna1b3ek=
X-Received: by 2002:a05:620a:17a9:b0:8c6:ac29:70ff with SMTP id af79cd13be357-8c6f9614ddcmr173855185a.52.1769347223685;
        Sun, 25 Jan 2026 05:20:23 -0800 (PST)
X-Received: by 2002:a05:620a:17a9:b0:8c6:ac29:70ff with SMTP id af79cd13be357-8c6f9614ddcmr173852685a.52.1769347223220;
        Sun, 25 Jan 2026 05:20:23 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385da1706b5sm18901821fa.24.2026.01.25.05.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 05:20:20 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/7] media: iris: enable SM8350 and SC8280XP support
Date: Sun, 25 Jan 2026 15:20:17 +0200
Message-Id: <20260125-iris-sc8280xp-v1-0-2c5e69fae76b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJEYdmkC/x3MMQqAMAxA0atIZgtpSkvxKuKgbdQsKg2IIL27x
 fEN/7+gXIQVhu6FwreonEeD7TtI+3xsbCQ3AyEFtIRGiqjRFCnic5nos3VLCuhdgNZchVd5/t8
 41foByNOL1V8AAAA=
X-Change-ID: 20260120-iris-sc8280xp-85d13bc60536
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
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1578;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=skqlWBY/wCYkgVt5IolVW0xx39KoZJtHK2vn1MxojUE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpdhiTwoSKD91SnWIxTLA8wnMwaNH5ga3P5A6VN
 D5gJlGoX6aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXYYkwAKCRCLPIo+Aiko
 1bGhB/9UKbk9LmFGKUarLiE1Onoi9AUODKqYjaSNi4eSGB+yf8UQ/pm575AtXRkNJWULE/81L/x
 Bm8y397QjtK1o/jj6Yz6IYPfkT1q3Dx26Sl1VwC7f8T181k4TzS//XKSVRATPXP/VkqsHIn5p9p
 f89Vdl7gTuG6zdVStpv80y+tfoiVI0TkiVdQYnVqus5yCqa9Lidl6IcXbTd5kq2aX5vc+8AfgTU
 NsO7a48mYJ10T9ceAnlRHEx9x4tNfyW7JXEb/GtFOwI1v2LJZv1c0f9ugaGl8vXxcr2Y8bf+VhS
 1MAJXQRZ/3QPF9r4UBaBg5KkS1smYduPjHEiF1JtbmdJJMXy
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=YLGSCBGx c=1 sm=1 tr=0 ts=69761898 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=DQYNr5bCLwCUZgKOTBQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: LOJolIs-W2II-D_gp-83j2F8EYcM35gn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI1MDExMSBTYWx0ZWRfX5ROZerD+9A8p
 /XyXyfivpJQ+zDXXFvx1BpJ94HTnl6avpL4nxFjG0ROaYuB2BYLxvh0c1KLUhEO0CfcXpMLnK3W
 oo/VA9ZGlbEZ/qpcX7bYpiYxJUdzqVb9qHe96yUCqbtjpu9REXEPLz7WrEiayX20rFqwNX4Ic7C
 XTBPBr7kcKLiDF2V5ONYEZwQIyRaZDEcnOYrnhaa/1BUOJLTnDYAoyXKld6i/wv54Cfu8hF7QR6
 ZNbVM52m23NqTg1rXesytWRq1XsQ5XP1VuqVrlbDt8TT8RpHz6Hgy0WIh3TwN45P5WNG1RKuoHc
 9uPqxOKjCFl2NjntrJ1pmXQQpxxBY+mlNtSTlgCdAIYcyPvuyrKCEO6CXe+EB23CR4EOBJw0yKW
 Gvo2FaJ2tV6HCI7q8Krr4J//FOxwWVpE7CaMk6RZ89sWjffNPya96ZlaadFWRTtkB5S31tQNTbK
 doWxe0+dOmdkRv89pNw==
X-Proofpoint-ORIG-GUID: LOJolIs-W2II-D_gp-83j2F8EYcM35gn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601250111
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-51481-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7C17B80A66
X-Rspamd-Action: no action

In order to enable wider testing of the Iris driver on the HFI Gen1
platforms enable support for Qualcomm SM8350 and SC8280XP platforms.

The driver was very lightly tested on SC8280XP and (due to the lack of
the hw) not tested on SM8350.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (4):
      media: iris: introduce SM8350 and SC8280XP support
      arm64: dts: qcom: sc8280xp: sort reserved memory regions
      arm64: dts: qcom: sm8350: add Venus device
      arm64: dts: qcom: sm8350-hdk: enable Venus core

Konrad Dybcio (3):
      media: dt-bindings: Document SC8280XP/SM8350 Venus
      arm64: dts: qcom: sc8280xp: Add Venus
      arm64: dts: qcom: sc8280xp-x13s: Enable Venus

 .../bindings/media/qcom,sm8350-venus.yaml          | 113 +++++++++++++++++++++
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |   6 ++
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             |  93 ++++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts            |   4 +
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |  72 +++++++++++++
 drivers/media/platform/qcom/iris/Makefile          |   5 +-
 .../platform/qcom/iris/iris_platform_common.h      |   2 +
 .../media/platform/qcom/iris/iris_platform_gen1.c  | 111 ++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  10 ++
 9 files changed, 410 insertions(+), 6 deletions(-)
---
base-commit: ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
change-id: 20260120-iris-sc8280xp-85d13bc60536

Best regards,
-- 
With best wishes
Dmitry


