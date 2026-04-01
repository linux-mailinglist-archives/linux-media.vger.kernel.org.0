Return-Path: <linux-media+bounces-57868-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEIaMzYGzWkjZgYAu9opvQ
	(envelope-from <linux-media+bounces-57868-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 13:49:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8FC379C7F
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 13:49:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0049B30CA6DC
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 11:38:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E11F23F99EF;
	Wed,  1 Apr 2026 11:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LhBsvXTg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HUifjcX3"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1153F880F
	for <linux-media@vger.kernel.org>; Wed,  1 Apr 2026 11:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775043525; cv=none; b=qW4wvU569X9U/5tE+pQxHsT4dl6WNBgbdpH5VVA/6FmJUd5208gigbbwE3kOD0yoKRCX4YHRKLHwqLzMqLRLhEVra9DY21LrmuCdwBjhF57dSOcz5g35iLx2kXFGCBHv9la1VrT6+Tufwrdk2LHGZpAscfZ/sCamUMdQC/8WP7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775043525; c=relaxed/simple;
	bh=9lF6/Z2ng2NfKefNCOj7h9ssGxb/NQ+cKBLJ606d9xY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GIBgpAa1dRSAEqKYx44jpfs8s5BahRycJ2JtHDVQ6E8/vHEwrRz9qHwEFRZmV8Cq7MrMApp3gSd+8jj0DvWJWxB0xPOKojiekNgeEpgAWKJ0qcSwEX1VYPpDzlkLj+yZtCEa7OTr2r+AwsMaOr9HZWF/nehduZMTm9uxshm/lWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LhBsvXTg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HUifjcX3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63188WSa718531
	for <linux-media@vger.kernel.org>; Wed, 1 Apr 2026 11:38:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2YHUSDWpXQ41/aYcBpRP3MQ9
	m2yOueV672FiMPwKgK8=; b=LhBsvXTgVZhhuPUCWHlJmJt7vw7dA+9UP3zXTZfD
	gorHDku3dPsDnalbqOYR4I3LzACaV/kAUJfVtiezGV4c5Z+3vwEyHbFBLh4HAlMb
	0ypszBwaO70qDP+czIJVVhNf2wHjrkDQSuLYfzCI8aoGgNO6KwyJTq2wPsrhpImg
	PpAyc/zycQacjlVSYSRGdi4WBDzek/08hXpgHDrGlgz4sZOMMD6uj2cwxuqECu/X
	KXHAqt6Sb+lFtwSAwyKJLtmkkLbjpwM2Dsrd6wbSTCjpvR9pQOUp3unKi0Sw7gR6
	anVk+GzGvq4cXfx2MaUuxqnji5TXXlSR0yjxmgGTDJIIJQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8kcsurr7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 01 Apr 2026 11:38:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b274f94f8so22536341cf.1
        for <linux-media@vger.kernel.org>; Wed, 01 Apr 2026 04:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775043523; x=1775648323; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2YHUSDWpXQ41/aYcBpRP3MQ9m2yOueV672FiMPwKgK8=;
        b=HUifjcX3AzoSHukeV66fqjdOJQXD1uGRxEx364ZP8WaxmcKgn+AbD7qoku07aQLfWQ
         k+55x/4GB/+9PH6v2W/Ai1Odt+D1k7TFq6oFKnrAsV8uvEfEbDCs4C3M6wZG/L+p4saS
         HZbT9oB8XnPiKOuCMV5UJfjtRV2dngSyJIoOT1qyhgRkh9hK7D1R3+JDTr9VBKVKyJsP
         aq39XCotQf7r/FX/EG+ufeuW79e/7n3/vDcBb0s3JruwevT6g5HVvD1ovR9W3vmxJCO3
         pifgv3Npvk6dOc0VbMjv2Nm9YyolWsR3l1mhgyTcom62ZFEGbY/N9dZ8gQHOiFJsIasc
         pofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775043523; x=1775648323;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2YHUSDWpXQ41/aYcBpRP3MQ9m2yOueV672FiMPwKgK8=;
        b=pm7sDXMfqpa6p9FevAuGTtccDf6AwXiaZCkUuuhs8IiXS7ipJGuf2OwP4XGdch/kNO
         7YGgmgLbPmiu5BL0jaZAHbGzNzDeg1CX73O5rZNc3QddtVfZTz5eBZ3jLrJqObU/Jb2K
         0PzTjDmVrnvkG2fcjIuaXusrydHBsxDvUypuPs7HMBXOYZRgttkvbZp2742AoU9FBNRO
         6iBIiEMHoGZtVAKXlDEPesWIxzR7HQjfksQBzfrIOF+vXl6mSTaMD/u6zOJhW9qRuJov
         f8TEhaB5R2eiPuCrN4FLK4HeX6STZLKhrR2XnOus2pu+i5nWs+ZCUaTuUZUOtFFxX7/v
         x4vg==
X-Forwarded-Encrypted: i=1; AJvYcCUoI5h6Pp1KzCgmbXCdLZ9Gn0EcKfHjrmIO4J/vdVkGk7cceeUYFTJh261S0xxPCD8iYUAQBQqDNFihSA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9r3pnEqt7e9B01d7ZrwGRYrW4IJNrACns6eylAfkXh2sGxgQ5
	mChQsGeQlPPQMNzaaDz8eLOcwCcSgCz9GvSts2mFurVdf9ieFvfwhskWi/VJObWLLYW3IBwgaaO
	8dpjvuvpcE/pHzwf6b1U28KhlxMDu9CYEO3W/O4Kbeoc8Ziq/uO07agE7QEWitu0ypg==
X-Gm-Gg: ATEYQzxwuugPWsNv3LNavBc9t9AytEkSUqHa1sPwOQWjR0OdayzHOblZ5gavsjtSCnD
	v4Zhk2gO6gsgCO763A2u0A3UKYb0cRgQmhw7RL3PQ/0NEZ/3z+oaaaXRNN9mLVxhCx1jtX6XuAy
	nAZA7MZpNJj77mqk+JxZG4nB/pnHCJ6nhrhuS5dDoHrOCXxDzIgr3x687UswBm/nN46NX6N06GP
	Ta8rhRV0D4n9fHdYAQP+OP9tXjVVEbL7cpcZPM7tXnYkxKG++G117qy+rEt5c8QZk9IYNLaKa/C
	EueJQ9Uvf8gvFhC7e8jLgz0GboXvMcVolGMy03NDWmwqlYCZ+w5lWCPmjU8X6QtI9S45n8LPB1O
	ydclhbkem/bCDylk9dVEqpR5sUMsy3uJhQsY8hI27nzl+HW4EsJ2dcFNnBMrIZDDXg9A3Bz+VqS
	DwR3/fbFkPYxynGuJ54e0n8VtYpi/0B6iJ9q4=
X-Received: by 2002:a05:622a:87:b0:50d:3efd:bd93 with SMTP id d75a77b69052e-50d3efdc340mr23635661cf.11.1775043522532;
        Wed, 01 Apr 2026 04:38:42 -0700 (PDT)
X-Received: by 2002:a05:622a:87:b0:50d:3efd:bd93 with SMTP id d75a77b69052e-50d3efdc340mr23635471cf.11.1775043522130;
        Wed, 01 Apr 2026 04:38:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b140ae63sm3193341e87.37.2026.04.01.04.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 04:38:41 -0700 (PDT)
Date: Wed, 1 Apr 2026 14:38:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v4 0/9] media: iris: migrate to using global
 UBWC config
Message-ID: <hko7spuzbp4ac57nligh75vi3tmz6mfb3hzuq3pyvaa6p5lyqe@6k76s47t3jex>
References: <20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com>
 <177499105231.956796.588474423586543717.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177499105231.956796.588474423586543717.b4-ty@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDEwNiBTYWx0ZWRfX4xN6SCjX8XZn
 QUqUj6ShfNNUZF522Appm/5bGRiOgvhR3bwrlHQohmkwUgvKspouuWfWHTVW9tKdaBOu2gcC/1s
 V0Y5CH13/cvEf4r6wBsQZUAZM9CDNjYhsa7wo/sksIDVOyKoYtDTXacJHmZW+039X1OhMPAKxyh
 vp360QN+cko2fSCk2lkWOwdpwFiaD8OycrOOoCaS6lCFXtNUIoiTHiU4+/Oy8yZ3sAUwqSS7+CK
 gTnC54kZ8CyEE7zhT58k0en7RGwiisdk/w6dz1aLgsIWQAcjkpNtSZYO/27VaOA0ovK0ObncIcE
 k+s6bdN1k014rMa++WUn1T/XaQMmh830InMi+3qvmYCqWI+guumzO8SRxvgSSF9vmvLF6UxkzxX
 adAbPL1pnyRbon6aFB3ls7LH4Uq1mH+FcKYMU/QGeFyvtpbk4XLM3p5ipLzAhxlCPrgWqH7BepA
 GEyUXGCS6YNfwkSPv5g==
X-Authority-Analysis: v=2.4 cv=KNlXzVFo c=1 sm=1 tr=0 ts=69cd03c3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=gYGmWrsk5Bp2t3VVqaYA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: YfsFF-xh-0o3nzgx_Q7QrIAT7zIYqCqv
X-Proofpoint-GUID: YfsFF-xh-0o3nzgx_Q7QrIAT7zIYqCqv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010106
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57868-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org,linaro.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6E8FC379C7F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 04:04:24PM -0500, Bjorn Andersson wrote:
> 
> On Sun, 25 Jan 2026 13:30:02 +0200, Dmitry Baryshkov wrote:
> > Having UBWC configuration in the driver is error prone. For example, the
> > driver specifies fixed values for HBB, while the actual value might
> > depend on the DDR type. Stop defining UBWC data in the iris driver and
> > use the global UBWC configuration registry.
> > 
> > Merge strategy: either merge SoC bits directly through the media tree
> > (with Bjorn's ack) or merge to the media tree through the immutable tag.
> > The drm patches will follow depending on the way the SoC patches are
> > merged.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/9] soc: qcom: ubwc: add helper to get min_acc length
>       commit: 68a66a44af6e196ca426d1250104d3018ed9e74b
> [2/9] soc: qcom: ubwc: add helpers to get programmable values
>       commit: b2571ef8d4ec9bb636889a9132090bcc3449792e

Is there an immutable tag, in case iris maintainers decide to pick the
rest of the series?

> 
> Best regards,
> -- 
> Bjorn Andersson <andersson@kernel.org>

-- 
With best wishes
Dmitry

