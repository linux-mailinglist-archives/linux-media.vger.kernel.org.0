Return-Path: <linux-media+bounces-38162-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B77EAB0C23F
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 13:10:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 622491884A1E
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 11:10:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EC57295536;
	Mon, 21 Jul 2025 11:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="CzmeFdsk"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234DB293C53;
	Mon, 21 Jul 2025 11:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753096144; cv=none; b=HMQP/W55WJm6V04gQQ6CC5E09mD2QV/Obcayc9AQ2dlTFE18DwXZc3fqzhS3h9ToaCxFYku5z51qNGoj5nmgn5Fs0gjFvtuqsVZAAYxkHoSEIgcLSEW7XWKiAAm6PFW5kn2l6OiLGf6tPN2sL1vUfY8qJ/NsKw7OwjgddAbm+Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753096144; c=relaxed/simple;
	bh=gfznuj8R/OgNmBc8q9ckubFy8KwAuCgY/+9OMWwyfIQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HHlfXqmh+EaFktlXv2/gzX0SpuakNHy2Lp5eC2YfDYRgEoKTLR6uJALtlOVL/TtlKlqWmWgIYAY7lgAj6GCmQOTy1PJNbzlS0hiY50Q40XU2wRJKXLg7WNbUdNofYwKmvusSD/yN8XiT7b0mRxL9mNuBVOcrXkGerI/4nzmrZ8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=CzmeFdsk; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LAiMm0014072;
	Mon, 21 Jul 2025 13:07:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	ZesZJAirQ8C1ohHkcmwk/SZqiKf5CT9QYrZbudr96z0=; b=CzmeFdsk3HJI57lf
	VLKGmGmQh3HC0LKkNuWaKOM3l+4NgchhLNiXV1T8nRre05AknyQJpS7M5wJO9wOm
	XuV1k2bu1IAf90lIDHIllg989ZrLgbM//VIbAEB3C8CVmGZ1d6PXtQjK8WQyEY5m
	LsrRFkiefZARVmwg9N/2WMFwuMBkMOQvNN6UGxBgdturUrOqlLPFtM6UfXoFVwgj
	D8f/bAv0oktn4xffXnsWJJg0khrsCm0nR7tb6Z23OBIbk8dOgTKidpDU07lpa67O
	4a4ELDPBB/W8hNiDKbVLlz6q5YiYEroFt4A8MU30eFbNqlv4XdWBb0licHEpeeyU
	4p57+A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4802q20j57-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Jul 2025 13:07:23 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3D3E1400A9;
	Mon, 21 Jul 2025 13:04:18 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 26B8B7A321F;
	Mon, 21 Jul 2025 13:03:59 +0200 (CEST)
Received: from [10.130.78.67] (10.130.78.67) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Jul
 2025 13:03:57 +0200
Message-ID: <fa07f01b-1e06-48c1-b380-c41a52f741bc@foss.st.com>
Date: Mon, 21 Jul 2025 13:03:57 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] media: Remove redundant
 pm_runtime_mark_last_busy() calls
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tommaso Merciai
	<tomm.merciai@gmail.com>,
        Martin Hecht <mhecht73@gmail.com>,
        Mauro Carvalho
 Chehab <mchehab@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Alain Volmat
	<alain.volmat@foss.st.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Umang Jain
	<umang.jain@ideasonboard.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Michael Riesch
	<michael.riesch@collabora.com>,
        Mikhail Rudenko <mike.rudenko@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Jacopo Mondi
	<jacopo.mondi@ideasonboard.com>,
        Nicholas Roth <nicholas@rothemail.net>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Paul Elder
	<paul.elder@ideasonboard.com>,
        Matt Ranostay <matt@ranostay.sg>,
        Nas Chung
	<nas.chung@chipsnmedia.com>,
        Jackson Lee <jackson.lee@chipsnmedia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding
	<thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Vikash
 Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan
 O'Donoghue <bryan.odonoghue@linaro.org>,
        Raspberry Pi Kernel Maintenance
	<kernel-list@raspberrypi.com>,
        Florian Fainelli
	<florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list
	<bcm-kernel-feedback-list@broadcom.com>,
        Nicolas Dufresne
	<nicolas.dufresne@collabora.com>,
        Benjamin Gaignard
	<benjamin.gaignard@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Sean Young <sean@mess.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Matthias Fend
	<matthias.fend@emfend.at>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Tomi
 Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Ricardo Ribalda
	<ribalda@chromium.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-rpi-kernel@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-rockchip@lists.infradead.org>
References: <20250709195348.973873-1-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <20250709195348.973873-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_03,2025-07-21_01,2025-03-28_01

Hi Sakari,

On 7/9/25 21:53, Sakari Ailus wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Acked-by: Thierry Reding <treding@nvidia.com> (tegra-vde/h264.c)
> Acked-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com> (alvium-csi2.c)
> Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com> (iris_hfi_queue.c)
> Reviewed-by: Sean Young <sean@mess.org>
> Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com> (imx219.c)
> ---
> since v1:
> 
> - Remove now-redundant braces from ccs-core.c, ov64a40.c and gpio-ir-recv.c.
> 
> v1 is <20250704075431.3220262-1-sakari.ailus@linux.intel.com> on LMML.
> 

[...]

>  drivers/media/i2c/st-mipid02.c                           | 2 --

[...]

>  drivers/media/i2c/vd55g1.c                               | 4 ----
>  drivers/media/i2c/vd56g3.c                               | 4 ----

[...]

Acked-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>

-- 
Regards,
Benjamin

