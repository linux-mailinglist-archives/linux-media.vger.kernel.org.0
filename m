Return-Path: <linux-media+bounces-54951-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHt4AGPFrmn2IgIAu9opvQ
	(envelope-from <linux-media+bounces-54951-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 14:04:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD57239628
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 14:04:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B63D530817E9
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2026 12:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FAEC186E2E;
	Mon,  9 Mar 2026 12:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="mgeMygLn"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A81A3BE171;
	Mon,  9 Mar 2026 12:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773061187; cv=none; b=nttLPWTkJSKdgB1GwjLwgHOVSzm3kdEHlssL5X3DHJliyn+VNrkd+m+8p44zB+XrLiTE+UUbBPN5wpbaQHaB+CvV2EgHBg8RMilhpc6q83DbHOZ7PFYonAQhF/L0GgWN7vzJbFpvSoVO6kCVL/G77CrS4VswFsAisjoKhwGi/Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773061187; c=relaxed/simple;
	bh=eOXbo5HHHQ04hilmOM4PTKHyBzobG/10cdQ6zVVfahc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EpvMSFjJaiXsX0L5ExkuziYCkmZRHmmj8GV+6Vj9nC6Ouj57Tyi0oa9P6RyC99O1w/hu64dIa+ksbC32/MeUlhxYvnh8cd9Lxc4JDaUfDa9SQwxD2OvQezE1TlyYK3vtFe4WhKc1TenvWLbXNtULrymsjeIhbrxl43BbjdeZoXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=mgeMygLn; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0EeHDS9pwEYchJ5ftiuQwHQ2CFunSUH5KPHRIIlTEnM=; b=mgeMygLnhvQeS3mPKdD3hx/qWQ
	sLcGXf87KPVRyEMdVOYEfgm5ViFqyvdyKonju3UlsZLND+E0oRyM0VVLKSBp4sGDvGNkCzKeGk0fL
	cUk0tACzvhN8DyTJxtZNf9jQptvcU0bvyna4LKlidDX/TFH3HO+/hE+40NeEjTtKsXrpg+7fXrsMD
	OpYwzwksoG8aFpLyJTukLRZtJyPO+eXaN9zKPIaZIavKMFJzr1Nx9cXwBg+qNuxUbNo9D5QsPbLz0
	j7QHNiL+6SAN4PAh++c39h7pNGZusxokk+/tOQc3SCvBar9cFMsnlajg2XCHk4OJ7hRvN70mLAp4P
	KoF7x77A==;
Received: from gwsc.sc.usp.br ([143.107.225.16] helo=[172.24.18.111])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1vzaCb-00C3Dx-SY; Mon, 09 Mar 2026 13:59:18 +0100
Message-ID: <f65f6e40-39f4-4744-bd92-46b38618c6f9@igalia.com>
Date: Mon, 9 Mar 2026 09:59:06 -0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/6] media: platform: Add Raspberry Pi HEVC decoder
 driver
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, John Cox
 <john.cox@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>,
 review list <kernel-list@raspberrypi.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 John Cox <jc@kynesim.co.uk>, Stefan Wahren <wahrenst@gmx.net>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20260304-media-rpi-hevc-dec-v6-0-93868ae6dff8@raspberrypi.com>
 <20260304-media-rpi-hevc-dec-v6-5-93868ae6dff8@raspberrypi.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Autocrypt: addr=mcanal@igalia.com; keydata=
 xsBNBGcCwywBCADgTji02Sv9zjHo26LXKdCaumcSWglfnJ93rwOCNkHfPIBll85LL9G0J7H8
 /PmEL9y0LPo9/B3fhIpbD8VhSy9Sqz8qVl1oeqSe/rh3M+GceZbFUPpMSk5pNY9wr5raZ63d
 gJc1cs8XBhuj1EzeE8qbP6JAmsL+NMEmtkkNPfjhX14yqzHDVSqmAFEsh4Vmw6oaTMXvwQ40
 SkFjtl3sr20y07cJMDe++tFet2fsfKqQNxwiGBZJsjEMO2T+mW7DuV2pKHr9aifWjABY5EPw
 G7qbrh+hXgfT+njAVg5+BcLz7w9Ju/7iwDMiIY1hx64Ogrpwykj9bXav35GKobicCAwHABEB
 AAHNIE1hw61yYSBDYW5hbCA8bWNhbmFsQGlnYWxpYS5jb20+wsCRBBMBCAA7FiEE+ORdfQEW
 dwcppnfRP/MOinaI+qoFAmcCwywCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQ
 P/MOinaI+qoUBQgAqz2gzUP7K3EBI24+a5FwFlruQGtim85GAJZXToBtzsfGLLVUSCL3aF/5
 O335Bh6ViSBgxmowIwVJlS/e+L95CkTGzIIMHgyUZfNefR2L3aZA6cgc9z8cfow62Wu8eXnq
 GM/+WWvrFQb/dBKKuohfBlpThqDWXxhozazCcJYYHradIuOM8zyMtCLDYwPW7Vqmewa+w994
 7Lo4CgOhUXVI2jJSBq3sgHEPxiUBOGxvOt1YBg7H9C37BeZYZxFmU8vh7fbOsvhx7Aqu5xV7
 FG+1ZMfDkv+PixCuGtR5yPPaqU2XdjDC/9mlRWWQTPzg74RLEw5sz/tIHQPPm6ROCACFls7A
 TQRnAsMsAQgAxTU8dnqzK6vgODTCW2A6SAzcvKztxae4YjRwN1SuGhJR2isJgQHoOH6oCItW
 Xc1CGAWnci6doh1DJvbbB7uvkQlbeNxeIz0OzHSiB+pb1ssuT31Hz6QZFbX4q+crregPIhr+
 0xeDi6Mtu+paYprI7USGFFjDUvJUf36kK0yuF2XUOBlF0beCQ7Jhc+UoI9Akmvl4sHUrZJzX
 LMeajARnSBXTcig6h6/NFVkr1mi1uuZfIRNCkxCE8QRYebZLSWxBVr3h7dtOUkq2CzL2kRCK
 T2rKkmYrvBJTqSvfK3Ba7QrDg3szEe+fENpL3gHtH6h/XQF92EOulm5S5o0I+ceREwARAQAB
 wsB2BBgBCAAgFiEE+ORdfQEWdwcppnfRP/MOinaI+qoFAmcCwywCGwwACgkQP/MOinaI+qpI
 zQf+NAcNDBXWHGA3lgvYvOU31+ik9bb30xZ7IqK9MIi6TpZqL7cxNwZ+FAK2GbUWhy+/gPkX
 it2gCAJsjo/QEKJi7Zh8IgHN+jfim942QZOkU+p/YEcvqBvXa0zqW0sYfyAxkrf/OZfTnNNE
 Tr+uBKNaQGO2vkn5AX5l8zMl9LCH3/Ieaboni35qEhoD/aM0Kpf93PhCvJGbD4n1DnRhrxm1
 uEdQ6HUjWghEjC+Jh9xUvJco2tUTepw4OwuPxOvtuPTUa1kgixYyG1Jck/67reJzMigeuYFt
 raV3P8t/6cmtawVjurhnCDuURyhUrjpRhgFp+lW8OGr6pepHol/WFIOQEg==
In-Reply-To: <20260304-media-rpi-hevc-dec-v6-5-93868ae6dff8@raspberrypi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4FD57239628
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-54951-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[collabora.com,kynesim.co.uk,gmx.net,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.197];
	FROM_NEQ_ENVFROM(0.00)[mcanal@igalia.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,igalia.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,free-electrons.com:email,raspberrypi.com:email]
X-Rspamd-Action: no action

Hi Dave,

On 3/4/26 11:05, Dave Stevenson wrote:
> From: John Cox <john.cox@raspberrypi.com>
> 
> The BCM2711 and BCM2712 SoCs used on Rapsberry Pi 4 and Raspberry

s/Rapsberry/Raspberry

> diff --git a/drivers/media/platform/raspberrypi/hevc_dec/Kconfig b/drivers/media/platform/raspberrypi/hevc_dec/Kconfig
> new file mode 100644
> index 000000000000..ae1fd079e5c9
> --- /dev/null
> +++ b/drivers/media/platform/raspberrypi/hevc_dec/Kconfig
> @@ -0,0 +1,17 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +config VIDEO_RPI_HEVC_DEC
> +	tristate "Rasperry Pi HEVC decoder"

s/Rapsberry/Raspberry

> +	depends on VIDEO_DEV && VIDEO_DEV

VIDEO_DEV is listed twice.


[...]

> +
> +/*
> + * Stop the clock for this context
> + * clk_disable_unprepare does ref counting so this will not actually
> + * disable the clock if there are other running contexts
> + */
> +void hevc_d_hw_stop_clock(struct hevc_d_dev *dev)

I believe it would be more idiomatic if you use runtime PM to handle
this stop_clock()/start_clock() semantics.

> +{
> +	clk_disable_unprepare(dev->clock);

In the case that the clock is actually disabled (no other running
contexts), I believe the IRQs should be also disabled before disabling
the clock.

> +}
> +
> +/* Always starts the clock if it isn't already on this ctx */
> +int hevc_d_hw_start_clock(struct hevc_d_dev *dev)
> +{
> +	int rv;
> +
> +	rv = clk_set_min_rate(dev->clock, dev->max_clock_rate);
> +	if (rv) {
> +		dev_err(dev->dev, "Failed to set clock rate\n");
> +		return rv;
> +	}

After I land [1], you will be able to drop this call and just add
`maximize = true` to the HEVC clock.

[1] 
https://lore.kernel.org/dri-devel/20260218-v3d-power-management-v6-1-40683fd39865@igalia.com/

> +
> +	rv = clk_prepare_enable(dev->clock);
> +	if (rv) {
> +		dev_err(dev->dev, "Failed to enable clock\n");
> +		return rv;
> +	}

Considering that the clock was disabled, I believe you should re-enable
IRQs and reset any pending interrupts here, just like you do in
hw_setup().

> +	return 0;
> +}
> +

[...]

> diff --git a/drivers/media/platform/raspberrypi/hevc_dec/hevc_d_video.c b/drivers/media/platform/raspberrypi/hevc_dec/hevc_d_video.c
> new file mode 100644
> index 000000000000..d39a2e228595
> --- /dev/null
> +++ b/drivers/media/platform/raspberrypi/hevc_dec/hevc_d_video.c
> @@ -0,0 +1,634 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Raspberry Pi HEVC driver
> + *
> + * Copyright (C) 2026 Raspberry Pi Ltd
> + *
> + * Based on the Cedrus VPU driver, that is:
> + *
> + * Copyright (C) 2016 Florent Revest <florent.revest@free-electrons.com>
> + * Copyright (C) 2018 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> + * Copyright (C) 2018 Bootlin
> + */
> +
> +#include <media/videobuf2-dma-contig.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-ioctl.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-mem2mem.h>
> +
> +#include "hevc_d.h"
> +#include "hevc_d_h265.h"
> +#include "hevc_d_hw.h"
> +#include "hevc_d_video.h"
> +
> +static inline struct hevc_d_ctx *hevc_d_file2ctx(struct file *file)
> +{
> +	return container_of(file->private_data, struct hevc_d_ctx, fh);
> +}
> +
> +/* constrain x to y,y*2 */
> +static inline unsigned int constrain2x(unsigned int x, unsigned int y)
> +{
> +	return (x < y) ?
> +			y :
> +			(x > y * 2) ? y : x;
> +}

constrain2x() doesn't seem to be used anywhere in the driver.

[...]

> +
> +void hevc_d_prepare_src_format(struct v4l2_pix_format_mplane *pix_fmt)
> +{
> +	size_t size;
> +	u32 w;
> +	u32 h;
> +
> +	w = pix_fmt->width;
> +	h = pix_fmt->height;
> +	if (!w || !h) {
> +		w = HEVC_D_DEFAULT_WIDTH;
> +		h = HEVC_D_DEFAULT_HEIGHT;
> +	}
> +	if (w > HEVC_D_MAX_WIDTH)
> +		w = HEVC_D_MAX_WIDTH;
> +	if (h > HEVC_D_MAX_HEIGHT)
> +		h = HEVC_D_MAX_HEIGHT;
> +
> +	if (!pix_fmt->plane_fmt[0].sizeimage ||
> +	    pix_fmt->plane_fmt[0].sizeimage > SZ_32M) {
> +		/* Unspecified or way too big - pick max for size */
> +		size = hevc_d_bit_buf_size(w, h, 2);
> +	}
> +	/* Set a minimum */
> +	size = max_t(u32, SZ_4K, pix_fmt->plane_fmt[0].sizeimage);

The size computed by hevc_d_bit_buf_size() inside the if-block is
immediately overwritten here unconditionally.

Should the else case be explicit? Something like:

     if (!pix_fmt->plane_fmt[0].sizeimage ||
         pix_fmt->plane_fmt[0].sizeimage > SZ_32M) {
         size = hevc_d_bit_buf_size(w, h, 2);
     } else {
         size = pix_fmt->plane_fmt[0].sizeimage;
     }
     size = max_t(u32, SZ_4K, size);

[...]

> +
> +static int hevc_d_start_streaming(struct vb2_queue *vq, unsigned int count)
> +{
> +	struct hevc_d_ctx *ctx = vb2_get_drv_priv(vq);
> +	struct hevc_d_dev *dev = ctx->dev;
> +	int ret = 0;
> +
> +	v4l2_m2m_update_start_streaming_state(ctx->fh.m2m_ctx, vq);
> +
> +	if (V4L2_TYPE_IS_OUTPUT(vq->type)) {
> +		ret = hevc_d_hw_start_clock(dev);
> +		if (ret)
> +			goto fail_cleanup;
> +
> +		ret = hevc_d_h265_start(ctx);
> +		if (ret)
> +			goto fail_stop_clock;
> +	}
> +
> +	return 0;
> +
> +fail_stop_clock:
> +	hevc_d_hw_stop_clock(dev);
> +fail_cleanup:
> +	v4l2_err(&dev->v4l2_dev, "%s: qtype=%d: FAIL\n", __func__, vq->type);
> +	hevc_d_queue_cleanup(vq, VB2_BUF_STATE_QUEUED);
> +	return ret;
> +}
> +
> +static void hevc_d_stop_streaming(struct vb2_queue *vq)
> +{
> +	struct hevc_d_ctx *ctx = vb2_get_drv_priv(vq);
> +	struct hevc_d_dev *dev = ctx->dev;
> +
> +	if (V4L2_TYPE_IS_OUTPUT(vq->type)) {
> +		hevc_d_h265_stop(ctx);
> +		hevc_d_hw_stop_clock(dev);
> +	}
> +
> +	hevc_d_queue_cleanup(vq, VB2_BUF_STATE_ERROR);
> +
> +	vb2_wait_for_all_buffers(vq);
> +
> +	v4l2_m2m_update_stop_streaming_state(ctx->fh.m2m_ctx, vq);

The order here looks a bit odd to me. Shouldn't we stop the clock after
we stop the streaming state and wait for all buffers?

Best regards,
- Maíra

