Return-Path: <linux-media+bounces-63601-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5QNcErsxIGq5yQAAu9opvQ
	(envelope-from <linux-media+bounces-63601-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 15:52:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC5263845E
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 15:52:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EyyhwZTb;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=X02eUVuV;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63601-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63601-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 22764309B664
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 13:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F3C93264DA;
	Wed,  3 Jun 2026 13:44:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708952FD1DA
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 13:44:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780494242; cv=none; b=cNrAGOxM+bIwyJKExsENm5rKrh9oZbdUd1JjU+bUQ2/5MLVHoxLcuq3CTC/ZeULIDI9HEwrwc2oBTk9b04ggMceveAt9yyMOmuZiybytlzIAoRcfuluUx3wA3EhAwxhWPazK62mlmp9bn59LslwmLij/TVPdHsEUUfsKeJzktZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780494242; c=relaxed/simple;
	bh=a8BDW+CrunOYbTFlwKZkd/OyryCGgg8B9X++SYgSnD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jxt8fJz7XMpAFtliEVyoCVyuPsC2WR4NQKrzlaC21xumuDD8chLgIjqekTB0wjxn6B+3zjp9yd6+omB3jpHdyYi2qaG5Qmub1Wu833OVprdsw0Ga91v3zbciPvNpSBIVqP+tBYPUbUwDlEOG443Hm4QfO80J3H0qP2uG4RFJaNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EyyhwZTb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X02eUVuV; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653CeEQ91946464
	for <linux-media@vger.kernel.org>; Wed, 3 Jun 2026 13:44:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kRbnU8V6Zsc+nav/FJky6GGhRnGxbQyRHCJCHQ8YEm0=; b=EyyhwZTbQfhFDZMd
	7/4fMwTCUpSRhTNsWsHAyx8UwJfcKZIMQ4/sbAEpnkbOlhoUJvKrU3m/nGKyn5mG
	rSnp6b+aFYgaLyXIQZsfy0p73XLEmKHqgQJVSe4CNf1IL2ZH2BZfT0VZdw8yAQ2u
	2qe4dGi/2pzYRIsbCkw8p8gWxLJAdlIz7PRyqJEzN0XIkosS0/k7uTzC1HrNn3ki
	vBV3JDExkb/BOU8kc6q1ZmOJ5OVpYxY1AwVdbUrQku1ZO2MkOmndJD73lqU/QRtM
	fxQuxERcwTum1w1uAJbJ2maUN57342AI6ICT5qZzpKAuV0frf2oeH8Hu15aw2X93
	IiT8vQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejabgjqa6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 13:44:00 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-963907b1ddeso5678559241.2
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 06:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780494240; x=1781099040; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kRbnU8V6Zsc+nav/FJky6GGhRnGxbQyRHCJCHQ8YEm0=;
        b=X02eUVuVVLXm722Ig0GIoGnki/uD3Q6ICNn1zewY7DQcjFohX7WmhAxDX5eamsnmpq
         BrT2YpivEsa6+T455ip0QgNi5mq38xF+nuPW30iogoc5Y9ZmdAQxE2b+r1rapT3p4dTx
         I5kUcXtq/6O/xuKcDGNKTChGLKjSyD4nO0so+4BmcPlQ/ZWpw1qcHvN2IdrMZBWGUlZ+
         CQScyPzv3oYlPhG/3nJzMGQMu2CIBIVWZAzfwh60fZ+rDS4sNXzS/BCRNOxLbPrmqZeD
         SLsFkxdHxzoXrPEHqrTMI1OSBMOkqay0w1cfV3BRkPu8ZO7k1oxjchth2DiHwsc0URxV
         j3xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780494240; x=1781099040;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kRbnU8V6Zsc+nav/FJky6GGhRnGxbQyRHCJCHQ8YEm0=;
        b=jdKseN34CLcUt8OgwEt3AVdZlQv5dgBx19XOcPIrKU1GDWV/ytL+0nraQ0QPkCBZZc
         gB79xUqnFvNbmtu4ruXl/v04syA6X+Qnk6BrlnOMcq5KHumil9/4KyaXPzaw4bpWhHwf
         uy6xb4dAawNTlx9NnhyV5KKOHCbtsWxAh0lWRuO7qRHDh+Mno6Ua+dyWuwZuQcw2+Mqi
         E02qgpyxUVWVhX5D20qDPU2eEzk6aFQRwFBLpUftSUcrZAJ8xFHZFR0WImVXc0Ml4+8J
         73fAOgmAcMKYS1wdtEdVLv/jTNbHOyMlJlHNtH+hnA8RmlFz54C7XpENG6Emnqhvf+3x
         H0Ig==
X-Forwarded-Encrypted: i=1; AFNElJ9MVuezgfnwuLwYEd8t+UyPX+pD9opfq9Gy/cslXMP1zER6U5UVyJlRvCO+JZPbZ122z9YyHqnzqR9Qbw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+mgISwrB1nSjKTCCtHm0JBvuaE3O8iM141fYlro6L9W2A0d+O
	37UXrjzMzwDl83kdtc1pnC60h91BRS7gZSBFJ3x3/zNkjmQdNakXWhNkVQ0UG+AnCvJY07WL/if
	1SK73lXwjM58qR0eW3oTg41vv2CSNG8EN4x+Rq4T9++je609GipzJlOqDvBCGkXIl1w==
X-Gm-Gg: Acq92OECAtOvuEzpgx3L/Ma5kdTwYWJK1Jn0d7OtEN6LPiIRLd7NjavyC+j42FyQcHS
	OuUbyqg8lzzRYHmSitV8Lsug9UB5NWQanDRAHUOJw7cmoif7WxE6kSjecXhab8EcRBeFlHXU1JY
	dIe1UcgoOAUCJkZ2kTkQZwGq8rFputaMCKOAmU5bcGn/4zoaBISuAnjmNn1tAzY+UyNEPEU2+aq
	aS8CN1DkbDtFd3SfOuCiNPyByj2H6ndO7jzQyWEaxm/GjovRZyxOxS6mcRg5tYEGVl7HRuQXl9H
	XSoqIaXpURhfcVpYDbunMfBjC6rccv9BGEmTvgCxE1ozWeKIGqsbVKd+iAO+tFjvdT1vBVsNop7
	eQ8q3/C5KtvzD3mdR5R77grYg8Qb/WegeIP9LskLQNCpFXdyMyWPks9TrGGu9CngeNkzS/yNsZt
	tIrsjkmQxSb2fgRrFMUs7h0GA1bYBf0kEphY6J1BK92z4k0Q==
X-Received: by 2002:a05:6102:dd0:b0:631:2973:5c2c with SMTP id ada2fe7eead31-6ec469592aamr1534036137.21.1780494239402;
        Wed, 03 Jun 2026 06:43:59 -0700 (PDT)
X-Received: by 2002:a05:6102:dd0:b0:631:2973:5c2c with SMTP id ada2fe7eead31-6ec469592aamr1533992137.21.1780494238918;
        Wed, 03 Jun 2026 06:43:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2ed56fsm9210311fa.37.2026.06.03.06.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:43:58 -0700 (PDT)
Date: Wed, 3 Jun 2026 16:43:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>, srini@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        robin.clark@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 08/15] accel/qda: Add QUERY IOCTL and QDA UAPI header
Message-ID: <2ztwmdejpkp3f3naz3g2fkjkpd6iomlb34bqnpnp6bhzn27vbb@wnd3fjcz6tgx>
References: <20260519-qda-series-v1-0-b2d984c297f8@oss.qualcomm.com>
 <20260519-qda-series-v1-8-b2d984c297f8@oss.qualcomm.com>
 <m4zo2nkxtl5yeyo7riuata6r5saflmdgqf37cz2g2ezrwhk53m@mnad6bb7n3ik>
 <b5c9d149-1a48-4c0d-aa0d-9ad331896f47@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b5c9d149-1a48-4c0d-aa0d-9ad331896f47@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=R6sz39RX c=1 sm=1 tr=0 ts=6a202fa0 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=LflQWrLztFwobrB7iZEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: egG2Cf_2bP_UPLTODQH7JhdhiA2lWZUN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEzMSBTYWx0ZWRfXw0kMqV8cFK3N
 0O9tosLOBFogV2N8L0NjlF8B/XXh3WxfPLVvhHD6ZM7SDvDBKaFCKVT1D/X8jAnbdpYFI0k5y8O
 XBv+uQ2EMAg4tN5W1L5ifSF+sqg1J+kodWq2mMC9+yI9OiN5KeNdSSe9KJRinleCtJFiM2E+HAA
 gi79AETb3NAG1GQtlQJ5wkXPz3gGAZWdtgxE67bpAIPrlaSG6x+QBkUt49t7/Eua6TGnL+hczOs
 IYSHukP6EIl52uePKjDUrTNiPE8qrrmlKKofFGN1cFfSP1Rr/D8rivjyq6jHhwwdSMGHijabmco
 c9m+7NQBFCGAMkqyUWp1MA567AaXZHRo3D70ioVSuQUGiHScStYAfxrHbuLoXyYQfL5sP9yTilF
 Vf+mRrPp08iK+WHeSmyGDGPk+7rINsuZeB1DeQPIsR9XaPnuz6My3b7ggtrmv7FsaQd6JB2eNvy
 uAnabvtxN/H/wuTeoHw==
X-Proofpoint-ORIG-GUID: egG2Cf_2bP_UPLTODQH7JhdhiA2lWZUN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030131
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-63601-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ekansh.gupta@oss.qualcomm.com,m:ogabbay@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,m:srini@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-doc@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,quicinc.com,oss.qualcomm.com,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.linaro.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,wnd3fjcz6tgx:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2AC5263845E

On Wed, Jun 03, 2026 at 11:21:43AM +0530, Ekansh Gupta wrote:
> On 20-05-2026 19:59, Dmitry Baryshkov wrote:
> > On Tue, May 19, 2026 at 11:45:58AM +0530, Ekansh Gupta via B4 Relay wrote:
> >> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> >>
> >> Introduce the DRM_IOCTL_QDA_QUERY IOCTL, which allows user-space to
> >> identify which DSP domain a given /dev/accel/accel* node represents
> >> (e.g. "cdsp", "adsp").
> >>
> >> include/uapi/drm/qda_accel.h
> >>   Defines the QDA IOCTL command numbers and the associated data
> >>   structures. The header follows the standard DRM UAPI conventions:
> >>   __u8/__u32 types, a C++ extern "C" guard, and GPL-2.0-only WITH
> >>   Linux-syscall-note licensing.
> >>
> >> drivers/accel/qda/qda_ioctl.c / qda_ioctl.h
> >>   Implements qda_ioctl_query(), which copies the DSP domain name
> >>   stored in qda_dev.dsp_name into the user-supplied drm_qda_query
> >>   buffer using strscpy().
> >>
> >> drivers/accel/qda/qda_drv.c
> >>   Registers the qda_ioctls[] table with the drm_driver so that the
> >>   DRM core dispatches DRM_IOCTL_QDA_QUERY to qda_ioctl_query().
> >>
> >> Assisted-by: Claude:claude-4-6-sonnet
> >> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> >> ---
> >>  drivers/accel/qda/Makefile    |  1 +
> >>  drivers/accel/qda/qda_drv.c   |  8 +++++++
> >>  drivers/accel/qda/qda_ioctl.c | 26 +++++++++++++++++++++++
> >>  drivers/accel/qda/qda_ioctl.h | 13 ++++++++++++
> >>  include/uapi/drm/qda_accel.h  | 49 +++++++++++++++++++++++++++++++++++++++++++
> >>  5 files changed, 97 insertions(+)
> >>
> >> diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
> >> index 701fad5ffb50..b658dad35fee 100644
> >> --- a/drivers/accel/qda/Makefile
> >> +++ b/drivers/accel/qda/Makefile
> >> @@ -8,6 +8,7 @@ obj-$(CONFIG_DRM_ACCEL_QDA)	:= qda.o
> >>  qda-y := \
> >>  	qda_cb.o \
> >>  	qda_drv.o \
> >> +	qda_ioctl.o \
> >>  	qda_memory_manager.o \
> >>  	qda_rpmsg.o
> >>  
> >> diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
> >> index 0ad5d9873d7e..becd831d10be 100644
> >> --- a/drivers/accel/qda/qda_drv.c
> >> +++ b/drivers/accel/qda/qda_drv.c
> >> @@ -8,8 +8,10 @@
> >>  #include <drm/drm_gem.h>
> >>  #include <drm/drm_ioctl.h>
> >>  #include <drm/drm_print.h>
> >> +#include <drm/qda_accel.h>
> >>  
> >>  #include "qda_drv.h"
> >> +#include "qda_ioctl.h"
> >>  #include "qda_rpmsg.h"
> >>  
> >>  static int qda_open(struct drm_device *dev, struct drm_file *file)
> >> @@ -36,11 +38,17 @@ static void qda_postclose(struct drm_device *dev, struct drm_file *file)
> >>  
> >>  DEFINE_DRM_ACCEL_FOPS(qda_accel_fops);
> >>  
> >> +static const struct drm_ioctl_desc qda_ioctls[] = {
> >> +	DRM_IOCTL_DEF_DRV(QDA_QUERY, qda_ioctl_query, 0),
> >> +};
> >> +
> >>  static const struct drm_driver qda_drm_driver = {
> >>  	.driver_features = DRIVER_COMPUTE_ACCEL,
> >>  	.fops = &qda_accel_fops,
> >>  	.open = qda_open,
> >>  	.postclose = qda_postclose,
> >> +	.ioctls = qda_ioctls,
> >> +	.num_ioctls = ARRAY_SIZE(qda_ioctls),
> >>  	.name = QDA_DRIVER_NAME,
> >>  	.desc = "Qualcomm DSP Accelerator Driver",
> >>  };
> >> diff --git a/drivers/accel/qda/qda_ioctl.c b/drivers/accel/qda/qda_ioctl.c
> >> new file mode 100644
> >> index 000000000000..761d3567c33f
> >> --- /dev/null
> >> +++ b/drivers/accel/qda/qda_ioctl.c
> >> @@ -0,0 +1,26 @@
> >> +// SPDX-License-Identifier: GPL-2.0-only
> >> +// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> >> +#include <drm/drm_ioctl.h>
> >> +#include <drm/qda_accel.h>
> >> +#include "qda_drv.h"
> >> +#include "qda_ioctl.h"
> >> +
> >> +/**
> >> + * qda_ioctl_query() - Query DSP device information
> >> + * @dev: DRM device structure
> >> + * @data: User-space data (struct drm_qda_query)
> >> + * @file_priv: DRM file private data
> >> + *
> >> + * Return: 0 on success, negative error code on failure
> >> + */
> >> +int qda_ioctl_query(struct drm_device *dev, void *data, struct drm_file *file_priv)
> >> +{
> >> +	struct drm_qda_query *args = data;
> >> +	struct qda_dev *qdev;
> >> +
> >> +	qdev = qda_dev_from_drm(dev);
> >> +
> >> +	strscpy(args->dsp_name, qdev->dsp_name, sizeof(args->dsp_name));
> >> +
> >> +	return 0;
> >> +}
> >> diff --git a/drivers/accel/qda/qda_ioctl.h b/drivers/accel/qda/qda_ioctl.h
> >> new file mode 100644
> >> index 000000000000..b8fd536a111f
> >> --- /dev/null
> >> +++ b/drivers/accel/qda/qda_ioctl.h
> >> @@ -0,0 +1,13 @@
> >> +/* SPDX-License-Identifier: GPL-2.0-only */
> >> +/*
> >> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> >> + */
> >> +
> >> +#ifndef __QDA_IOCTL_H__
> >> +#define __QDA_IOCTL_H__
> >> +
> >> +#include "qda_drv.h"
> >> +
> >> +int qda_ioctl_query(struct drm_device *dev, void *data, struct drm_file *file_priv);
> >> +
> >> +#endif /* __QDA_IOCTL_H__ */
> >> diff --git a/include/uapi/drm/qda_accel.h b/include/uapi/drm/qda_accel.h
> >> new file mode 100644
> >> index 000000000000..1971a4263065
> >> --- /dev/null
> >> +++ b/include/uapi/drm/qda_accel.h
> >> @@ -0,0 +1,49 @@
> >> +/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
> >> +/*
> >> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> >> + */
> >> +
> >> +#ifndef __QDA_ACCEL_H__
> >> +#define __QDA_ACCEL_H__
> >> +
> >> +#include "drm.h"
> >> +
> >> +#if defined(__cplusplus)
> >> +extern "C" {
> >> +#endif
> >> +
> >> +/*
> >> + * QDA IOCTL command numbers
> >> + *
> >> + * These define the command numbers for QDA-specific IOCTLs.
> >> + * They are used with DRM_COMMAND_BASE to create the full IOCTL numbers.
> >> + */
> >> +#define DRM_QDA_QUERY		0x00
> >> +
> >> +/*
> >> + * QDA IOCTL definitions
> >> + *
> >> + * These macros define the actual IOCTL numbers used by userspace applications.
> >> + * They combine the command numbers with DRM_COMMAND_BASE and specify the
> >> + * data structure and direction (read/write) for each IOCTL.
> >> + */
> >> +#define DRM_IOCTL_QDA_QUERY		DRM_IOR(DRM_COMMAND_BASE + DRM_QDA_QUERY, \
> >> +					 struct drm_qda_query)
> >> +
> >> +/**
> >> + * struct drm_qda_query - Device information query structure
> >> + * @dsp_name: Name of DSP (e.g., "adsp", "cdsp", "cdsp1", "gdsp0", "gdsp1")
> >> + *
> >> + * This structure is used with DRM_IOCTL_QDA_QUERY to query device type,
> >> + * allowing userspace to identify which DSP a device node represents. The
> >> + * kernel provides the DSP name directly as a null-terminated string.
> >> + */
> >> +struct drm_qda_query {
> >> +	__u8 dsp_name[16];
> > 
> > Are you sure that you want to query only the name? No extra options, no
> > attributes, no hardware capabilities?
> There are plans to extend this ioctl to support DSP capabilities and few
> other query options, but as per my understanding, I don't need to add
> reserved IOCTLs in drm case and I can extend it in future. Please
> correct me if my understanding is wrong and I should add reserved fields.
> 
> Copying the statement from the doc[1].
> "Note that drm_ioctl() automatically zero-extends structures, hence make
> sure you can add more stuff at the end, i.e. don’t put a variable sized
> array there."

I'd rather have a query type as an input here, to be able to return one
of querried params.

> 
> [1]
> https://www.kernel.org/doc/html/v7.0/gpu/drm-uapi.html#ioctl-support-on-device-nodes>
> 
> >> +};
> >> +
> >> +#if defined(__cplusplus)
> >> +}
> >> +#endif
> >> +
> >> +#endif /* __QDA_ACCEL_H__ */
> >>
> >> -- 
> >> 2.34.1
> >>
> >>
> > 
> 

-- 
With best wishes
Dmitry

