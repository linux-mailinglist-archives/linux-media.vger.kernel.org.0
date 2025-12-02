Return-Path: <linux-media+bounces-48094-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE4CC9CDF4
	for <lists+linux-media@lfdr.de>; Tue, 02 Dec 2025 21:08:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 56F684E3C62
	for <lists+linux-media@lfdr.de>; Tue,  2 Dec 2025 20:08:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 573472F360A;
	Tue,  2 Dec 2025 20:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NlRkOK01"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434142C327A
	for <linux-media@vger.kernel.org>; Tue,  2 Dec 2025 20:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764706071; cv=none; b=FBAoejOae/8TA618h1qZd7/JWqOPHnkMSw95SvCZmUsZMvvnMxGQmeXH9GNrMmQTBaV1C7MD8iNn5aYpw0lOV1RHYKMRzZUsQayp7VtEayHw/19bPHL4sz4C7qk/s/Sw2aHkNqQMtlg5eN+kyfCk9x6uCMvN/N455Hjnmhx8Ako=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764706071; c=relaxed/simple;
	bh=ACBUPeL43mwPZTUSnSFxgLSxMsGU9if0iNVWo5XatpM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JM6E5F7VVxbF0AF+2Qbz4g3l0ws6xZTaqt1x2PvUYxATPYgxGUm4glMlpZ/6f8gUG1E4UiXGUe5HLBEQJuSkbFxBPZFEE5apj+gDHk7nvrhbQniDH9ZghHDsB3Gw63HKQieGWgDlTQNwsKHKUs9+lSGev8lsNLeyHVNvJsDVgdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NlRkOK01; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-298145fe27eso92621955ad.1
        for <linux-media@vger.kernel.org>; Tue, 02 Dec 2025 12:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764706069; x=1765310869; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kI9p+qb6/TgSozCoxY+dJLNndOTTEijSlFIUVtLY95g=;
        b=NlRkOK01RJINtyw8K4XXVnKcNq0HEQS0aR7Mb6vjv2gdrFR4tpDYDVjILjeeVaHEBH
         aykSC0E8IA2YMwLIz5HMMe2iDja6HahNHI+p+eYEEl+8e5pFO+10Cpn3ux+sKEc+ZEvX
         CdRpopNilbri98QEudoE/J5VusjdPcbRmtlZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764706069; x=1765310869;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kI9p+qb6/TgSozCoxY+dJLNndOTTEijSlFIUVtLY95g=;
        b=q01tCrdnkxGXY8H2cfItC/sSG1/5MWw8BLzX3FDA5SVaQl3Ku0Knmpn1sx/mQ8rOQU
         0hqwAeQ148MTyP6ja7KYNOCljmAD6TZ7bviHa8Rgl4DXhBmBctzAFCcgFl61a/x26zor
         VWXr8+rOSIz7MLgM7lMUnDLsvVAGkzhZ2Wyuz0tH022aAmxIeIjNa8bQwpXrnIYLG1rW
         V7t/wHnETCnWWokFBUK6LXep6wxbxYPTuFNKqoqPj4BV8tPx16XG0A6+IaaWIiu16O7L
         pmA9X8o4OfsmfolRoEbDwx3Uuful90+PR7U8qUZCMZS43gSv7brl/VwSgYHHHqgBXi43
         tYvw==
X-Gm-Message-State: AOJu0YzLVuRkRLq2X54uiyCXw8xtrUx0pucuBTkG3rrvd2xVGhRRnrfc
	D7BmxqWVJRXOr2Ge68/WikyASmlFkd2772ikGEHFnxyv+lZfxZeoBuNbCcEY5yHMGQ==
X-Gm-Gg: ASbGncsy1TG/zcpjLDVSZb3F5XH4pRip+QjP9B/90Owe2xVyNRTwnLS0HAIxeU1D+Eh
	13cccQ5WPxTc2ODAqntUvD8hF0+mX9m39OE59C6+9khD56yxItwYSJEA6+TYhn2x76Cg/W5y1GG
	ybWeysjvxZ6qrrGYMEazWQSXjvHrA9LAWWVWQWEvAsXYc57qvcF/DndbNPG/SsZhVJsY3zFZ6CO
	QBWsLwGfuz6qZ2vEgaHivo57PbPUDKXPa7/0sXHZHiPrJkmXeJURyMJhkBjX6A8pjty4cio3e8H
	tin9TGRWLjuGRlgSOyyopXQsyaD1W5XJXLeKA1JHkMG9qquV7cYTko9Mt0kVfc/VnxCVNj9YS6g
	/hxWoAVz0jEaYr8rOUqcQsCfNH+PK6kg7GMmwxKfDIEyGTUx6XB9C18qnkewXVhQj02eBrLCwvm
	cKupUmsTUCFDO0OKkUuj+Lwz8L/g5y/dhYfu5TM/uoWvqft1vurogPZZe+boFuZU8OxJPlvb4L5
	bmtU+LOwtiLuf4=
X-Google-Smtp-Source: AGHT+IGn3aC8e45qw37z9bY+y9vvuHuUVBAQrAi6ZBVEW6GdJG73hpap91BuG84WUbljLNJpr0hmDw==
X-Received: by 2002:a17:902:dac3:b0:299:e031:16d with SMTP id d9443c01a7336-29bab148c3emr327444425ad.33.1764706069131;
        Tue, 02 Dec 2025 12:07:49 -0800 (PST)
Received: from ?IPV6:2a00:79e0:2ebe:8:ea28:cf77:b544:c187? ([2a00:79e0:2ebe:8:ea28:cf77:b544:c187])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb7f69asm160495345ad.102.2025.12.02.12.07.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 12:07:48 -0800 (PST)
Message-ID: <dd22c40e-1200-42f7-8c48-63534f759045@chromium.org>
Date: Tue, 2 Dec 2025 12:07:47 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] media: videobuf2: Allow applications customize data
 offsets of capture buffers
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Tomasz Figa
 <tfiga@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Boris Brezillon <bbrezillon@collabora.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Laura Nao <laura.nao@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>
References: <20220322132329.6527-1-dmitry.osipenko@collabora.com>
Content-Language: en-US
From: Hirokazu Honda <hiroh@chromium.org>
In-Reply-To: <20220322132329.6527-1-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi all,

How does the community think about this change these days?
This unblocks using a frame whose planes are actually in the
same dma buffer with multi-planar format in CAPTURE queue whose
memory type is DMABUF in decoding.
I agree that the v4l2_buffer_ext API is a right way to support it,
but we haven't achieved the new API support for about 5 years, and
not sure if we will do in the near future.

Could the community elaborate merging this change?

Best Regards,
-Hiro

On 2022/03/22 午前6:23, Dmitry Osipenko wrote:
> Use data offsets provided by applications for multi-planar capture
> buffers. This allows V4L to import and use dma-bufs exported by other
> subsystems in cases where application wants to customize data offsets
> of capture buffers in order to meet hardware alignment requirements of
> both dma-buf exporter and importer.
>
> This feature is wanted for providing a better support of media hardware
> found on Chromebooks. In particular display and camera ISP hardware of
> Rockchip and MediaTek SoCs require special handling by userspace because
> display h/w has specific alignment requirements that don't match default
> alignments expected by V4L and there is a need to customize the data
> offsets in case of multi-planar formats.
>
> Some drivers already have preliminary support for data offsets
> customization of capture buffers, like NVIDIA Tegra video decoder driver
> for example, and V4L allows applications to provide data offsets for
> multi-planar output buffers, let's support such customization for the
> capture buffers as well.
>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>   Documentation/userspace-api/media/v4l/buffer.rst | 9 ++++++++-
>   drivers/media/common/videobuf2/videobuf2-v4l2.c  | 7 +++++++
>   2 files changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/userspace-api/media/v4l/buffer.rst b/Documentation/userspace-api/media/v4l/buffer.rst
> index 4638ec64db00..75b1929e2acb 100644
> --- a/Documentation/userspace-api/media/v4l/buffer.rst
> +++ b/Documentation/userspace-api/media/v4l/buffer.rst
> @@ -369,13 +369,20 @@ struct v4l2_plane
>         - ``data_offset``
>         - Offset in bytes to video data in the plane. Drivers must set this
>   	field when ``type`` refers to a capture stream, applications when
> -	it refers to an output stream.
> +	it refers to an output or capture stream.
>   
>   	.. note::
>   
>   	   That data_offset is included  in ``bytesused``. So the
>   	   size of the image in the plane is ``bytesused``-``data_offset``
>   	   at offset ``data_offset`` from the start of the plane.
> +
> +	   For capture planes data_offset may be specified by applications
> +	   and by drivers. Driver may override application's offset or error
> +	   out buffer if offset can't be satisfied by hardware. This allows
> +	   applications to customize data offsets of imported dma-bufs.
> +	   Handling of application's offsets is driver-dependent, application
> +	   must use the resulting buffer offset.
>       * - __u32
>         - ``reserved[11]``
>         - Reserved for future use. Should be zeroed by drivers and
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index 6edf4508c636..929107a431cc 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -263,6 +263,13 @@ static int vb2_fill_vb2_v4l2_buffer(struct vb2_buffer *vb, struct v4l2_buffer *b
>   						psrc->bytesused : pdst->length;
>   				pdst->data_offset = psrc->data_offset;
>   			}
> +		} else {
> +			for (plane = 0; plane < vb->num_planes; ++plane) {
> +				struct vb2_plane *pdst = &planes[plane];
> +				struct v4l2_plane *psrc = &b->m.planes[plane];
> +
> +				pdst->data_offset = psrc->data_offset;
> +			}
>   		}
>   	} else {
>   		/*

