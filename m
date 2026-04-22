Return-Path: <linux-media+bounces-59349-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4M/iA/Up6WknVQIAu9opvQ
	(envelope-from <linux-media+bounces-59349-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 22:05:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4522D44A786
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 22:05:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A59AA307B4C0
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 20:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE6DD3F210E;
	Wed, 22 Apr 2026 20:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YtLDY9uF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IgovRglL"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C39367F2F
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 20:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776888260; cv=none; b=YLNFoB4HKXTIESUQ+Nu9WOcfflB1elnq22xIJAUzDqOb1Gj3pksylDHj3sdVMv0xPyfpB0IhMlehe6Uj45eJZx2rG1hcmWfmrXc/07avphy5AGRAzw59PaCscHa+/88SAgI/mozCxfDT6+CJ64a62LV8OhXhc/69AbETsBSkgXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776888260; c=relaxed/simple;
	bh=Vw5lbIz93bfPivnPlgZTf922sy3wFpATm4HMbXkasxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tgsZWUyyvv5RUNeZdwVWc0pdLxbNWjdcFnbSd2OWnVQVibHSTpeI8Xh9ul1/5d9dStxp9rjXd5QuaR2vDlJOt28UtPtZx1jkN0MQy8cWOzK3X+QUQ3B3nRVr4qqRQUy9ZLltwnXt91BHlazEWPNPFHfcIcfRXHgXnEzJDFZWikw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YtLDY9uF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IgovRglL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MFfKBs2956091
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 20:04:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TWNv/n77xtlQNACjJ3+8jJLY
	WYV7KxtU3j5KJIFZm9w=; b=YtLDY9uF5xOkCoR8E3Hapt6dWg8lw9y4CViURo4X
	3sj1xGiBYjfiOlGRP6eA/ix80qQtgSD5BDXQ3OUdZi2TY8vDwvtnHONVZG5N4Mtp
	Evjab88v4Ddg4qOo+pRr/xWx9Ns8qPgqG9+E9Y5FUY1c+m9NyDi490VZ+5rT9V3X
	rNy5DzOcpX3JpNZdLuhslsk3tCP+DLqiJIYsqlrsEn3PjEuWX87GqgAERsSGEPLs
	4Q9NPD4F4ixz33UAUspYkKvlTw16b6m5PgJ3Hig/XunesxrltP8r2sSMMsafu2is
	qNEkRl9ZPlkFePAbtM2xVw8xZtpC76DJp4eX5vb3NdhhPA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq16q0xsk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 20:04:16 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-956732444ffso8879123241.1
        for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 13:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776888256; x=1777493056; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TWNv/n77xtlQNACjJ3+8jJLYWYV7KxtU3j5KJIFZm9w=;
        b=IgovRglLjqALlavWRYhryS09AZfjTpUyQgJZvl5VWXz3kRma5ipHqIJlski6CIlXtu
         4lCkRaR9TqzZxGL9HQaTCtf+5AZsN8okA4UlztxlaRh6pmY9DbJGLPq7gmKzPSoNyo5V
         qPsROGu4eN6JFKo9Qndiw2Zbf2YnrUlLQPCC8gNJpO9E54KFvVKe8VY7O4AZbP0WcaEm
         SHBol4kMEsW2iKDBlIiwnmzUAKb2rzp49f1Y/RL8NJ+UA8/4mY+ErZ7WyizGV0U37hJ3
         eCocGU1RM3QOuh7wHHnNaLDuv43OSkf+j2Tf2elJRQjWPJgo6DjsjHM8DK3o0zwRsrLv
         In2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776888256; x=1777493056;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TWNv/n77xtlQNACjJ3+8jJLYWYV7KxtU3j5KJIFZm9w=;
        b=TxDP/b2pUrbcqW2JSDTqu3PFWOLXkAHJ9ZzPuQO+CNdd8QPXmuL6CGnUbTTFv3dCLU
         lDFh4bwpQ9Mw3OZbLIWs08keODp8qUPWJZqDHHt/+m6+j3eWkcH1wGYrecRLtoRofrN7
         GTbBUiXdU5kqtWnzC4dCEn0FbBcIESGpi03q+m/WJXd3kBpP906N6F92S40Oqr4fHfaF
         y1a5OfxKFpirt0RRbOty0RU/RB6Xt19RnN7DRbbjcs2/uFe+6L0qAWbYMvfDKJRceq2p
         FMd2swMWuYVcwtBg5ScNwevJkSXxtB+JsUU0db98lnM0AYmkfeUE8B/MfZt1z81I7ZVO
         E4mQ==
X-Forwarded-Encrypted: i=1; AFNElJ9+aZNGtASw6R6IkCtjBEBKonPmplwNQF/GZcRFOAZnTh9p1HlHZuv6BlIfOTGE8iG+kDdi5ySjL08Fnw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj9hsFLfPx/WAXMH8hFWfHaFL1vFZcK9Rc74G3UjPhFy3VGo/5
	Bw3lGBB8iE9zXpkClZ2VrBYS8w24EmETQ1ZJhjEBakEvtQuJSKcOg/5J/ItXmUn/5C1m7vUy9s8
	EN8PoeCybcMs56U+7+DL78NVpf6K+EIcm/aikenyn6VTkz+CxW7/Wkyv6A35S3H3VJw==
X-Gm-Gg: AeBDietNvsYR3FL1oKMBhUpEfvXkwdHYX5Ex8qHtx/Hm59d7Rfi+rKyGwV7MUZBWxlX
	D+BqeN4sAl85Juil3PRuq6TmMIyQKmVIxp3ByhqFb4kXTRdietkvMzBnXbzbx2cy//ohhKME3HY
	5/hoQxg2e4+qVsRoorCKQzAuf9YotiXAqI5o6S6aapF4mZcUxG6QgyygT26Tg4uP9aVQ69VowhF
	0Vq+RsHVioEQoDyiPgcSUNnkBRAm+nKqGvBoarG2ChzvJLtaYtX7cfLht6Uqsl12XKkdhlV57Xo
	S9dEbBotTjZA40VgcnjdtFBKifxXFcvp6JTP9CkIIB2u0h1kTYfmtQ3X1d2V47wH9tpG47uvFoi
	hladx78FuN/lQQrtJXt7atW4+nGyWFnywX0uvKJwSvozsEywTLLy+xM/qVh+dpDk7t9+ey4b2Gr
	P4y490Y0cwkWbDmO7DWmd02n5q5SmX45hsPnVmAcnBDsoSeg==
X-Received: by 2002:a05:6102:f9e:b0:609:4d86:77b with SMTP id ada2fe7eead31-616f73fb077mr11984425137.24.1776888256330;
        Wed, 22 Apr 2026 13:04:16 -0700 (PDT)
X-Received: by 2002:a05:6102:f9e:b0:609:4d86:77b with SMTP id ada2fe7eead31-616f73fb077mr11984380137.24.1776888255894;
        Wed, 22 Apr 2026 13:04:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc25csm4689196e87.26.2026.04.22.13.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 13:04:14 -0700 (PDT)
Date: Wed, 22 Apr 2026 23:04:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@kernel.org>
Cc: lumag@kernel.org, robin.clark@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, sean@poorly.run, akhilpo@oss.qualcomm.com,
        abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
        marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
        vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
        mathieu.poirier@linaro.org, trilokkumar.soni@oss.qualcomm.com,
        mukesh.ojha@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, harshal.dev@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v3 10/15] drm/msm: Switch to generic PAS TZ APIs
Message-ID: <fuypqlwseulyvlsgiq3dnh3kwhernjid2yqljiwmrxufzfuukq@mfy343uq5gs3>
References: <20260327131043.627120-1-sumit.garg@kernel.org>
 <20260327131043.627120-11-sumit.garg@kernel.org>
 <aeduRrAMOAW4f5TU@sumit-xelite>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeduRrAMOAW4f5TU@sumit-xelite>
X-Authority-Analysis: v=2.4 cv=KPNqylFo c=1 sm=1 tr=0 ts=69e929c0 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=dgZ2eqGgcVFd7X0fNysA:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: 5_yVvw5YSAuOjTVkKch3MrnWU03UHuuK
X-Proofpoint-ORIG-GUID: 5_yVvw5YSAuOjTVkKch3MrnWU03UHuuK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE5NCBTYWx0ZWRfX0kAG5KTJYOzt
 ETdDLcALdmzOJIcrVy3k1c7bcnw1ReLuRwTwJESiITijd3YLnMSL1UEzY5LnpQfVQAkjaDqoQnG
 4TMHxnA6jefb4qrTO/tbY3C+b04SNEtNrKja291c1Al/TjdqzvysODPIprLjARIoIZRsKKhYche
 yKfRzm4cGWtzKq3LbvcYDLLsU1uwc3ZCBLm+ea3/A/bKp30PGUyn+TI9k1RkqaMskBPhgVM6/hw
 ARDoBDCEO3jgMGCd7E5zQEGeh60slzGTzsCdFuVnER7deiP8i57ZOC9N+APk/OAmdTU7PZFNZFB
 T3ZZeu4ku0IlJyj6jQM79HrcgBtlbuTwcqrLFXLqoT7CnhnY94C3B/y0kH6D0tSIxJRHBKFODDy
 hRRZXTmE09aRg+JvGFOzDDoncbZNyKRlLY7wbvc3LilJZ72Yjs+3ykIaB+T1VRor78GJvbBiR4f
 06rD4D/wh/95C4nDaOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220194
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,vger.kernel.org,lists.freedesktop.org,lists.infradead.org,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,linaro.org,qti.qualcomm.com,lists.trustedfirmware.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59349-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[51];
	TAGGED_RCPT(0.00)[linux-media,dt,netdev];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4522D44A786
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 06:02:06PM +0530, Sumit Garg wrote:
> Hey Rob, Dmitry,
> 
> On Fri, Mar 27, 2026 at 06:40:38PM +0530, Sumit Garg wrote:
> > From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > 
> > Switch drm/msm client drivers over to generic PAS TZ APIs. Generic PAS
> > TZ service allows to support multiple TZ implementation backends like QTEE
> > based SCM PAS service, OP-TEE based PAS service and any further future TZ
> > backend service.
> > 
> > Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/Kconfig             |  1 +
> >  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  4 ++--
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 11 ++++++-----
> >  3 files changed, 9 insertions(+), 7 deletions(-)
> > 
> 
> Can I get an ack from you on this change? I expect this complete
> patch-set to land via Qcom SoC tree.
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

