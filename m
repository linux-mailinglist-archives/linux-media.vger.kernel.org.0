Return-Path: <linux-media+bounces-44008-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE43BC641C
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 20:13:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2597719E3BFF
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 18:13:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 366602BEFF3;
	Wed,  8 Oct 2025 18:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pfkj4j42"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B169D20296E
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 18:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759947201; cv=none; b=Jp8h8IMoSE7C9rTSfpEAck4OLzt1rubBE/ltcbPVmV1mqMEhcbIZTflJqbBit37NzCgeQU3Mn9puhwtqdZ+HIH40JqleoNBuUM5H+TlLH3eW0kC8rmR2Ua2WC26A5JegH26alcJrvECc3lebAcAnQM6jPrY5Q1+rOoFOpkoQOZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759947201; c=relaxed/simple;
	bh=36ue2/oISu0v/nQUK5kO093jV/5kJTeP+0x6O0ag2uY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=pYaOY/BJyqIHJOCqx63YToJpQ/xs9Bv5WXG0DIaniQIBueBsA4+bVyAQlSczyxrJRP04Z5mtb4gaHyQOJw8lYHUER2vyByEFWcTNqkokTXuJrV2pUF8N7FlG7k1RvfoKvICfCJ0qAZXJpxdYPJbu4ow7WIu7z6qqoCVkryVgX2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pfkj4j42; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-46e6ba26c50so867575e9.2
        for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 11:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759947198; x=1760551998; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fZaXt+gShwcST4niGAvItceQr0XW4MXQVlljb1xZ9gY=;
        b=Pfkj4j42xajNCMRf/4tJzIoZ8hC53MHwQhoT2MW7UJiktNu1GCcOl8t5tVmsKzx0+v
         QSAKElp5pheEAXDgYnqLHf2wf4IanKM1XzObtTiBDuTlMnV05MT6JEATlV2EpDap5o1J
         ohaop2olpJjUK0z/8RqVGHFGGwGLavcDNuShubbJRIkdYqYltr4HfViepWisB6Uqkfs2
         XuSH4BzXNt232haaVD/SsaRmqLuPCAwL0G5HxYxtKkabzwD6hos/QrLFg4kbKw9Xca0z
         wP23cAleXnQqxrWoMbpX2UHf41jo8AVEBENZu8zM2hyC54RLdWEVnrrMFMmYiLv6xCUp
         eZuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759947198; x=1760551998;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fZaXt+gShwcST4niGAvItceQr0XW4MXQVlljb1xZ9gY=;
        b=s5ps1/ogRKX0NpUeqirKesEfFIMu0BpyxAkZaM8RcA6eYFp9jyJMUeRtXEmlqfYUnn
         k0dLc9NgUUnTxZEK6oD3jNe+Ckb6DvGlNJ5VDTLFaI6o7nd3T2n9j6giu4KvhEp+9l0s
         iT8w4xZqbNccKM02l8YU3Ho/ntI8wQe40DmP4+Q//krLOuJThyIP2ihJkQC4MdMb9jSI
         o+VPZLGYRgsNdN8wEz5p5eT+wrnxcQ3vJqjR9JDbiKAp77ZdRl+MSBq9f+4DoMEo1xQL
         o57xgAyOgFrbDByUFtPOSS1Ol2L/VnvF1NptXK5kDlqJawpoxNnVv4g9pfKFr6YQp8f7
         zvPw==
X-Forwarded-Encrypted: i=1; AJvYcCXOatiyVlht3u/Wl/7VGTXrTm1UGKuPVH1isDjNAoKISKfb8X/bULFmtdW2qQnmeV2URLH9D9DjT4SiHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyR0e9pNqRw7LkMgDXMrxUoGwDKv+mIMjmtEl6GjtBJ7jsDzwjO
	cgDG2ZvaTb4xWfEPQm9RmCE0lc/HmONRDugyD/4uJIz4ALmKALr73XCavSe6FfbwXlh5FV7owZ3
	b+eg/
X-Gm-Gg: ASbGncsidnauXX3Y1Ump4Tjz6oFR7uq70URp3xj9gUOYVaOZowp4kkoL5aiiJbEMzs6
	I0qkXkzLA7iuSZ/Cf4BN9SWfeYOvp+4PUv1OnOqK7O7AcZBKq1m2haZmmbaBxiLL0TzVrxmpPkm
	sy0FG5a/7pEjXcl3Iu3B+KMmQlaAG3e5G1Znfotj4HkvjlTQqTyISPKK5peUQTstu/bY+PvqWrn
	9ou5wKT+jDSfqAS8Y9fU3U7ruxO9qlL9TbllrrVHd99Wg4haLvJ8qbpuvoTbNRH0VQg7WWR1aqu
	Q87ke/zKab6mqZNU6h8k4Yr2Lau6aoKaT7Rw7Oy/3XPwpbCfzC2zUCEkKpaiwzzMs1D+jnvkEII
	wOb1ucK3gEdexSIM4Z0iDEYUmyVSwlsFhJ+NP6YgfWbjqY8I8I9NSfnoN3APbP+2flYcZsHRHXH
	qdKNE+YVmwVWGRJhvU7KM=
X-Google-Smtp-Source: AGHT+IH66uhKvXnvTehKe3lInuC7qmM/YcfilA/g+9CQ8oNy3NiDtUo8BeUgAB3WyYNGUPEby1HO9Q==
X-Received: by 2002:a05:600c:8b16:b0:46e:4004:a296 with SMTP id 5b1f17b1804b1-46fa9a965a9mr35155715e9.9.1759947197837;
        Wed, 08 Oct 2025 11:13:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:b264:afbc:dee:3d? ([2a01:e0a:3d9:2080:b264:afbc:dee:3d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8f0853sm31405791f8f.50.2025.10.08.11.13.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 11:13:17 -0700 (PDT)
Message-ID: <45f68b22-4514-4ddf-95e7-e00f45561307@linaro.org>
Date: Wed, 8 Oct 2025 20:13:16 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 03/25] media: meson-g2d: Drop unneeded v4l2_m2m_get_vq()
 NULL check
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20251008175052.19925-1-laurent.pinchart@ideasonboard.com>
 <20251008175052.19925-4-laurent.pinchart@ideasonboard.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20251008175052.19925-4-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/8/25 19:50, Laurent Pinchart wrote:
> The v4l2_m2m_get_vq() function never returns NULL. The check was
> probably intended to catch invalid format types, but that's not needed
> as the V4L2 core picks the appropriate VIDIOC_G_FMT ioctl handler based
> on the format type, so the type can't be incorrect. Drop the unneeded
> return value check and, as the return value is not used for other
> purposes and the function has no side effect, the function call as well.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>   drivers/media/platform/amlogic/meson-ge2d/ge2d.c | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/media/platform/amlogic/meson-ge2d/ge2d.c b/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
> index 0c004bb8ba05..a9323b383547 100644
> --- a/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
> +++ b/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
> @@ -627,13 +627,8 @@ static int vidioc_s_fmt_cap(struct file *file, void *priv, struct v4l2_format *f
>   static int vidioc_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
>   {
>   	struct ge2d_ctx *ctx = priv;
> -	struct vb2_queue *vq;
>   	struct ge2d_frame *frm;
>   
> -	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
> -	if (!vq)
> -		return -EINVAL;
> -
>   	frm = get_frame(ctx, f->type);
>   
>   	f->fmt.pix = frm->pix_fmt;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

