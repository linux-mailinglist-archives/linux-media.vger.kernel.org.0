Return-Path: <linux-media+bounces-61396-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCzCKGZXBGqjHAIAu9opvQ
	(envelope-from <linux-media+bounces-61396-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:50:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 501B5531A1F
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:50:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04D4C3031AC4
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 10:50:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCBD53E7157;
	Wed, 13 May 2026 10:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TSGhW6iE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dj14LACu"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2ED38F935
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 10:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778669403; cv=none; b=sn9poxz6TFwvHzjb5Wrc5y0D1NrDnt38ZPjrhQO9r7YxRJAY5pjmqOnwrDyHbtOfbx+oaxWm49kw3ngZNa6yaYpE4F6yx/BdbeCUD7UBT/uqNHP+8I4mhEP/fCV2WMIL+4V8yQMGkt8+CsN/xTr3l4Ng+CGRcBewRtSYc/jzsV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778669403; c=relaxed/simple;
	bh=ymkXFwxWeVoAvJD5TRg7vNGUmjB+3vDW3rHIV9EqBMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QH5fdh+18mLOqLg8h+m7KD8g9+XCKMU4Nh27uICVNaITMclYxUpeg4tWlXHT00zNz7IVUiER/rXE76Y0vg+wFZBFAzS0k68S/FwQiQVW15rHcZszIb/cjFuSxTXhLfIb0xXPoF5/xUjlxep8dUb2yDrqSibdGPdc1nBTNG82w1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TSGhW6iE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dj14LACu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D9k0Gr3008285
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 10:50:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YZ4B8Nyvk2agWZPoGiLkxwg0
	6cZjsgMkxTD3jPL+MYs=; b=TSGhW6iEJ8DKpUrKdVIYITZEboywVdB/nksd2FEO
	rLc05p6pkhBadeTV7Z73iRYFw95NwWOkD5SVPlCr9RDDPwpg79F4Iuy/KxLqcQ+k
	QesCKiAWwAf4nBdOPpguZo0LaVA5nTLrx1VTkUETUpDGrobPIhJfLmxZ49VRa8v2
	VNKfgHJNy53BuGZSikBMQoDirzTEtlGqp3DDBfUMNWvA+RmO+yq/uNzt08J443+S
	3CsyI46gczC4sXfOH8rzpbDaVRFkDJYZ5qaAMvA0Z+R9Bn/axly34T0y1kq6QKBl
	ry8RtieETj5agZk0jjMIux5D1mmNcAPhktYzeJ4dCiSGYQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4py0g7r6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 10:50:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-90d6fe98316so272850085a.3
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 03:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778669400; x=1779274200; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YZ4B8Nyvk2agWZPoGiLkxwg06cZjsgMkxTD3jPL+MYs=;
        b=dj14LACumWtYvGRDA3w3HGR8RtI6ZObiPESew4ukENY9lTWXf9hIEg71U9IBEzPX3c
         pGe0TU2z4OBFLGS1ysvUPBkGi5CcORVfQ97KCsVuzPOrVjS0cmHpWHx/I39XgrtYdK4k
         PI29aDe1r1NeiKsu2oYHEdeu/1yQ8Q9rSiC3xYt9HCO0zXxZfmuQMkECyr8231tHOgj4
         f3FttR83UOcYtGzby8y6MviarZca1Om/43g58WNx0LN+5UxOwxnqzOHBxRxJFrik9zmZ
         18oKXK6Fb2p6yQrQdfTLDVojYRVQaatngi0IjS7Bg7xUXAVD03HiAdG5PCxrpklrmxXV
         5eTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778669400; x=1779274200;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YZ4B8Nyvk2agWZPoGiLkxwg06cZjsgMkxTD3jPL+MYs=;
        b=KILfAvgVDQiQFPY7RpeQmmr5XqhXq9q2zeHGLilJVGKi3fK0xTu/rEZ4ocuB6sX9d7
         CRSp1loh6HVHsFPnyfGjNln3vig9e9uF0NtGhgy4CAbd0DtLqJCfcB3I9qJbsldcMvsc
         iFuSM64q/5D6dd2s2nmqOJC0+U8TC6lIo7BctPh/t4ocPBuIcGn57mhfdLiI2VvMA8p7
         mV8XSEaqewmasv68o/8A6J3sjgWMMgJmBZ83gY5HgM+UsdzI0U0c2pMYWnS/fO3V4/va
         rmNYcArJOE7BQt7IlitAi5+p3/mhcFEihThrxwyw3kzlMosj6s3Bz/09lKFYdM98y0TE
         HJYg==
X-Forwarded-Encrypted: i=1; AFNElJ/YU8WtwHTnY6k+LTl9mcWXf6hYfLhptYDR8WHdcZFwhVeXcZuTfZpdEiMPH53BiMJNFD5KlrlHczhiSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpmM/5DzukiorbVMi1TmsnJfUdcUjWmE0QH13YxJz6akuOpJVK
	0pk0hp/+kXOualMMxNiNsY6HN1mk8cwnmJZPbULV+rak5IoxcleEzW9+T9i4QovCO83Do6ug5T2
	Q8xUM3AaJfSpsWwyta4MCn7dOzD/7yH2ou7txynQbsIbI0YY0U4WJ9AWd0S14M+ukwQ==
X-Gm-Gg: Acq92OGek1QlZQ5e8NnW4TCQMdZjoJBFCax9dIEvD+HxTxlf+fh3XtKXrpJ8TF61Yh6
	cNaZyHlkIILLBCaay5TXqxqshJ7yfVm/6PUaocrMODcLRDwAz5VW18IL8ScANMuLVmLAjPL/FcE
	1WEqaPpOX3EuK30Bv0se8r8F23U8jWkNjgRoJFr7QYOCYsaTJRLSh0oEHZ56fGhATypdd2aP3zy
	BIpPlw8dU5nt0OnJvYrtoEV+n58SrZ9512xVomiyP7GyOlCod0Fd9YPVy2JFnsAzi9V+gkYzdy6
	d63VzVzKllWtVMROonLI52gCF4y8UaxWnMVRLYbUejtlcyovGsa9WBwmAcqwF1Sy+FLWr9OKP52
	sgzEtsWE4gPfwAoSYfouccYNMGox8stFRHWASulS4JFozOh3uSnCdkrKiPoA7d4KxWyjPP86/oW
	kad9fVr7kjFQ0ZRU1zKw0cxHgAUX5W3D0oHxc=
X-Received: by 2002:a05:622a:1f8f:b0:50d:62d1:c3fa with SMTP id d75a77b69052e-5162f422543mr35030681cf.2.1778669400321;
        Wed, 13 May 2026 03:50:00 -0700 (PDT)
X-Received: by 2002:a05:622a:1f8f:b0:50d:62d1:c3fa with SMTP id d75a77b69052e-5162f422543mr35030301cf.2.1778669399875;
        Wed, 13 May 2026 03:49:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5d5d5f9sm39939781fa.0.2026.05.13.03.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 03:49:58 -0700 (PDT)
Date: Wed, 13 May 2026 13:49:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v7 1/6] media: qcom: iris: Add intra refresh support for
 gen1 encoder
Message-ID: <glr5fyee7q2gx2swg7pgk4plbjxuj6kg63kea4vdjo5qxlrlki@h7kzzbvoabgg>
References: <20260512-batch2_features-v7-0-4954e3b4df84@oss.qualcomm.com>
 <20260512-batch2_features-v7-1-4954e3b4df84@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512-batch2_features-v7-1-4954e3b4df84@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDExMyBTYWx0ZWRfXxOu3bFJlGasQ
 aaUKaynxiiOfp228BuOyWLyHhtyo5exmfHGPi6X5KWk1tmYwiJMbDrG4VbVp6QQvxIYtaVkLd+G
 1LTnWKQ1azMOyWIt9szcjS5EcBPLHhh8EwyTHGgfe/Rk10RYeQ5gfI+4BtBUYxSk8kUu+ESEi57
 Xibf1qbIUxRmsystkWgj3a22C7kjcddRyqmJl4GNs/WyOu9BbO96KNyoU8V4Tw0Jgmwgrwqmf9B
 DVG/+WUcfOvB5g1gfgDIk3L2Y6AuaBbiUavcRJxCzgL/XRXw7SSFwWfoz2IRdj/H3Por+wPF00E
 7PVU+o/cf1AUS8vYM0zECNvBKTEScU6PpC8nlZrWT19n05HUARduSc0XL0bcR8+vMi042/fWSfj
 3WJzmnP1vuBjbQBBEHZ4QEChu4NZJANx4OX2BRebwoNxu60EU/gGLk4vUdNs+Wd1XagmB+OGJtv
 l2LhdCMXN2nlZu43cPA==
X-Authority-Analysis: v=2.4 cv=XqXK/1F9 c=1 sm=1 tr=0 ts=6a045759 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=8SZKpzWjcR6UzJCnZioA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ObmrSwRW7fNKtYcUvwOpRqnZVK3iih6W
X-Proofpoint-GUID: ObmrSwRW7fNKtYcUvwOpRqnZVK3iih6W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130113
X-Rspamd-Queue-Id: 501B5531A1F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61396-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 04:55:10PM +0800, Wangao Wang wrote:
> Add support for intra refresh configuration on gen1 encoder by enabling
> V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD and
> V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE controls.
> 
> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c      | 39 +++++++++++++++++++++-
>  drivers/media/platform/qcom/iris/iris_ctrls.h      |  3 +-
>  drivers/media/platform/qcom/iris/iris_hfi_gen1.c   | 19 +++++++++++
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |  8 +++++
>  .../platform/qcom/iris/iris_hfi_gen1_defines.h     | 13 ++++++++
>  drivers/media/platform/qcom/iris/iris_hfi_gen2.c   |  2 +-
>  6 files changed, 81 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

