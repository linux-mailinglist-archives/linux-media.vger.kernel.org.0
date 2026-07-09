Return-Path: <linux-media+bounces-67178-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iDUPExqpT2r9mAIAu9opvQ
	(envelope-from <linux-media+bounces-67178-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 15:58:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF282731E30
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 15:58:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=m2g5lnVX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Cd92nAJi;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67178-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67178-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9722B3005644
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 13:45:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0399637187C;
	Thu,  9 Jul 2026 13:42:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C13D322DB7
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 13:42:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783604565; cv=none; b=JnTog6JbEugYDhsFqS4FvwbLDK7pMO+ycGKHcKFX8WdyZXt+nF7WVp2CQe3OwnkZxMRWlQmBu32iu86oVm20DjGndZc626CrEywWD8BvGOEhTpnUujEeo3NfAugGJmc5YEXgznY7r5d5Wi/yYvobsWI/oBIjRNvYrzP1u/3A0+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783604565; c=relaxed/simple;
	bh=vkseAOLIrP2KLk6K+RDLQ8hFJs8asbshIm0T6yXh6LI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S4Bx4QWZyCk6/QsTPDQUM8brZhcRyVn2a70gISzRfEr7+3cfsBOjWeLGzXE3OPI6jBPZEpZSQ+G5W7rYhC29B+gHAorPxKC1V1gvyiJKLN1yDR/89YMVVyo762IJSbJWZ07upBl67p+YKZS5tnPJpbfI9qixfDNeFGiWkynoY6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m2g5lnVX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cd92nAJi; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNCSI1450485
	for <linux-media@vger.kernel.org>; Thu, 9 Jul 2026 13:42:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8Qjb1/XyevtOUy1B242OiyfB+Vt6ZEal0epIKAb67iQ=; b=m2g5lnVX4W31ywSF
	6eMQBKOiSAtOQn0rbKVpqSnUwbedQJEuUC9XnnP8WP22fW52RouC+Ag5X9h6sehE
	wsfYBKC6jr/t052UqRN0g0Bu98y2XGnFAuleNZgm1szyrGAOWmH/0+smDnBxTz6p
	mn4zOHlsUgzEiJyBligzqdBwawBwZTT15FxjCMzOmTwocPc7Ufr3yeckJc5iEhgr
	9HSVNfsKL26uB2Q2Bc7+xSyP5U2842qa9u7rOkIPdE4IF63wKG05U6b7LFekJQwe
	CGHJjDzFjNZmgWmOI69vfNGZJPPowjnaqDVNzk1iIR5j2n/FRuQR5BmRrJHqz7z6
	wTjzhw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa55vj7rr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 13:42:41 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-738de163061so943998137.0
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 06:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783604561; x=1784209361; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Qjb1/XyevtOUy1B242OiyfB+Vt6ZEal0epIKAb67iQ=;
        b=Cd92nAJi759Bxqs6PilPFyWzN6Wqm6mxyVA1Jp+eN7zUInc0t0mH+T/jf7SfOzKjc1
         b7z2vl93drRAtPKM2LyX1pFz0TgMLA2SEtSlPK1w+Y1AMzZfiz8jUrlG3ehHqakNC3TY
         9YlfyQSdTkb2BfOnchHrEZQ1hrLk8hzIhseMqAJyWaGyWpgHWjZBY7/A+jj0YmEJFv5E
         53DSUwUkm5gnDzX9IfovVZVEyWSlKRxU0hpcvhZxspheOMOXX6fb6rML+knKY8J892tI
         9oue/qdzTMya2xtwnCIgIF8eDxtrpEhAbeA/tNJFMl1cr7HrVoh7wmLOhAL0Y1fRM2Ea
         8ghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783604561; x=1784209361;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Qjb1/XyevtOUy1B242OiyfB+Vt6ZEal0epIKAb67iQ=;
        b=oibe5xaPnVNff+/va9iWCrD3sCSTqB00Yen/7g7dexoXO9G2qyfFLw/BQTQBWPtzP6
         RunPlZwdaMGnDACfB6i8LQ6SW3uBYsOnmGbbuz/N2bWn7QeHx+xuL0VKgMEBWEY2Ys+k
         cTk4LoOAlTk0RgunsQIIyJtO4Ki+NLrEut3W2enVDBUP5jEk2KcDjsvxD6G927p1f2qY
         8Bvb9gS7KrBfryoppD1O7jzLn8cydcgeHmmEZH3jm1JXs7roOqxL3T2FL5OokY8lvM2v
         auWbzeWaBylRX1KxpmC1bshOzigYtn9qKmuxQ9b1pjPWsYWnUNvB6AZvJCtdZlCrgAMJ
         PFow==
X-Gm-Message-State: AOJu0YzwwXCPKf9QZD6WB/iLm8seB9kz7iOj8ZpXkVmjyrJUAsdcsZWL
	TgAQxYz9O0oNNRcGzq5eu6oA/HkqoaWDH5/DyllrVR+bYif0bkVII4qEqFAimp7NTtOrHkgVTSn
	4ybAoWoFFUpB6leLiIpV7/RkIw5Icsx4hW1anppXQejCyGMlNJJUp0QWOM9j4y6PbKQ==
X-Gm-Gg: AfdE7ckB4J90OYc5m+6lXBJi2xvrNCuL22ptVSygHxvrEqptzFqzJGjRhZxlx2FyA0C
	NfCjrjkdj8H7kGQgm8F6py7BptmQj96GjjmvRqg/uxC8F5f0q/GrsHeP3MJk3nEh5zC7qpIhEK2
	0NDgSU4LAeZ+iXfXD7jnXvIMx2WToZraVCg4ZOPryATdyNrn8ZmKuZYVvoiV5tXSNSlwtoDr9Hp
	zVtQNL3vTMDmABAi9rFKTPLD/GTFrz+ErMnJ8l8HoPi/22tCAVmRE5QW/ibfiDjXHwyp593EN5j
	syrCfUYGPzgsIX2Ur6JzTzy3Y5QQhLaKZO39maTO1dDEjVIBSfhGuzimB7RBrBr8RG2ivKooQEi
	Q8OF5QzPqxy62hbrV9eiZBFvYhiu9ghMtFd59Z+lLBfaMdE5rNE+aekWSBS4hscUbCVfe8F+RBF
	9CnCpePEctoFlOvOLJ/AJ1vVUN
X-Received: by 2002:a05:6102:30cf:10b0:744:ef7e:8f85 with SMTP id ada2fe7eead31-744f67809a1mr1316418137.15.1783604560360;
        Thu, 09 Jul 2026 06:42:40 -0700 (PDT)
X-Received: by 2002:a05:6102:30cf:10b0:744:ef7e:8f85 with SMTP id ada2fe7eead31-744f67809a1mr1316403137.15.1783604559782;
        Thu, 09 Jul 2026 06:42:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c849186e1sm3345151fa.9.2026.07.09.06.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:42:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 16:42:07 +0300
Subject: [PATCH v7 16/18] media: iris: add Gen2 firmware support on the
 Agatti platform
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-iris-ar50lt-v7-16-76af9dd4d1f6@oss.qualcomm.com>
References: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
In-Reply-To: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=22260;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=yK2XmEPHFT52r/rJI+aHnGOQ5Ermmd5EfRxQBeaG+6M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqT6UmI/vfQ6+ZKaKG7aqzn6rr34Qm766CITTtd
 OYB3J1mBoGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak+lJgAKCRCLPIo+Aiko
 1b6yB/sHIvGu0Kdfbz+Mw7tN1G2fiCOrwvcLCED/mq1FmVPnET3wWjK+xOmtY5tK9As76faDyrB
 LtMbGXKvoBrV+KoOm41g7RvH81y8H9wGNL3uMzt3VnJN3YGF+/qPLGeHYD18g1XnPbiESP3d2Bu
 AP/ywLhLx6IDDJw6um8pOFSHqceGBcWQeQ/bt5U2f+gKCIIwQ1h1NZZJQbi4YCo6AK+cuzWiUPv
 Ce8cC2gyUs2EkZWHyB5ZHYCC2DvQS4fERYSF/2dAtPa8rKDPZw2kQnS0Zh6e7Efh3xcOYxuFMlL
 WPwKeghonv+cVgCAaSZiyZxnrtSC3xh3oJmPZeHuY/Q7itsa
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfX0Jp0jWcnZzqI
 DZsQTOBb+igzaPUK/pjLeTtJ2A7Tqp40szEl/n28B3jd/wYw++14TbGhvYMwUkBC5sALr4Sa7FP
 GLfny2HhgFdbLY7GH+j3t6qPWKmkidVLImoIj3TPge8X9C6df29cyBWjU0WsaRIiHJKUk0Wg+oB
 h0m/rbRCuQk5r7if+QBnHSg1IFNClvdgA3Vqa8O/fpOGBhxXWktrTqO++f3rJ+6xMPPvm9bsLoR
 y+BbaSg5OMkiNiRrIpfOj6k9y/TY1gYvc1K5lk9HNkgl1vsL9ahePLy1+nPcXAix72vHokkzGI+
 wyVCEdcWdjJIrJmE1kQcUQLV6uOoXHuX7d/rbWQpPb1DV8AIU1lKlSmuJCxRc8soCZZBvyLTLQ/
 TvWYqHgLEx63Wte0CwlAjEo7pPNQLml4qot60jihAb+mrrSe0hyFSJ13yy8KQcXYSmOoWQ06+Bh
 HQ0j6fRUbBrvSXOXLzQ==
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a4fa551 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=GUEZgOuAT4xZVSXxJacA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfX39doNNTpt8sX
 bEz+/5UJDOyVrf4EZ3sh6/WppT8bcquiaGHH0FY2VHCcsVbwRJ/O2+wYNF4EVK7XPjcbXkU+hD7
 ueLGOGUxvpeaP4vkzW9KRpQl4Xh1BnA=
X-Proofpoint-ORIG-GUID: Ezu62Dk3QYqdoCpICeZCG7HsXnrhWOHz
X-Proofpoint-GUID: Ezu62Dk3QYqdoCpICeZCG7HsXnrhWOHz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090134
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67178-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AF282731E30

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Agatti platform is using HFI Gen1 firmware, which is considered to be
legacy firmware branch. Follow the example of the SC7280 platform and
extend the driver with supporting both HFI Gen1 and Gen2 firmwares for
this platform. Like HFI Gen1 this firmware doesn't have PIPE property
(but unlike Gen1 buffer sizes are calculated on the driver side).

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 613 +++++++++++++++++++++
 .../platform/qcom/iris/iris_platform_common.h      |   1 +
 .../platform/qcom/iris/iris_platform_vpu_ar50lt.c  |   7 +
 3 files changed, 621 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index acc0ed8adda1..f89245269e8c 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -1118,3 +1118,616 @@ const struct iris_firmware_data iris_hfi_gen2_data = {
 	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
 	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
 };
+
+static const struct platform_inst_fw_cap inst_fw_cap_gen2_ar50lt_dec[] = {
+	{
+		.cap_id = PROFILE_H264,
+		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
+		.max = V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_HIGH) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH),
+		.value = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
+		.hfi_id = HFI_PROP_PROFILE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_u32_enum,
+	},
+	{
+		.cap_id = PROFILE_HEVC,
+		.min = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
+		.max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE),
+		.value = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
+		.hfi_id = HFI_PROP_PROFILE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_u32_enum,
+	},
+	{
+		.cap_id = PROFILE_VP9,
+		.min = V4L2_MPEG_VIDEO_VP9_PROFILE_0,
+		.max = V4L2_MPEG_VIDEO_VP9_PROFILE_0,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_VP9_PROFILE_0),
+		.value = V4L2_MPEG_VIDEO_VP9_PROFILE_0,
+		.hfi_id = HFI_PROP_PROFILE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_u32_enum,
+	},
+	{
+		.cap_id = LEVEL_H264,
+		.min = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
+		.max = V4L2_MPEG_VIDEO_H264_LEVEL_4_2,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_0) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1B) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_1) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_2) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_3) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_0) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_1) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_2) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_0) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_1) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_2) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_0) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_1) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_2),
+		.value = V4L2_MPEG_VIDEO_H264_LEVEL_4_2,
+		.hfi_id = HFI_PROP_LEVEL,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_u32_enum,
+	},
+	{
+		.cap_id = LEVEL_HEVC,
+		.min = V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
+		.max = V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_1) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1),
+		.value = V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1,
+		.hfi_id = HFI_PROP_LEVEL,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_u32_enum,
+	},
+	{
+		.cap_id = LEVEL_VP9,
+		.min = V4L2_MPEG_VIDEO_VP9_LEVEL_1_0,
+		.max = V4L2_MPEG_VIDEO_VP9_LEVEL_4_1,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_1_0) |
+				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_1_1) |
+				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_2_0) |
+				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_2_1) |
+				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_3_0) |
+				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_3_1) |
+				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_4_0) |
+				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_4_1),
+		.value = V4L2_MPEG_VIDEO_VP9_LEVEL_4_1,
+		.hfi_id = HFI_PROP_LEVEL,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_u32_enum,
+	},
+	{
+		.cap_id = TIER,
+		.min = V4L2_MPEG_VIDEO_HEVC_TIER_MAIN,
+		.max = V4L2_MPEG_VIDEO_HEVC_TIER_HIGH,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_TIER_MAIN) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_TIER_HIGH),
+		.value = V4L2_MPEG_VIDEO_HEVC_TIER_HIGH,
+		.hfi_id = HFI_PROP_TIER,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_u32_enum,
+	},
+	{
+		.cap_id = INPUT_BUF_HOST_MAX_COUNT,
+		.min = DEFAULT_MAX_HOST_BUF_COUNT,
+		.max = DEFAULT_MAX_HOST_BURST_BUF_COUNT,
+		.step_or_mask = 1,
+		.value = DEFAULT_MAX_HOST_BUF_COUNT,
+		.hfi_id = HFI_PROP_BUFFER_HOST_MAX_COUNT,
+		.flags = CAP_FLAG_INPUT_PORT,
+		.set = iris_set_u32,
+	},
+	{
+		.cap_id = STAGE,
+		.min = STAGE_1,
+		.max = STAGE_2,
+		.step_or_mask = 1,
+		.value = STAGE_2,
+		.hfi_id = HFI_PROP_STAGE,
+		.set = iris_set_stage,
+	},
+	{
+		.cap_id = POC,
+		.min = 0,
+		.max = 2,
+		.step_or_mask = 1,
+		.value = 1,
+		.hfi_id = HFI_PROP_PIC_ORDER_CNT_TYPE,
+	},
+	{
+		.cap_id = CODED_FRAMES,
+		.min = CODED_FRAMES_PROGRESSIVE,
+		.max = CODED_FRAMES_PROGRESSIVE,
+		.step_or_mask = 0,
+		.value = CODED_FRAMES_PROGRESSIVE,
+		.hfi_id = HFI_PROP_CODED_FRAMES,
+	},
+	{
+		.cap_id = BIT_DEPTH,
+		.min = BIT_DEPTH_8,
+		.max = BIT_DEPTH_8,
+		.step_or_mask = 1,
+		.value = BIT_DEPTH_8,
+		.hfi_id = HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
+	},
+	{
+		.cap_id = RAP_FRAME,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 1,
+		.hfi_id = HFI_PROP_DEC_START_FROM_RAP_FRAME,
+		.flags = CAP_FLAG_INPUT_PORT,
+		.set = iris_set_u32,
+	},
+};
+
+static const struct platform_inst_fw_cap inst_fw_cap_gen2_ar50lt_enc[] = {
+	{
+		.cap_id = PROFILE_H264,
+		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
+		.max = V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_HIGH),
+		.value = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
+		.hfi_id = HFI_PROP_PROFILE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_profile,
+	},
+	{
+		.cap_id = PROFILE_HEVC,
+		.min = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
+		.max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE),
+		.value = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
+		.hfi_id = HFI_PROP_PROFILE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_profile,
+	},
+	{
+		.cap_id = LEVEL_H264,
+		.min = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
+		.max = V4L2_MPEG_VIDEO_H264_LEVEL_4_2,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_0) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1B) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_1) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_2) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_3) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_0) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_1) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_2) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_0) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_1) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_2) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_0) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_1) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_2),
+		.value = V4L2_MPEG_VIDEO_H264_LEVEL_4_2,
+		.hfi_id = HFI_PROP_LEVEL,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_level,
+	},
+	{
+		.cap_id = LEVEL_HEVC,
+		.min = V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
+		.max = V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_1) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1),
+		.value = V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1,
+		.hfi_id = HFI_PROP_LEVEL,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_level,
+	},
+	{
+		.cap_id = STAGE,
+		.min = STAGE_1,
+		.max = STAGE_2,
+		.step_or_mask = 1,
+		.value = STAGE_2,
+		.hfi_id = HFI_PROP_STAGE,
+		.set = iris_set_stage,
+	},
+	{
+		.cap_id = HEADER_MODE,
+		.min = V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE,
+		.max = V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE) |
+				BIT(V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME),
+		.value = V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME,
+		.hfi_id = HFI_PROP_SEQ_HEADER_MODE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_header_mode_gen2,
+	},
+	{
+		.cap_id = PREPEND_SPSPPS_TO_IDR,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 0,
+	},
+	{
+		.cap_id = BITRATE,
+		.min = 1,
+		.max = BITRATE_MAX_AR50LT,
+		.step_or_mask = 1,
+		.value = BITRATE_DEFAULT_AR50LT,
+		.hfi_id = HFI_PROP_TOTAL_BITRATE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_bitrate_gen2,
+	},
+	{
+		.cap_id = BITRATE_PEAK,
+		.min = 1,
+		.max = BITRATE_MAX_AR50LT,
+		.step_or_mask = 1,
+		.value = BITRATE_DEFAULT_AR50LT,
+		.hfi_id = HFI_PROP_TOTAL_PEAK_BITRATE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_peak_bitrate,
+	},
+	{
+		.cap_id = BITRATE_MODE,
+		.min = V4L2_MPEG_VIDEO_BITRATE_MODE_VBR,
+		.max = V4L2_MPEG_VIDEO_BITRATE_MODE_CBR,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_BITRATE_MODE_VBR) |
+				BIT(V4L2_MPEG_VIDEO_BITRATE_MODE_CBR),
+		.value = V4L2_MPEG_VIDEO_BITRATE_MODE_VBR,
+		.hfi_id = HFI_PROP_RATE_CONTROL,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_bitrate_mode_gen2,
+	},
+	{
+		.cap_id = FRAME_SKIP_MODE,
+		.min = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED,
+		.max = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED) |
+				BIT(V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_LEVEL_LIMIT) |
+				BIT(V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT),
+		.value = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+	},
+	{
+		.cap_id = FRAME_RC_ENABLE,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 1,
+	},
+	{
+		.cap_id = GOP_SIZE,
+		.min = 0,
+		.max = INT_MAX,
+		.step_or_mask = 1,
+		.value = 2 * DEFAULT_FPS - 1,
+		.hfi_id = HFI_PROP_MAX_GOP_FRAMES,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_u32,
+	},
+	{
+		.cap_id = ENTROPY_MODE,
+		.min = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC,
+		.max = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC) |
+				BIT(V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC),
+		.value = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC,
+		.hfi_id = HFI_PROP_CABAC_SESSION,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_entropy_mode_gen2,
+	},
+	{
+		.cap_id = MIN_FRAME_QP_H264,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT_AR50LT,
+		.hfi_id = HFI_PROP_MIN_QP_PACKED,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_min_qp,
+	},
+	{
+		.cap_id = MIN_FRAME_QP_HEVC,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT_AR50LT,
+		.hfi_id = HFI_PROP_MIN_QP_PACKED,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_min_qp,
+	},
+	{
+		.cap_id = MAX_FRAME_QP_H264,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MAX_QP,
+		.hfi_id = HFI_PROP_MAX_QP_PACKED,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_max_qp,
+	},
+	{
+		.cap_id = MAX_FRAME_QP_HEVC,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MAX_QP,
+		.hfi_id = HFI_PROP_MAX_QP_PACKED,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_max_qp,
+	},
+	{
+		.cap_id = I_FRAME_MIN_QP_H264,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT_AR50LT,
+	},
+	{
+		.cap_id = I_FRAME_MIN_QP_HEVC,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT_AR50LT,
+	},
+	{
+		.cap_id = P_FRAME_MIN_QP_H264,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT_AR50LT,
+	},
+	{
+		.cap_id = P_FRAME_MIN_QP_HEVC,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT_AR50LT,
+	},
+	{
+		.cap_id = B_FRAME_MIN_QP_H264,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT_AR50LT,
+	},
+	{
+		.cap_id = B_FRAME_MIN_QP_HEVC,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT_AR50LT,
+	},
+	{
+		.cap_id = I_FRAME_MAX_QP_H264,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MAX_QP,
+	},
+	{
+		.cap_id = I_FRAME_MAX_QP_HEVC,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MAX_QP,
+	},
+	{
+		.cap_id = P_FRAME_MAX_QP_H264,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MAX_QP,
+	},
+	{
+		.cap_id = P_FRAME_MAX_QP_HEVC,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MAX_QP,
+	},
+	{
+		.cap_id = B_FRAME_MAX_QP_H264,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MAX_QP,
+	},
+	{
+		.cap_id = B_FRAME_MAX_QP_HEVC,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MAX_QP,
+	},
+	{
+		.cap_id = I_FRAME_QP_H264,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = DEFAULT_QP,
+		.hfi_id = HFI_PROP_QP_PACKED,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_frame_qp,
+	},
+	{
+		.cap_id = I_FRAME_QP_HEVC,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = DEFAULT_QP,
+		.hfi_id = HFI_PROP_QP_PACKED,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_frame_qp,
+	},
+	{
+		.cap_id = P_FRAME_QP_H264,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = DEFAULT_QP,
+		.hfi_id = HFI_PROP_QP_PACKED,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_frame_qp,
+	},
+	{
+		.cap_id = P_FRAME_QP_HEVC,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = DEFAULT_QP,
+		.hfi_id = HFI_PROP_QP_PACKED,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_frame_qp,
+	},
+	{
+		.cap_id = B_FRAME_QP_H264,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = DEFAULT_QP,
+		.hfi_id = HFI_PROP_QP_PACKED,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_frame_qp,
+	},
+	{
+		.cap_id = B_FRAME_QP_HEVC,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = DEFAULT_QP,
+		.hfi_id = HFI_PROP_QP_PACKED,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_frame_qp,
+	},
+	{
+		.cap_id = INPUT_BUF_HOST_MAX_COUNT,
+		.min = DEFAULT_MAX_HOST_BUF_COUNT,
+		.max = DEFAULT_MAX_HOST_BURST_BUF_COUNT,
+		.step_or_mask = 1,
+		.value = DEFAULT_MAX_HOST_BUF_COUNT,
+		.hfi_id = HFI_PROP_BUFFER_HOST_MAX_COUNT,
+		.flags = CAP_FLAG_INPUT_PORT,
+		.set = iris_set_u32,
+	},
+	{
+		.cap_id = OUTPUT_BUF_HOST_MAX_COUNT,
+		.min = DEFAULT_MAX_HOST_BUF_COUNT,
+		.max = DEFAULT_MAX_HOST_BURST_BUF_COUNT,
+		.step_or_mask = 1,
+		.value = DEFAULT_MAX_HOST_BUF_COUNT,
+		.hfi_id = HFI_PROP_BUFFER_HOST_MAX_COUNT,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_u32,
+	},
+	{
+		.cap_id = IR_TYPE,
+		.min = V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM,
+		.max = V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM,
+		.step_or_mask = BIT(V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM),
+		.value = V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+	},
+	{
+		.cap_id = IR_PERIOD,
+		.min = 0,
+		.max = INT_MAX,
+		.step_or_mask = 1,
+		.value = 0,
+		.flags = CAP_FLAG_OUTPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_ir_period_gen2,
+	},
+};
+
+static const u32 iris_hfi_gen2_ar50lt_dec_ip_int_buf_tbl[] = {
+	BUF_BIN,
+	BUF_COMV,
+	BUF_NON_COMV,
+	BUF_LINE,
+};
+
+const struct iris_firmware_data iris_hfi_gen2_ar50lt_data = {
+	.init_hfi_ops = iris_hfi_gen2_sys_ops_init,
+
+	.core_arch = VIDEO_ARCH_LX,
+
+	.inst_fw_caps_dec = inst_fw_cap_gen2_ar50lt_dec,
+	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_gen2_ar50lt_dec),
+	.inst_fw_caps_enc = inst_fw_cap_gen2_ar50lt_enc,
+	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_gen2_ar50lt_enc),
+	.dec_input_config_params_default =
+		sm8550_vdec_input_config_params_default,
+	.dec_input_config_params_default_size =
+		ARRAY_SIZE(sm8550_vdec_input_config_params_default),
+	.dec_input_config_params_hevc =
+		sm8550_vdec_input_config_param_hevc,
+	.dec_input_config_params_hevc_size =
+		ARRAY_SIZE(sm8550_vdec_input_config_param_hevc),
+	.dec_input_config_params_vp9 =
+		sm8550_vdec_input_config_param_vp9,
+	.dec_input_config_params_vp9_size =
+		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
+	.dec_output_config_params =
+		sm8550_vdec_output_config_params,
+	.dec_output_config_params_size =
+		ARRAY_SIZE(sm8550_vdec_output_config_params),
+	.enc_input_config_params =
+		sm8550_venc_input_config_params,
+	.enc_input_config_params_size =
+		ARRAY_SIZE(sm8550_venc_input_config_params),
+	.enc_output_config_params =
+		sm8550_venc_output_config_params,
+	.enc_output_config_params_size =
+		ARRAY_SIZE(sm8550_venc_output_config_params),
+	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
+	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
+	.dec_output_prop_avc = sm8550_vdec_subscribe_output_properties_avc,
+	.dec_output_prop_avc_size =
+		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_avc),
+	.dec_output_prop_hevc = sm8550_vdec_subscribe_output_properties_hevc,
+	.dec_output_prop_hevc_size =
+		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_hevc),
+	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
+	.dec_output_prop_vp9_size =
+		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
+	.dec_ip_int_buf_tbl = iris_hfi_gen2_ar50lt_dec_ip_int_buf_tbl,
+	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(iris_hfi_gen2_ar50lt_dec_ip_int_buf_tbl),
+	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
+	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
+	.enc_ip_int_buf_tbl = sm8550_enc_ip_int_buf_tbl,
+	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_ip_int_buf_tbl),
+	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
+	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
+};
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index bc04831ae7fc..5afe395cc4a0 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -57,6 +57,7 @@ enum pipe_type {
 extern const struct iris_firmware_data iris_hfi_gen1_data;
 extern const struct iris_firmware_data iris_hfi_gen1_ar50lt_data;
 extern const struct iris_firmware_data iris_hfi_gen2_data;
+extern const struct iris_firmware_data iris_hfi_gen2_ar50lt_data;
 
 extern const struct iris_platform_data qcm2290_data;
 extern const struct iris_platform_data qcs8300_data;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c b/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c
index 92f7e2546539..99c839a0424f 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c
@@ -19,6 +19,12 @@ static const struct iris_firmware_desc iris_vpu_ar50lt_p1_gen1_s6_desc = {
 	.fwname = "qcom/venus-6.0/venus.mbn",
 };
 
+static const struct iris_firmware_desc iris_vpu_ar50lt_p1_gen2_s6_desc = {
+	.firmware_data = &iris_hfi_gen2_ar50lt_data,
+	.get_vpu_buffer_size = iris_vpu_ar50lt_gen2_buf_size,
+	.fwname = "qcom/vpu/ar50lt_p1_gen2_s6.mbn",
+};
+
 static const u32 iris_fmts_ar50lt_dec[] = {
 	V4L2_PIX_FMT_H264,
 	V4L2_PIX_FMT_HEVC,
@@ -79,6 +85,7 @@ static struct platform_inst_caps platform_inst_cap_ar50lt = {
 
 const struct iris_platform_data qcm2290_data = {
 	.firmware_desc_gen1 = &iris_vpu_ar50lt_p1_gen1_s6_desc,
+	.firmware_desc_gen2 = &iris_vpu_ar50lt_p1_gen2_s6_desc,
 	.vpu_ops = &iris_vpu_ar50lt_ops,
 	.icc_tbl = iris_icc_info_ar50lt,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_ar50lt),

-- 
2.47.3


