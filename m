Return-Path: <linux-media+bounces-6705-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 13087876169
	for <lists+linux-media@lfdr.de>; Fri,  8 Mar 2024 10:58:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9403C1F22891
	for <lists+linux-media@lfdr.de>; Fri,  8 Mar 2024 09:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69846537FB;
	Fri,  8 Mar 2024 09:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KC3bomld"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A39535C8
	for <linux-media@vger.kernel.org>; Fri,  8 Mar 2024 09:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709891899; cv=none; b=tFWTTm0ZXuYnHpBDmCE/tqhvP4wjbIX+T57RykzqN+kzPZiSXwZ+C/+woLE0+QUhY8Q78B4FvyoXYWwq1Y2NvTGD7giBKW4Ec8lNJRlIR9nO0UJIGTJ6KGEPKyrK8rKQZu3ugtZ7FqfKNXisS6JInFmwvvKSiI/fFx28PEl7fkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709891899; c=relaxed/simple;
	bh=rpou+AH+dUgO3XuNPVqZ1T/K6UdcGHyhuqSesmtbLvI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tgxjMOYXUg71x2RDcqfCTLVTm8NEzMWXP+JTQ9UiPvsFf2FYceZgm3b9C32H1yUY4Fa+L9uw1rPUSMBTAp7tztpF/NJL42fzqKdFztkzt9vyvnITITFz1QM9ul3W0idN6qsvIkkakZKsaDv8qGUHe/Wfrna7dFgozFKF1bO5joM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KC3bomld; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a45b6fcd5e8so236183166b.1
        for <linux-media@vger.kernel.org>; Fri, 08 Mar 2024 01:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709891896; x=1710496696; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XDwM4MWBUouLyRMA0tqnJFsniCiNjXZ5DGB637O3TuE=;
        b=KC3bomldCYzoErS5juyxfygLa9ynXa12Al8DXe/gD7+ILqsdO/ppl1L9i3tLnINwY4
         uAAVSEoxvw+OwrZhtL0qFBAMjiCnDu05tU0iAOom+lBj3UwRIOtLlzFjam/MpKFIxBXH
         J4bCSiQZERDAGs0cli6QXpF1V6DIjLEmKNWSq8ym1VxTgw4Qea2FYFP6O0Iq8fdRcTIu
         T5zuTJzNRb9WMkGhhesgRwT7iwRrvhn4orqR0NoAnitjtuhNQIZjqWPXHBXgnMAEOZIS
         F7A2X1vDnC81i52uGhIT56KYFpRU3RtxIVcbduJvGTnwCo2eXUii1FcbcoWx2UTQs3iJ
         J6/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709891896; x=1710496696;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XDwM4MWBUouLyRMA0tqnJFsniCiNjXZ5DGB637O3TuE=;
        b=u0E4IS5e3SBEcqBXzNQ5lK3FYzTRrteWskYKWst2YJ7SdSCb1Bjk03XuZRuAMSwhcN
         4zhQkl4eHKxcuVh99PLqhnjWThjFU0rbfCaQ4I44u5CDQWMh+heRwqgfU66kSZCVHXx3
         dO1Qj4a9bK8+wGoAeOFsdjh1Tp1P1+w7qvUsX9XVAn6Sw90SEh2Qugv+Ru1XdSH+aC4x
         21JuMHS9V9jx3yiA3DFRM1vGBdsrveJ0YFQu7lk+IykKPGUslbCZHaKTkqRSLduECoY1
         vtDrEjb3RCDcRq17otIQUHteZxzneaQpycSOwu3UURlTKNAcSzxanoaL1FVz76FoAn+N
         Ba+A==
X-Forwarded-Encrypted: i=1; AJvYcCXmoGCwyBKRWDTlMR7UApaFnfyyKD/agYKi7c6bDX2OEquyW/XXOuCdGBY0NFh6SQ08wynFYk2TRo6OepP9j8CoHiwbLZMDDL/4EKw=
X-Gm-Message-State: AOJu0Yx1VYyzu7tid0bj4W2Sm0FmD+4If1XMYroRptAszjHt0kIvNpEr
	5LhPnUcFrPsKkXKbICAxMSoF5W1yJoh9/N+oezyUW1Kx2o5jfMsz
X-Google-Smtp-Source: AGHT+IH6GGwrN9WMUTMdvCACygvYZ6TS3xns6XvSbmJhihFI7khFIVgCd8gYv18sE0taUQ6CB36dww==
X-Received: by 2002:a17:907:a0d6:b0:a45:f55b:1b51 with SMTP id hw22-20020a170907a0d600b00a45f55b1b51mr377073ejc.52.1709891895948;
        Fri, 08 Mar 2024 01:58:15 -0800 (PST)
Received: from [10.9.136.59] ([87.62.83.1])
        by smtp.gmail.com with ESMTPSA id y13-20020a1709063a8d00b00a442e2940fdsm9359551ejd.179.2024.03.08.01.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Mar 2024 01:58:15 -0800 (PST)
Message-ID: <fa09e43d971888f540ff346d8e49bf4f1a8b4b5b.camel@gmail.com>
Subject: Re: [PATCH v3 11/17] media: intel/ipu6: input system video capture
 nodes
From: Andreas Helbech Kleist <andreaskleist@gmail.com>
To: bingbu.cao@intel.com, linux-media@vger.kernel.org, 
	sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com, 
	andriy.shevchenko@linux.intel.com, hdegoede@redhat.com
Cc: ilpo.jarvinen@linux.intel.com, claus.stovgaard@gmail.com, 
 tomi.valkeinen@ideasonboard.com, tfiga@chromium.org,
 senozhatsky@chromium.org,  bingbu.cao@linux.intel.com,
 tian.shu.qiu@intel.com, hongju.wang@intel.com
Date: Fri, 08 Mar 2024 10:58:14 +0100
In-Reply-To: <20240111065531.2418836-12-bingbu.cao@intel.com>
References: <20240111065531.2418836-1-bingbu.cao@intel.com>
	 <20240111065531.2418836-12-bingbu.cao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Bingbu,

A small comment, discovered while using this code for IPU4.

On Thu, 2024-01-11 at 14:55 +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
>=20
> Register v4l2 video device and setup the vb2 queue to
> support basic video capture. Video streaming callback
> will trigger the input system driver to construct a
> input system stream configuration for firmware based on
> data type and stream ID and then queue buffers to firmware
> to do capture.
>=20
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> ---
>  .../media/pci/intel/ipu6/ipu6-isys-queue.c    |  825 +++++++++++
>  .../media/pci/intel/ipu6/ipu6-isys-queue.h    |   76 +
>  .../media/pci/intel/ipu6/ipu6-isys-video.c    | 1253 +++++++++++++++++
>  .../media/pci/intel/ipu6/ipu6-isys-video.h    |  136 ++
>  4 files changed, 2290 insertions(+)
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-video.c
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-video.h
>=20
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/med=
ia/pci/intel/ipu6/ipu6-isys-queue.c
> new file mode 100644
> index 000000000000..735d2d642d87
> --- /dev/null
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c

...

> +void ipu6_isys_queue_buf_done(struct ipu6_isys_buffer *ib)
> +{
> +	struct vb2_buffer *vb =3D ipu6_isys_buffer_to_vb2_buffer(ib);
> +
> +	if (atomic_read(&ib->str2mmio_flag)) {
> +		vb2_buffer_done(vb, VB2_BUF_STATE_ERROR);
> +		/*
> +		 * Operation on buffer is ended with error and will be reported
> +		 * to the userspace when it is de-queued
> +		 */
> +		atomic_set(&ib->str2mmio_flag, 0);
> +	} else {
> +		vb2_buffer_done(vb, VB2_BUF_STATE_DONE);
> +	}
> +}
> +void ipu6_isys_queue_buf_ready(struct ipu6_isys_stream *stream,
> +			       struct ipu6_fw_isys_resp_info_abi *info)
> +{
> +	struct ipu6_isys_queue *aq =3D stream->output_pins[info->pin_id].aq;
> +	struct ipu6_isys *isys =3D stream->isys;
> +	struct device *dev =3D &isys->adev->auxdev.dev;
> +	struct ipu6_isys_buffer *ib;
> +	struct vb2_buffer *vb;
> +	unsigned long flags;
> +	bool first =3D true;
> +	struct vb2_v4l2_buffer *buf;
> +
> +	spin_lock_irqsave(&aq->lock, flags);
> +	if (list_empty(&aq->active)) {
> +		spin_unlock_irqrestore(&aq->lock, flags);
> +		dev_err(dev, "active queue empty\n");
> +		return;
> +	}
> +
> +	list_for_each_entry_reverse(ib, &aq->active, head) {
> +		dma_addr_t addr;
> +
> +		vb =3D ipu6_isys_buffer_to_vb2_buffer(ib);
> +		addr =3D vb2_dma_contig_plane_dma_addr(vb, 0);
> +
> +		if (info->pin.addr !=3D addr) {
> +			if (first)
> +				dev_err(dev, "Unexpected buffer address %pad\n",
> +					&addr);
> +			first =3D false;
> +			continue;
> +		}
> +
> +		if (info->error_info.error =3D=3D
> +		    IPU6_FW_ISYS_ERROR_HW_REPORTED_STR2MMIO) {
> +			/*
> +			 * Check for error message:
> +			 * 'IPU6_FW_ISYS_ERROR_HW_REPORTED_STR2MMIO'
> +			 */
> +			atomic_set(&ib->str2mmio_flag, 1);
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +		}
> +		dev_dbg(dev, "buffer: found buffer %pad\n", &addr);
> +
> +		buf =3D to_vb2_v4l2_buffer(vb);
> +		buf->field =3D V4L2_FIELD_NONE;
> +
> +		list_del(&ib->head);
> +		spin_unlock_irqrestore(&aq->lock, flags);
> +
> +		ipu6_isys_buf_calc_sequence_time(ib, info);
> +
> +		ipu6_isys_queue_buf_done(ib);

Why is `ib->str2mmio_flag`, which is set above an atomic? It seems like
it could just be a function argument to `ipu6_isys_queue_buf_done`,
which is the only place it is used.

> +
> +		return;
> +	}
> +
> +	dev_err(dev, "Failed to find a matching video buffer");
> +
> +	spin_unlock_irqrestore(&aq->lock, flags);
> +}
...
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h b/drivers/med=
ia/pci/intel/ipu6/ipu6-isys-queue.h
> new file mode 100644
> index 000000000000..9fb454577bb5
> --- /dev/null
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
...
> +void ipu6_isys_queue_buf_done(struct ipu6_isys_buffer *ib);
...

This function is only used in ipu6-isys-queue.c, so could be static.


/Andreas

