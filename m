Return-Path: <linux-media+bounces-64066-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GlcTOBPQJWoDMQIAu9opvQ
	(envelope-from <linux-media+bounces-64066-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 22:09:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A1415651740
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 22:09:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MnlCSvn+;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iYZ916bi;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64066-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64066-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7054B300888E
	for <lists+linux-media@lfdr.de>; Sun,  7 Jun 2026 20:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1BA232B13F;
	Sun,  7 Jun 2026 20:09:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310171F91E3
	for <linux-media@vger.kernel.org>; Sun,  7 Jun 2026 20:09:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780862983; cv=none; b=eFxVD5s/Tm+KO6sdSIZ5JPK+j30p0hEkE6lE1I+gK8OIlFcIo+ceeOqXfc+SwRYHHMH6vSNn43TLiTc4i7My1HvWgTITeEATqKb39qKzZ3ghbnXONUoLT79BkzTDYpmUZIBVHi127F8ih3le0KEOFvVfByemwKf5gE9mn34g924=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780862983; c=relaxed/simple;
	bh=qMsCTphcyfJwG2keofCj3xV6GtspNvWMVyaSFJHMNso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TKNwjaUvlNyu8SEnLlcUZOy6bcpUolqJUlNtsOgMWaQuYm2Z33Wo7GeTsL7qji1wRLqg3QSTNc+jGpqTt0X0QTxkULFbY6Tz/zdzWEGp65MTaveVwI2qS4T3HxJyc1BBb4bhu5wJohvRqLlnE30qA8zt4GyPUSoypFmrTgDhVz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MnlCSvn+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iYZ916bi; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657EjqBj441200
	for <linux-media@vger.kernel.org>; Sun, 7 Jun 2026 20:09:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rxbhsmoBjvBJEbNFkKWklg1d
	0CARO7dnLafDF3eTTBU=; b=MnlCSvn+F+ACoVL5qhGNGP13DFXizdxPn/SZhohn
	sqKX1abNvBa6FeBf1Z4kf0bnTDupeDMEZ27c8lYEP5hZ/j901dj2l8pdIhLsM+3H
	pGKpGzyQ2dza9EknoNkWlaUoIDuUqF2M7wOpJjFKxBNPbiGUJNQ4cdE961xG/f0n
	Smbige5Z66iR0YRUBBvDIhceHCI6nXMkzSunQySIw2a9c/H9tc9Yc6QxGWyijB8M
	NLqSOy7vhhmRRUSrGZtXLD/TVi02J50Dvr+rl6o/vckIYLfc5P7ches7Q48fUUwZ
	A46RdUcSzb2hNGJhmuWl4FbjbY0oKls/Q/JBiVvMNRjw3g==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embs1cjjc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 20:09:41 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-59ec1fd295eso2041144e0c.3
        for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 13:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780862980; x=1781467780; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rxbhsmoBjvBJEbNFkKWklg1d0CARO7dnLafDF3eTTBU=;
        b=iYZ916bi9PgG+Ki9dAZjU/Jj23/Hcm79pBsPleGStAmpQS+Q6x3Acq6DzHUFyCEdlQ
         xRJEbPLbcg0NfmbpVZhKqpc0pN9lugJv/R4BsJiy1sG7D/10SJDXJmeRSQF/YqKCqTa+
         yTlmdahV58QcC1O1po/gRaFLyuAS+39Esk02OeppPl7Bj9E1QOCQ8a4DXmQA6A53uT53
         U47bsKXxwQlp1qmwrbYh7SgFKlprj1nRnvGspiF3ZyNiimcmngrs7sRjwMmbomHepV2p
         wog+yEjAyxSHL0CU4X4d5dxcKQLh1guPA7p1xL4spNZLj1qyHddPyqIW0r3Y7hw7BzQr
         AFow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780862980; x=1781467780;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rxbhsmoBjvBJEbNFkKWklg1d0CARO7dnLafDF3eTTBU=;
        b=dEaKiqjxyPCwaz8AlrHaNJIz1xNTD00oTcnlTY46dS+ZK2+mJVndpvueq5DGXTxDY8
         IPSOpt3Zueb+aaYPCj6RSEU3JgqQ9rMRRkuKbS0aLaNdy0pFcg9ztLFzRKMrsWvHlsq3
         Gg235dtGWx4XSQYo9pnDLe772aZhgbpBD2a8/MaPL7zyaM4iYxI+NXyh5ApTkFmFtl+7
         IMFV+7PFX1ckaISZHopwQMT4PJ5MGFRbqJs0DCZYb2nBoTAr6eEPpP1F+KOYq1u1x1wa
         voLG+H1Lku6hIRl5SBYkZll+ucy3cMpYWKnqQ9btbGLJ18dd1mp4LMByENy4h3EN5bwi
         TOmQ==
X-Gm-Message-State: AOJu0Yyk7cS4M3/S8pXIBhHYOmaVbAPOK9107zXmmPeZlwQkJPdLA3sX
	MKxQ4/Ac+xYG/NXS3J1kRKZSPkYsIf39rY5mO5A9E9QCqV61Mf0ijBJQnqgSpo477kWIBxVRv5d
	U9rA74TLTTnql2RPMBn4INA28Xm8vONHpwJh0HoRS0tuD1mK919eyf8Mfep3/CJTEwg==
X-Gm-Gg: Acq92OFsf+XcYC5ANXy3xU2TNsFgYHnTXf9pLohFfURjkkD5R5n0kPvPO71GFXbwYSr
	cKiAuvfHH/+BIP6vQPwzznfNv7iKbx6HLZ/Yoh+2bJVErh0l3yBuB3G0fhia0EoWWI4q6eB7nj/
	F1y0L53FROAF1r9tzrFmv4YZn9FcvnLLnK7yIF+Lbu4nt88mCrpBxTf2GV7xDoL0P7/Ie61jKKu
	F+PiqE3JKVT5897BYWViJ6MzkkdJwvgGAWUPTTTbIEy5F7llx8izXeNHHd6EsNHXSXj2Cb1LDrg
	dJCDLvHvDUsr2cuepR1HepIjF1Y1/yp+ChasgThOCdTBuJQ5wNI11OspuRMRYIvROjTZDdEN4wh
	6G62M7O3PIw/hUlthME/rOteWpd2IkdZLYpMuqxugHqJWfPfTMKvRE/3z5oY04i0tuyU7fASFQR
	SemjuaTdGlBRlBPzlNa9eYkowBSnod6Fe9tJmqh52B/UOtsA==
X-Received: by 2002:a05:6102:c91:b0:611:e0c2:1604 with SMTP id ada2fe7eead31-6fefa60c024mr5156261137.19.1780862980425;
        Sun, 07 Jun 2026 13:09:40 -0700 (PDT)
X-Received: by 2002:a05:6102:c91:b0:611:e0c2:1604 with SMTP id ada2fe7eead31-6fefa60c024mr5156250137.19.1780862979976;
        Sun, 07 Jun 2026 13:09:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b990438sm3240683e87.67.2026.06.07.13.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 13:09:38 -0700 (PDT)
Date: Sun, 7 Jun 2026 23:09:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, abhinav.kumar@linux.dev,
        bod@kernel.org, mchehab@kernel.org, hverkuil@kernel.org,
        stefan.schmidt@linaro.org
Subject: Re: [PATCH v3 1/2] media: qcom: iris: fix runtime PM reference leaks
Message-ID: <m32djjrl6mviti4xnasvza2g2sqbvfb2gw4326vph364xpozah@wprdx45lfn2n>
References: <20260604090059.46355-1-dennylin0707@gmail.com>
 <20260604090059.46355-2-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604090059.46355-2-dennylin0707@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIwMiBTYWx0ZWRfX63ufi56BZ1sw
 rfdqhyGqmf8IXRux7ai5TmJr9zjoLNrV6SQ0qrK3wXf5430lyt0RkECXHoCIfMWRqGLsXlZG1Kb
 wYrrlfttSvPxdgtNiLACoX5iIZVa8TBjImIAQyVje0MgIzLCt+FVLufMD65ozfIAHqeLXBtYJ+5
 uK1ohN2PzzYMlJ07Im8y/ApId0JRnZo9XK+SiBsNBvsL4JMDRRCSL8JMEobzDwcnh56Jeov01oG
 1n/gRAq/CkR/yCUxcieQyErNa6xPKtES7STQf+tml2CW9WXYxVHYnV6cpNjP29QdrEXR5Ua467+
 8d1XAdOgs1LEXAiiQEVDkS3M9LkgCr9WlrTYCzDlteMIDzB2p9n8Wap1JYxoTAlwbxtikonl1oo
 ZvSWYR1hfakeEWKG2gRHeQrS1cxHgpzhdI1QrBvdWrl8ioAhFK5Oe936K6QxY748+SPs+F7E8J8
 Q8shZmjEDNEHdjdnfUw==
X-Authority-Analysis: v=2.4 cv=CeY4Irrl c=1 sm=1 tr=0 ts=6a25d005 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=lv37cNiT7hznduzCfj8A:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: t2EnxLIr7u5vIMowPr71nWP9AGGIYIM8
X-Proofpoint-GUID: t2EnxLIr7u5vIMowPr71nWP9AGGIYIM8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606070202
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64066-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[wprdx45lfn2n:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dennylin0707@gmail.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:hverkuil@kernel.org,m:stefan.schmidt@linaro.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A1415651740

On Thu, Jun 04, 2026 at 09:00:58AM +0000, Hungyu Lin wrote:
> Use pm_runtime_resume_and_get() in iris_enable_power_domains()
> to avoid leaking a runtime PM usage count on failure.
> 
> Also ensure pm_runtime_put_sync() is always called in
> iris_disable_power_domains(), even when iris_opp_set_rate()
> fails, so runtime PM references remain balanced.
> 
> Fixes: bb8a95aa038e ("media: iris: implement power management")
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  drivers/media/platform/qcom/iris/iris_resources.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 

Please take a look at Sashiko comments and fix those issues.

For the patch itself:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

