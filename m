Return-Path: <linux-media+bounces-3831-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0021830D3C
	for <lists+linux-media@lfdr.de>; Wed, 17 Jan 2024 20:19:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C3791C24BC0
	for <lists+linux-media@lfdr.de>; Wed, 17 Jan 2024 19:19:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 655932421C;
	Wed, 17 Jan 2024 19:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="W+Su7wMi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D30241F9
	for <linux-media@vger.kernel.org>; Wed, 17 Jan 2024 19:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705519181; cv=none; b=N+ASVL1FgL92zs2Asm/ClRdp+YkalYS9REmYTKf9wToNRE6H3eMB6DRsJjSNYZ+nrR4xviNU+FjDOQV/FJRRUDP7/uheeQmdeq2U6N3UxOCcBVbBP8sX+lKJksnUfHZUC1kcDPbzHVpbJIebdwipvJBTmjl4RNIgIm4WbVZvsHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705519181; c=relaxed/simple;
	bh=Tk+58tVSGJzD6nXuq6QFM99eDV/qO8Im+uolTrLBrUg=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Autocrypt:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version; b=gsj9QenpLUdGtb6lB5VI0xADEgJJDh2X3/tOKTrMxdgvzYeUPyk7Oq5YgQtypIVIwrGhNK1Kysv7pwVJ2wiFXiqaEF/QBhjN7fVzPi7oCBg+b5ZIgFZ+sLn5okHFmSRNx/mT/BrqgWzRGj92R5mc/9PxNtTHbGuEuEgq+I1/h5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=W+Su7wMi; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7831c604a84so836471485a.1
        for <linux-media@vger.kernel.org>; Wed, 17 Jan 2024 11:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1705519179; x=1706123979; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B8igfqkmgNu6nC8rSZ4I9Kx5OqAuRTkJcQkJ2S6J9qM=;
        b=W+Su7wMiQ5oBXHQWyThwc0vfA32N+B3w9UMWqDYN00s1xa9YnswxzBlVHzDd86eSUW
         8U4LqSN7g9UZhoh9AbZWg1aisZNIUxWUrW+OedqCd0SJ36+VhZtAsyu3z3f6fx52Dt2u
         ZAvLvnJdXvpm8pvmL9zhz0Amn/NBI67C7bvbTwvsnJk+FlYfdjNqcT8j+snnMXL6Q8rM
         HmsM3i/p9r7j4rp++4tMhx0wmLjZjvXGFbrmFuYE+gmIDli0q4ZQ1CAdnWUDEfVD9bNb
         w8zxogMBSA/ADVwlrVLPK0QDpi/T67XJUTHVHs9xQjnkFsYRcZTaCZFQWsCdjyprl6Hx
         PZAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705519179; x=1706123979;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B8igfqkmgNu6nC8rSZ4I9Kx5OqAuRTkJcQkJ2S6J9qM=;
        b=B6TNmmsC4TaBEjm38QHNsc2hXTgL2k1G07+/11aQyZT29yb8+LrQ64Zp0czzvilYE4
         jmxNZBY/r3idg1l4XuYh7NE3AqTjJPlom6oM6hvTwYWG0lzpg66pYcLJIKtGPQoo1hjq
         +lry9Xq/ZmDh/U7doFHiinPBDtrFvhQDGKGaCAaEHm3J+yhbKxTHG1nKKMlb+wvC5Z+i
         e/3ABc5znwe97D248/cG+cLAV64XIASj6HJDyHuMXvf4Bjk18dHmw4eE04p3HQ1QL+8W
         bgr2WPm2OMTOK/qMzwDwoPtYS4OEN3coUIUWVtNNBHQxGb9dByswl4D8+JMB3SmsgKa+
         fV5A==
X-Gm-Message-State: AOJu0YwmhUu/U4ngiGw4/aVqshwWj9YK7zjv0dRgNn8ODaFpDIbu7QJQ
	SGAZXuqe6F8RvsKsB5RLvnrZy3YFCGi/Nw==
X-Google-Smtp-Source: AGHT+IGhfm0OGR0fzKuqlYcPSutpL0zNqA9U5/Fp5M9yWDz8/BWuJWqAohFzEHc4JcDJ4fkmalHIYA==
X-Received: by 2002:a05:6214:1245:b0:681:24af:49b7 with SMTP id r5-20020a056214124500b0068124af49b7mr10664006qvv.27.1705519179783;
        Wed, 17 Jan 2024 11:19:39 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:11:3354::7a9])
        by smtp.gmail.com with ESMTPSA id op23-20020a056214459700b0068189a17598sm94866qvb.72.2024.01.17.11.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 11:19:39 -0800 (PST)
Message-ID: <aee81d9c755c856a572e63778b6883c3f7c09a5e.camel@ndufresne.ca>
Subject: Re: [PATCH] media: verisilicon: fix hantro.h kernel-doc warning
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Philipp Zabel
 <p.zabel@pengutronix.de>, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Date: Wed, 17 Jan 2024 14:19:38 -0500
In-Reply-To: <20240111043635.17065-1-rdunlap@infradead.org>
References: <20240111043635.17065-1-rdunlap@infradead.org>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual; keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le mercredi 10 janvier 2024 =C3=A0 20:36 -0800, Randy Dunlap a =C3=A9crit=
=C2=A0:
> Remove an extraneous kernel-doc description in hantro.h to
> eliminate a kernel-doc warning:
>=20
> hantro.h:277: warning: Excess struct member 'jpeg_enc' description in 'ha=
ntro_ctx'

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Thanks!

>=20
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: linux-media@vger.kernel.org
> Cc: linux-rockchip@lists.infradead.org
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  drivers/media/platform/verisilicon/hantro.h |    1 -
>  1 file changed, 1 deletion(-)
>=20
> diff -- a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/pla=
tform/verisilicon/hantro.h
> --- a/drivers/media/platform/verisilicon/hantro.h
> +++ b/drivers/media/platform/verisilicon/hantro.h
> @@ -237,7 +237,6 @@ struct hantro_dev {
>   * @codec_ops:		Set of operations related to codec mode.
>   * @postproc:		Post-processing context.
>   * @h264_dec:		H.264-decoding context.
> - * @jpeg_enc:		JPEG-encoding context.
>   * @mpeg2_dec:		MPEG-2-decoding context.
>   * @vp8_dec:		VP8-decoding context.
>   * @hevc_dec:		HEVC-decoding context.
>=20


