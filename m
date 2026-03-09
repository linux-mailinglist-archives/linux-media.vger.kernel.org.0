Return-Path: <linux-media+bounces-54965-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIPGBtDkrmmsJwIAu9opvQ
	(envelope-from <linux-media+bounces-54965-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 16:18:40 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D24623B83A
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 16:18:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 91D2F30A5287
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2026 15:13:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A986F3A961A;
	Mon,  9 Mar 2026 15:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kynesim.co.uk header.i=@kynesim.co.uk header.b="u9kS5GoN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E043D4100
	for <linux-media@vger.kernel.org>; Mon,  9 Mar 2026 15:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773069213; cv=none; b=AuPlxXAdSzZDiA7N+MizQ4I1Jm//DHF2ikIRhf7KyrsI5G2lXmWN/5oPGd99lbWDZIv9eF4D9H835bE58Mn2DNQY3FLo/IZZbcMT3ZRRfUf7umb7vAoueKJh+gEFvSjOEVVHt04en9EVmJPn09I0BMKOZiHzSUHm0Tzmh//oLbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773069213; c=relaxed/simple;
	bh=mVxr2Vw4Zk1kAgLJ2mR35vYaEWfrmi4QB1Hy8BIJM24=;
	h=From:To:Cc:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=PkV5CLAams216TbD5SjRnZehIUPGqWdyOY+lCjjnqtfBLaXfcXkVCorDKDqOzIh0CTFoC5nQWnu9kabW+i8t9uGxFAuEfj2BNOU0qzPi+bTyDe/DlwO+PyeZ7qV780XccAlzItl8OFxFa01NA3N5mTbLbPfkJnFMmkz//XRA1Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kynesim.co.uk; spf=pass smtp.mailfrom=kynesim.co.uk; dkim=pass (2048-bit key) header.d=kynesim.co.uk header.i=@kynesim.co.uk header.b=u9kS5GoN; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kynesim.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kynesim.co.uk
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso108021825e9.3
        for <linux-media@vger.kernel.org>; Mon, 09 Mar 2026 08:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim.co.uk; s=google; t=1773069210; x=1773674010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:user-agent:in-reply-to
         :references:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=j3dPRMbHhjlBqmmhnyVPSXrV9NMmStYxWYwctCoc6i0=;
        b=u9kS5GoNXtMUv1QJRrR/I44MRlBZZrtbyfqoV3U+xsojFlrWkAjLndDWOU2ODbPNl5
         30bc+iZOH8vcznrpS2PBxodehga0tqqRIDy303jpbHvXFTy7uma34VUhSHsS6Jr/MWTd
         kpjxcyp0iwJhtHrdvfGNnLuUIndUChWAGRNlsyC0nEdcoAr5IVFJxSBxuPEXWJzO0IdU
         67MdvvxIhNalQh6W6b8YZLUyhtHPrI9AblpcD0/PjZ2+hssIM22QJGoog/A5VmesC4H1
         /EQxg1eMTEiYCj0RSpNx/WXAJ9/neRM8Di3qE61lQeiRFgT3WXHw4XbvWrmt3cqSCgDH
         nY1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773069210; x=1773674010;
        h=content-transfer-encoding:mime-version:user-agent:in-reply-to
         :references:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j3dPRMbHhjlBqmmhnyVPSXrV9NMmStYxWYwctCoc6i0=;
        b=D7yM7lycr/yYuzNy/Vdv5uspA/ChCobyLOsNiag633xW7uaznH4jDWTivIjJ4LnDCZ
         hK2wCTt5eBhbXhGugp4ihaZgT0dfrmu/opqHs5N+LLlJzS7ZqCvQDSKO9V3i3XiRP7J1
         XClQDYwCbzP4JSPI7jExtLilt9TDncVEJLNPPshQIT+RHiFI1/w4xnbg9X5N0Nek+LBC
         nsEnlqe9M9p8yRP784lQ2gG3RsH0o05eaBvRSq7CJbW78b7ghE2+EQBNLzbKYZ+6FB6x
         EGbvj7+QB4C7Mm6fhCI9ZXXIU/XEjcQf4JsPbEcxen30ZiOoArDiXGH+5cJE8RhHkwU1
         Yzug==
X-Forwarded-Encrypted: i=1; AJvYcCX035oEFyVx3m1COYv7Jc/8dxlBLG3HrppVc+zIeUXKmtIYxZKhy6DaWE5QOeFkDqnQ0NL/HGonDXK+ng==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz89KrRhB+3ESdjDVqM1W/xaz+weA2sURL+trOUxEUGs09fFj3G
	oLdtstQlyKVmXzk13S03bFt8WbOe3/ujMI7vXEj5IuBTbqkSQxnlAYWVFnlCJfH2xaY=
X-Gm-Gg: ATEYQzyZb0b7cIsSI3txAKuXIH+0+62KSPVdXReYiro+OUfeZhdBnk95EHUMGbXJHQJ
	U7RN2sFoyoanINFXAJ1s7DdN6OctExpqt5JbOxXaEiULRFc8TrrN9izCPV/aa7quObvJBsJYEOU
	J5iuViZGM4QCShBSIV2quuksnXfTJtGHbvbA8VLDjsHE4wO0nZwMZZXRnGUSw53htXOc7VrmIBk
	Yw+v1cTPASjYEe5aGv9X1e3ZpRGYrn3owmbtspq9EiuFQxy3tj7Umc58djoMsmikZn274Xdq+4m
	neu2blHsOYX3yW/PyatFQDsEh9MFdVqqpYlE8fxPXmix8B20I44upeBol2hXNUWTVCnzMSSVsli
	sgppKWe7sCbmcBz+tboc+1/JyFlC38MQjm6j6R5fHyqi659LhQ+pWNW3ygEjS/SMM/3fQX64qJM
	0HDExBMmEM11vpgzPagjFWg6miFUO8rYK4ubXPBxF+CI+vBtjsdNjw8VCZuaYxU5affOhzQpI4a
	odaXj52pRRtW1+R5M/GOVO1s8hR3ieR
X-Received: by 2002:a05:600c:358e:b0:485:3ec6:e634 with SMTP id 5b1f17b1804b1-4853ec6e713mr39780495e9.15.1773069209257;
        Mon, 09 Mar 2026 08:13:29 -0700 (PDT)
Received: from CTHALPA.outer.uphall.net (cpc92886-cmbg20-2-0-cust122.5-4.cable.virginm.net. [82.20.18.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8ec97sm30024898f8f.5.2026.03.09.08.13.28
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Mon, 09 Mar 2026 08:13:28 -0700 (PDT)
From: John Cox <jc@kynesim.co.uk>
To: =?utf-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, John Cox <john.cox@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>, review list <kernel-list@raspberrypi.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, Stefan Wahren <wahrenst@gmx.net>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 5/6] media: platform: Add Raspberry Pi HEVC decoder driver
Date: Mon, 09 Mar 2026 15:13:27 +0000
Message-ID: <0nntqkl5vfiobr911s4fehl8sj9g6iidkc@4ax.com>
References: <20260304-media-rpi-hevc-dec-v6-0-93868ae6dff8@raspberrypi.com> <20260304-media-rpi-hevc-dec-v6-5-93868ae6dff8@raspberrypi.com> <f65f6e40-39f4-4744-bd92-46b38618c6f9@igalia.com>
In-Reply-To: <f65f6e40-39f4-4744-bd92-46b38618c6f9@igalia.com>
User-Agent: ForteAgent/8.00.32.1272
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 6D24623B83A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kynesim.co.uk,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kynesim.co.uk:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-54965-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[raspberrypi.com,linux.intel.com,ideasonboard.com,kernel.org,broadcom.com,vanguardiasur.com.ar,collabora.com,gmx.net,vger.kernel.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jc@kynesim.co.uk,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kynesim.co.uk:+];
	NEURAL_HAM(-0.00)[-0.990];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,bootlin.com:email,4ax.com:mid,kynesim.co.uk:dkim,raspberrypi.com:email]
X-Rspamd-Action: no action

Hi

>Hi Dave,
>
>On 3/4/26 11:05, Dave Stevenson wrote:
>> From: John Cox <john.cox@raspberrypi.com>
>>=20
>> The BCM2711 and BCM2712 SoCs used on Rapsberry Pi 4 and Raspberry
>
>s/Rapsberry/Raspberry
>
>> diff --git a/drivers/media/platform/raspberrypi/hevc_dec/Kconfig =
b/drivers/media/platform/raspberrypi/hevc_dec/Kconfig
>> new file mode 100644
>> index 000000000000..ae1fd079e5c9
>> --- /dev/null
>> +++ b/drivers/media/platform/raspberrypi/hevc_dec/Kconfig
>> @@ -0,0 +1,17 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +
>> +config VIDEO_RPI_HEVC_DEC
>> +	tristate "Rasperry Pi HEVC decoder"
>
>s/Rapsberry/Raspberry
>
>> +	depends on VIDEO_DEV && VIDEO_DEV
>
>VIDEO_DEV is listed twice.
>
>
>[...]
>
>> +
>> +/*
>> + * Stop the clock for this context
>> + * clk_disable_unprepare does ref counting so this will not actually
>> + * disable the clock if there are other running contexts
>> + */
>> +void hevc_d_hw_stop_clock(struct hevc_d_dev *dev)
>
>I believe it would be more idiomatic if you use runtime PM to handle
>this stop_clock()/start_clock() semantics.
>
>> +{
>> +	clk_disable_unprepare(dev->clock);
>
>In the case that the clock is actually disabled (no other running
>contexts), I believe the IRQs should be also disabled before disabling
>the clock.

I'll fix that

>> +}
>> +
>> +/* Always starts the clock if it isn't already on this ctx */
>> +int hevc_d_hw_start_clock(struct hevc_d_dev *dev)
>> +{
>> +	int rv;
>> +
>> +	rv =3D clk_set_min_rate(dev->clock, dev->max_clock_rate);
>> +	if (rv) {
>> +		dev_err(dev->dev, "Failed to set clock rate\n");
>> +		return rv;
>> +	}
>
>After I land [1], you will be able to drop this call and just add
>`maximize =3D true` to the HEVC clock.
>
>[1]=20
>https://lore.kernel.org/dri-devel/20260218-v3d-power-management-v6-1-406=
83fd39865@igalia.com/
>
>> +
>> +	rv =3D clk_prepare_enable(dev->clock);
>> +	if (rv) {
>> +		dev_err(dev->dev, "Failed to enable clock\n");
>> +		return rv;
>> +	}
>
>Considering that the clock was disabled, I believe you should re-enable
>IRQs and reset any pending interrupts here, just like you do in
>hw_setup().
>
>> +	return 0;
>> +}
>> +

I'll fix that

>[...]
>
>> diff --git =
a/drivers/media/platform/raspberrypi/hevc_dec/hevc_d_video.c =
b/drivers/media/platform/raspberrypi/hevc_dec/hevc_d_video.c
>> new file mode 100644
>> index 000000000000..d39a2e228595
>> --- /dev/null
>> +++ b/drivers/media/platform/raspberrypi/hevc_dec/hevc_d_video.c
>> @@ -0,0 +1,634 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Raspberry Pi HEVC driver
>> + *
>> + * Copyright (C) 2026 Raspberry Pi Ltd
>> + *
>> + * Based on the Cedrus VPU driver, that is:
>> + *
>> + * Copyright (C) 2016 Florent Revest =
<florent.revest@free-electrons.com>
>> + * Copyright (C) 2018 Paul Kocialkowski =
<paul.kocialkowski@bootlin.com>
>> + * Copyright (C) 2018 Bootlin
>> + */
>> +
>> +#include <media/videobuf2-dma-contig.h>
>> +#include <media/v4l2-device.h>
>> +#include <media/v4l2-ioctl.h>
>> +#include <media/v4l2-event.h>
>> +#include <media/v4l2-mem2mem.h>
>> +
>> +#include "hevc_d.h"
>> +#include "hevc_d_h265.h"
>> +#include "hevc_d_hw.h"
>> +#include "hevc_d_video.h"
>> +
>> +static inline struct hevc_d_ctx *hevc_d_file2ctx(struct file *file)
>> +{
>> +	return container_of(file->private_data, struct hevc_d_ctx, fh);
>> +}
>> +
>> +/* constrain x to y,y*2 */
>> +static inline unsigned int constrain2x(unsigned int x, unsigned int =
y)
>> +{
>> +	return (x < y) ?
>> +			y :
>> +			(x > y * 2) ? y : x;
>> +}
>
>constrain2x() doesn't seem to be used anywhere in the driver.

Good point - I'll remove it

>[...]
>
>> +
>> +void hevc_d_prepare_src_format(struct v4l2_pix_format_mplane =
*pix_fmt)
>> +{
>> +	size_t size;
>> +	u32 w;
>> +	u32 h;
>> +
>> +	w =3D pix_fmt->width;
>> +	h =3D pix_fmt->height;
>> +	if (!w || !h) {
>> +		w =3D HEVC_D_DEFAULT_WIDTH;
>> +		h =3D HEVC_D_DEFAULT_HEIGHT;
>> +	}
>> +	if (w > HEVC_D_MAX_WIDTH)
>> +		w =3D HEVC_D_MAX_WIDTH;
>> +	if (h > HEVC_D_MAX_HEIGHT)
>> +		h =3D HEVC_D_MAX_HEIGHT;
>> +
>> +	if (!pix_fmt->plane_fmt[0].sizeimage ||
>> +	    pix_fmt->plane_fmt[0].sizeimage > SZ_32M) {
>> +		/* Unspecified or way too big - pick max for size */
>> +		size =3D hevc_d_bit_buf_size(w, h, 2);
>> +	}
>> +	/* Set a minimum */
>> +	size =3D max_t(u32, SZ_4K, pix_fmt->plane_fmt[0].sizeimage);
>
>The size computed by hevc_d_bit_buf_size() inside the if-block is
>immediately overwritten here unconditionally.
>
>Should the else case be explicit? Something like:
>
>     if (!pix_fmt->plane_fmt[0].sizeimage ||
>         pix_fmt->plane_fmt[0].sizeimage > SZ_32M) {
>         size =3D hevc_d_bit_buf_size(w, h, 2);
>     } else {
>         size =3D pix_fmt->plane_fmt[0].sizeimage;
>     }
>     size =3D max_t(u32, SZ_4K, size);

Yes that would be correct - I'll fix that

>[...]
>
>> +
>> +static int hevc_d_start_streaming(struct vb2_queue *vq, unsigned int =
count)
>> +{
>> +	struct hevc_d_ctx *ctx =3D vb2_get_drv_priv(vq);
>> +	struct hevc_d_dev *dev =3D ctx->dev;
>> +	int ret =3D 0;
>> +
>> +	v4l2_m2m_update_start_streaming_state(ctx->fh.m2m_ctx, vq);
>> +
>> +	if (V4L2_TYPE_IS_OUTPUT(vq->type)) {
>> +		ret =3D hevc_d_hw_start_clock(dev);
>> +		if (ret)
>> +			goto fail_cleanup;
>> +
>> +		ret =3D hevc_d_h265_start(ctx);
>> +		if (ret)
>> +			goto fail_stop_clock;
>> +	}
>> +
>> +	return 0;
>> +
>> +fail_stop_clock:
>> +	hevc_d_hw_stop_clock(dev);
>> +fail_cleanup:
>> +	v4l2_err(&dev->v4l2_dev, "%s: qtype=3D%d: FAIL\n", __func__, =
vq->type);
>> +	hevc_d_queue_cleanup(vq, VB2_BUF_STATE_QUEUED);
>> +	return ret;
>> +}
>> +
>> +static void hevc_d_stop_streaming(struct vb2_queue *vq)
>> +{
>> +	struct hevc_d_ctx *ctx =3D vb2_get_drv_priv(vq);
>> +	struct hevc_d_dev *dev =3D ctx->dev;
>> +
>> +	if (V4L2_TYPE_IS_OUTPUT(vq->type)) {
>> +		hevc_d_h265_stop(ctx);
>> +		hevc_d_hw_stop_clock(dev);
>> +	}
>> +
>> +	hevc_d_queue_cleanup(vq, VB2_BUF_STATE_ERROR);
>> +
>> +	vb2_wait_for_all_buffers(vq);
>> +
>> +	v4l2_m2m_update_stop_streaming_state(ctx->fh.m2m_ctx, vq);
>
>The order here looks a bit odd to me. Shouldn't we stop the clock after
>we stop the streaming state and wait for all buffers?

I don't believe that is in fact broken. the call to
hevc_d_h265_stop(ctx) should ensure the hardware has stopped so it
should be safe to stop the clocks, the subsequent calls tidy up the
remaining state.

Many thanks

John Cox

>Best regards,
>- Ma=C3=ADra

