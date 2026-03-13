Return-Path: <linux-media+bounces-55788-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sA0HO6Z1tGmUoQAAu9opvQ
	(envelope-from <linux-media+bounces-55788-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 21:37:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 05979289D43
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 21:37:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 34CA33017333
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 20:37:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0C9B377EBA;
	Fri, 13 Mar 2026 20:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bTPkuDKb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CKFHcixR"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB0E375F88
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 20:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773434274; cv=none; b=IrDlcB8Bg3wU1Dqvtsuh92PmoRtTuBaWMtZq3HMug6UtVQG6yR3M2Q2fA1GAol/x7gka/Lha3dkOX8u0qQixcYMBStq0dcZvP5vfblb7Va4hLNdILR4LKdgqDjnkLdrtdRNh9012L0oD3VWgyaWwfbXfno75uVOpWCEgeDtlT9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773434274; c=relaxed/simple;
	bh=Khcyl8Vo9tCICKOJ1hknA2Oz4fABVqCSFMKaVi59d4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OiXWxTwXulXCo5ihuhUbttP3lxGUY2AfA1anXxBWU8YM/dypfWZrr45XgitYsWPZneWYPzYVM/Rlm2pV6QAwc1NRMDk5kEsIy33T7VFf4nzWHxnTfcXPmU/f4P0xqnfMLRpV9nZaZP42mODxnMj8V2GyOky+o93V9cSC4pkpmlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bTPkuDKb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CKFHcixR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DIqpi02390203
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 20:37:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sgB16IPU6sPH6aUJAZtIG+3J
	9v1KyBtgDirgo+FSn4M=; b=bTPkuDKblJRpXfmZ2SYVIuoAvFO+w4rpSr2GQva2
	OX2TgzntHYFv8iNatR8X2mFaMNeP2jsFsykKqB5EoMlYHNp7Fg2DGysIHuYGZzHc
	8VFmFalZ7qbOg8Ab0B18FjEwBb9V+fp0cXXDMDe4dHbTBrzklRJCDQD3jz2aIT60
	2jwlSYjiPYZTNC3TcxCAQqZXTQ0ectQYdrEllwlmAFTIY6khXRHZyln0nlYPn349
	hXoe3330WA5W8zkKOmx+DjmgM6Iw6U5+sE6cTBQInhjwKImB1ovfsm7UcHl6fzCo
	3ZxLQMv4s7tiOCFVkBhuAYm7HZZqn1LcQXqqZ3WCyO66cw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvh5ma09b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 20:37:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd83cfb36cso1726048485a.3
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 13:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773434270; x=1774039070; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sgB16IPU6sPH6aUJAZtIG+3J9v1KyBtgDirgo+FSn4M=;
        b=CKFHcixRTcd362WAjhNe1iffLeIjjpEubIyM6QTWo0zG2uRQhVdIOR0KC/vdt4vu8F
         oPoUjpILGCnt9/3s5NFWl4ndHsYPVrVPgb15ZsLD317crOcmAX8Jx9wEUIwHpyyy8fjl
         IrRqeKchO+vAvQ4dWsc6Nmb8fKoxRNZ8YRw4NkEWj2bJ/Uwp4AtCPT5BRKOZAMU8DooM
         0l32rG7CRMDccoNhNbGqQUB6JKS/GoGb8uQsL8BaBUXI3z/u7RrFKHKCmk01z4ptnABd
         DXPlScwsKkGYPAep+RyuOSs7NTeEK0vECD9SzMg8TyPE9U62OVosHPPzSemZnwZFD2W7
         ZZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773434270; x=1774039070;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sgB16IPU6sPH6aUJAZtIG+3J9v1KyBtgDirgo+FSn4M=;
        b=b0H7YdAoH4Vsk2PVc/BkuB/RyHDJRzDDut6Azsq9ocRH90gfhetfZJaMo3SUi6gj/G
         Xz+HHJdAQGq5ZIs5E55y4tA0xeaMNEMQLU6Idc/mp8INa50I4WIA0RK0mtM6mHCm9EZc
         6JTSaqrWgL/+td9ytUPLqlGzB6aRYO26Xa3Ox9Nc3LWS05zURt6hnuKEZZ0FbFWbtlEV
         7/5XA08tA+hYtrjQeLQZDHHoM1VrznQ2n+xb0qrUOKE6UMZyX8BLWj1EatZKGS9AMpIH
         hd4gtXcl8FPaUzsMfcBKTi8LIPlZy1JZ12laDZjw+cMJ7AQohIe+sCM8Gm87o99Eo0LJ
         UCxA==
X-Gm-Message-State: AOJu0YyFpZ0zMeIZVqj1+PMioxubffXI4xO/wd9Df01aqoCjZHcOy3Tq
	zlsd9VY7R857Gd6TtvOLuoXnrQ5xbrkK0EmJ7uzIEmP3UZsSr26Od/ARam6aYR2tSNsGYLMBet1
	/UNo8X2EOzgV0Zh3wK66Ffk1cjFc0ahgghTuox0o51rfJiGZsNmemSpD0ScLTYsIQiw==
X-Gm-Gg: ATEYQzzdLuvJTrRGtjjK91D7WIuvXuE53R6n4F4Qeq1ZbSmvjw+sR+n7BuN8CzcWCVt
	elm/aaAKxnuZWtGYulMPzYrTWSBfzxxAR+pTxPMg+jrhlKf/a96mw0CEgMdx3YRKgRk29VhWbBw
	dFu3pqzET4kjo+5F04p5aRGUyKOql+yFP0dEwgqIUHqLSpNWQq+IIoBkz3RwD1Jq1zCWcbKPbTy
	YsExpOyjqgwlWhHZq1Gxi56FE6huuHd5K1Wuh1rJoErww22m6h3/k9tvUCO6+hKWAvZRIEUYXhf
	wcJdE4umNKT3cDkzm1RUn8anJB14avxMhKkf5VebydVJYedHqb8+Dkjr+3JiIjDAMV+ZM4Hukxm
	iHONZ3ruedJ3hh9/XK/+9hhPRuCfwlqKGDFqocYpo2W46WwMv6eApYNVzNF+ZFxyZTkFolUkva0
	th4SYG45EkiTnoheK4XI6voejn6uBe5jNP+28=
X-Received: by 2002:a05:620a:4506:b0:8cd:982d:4108 with SMTP id af79cd13be357-8cdb5b7b6f6mr630733685a.56.1773434270337;
        Fri, 13 Mar 2026 13:37:50 -0700 (PDT)
X-Received: by 2002:a05:620a:4506:b0:8cd:982d:4108 with SMTP id af79cd13be357-8cdb5b7b6f6mr630731285a.56.1773434269844;
        Fri, 13 Mar 2026 13:37:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15602e749sm1796363e87.34.2026.03.13.13.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 13:37:48 -0700 (PDT)
Date: Fri, 13 Mar 2026 22:37:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 8/8] media: qcom: iris: split platform data from
 firmware data
Message-ID: <7nt3gmwmijgrikds3uhy3ebqq3vyw7hmzi4zogsu2t2s4rxxun@f3do3bekxua6>
References: <20260313-iris-platform-data-v6-0-1763bb837fd2@oss.qualcomm.com>
 <20260313-iris-platform-data-v6-8-1763bb837fd2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313-iris-platform-data-v6-8-1763bb837fd2@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: vkK3uiNX2KI6zrAJG7xqEh0nMFpi4k9R
X-Proofpoint-GUID: vkK3uiNX2KI6zrAJG7xqEh0nMFpi4k9R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDE2NCBTYWx0ZWRfXxNvxv1deZrWf
 2Cj3D9g3mRnDRbd9h7xa6hNvIskbtsWYr3SMTfL6ffcWrsPxHu4IgIkQm9cb268qzqZvGasubZb
 liXR63dfyFxd+Cw3oiq4+cvEUuB1dGXyxr7MX2G5xQDZ0um4nsQft8BStcX2b7WIsSHMzFZ4QfQ
 Hxf5K7Jx3Ehb7SLzaOqAD6LEUc83APJ2x5uyCX3bhfUbbzznV7C5WU8pXeZBsXqcxQ17F7f/Tst
 z9Pf9jdSVZtdouKLH/yBRqSHr1lGjr/xwFKN7eTj1PpmT1o+6CX/A/GVEM8Zvox6hqbpcYXLHZ5
 HqeSg/HVa21E5eUbLzSmi/p70nYHm3BAWfEu6izPSh807rc0LAylu7M5FOPEBJ30zLpEbm16U6f
 nTGRviwMHiU0XrzZB2UbsYUFz5NkO6O7s/1okmAjwlD/047GtQD/iSn9RiXYoTmUYFw0px0sbei
 68RLJk059uDjeVsKH+Q==
X-Authority-Analysis: v=2.4 cv=S6TUAYsP c=1 sm=1 tr=0 ts=69b4759f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=uGVOIYBCUzJYzQ2NMwIA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130164
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55788-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 05979289D43
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 10:12:56PM +0200, Dmitry Baryshkov wrote:
> Finalize the logical separation of the software and hardware interface
> descriptions by moving hardware properties to the files specific to the
> particular VPU version.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/Makefile          |   6 +-
>  .../iris/{iris_platform_gen1.c => iris_hfi_gen1.c} | 136 -------------
>  .../iris/{iris_platform_gen2.c => iris_hfi_gen2.c} | 223 ---------------------
>  .../platform/qcom/iris/iris_platform_common.h      |   4 +
>  .../platform/qcom/iris/iris_platform_sm8250.h      |  29 +++
>  .../platform/qcom/iris/iris_platform_sm8550.h      |  31 +++
>  .../media/platform/qcom/iris/iris_platform_vpu2.c  | 126 ++++++++++++
>  .../media/platform/qcom/iris/iris_platform_vpu3x.c | 214 ++++++++++++++++++++
>  8 files changed, 408 insertions(+), 361 deletions(-)

... and of course I lost a chunk during rebase. I will post next
iteration tomorrow, to reduce spam.

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index b209cdb6c462..39a7ee8ce904 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -42,7 +42,6 @@ enum pipe_type {

 extern const struct iris_firmware_data iris_hfi_gen1_data;
 extern const struct iris_firmware_data iris_hfi_gen2_data;
-extern const struct iris_firmware_data iris_hfi_gen2_vpu33_data;

 extern const struct iris_platform_data qcs8300_data;
 extern const struct iris_platform_data sc7280_data;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index aeb4cabc1160..11ca098ab125 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -146,7 +146,7 @@ const struct iris_platform_data sm8550_data = {
  * - fwname to "qcom/vpu/vpu33_p4.mbn"
  */
 const struct iris_platform_data sm8650_data = {
-	.firmware_data = &iris_hfi_gen2_vpu33_data,
+	.firmware_data = &iris_hfi_gen2_data,
 	.get_vpu_buffer_size = iris_vpu33_buf_size,
 	.vpu_ops = &iris_vpu33_ops,
 	.icc_tbl = iris_icc_info_vpu3x,
@@ -181,7 +181,7 @@ const struct iris_platform_data sm8650_data = {
 };

 const struct iris_platform_data sm8750_data = {
-	.firmware_data = &iris_hfi_gen2_vpu33_data,
+	.firmware_data = &iris_hfi_gen2_data,
 	.get_vpu_buffer_size = iris_vpu33_buf_size,
 	.vpu_ops = &iris_vpu35_ops,
 	.icc_tbl = iris_icc_info_vpu3x,
-- 
With best wishes
Dmitry

