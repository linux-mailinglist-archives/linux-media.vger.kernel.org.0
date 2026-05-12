Return-Path: <linux-media+bounces-61301-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMTdBtZNA2pq3AEAu9opvQ
	(envelope-from <linux-media+bounces-61301-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 17:57:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C915242ED
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 17:57:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B853333394E3
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 15:46:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9B903C3798;
	Tue, 12 May 2026 15:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QDDXRJpI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FjFVxVvm"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F153C76B9
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 15:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778600734; cv=none; b=i7XYn4og17QoBi9uSI6TseLXYRfpBczlnDoZJiyqe4paDXeCnK1Lii6EjrvDXp/+g3ncbgeXu9rtYc8CYLoLco4GBcZjMuzyrrGALo8mDig5psXLEg1P2IF3e5PCC8k0qXCylvdifYwy53PVuGxG5WdgM5Nik/8ZUHvJdxttIGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778600734; c=relaxed/simple;
	bh=QNQtSLxUMQ2/nPuJkqhlF9yN9JpF2hCD6F8nM859yyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f7++riP1Gvl/KN6LA5PLYgVVgMFjJ3Oz9XqCK7e7JX2EYM/CZMIg+AmCcUdfWUIbnBYfJ3k8k5xsnUstkeu0ugTj6xbXjA1IseEhLmp+VpBP0rj9f7Iv8XHwp2G1EsB4wn0PouOrXu+l703N0Z3A0C5ltc6eGBxbmd4Po00trpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QDDXRJpI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FjFVxVvm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CFLD3x3421717
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 15:45:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BHXK6eodNkDhZFdtXMYa5MNj
	vlW/UFubxvcOQArCorI=; b=QDDXRJpI1DSSKSbAw/J9IZCxS+1pCW9BF9Ac5XnS
	KbYYSzPW8pOBWjsYrMH57lDTektInZdExAmohF/8TOe8bwGAzN6c+IA+POQ1aule
	uAqhHJXuCNHZy6+jLEYNweRV7+yDYcHvLeSYYLP5UAXX2Ypt4eukPieuIWfQ9K+F
	xLOmT1wPQTYvoWrUBJxtf6VyHPltMMpgoLtFFwr3Cm0t9j9at886Z4zYQ/yApYTT
	z0xnN79m5d74lIWInVPEX8sNNmtjmoffcVniJgjncTtCOs2i89GLeI9Qtke1kQCG
	twL7HUIGfbZZwlOiH7HdyNnadQDqx0E977aq0TC9FRg5fQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e46s9r2q3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 15:45:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51009190feeso109964291cf.2
        for <linux-media@vger.kernel.org>; Tue, 12 May 2026 08:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778600731; x=1779205531; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BHXK6eodNkDhZFdtXMYa5MNjvlW/UFubxvcOQArCorI=;
        b=FjFVxVvmWOOWGCjxAf5tNA/D3JMxREV6WjBidC82XL3RQGIoRMYPD7GFn5MI/n702J
         BgBAgQnHFLuOScWDMNayliWs4NotFByQLKtTVAE3gLYOaLB/qRJTW23aM4y74ZsWH4sb
         soKKJrX9dUoAb1yzn+Wy7JmSx1mhHYe7lFwj4cXj1PSaMZaU+OXH9y8h40O2KR7yCiSP
         nmSiHH6Bt3EHg8Yzdo9wFIUBoiPXrAOMbX5JoaIPKhxrYhtVGLQFve7yBT7cMspmxhe3
         G2WZJEUbILkbOwmfz7IqLdCWkyEZN881cSZwT7vfHNYZNMJpxJZJ56K+C9V45Y/w+RaM
         aeDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778600731; x=1779205531;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BHXK6eodNkDhZFdtXMYa5MNjvlW/UFubxvcOQArCorI=;
        b=dSn9i2C6GDfouMgM4wMYX/ikeQrwQubT9TMGBIpRPvmKduBBcRzlIKagkH7/5aU4JQ
         oM6EutbzvN/aTWxEwXFrC0bkeVLvi+G6W7RrTzOltJh4wQpT66XWcu4p9hJR9g/9sISt
         /RB8Vf6OpZY6A8zhbw1uSVmJyLakd8v49h7wJi5jgUKvw+J09STM6OIhsRi+doPR35IP
         G4a/zcJIUUkDcymPma/SOZjXdbapgIfajaXoIi+/9I9HILJ8VFs/XXsVFFqf6l4frTZY
         mrV+f/MqeD2cgs7wK/ByarTbPq97gOk/R9VzsigefOGuFrnNsh+KP9gg8tld5fumjzup
         FAAw==
X-Forwarded-Encrypted: i=1; AFNElJ9pnqfXvWJ5mJrNC/dy2fdOTlIed2d/eNabQGzhsp6U8iCw3WlCGVgcCiohLrGu7VYqDBeVXaWYVaQdHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPRwvn7tuu3XCujSHN1zEwfS70axPherWQAdFF71RMtUdm7atn
	Ju/1LURWR+QVxc1FbAB0YGpKUyDxl0UApi5rPmi/vUZqb8shUFxFiDQmzSur74O0956lJWRdpQU
	GBMS12EcEfBVO28VP4Buvscle4sYMkgfcSF+WDBBC6PVijksMZVnl5udFyNN76PnaCw==
X-Gm-Gg: Acq92OHVsja2bpAQ4dHMH36vG5nox1ojUlohNTdw7bEIzwXvkX3QWXGizi8M1Mr5Evs
	PJYsFK5WI/ZtNTJrBoQDXXIL6NFJ7iuTi2SsRIO9pLDPl9ws063/chwVB5YhdHE1V0fJt8roHIx
	rrtiNPxpHeAWIjS++XCdiRBYT6KEVLFdQdydMicNQEUjZKOc0bPiQPe69SRm3KJmviGsDKPKZer
	GpGL6uvp5DlnNTwuH780WoO8V9um3KkJZ/0Er3+vGYUsUYEhNXJ2dCaHtAdGYjNzCgqX3R6UTj/
	g2Vq2BUVYuqy13/UZR8ZaiNxIKeAiGbdeDh7Bxy9X7WUCOg5rHgNIBcebP2F1VlO0Z887JtB1Z9
	krhb5jdpTCGU+xKcfZJ6mN8S08VzbOiFYWj0nHswZZVtWKthIhfWJeMJ2qWm0leBb2bygxjKxMu
	tXKj89VHGNOm5a7z0vxgGEDgnU6q+tRNL4TtY=
X-Received: by 2002:a05:622a:a9c4:10b0:515:189c:e0f8 with SMTP id d75a77b69052e-515189ce240mr18558291cf.17.1778600731032;
        Tue, 12 May 2026 08:45:31 -0700 (PDT)
X-Received: by 2002:a05:622a:a9c4:10b0:515:189c:e0f8 with SMTP id d75a77b69052e-515189ce240mr18555511cf.17.1778600728762;
        Tue, 12 May 2026 08:45:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f6292993sm33520441fa.41.2026.05.12.08.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 08:45:27 -0700 (PDT)
Date: Tue, 12 May 2026 18:45:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>, quic_qiweil@quicinc.com,
        quic_renjiang@quicinc.com,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v6 1/6] media: qcom: iris: Improve format alignment for
 encoder
Message-ID: <7coyxg22dil6p45bjgi7xescawfdwliprhobp5qiytlplu3swo@kqs6lswo66pp>
References: <20251114-iris_encoder_enhancements-v6-0-d6d35a92635d@oss.qualcomm.com>
 <20251114-iris_encoder_enhancements-v6-1-d6d35a92635d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114-iris_encoder_enhancements-v6-1-d6d35a92635d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDE2NCBTYWx0ZWRfXzc8fUrumwk7K
 M1RKCRb/9IQHoE7Kr71XB4kHzIqyKvMvrzPbG4qMdWaOqO72ipnaC6MVcrBOsOJ2lRTft+BROIx
 NuAt5Ttw+tT1A9WZMPKdILFVI2ZLsqbja4Bo5/jHlxaDIzr5PLPvx2I/v8jUvqrafbVx/vqSYAm
 VvHBSe9206r9ybB4hq+1W5lXIpqOEPmcruruoR2XrGHLYa8pclT6tS/jOmfTrn9MtvUuCXsXxY3
 XO0mGH0phD8oQFl8IpU8blpoeIP7i7J+26i+YbvDhFmOAKvQReNJW9IZAu+AHbwp7p622NGO3El
 c9NNV0Xdsw+JjiMIWm8NMP12cHgKiAmMldEpbXRV531Ljy6TdBIlJt1fWrXMUggpI4SFYprZGGV
 MhU9mfe/jFahy9BksY5Gm3ik11UuPe33IP+TxXpOhrdLiU0TG7VUud/POzJDVHL5Hg9d5dM/FEr
 c4aWRZjgqfluOfCo7eA==
X-Proofpoint-GUID: yEcDvx_q5mNhLxtJbX_UT6jK2ExRYAdV
X-Authority-Analysis: v=2.4 cv=L68theT8 c=1 sm=1 tr=0 ts=6a034b1b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=VWJduI6YQviP9SRQ2ZgA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: yEcDvx_q5mNhLxtJbX_UT6jK2ExRYAdV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120164
X-Rspamd-Queue-Id: 63C915242ED
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61301-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,linaro.org:email,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, Nov 14, 2025 at 11:08:58AM +0800, Wangao Wang wrote:
> Add members enc_raw_width, enc_raw_height to the struct iris_inst to
> support codec alignment requirements.
> 
> HFI_PROP_RAW_RESOLUTION needs to be set to the actual YUV resolution.

Why? What is wrong with using the existing fields? If you want to set
defaults, can you set the existing field intead of adding extra fields?

> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 3 +--
>  drivers/media/platform/qcom/iris/iris_instance.h         | 4 ++++
>  drivers/media/platform/qcom/iris/iris_venc.c             | 6 ++++++
>  3 files changed, 11 insertions(+), 2 deletions(-)
> 

-- 
With best wishes
Dmitry

