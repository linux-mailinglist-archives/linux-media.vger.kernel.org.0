Return-Path: <linux-media+bounces-53250-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LZ0DtTZnGkFLwQAu9opvQ
	(envelope-from <linux-media+bounces-53250-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 23:51:00 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B9E17E97A
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 23:50:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5CA113098019
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 22:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D871737C0E3;
	Mon, 23 Feb 2026 22:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T/oPrwQF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D/se3+T+"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AF836A024
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 22:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771887044; cv=none; b=bhdIdnuYhyLiEVaH4HbjAGkPhkIDerTnSLUNvIoQyr9rP5K+y4+5COc5r8GLhHRXypMgZwrzmrjK+cf6zizYgj02Pq7Go8RIXc4aJljlacbyhSm3DJPOeERYeVxBvB/fIBeMnnFMApBBmaEnV9DPrx2OrZu8SHzg2vakSiU/DQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771887044; c=relaxed/simple;
	bh=ESozs9CA7nx8WRP63rzwxXm2lTOPC3wduzBK1YIpQFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uy5t8glJw3TxU+nlnT8Mu2Fo9xVXrHuPDY/OnPtfxDJV1DrRp09SkYh/djKeylHALG266hZFEgbt8pT2wUbXvDX7QVVWbW7VHE5rKV2uqpt2Ae9KQBdjXR/djDxfzYIFNMJezmbmC0/5HMxVdndwqq6DUiHNN55v7CLwDU1V4Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T/oPrwQF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D/se3+T+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NGvHUv3478529
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 22:50:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TLrQewx1LWqE8yixuzB68j48
	P2XGnr1QqREmwV+PFsM=; b=T/oPrwQFOqKER80CI6r0E2nLqTAVQ/gXyaoUHDvd
	DPxVH12jR7atAn68LTSq15qRt7dkY6jRAzq/rrxed5/Gcw1sK+TtmRO/vnj2AO1Y
	xoqaS0/yoNBwrHUjfwIrTqNFXrjhrkyFpWGWg7WYaNsb9T5fioDexRWDtIxzXTqF
	EZ+rppWzrS+K9kNb00k5qQqGnYw8f0BIaSnmaqcdx6cnjRdHQFf88BgtXJHpx9e3
	LXY678B3Ug6dvUpwDSxZ7fwyAzZJpjvHF1syPYrjQ9ObhDMF9+2eWlFBekhhgQOp
	5NwSYgb/iJW0wOQ82ywZrqWpbAC5ezx2HFMZA9+728XKTQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgtv9rywv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 22:50:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb0595def4so5809933285a.0
        for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 14:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771887041; x=1772491841; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TLrQewx1LWqE8yixuzB68j48P2XGnr1QqREmwV+PFsM=;
        b=D/se3+T+pG0/bWctDY2uG5rk7mjI4p4y3udvY3qdHhV/oK8YYjvLz2vxNW0IL2Xu3k
         t1LJYCKfwna7gYxOGwrgyEI2axQGBJsuAEYilCXXg2NXp76fOhZzx613TI763moKwzpT
         ulzbdtt5EY+DgfDfbok++8ISfnKeOMGobfJzOVCTR1AseOIqhwVSHIwzlDZmoQwoza0B
         I9KRSd9Orkf8XT6X9c6QAltPOXnTwSug5lbSqlKF2DamIotSZLpyHDc56haR7CegjzQx
         EXEa/sdbCp87Yd05xzjZdoIuTKFu4QRW4USCigFfLq7Fg9/S7+wY4KtQJD0L220imHLo
         57tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771887041; x=1772491841;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TLrQewx1LWqE8yixuzB68j48P2XGnr1QqREmwV+PFsM=;
        b=QvWVe/8chSLwvjqBMe8RyuW2DE8rH0uxsuOqa7t6YsyovmbQMnR4L/nsB6VDn2crpB
         +Lms+X/geMB62fUV1EW0As2QbNLHOGdP6qnvFiiEI72eK9+5qQm05J3iLVAMvZKWYgPf
         2P0+dL9tK68v9YVZEQ/5YhIExypysYNL+AIk2sHakdgRWcklneRpy0rm+X3Q19PeASLo
         mC9DEPSKOvDKKfrwrKMtvQGKHvIZI2LPLzHYx9OgZHqtrqzgoD6z/zEmAQTXtd99OTSJ
         DpS/s9BYU0OUd8Z9K6l24Y4E7luIftBKv7+eRQPN1aFQPdF1IAJ/Bqc5uvot4EwFq9sS
         7zxA==
X-Forwarded-Encrypted: i=1; AJvYcCUhB1fuS2UMqksciLe/6CGIDPsxt2kuzV9c1LS8WSO+bVh3uIzbHkaZNsdHKqyQlNX9zec1UgwG0soanw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCHFTwVmnxk7juMWX2bN4f930ebXCpiaiSJrVhi7w+q601Z8Ys
	zr/7qoOheZZDbo/T1QfAdFjToeetUE5D5Fpr+dHmjGjVzmviYuwX/liX0IQ3UNpKJVs3CyyXkku
	8jM/PLUnacU+8w+gS5noNUYp+j1k4Hf1y9jjBop8psjLPjOVbAx6hjxF8BR6nVtBnuA==
X-Gm-Gg: AZuq6aL2m+BKfJ4CHZfF3MDPr3uFdhEC+MD6xyRzSbSLf2zSDh7Qeay19D78PCQvhnd
	hsN/KCs86Yaot3DsQSD2lO/uodAFiOtbxs/E3S9dKcSqov+GPDraErWU58N4e+Sr4NaCcpABF8i
	bw0AktxRfIM6X5a4dNZhvEkdNd+rQi+8RBhk6HkBFxvciEYtvfrRd9OuuhIi1IF4vcTiDJaZeBp
	Pxw3iHo9LV1r+01QpgLvqA/K5AJIGsnDq4TQgtHXZg3a6TE8L+qFfIAd7mDmHaHuZ+zCmGBPzHW
	yAHB0PVxdpDjV3OsNv4BNZKorDAdxgJ3ahp9jRVPzFhIF8NcyhRy3zcTZIMhPzATu7Zw/qnGGk9
	YsOz5D8c2yKc1JT5CHWNqgGnDgBO/X1B4QBVf/PM9A5z6xYxQBjH3dbGymckJQ6aaedjPpbu5On
	48F/Pxaxp4OGctk9aOSoaYNGnF7AqLsgihDH4=
X-Received: by 2002:a05:620a:4506:b0:8cb:df8:e86a with SMTP id af79cd13be357-8cb7bfc8d11mr1987074685a.28.1771887040673;
        Mon, 23 Feb 2026 14:50:40 -0800 (PST)
X-Received: by 2002:a05:620a:4506:b0:8cb:df8:e86a with SMTP id af79cd13be357-8cb7bfc8d11mr1987071185a.28.1771887040143;
        Mon, 23 Feb 2026 14:50:40 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb45a64sm1809193e87.67.2026.02.23.14.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 14:50:39 -0800 (PST)
Date: Tue, 24 Feb 2026 00:50:37 +0200
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
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>
Subject: Re: [PATCH RFC 06/18] accel/qda: Add memory manager for CB devices
Message-ID: <d7s4e7xzfqfbcf5o3grc6xqm74dzwpck6ge7hyrwewmyacpuez@lcd6nhzyjr55>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-6-fe46a9c1a046@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224-qda-firstpost-v1-6-fe46a9c1a046@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Vaf6/Vp9 c=1 sm=1 tr=0 ts=699cd9c1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=6noqdOoYruC88qHUYLQA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE5OSBTYWx0ZWRfX8sPivr41PgWP
 hbxP1DNqi4I9iy3QVXzwBqtNT42x8TKm3qoXm7XksDFnyefGwQBSQ/X4wx0PWv+0zqBoGAuwoEt
 OsBN5Q7K0EWjtAmtouFCBCI1TjwJjoUfT42Z/A5Vpuc0mbc/UFbsFwopMEESKgHiZuSbT3Lpqun
 kZbFb3mpyYVPXouWkiK0sEzsNpMxjY/YsjrSnKUVHVK1vPol6soMg5DXOWeXt7APM2F9EaYfzbd
 71eyvXsCPa1QRi5mLGi8gzUPRia5Ojd9wxCiR3S0AMCczqI1nvhFj9YrzKIzHmaF49D8sdzFA1u
 ZNI1ModGOXh/jYZPDBBhk7DJwjAWC1O10o6DjHmEBVT22z/kRFfGXAAgucqT932jlbsRw67Bq6+
 ZLO0oqtHckjJUEG1HYsJwTZKzJPc/N6l3u7mhGlwXdwM+a78boPS4daiZUVu+LytqSuPUvCbp1p
 uaRHoVJ2JQTwfUZiDkA==
X-Proofpoint-ORIG-GUID: eE7hHFkhPNzMhK21SmWNMUeengWz0bEf
X-Proofpoint-GUID: eE7hHFkhPNzMhK21SmWNMUeengWz0bEf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_05,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230199
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53250-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,oss.qualcomm.com,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
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
X-Rspamd-Queue-Id: D4B9E17E97A
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 12:39:00AM +0530, Ekansh Gupta wrote:
> Introduce a per-device memory manager for the QDA driver that tracks
> IOMMU-capable compute context-bank (CB) devices. Each CB device is
> represented by a qda_iommu_device and registered with a central
> qda_memory_manager instance owned by qda_dev.
> 
> The memory manager maintains an xarray of devices and assigns a
> unique ID to each CB. It also provides basic lifetime management

Sounds like IDR.

> and a workqueue for deferred device removal. qda_cb_setup_device()

What is deferred device removal? Why do you need it?

> now allocates a qda_iommu_device for each CB and registers it with
> the memory manager after DMA configuration succeeds.
> 
> qda_init_device() is extended to allocate and initialize the memory
> manager, while qda_deinit_device() will tear it down in later
> patches. This prepares the QDA driver for fine-grained memory and
> IOMMU domain management tied to individual CB devices.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/accel/qda/Makefile             |   1 +
>  drivers/accel/qda/qda_cb.c             |  32 +++++++
>  drivers/accel/qda/qda_drv.c            |  46 ++++++++++
>  drivers/accel/qda/qda_drv.h            |   3 +
>  drivers/accel/qda/qda_memory_manager.c | 152 +++++++++++++++++++++++++++++++++
>  drivers/accel/qda/qda_memory_manager.h | 101 ++++++++++++++++++++++
>  6 files changed, 335 insertions(+)
> 

-- 
With best wishes
Dmitry

