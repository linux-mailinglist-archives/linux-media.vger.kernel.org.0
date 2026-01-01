Return-Path: <linux-media+bounces-49824-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C00C9CECFAD
	for <lists+linux-media@lfdr.de>; Thu, 01 Jan 2026 12:15:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3714D3004F21
	for <lists+linux-media@lfdr.de>; Thu,  1 Jan 2026 11:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0708287269;
	Thu,  1 Jan 2026 11:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kh/XO50p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KpXne+Uy"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EB1A41
	for <linux-media@vger.kernel.org>; Thu,  1 Jan 2026 11:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767266156; cv=none; b=V4P9+9mJi+3UpT4wcXR8bnjKj3QPrbOrMYBT2P9qXt8vDpR0tdn4AwY57AXK1krKNkFKDkYs/X1YZSiQnjFvvZs7V6CTUxl3vbyo4MT+ID45FD5hCish9EIgxDsOfxZWh1lv3DO/v/xMGAdkAeEl9+MS+Va7/nUoHgLNBkq5Rlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767266156; c=relaxed/simple;
	bh=jlNWA8+V56Z3hoNGej90oV96+c0GN/BYyPXnhV6iTDQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=d5CXLbiRqUjRmdWI4BGnNbmHxw20V6Qzby2puPJ4LDILmSQ4nQw5RnW4gYq5ZwFpsM3b6PNZHm51f9gYesCVorKy3JIBd1/3mh4lM9juju8EZ0IyMIGO+3OyUAfjrlgJ5lugT22ibfQFBxVZAKM3RMr47e/QOcRoHn+3bgr0gis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kh/XO50p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KpXne+Uy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6013wfBP1214200
	for <linux-media@vger.kernel.org>; Thu, 1 Jan 2026 11:15:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TI0wPs3kLBUGZacag7F8llOMeml/X1Ke0f8nU3CWfMg=; b=Kh/XO50pdpOd+1AT
	5VMJTwuJ0jzbu4v78q9vn6/dXbJQ7Wek7uFWY2e2C4GpOHuajB2FukOSaoitOR9q
	DLqW9NV3xkkDODkeBUCzrxUi21M9hJnQ+U8SrD0poPg2vII+1etrmZ2bKUnie6IX
	qGfHJnJj3Wb0gGjmUSh0YL8q68AleP4G16z+HgVu2msW5UifhpR+jJgir6NbA+fV
	KBINNqEswHuvI4O2j7I+8rhfTjD0t4vuldu3TVYXChT8RGuYo5jX08CMVJmWY9jO
	bMEuCG2RDXsJ3jzRfMKcKFcbaCCLKaGItaKbP3IR5vwQCGa+73JalKqPsIpHOt35
	piwA4Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd2bb1uhp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 01 Jan 2026 11:15:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed6ceab125so304835231cf.1
        for <linux-media@vger.kernel.org>; Thu, 01 Jan 2026 03:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767266152; x=1767870952; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TI0wPs3kLBUGZacag7F8llOMeml/X1Ke0f8nU3CWfMg=;
        b=KpXne+UyZ3yZcRgTquScEfqOZayExYy8ytJ9CHkfeYt4hY3YNPLWsPTcCzEGVyHbYc
         L4yWXc/dGXVqzWx8v5PNe0M/eIy3ltaX+hYxiERt/IMq5swgQ/mk+xYcm3MwX3M3lYRk
         iHy40y0Zl53Pz6ORRMY4M6+VQnH4vP8zVqLhOEhGbSXZfsc1het4EzW033xaBBVhuEtv
         3LOh5fdnYJb3qyiiUNchcN/yiVM+eiMxuO92KlM9J9ONJ2w7R3slJuIqWrdPaOhNK77i
         gRgnVqflBDFvQFXhhRT6he+MlmA5VCIuBruK21qez43zAXkFA8L5TQalO0/cc3FR5I4q
         0tzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767266152; x=1767870952;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TI0wPs3kLBUGZacag7F8llOMeml/X1Ke0f8nU3CWfMg=;
        b=Oivr2mCJa6DciuLBzmTYsqXbpIIb9soeJPdPo1sQCZ7dkfk2/WD33h/2xZut3bHtTj
         vJS852riCZ3aYEAp44x4nHnUFRv4+VtG4VRtovnm1f8nkQVgV7uoIImWUymELj5O9RCV
         Js7uf1e6IV6P98UNOHPD4kof1HQ3UxlJlqj/ypKY+l43QzRXmqJLpEiJmHAhS8zc1W0I
         w3Q7QaiLiBkDu8lhhD6AD/hZTp5bPTAtCdIZQCl3wV/1iBFXxJjFGJi2siY33a+n+m30
         Vba1emP5zFEGwMP2CeSapFXt0av62jVbqOzqHMDI1+tZvl7CzE7TbPbxlJJRB2XzE/mC
         qxMQ==
X-Gm-Message-State: AOJu0YzdkrpM7Qm0z046g40TIZHjDw0SS/PoYGxTF7Lp9D1qotO8FtdF
	A+EM8zdqnRMcbQSNgGEVtXyNPQCHDZpvMZpZzzx3Kz06V3RMhxtivul1V6B+Q/o/sp7Dc3xRA9d
	q9NJEww9uFicE4aPApBRGB7V1h+2BX7M0qSUVJO76eNF8HmgwySQ2In7kY3ORjxqYZg==
X-Gm-Gg: AY/fxX5K0qBf34WlNUS37jmmyFDPGIoYDoAs/XEG1/W9nh47L3avW7wj4f5Y5keuTyp
	ME3p3QmkYyA/YV7Uv6h3uWMDyhvoOXs4Cle0dFOHERN/UvEGv66QZPqL3cl0W91qDxUNIXsnW1j
	YmV1ZpSdDmmavAqn/D87YKUC7tbm4OieSHKNFP4Ah50JTTLy13geAhYicQPhsV2Qtky7sSHqhfG
	K7JQSlt5JTnEgZjArgp/JP8Y4DwnxUUWuZh7oWrE9tQsdrDuVRWvxhJK6ygcKs1wei8GPoueX/N
	d8yx9GveJbNSKsXc+z+YRB/X+t6lehAtxNl/+svm7L8H83mnef+VNKRzPhvkhH23pU5UwIpKWDu
	QjGvdmvXWjQ0QfwR8dTPPa89vsyIWYGNzvXqshsSvP5potym+mbwBmgS3SR11e9SSEGOJQLqG75
	gSrmA5YrA9xhRQPHa5RXohOo+k1n/cz5pkuwoZttkhXvBGhKM5PYFk3COSRDYm3meMbPB1x1nXI
	3WM
X-Received: by 2002:a05:622a:1e85:b0:4f1:b712:364a with SMTP id d75a77b69052e-4f4abd9588dmr618025241cf.56.1767266151705;
        Thu, 01 Jan 2026 03:15:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE4f+ektSDCBJDPobvrJS5W098jRSkq8JjuiFm9DiNFpVsLFsKbiHjcEcmoIgPKB7QMQoREcA==
X-Received: by 2002:a05:622a:1e85:b0:4f1:b712:364a with SMTP id d75a77b69052e-4f4abd9588dmr618024911cf.56.1767266151143;
        Thu, 01 Jan 2026 03:15:51 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b838d3f12f6sm981361766b.62.2026.01.01.03.15.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jan 2026 03:15:50 -0800 (PST)
Message-ID: <fed9022b-e87b-41e1-b77b-6b7900c1832b@oss.qualcomm.com>
Date: Thu, 1 Jan 2026 12:15:49 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH v4 1/3] media: i2c: ov5647: Convert to CCI register access
 helpers
To: Xiaolei Wang <xiaolei.wang@windriver.com>, tarang.raval@siliconsignals.io,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        dave.stevenson@raspberrypi.com, jacopo@jmondi.org, mchehab@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com, hverkuil+cisco@kernel.org,
        hverkuil-cisco@xs4all.nl, jai.luthra@ideasonboard.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260101103001.207194-1-xiaolei.wang@windriver.com>
 <20260101103001.207194-2-xiaolei.wang@windriver.com>
Content-Language: en-US, nl
In-Reply-To: <20260101103001.207194-2-xiaolei.wang@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3CuUz4wMPHWVC7P1B1mkHTQhecweK8ri
X-Proofpoint-ORIG-GUID: 3CuUz4wMPHWVC7P1B1mkHTQhecweK8ri
X-Authority-Analysis: v=2.4 cv=dMKrWeZb c=1 sm=1 tr=0 ts=69565768 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=EUspDBNiAAAA:8 a=ZlPjvXpxhWcNiKCVe38A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAxMDEwMCBTYWx0ZWRfX6++DVO21HdYs
 p+ZcLGZJKigCuGzjzpdSfOkDsHC73GBLws5mavI01Asoneau4LLdYFtcUClGLborv3WKNHIg2B/
 KFyM3mTcUFNdGXESzoQWKTtltbk4QQoBp62i0VO836ELoDnPtwJ7haU0uQsdamnGBPuKrlot/G6
 IyJOHH3+3Fj860l8wFFd8fZ5TwS3RGUXLb78CIJr3LLl5M/J+2AYH7WzHQlhS95W2VYP4o3BsBK
 PLU1jUJlOZ8NJFwvW4wb8Zi4+rcw8FKSWJgzrmoY+LJR6/np4VUXh8Pv3+eTw9bdX4/t4/zxhkI
 2kKItjO9iBZKttDfSovkMlrt/CjhOgu4OzT/nTrHmG9M+4MWeqhyqNF8PPkjjdiqdRucZE/K0BS
 nph2ZH+b9nOTwtpdjlWHRwdmYCC8nFTqwJAmDvqQC+ryeqA5H6jd8HgwaLIQtaxoZ5BgZEycSwi
 ELAM77y9hVwNMGYAC2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-01_04,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601010100

Hi,

On 1-Jan-26 11:29, Xiaolei Wang wrote:
> Use the new common CCI register access helpers to replace the private
> register access helpers in the ov5647 driver. This simplifies the driver
> by reducing the amount of code.
> 
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans



> ---
>  drivers/media/i2c/Kconfig  |   1 +
>  drivers/media/i2c/ov5647.c | 350 +++++++++++--------------------------
>  2 files changed, 103 insertions(+), 248 deletions(-)
> 
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 4b4db8c4f496..cce63349e71e 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -529,6 +529,7 @@ config VIDEO_OV5645
>  
>  config VIDEO_OV5647
>  	tristate "OmniVision OV5647 sensor support"
> +	select V4L2_CCI_I2C
>  	help
>  	  This is a Video4Linux2 sensor driver for the OmniVision
>  	  OV5647 camera.
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index e193fef4fced..24a160bbb079 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -20,8 +20,10 @@
>  #include <linux/module.h>
>  #include <linux/of_graph.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
>  #include <linux/slab.h>
>  #include <linux/videodev2.h>
> +#include <media/v4l2-cci.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-event.h>
> @@ -41,25 +43,23 @@
>  #define MIPI_CTRL00_BUS_IDLE			BIT(2)
>  #define MIPI_CTRL00_CLOCK_LANE_DISABLE		BIT(0)
>  
> -#define OV5647_SW_STANDBY		0x0100
> -#define OV5647_SW_RESET			0x0103
> -#define OV5647_REG_CHIPID_H		0x300a
> -#define OV5647_REG_CHIPID_L		0x300b
> -#define OV5640_REG_PAD_OUT		0x300d
> -#define OV5647_REG_EXP_HI		0x3500
> -#define OV5647_REG_EXP_MID		0x3501
> -#define OV5647_REG_EXP_LO		0x3502
> -#define OV5647_REG_AEC_AGC		0x3503
> -#define OV5647_REG_GAIN_HI		0x350a
> -#define OV5647_REG_GAIN_LO		0x350b
> -#define OV5647_REG_VTS_HI		0x380e
> -#define OV5647_REG_VTS_LO		0x380f
> -#define OV5647_REG_FRAME_OFF_NUMBER	0x4202
> -#define OV5647_REG_MIPI_CTRL00		0x4800
> -#define OV5647_REG_MIPI_CTRL14		0x4814
> -#define OV5647_REG_AWB			0x5001
> -#define OV5647_REG_ISPCTRL3D		0x503d
> -
> +#define OV5647_SW_STANDBY		CCI_REG8(0x0100)
> +#define OV5647_SW_RESET			CCI_REG8(0x0103)
> +#define OV5647_REG_CHIPID		CCI_REG16(0x300a)
> +#define OV5640_REG_PAD_OUT		CCI_REG8(0x300d)
> +#define OV5647_REG_EXPOSURE		CCI_REG24(0x3500)
> +#define OV5647_REG_AEC_AGC		CCI_REG8(0x3503)
> +#define OV5647_REG_GAIN			CCI_REG16(0x350a)
> +#define OV5647_REG_VTS			CCI_REG16(0x380e)
> +#define OV5647_REG_FRAME_OFF_NUMBER	CCI_REG8(0x4202)
> +#define OV5647_REG_MIPI_CTRL00		CCI_REG8(0x4800)
> +#define OV5647_REG_MIPI_CTRL14		CCI_REG8(0x4814)
> +#define OV5647_REG_MIPI_CTRL14_CHANNEL_MASK	GENMASK(7, 6)
> +#define OV5647_REG_MIPI_CTRL14_CHANNEL_SHIFT	6
> +#define OV5647_REG_AWB			CCI_REG8(0x5001)
> +#define OV5647_REG_ISPCTRL3D		CCI_REG8(0x503d)
> +
> +#define OV5647_CHIP_ID 0x5647
>  #define REG_TERM 0xfffe
>  #define VAL_TERM 0xfe
>  #define REG_DLY  0xffff
> @@ -81,23 +81,19 @@
>  #define OV5647_EXPOSURE_DEFAULT		1000
>  #define OV5647_EXPOSURE_MAX		65535
>  
> -struct regval_list {
> -	u16 addr;
> -	u8 data;
> -};
> -
>  struct ov5647_mode {
>  	struct v4l2_mbus_framefmt	format;
>  	struct v4l2_rect		crop;
>  	u64				pixel_rate;
>  	int				hts;
>  	int				vts;
> -	const struct regval_list	*reg_list;
> +	const struct reg_sequence	*reg_list;
>  	unsigned int			num_regs;
>  };
>  
>  struct ov5647 {
>  	struct v4l2_subdev		sd;
> +	struct regmap			*regmap;
>  	struct media_pad		pad;
>  	struct mutex			lock;
>  	struct clk			*xclk;
> @@ -130,19 +126,19 @@ static const u8 ov5647_test_pattern_val[] = {
>  	0x81,	/* Random Data */
>  };
>  
> -static const struct regval_list sensor_oe_disable_regs[] = {
> +static const struct reg_sequence sensor_oe_disable_regs[] = {
>  	{0x3000, 0x00},
>  	{0x3001, 0x00},
>  	{0x3002, 0x00},
>  };
>  
> -static const struct regval_list sensor_oe_enable_regs[] = {
> +static const struct reg_sequence sensor_oe_enable_regs[] = {
>  	{0x3000, 0x0f},
>  	{0x3001, 0xff},
>  	{0x3002, 0xe4},
>  };
>  
> -static struct regval_list ov5647_2592x1944_10bpp[] = {
> +static const struct reg_sequence ov5647_2592x1944_10bpp[] = {
>  	{0x0100, 0x00},
>  	{0x0103, 0x01},
>  	{0x3034, 0x1a},
> @@ -231,7 +227,7 @@ static struct regval_list ov5647_2592x1944_10bpp[] = {
>  	{0x0100, 0x01},
>  };
>  
> -static struct regval_list ov5647_1080p30_10bpp[] = {
> +static const struct reg_sequence ov5647_1080p30_10bpp[] = {
>  	{0x0100, 0x00},
>  	{0x0103, 0x01},
>  	{0x3034, 0x1a},
> @@ -320,7 +316,7 @@ static struct regval_list ov5647_1080p30_10bpp[] = {
>  	{0x0100, 0x01},
>  };
>  
> -static struct regval_list ov5647_2x2binned_10bpp[] = {
> +static const struct reg_sequence ov5647_2x2binned_10bpp[] = {
>  	{0x0100, 0x00},
>  	{0x0103, 0x01},
>  	{0x3034, 0x1a},
> @@ -413,7 +409,7 @@ static struct regval_list ov5647_2x2binned_10bpp[] = {
>  	{0x0100, 0x01},
>  };
>  
> -static struct regval_list ov5647_640x480_10bpp[] = {
> +static const struct reg_sequence ov5647_640x480_10bpp[] = {
>  	{0x0100, 0x00},
>  	{0x0103, 0x01},
>  	{0x3035, 0x11},
> @@ -594,109 +590,29 @@ static const struct ov5647_mode ov5647_modes[] = {
>  #define OV5647_DEFAULT_MODE	(&ov5647_modes[3])
>  #define OV5647_DEFAULT_FORMAT	(ov5647_modes[3].format)
>  
> -static int ov5647_write16(struct v4l2_subdev *sd, u16 reg, u16 val)
> -{
> -	unsigned char data[4] = { reg >> 8, reg & 0xff, val >> 8, val & 0xff};
> -	struct i2c_client *client = v4l2_get_subdevdata(sd);
> -	int ret;
> -
> -	ret = i2c_master_send(client, data, 4);
> -	if (ret < 0) {
> -		dev_dbg(&client->dev, "%s: i2c write error, reg: %x\n",
> -			__func__, reg);
> -		return ret;
> -	}
> -
> -	return 0;
> -}
> -
> -static int ov5647_write(struct v4l2_subdev *sd, u16 reg, u8 val)
> -{
> -	unsigned char data[3] = { reg >> 8, reg & 0xff, val};
> -	struct i2c_client *client = v4l2_get_subdevdata(sd);
> -	int ret;
> -
> -	ret = i2c_master_send(client, data, 3);
> -	if (ret < 0) {
> -		dev_dbg(&client->dev, "%s: i2c write error, reg: %x\n",
> -				__func__, reg);
> -		return ret;
> -	}
> -
> -	return 0;
> -}
> -
> -static int ov5647_read(struct v4l2_subdev *sd, u16 reg, u8 *val)
> -{
> -	struct i2c_client *client = v4l2_get_subdevdata(sd);
> -	u8 buf[2] = { reg >> 8, reg & 0xff };
> -	struct i2c_msg msg[2];
> -	int ret;
> -
> -	msg[0].addr = client->addr;
> -	msg[0].flags = client->flags;
> -	msg[0].buf = buf;
> -	msg[0].len = sizeof(buf);
> -
> -	msg[1].addr = client->addr;
> -	msg[1].flags = client->flags | I2C_M_RD;
> -	msg[1].buf = buf;
> -	msg[1].len = 1;
> -
> -	ret = i2c_transfer(client->adapter, msg, 2);
> -	if (ret != 2) {
> -		dev_err(&client->dev, "%s: i2c read error, reg: %x = %d\n",
> -			__func__, reg, ret);
> -		return ret >= 0 ? -EINVAL : ret;
> -	}
> -
> -	*val = buf[0];
> -
> -	return 0;
> -}
> -
> -static int ov5647_write_array(struct v4l2_subdev *sd,
> -			      const struct regval_list *regs, int array_size)
> -{
> -	int i, ret;
> -
> -	for (i = 0; i < array_size; i++) {
> -		ret = ov5647_write(sd, regs[i].addr, regs[i].data);
> -		if (ret < 0)
> -			return ret;
> -	}
> -
> -	return 0;
> -}
> -
>  static int ov5647_set_virtual_channel(struct v4l2_subdev *sd, int channel)
>  {
> -	u8 channel_id;
> -	int ret;
> -
> -	ret = ov5647_read(sd, OV5647_REG_MIPI_CTRL14, &channel_id);
> -	if (ret < 0)
> -		return ret;
> -
> -	channel_id &= ~(3 << 6);
> +	struct ov5647 *sensor = to_sensor(sd);
>  
> -	return ov5647_write(sd, OV5647_REG_MIPI_CTRL14,
> -			    channel_id | (channel << 6));
> +	return cci_update_bits(sensor->regmap, OV5647_REG_MIPI_CTRL14,
> +			       OV5647_REG_MIPI_CTRL14_CHANNEL_MASK,
> +			       channel << OV5647_REG_MIPI_CTRL14_CHANNEL_SHIFT,
> +			       NULL);
>  }
>  
>  static int ov5647_set_mode(struct v4l2_subdev *sd)
>  {
>  	struct i2c_client *client = v4l2_get_subdevdata(sd);
>  	struct ov5647 *sensor = to_sensor(sd);
> -	u8 resetval, rdval;
> +	u64 resetval, rdval;
>  	int ret;
>  
> -	ret = ov5647_read(sd, OV5647_SW_STANDBY, &rdval);
> +	ret = cci_read(sensor->regmap, OV5647_SW_STANDBY, &rdval, NULL);
>  	if (ret < 0)
>  		return ret;
>  
> -	ret = ov5647_write_array(sd, sensor->mode->reg_list,
> -				 sensor->mode->num_regs);
> +	ret = regmap_multi_reg_write(sensor->regmap, sensor->mode->reg_list,
> +				     sensor->mode->num_regs);
>  	if (ret < 0) {
>  		dev_err(&client->dev, "write sensor default regs error\n");
>  		return ret;
> @@ -706,13 +622,13 @@ static int ov5647_set_mode(struct v4l2_subdev *sd)
>  	if (ret < 0)
>  		return ret;
>  
> -	ret = ov5647_read(sd, OV5647_SW_STANDBY, &resetval);
> +	ret = cci_read(sensor->regmap, OV5647_SW_STANDBY, &resetval, NULL);
>  	if (ret < 0)
>  		return ret;
>  
>  	if (!(resetval & 0x01)) {
>  		dev_err(&client->dev, "Device was in SW standby");
> -		ret = ov5647_write(sd, OV5647_SW_STANDBY, 0x01);
> +		ret = cci_write(sensor->regmap, OV5647_SW_STANDBY, 0x01, NULL);
>  		if (ret < 0)
>  			return ret;
>  	}
> @@ -742,32 +658,25 @@ static int ov5647_stream_on(struct v4l2_subdev *sd)
>  		val |= MIPI_CTRL00_CLOCK_LANE_GATE |
>  		       MIPI_CTRL00_LINE_SYNC_ENABLE;
>  
> -	ret = ov5647_write(sd, OV5647_REG_MIPI_CTRL00, val);
> -	if (ret < 0)
> -		return ret;
> -
> -	ret = ov5647_write(sd, OV5647_REG_FRAME_OFF_NUMBER, 0x00);
> -	if (ret < 0)
> -		return ret;
> +	cci_write(sensor->regmap, OV5647_REG_MIPI_CTRL00, val, &ret);
> +	cci_write(sensor->regmap, OV5647_REG_FRAME_OFF_NUMBER, 0x00, &ret);
> +	cci_write(sensor->regmap, OV5640_REG_PAD_OUT, 0x00, &ret);
>  
> -	return ov5647_write(sd, OV5640_REG_PAD_OUT, 0x00);
> +	return ret;
>  }
>  
>  static int ov5647_stream_off(struct v4l2_subdev *sd)
>  {
> -	int ret;
> -
> -	ret = ov5647_write(sd, OV5647_REG_MIPI_CTRL00,
> -			   MIPI_CTRL00_CLOCK_LANE_GATE | MIPI_CTRL00_BUS_IDLE |
> -			   MIPI_CTRL00_CLOCK_LANE_DISABLE);
> -	if (ret < 0)
> -		return ret;
> +	struct ov5647 *sensor = to_sensor(sd);
> +	int ret = 0;
>  
> -	ret = ov5647_write(sd, OV5647_REG_FRAME_OFF_NUMBER, 0x0f);
> -	if (ret < 0)
> -		return ret;
> +	cci_write(sensor->regmap, OV5647_REG_MIPI_CTRL00,
> +		  MIPI_CTRL00_CLOCK_LANE_GATE | MIPI_CTRL00_BUS_IDLE |
> +		  MIPI_CTRL00_CLOCK_LANE_DISABLE, &ret);
> +	cci_write(sensor->regmap, OV5647_REG_FRAME_OFF_NUMBER, 0x0f, &ret);
> +	cci_write(sensor->regmap, OV5640_REG_PAD_OUT, 0x01, &ret);
>  
> -	return ov5647_write(sd, OV5640_REG_PAD_OUT, 0x01);
> +	return ret;
>  }
>  
>  static int ov5647_power_on(struct device *dev)
> @@ -788,8 +697,8 @@ static int ov5647_power_on(struct device *dev)
>  		goto error_pwdn;
>  	}
>  
> -	ret = ov5647_write_array(&sensor->sd, sensor_oe_enable_regs,
> -				 ARRAY_SIZE(sensor_oe_enable_regs));
> +	ret = regmap_multi_reg_write(sensor->regmap, sensor_oe_enable_regs,
> +				     ARRAY_SIZE(sensor_oe_enable_regs));
>  	if (ret < 0) {
>  		dev_err(dev, "write sensor_oe_enable_regs error\n");
>  		goto error_clk_disable;
> @@ -815,23 +724,17 @@ static int ov5647_power_on(struct device *dev)
>  static int ov5647_power_off(struct device *dev)
>  {
>  	struct ov5647 *sensor = dev_get_drvdata(dev);
> -	u8 rdval;
>  	int ret;
>  
>  	dev_dbg(dev, "OV5647 power off\n");
>  
> -	ret = ov5647_write_array(&sensor->sd, sensor_oe_disable_regs,
> -				 ARRAY_SIZE(sensor_oe_disable_regs));
> +	ret = regmap_multi_reg_write(sensor->regmap, sensor_oe_disable_regs,
> +				     ARRAY_SIZE(sensor_oe_disable_regs));
>  	if (ret < 0)
>  		dev_dbg(dev, "disable oe failed\n");
>  
>  	/* Enter software standby */
> -	ret = ov5647_read(&sensor->sd, OV5647_SW_STANDBY, &rdval);
> -	if (ret < 0)
> -		dev_dbg(dev, "software standby failed\n");
> -
> -	rdval &= ~0x01;
> -	ret = ov5647_write(&sensor->sd, OV5647_SW_STANDBY, rdval);
> +	ret = cci_update_bits(sensor->regmap, OV5647_SW_STANDBY, 0x01, 0x00, NULL);
>  	if (ret < 0)
>  		dev_dbg(dev, "software standby failed\n");
>  
> @@ -845,10 +748,11 @@ static int ov5647_power_off(struct device *dev)
>  static int ov5647_sensor_get_register(struct v4l2_subdev *sd,
>  				      struct v4l2_dbg_register *reg)
>  {
> +	struct ov5647 *sensor = to_sensor(sd);
>  	int ret;
> -	u8 val;
> +	u64 val;
>  
> -	ret = ov5647_read(sd, reg->reg & 0xff, &val);
> +	ret = cci_read(sensor->regmap, reg->reg & 0xff, &val, NULL);
>  	if (ret < 0)
>  		return ret;
>  
> @@ -861,7 +765,9 @@ static int ov5647_sensor_get_register(struct v4l2_subdev *sd,
>  static int ov5647_sensor_set_register(struct v4l2_subdev *sd,
>  				      const struct v4l2_dbg_register *reg)
>  {
> -	return ov5647_write(sd, reg->reg & 0xff, reg->val & 0xff);
> +	struct ov5647 *sensor = to_sensor(sd);
> +
> +	return cci_write(sensor->regmap, reg->reg & 0xff, reg->val & 0xff, NULL);
>  }
>  #endif
>  
> @@ -1089,33 +995,27 @@ static const struct v4l2_subdev_ops ov5647_subdev_ops = {
>  
>  static int ov5647_detect(struct v4l2_subdev *sd)
>  {
> +	struct ov5647 *sensor = to_sensor(sd);
>  	struct i2c_client *client = v4l2_get_subdevdata(sd);
> -	u8 read;
> +	u64 read;
>  	int ret;
>  
> -	ret = ov5647_write(sd, OV5647_SW_RESET, 0x01);
> +	ret = cci_write(sensor->regmap, OV5647_SW_RESET, 0x01, NULL);
>  	if (ret < 0)
>  		return ret;
>  
> -	ret = ov5647_read(sd, OV5647_REG_CHIPID_H, &read);
> +	ret = cci_read(sensor->regmap, OV5647_REG_CHIPID, &read, NULL);
>  	if (ret < 0)
> -		return ret;
> +		return dev_err_probe(&client->dev, ret,
> +				     "failed to read chip id %x\n",
> +				     OV5647_REG_CHIPID);
>  
> -	if (read != 0x56) {
> -		dev_err(&client->dev, "ID High expected 0x56 got %x", read);
> +	if (read != OV5647_CHIP_ID) {
> +		dev_err(&client->dev, "Chip ID expected 0x5647 got 0x%llx", read);
>  		return -ENODEV;
>  	}
>  
> -	ret = ov5647_read(sd, OV5647_REG_CHIPID_L, &read);
> -	if (ret < 0)
> -		return ret;
> -
> -	if (read != 0x47) {
> -		dev_err(&client->dev, "ID Low expected 0x47 got %x", read);
> -		return -ENODEV;
> -	}
> -
> -	return ov5647_write(sd, OV5647_SW_RESET, 0x00);
> +	return cci_write(sensor->regmap, OV5647_SW_RESET, 0x00, NULL);
>  }
>  
>  static int ov5647_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> @@ -1138,74 +1038,6 @@ static const struct v4l2_subdev_internal_ops ov5647_subdev_internal_ops = {
>  	.open = ov5647_open,
>  };
>  
> -static int ov5647_s_auto_white_balance(struct v4l2_subdev *sd, u32 val)
> -{
> -	return ov5647_write(sd, OV5647_REG_AWB, val ? 1 : 0);
> -}
> -
> -static int ov5647_s_autogain(struct v4l2_subdev *sd, u32 val)
> -{
> -	int ret;
> -	u8 reg;
> -
> -	/* Non-zero turns on AGC by clearing bit 1.*/
> -	ret = ov5647_read(sd, OV5647_REG_AEC_AGC, &reg);
> -	if (ret)
> -		return ret;
> -
> -	return ov5647_write(sd, OV5647_REG_AEC_AGC, val ? reg & ~BIT(1)
> -							: reg | BIT(1));
> -}
> -
> -static int ov5647_s_exposure_auto(struct v4l2_subdev *sd, u32 val)
> -{
> -	int ret;
> -	u8 reg;
> -
> -	/*
> -	 * Everything except V4L2_EXPOSURE_MANUAL turns on AEC by
> -	 * clearing bit 0.
> -	 */
> -	ret = ov5647_read(sd, OV5647_REG_AEC_AGC, &reg);
> -	if (ret)
> -		return ret;
> -
> -	return ov5647_write(sd, OV5647_REG_AEC_AGC,
> -			    val == V4L2_EXPOSURE_MANUAL ? reg | BIT(0)
> -							: reg & ~BIT(0));
> -}
> -
> -static int ov5647_s_analogue_gain(struct v4l2_subdev *sd, u32 val)
> -{
> -	int ret;
> -
> -	/* 10 bits of gain, 2 in the high register. */
> -	ret = ov5647_write(sd, OV5647_REG_GAIN_HI, (val >> 8) & 3);
> -	if (ret)
> -		return ret;
> -
> -	return ov5647_write(sd, OV5647_REG_GAIN_LO, val & 0xff);
> -}
> -
> -static int ov5647_s_exposure(struct v4l2_subdev *sd, u32 val)
> -{
> -	int ret;
> -
> -	/*
> -	 * Sensor has 20 bits, but the bottom 4 bits are fractions of a line
> -	 * which we leave as zero (and don't receive in "val").
> -	 */
> -	ret = ov5647_write(sd, OV5647_REG_EXP_HI, (val >> 12) & 0xf);
> -	if (ret)
> -		return ret;
> -
> -	ret = ov5647_write(sd, OV5647_REG_EXP_MID, (val >> 4) & 0xff);
> -	if (ret)
> -		return ret;
> -
> -	return ov5647_write(sd, OV5647_REG_EXP_LO, (val & 0xf) << 4);
> -}
> -
>  static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
>  {
>  	struct ov5647 *sensor = container_of(ctrl->handler,
> @@ -1239,27 +1071,42 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
>  
>  	switch (ctrl->id) {
>  	case V4L2_CID_AUTO_WHITE_BALANCE:
> -		ret = ov5647_s_auto_white_balance(sd, ctrl->val);
> +		ret = cci_write(sensor->regmap, OV5647_REG_AWB,
> +				ctrl->val ? 1 : 0, NULL);
>  		break;
>  	case V4L2_CID_AUTOGAIN:
> -		ret = ov5647_s_autogain(sd, ctrl->val);
> +		/* Non-zero turns on AGC by clearing bit 1.*/
> +		return cci_update_bits(sensor->regmap, OV5647_REG_AEC_AGC, BIT(1),
> +				       ctrl->val ? 0 : BIT(1), NULL);
>  		break;
>  	case V4L2_CID_EXPOSURE_AUTO:
> -		ret = ov5647_s_exposure_auto(sd, ctrl->val);
> +		/*
> +		 * Everything except V4L2_EXPOSURE_MANUAL turns on AEC by
> +		 * clearing bit 0.
> +		 */
> +		return cci_update_bits(sensor->regmap, OV5647_REG_AEC_AGC, BIT(0),
> +				       ctrl->val == V4L2_EXPOSURE_MANUAL ? BIT(0) : 0, NULL);
>  		break;
>  	case V4L2_CID_ANALOGUE_GAIN:
> -		ret =  ov5647_s_analogue_gain(sd, ctrl->val);
> +		/* 10 bits of gain, 2 in the high register. */
> +		return cci_write(sensor->regmap, OV5647_REG_GAIN,
> +				 ctrl->val & 0x3ff, NULL);
>  		break;
>  	case V4L2_CID_EXPOSURE:
> -		ret = ov5647_s_exposure(sd, ctrl->val);
> +		/*
> +		 * Sensor has 20 bits, but the bottom 4 bits are fractions of a line
> +		 * which we leave as zero (and don't receive in "val").
> +		 */
> +		ret = cci_write(sensor->regmap, OV5647_REG_EXPOSURE,
> +				ctrl->val << 4, NULL);
>  		break;
>  	case V4L2_CID_VBLANK:
> -		ret = ov5647_write16(sd, OV5647_REG_VTS_HI,
> -				     sensor->mode->format.height + ctrl->val);
> +		ret = cci_write(sensor->regmap, OV5647_REG_VTS,
> +				sensor->mode->format.height + ctrl->val, NULL);
>  		break;
>  	case V4L2_CID_TEST_PATTERN:
> -		ret = ov5647_write(sd, OV5647_REG_ISPCTRL3D,
> -				   ov5647_test_pattern_val[ctrl->val]);
> +		ret = cci_write(sensor->regmap, OV5647_REG_ISPCTRL3D,
> +				ov5647_test_pattern_val[ctrl->val], NULL);
>  		break;
>  
>  	/* Read-only, but we adjust it based on mode. */
> @@ -1435,6 +1282,13 @@ static int ov5647_probe(struct i2c_client *client)
>  	if (ret < 0)
>  		goto ctrl_handler_free;
>  
> +	sensor->regmap = devm_cci_regmap_init_i2c(client, 16);
> +	if (IS_ERR(sensor->regmap)) {
> +		ret = dev_err_probe(dev, PTR_ERR(sensor->regmap),
> +				    "Failed to init CCI\n");
> +		goto entity_cleanup;
> +	}
> +
>  	ret = ov5647_power_on(dev);
>  	if (ret)
>  		goto entity_cleanup;


