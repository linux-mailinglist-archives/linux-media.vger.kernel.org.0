Return-Path: <linux-media+bounces-54555-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +HJeGCTHqGlaxAAAu9opvQ
	(envelope-from <linux-media+bounces-54555-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 00:58:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C44209485
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 00:58:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3EBD6307F992
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2026 23:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEB6E385536;
	Wed,  4 Mar 2026 23:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M3gyhoDK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gR1vjbCK"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16153389E06
	for <linux-media@vger.kernel.org>; Wed,  4 Mar 2026 23:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772668622; cv=none; b=CWFHwDRU0ZJaPBeuf7mp4V3wh058P2K8RFkzi4B4eA/GHRYWFVbEUw6hLXn3pbniCPrnZZjndKKXw24kIq4yUuE3TPxnKCeGb4VPHUGRXF7Z604PRlxYOspcmFYImchG0JK4YlSZ3PQbvUu0wcWuBnbXrWn33oUuW5YjJIPf1QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772668622; c=relaxed/simple;
	bh=Q0RmGTaWyrNXkoqSRC4NOGoeVMXVms2krIlt4cMtsHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jLR6ObABLiDLlR/dNz7aKkiQ4cMZDnqonp1UrJIdmnYd8LVo3+QQNV8xS/V0/AlsMoSQUH9sL4qTS/S3P6UB5F1AwO/HFh0LghcVXIX03JsLhVhRJG9k9/mOHmzZOkhpG+7NBP16+gYHuSTbZMhot0SXyF5NlyP6olG7O3aH47U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M3gyhoDK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gR1vjbCK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624HHnYb2494855
	for <linux-media@vger.kernel.org>; Wed, 4 Mar 2026 23:56:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=La/zyW1kZlkdjuba28Y6cKUE
	jgLjT1PdHqsncSoONxI=; b=M3gyhoDKsD95tRqPBt6AVRtUJ8xAewA9091Llh/v
	3N7WGAoRQBPzVIJQ+qMMIDlNc/bfennDxIAH2TEssBH789bj2CFI/9WHiWumbLtX
	Ql5cWWDkmHK/HrduZFYdFIBCxQbuZCUwt9VpsjOneOKdaQDvPYtLjUV+u71lyXmG
	dmxjU+qXynuSopTYtoQMCaamDnBl8AhwF8OiwiX39d0m+NMjaFXCFWCfbfdsFV2h
	o+l1R38GMJrzXlm7o2GPUvHPn1156OUgdepeJ2YZzwgJPRbOnHzpNxoiQgsN2xDS
	DJcDnZ8howbsvkbWgknRmV8ZQ+d0VG8z+7CPjjKVm1P8FQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0wh1na-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 04 Mar 2026 23:56:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70cff1da5so4207908385a.2
        for <linux-media@vger.kernel.org>; Wed, 04 Mar 2026 15:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772668618; x=1773273418; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=La/zyW1kZlkdjuba28Y6cKUEjgLjT1PdHqsncSoONxI=;
        b=gR1vjbCKyyJ3o6dh/LzYtaTxAoe5c/LIKUCblHAON8BYJvNITHkv8oFo/DbiCRUIAO
         Q33H5pvJQ+hJNSyk+JOjoxonBKp56j/eStzc/dlR4xsCa0GWNOgznsm3tOdIopw1Hf98
         jjrnjeVnwm8drXGmiiD5Mkq05MjXvfm1Qnz7GbN9NVyLa9c7OHa9JLKTppRFHXd6eUBD
         BQrdctaQEDOu6udxmmKZcxQx46ouzDeA+QLx6D24K7tad9YN1b0WbcJFEOu2+Koi+bS7
         WTgpDbqdDklDlpFeHqq6sgAIrQ1uahog1mPwNTb6PJFKLBjNLMzIMCOHCGtSSJGCpPEe
         OGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772668618; x=1773273418;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=La/zyW1kZlkdjuba28Y6cKUEjgLjT1PdHqsncSoONxI=;
        b=n/owpjiGXpU5bwPgKf8DMr0UVZKh9kHffz++DRfIl1kVefHixNhAlh/Q+BS3fpbIpO
         5eJp/a30dhEmQJdpBnNrMCpEoWqAveowtVmbTx+6Npvoqzek8wcoR8wosLlsSFjgEbIg
         ceYKMpfGn+K+KQENqfOKsPgVowr1hhI9jVKHs8QP0gtVuDhy/4eTPDgMC4bdhcfygesR
         3OV8KNoyaRtAwat94Ujv1Qp9ZSEfgtEwuvWcOQ+HLokcrRZqNUjoxBMfaLCR1ttHgm1f
         eOoH100rITaCXBOJTT2/M6Ub/VfwXZWO2xYAlFxLFVL16Ftkb1Y5REodLijJfEsXmP0H
         aqUg==
X-Forwarded-Encrypted: i=1; AJvYcCXBd+BNcv4dO4bSUuYPbv9DX66kzyQEXvyIfkWNKFZkZzm/+GA77jJy8EMavG/lkOC47HZanxg0zuughw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxG9l1Ih6QebFY/khdvCvd4nLeYcFnQXKwxRckuCioVe12y/4sq
	tJr7WiZeAGq7+ypepkaeG5utauBRfQ20TFo16+ATOGEUiefpwtGqHSOQ7fIPSz5QCevkfjaRn+D
	yUsb9IsMjFscucweQKAdq1Tg4xQILBp3j/TJy4FNhdtkbVM3eU4Qfbl4Vg1p2djy1VA==
X-Gm-Gg: ATEYQzz0Vr+hr4SDLbKnoB2n3zQ9TL4+ZVznlvNtlHNCXqOHYZj8WT98hrA2xxTH37O
	qb5Iwq+U8ZqSfbc/9NYl/Bo4VG48OZyxKwJQ/Yg88fruK7WLdH26dxM+b2N5QPAg0ouoEPUgZ0c
	t0qnxYT0i6PkrW1J2KgrlL1yQZzW2TjOne3/+D+frDLCDFTqXZ/8jP0bWH1+zoF4bZpRLllJMTQ
	NPv/mQkUDaUuCDmo6la++RQSk8WYdcJb3qzr5XNCgJPPa5JmhknQYRlQvtcxJ4jb40lBT04i8hZ
	rcPMHhS4F3TACQz89M6wvnp2hEzitnQIHvHAtU98EW8S3Fsg1wacsW8l2k6xOcp5V3DuxwcA7Wn
	4MCr6xbpgaCa/rDDaTeCIQ1udDCyz0KG11Zo4d3QS9sJs0P1yXkwpBfvK42+b4tPeBG4FSjNtCd
	Sclfj9/YFR2KTO9hX9m56jDqJ13AWwSp4GTLc=
X-Received: by 2002:a05:620a:44c2:b0:8c6:770c:40d8 with SMTP id af79cd13be357-8cd5af775e5mr481319385a.40.1772668618479;
        Wed, 04 Mar 2026 15:56:58 -0800 (PST)
X-Received: by 2002:a05:620a:44c2:b0:8c6:770c:40d8 with SMTP id af79cd13be357-8cd5af775e5mr481314985a.40.1772668617932;
        Wed, 04 Mar 2026 15:56:57 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a123573df2sm1571493e87.65.2026.03.04.15.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 15:56:56 -0800 (PST)
Date: Thu, 5 Mar 2026 01:56:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, netdev@vger.kernel.org,
        spacemit@lists.linux.dev, UNGLinuxDriver@microchip.com
Subject: Re: [PATCH phy-next 21/22] phy: remove temporary provider
 compatibility from consumer header
Message-ID: <o3yvtltydr5hvve2htwgqbp4bfopgu74ft4gnyelmges3hmiaa@wy3brdd5dnek>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-22-vladimir.oltean@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304175735.2660419-22-vladimir.oltean@nxp.com>
X-Proofpoint-GUID: fSItALP-aksyGSwUgyrMMnvbqFiFmNjb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE5OCBTYWx0ZWRfX8b8HczV/ZNlM
 U/JGMjuZW+wOpkci22SFysYAYfq/eH5qAaVTNnN6sGenZEjwRAZ0n5S35yVf63/UynCCfpBBKDH
 rz1kmk1L1bcR88kmYGJ7cq8dvWFkrAwXnF0EbbwzfrndklBJcbt93LEBXaUTmYk5uyIgsqwjmeM
 2XAf92buipjYxJzheenGpi80avfiKQm0oVZWKeGShoZYqgjk7XH2tNrZr5esr1hBU7s9RARY0QH
 t0Gh+2chNqaB1DguSob8knBp+ceVGS4WaBKxATIfGd/+cewzZ9yQhS0xj/YIC30w0AyLkgiLZhn
 DIhLWTyJ0shBfn78pzH1mVnyZvucgEL8fX3sJMSUyFG86jJBUk633d7/PD919Ct2GqDJRLCsHe0
 VXBRb579E4ZWyRgEiGa5+7zRmeHWhJCVQGTzB/h2+NDOyYQ7qS0tkj7hXZmKEaxpIlyjxvNLgTH
 OOV1tENeRDw6g3Gn9Qw==
X-Authority-Analysis: v=2.4 cv=OYWVzxTY c=1 sm=1 tr=0 ts=69a8c6cb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=8AirrxEcAAAA:8
 a=EUspDBNiAAAA:8 a=Ji6k5uvf-STsHdHMmocA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: fSItALP-aksyGSwUgyrMMnvbqFiFmNjb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_09,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040198
X-Rspamd-Queue-Id: D0C44209485
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54555-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,nxp.com:email,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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

On Wed, Mar 04, 2026 at 07:57:34PM +0200, Vladimir Oltean wrote:
> Now that all consumers have been updated to no longer dereference fields
> inside struct phy, we can hide its definition altogether from public view.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
>  include/linux/phy/phy.h | 2 --
>  1 file changed, 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

