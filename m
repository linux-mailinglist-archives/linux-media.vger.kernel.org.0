Return-Path: <linux-media+bounces-61371-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KLwNpZRBGo6HAIAu9opvQ
	(envelope-from <linux-media+bounces-61371-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:25:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AE55314B8
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:25:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3708C301ABBF
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 10:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9D9139DBE0;
	Wed, 13 May 2026 10:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S1QguBQ/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jvhuhNJ6"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67D437B032
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 10:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778667918; cv=none; b=noCaHCJpwz2upYbvWSFgOcXK5M8Ax95MrKAQvPxNn9c3lH2egq/EevMxUFHZgG6Dw1BYILlA6SqGmJ0JlrdyzXeo37CGhX2rqQvdHUgsAbOLFxCgJJdJllre7AuUm7Qt/HTXXrpFkXIwr9WyxuK7VWVl+cMd7LPnIKMNjN612Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778667918; c=relaxed/simple;
	bh=4xeboWFZ7KIkPvp8DbqtxY1UtjVPp33APGryhQKBOv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ON4bNeRhQEb8m6FnBx6lVRPpzrWv6vhj+IeJouBjJpl0sWv6nM4oHgoUpoM9JsxD0k32f1SGb/XtA0Lp6op2e49pqzGCtERanqfpzb3hC49FbnaH/t1PrvNhJRJY7pmBdkWdHnP7TtBD1Z/GvPsqfMGQUcDlpeTsbLBNjfkW21U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S1QguBQ/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jvhuhNJ6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8m9eO3474707
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 10:25:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NC4z8sUzDtuoZefjQNFdQx8N
	XDr0UWsSEbD8EvkofEE=; b=S1QguBQ/dKua1sKA0ZsCJe8NVCPqr4tczR65Qewl
	fRNY9MHhQlpYlEjMuh7UU0wodljBsO62IXlejU5cYE5bmrvBOLCzSmQU+Sjx7ab0
	OjjY4r979cNK/Ghw6KlyHVC9qRQh2K7M6R9cmYDgp5xqJkPibdZg1KNRy+ru3l68
	/Mfp42wV2h0bZkIjHQzmmdF/8qEvvnS9R8a0YDfCphdKul3TeZnuoubP9ZMGrwZ3
	dBd5H7fD+e6aLZtoKNSfzTvXTyyo2/OH2/lK6Ftul09p0B6N2FAZ79+XqFyqcRMJ
	oaEeGD2KselY8VlTwglMeuE3IkyWyBwx1EemiB3cYfP3DQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p418c1m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 10:25:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-514551d5f2aso183212281cf.2
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 03:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778667915; x=1779272715; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NC4z8sUzDtuoZefjQNFdQx8NXDr0UWsSEbD8EvkofEE=;
        b=jvhuhNJ6s1N8PgD6Fz0b1JZb6efn4ob6cHatf+cTqXLpGhAaAPiHaWcisofVt3K+Zk
         Q5DKy4bCptkWiVDGYgqIojVLxIGFpRrTGi826IYUBF33X/RPD3z8TzWlPythMUyzUOzq
         zJTYouS58rSZk0FHoigLa7AaxctCvh9X8UbrnXAMqibnYJQqV3PIfxcmovqdQglvIJQO
         4ddeyijrXZEAefpclljIFyksrX3/+QShUIiNCoAay+r1PZisyoVxwehJjMFOvEOnDvHL
         jVUjDvqetF8GvIBMjS5l3lBGxOA9VX8jrnECkt+L67FIQELE2GjzePoh5eMpH8bSkQwx
         OQlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778667915; x=1779272715;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NC4z8sUzDtuoZefjQNFdQx8NXDr0UWsSEbD8EvkofEE=;
        b=GuiXqBNCfoWOuKX0iH04LdRCO7F/uqDdUcHy5cwRJwaxzNN13PAqgc172sP3vN1qBD
         3sq86l9XzQ7GTBpfNyJByLdo3feJZntkK4KD5OZB/3ZJmjC7lefzRXDII06AroJ/CBog
         mxb0xyIsoFimaxtENTUNXQQdINX0UWQDKgY8w0hU2FMg5kHraXVS8luw08+29wJ8mRXb
         OJsixVx/+7FLY/lDasro79y/jixy86voDcmxLX5SvzfigjJlE7SNLPnQ9GaoQarO5Uof
         i71lK/nM28H43FwLlnHAdVu+l1tn8ZQKhR8pPfB4kg83Ot6m2ohdx+waONGx5LZzJTib
         KpbQ==
X-Forwarded-Encrypted: i=1; AFNElJ9B9kOfajGm2LKcqZbCJNrgiyx3ey5lBpA0R0W6VZUG8hhTu7F2BGfGziDern+LxJjiF+2B4/6aippA+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYgLgpaH3/dRdu2eEI6I8ySHg8hUbPAuZlVMhhEraS6m5WryZt
	Rypg9jLfuHh/6frz0i7SvWp0F4oeiZYvJ4iAUF+EjcYPnGw6Q/dIesSAsD6oPRrcvnptn5yMkxu
	u4TxUlhTrFsQSydMEKZKaT3J4txgwVFaK1/kKx4cjLpbW8i8/Z/5MUXFs8H6WkmE+6A==
X-Gm-Gg: Acq92OHTZl85Z0EFxdcbRkxC9f73WcpKwxJMzm3dL/t4UJIXredUq22x+bdW45s+Tr5
	R5orWTgKDMW+d/5KxIF15EDh8RcQxuAoq90uvbpcX/vdyd8GBr2vki6r+afFORzBqS6ck85rlNf
	lTzVQR4EH7QxP9/PVyyB6Xy5UBiJbKmK2ypmGot3OSp7YjAYiDGFHpNBoSHVTcNBCNPf9gQEIMi
	FQrFWABGThGf0ZE88nNWH4TlkPDSSKH1djpJcev8IHk632s2bCl4j77Ql3vPjK+zjqwEgBOOajN
	Yfz7I/vFefjyS6Jkg5HmFb9j/IporAwYGLLMbZRCXOM2+V/LKhIqih0h/+bpbCf04JbXl9hVpte
	oeHvobJctmHXFiQOP/W3AYqWm3dBwAOj5KdITZOho/eZej8ACxI/VDJ1C1oVE7Yy+P1qQKMMItx
	QbenWcTweycmspshZDKhP6XfWVxlyLiSMasJo=
X-Received: by 2002:ac8:574a:0:b0:50e:60b8:347e with SMTP id d75a77b69052e-5162f68c693mr33074301cf.59.1778667915239;
        Wed, 13 May 2026 03:25:15 -0700 (PDT)
X-Received: by 2002:ac8:574a:0:b0:50e:60b8:347e with SMTP id d75a77b69052e-5162f68c693mr33073901cf.59.1778667914755;
        Wed, 13 May 2026 03:25:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8cade5fadsm2312103e87.4.2026.05.13.03.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 03:25:13 -0700 (PDT)
Date: Wed, 13 May 2026 13:25:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/6] media: qcom: iris: add helpers for 8bit and 10bit
 formats
Message-ID: <nxydcmpfpsgndmsuh2oarbmnm6ko4k44rlcxunsjgdpmh2zsof@53elccft32x2>
References: <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
 <20260511-topic-sm8x50-iris-10bit-decoding-v3-1-7fc049b93042@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511-topic-sm8x50-iris-10bit-decoding-v3-1-7fc049b93042@linaro.org>
X-Authority-Analysis: v=2.4 cv=df+wG3Xe c=1 sm=1 tr=0 ts=6a04518b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=5Kv_vQZlazJxXpBqwIAA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEwNyBTYWx0ZWRfX+I+5kKJm3XTm
 pDQlBSuBcj3nB2y2sA/XERQ4S9oAbObFMUjMUXir33VbITtdl1nIgrV1hbMX4qATQLwojgVYTk9
 felesyJkh2W44qUCUg45xVJAvQ8KQvxFyq3ladDCDXTIQWz3pmMYv1OHgdq3oLvMBQ5qkQF4vU6
 1J7unqsCGybywDjUFIUNIQxn+orvHELWsC6hjuN+cgKmzZaPakUjxm6er5xt4Qo+YpiTBna4kMF
 jW+MLHKySlZNNTOU3BSZRI1daRK92fIvEiVq5sxRk9U1urH2QN/7EA2p3FkfuPDiz2o1D8oeH1m
 bdFzpZ8odgjMnghsvo9N4QQKTgpi4munKur6hrguwhDz0p0eEx22GPYa1PmJ2kD2y7wPepB4xcD
 /hcS6T1n1I2/b1o/yDP9FaMJzgcRCcbSSHNNKwmy+9PF0IxswcwvFCIDi7MmKEBkDcxQ3NW41+7
 2Y6zZwkrsji+9y7KbVg==
X-Proofpoint-GUID: KyE8kfZZ2KyoSKngIDt5IZXhlaWDP1EQ
X-Proofpoint-ORIG-GUID: KyE8kfZZ2KyoSKngIDt5IZXhlaWDP1EQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130107
X-Rspamd-Queue-Id: 52AE55314B8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61371-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 11:20:26AM +0200, Neil Armstrong wrote:
> To simplify code checking for pixel formats, add helpers to
> check for 8bit and 10bit formats.
> 
> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/media/platform/qcom/iris/iris_utils.c | 12 ++++++++++++
>  drivers/media/platform/qcom/iris/iris_utils.h |  2 ++
>  2 files changed, 14 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

