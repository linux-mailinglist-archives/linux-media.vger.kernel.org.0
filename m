Return-Path: <linux-media+bounces-64666-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id F4SBApHRK2qXFgQAu9opvQ
	(envelope-from <linux-media+bounces-64666-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 11:29:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B943678499
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 11:29:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Fh+l8D3k;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QpjGXoQd;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64666-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64666-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 54233305FAD4
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 09:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6F813A48E6;
	Fri, 12 Jun 2026 09:25:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E056E335555
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 09:25:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781256358; cv=none; b=l2HDsFF7qBM6ctD4rbuVliKjZb73LSQmp67rFYdWMeK6oYVJRLGipH6v6UbxFIRfhHmkye/kTGzxdjR6gwBQc8uyej6vzCY/lhbpcJtre+9mMcnN30z9Q1hYOddCQJYkHUIA/ClYcOV4JrboixuWpYfHBMbfQ6jFznoGhmPwuKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781256358; c=relaxed/simple;
	bh=H5gjTCkahlz2x03Clh/PysKqV1bvgbU9MHDzqSGjKm0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GsTDu1w79XWPmyjPR63CT7mcAFQVoWQq+cOSK4hf2tCCiscCtPVvhENclzmPub2ZFnJJTrTGw3oW8ArmBD9x6WGCo+TdJd/EzkTG7ai9ulNP6PUtvia3MfnLTbQzdq+aCS5Lo2WWgjuccyCbQREoXvRq9XFaFDgjYJIsfmzEROA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fh+l8D3k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QpjGXoQd; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3Bjqj2548621
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 09:25:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7GXhlm42Lq8jhZpNQbWDnVnjUliqMt9PAaqnfp5/6jw=; b=Fh+l8D3kdBn2vW0t
	lYOhU1WjzSJDFwHivi7NcZklnmc3opzHplySJ1CzT1SJNcA/aIX2gBLQV+5Y5v6i
	drJGGLxlwU7yMWIR/MSqdSMGj2JYvnIWSFwYXqqVUo1duM9/3tZoFVxzhdiipCb7
	HxiRZGkKNO1dfXvDldlLeE3TmJd8FMjCZuqIuiBGRTEEh0Z9JJ/ckocRbEiD5LxK
	mXNz1X+clF250mhEOc236qVe1CzWMUHDqJnb9Lrqal53XsbJctcp3Tkcr4ofmPMj
	Y1YPizKkw9yH2MbMBEyqlp4ApPC7R9T+MYYOEIl+iHzEz5WG5JqvH3jBzVXnEO2v
	Xr7Qqg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er29utgbs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 09:25:55 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6c554284973so816965137.2
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 02:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781256355; x=1781861155; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7GXhlm42Lq8jhZpNQbWDnVnjUliqMt9PAaqnfp5/6jw=;
        b=QpjGXoQdvT4kkrdMgMIH+viJy1eomlGPFKcnW/bI16qlzZyxQ8ilfFyRGP+DczJdOE
         iFqiIFMP8TZyIay/EelSPETXnmxYXQjCYi3pKYLuXJynHlQxQ9g6xiMAo4v1juHZ4RwJ
         m+NLZgzIVuocIElUDLaitGB/OSORzm0Xa2YgyIdeF/KOQ/MYdnXG5XyNPpCytwVhx25C
         ugKbUZUP2mBIskCgINV7SB3TTnurCfseFpEZrKvQsx3dAvw+nmQxflqJjBe9h2bBECd1
         GFFfeQqW0naeVZshcU6b96y5X73otu6oJtdsDlcBzmUlRQ2s5nKbCE1+6q1XnoMLO7uN
         jBLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781256355; x=1781861155;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7GXhlm42Lq8jhZpNQbWDnVnjUliqMt9PAaqnfp5/6jw=;
        b=Y1xpIPuAUrw18NcBP67999vT10BTbnYmxpIIhojbUx4KWuJ/h3IZY2ACwf90HqfJ7q
         YEHgzZkoS3t3yGf5+OUTvtOrMXra/XevvE8dQCEjJTrL8x98gMDyWCk7PJEkh7qR+t0M
         x3H8Mm+FDyFnqszJrtpBMULvq2I5CiRlWr5hgE2q/1mE9Uh0ZhA/eW63XLZFwNfhCd7+
         jVpiDrB4UYaT0G052YxV7MuLLAB+LSt55iuofWiaoPmCW10SF47vkOvWJILbsQFfnWxN
         HXeK2KK70TgJ+ynxVelyBTRUxfdWJeM1QKms+MgY78joU7d/yf0pGn+C/u3SDFprYjg5
         7jQQ==
X-Gm-Message-State: AOJu0YzKRozXkD7Ke7IiF5FlfuJFBF2kztyHUCw2xFkRI3cgZl9hbUpS
	L+ZuetHhbnuuKF+wlzKva8TxI4a5Ztm1L/oaOcrTefVNPfgvRZitFghtwFKpNiNljQcjuegQm8v
	0FNnyeP6Rv0dXn5LChkZSUDERhLmB/Z6wo3G0ZobX53Ubo9VWT2QZ7/obI+nyy1DGdg==
X-Gm-Gg: Acq92OFXMggRAWDjVyW+1USfV4TV3i5DLNBV2CEPX93EJp6eR5viNZUX5jqejam4Bqz
	ipzjDHCBrerzrgJQyB2Bb6UPI/vkrZJyEK/wxTuE0iS5Iy6xjDb023uHF70rcctnf7SKLwzwsr7
	TWs3B1Rjuo+rqe8PsFaiapuqYdan8wZ9Us3OyC7B64J80iSA56kyDiOU7eBEZnRpPXxQY9hWkZ+
	6R/K1fvDg+HwM856WZTckZ59HCudSqmc0B6QpAQ5yElbX9Np2EK70XSPNrBtjKYD4c985xBpJsM
	YDSFwqlkIEXJe/E6eEibcW7aMrkVl37WhVQhMHvy+ZoUhnrJPqLHauhK5UMaVMQgcp2B0iF6HI3
	NWR1Ii+GNeepr8GQdYMdwjNHFqv0OrArQZ/CEsqmcEP8UtvvLtkfnjEXDVuNKDbkw3COb4MtJT+
	PJUjz2bGDSugGfzkg9WtE1nor/hv4r89iI+H8=
X-Received: by 2002:a05:6102:f0d:b0:631:ec2d:12c1 with SMTP id ada2fe7eead31-71e88aec031mr735578137.1.1781256355221;
        Fri, 12 Jun 2026 02:25:55 -0700 (PDT)
X-Received: by 2002:a05:6102:f0d:b0:631:ec2d:12c1 with SMTP id ada2fe7eead31-71e88aec031mr735570137.1.1781256354827;
        Fri, 12 Jun 2026 02:25:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929f190ddsm4560191fa.19.2026.06.12.02.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 02:25:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 12:25:37 +0300
Subject: [PATCH v4 05/16] media: iris: add vpu op hook to disable ARP
 buffer
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-iris-ar50lt-v4-5-0abfb74d5b3c@oss.qualcomm.com>
References: <20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com>
In-Reply-To: <20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3064;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=1XoxNMQkIKQIwreQUtjXXBpaKx8sVaEKHYTsCNEF0Ak=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqK9CP4UdqCYXR73UMpgJmkY4fMmlKngfvik5r6
 IHV5xG2m/uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaivQjwAKCRCLPIo+Aiko
 1WZDB/9bpXlx6XOeSkRV/QP+vbTkRVTT30WynVGDLXFaGcGG9hFVmZlTo9hHLJI052CXslY387N
 Vy9V9WiD9CwEeF9Uob86uu5GF+/xVcQza0ZD8rar7QsPDWTIV7f2BVlnst1j5el5gj3UisV1qCq
 6A+nWRKOYtaHLuQRU9U9pMmHSBq01garlOVf1E5jocytS3zE1NJVlNjCf+dXUS8g71xC8NZigAt
 I4SGub1iUwSxH9JOBn47m7EJckp7/c1SNie3oPOZXI2ufVNcZ6jofkxDjR/50NGFs8pEhsnnKPL
 LDtcZklgKvqrBel0RczvmFGKJL38p3Q8Rcbo7v/DFlBVH6bt
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfX7gdODbWjhW9Y
 ESAvSm9kP4hmL4T1/gAVMFn2IO7FnJiU/LHtVtG6Nm1ZYe3qWYa9sv+VeD1QSnXNRNEYN6J0Wjt
 6qJFZqiCHTtw4CvlDY3MI2vu/AVCfqQ=
X-Proofpoint-GUID: ge9B-YvZhqPY1tCOaawdTaJZA6Aj_YH9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfXzS/aG3Lyt4OJ
 23039b4G/EcSvmH+vSbepVFe8RCSFFooBk5O2YZE47vy+glkXHJM2sIFpyOwdq1riitTsXfB0EA
 GaHEBBCeNTQ9c3slxZAvOI6M+My3wGkJTKK1RGeJdW8d2HZ2k9B+g6IBJ5T/g8sacY+qVZFOeo8
 dwZa+Gp8j1kZvRKKe1uX/1XH1hgkYntKr972mVmO7e4vPTXDzjsyakFpu/0fhplW+gb+vlUUOhM
 huXqylrW32WCW5oYoRssTkF+8LWlzSCVDdK+FlIEFG+wZLC40WxErZhOl2hk1rWeKXDPrsgKSTJ
 lSGbNIE9i9eKlwHiMbMdMw7Ta7m2tH+0PtFNSTh5+aBjziYqgwVpI3RTtgB0F6uGYkCsTdyeWs0
 D0zRSkstp/6eCLRv90voRbounItJfVSORpx6qBGWMraeezC0luBi9q0mF55fFfzoREu2bmAxPv2
 VZPTNnQg4kr1HEWPMEw==
X-Authority-Analysis: v=2.4 cv=DppmPm/+ c=1 sm=1 tr=0 ts=6a2bd0a3 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=vdBeo_PM3xCM7oyOFJQA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: ge9B-YvZhqPY1tCOaawdTaJZA6Aj_YH9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120084
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64666-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5B943678499

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

On AR50LT platforms AbsolutelyPerfectRouting (ARP) needs to be disabled
so firmware can configure the ARP internal buffer as non-secure for
encoder usage. In preparation of adding support for AR50LT platforms,
add an optional disable_arp callback to the VPU ops and invoke it from
core init and resume paths.

No functional change for existing platforms.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.c       | 4 ++++
 drivers/media/platform/qcom/iris/iris_hfi_common.c | 4 ++++
 drivers/media/platform/qcom/iris/iris_vpu_common.h | 1 +
 3 files changed, 9 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
index 52bf56e517f9..bd22076f3557 100644
--- a/drivers/media/platform/qcom/iris/iris_core.c
+++ b/drivers/media/platform/qcom/iris/iris_core.c
@@ -45,6 +45,7 @@ static int iris_wait_for_system_response(struct iris_core *core)
 
 int iris_core_init(struct iris_core *core)
 {
+	const struct vpu_ops *vpu_ops = core->iris_platform_data->vpu_ops;
 	int ret;
 
 	mutex_lock(&core->lock);
@@ -78,6 +79,9 @@ int iris_core_init(struct iris_core *core)
 	if (ret)
 		goto error_unload_fw;
 
+	if (vpu_ops->disable_arp)
+		vpu_ops->disable_arp(core);
+
 	core->iris_firmware_data->init_hfi_ops(core);
 
 	ret = iris_hfi_core_init(core);
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.c b/drivers/media/platform/qcom/iris/iris_hfi_common.c
index 8769ec61f117..8f04f3793d9a 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.c
@@ -144,6 +144,7 @@ int iris_hfi_pm_suspend(struct iris_core *core)
 
 int iris_hfi_pm_resume(struct iris_core *core)
 {
+	const struct vpu_ops *vpu_ops = core->iris_platform_data->vpu_ops;
 	const struct iris_hfi_sys_ops *ops = core->hfi_sys_ops;
 	int ret;
 
@@ -163,6 +164,9 @@ int iris_hfi_pm_resume(struct iris_core *core)
 	if (ret)
 		goto err_suspend_hw;
 
+	if (vpu_ops->disable_arp)
+		vpu_ops->disable_arp(core);
+
 	ret = ops->sys_interframe_powercollapse(core);
 	if (ret)
 		goto err_suspend_hw;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 9151545065cd..71d96921ed37 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -24,6 +24,7 @@ struct vpu_ops {
 	int (*set_hwmode)(struct iris_core *core);
 	void (*set_preset_registers)(struct iris_core *core);
 	void (*interrupt_init)(struct iris_core *core);
+	void (*disable_arp)(struct iris_core *core);
 };
 
 int iris_vpu_boot_firmware(struct iris_core *core);

-- 
2.47.3


