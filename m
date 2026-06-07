Return-Path: <linux-media+bounces-64073-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 55llHDDYJWqEMgIAu9opvQ
	(envelope-from <linux-media+bounces-64073-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 22:44:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0CB651891
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 22:44:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cCmcEv5R;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Wm7Ux+WZ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64073-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64073-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 38FB0300AC05
	for <lists+linux-media@lfdr.de>; Sun,  7 Jun 2026 20:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E51D5330305;
	Sun,  7 Jun 2026 20:44:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D1B30C162
	for <linux-media@vger.kernel.org>; Sun,  7 Jun 2026 20:44:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780865062; cv=none; b=W2lwaaOvqK+WLgTG0lD7TYFVvkwpUjA/6963hdyrf0Gt9OHfLpii7EYwT6bCgXcXDNCMxEPNqxsbH2Yqax/z/6aA6cDxr1iK57DjlX97dcmlwJft7rfEUp2RtRfvoE45sM2392ictbaOJxwRa3E6P7pylGn1AIzfJ8cvCMwclE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780865062; c=relaxed/simple;
	bh=tquqogWj6GSh8fmWxquG8FqU/tSOEW6bII4HXmMjDTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TkadtK7OoYFsGBOFQ/L3+6rAa9Fit9y0Es9ekYEdSQtTp9i03DGU8iboajphDGf7chtHtAkTio6VU1xnOZl9hQVqaTZL7FIemmLH+3A/nA2JsI2w8trI/QZ8FQ1u26wjk53b4wMw9ak0pkMzlS3749Top5kRUBg/XZmTHjgZFpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cCmcEv5R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wm7Ux+WZ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657JFmfx876142
	for <linux-media@vger.kernel.org>; Sun, 7 Jun 2026 20:44:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KQvxeR13aB49mDUdwZizzQKT
	jruFNIwIR8/KYRAVC40=; b=cCmcEv5RicEIe9BO66g570dfbttLjJiD3zt5OuRx
	V3bwYiGXWn0HzR9CM61pzBQUJNgjoAGWrAMFx++ajIUEayvf4QMbrkr2BV6ohdDx
	h7Ggo1nWdKaUqee+gpcRgAEanAKz8yDU9RmuwS8m2J0JROkb5p34+Gd1KZOimDqF
	939Kc+Rb+gjiJ9iRxvdBBy0XzzSTHqW266ZLkopByfMdf6bDBVlz7b+koOLp7VsJ
	f3n1QXyWfdxnQxhsT3iNyNA2bGToCKV3LsanPVodRGNAsiZs0I/jgxqIxDxoAhIn
	YCHA1i8pBvyKXnIA9fk5jit+82un1085NsWba8ZfrFBMDA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcqgvenh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 20:44:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51775f7b2afso88647731cf.1
        for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 13:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780865059; x=1781469859; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KQvxeR13aB49mDUdwZizzQKTjruFNIwIR8/KYRAVC40=;
        b=Wm7Ux+WZdzHwkrpSsVDEVYZxGXQcq1Ox3iO6V1hEsFdlEEhTCpvAPDvbfG31vK191E
         JC0fOkfYgquJnkSEkFPZ/8KpjzBFZaCtzepGcJPWMoVDp9CANXCm+GApb+E2v4q6L2kT
         0paBEBijjDCECCytfZNn9qXbOh3xBdTViGLfzBdCOGJ2xQ8cLNAMRG8mh7DzFfH8anop
         wm3m3VvwWsKETESkoMsdtA9/Ik8GcufSuzFScb1ihdNeT6exxdRg8Kgx2TyOZ3d0Ku4g
         sv2fBVaSKTSnOgFWdju7b7mCqrA4Sw3GBMDo1T43mTfwz2T/G/gkdhz8ork34DjjKlFW
         No+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780865060; x=1781469860;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KQvxeR13aB49mDUdwZizzQKTjruFNIwIR8/KYRAVC40=;
        b=OVzzZa86/NHL5PRzMDvt8eA8gjvxnhg8moP0NUaqDLm6q6gYQMRzCe2bLGp2wHe5l1
         wckU4F9DGXsaCtGFHF5UmooI2fMvYMv9BzUQvLAqk/2wSuZs+ugeKrOsCyowRuJc9Npo
         44RlqfNSW8dUzPFTU26ga47AP5CTU0UDwGp5TDJ35Z5Rx1aE625pN1orzUPkUjkOgafB
         +L8bdKtie3HjGYVDuRbkmPVGVMdIF58cFrK1smLZzZfovRajJ22uSGYN7BgxLDzcIFgl
         WZjlPg/ro2G+O9CbOkG72/Bn9zFnPkDj/SBKFGT3/Y2E0x43LzTEL8DJ8YDHzh+31t1q
         z8mg==
X-Forwarded-Encrypted: i=1; AFNElJ/FU05EgCWHMcf/uL24+df7L+RJQQvGsqf4MAkhifKorUiUBVAcQqJqeDU86Z3APfGtntOj4YIk8e5EoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWdta/AQVt1sCVUV+l4KNes8RkpfVsPGaKNierHXHAVSk/u5ki
	A/1iF67Zvy/m0w4ZF3SFgJ45pGz3yowbwepBqofthJvTAhwvJxWVKEdHy9qLO4aLKuTx8cDonvo
	P8igBna7vRnrKxkOpYZqBk8r6wXdIVpJJ458lpTNNAtEoj7ZN0dnmo26liRO7+rqL6Q==
X-Gm-Gg: Acq92OHVTflouZjnoLZMoK0lYej/YvvoKm5VssfmLjbLgKRF5ZiJIj66XHFTSbXIRXk
	vhblGd2rAFwQ6DuGeyor9KJpf5v96rUvv4t3ELGLYncweQiL3asjy44DIYt2tgt08TaQ/fZGy4w
	b+UKNQoGRsSjHn9GyHwdLbrvvvaU7OaXlX+EZyzoIUTGioMEt7a+6um1F2YXluhzoMtpmyTXsu+
	nJrNafWgyBbNpRY6GPVtogXJOGBevTJISMb3XLOrOHPUVYhUi+g6UmFvSf9Lo++5G4LSCU3Py6Q
	awcS8ekh0kHpQesF838wmEsmzDrRyL9ColyrQiDNkDloiroG0P569R6V7BZt0QpD75YS5BOX68z
	CJJ++uC3vluPYMQLxmDEzFo3fScDnSpSRQ6nh5KL6voRmcs5DXX7rYdOAl6Tf16DCAtqmELo7Y2
	0jWb+qJpg6bD0AOkbGDpCmc97LziN64482kjOTsPAzvpA7pA==
X-Received: by 2002:a05:622a:28f:b0:516:6818:6d74 with SMTP id d75a77b69052e-5179882d40dmr134197821cf.34.1780865059660;
        Sun, 07 Jun 2026 13:44:19 -0700 (PDT)
X-Received: by 2002:a05:622a:28f:b0:516:6818:6d74 with SMTP id d75a77b69052e-5179882d40dmr134197621cf.34.1780865059285;
        Sun, 07 Jun 2026 13:44:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396abd6cbe6sm41043201fa.0.2026.06.07.13.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 13:44:16 -0700 (PDT)
Date: Sun, 7 Jun 2026 23:44:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: vikash.garodia@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        abhinav.kumar@linux.dev, stefan.schmidt@linaro.org,
        hverkuil@kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: qcom: iris: cancel sys error work on driver
 removal
Message-ID: <f7e6d7xcn6llkzmwy42kegtnegh7ygdrlyh2fzlkthnj5stddo@za6vkbfhxyq5>
References: <20260604054708.42426-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604054708.42426-1-dennylin0707@gmail.com>
X-Authority-Analysis: v=2.4 cv=dJGWXuZb c=1 sm=1 tr=0 ts=6a25d824 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=Frj_RsusioBgzsWQpiQA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: jv35v-k3tOm3g9ywijDZnIZE70tmNQfu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIwNyBTYWx0ZWRfXxMe+scEQLqVN
 NSkf70fN+nTml21HoS9AsgyjCIN8dDPfDD3wjqhQ3+Cck+1MnEwvkmy98BIB9eTXWMzoLqSe/5w
 trjAKfUWxJOydbi9STMQAdzuz99BHQ3+eXg/4dS/0AXunbQ95SQYs83xU0Soe5aYY/UDCKrziUz
 a5UNm4Wc61pjr4N4xq0YnIIMfO9RGIJeC1GCBRXaTgS3c4qEi8D/mLw3rFrfzTdVUhIeyy9MGox
 bYnmFpATA64SL3eQJ2tLNLx6mQOv0eItrtkvSNA8jGAVg7OKxcjv3hfPLgVGbLRLQHrhVvHsMee
 uXBU9O2tcoX8p3kb1/F8SeFYhqTKxFhmxkrXr8d031u1yrjYdZgpq2kWSSe+DBCeH9iVsv1iM83
 24lEEhHzEbCpcPLVhI1TRWCeAKFf9GWqJM/r/E/wEh69Y+EI8zStNpj8iURDHe9BAlmynxTUbgK
 vSCWQk0wlY6W9yMO5JA==
X-Proofpoint-ORIG-GUID: jv35v-k3tOm3g9ywijDZnIZE70tmNQfu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070207
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64073-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dennylin0707@gmail.com,m:vikash.garodia@oss.qualcomm.com,m:bod@kernel.org,m:mchehab@kernel.org,m:abhinav.kumar@linux.dev,m:stefan.schmidt@linaro.org,m:hverkuil@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DD0CB651891

On Thu, Jun 04, 2026 at 05:47:08AM +0000, Hungyu Lin wrote:
> Cancel sys_error_handler before tearing down the driver.
> 
> The delayed work may still be pending when iris_remove()
> runs. Since iris_core is allocated with devm_kzalloc(),
> allowing the work to execute after driver removal could
> result in accessing freed memory.
> 
> Fixes: fb583a214337 ("media: iris: introduce host firmware interface with necessary hooks")
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  drivers/media/platform/qcom/iris/iris_probe.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

