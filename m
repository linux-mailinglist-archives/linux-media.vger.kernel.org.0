Return-Path: <linux-media+bounces-38161-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E65F8B0C223
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 13:05:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0F13188D455
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 11:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5302E28C5BC;
	Mon, 21 Jul 2025 11:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="LMk7oKDt"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B842288CB6;
	Mon, 21 Jul 2025 11:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753095934; cv=none; b=S/rrGmgK4Q0XDaMQDvMxINKXmYJulVyAvdoaYGrONEIPF1aszeQ/h86Vq+7P8FYEp+UVEoCzAhET5DX7g73HetTWFddL7wL31neXZmG/UaqmdSl9hKPwwOxuQSZkO8rET0sT2OBJOWLfXcgxPF75VZpPycper8MuPOfqyshNzrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753095934; c=relaxed/simple;
	bh=kTRI/yqmm71mXfiSTpGxqtNKRcvPBxJGJ+0b4x8ktRU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZTMVbpKWTbqe1QenEfBQcziAOADvz2VuITxt8/Mo0Ya4bzrAkpJ+5ZTYC5nG28omjrdUQ/4Ca47eIbDLzS3ganWrPWUf3SZB3LsN2s80MD0LhK4Xeq51CZVr/X16iVYbqxgk3OIJQCKFzLr+gloOqwKQD6fssFeS63eDRgWuPYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=LMk7oKDt; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56L96UNg017909;
	Mon, 21 Jul 2025 13:05:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	LIg2e/VmqAxQ/FGVv0We6RD1yBe+H5fiRUCOJklQ0ns=; b=LMk7oKDtAJzW3X36
	Rk+ViVPRNPs1Ub/m2A37P0rrQkRnimACkHi4YGDcXzeCSFtYxw7GEFP6WOj7No9C
	XMsNAykyvpp8wJj4v1YLptjR7+R3Sk+DYsVGzT7EGMVaNHPE7J/gfvLECNhvFE0G
	75nyqzZ9oWijH3IMD9j9WIBr7VvmpNlzF03dE6qv3lJXp/u4pFW3obFHuvSTFmex
	MrAUs2At4DH2IsbjPs9+2oC4iog1SF1Vu78ckEc4V8J1oRBKjSWUdf1o0LtBssLH
	0PoS9NXe3kUAqzKlchbv2HpdZgSfe0TWRezl/UTaYyIJBKdLetMZKM8gu+sYRO2y
	C1vi0w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 480mx4dhsy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Jul 2025 13:05:11 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 11BA0400A7;
	Mon, 21 Jul 2025 13:04:17 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6B1047A321B;
	Mon, 21 Jul 2025 13:03:53 +0200 (CEST)
Received: from [10.130.78.67] (10.130.78.67) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Jul
 2025 13:03:53 +0200
Message-ID: <19cd3fd4-2d17-49f7-aa3a-9d443b24cf28@foss.st.com>
Date: Mon, 21 Jul 2025 13:03:50 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: vgxy61: Report stream using frame descriptors
To: Julien Massot <julien.massot@collabora.com>, <kernel@collabora.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Sylvain Petinot
	<sylvain.petinot@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250704-vgxy61-frame-desc-v1-1-0e62b9c4e260@collabora.com>
Content-Language: en-US
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <20250704-vgxy61-frame-desc-v1-1-0e62b9c4e260@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_03,2025-07-21_01,2025-03-28_01

Hi Julien,

Thank you for your patch.

On 7/4/25 11:28, Julien Massot wrote:
> Add support for .get_frame_desc() to report CSI-2 virtual channel
> and data type information. This allows CSI-2 receivers to properly
> interpret the stream without inferring the data type from the pixel
> format.
> 
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

Reviewed-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>

> ---
>  drivers/media/i2c/vgxy61.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/media/i2c/vgxy61.c b/drivers/media/i2c/vgxy61.c
> index 5b0479f3a3c0592be430cefe5a1ab9a76812ba84..44d6c8d8fbf8d6182e42d44e129bc45945ee0da5 100644
> --- a/drivers/media/i2c/vgxy61.c
> +++ b/drivers/media/i2c/vgxy61.c
> @@ -1181,6 +1181,21 @@ static int vgxy61_s_stream(struct v4l2_subdev *sd, int enable)
>  	return ret;
>  }
>  
> +static int vgxy61_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> +				 struct v4l2_mbus_frame_desc *fd)
> +{
> +	struct vgxy61_dev *sensor = to_vgxy61_dev(sd);
> +
> +	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
> +	fd->num_entries = 1;
> +	fd->entry[0].pixelcode = sensor->fmt.code;
> +	fd->entry[0].stream = 0;
> +	fd->entry[0].bus.csi2.vc = 0;
> +	fd->entry[0].bus.csi2.dt = get_data_type_by_code(sensor->fmt.code);
> +
> +	return 0;
> +}
> +
>  static int vgxy61_set_fmt(struct v4l2_subdev *sd,
>  			  struct v4l2_subdev_state *sd_state,
>  			  struct v4l2_subdev_format *format)
> @@ -1402,6 +1417,7 @@ static const struct v4l2_subdev_pad_ops vgxy61_pad_ops = {
>  	.set_fmt = vgxy61_set_fmt,
>  	.get_selection = vgxy61_get_selection,
>  	.enum_frame_size = vgxy61_enum_frame_size,
> +	.get_frame_desc = vgxy61_get_frame_desc,
>  };
>  
>  static const struct v4l2_subdev_ops vgxy61_subdev_ops = {
> 
> ---
> base-commit: 1343433ed38923a21425c602e92120a1f1db5f7a
> change-id: 20250704-vgxy61-frame-desc-2a6d3c6cab43
> 
> Best regards,

-- 
Regards,
Benjamin

