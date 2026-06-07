Return-Path: <linux-media+bounces-64072-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7DCyN8XXJWpzMgIAu9opvQ
	(envelope-from <linux-media+bounces-64072-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 22:42:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E24651874
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 22:42:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=V5pGPxYN;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HgfiWhQC;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64072-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64072-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1559F300A51E
	for <lists+linux-media@lfdr.de>; Sun,  7 Jun 2026 20:42:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A97832FA18;
	Sun,  7 Jun 2026 20:42:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAC92E0914
	for <linux-media@vger.kernel.org>; Sun,  7 Jun 2026 20:42:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780864955; cv=none; b=IKPPnHpnI7bxTask4KRoRpSFIuOD1ln38DrZyRdhrZDiMzPMGVtdTmt+brcRPCyD1xFbUO0y1WNnCxbr5XZsOuaKhZmYt1uTrkZkGDttREEctQIcSQ4MajDq7bGaMVez1lZGycfidIMJCDSNeyH2QvMPMKOOnJdeyLILutfroeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780864955; c=relaxed/simple;
	bh=UXFyqUM/HIuFHKUXX+Ijn/iU6h7FnnqmpSq4ZNyIJ2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S2bbLL4/W/pRbqz3lGuz/FVXelynwlnCpMB5sy126PEQb+sv6a/BcOh/NA9dwoKfcnBmYuYY/p9/Q4HJ+t6TOi9LkJyUjzkXtMhNTdpXJUOw3QtB4wTZoLxxl5dghukaHHYvAnlW18sQyRidD1ROFif2UvbN4wuohjN5aCY2zK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V5pGPxYN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HgfiWhQC; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657ElALb866315
	for <linux-media@vger.kernel.org>; Sun, 7 Jun 2026 20:42:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0SPUPSXdRsiuK84u3wTYAzYu
	H6s7LtlN0RDb0LKD1fg=; b=V5pGPxYNQMef9BEB/+cm4FSpED9CkuA4tJlkywXd
	RE/m9RK1PR4fdS7h75U5p/bBCO2w5ByozF7ezTw49DLdKksYeJOkh8Ii6u36Mx6g
	udKbNUF5ljFc43BtotsLyJsgfhdcl7cVVyTA0TQXBxHp1rc23byyN/r1te6kE2m6
	iSOdmHasmGgs8JSaJNAGgLwJttn4CNhTlcoO/TJmmOdOaPKZ/pTDs6it8D8OZJ56
	ep/5COcFoWj/wOAj0UlC0CVKgGPGBiGXsm/xOYVLXov7BnoH2DxtiKv7tyPG9P/D
	xt91GGFcpqFITjw3g8MhPi1wvF2YpwPgw/4878CNkOtRuw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emb4w4tk3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 20:42:33 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5a10b940840so516561e0c.2
        for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 13:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780864953; x=1781469753; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0SPUPSXdRsiuK84u3wTYAzYuH6s7LtlN0RDb0LKD1fg=;
        b=HgfiWhQC7w0unoxSNaYzCuRRP5xFR7R6LgVo8LpIf0UfVBNYHEMPxx0RSEovG2qvqA
         qaqnJdDq/y6vVhXupBcUYOe29N2rZ9A57n/BGmzQ1L1JRc7Lz6gxUNDQeudKwPznT6s1
         ywgao9q0CmQrFrHsRUWtB4dOPZYfA39g823Q3rFKtaU2xs6HcbjzLEo6Gk2GaFGdTr4r
         cQSZ32EmmEAxAlOTAqSTAB1QtwlyxgJIwb2Jc2eVOK0P697xWH2g8UKSliWHS0EZ82GE
         d+eHaqvE7Sh7WsuOAHLSCoYhZqdIGEFjfPt4uDmPGcoT5zFNVtwBTqpSaaD1zxJnhzBO
         6FJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780864953; x=1781469753;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0SPUPSXdRsiuK84u3wTYAzYuH6s7LtlN0RDb0LKD1fg=;
        b=mDgcpHomsVktxzvHABsn94CFQqCbz4fvU6Y/5qPX2ul2nn1oXfab2X7UOIObkQU3Fj
         49/oP54TmiuA0GYc4fUby5jOczRk6al1EamLzRLu6cAN3OmviOSCjX9jktMfCuht0ESA
         4yDJKacMWwnsRGBhffADMoYFQhWA0UflGCyl70/NpiKvhuPMpwcCN9khgmX+nKiG2qoy
         JDsQOFT2r5VC8cqLbQz6wKiY/53OoOteDJ2+HwQibosHPtl8oqNNpatiTCJZk3IVWQuj
         2NcfGBjR0c949TJEIE2dj1bY7KbLHieNzUJAhSUyvI3MPxkZ7NHNN8raLOK5DK1tSqmh
         yDTw==
X-Forwarded-Encrypted: i=1; AFNElJ+l76yclVPsCme6dC5HO3EJH/HaiDfRVM//eWO2k+oeo09/taJRjjb/glpv2Q61DifdblYoHbS4TzCIDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YySfYexpzfhq0rGd3GMGK/nICw6gJ25pUZjRxsPIMaNr18kpYcn
	r8ddNoWb4z5Jiz8Pv6UxRnvnQVNIjpXhXXrrIGyBxewKGvvV8cUem0pZ39eM7gBZfMvVKE42Emy
	iAMNvoJLwWKAkkFgwPi4973lORD1T9vaQZr5O27fl0vgpkf5VWEZGGBRwuCiNflH88w==
X-Gm-Gg: Acq92OGQpUkXVwj7Ld8qLEhMQsqHrmJrIke3w4vcoiywLdJP92nmQcIayuo3l0CCEwl
	hA/FaVXSGvsE6biUtO2P0Rq4nr6RFqNHO6/30XJG6zG5Pqwf35lYZcBAoSIIgbNUYBg88jCxIyb
	lxbnVLfZTPrBeO+VbV/xXCTmeVGN9efcIp1NI3SI9TbVoEZ6PhnmyJfucTP2ryYhtb5fwiAU+cp
	T6rGC9Xr8Eaoj1UQVQSYtgsuzWpP4MN9s/QVnjnJmWsUhEhtapA6ZuywOQSDVUrrDPOFBh+o22u
	kAVbuS5x/IOa66ZmLHP5O7Tjn9sElGTlPN1QlDJG2TDNq0hrarTdgbQj7gPvUwDKlWSWq8bf3cI
	eLIudMb9FW9LBSPnIW/4gRX7/P1+6I9dxOIhm1VfOZzzejhHaP+v9j+hO1k7LacQXfHCSEmNHWE
	jLOWyLePuTg7m+oj8lslBs2b6yEM+37UKkyY2RQJionLZbwg==
X-Received: by 2002:a05:6102:5cca:b0:6c6:432c:84d3 with SMTP id ada2fe7eead31-6fef05ec0famr6654669137.12.1780864952887;
        Sun, 07 Jun 2026 13:42:32 -0700 (PDT)
X-Received: by 2002:a05:6102:5cca:b0:6c6:432c:84d3 with SMTP id ada2fe7eead31-6fef05ec0famr6654662137.12.1780864952492;
        Sun, 07 Jun 2026 13:42:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b907a26sm3309998e87.35.2026.06.07.13.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 13:42:29 -0700 (PDT)
Date: Sun, 7 Jun 2026 23:42:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Denny Lin <dennylin0707@gmail.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] media: qcom: iris: guard IRQ handler with runtime PM
 check
Message-ID: <5pqxfjpi2eb2ygdqqg3acoi2paifhoz4k7m53oz7n4fasia5tg@2u6df2g4kjq3>
References: <20260604082510.45733-1-dennylin0707@gmail.com>
 <agginfn3jo7df7bozpqvggg3rt5fudmh2jwewj37jhkbw3ynhv@demyhaltbpwg>
 <CAGEkeHfAxJUyiaJs7wLb9hX0hsxO-xbPnkQ5LQx800wJZdzoWw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGEkeHfAxJUyiaJs7wLb9hX0hsxO-xbPnkQ5LQx800wJZdzoWw@mail.gmail.com>
X-Proofpoint-ORIG-GUID: Pr1E0CBNNahf-IE3RBh7u6lo5Iuhg5__
X-Proofpoint-GUID: Pr1E0CBNNahf-IE3RBh7u6lo5Iuhg5__
X-Authority-Analysis: v=2.4 cv=YIWvDxGx c=1 sm=1 tr=0 ts=6a25d7b9 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=8pRkBXFVWHoGmqPwLk0A:9
 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIwNyBTYWx0ZWRfXzZwmckERrAZn
 jing74YtG5QkM4/CmKqca8FXU3aAAS3jB4R+h5ZvoD0JKWXkaooAlSKoLMzQaRrb3eKTJ93/mPC
 f5ORl4F6/KDYNRtFoAfb5UbZjo1ttaZqP2bA134g7/53rN0k5+ji6sW+/lodt8kTVocFSRnOmri
 ikBcqQLYhfV4tSKbwLfS67LaNm9X4BIVU51l03Vrxo3uChAviHoRd5Ja8I1Nq1qjpV9PTHsO0uk
 PZsPUqxQU/X2sHC3zRV/I0U3g3YkbQC1R1qhCP2FCok7PBqS8GZPurT4UesdNd1fKtywHOD+JgT
 lx+7QQm9OqPSHMkmTQUXVwjFsFFArLQcbzLYukzYGjGJVf5PLVq7ItDOJ/0os4Jm1cSAuH6fkzz
 pD+k6jwoIOW3AhhgtqyPcSKoaUnTzQGIQpmv4AHtUnvU1BFwAEOQb8WFnVjXQmP+d8KFiQH9f/K
 Dzm3jmibIAs38Sqe8ew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070207
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
	TAGGED_FROM(0.00)[bounces-64072-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dennylin0707@gmail.com,m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 92E24651874

On Thu, Jun 04, 2026 at 07:55:21AM -0700, Denny Lin wrote:
> > Please clarfiy why you are performing the changes instead of describing
> > the changes on their own. There should be no IRQs coming from the device
> > if it is not active.
> 
> My concern was a possible ordering where:
> 
> T1:
> iris_hfi_isr()
> -> return IRQ_WAKE_THREAD
> 
> T2:
> iris_pm_suspend()
> -> iris_hfi_pm_suspend()
> -> iris_vpu_power_off()
> -> power down the VPU
> 
> T3:
> iris_hfi_isr_handler()
> -> iris_vpu_clear_interrupt(core)
> 
> Am I missing something that prevents this ordering from occurring?

THis needs to be a part of the commit message.

> 
> Thanks,
> Hungyu

-- 
With best wishes
Dmitry

