Return-Path: <linux-media+bounces-8529-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7D6897164
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 15:41:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C171428CA63
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 13:41:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8760D14882C;
	Wed,  3 Apr 2024 13:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="kA6zrEwC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9EA1487DD
	for <linux-media@vger.kernel.org>; Wed,  3 Apr 2024 13:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712151698; cv=none; b=g8Tq6l1z8h/+TkKSL8R33aVlHowLaDtHI0Kl3IXRrekvA+B4ZY8YyNv+SE47CM+QmUWD+nqRWvxsPy2CiuZVetAK1OFa2QYnJi+xcJaS5tbAfmoteLlSYrQhQ0cqYVXNcN4e9iyrc89rjThncOZ+VjnGET14BilM6kPhZ+3b1+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712151698; c=relaxed/simple;
	bh=99k89HYUNuFsZfbk8NT9zA7u1XKa8JFIfDseThFv1wg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QKuW7SE05GnVGPOAMrwL+YbXHUxvBOgcdSajp9gJ91tOTMH2EgQ9Lg0BCT+pqb6i9t+ZeHRGGtqoUob/aKcJhZZ37/Tkxr06IRuHbcfvmpRwci9Pd9Z/uSjsD5dJDiu4TFIlMBCrlNjYRcdpuxX2fhuc8vMya8woPAP71OHVABM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=kA6zrEwC; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 433BCaTF007392;
	Wed, 3 Apr 2024 14:26:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	selector1; bh=ffNx856LYUrDVol2i/FA9ApbdsB19sgCZlPu4houKjA=; b=kA
	6zrEwCs2SbSk0sW/qmbIXRMUjsecM0qq4L8HE50PxiwPcrCtbp/eRwm16X1NIVQS
	rDBW7/DP3NUcbHGpzQ6lMv25JVkQogzpBmzvltFduETOScc6FWkYDlrkE6Hu/Hu+
	/8/80Kfudhn8lUuEfKy6kN5n65teQEqD62dViY4zwzwDOyMfURnwoeHkSwGg4l6I
	vRzDnS85sIZN5EH+W6cPxm1GAFNR995WISubexvgKw6WH/sNn0xrRJQjoyJ0MSs4
	9oPZsMj/J+C9dJqEvSnJ8uek9QKi/a+pdShuVDFK8ahTp0FtHLivnRBkIaT4r2c9
	jKvWuDeUXBs0gCJAoMWg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3x6w65714e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Apr 2024 14:26:57 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 10DB24002D;
	Wed,  3 Apr 2024 14:26:54 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7684F218634;
	Wed,  3 Apr 2024 14:26:32 +0200 (CEST)
Received: from [10.130.72.241] (10.130.72.241) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 3 Apr
 2024 14:26:32 +0200
Message-ID: <b659efe5-6dbc-4145-b9e8-2da902ab51b3@foss.st.com>
Date: Wed, 3 Apr 2024 14:26:32 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] media: i2c: st-vgxy61: Switch to
 {enable,disable}_streams
To: Julien Massot <julien.massot@collabora.com>, <mchehab@kernel.org>,
        <sakari.ailus@linux.intel.com>, <sylvain.petinot@foss.st.com>
CC: <linux-media@vger.kernel.org>, <kernel@collabora.com>
References: <20240315085158.1213159-1-julien.massot@collabora.com>
 <20240315085158.1213159-4-julien.massot@collabora.com>
Content-Language: en-US
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <20240315085158.1213159-4-julien.massot@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-03_10,2024-04-03_01,2023-05-22_02

Hi Julien,

On 3/15/24 09:51, Julien Massot wrote:
> Switch from s_stream to enable_streams and disable_streams callbacks.
> 
> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> ---
>  drivers/media/i2c/st-vgxy61.c | 37 +++++++++++++++++++++++++----------
>  1 file changed, 27 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/i2c/st-vgxy61.c b/drivers/media/i2c/st-vgxy61.c
> index e8302456a8d9..754853378ee6 100644
> --- a/drivers/media/i2c/st-vgxy61.c
> +++ b/drivers/media/i2c/st-vgxy61.c
> @@ -420,7 +420,7 @@ struct vgxy61_dev {
>  	struct v4l2_ctrl *vblank_ctrl;
>  	struct v4l2_ctrl *vflip_ctrl;
>  	struct v4l2_ctrl *hflip_ctrl;
> -	bool streaming;
> +	u8 streaming;
>  	struct v4l2_mbus_framefmt fmt;
>  	const struct vgxy61_mode_info *sensor_modes;
>  	unsigned int sensor_modes_nb;
> @@ -1188,20 +1188,35 @@ static int vgxy61_stream_disable(struct vgxy61_dev *sensor)
>  	return ret;
>  }
>  
> -static int vgxy61_s_stream(struct v4l2_subdev *sd, int enable)
> +static int vgxy61_enable_streams(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_state *state, u32 pad,
> +				 u64 streams_mask)
>  {

Should we also check that 'pad == 0' ? Or is it always so ?

>  	struct vgxy61_dev *sensor = to_vgxy61_dev(sd);
> -	struct v4l2_subdev_state *sd_state;
>  	int ret = 0;
>  
> -	sd_state = v4l2_subdev_lock_and_get_active_state(&sensor->sd);
> -
> -	ret = enable ? vgxy61_stream_enable(sensor) :
> -	      vgxy61_stream_disable(sensor);
> +	if (!sensor->streaming)
> +		ret = vgxy61_stream_enable(sensor);
>  	if (!ret)
> -		sensor->streaming = enable;
> +		sensor->streaming |= streams_mask;
>  
> -	v4l2_subdev_unlock_state(sd_state);
> +	return ret;
> +}
> +
> +static int vgxy61_disable_streams(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *state, u32 pad,
> +				  u64 streams_mask)
> +{

Ditto.

> +	struct vgxy61_dev *sensor = to_vgxy61_dev(sd);
> +	int ret;
> +
> +	sensor->streaming &= ~streams_mask;
> +	if (sensor->streaming)
> +		return 0;
> +
> +	ret = vgxy61_stream_disable(sensor);
> +	if (!ret)
> +		sensor->streaming = false;
>  
>  	return ret;
>  }
> @@ -1496,7 +1511,7 @@ static const struct v4l2_subdev_core_ops vgxy61_core_ops = {
>  };
>  
>  static const struct v4l2_subdev_video_ops vgxy61_video_ops = {
> -	.s_stream = vgxy61_s_stream,
> +	.s_stream = v4l2_subdev_s_stream_helper,
>  };
>  
>  static const struct v4l2_subdev_pad_ops vgxy61_pad_ops = {
> @@ -1506,6 +1521,8 @@ static const struct v4l2_subdev_pad_ops vgxy61_pad_ops = {
>  	.get_frame_desc = vgxy61_get_frame_desc,
>  	.get_selection = vgxy61_get_selection,
>  	.enum_frame_size = vgxy61_enum_frame_size,
> +	.enable_streams = vgxy61_enable_streams,
> +	.disable_streams = vgxy61_disable_streams,
>  };
>  
>  static const struct v4l2_subdev_ops vgxy61_subdev_ops = {

-- 
Regards,

Benjamin

