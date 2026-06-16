Return-Path: <linux-media+bounces-64944-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kp1GGe+TMGqiUgUAu9opvQ
	(envelope-from <linux-media+bounces-64944-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 02:08:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB56168ACDC
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 02:08:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=f159LoDw;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gNinkRFp;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64944-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64944-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1FF6C314FCA7
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 00:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B8F21F5EA;
	Tue, 16 Jun 2026 00:04:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E5B524F
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 00:04:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781568298; cv=none; b=XbyfimKQDLzw9BjqCkZw/nYWQy599ngQm+7r189vri0pkxkNYyw4rRYpm2jDUjSTr6DSXKfQj6J7WxpkD0RjzI2HhDnGh+aJN9U6WRULHKPxnxVupBVy0RVUpj8VRnIFx+x7HSHJJOQsRW2ZzJacBdGttsc4kgaeTDkQ/RHSbHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781568298; c=relaxed/simple;
	bh=mn+e/RylLLe8OTePgCv2X/kFcuAkbIe3sFltrQBvOOg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hNqp0s95N1K13U5+9PejkiJJzfnZX/PEISbt07seEsJx1p4EuDJnrhc9yvFwJdiQhewPSuVqMBqKQmijKBfKSvZbZXMkWRTYR00EIaNcD7TuMrlOAOAA9Znsivn/FctMJJmOg6OCwDU88l5NbnXZyWGh43IoSd2XERB87kYYsEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f159LoDw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gNinkRFp; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FIxJXF781727
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 00:04:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BSlDrwbGIU+LailKGlDSa67oRh8dtUgn/OIYCvnUjAg=; b=f159LoDwNqlGlkGt
	96eYEjasqTgPKsCV/S+X37DuulLm0Y+WtQqYIvvB4k2AIhDJ5ZJ7fhTRySRxRtAL
	swbSNXg5m9ybckJG58EBxnxFRVXn8j7WYmRbs9bcwJ6CG9B3AlznHizx0HnC8M9y
	nItXvGuH9qXJaS9J59gdAzwFcnHNfGpfIxzEwmX8lXV6GDjLB4JSHJN/FMs5XmwB
	1/L4NVKX8FlXGLrlvixdmEpz/l74yeEvigEuLRiGZjRNis8zdaUNovDipGkah0js
	w/mHpDS9ahXtZwFeIXWj8QzvlH0iNNHfAp71u0szJWvQ5Jnh9Y+UPC1L+upeA6r+
	0xqMlg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etetjuqgh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 00:04:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9157ae36434so350282185a.0
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 17:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781568294; x=1782173094; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BSlDrwbGIU+LailKGlDSa67oRh8dtUgn/OIYCvnUjAg=;
        b=gNinkRFpYGmytpeuIGqML8KwiCbEfA095VnmkjlGZgFx54DoMe9na6JVzRJ+ahxBJn
         VkbYr3uNFH2eaT+kNYR4Kp0hhjVhsN3YxsLCQ4mlbSjoJ0gHpOz0mSlNaeWoYs08EBz7
         F+o8Ll1KHpnrcTX2dmGzZzroihTZv2sUpBS53iRNQgzU85DnC+ITln9aFjgzdXrE0Ys/
         ByfoQj2h96UxvMw8FFX9IXyQDgE0SHm9kfyBaVxWlaVrjoVXyH3IUx+m6lNPajkVOvGp
         WVZIHNuWX0XxF5UqvP3Yam4doEWsEwDvV+IeNv3MN0spvlDb8n1dGRn5Ch77Pl+akusp
         2rMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781568294; x=1782173094;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BSlDrwbGIU+LailKGlDSa67oRh8dtUgn/OIYCvnUjAg=;
        b=ap8YGW2YBii8FVMmhXrbdclWtwwzzdmsFUd4Gkkai62udbIxa///sGGpnD81jFwu6P
         SGVuLsC/qCo7wxGENvHd9ommnvifKUc80OPn8sCt/NPCT2yhmV7eZg9rUW9Q8IjEFNfL
         Lgf1jCJDnT4xmXsQqDacQq2hxqokCv+iPHQLtEhxqVZSlkX0xpTKLbH/WAouiwvYlRYd
         cvmfLpZ6deEIt935E5pGsIAgYGSsDBpUf83yQc04x/UQ+jQcleDgmZPYubzfkQXLOjBj
         lDTxWvDX1cmeoM2F8+aamN/kuWbRR6VELKohJJW0bxuoC6M8k83jC5zSAh9nRTvhpcYA
         MtFQ==
X-Gm-Message-State: AOJu0Yybnzl8FfdrzJ+3h1QUzBZC7iu8A+DWjdn6DXSXLKi824fBarh2
	6MThIWJ7056/8wHugrRKHqmC6GPyaeeiWDE9sefDCBpqFYZ0rLXrobibInjIXqQP7XVz+VtxVXQ
	xnp908PgtUISesbGLP3/yRzmYrp5dhZCexUhVZK6IokqRx8NvUK2sWi5udQ5CbhFGgw==
X-Gm-Gg: Acq92OHzFrT47fyaTDfar8wBkA+ptX8gQb9rnvrCmnUYtdwl76esKBAyCnNUWAvHFcG
	rGUH391rT1hfzXQ2ymENnxE/2RtHvSBfrD+tmwkRK6LG6wPCQvy5h0dXHte9MMHzDX+yR59LC9t
	Hjr4uSXKNaUBrf9jZDHK/jSl9N2qmnytApL192Za9vLOJV2xjNXfjkCp8ZeUg7cuhmi4qu9iAte
	5psVyBqGjXWU/K/Bmtk//2ORGSJWi1QvuFhy5l2uj++gE7ELgvC75aShwZ6cFVC5gzUy8H/pCqK
	UYGkf9pf9qXWS7XX7+ULGUs4LVZbTZ7vgV37TDgGTyXAZKu24+lck3rsSyC3Cv/RJsNqPieoz2v
	7wWjbRMU1Q7SbGDOfspiyvzgWV6WEb0n4m0z54L/CEQE2FePvxxUBtGRGFctdPAXDCkLJzp+FMq
	4Sn1pCw+QU620e20kOPZFLi4Spi4eTK0JtCKs=
X-Received: by 2002:a05:620a:270b:b0:915:bf79:3e09 with SMTP id af79cd13be357-917f1474c81mr1970545685a.44.1781568293762;
        Mon, 15 Jun 2026 17:04:53 -0700 (PDT)
X-Received: by 2002:a05:620a:270b:b0:915:bf79:3e09 with SMTP id af79cd13be357-917f1474c81mr1970540385a.44.1781568293243;
        Mon, 15 Jun 2026 17:04:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a7092sm3015731e87.50.2026.06.15.17.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:04:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 03:04:31 +0300
Subject: [PATCH v5 04/16] media: iris: Introduce interrupt_init as a vpu_op
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-iris-ar50lt-v5-4-583b42770b6a@oss.qualcomm.com>
References: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
In-Reply-To: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4931;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jlbWJ6BnLAb8hDHnLKbkTUpBs5ZGORWEUsmmVGvPwio=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ5bBZL7qvPUPxHc5l36bc7PoE38NQ+LNbTd93dzz3z5U/
 COa+1uok9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQAT+dbOwTDvvXShePai3szm
 8pm7mTavnfN460VflvIMre8m58wz7/Wxtz569OCh5eK1Rk4bBB6eM1DZ96+jNySJL1mqtdd2V+P
 CJbyNFdxzTetKPltnq7IYWagF/jKJ2l3w5vBOkdc/jer+fnyr2rcjy/yYoYPDw7npS6O+HYz3P1
 U4cQZjEE9Qar38PJ1LTiK1R6/+Wc6jOjFANlokpGbL2r5575bZrqyuLTGvUGQvYbIvfnX573HLF
 VyfN2l7i9jJTJurNWMNq4x5/MWPkj77ZoYF79LL+zfpT9axvbd38+TyLPRkY3FWTBW40cpZZi18
 +7V74oJLLP/PGJYF9/YJlnupFf/TFCr883D6Lq+GOsZPAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDI1NCBTYWx0ZWRfXySOBYuT4XkX0
 kKJyzV+jfk/olDAaXPr+6TZs/sm8cR3ETE3fsgr8URhfpZu9qe0g001TvhWMe57qh120hZ0ILCL
 1Almus2Mbyi3qlOr6Nnb9UGPdLgVkFX2HDQNLFVan8qzfV+7aLuc+Z+HayXD/wKCD1QhBBI+3ax
 qs/YcYZQx6ePSgEzZeh0jdw1UeMVE00Up2ALdG23DPITFQXVBaZEZtoSV0M5umi41XNj/w/EJYQ
 a+BR7zRBZUNVBYRtzvzAusCGlh5yy8rmE2Jr6dMlk1SkY21bqESAufB5CpD4oGmDFS0Qo4uO/lL
 L4sPcVdqUGQLCX+8jUpqevLG2in1R0Tp0VrdBNDQI9BjXcxJJavcwbxNRpdUP+O3KOyBPobA50s
 pjHVS1ZbAUGG0P8AHNg9Ht6JttSmsYHKmn8AceC3aa9mRwSyxmUXXrZKbZalezVfi3cXSFSJJ/9
 t3OlcjqcaVDYjmcDOpA==
X-Proofpoint-ORIG-GUID: Ds8BKmfdHf8uamDbhOEjrmVGmjVX8fxL
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDI1NCBTYWx0ZWRfX73hVDd8y5kEM
 lNew/2rfrOHrn4Yaf+ZdBgQ4ieeI6EYAsBlcmHnhe2jNDI4IF98TxBncQpm209NxFo57nhgbA/x
 oYzX95ueRmtZ+2xpiqUkXMpoUDc9DkI=
X-Authority-Analysis: v=2.4 cv=HttG3UTS c=1 sm=1 tr=0 ts=6a309326 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=2EYiHOum3YQmkHKk0wkA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: Ds8BKmfdHf8uamDbhOEjrmVGmjVX8fxL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150254
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64944-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BB56168ACDC

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

The interrupt_init sequence is currently shared across all supported
devices. Starting with Qualcomm QCM2290 (AR50LT), the register
programming would differ.

Move interrupt_init into a vpu_op to allow per-device customization.

This change prepares the driver for upcoming hardware variants.
No functional change so far for existing devices.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu2.c       | 1 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 3 +++
 drivers/media/platform/qcom/iris/iris_vpu4x.c      | 1 +
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 4 ++--
 drivers/media/platform/qcom/iris/iris_vpu_common.h | 2 ++
 5 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
index 2dc121a3f5e8..dd2eeae0d9eb 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
@@ -46,4 +46,5 @@ const struct vpu_ops iris_vpu2_ops = {
 	.calc_freq = iris_vpu2_calc_freq,
 	.set_hwmode = iris_vpu_set_hwmode,
 	.set_preset_registers = iris_vpu_set_preset_registers,
+	.interrupt_init = iris_vpu_interrupt_init,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index dc02ced1b931..c3b760730c98 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -262,6 +262,7 @@ const struct vpu_ops iris_vpu3_ops = {
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
 	.set_preset_registers = iris_vpu_set_preset_registers,
+	.interrupt_init = iris_vpu_interrupt_init,
 };
 
 const struct vpu_ops iris_vpu33_ops = {
@@ -272,6 +273,7 @@ const struct vpu_ops iris_vpu33_ops = {
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
 	.set_preset_registers = iris_vpu_set_preset_registers,
+	.interrupt_init = iris_vpu_interrupt_init,
 };
 
 const struct vpu_ops iris_vpu35_ops = {
@@ -283,4 +285,5 @@ const struct vpu_ops iris_vpu35_ops = {
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
 	.set_preset_registers = iris_vpu_set_preset_registers,
+	.interrupt_init = iris_vpu_interrupt_init,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu4x.c b/drivers/media/platform/qcom/iris/iris_vpu4x.c
index f608a297d4a3..90ccdc0d2a07 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu4x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu4x.c
@@ -369,4 +369,5 @@ const struct vpu_ops iris_vpu4x_ops = {
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu4x_set_hwmode,
 	.set_preset_registers = iris_vpu_set_preset_registers,
+	.interrupt_init = iris_vpu_interrupt_init,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index a49113b0da23..375bcd923476 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -31,7 +31,7 @@
 #define UC_REGION_ADDR				(CPU_CS_BASE_OFFS + 0x64)
 #define UC_REGION_SIZE				(CPU_CS_BASE_OFFS + 0x68)
 
-static void iris_vpu_interrupt_init(struct iris_core *core)
+void iris_vpu_interrupt_init(struct iris_core *core)
 {
 	u32 mask_val;
 
@@ -485,7 +485,7 @@ int iris_vpu_power_on(struct iris_core *core)
 
 	core->iris_platform_data->vpu_ops->set_preset_registers(core);
 
-	iris_vpu_interrupt_init(core);
+	core->iris_platform_data->vpu_ops->interrupt_init(core);
 	core->intr_status = 0;
 	enable_irq(core->irq);
 
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 21ed4c9bd5e3..9151545065cd 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -23,6 +23,7 @@ struct vpu_ops {
 	u64 (*calc_freq)(struct iris_inst *inst, size_t data_size);
 	int (*set_hwmode)(struct iris_core *core);
 	void (*set_preset_registers)(struct iris_core *core);
+	void (*interrupt_init)(struct iris_core *core);
 };
 
 int iris_vpu_boot_firmware(struct iris_core *core);
@@ -44,5 +45,6 @@ void iris_vpu35_vpu4x_program_bootup_registers(struct iris_core *core);
 u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_size);
 
 void iris_vpu_set_preset_registers(struct iris_core *core);
+void iris_vpu_interrupt_init(struct iris_core *core);
 
 #endif

-- 
2.47.3


