Return-Path: <linux-media+bounces-22671-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B92319E500C
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 09:44:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92F60169B2D
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 08:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA01C1D5176;
	Thu,  5 Dec 2024 08:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ePFsCg30"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953691D515A
	for <linux-media@vger.kernel.org>; Thu,  5 Dec 2024 08:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733388230; cv=none; b=BvUx06/ooItMuU1hi7Uma0AZQuybEsmhkTruIvcxkGBOIRHUcsxqjcfzdtTvtlwZqutQ1zS/17w5bnIb/RrTDGyryeuQQlnEDaVlr5vZkhrn26b30DAmjAH8QDJsTQDaFrRxFY7A38XhFzPKLbsV2+Q8GuGuLVUqt8DJC7iwXDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733388230; c=relaxed/simple;
	bh=UjbADopb4Kas7ct5ynshIPrw2H7AE3IxfW+HxRlJTN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cuZqbs/+eWD16Svp08tOm/guPJlolOe/7aA0M+HgQvWrd9v0LN5clTVCIsoLlzB5UjHNna/VRf2+NoXW6fTCli4+0cnZFujZQF1z5CrXg1kzfUR7IiRBv9c9VXVQ8CGZBhk/0ytsAqbu6KDU8ZGg1GQd58Z6jN4wuX+sqcx7ysw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ePFsCg30; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2001:b07:6462:5de2:459e:1ee6:26ea:2d31])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1642C7E2;
	Thu,  5 Dec 2024 09:43:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733388191;
	bh=UjbADopb4Kas7ct5ynshIPrw2H7AE3IxfW+HxRlJTN8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ePFsCg30yrepOre1JiYm/yaM3BMWK58cVB9/DZha2+JHqd9zkCx7pVqD092aTKTmY
	 Dq8YSzAFHwMyAn1hTfrHRT2D5vggH2Gqbprs3aWY6fLS2yItjNA+MDjGw5/FA0lh7i
	 mGLykdg5xxvNgdrtCmnAW2sUy6xE1TZYDDv+kTrc=
Date: Thu, 5 Dec 2024 09:43:35 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hverkuil@xs4all.nl, 
	laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>, 
	Kate Hsuan <hpa@redhat.com>, Alexander Shiyan <eagle.alexander923@gmail.com>, 
	Mikhail Rudenko <mike.rudenko@gmail.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, Umang Jain <umang.jain@ideasonboard.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, 
	Naushir Patuck <naush@raspberrypi.com>, "Yan, Dongcheng" <dongcheng.yan@intel.com>, 
	"Cao, Bingbu" <bingbu.cao@intel.com>, "Qiu, Tian Shu" <tian.shu.qiu@intel.com>, 
	"Wang, Hongju" <hongju.wang@intel.com>, Stefan Klug <stefan.klug@ideasonboard.com>, 
	Mirela Rabulea <mirela.rabulea@nxp.com>, =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, 
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: Re: [RFC v3 6/9] media: uapi: Add V4L2_CID_CONFIG_MODEL control
Message-ID: <xn6tlmb5ntq63mgss263ezicnniuhy6553sr4bhp2iav5hz4fs@tlnp2hhpzd52>
References: <20241129095142.87196-1-sakari.ailus@linux.intel.com>
 <20241129095142.87196-7-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241129095142.87196-7-sakari.ailus@linux.intel.com>

Hi Sakari

On Fri, Nov 29, 2024 at 11:51:39AM +0200, Sakari Ailus wrote:
> Add the V4L2_CID_CONFIG_MODEL control for the configuration model.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../userspace-api/media/v4l/ext-ctrls-image-process.rst      | 4 ++++
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c                    | 5 +++++
>  include/uapi/linux/v4l2-controls.h                           | 3 +++
>  3 files changed, 12 insertions(+)
>
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> index 27803dca8d3e..928e8e3eed7f 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst

I was initially not sure this belongs to "Image process" controls, but
having had a look at the existing ones I'm not sure there are better
places.

I would have considered "Camera Controls" but I'm not sure it's -that-
better

> @@ -55,3 +55,7 @@ Image Process Control IDs
>      control value divided by e.g. 0x100, meaning that to get no
>      digital gain the control value needs to be 0x100. The no-gain
>      configuration is also typically the default.
> +
> +``V4L2_CID_CONFIG_MODEL (bitmask)``
> +    Which configuration models the sub-device supports. Please see
> +    :ref:`media_subdev_config_model`.

Other RO controls in the file (such as PIXEL_RATE) specify "this
control is read-only"

> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> index 1ea52011247a..24c9c25e20d1 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -1164,6 +1164,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_TEST_PATTERN:		return "Test Pattern";
>  	case V4L2_CID_DEINTERLACING_MODE:	return "Deinterlacing Mode";
>  	case V4L2_CID_DIGITAL_GAIN:		return "Digital Gain";
> +	case V4L2_CID_CONFIG_MODEL:		return "Sub-device configuration model";
>
>  	/* DV controls */
>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> @@ -1481,6 +1482,10 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  	case V4L2_CID_DV_RX_POWER_PRESENT:
>  		*type = V4L2_CTRL_TYPE_BITMASK;
>  		break;
> +	case V4L2_CID_CONFIG_MODEL:
> +		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +		*type = V4L2_CTRL_TYPE_BITMASK;
> +		break;
>  	case V4L2_CID_MIN_BUFFERS_FOR_CAPTURE:
>  	case V4L2_CID_MIN_BUFFERS_FOR_OUTPUT:
>  		*type = V4L2_CTRL_TYPE_INTEGER;
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 974fd254e573..0152240229ab 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1225,6 +1225,9 @@ enum v4l2_jpeg_chroma_subsampling {
>  #define V4L2_CID_TEST_PATTERN			(V4L2_CID_IMAGE_PROC_CLASS_BASE + 3)
>  #define V4L2_CID_DEINTERLACING_MODE		(V4L2_CID_IMAGE_PROC_CLASS_BASE + 4)
>  #define V4L2_CID_DIGITAL_GAIN			(V4L2_CID_IMAGE_PROC_CLASS_BASE + 5)
> +#define V4L2_CID_CONFIG_MODEL			(V4L2_CID_IMAGE_PROC_CLASS_BASE + 6)
> +
> +#define V4L2_CID_CONFIG_MODEL_COMMON_RAW	(1ULL << 0)

I wonder if "COMMON_" couldn't be removed.

Anyway, all nits or mostly questions, whatever is fine really
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

>
>  /*  DV-class control IDs defined by V4L2 */
>  #define V4L2_CID_DV_CLASS_BASE			(V4L2_CTRL_CLASS_DV | 0x900)
> --
> 2.39.5
>
>

