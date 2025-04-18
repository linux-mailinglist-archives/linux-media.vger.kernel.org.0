Return-Path: <linux-media+bounces-30545-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C42A937A6
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 15:12:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF4DE4633D1
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 13:12:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 305CE276059;
	Fri, 18 Apr 2025 13:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="BCwP7gHG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F53F2741C0
	for <linux-media@vger.kernel.org>; Fri, 18 Apr 2025 13:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744981925; cv=none; b=RHuyHbfRFiktuyN/3iETkLeX5xTdBcQng1WF2C+vGKo+UyRi9wmRFpr8oKj5FK7XLlzryIi5ZZCyyjcQ4T7Bcz4jWn3YsLyZiKyM6vWQ4CIu+OVA10r+jQnA/kVOJPffFPuyJpiAapdU28PAMwhkY7l/oom35sGMXKYoKtOzS64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744981925; c=relaxed/simple;
	bh=Fpyrr7Bk+jIkRZ6OSahA38xlx+xTco2EMP0Gwx5qCPs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TZ6PxKSEPqKX7/AH2iH2htBKqT5Jgdj4eiHUpxkPRNLzZiG5JwqBdgRdWoAkxs4avTd3cA59kZhb1UPtIdJOl3nFU27z9eBx4uI6GqDQY9iqLICKekI9235y/PB7tZWjoDJ/TdszBbP+0yGxXY6BHnuc2al6RlRpv36W0/DhBx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=BCwP7gHG; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c54a9d3fcaso182263885a.2
        for <linux-media@vger.kernel.org>; Fri, 18 Apr 2025 06:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1744981923; x=1745586723; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aMAgxXTmZLXXT9p3fPBY8vuGF8bkgr7l60OmevMYynw=;
        b=BCwP7gHGskKa2yvM6JNu6BG4B8gT5gHHWnMBLBG0lXuYTWPpnXFkE3SapTtbzY4fYf
         R+CgF94ZKN8tiANXjr6LoVV23SZHDyoIwQBhLIIa8cf/6Ts7NP4iEUAQdn00ZLfUe08Y
         cZgRifqpKviyCSl2uYzzpzwgnPIyB9s+vxIJI6naQgjSp9nHUpZahNquh3n72hDwO+CG
         mxmxQFtP1hc//dMNm5JuisL/Hz5puqy++FdDcv3USgWQFbhG5psenB+h1yJ2eVl84F+w
         Npej5ZDO95Ftr5aF1cven1ZkbdnL+AGS+NLIRS+7w3HKv5G1vMUKkbdHRB0W6Q4LO3ns
         SKRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744981923; x=1745586723;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aMAgxXTmZLXXT9p3fPBY8vuGF8bkgr7l60OmevMYynw=;
        b=vRut17UwaAR9suicL8B9jxsZJm8/GJMJK9vJvBEe+UCyo/DH71+QZ3C02LhlM5GnaK
         gxYyoWYzJvV8CjhJusOOdE2FmGVsuYKtE7viBRR+p7ZMyS3quf78xDGbvSfwgOUFsmzr
         hrbXnjenKHdsw6gE9ThDMA7+4z7UCgL6W3Kd4Op6XCopFJi86X2q8MPQH0crzW0/1zFc
         2BRzfDc/CySvUl2pXmXVYso1fYEMmW35AMFGVUWH+m3/AA8BV/puLuMiWYBE00iQBd6l
         4BU1PQYb2NvxFCEZDayJV1J+1uMbV9Z7L2lJWzcGwSgSl9J8mYbE0OTnT+T+71WAsOpp
         3+LQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhRCjJ7hSKB5atK+Vxx7PRUK+gzqZS5uOvcfKE2O2auKPP9FipA/Yd0gz0NogFQ6XHS7QheCQt179w5g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuoORQ46jyMHXsTjIW7/yep36dLWO8EH5GfrFWrVS5yPCVLTaf
	K8ZsIR1tAG5jW8dqiLvfycyhs5aSHRb+qopTSGXnHzzUAzC2wcGFEeg0QznuBGA=
X-Gm-Gg: ASbGnctJzO+g/gFHP2dSLFzO0o/mX/n1tn4Vpqxyh5OkxfYYLgMloWzkGegBIw6Eiwy
	HmqTuaHpn9FXKApfYw0Wh1/jpnjGMbTOXSOFwaqz0csmeWVdP5ssZvcRLDtTVFfSq7SNc9SVpSU
	h11qo7qwLKLFTbc1TCnO+z4Jaqo0fEaWGTE2OTLT+rNwxymPMr854TMx0oPOM2T/mct4vyQgY/x
	zlPF3NYIYlNFsqlqenIFkkjfqS86lPsnA0pl3pg2/dhaVx95Qud4qlw5wg1/4QgC7MqqRjgwvvs
	jymqY7KWnmOO7I5BBxs7OT5nBLIkl4Ps814jxmZdy0cK2g==
X-Google-Smtp-Source: AGHT+IH/XoxSUArL6cVz4iPViec3wwwSipsn5opstVs0fi+r5E8l1PRZpdXcrSGXm10//nNhqxZmPA==
X-Received: by 2002:a05:620a:c4a:b0:7c5:af68:5019 with SMTP id af79cd13be357-7c927f97bbamr406396985a.13.1744981922969;
        Fri, 18 Apr 2025 06:12:02 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:9913::c41? ([2606:6d00:15:9913::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925a7147esm106040285a.14.2025.04.18.06.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 06:12:02 -0700 (PDT)
Message-ID: <4549d9abf5f93fb6f417d0fb8f73877272d7c495.camel@ndufresne.ca>
Subject: Re: [PATCH] media: imx-jpeg: Drop the first error frames
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: ming.qian@oss.nxp.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	mirela.rabulea@oss.nxp.com
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
 linux-imx@nxp.com, 	imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org
Date: Fri, 18 Apr 2025 09:12:01 -0400
In-Reply-To: <20250305022513.2312731-1-ming.qian@oss.nxp.com>
References: <20250305022513.2312731-1-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le mercredi 05 mars 2025 =C3=A0 10:25 +0800, ming.qian@oss.nxp.com a =C3=A9=
crit=C2=A0:
> From: Ming Qian <ming.qian@oss.nxp.com>
>=20
> When an output buffer contains error frame header,
> v4l2_jpeg_parse_header() will return error, then driver will mark this
> buffer and a capture buffer done with error flag in device_run().
>=20
> But if the error occurs in the first frames, before setup the capture
> queue, there is no chance to schedule device_run(), and there may be no
> capture to mark error.
>=20
> So we need to drop this buffer with error flag, and make the decoding
> can continue.
>=20
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>

This seems like a relatively important bug fix to be, perhaps you can
offer "Fixes" tag to this commit ?

> ---
> =C2=A0drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 9 +++++++++
> =C2=A01 file changed, 9 insertions(+)
>=20
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/med=
ia/platform/nxp/imx-jpeg/mxc-jpeg.c
> index 1221b309a916..0e6ee997284b 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> @@ -1921,6 +1921,15 @@ static void mxc_jpeg_buf_queue(struct vb2_buffer *=
vb)
> =C2=A0	if (ret)
> =C2=A0		jpeg_src_buf->jpeg_parse_error =3D true;
> =C2=A0
> +	/*
> +	 * if the capture queue is not setup, the device_run() won't be schedul=
ed,
> +	 * need to drop the error buffer, so that the decoding can continue
> +	 */
> +	if (jpeg_src_buf->jpeg_parse_error &&
> +	=C2=A0=C2=A0=C2=A0 !vb2_is_streaming(v4l2_m2m_get_dst_vq(ctx->fh.m2m_ct=
x))) {
> +		v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
> +		return;
> +	}

Looks good to me, an alternative implementation could have been to
merged into the error branch above.

 	if (ret) {
 		jpeg_src_buf->jpeg_parse_error =3D true;
=20
		/*
	 	 * If the capture queue is not setup, the device_run() won't
		 * be scheduled, drop the error buffer so that the decoding
		 * can continue.
	 	 */
		if (!vb2_is_streaming(v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx))) {
			v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
			return;
		}
	}

With or without this suggestion, but with the Fixes tag, you can include in=
 your v2:

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> =C2=A0end:
> =C2=A0	v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
> =C2=A0}

