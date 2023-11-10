Return-Path: <linux-media+bounces-5-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6207E7EAE
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 18:46:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4BE41C20C4F
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 17:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF36338DE5;
	Fri, 10 Nov 2023 17:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="mOD4VV5X"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D262FE2F
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 17:46:29 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E8672B7C8;
	Fri, 10 Nov 2023 01:25:34 -0800 (PST)
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 13A0F66073D3;
	Fri, 10 Nov 2023 09:25:32 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699608333;
	bh=n3+n4ksLRFYR42r5lq33koWRbtaxd52htHZoJWv8Q2c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mOD4VV5XkUr+52siDkPiIOaMx3IS3FOP/uD/XzskUk9EQBcQ5ReyAB2vNY+Dt52Ed
	 fVRkhuhHFSlJf5wGMZpBtOMVTXkftf18t0vYFYBuQasAjWad71XARhpmz6ghjaRwUA
	 ifI2jPLDFhheIv2D2IUHNNzfCYYzMKVlz2Jk+jjuf0Pw82JjbvrggCk3F50xfZg782
	 R9m83Ernj1bylVxDMyqT6TDZKsU9nifIDCOdHsDPfIqwn4NSCyHMIDOB21YpJuKtDn
	 QSK/n2BYzQdLt5B6N5+IR2WA7dO0crqUpW97Fs8SAhZnABE+zSle1oi0erDWOeBClK
	 g0dSUGCaQIbug==
Message-ID: <78109ad6-afbc-46eb-ba25-b4fc35c59c3c@collabora.com>
Date: Fri, 10 Nov 2023 10:25:31 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 19/56] media: dvb-core: Do not initialize twice queue
 num_buffer field
Content-Language: en-US
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org,
 tfiga@chromium.org, m.szyprowski@samsung.com, ming.qian@nxp.com,
 ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
 nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, kernel@collabora.com
References: <20231109163512.179524-14-benjamin.gaignard@collabora.com>
 <20231109163512.179524-20-benjamin.gaignard@collabora.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20231109163512.179524-20-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

W dniu 9.11.2023 o 17:34, Benjamin Gaignard pisze:
> The above memset already zeroed all the ctx fields, it is useless
> to do it here again.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

> ---
>   drivers/media/dvb-core/dvb_vb2.c | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/media/dvb-core/dvb_vb2.c b/drivers/media/dvb-core/dvb_vb2.c
> index 3a966fdf814c..167ff82a6fed 100644
> --- a/drivers/media/dvb-core/dvb_vb2.c
> +++ b/drivers/media/dvb-core/dvb_vb2.c
> @@ -167,8 +167,6 @@ int dvb_vb2_init(struct dvb_vb2_ctx *ctx, const char *name, int nonblocking)
>   
>   	memset(ctx, 0, sizeof(struct dvb_vb2_ctx));
>   	q->type = DVB_BUF_TYPE_CAPTURE;
> -	/**capture type*/
> -	q->is_output = 0;
>   	/**only mmap is supported currently*/
>   	q->io_modes = VB2_MMAP;
>   	q->drv_priv = ctx;
> @@ -177,7 +175,6 @@ int dvb_vb2_init(struct dvb_vb2_ctx *ctx, const char *name, int nonblocking)
>   	q->ops = &dvb_vb2_qops;
>   	q->mem_ops = &vb2_vmalloc_memops;
>   	q->buf_ops = &dvb_vb2_buf_ops;
> -	q->num_buffers = 0;
>   	ret = vb2_core_queue_init(q);
>   	if (ret) {
>   		ctx->state = DVB_VB2_STATE_NONE;


