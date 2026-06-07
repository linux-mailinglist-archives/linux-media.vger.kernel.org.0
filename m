Return-Path: <linux-media+bounces-64076-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ksTsNMLjJWrdNAIAu9opvQ
	(envelope-from <linux-media+bounces-64076-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 23:33:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 75745651ADD
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 23:33:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fIJkw1xO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VD7Z0o3F;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64076-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64076-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E303B30022E7
	for <lists+linux-media@lfdr.de>; Sun,  7 Jun 2026 21:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D49C7333440;
	Sun,  7 Jun 2026 21:33:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B1F32ED55
	for <linux-media@vger.kernel.org>; Sun,  7 Jun 2026 21:33:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780868030; cv=none; b=iPlRlVGKvNzAMyixRQ/r4yobRY8N5wOlCjEfkIGl/UMCc/YqRi2vw3F0KPYam1cvmQe6GtrSQ/m1MBueIs6dMGhqqKy0puiCnSdEY0gAByEIAbIzah75IOLnWkQIcpQ4bviR5pzr2giZ5K8zy5m7LnQXBDbcvIcsVTNIyo7IIDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780868030; c=relaxed/simple;
	bh=4vrsh5dalUSU5jM2xw+kdXJJx/bz0ZJINqL71/u36/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cz4GYIEvXOcSrtGu53yEa2wybihyQxH88gnBFMh5YtraynOz6U1L1Ul8Kk11FoILgjEVCaBfn2BnEs4zt4JfotlXur0KZ3N76Mid7shXCeNJI1SgN4/gCqWwbNRC3CKWhVHONxQC7jkqNvrAjbhagWJNGcWJ/5J7OD07moN13FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fIJkw1xO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VD7Z0o3F; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657EmUwp888829
	for <linux-media@vger.kernel.org>; Sun, 7 Jun 2026 21:33:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pS/NkRuygu2mvwF4imRm5jHt
	TNJokEHTz/MVvAlZs+Y=; b=fIJkw1xOI3FLNQLAAw2am9JcT/xlA58zQ7AKSlMJ
	dQw5SfXxc8Hw4yiYdy3/ZtjKbAOahpzJ3eqix+7c5aOsC7IDVnKgggyQV1nsiV1j
	wGA2P8xQsrMxPIPrm4pwZlQpz3g2lgGwSZ8aYr1vTl6EzKDDELf9Fx/A3qPxD/Ra
	l75v9tnpkoTF/3idLu7JEMbxH4H2W57P9f51cfby4167GOqe9U9OmklLHFxx/KTn
	zgHWWMfgwBHeVlHgQgQ4QjU8qrjYsvMZpjPv9RnaBhS6IAa2mtO8VqxBBDdWbczR
	f2ZXdRec64lxNyeRqkb3DGUPhKOwUyhREEXvhDkhah0pFA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embmrcv7c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 21:33:47 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-59ebf600cf4so6883308e0c.3
        for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 14:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780868027; x=1781472827; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pS/NkRuygu2mvwF4imRm5jHtTNJokEHTz/MVvAlZs+Y=;
        b=VD7Z0o3FQIl1aNA5h7StS5jNN+Rt+55Xqi2oJX9LXn1pxaoKCzh7KiXaparC3eq2ul
         yOnMF2eEfMLTPurYQpngf70WYSE/xpnm9RhBvK0RM70r+TSiAdVMQ/DB1qPO0mjNHowC
         7X4QfK1MzJ3phow7Nr3IFr5PbsI9hOLjciKfQfXSm7ZOwPIMmAQGodmHUKrqpBdS7Spr
         S41VTcU1ijVIiqdACE7Xi229B5Z9BIUMGzAoZQYzBDpbfdkCVQit3Y1oY3/S385Lf8mq
         ppdOc8FPULfXWfVZ3pO9unbMIlbKocdcS+xlnnon4R7xfKzJNtXNSki8Rl98VUElb7T4
         akvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780868027; x=1781472827;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pS/NkRuygu2mvwF4imRm5jHtTNJokEHTz/MVvAlZs+Y=;
        b=SPtazJQM7YzYalkzMnq8E4Rxi+TxstOrcS83KhkN86M/AuWjpAjOQ05MROSGa7q2W1
         zbwWQpEIm4q7FdFYJV3dpae7qyOAzdPNbOm54g5H24xbMerXoBJcS+aQXnvhA0jqX9Y7
         Jd7NDmNKjZvfBkxbGG0/ib7xTptYKy21Z1YT1VOSid1lbkjk10F8Guexo9n5Tr7yxV1r
         ABmkn3Q3TS53iIFSysEQWJ5sqfw5bYUX2r8CW+hQ5lBIvs2Noihmpj+r4br7qnGX8efc
         yVr/NShe1YFpIvsZ+kYJeoRcAuy5dGqhhgneeH8twOvz2k2zvQ43M/WQ8+IIJ13qodUf
         GqNA==
X-Forwarded-Encrypted: i=1; AFNElJ8G7FxTmngERP5+FmXDA1eOxqUh1AQdSsc8Sqc9p7zg/NHaJoIH+HVcjgBpu/XNTDbOmgBI71T/aNoAlA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjxUBKfslgOMmAcWiucWp5w1YtGRFEEGs9SEf1c5oo/uzF8ddM
	c1JpfIkvzKW6mSbpqEM5WHJe0m8ohIyak18Uw1cpcxF3i6FwJBgyBRKruYAmHl4onek+nNySqR4
	8NVDm5oE+1swC+FXn8soKyVvNpIBYU2+8kS6p9Pbi8gPcC5ExAVn6fawouidRF1u3hw==
X-Gm-Gg: Acq92OERa47MZx8BLlD+MC1JEZPHE6qWtyPLf24Qe6jY+5fN3x5c2GK1uT8r3ubI88B
	9tAV2oEdYCn6HUe42m4lNqGJAHeB7rEIoPznjywv66490CtOE3gHyFVdGertwDGS5QDGKjZm/HI
	Xf/6vL36+ZBdmA3aK9fz8p4JSqoD8LynPyxCWYmS/FB9oyHxJDBqyE6D4lSx/H7SAJO/gcVMxlK
	6qkt4z0H+Jm51GopgwS/c7E7QXQLdE2kKbjfjgXtGb/kM1Fs9qyitXrGEA/3/WZvU+kPWkg0u6N
	NQFVrNpnK3fSiktI5epZDEFXkMUkrRETLQlS8icibVOMiFf2tjHUHuOuiQ7M0rI9M+ICWH3QrNB
	5BfBKCMAi93BhFSOQb1Gls6XIPJ160Wfn9IWeLSLa1aCwOywVM4TO61Bqbqgtex8w9ApgeFSPVq
	0vM8Ufu4MbIOxR65iqXgUOXCgghe9LWUWJhZdgSBJ7Dbsg1A==
X-Received: by 2002:a05:6122:2a09:b0:59e:feb7:8a5b with SMTP id 71dfb90a1353d-5ac478d8479mr6298837e0c.0.1780868027226;
        Sun, 07 Jun 2026 14:33:47 -0700 (PDT)
X-Received: by 2002:a05:6122:2a09:b0:59e:feb7:8a5b with SMTP id 71dfb90a1353d-5ac478d8479mr6298824e0c.0.1780868026853;
        Sun, 07 Jun 2026 14:33:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b9995b5sm3273368e87.76.2026.06.07.14.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 14:33:45 -0700 (PDT)
Date: Mon, 8 Jun 2026 00:33:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: vikash.garodia@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: qcom: venus: add callback parameter names
Message-ID: <zrkhwyz3ph533e45bpegu7oi7yufp2t5yw57dnjuax5big254y@cxjxakitwkgf>
References: <20260604001859.33353-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604001859.33353-1-dennylin0707@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIxNyBTYWx0ZWRfX2UID45K+acWq
 SWlaN8Btb0M4WBaIOoa2FToZTflggeZsYQd6YXBZvazPlLPJTDY27iIs3TPRT72J7ngmWKRshkV
 /3p34Ic+eChdrtnnaqTZIeGuxT//C3jp1og5SYyfBukGoBAKhB1E3hKry6C8BCnBUYM60h2n6R3
 8upnKwS5RpBnh02RYIkwHC5sUz0GbyZ8y4WX4wSELWsTfUgZnXL4pduyR37L4V7+Q21pTZOyElq
 HaSiwqFUuJux5qTcpQQNn4/IRKAnMnNHRHvnedSocgjl9pIyKl6KllOsUYlkWHTIGZB+AI8z/72
 xfxLRlvystdqWAiG3wsaLd0+Z161hUEGzH9d+SsnYjva3LYz79KWDYLdvnOIoYIVQ7DoEMY6G+u
 d/814NCzzyeW5a+L3e/QAgMdE+Z32h/xWFODqletLOzlMZd/35p2FwRas/7kZyGwb9Ab41pztOt
 jWx//DYzt3vJBjGW2Lw==
X-Authority-Analysis: v=2.4 cv=B5eJFutM c=1 sm=1 tr=0 ts=6a25e3bb cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=LwDYr5J6HBqJMoenJtsA:9 a=CjuIK1q_8ugA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: 6euSLl-8095J-qSy8MmEybf2qM69CSHM
X-Proofpoint-ORIG-GUID: 6euSLl-8095J-qSy8MmEybf2qM69CSHM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070217
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64076-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,cxjxakitwkgf:mid];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dennylin0707@gmail.com,m:vikash.garodia@oss.qualcomm.com,m:bod@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 75745651ADD

On Thu, Jun 04, 2026 at 12:18:59AM +0000, Hungyu Lin wrote:
> Naming the callback parameters improves readability and resolves
> checkpatch warnings about unnamed function pointer arguments.
> 
> No functional change intended.
> 
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  drivers/media/platform/qcom/venus/hfi_msgs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

