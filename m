Return-Path: <linux-media+bounces-25178-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE2BA19EBE
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 08:15:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E85E23A36B5
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 07:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ED371C5D7E;
	Thu, 23 Jan 2025 07:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CV74nb76"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95871C1F22;
	Thu, 23 Jan 2025 07:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737616528; cv=none; b=lgJgxjdROYsSTpglilkZtsboJb7A1dIIlQsP/NU4NbBbMaAwd5hq5PdirBXtsk6unS2JN+O9cL5r0IdnvXWYBg3enT4VCUGYjOlOfT9/F++FMw21IgnFojKPysNMEjVuUJzwDgYLIMcNAyhTuLgqy2m6yGZopcE5BgX7/h71mOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737616528; c=relaxed/simple;
	bh=8pjr+TBwGi5saKgrMMF6SqL98XOh0Wm1RuANfkeGhLI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=QEul8iCESEfl7pXUXOWFQLzzh/zNdFoNFLtJi0UX5p31WMdgZtnjWKkNLO0sRoTlRilrSHVbEmsul6udvl8t9cfrbyve/yWaZleb15wIBaxphms7gkchgSPA2cEFOkWyy1sKkBQa31vyFZAv2HcNERuVCHeY9jB6PT+t2Zpi/mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CV74nb76; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4B4FC3A4;
	Thu, 23 Jan 2025 08:14:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737616461;
	bh=8pjr+TBwGi5saKgrMMF6SqL98XOh0Wm1RuANfkeGhLI=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=CV74nb7692mwzBKjecefem6qFTFE6ygC17N/ll2IeMVWmBN4vMAzSlgkKXXQd02YG
	 9DkyMwe9jmlFdQ4GB3Pv5YGe68ar+qDpadSsPXV8cd/9rTcSrI0BO6yZCX4jyguCG3
	 lPdNAIL1lKYiNxbspoH28/Tw6xLbgOanIelFHJS0=
Message-ID: <aa8109f8-34f4-4680-a2ba-d62491661f66@ideasonboard.com>
Date: Thu, 23 Jan 2025 09:15:22 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] media: rcar-vin: Remove emulated SEQ_{TB,BT}
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20250122165353.1273739-1-niklas.soderlund+renesas@ragnatech.se>
 <20250122165353.1273739-2-niklas.soderlund+renesas@ragnatech.se>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <20250122165353.1273739-2-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 22/01/2025 18:53, Niklas Söderlund wrote:
> When the driver was converted from soc_camera software support for
> V4L2_FIELD_SEQ_TB and V4L2_FIELD_SEQ_BT where added. This was done by

s/where/were/

> capturing twice to the same VB2 buffer, but at different offsets.
> 
> This trend out to be a bad idea and it never really worked properly in

s/trend/turned/

> all situations. As the hardware can't support this mode natively remove
> trying to emulate it in software. It's still possible to capture TOP or
> BOTTOM fields separately or both ALTERNATING. If user-space wants the
> same  fields in the same buffer the same hack to capture twice to the
> same buffer can be done.
> 
> Removing this error prone emulated support pave ways in future work to
> simplify the internal buffer handling and making it less fragile, while
> enabling adding support for other features the hardware actually
> supports.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> * Changes since v1
> - Remove 'prev' variable in rvin_fill_hw_slot() which is no longer used,
>    but set.


I'm not really familiar with rcar-dma or this feature, but looks fine:

Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

  Tomi

> ---
>   .../platform/renesas/rcar-vin/rcar-dma.c      | 58 +++----------------
>   .../platform/renesas/rcar-vin/rcar-v4l2.c     |  7 ---
>   .../platform/renesas/rcar-vin/rcar-vin.h      | 18 ------
>   3 files changed, 7 insertions(+), 76 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> index 8773998101ff..a16adc6fd4dc 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> @@ -642,8 +642,6 @@ void rvin_scaler_gen3(struct rvin_dev *vin)
>   	case V4L2_FIELD_INTERLACED_TB:
>   	case V4L2_FIELD_INTERLACED_BT:
>   	case V4L2_FIELD_INTERLACED:
> -	case V4L2_FIELD_SEQ_TB:
> -	case V4L2_FIELD_SEQ_BT:
>   		clip_size |= vin->compose.height / 2;
>   		break;
>   	default:
> @@ -727,8 +725,6 @@ static int rvin_setup(struct rvin_dev *vin)
>   	case V4L2_FIELD_INTERLACED_BT:
>   		vnmc = VNMC_IM_FULL | VNMC_FOC;
>   		break;
> -	case V4L2_FIELD_SEQ_TB:
> -	case V4L2_FIELD_SEQ_BT:
>   	case V4L2_FIELD_NONE:
>   	case V4L2_FIELD_ALTERNATE:
>   		vnmc = VNMC_IM_ODD_EVEN;
> @@ -1021,33 +1017,14 @@ static void rvin_fill_hw_slot(struct rvin_dev *vin, int slot)
>   	struct rvin_buffer *buf;
>   	struct vb2_v4l2_buffer *vbuf;
>   	dma_addr_t phys_addr;
> -	int prev;
>   
>   	/* A already populated slot shall never be overwritten. */
>   	if (WARN_ON(vin->buf_hw[slot].buffer))
>   		return;
>   
> -	prev = (slot == 0 ? HW_BUFFER_NUM : slot) - 1;
> -
> -	if (vin->buf_hw[prev].type == HALF_TOP) {
> -		vbuf = vin->buf_hw[prev].buffer;
> -		vin->buf_hw[slot].buffer = vbuf;
> -		vin->buf_hw[slot].type = HALF_BOTTOM;
> -		switch (vin->format.pixelformat) {
> -		case V4L2_PIX_FMT_NV12:
> -		case V4L2_PIX_FMT_NV16:
> -			phys_addr = vin->buf_hw[prev].phys +
> -				vin->format.sizeimage / 4;
> -			break;
> -		default:
> -			phys_addr = vin->buf_hw[prev].phys +
> -				vin->format.sizeimage / 2;
> -			break;
> -		}
> -	} else if ((vin->state != STOPPED && vin->state != RUNNING) ||
> -		   list_empty(&vin->buf_list)) {
> +	if ((vin->state != STOPPED && vin->state != RUNNING) ||
> +	    list_empty(&vin->buf_list)) {
>   		vin->buf_hw[slot].buffer = NULL;
> -		vin->buf_hw[slot].type = FULL;
>   		phys_addr = vin->scratch_phys;
>   	} else {
>   		/* Keep track of buffer we give to HW */
> @@ -1056,16 +1033,12 @@ static void rvin_fill_hw_slot(struct rvin_dev *vin, int slot)
>   		list_del_init(to_buf_list(vbuf));
>   		vin->buf_hw[slot].buffer = vbuf;
>   
> -		vin->buf_hw[slot].type =
> -			V4L2_FIELD_IS_SEQUENTIAL(vin->format.field) ?
> -			HALF_TOP : FULL;
> -
>   		/* Setup DMA */
>   		phys_addr = vb2_dma_contig_plane_dma_addr(&vbuf->vb2_buf, 0);
>   	}
>   
> -	vin_dbg(vin, "Filling HW slot: %d type: %d buffer: %p\n",
> -		slot, vin->buf_hw[slot].type, vin->buf_hw[slot].buffer);
> +	vin_dbg(vin, "Filling HW slot: %d buffer: %p\n",
> +		slot, vin->buf_hw[slot].buffer);
>   
>   	vin->buf_hw[slot].phys = phys_addr;
>   	rvin_set_slot_addr(vin, slot, phys_addr);
> @@ -1073,15 +1046,12 @@ static void rvin_fill_hw_slot(struct rvin_dev *vin, int slot)
>   
>   static int rvin_capture_start(struct rvin_dev *vin)
>   {
> -	int slot, ret;
> +	int ret;
>   
> -	for (slot = 0; slot < HW_BUFFER_NUM; slot++) {
> +	for (unsigned int slot = 0; slot < HW_BUFFER_NUM; slot++) {
>   		vin->buf_hw[slot].buffer = NULL;
> -		vin->buf_hw[slot].type = FULL;
> -	}
> -
> -	for (slot = 0; slot < HW_BUFFER_NUM; slot++)
>   		rvin_fill_hw_slot(vin, slot);
> +	}
>   
>   	ret = rvin_setup(vin);
>   	if (ret)
> @@ -1162,16 +1132,6 @@ static irqreturn_t rvin_irq(int irq, void *data)
>   
>   	/* Capture frame */
>   	if (vin->buf_hw[slot].buffer) {
> -		/*
> -		 * Nothing to do but refill the hardware slot if
> -		 * capture only filled first half of vb2 buffer.
> -		 */
> -		if (vin->buf_hw[slot].type == HALF_TOP) {
> -			vin->buf_hw[slot].buffer = NULL;
> -			rvin_fill_hw_slot(vin, slot);
> -			goto done;
> -		}
> -
>   		vin->buf_hw[slot].buffer->field =
>   			rvin_get_active_field(vin, vnms);
>   		vin->buf_hw[slot].buffer->sequence = vin->sequence;
> @@ -1322,8 +1282,6 @@ static int rvin_mc_validate_format(struct rvin_dev *vin, struct v4l2_subdev *sd,
>   	case V4L2_FIELD_INTERLACED_TB:
>   	case V4L2_FIELD_INTERLACED_BT:
>   	case V4L2_FIELD_INTERLACED:
> -	case V4L2_FIELD_SEQ_TB:
> -	case V4L2_FIELD_SEQ_BT:
>   		/* Supported natively */
>   		break;
>   	case V4L2_FIELD_ALTERNATE:
> @@ -1336,8 +1294,6 @@ static int rvin_mc_validate_format(struct rvin_dev *vin, struct v4l2_subdev *sd,
>   		case V4L2_FIELD_INTERLACED_TB:
>   		case V4L2_FIELD_INTERLACED_BT:
>   		case V4L2_FIELD_INTERLACED:
> -		case V4L2_FIELD_SEQ_TB:
> -		case V4L2_FIELD_SEQ_BT:
>   			/* Use VIN hardware to combine the two fields */
>   			fmt.format.height *= 2;
>   			break;
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
> index 756fdfdbce61..a5763f1c5784 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
> @@ -161,9 +161,6 @@ static u32 rvin_format_bytesperline(struct rvin_dev *vin,
>   		break;
>   	}
>   
> -	if (V4L2_FIELD_IS_SEQUENTIAL(pix->field))
> -		align = 0x80;
> -
>   	return ALIGN(pix->width, align) * fmt->bpp;
>   }
>   
> @@ -194,8 +191,6 @@ static void rvin_format_align(struct rvin_dev *vin, struct v4l2_pix_format *pix)
>   	case V4L2_FIELD_INTERLACED_BT:
>   	case V4L2_FIELD_INTERLACED:
>   	case V4L2_FIELD_ALTERNATE:
> -	case V4L2_FIELD_SEQ_TB:
> -	case V4L2_FIELD_SEQ_BT:
>   		break;
>   	default:
>   		pix->field = RVIN_DEFAULT_FIELD;
> @@ -504,8 +499,6 @@ static int rvin_remote_rectangle(struct rvin_dev *vin, struct v4l2_rect *rect)
>   		case V4L2_FIELD_INTERLACED_TB:
>   		case V4L2_FIELD_INTERLACED_BT:
>   		case V4L2_FIELD_INTERLACED:
> -		case V4L2_FIELD_SEQ_TB:
> -		case V4L2_FIELD_SEQ_BT:
>   			rect->height *= 2;
>   			break;
>   		}
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
> index f87d4bc9e53e..d5763462809a 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
> @@ -77,23 +77,6 @@ enum rvin_dma_state {
>   	SUSPENDED,
>   };
>   
> -/**
> - * enum rvin_buffer_type
> - *
> - * Describes how a buffer is given to the hardware. To be able
> - * to capture SEQ_TB/BT it's needed to capture to the same vb2
> - * buffer twice so the type of buffer needs to be kept.
> - *
> - * @FULL: One capture fills the whole vb2 buffer
> - * @HALF_TOP: One capture fills the top half of the vb2 buffer
> - * @HALF_BOTTOM: One capture fills the bottom half of the vb2 buffer
> - */
> -enum rvin_buffer_type {
> -	FULL,
> -	HALF_TOP,
> -	HALF_BOTTOM,
> -};
> -
>   /**
>    * struct rvin_video_format - Data format stored in memory
>    * @fourcc:	Pixelformat
> @@ -237,7 +220,6 @@ struct rvin_dev {
>   	spinlock_t qlock;
>   	struct {
>   		struct vb2_v4l2_buffer *buffer;
> -		enum rvin_buffer_type type;
>   		dma_addr_t phys;
>   	} buf_hw[HW_BUFFER_NUM];
>   	struct list_head buf_list;


