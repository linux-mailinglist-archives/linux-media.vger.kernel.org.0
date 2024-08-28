Return-Path: <linux-media+bounces-17015-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F7C96274C
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 14:38:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B23E1F215D0
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 12:38:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99DF8176AA0;
	Wed, 28 Aug 2024 12:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="AN2OXEfz"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A511175D35;
	Wed, 28 Aug 2024 12:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724848716; cv=pass; b=ckO0qu/0WJWwdUyR/kwLeAnqmmun7aGyqJ85zLp7mvS/KD0k8683F6MpQSnOIdX1KWBdIz4WD+4SzenebTFtKtzR94QE5G3Gxha5Zl++AEPDY/kkMf1ozWw2+hu2TakqKo1RQMDcE5Cn9URxw1CUhJwPg6q8zBLPNlzadL+E4Z0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724848716; c=relaxed/simple;
	bh=0OCFj+dBfhaBaUne/VOGJ7D3cW3bEHVJHMF9ZYh03+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZMQy1Qlv3UEykOqOFHVLjwGmD5xOcJQgRUUmIbU4fr7ky7/HTIgQrJJRT4ukGtyB70LR1bWbantRfv0O9ltVL8QVs6U49OTG04PKYsgOYZdHAcbqW8BgJDxYCvEUyzZ2tff9dDoJB2ENvOOILCFWLr/d+EW0/HjxDPrOVG0i7f4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=AN2OXEfz; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724848709; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JScMh/Q7wHLybylzHtx55yi6emsM6FOBfl6gjGiE4lI8xgyyh8CdK6quWt+CxSjMuPHkYXvpv5s/BXj7dl7sChX7Ky3ZfeCarBj0iRZ/4VXWlS5DLMQQ46sraO06P4zsvSt2s3i5g43qfFKZZBAVJVoWEAAjwI/k5BXN3KNNm4U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1724848709; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=IGC4tdB0SQo0bZUFZPO+61ju8t0L3Fp9JWSlSuLeddI=; 
	b=Ls3hla0I4Q3EF5TYL3ywhjHOmQEonX2a1GQ8TXsN802xVaDTbaZpyUOGFwLL6efaUjIBoe+24C+VTTOmpF7SIK3/buFuo1wZN2d4EaalM6Yus1NR8epnooa2xg8qxehhTdq1TJZt0ifseHV8Q794E7E4jhdDGSYvgHB+Vduc/7U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724848709;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=IGC4tdB0SQo0bZUFZPO+61ju8t0L3Fp9JWSlSuLeddI=;
	b=AN2OXEfzj6X58nlbYRxppyOxv85zM3CZHqcbCyc2B2vJ/9b/inV9TV4kPgHndbQR
	bbpnANRR1P6+HYUd646G5lEfg+pMX+nNWNWirULOhqMcIaySMmKsuhq622kR+AYve+H
	VcsSUcYEDIeD+Gb6lMIeW/dJGfeQ+5c1SubRR2PE=
Received: by mx.zohomail.com with SMTPS id 1724848708175869.1776899721617;
	Wed, 28 Aug 2024 05:38:28 -0700 (PDT)
Date: Wed, 28 Aug 2024 14:38:25 +0200
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-input@vger.kernel.org,
	Erling Ljunggren <hljunggr@cisco.com>
Subject: Re: [PATCH 2/6] media: v4l2-dev: handle V4L2_CAP_EDID
Message-ID: <20240828123825.vnp4gqvyy7ohrhgw@basti-XPS-13-9310>
References: <cover.1723190258.git.hverkuil-cisco@xs4all.nl>
 <f88991fc4c197ef0e32f05b2f509980183aef012.1723190258.git.hverkuil-cisco@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <f88991fc4c197ef0e32f05b2f509980183aef012.1723190258.git.hverkuil-cisco@xs4all.nl>
X-ZohoMailClient: External

Hello,

On 09.08.2024 09:57, Hans Verkuil wrote:
>From: Erling Ljunggren <hljunggr@cisco.com>
>
>When the V4L2_CAP_EDID capability flag is set,
>ioctls for enum inputs/outputs and get/set edid are automatically set.
>
>Signed-off-by: Erling Ljunggren <hljunggr@cisco.com>
>Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Reviewed-by: Sebastian Fricke <sebastian.fricke@collabora.com>

Regards,
Sebastian
>---
> drivers/media/v4l2-core/v4l2-dev.c | 15 +++++++++++++++
> 1 file changed, 15 insertions(+)
>
>diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
>index be2ba7ca5de2..570ba00e00b3 100644
>--- a/drivers/media/v4l2-core/v4l2-dev.c
>+++ b/drivers/media/v4l2-core/v4l2-dev.c
>@@ -557,6 +557,7 @@ static void determine_valid_ioctls(struct video_device *vdev)
> 	bool is_tx = vdev->vfl_dir != VFL_DIR_RX;
> 	bool is_io_mc = vdev->device_caps & V4L2_CAP_IO_MC;
> 	bool has_streaming = vdev->device_caps & V4L2_CAP_STREAMING;
>+	bool is_edid =  vdev->device_caps & V4L2_CAP_EDID;
>
> 	bitmap_zero(valid_ioctls, BASE_VIDIOC_PRIVATE);
>
>@@ -784,6 +785,20 @@ static void determine_valid_ioctls(struct video_device *vdev)
> 		SET_VALID_IOCTL(ops, VIDIOC_S_TUNER, vidioc_s_tuner);
> 		SET_VALID_IOCTL(ops, VIDIOC_S_HW_FREQ_SEEK, vidioc_s_hw_freq_seek);
> 	}
>+	if (is_edid) {
>+		SET_VALID_IOCTL(ops, VIDIOC_G_EDID, vidioc_g_edid);
>+		if (is_tx) {
>+			SET_VALID_IOCTL(ops, VIDIOC_G_OUTPUT, vidioc_g_output);
>+			SET_VALID_IOCTL(ops, VIDIOC_S_OUTPUT, vidioc_s_output);
>+			SET_VALID_IOCTL(ops, VIDIOC_ENUMOUTPUT, vidioc_enum_output);
>+		}
>+		if (is_rx) {
>+			SET_VALID_IOCTL(ops, VIDIOC_ENUMINPUT, vidioc_enum_input);
>+			SET_VALID_IOCTL(ops, VIDIOC_G_INPUT, vidioc_g_input);
>+			SET_VALID_IOCTL(ops, VIDIOC_S_INPUT, vidioc_s_input);
>+			SET_VALID_IOCTL(ops, VIDIOC_S_EDID, vidioc_s_edid);
>+		}
>+	}
>
> 	bitmap_andnot(vdev->valid_ioctls, valid_ioctls, vdev->valid_ioctls,
> 			BASE_VIDIOC_PRIVATE);
>-- 
>2.43.0
>
>

