Return-Path: <linux-media+bounces-29589-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 634EAA7F83D
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 10:47:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B2E53B7CEE
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 08:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 636D3263F51;
	Tue,  8 Apr 2025 08:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LBs+n2N8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80F12185B8;
	Tue,  8 Apr 2025 08:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744101837; cv=none; b=QSGnSQpUzmB1NwT1Emxy2MpZ1niKxVLkXtNv5XGY3sdkzMqFVEhithPmb7Tcm3zk6F45wneInJhfaEzNU5eOmG/MYHq+aqJRwt+rGxxfXze9ml/eohc1X5AJ9CQdUvdjd1JYhwWGOmuDbVe5+6+xaLixcO6erKR3hnRDsyfxM/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744101837; c=relaxed/simple;
	bh=P5m3QFVw+X3gs9ohqO7sbUbfBw2sYBlUeGNDal0H9Pk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JJVDXcjAuCEdOkjvnwhXWVg+nrBYfe+3ZCXnVNeTPRk5FIKt7yHaXCxPfugKQYu/oloXirLcgi/mBJ0KGI1jnIlnB9bVTBtP7F2dzPNN50024ZEY5EG2P6mWnlEM2Y4zRxbXkI6hcXMRNgRVwbvPNbc5sROq3hS8GssHDiR+fmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LBs+n2N8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E712C4CEE5;
	Tue,  8 Apr 2025 08:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744101837;
	bh=P5m3QFVw+X3gs9ohqO7sbUbfBw2sYBlUeGNDal0H9Pk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LBs+n2N8NhUFecbrk3bW0GlDry7rkHeoLfO826D1eGVSyfoN/ElHkzLrmJ20wp6Jx
	 jBogmLGexOMxSaIsDPVritZvZJQAjMjTOmQjiDtXw6zrM3LwXtm2nooVwLnhf/Qk96
	 IJ6Ct9w6y+SmRa93zcfqibRoYnHAqDZu48oNQfIo79kc0mxYDmHqxcXdOV2SQsAvUr
	 QtwAWD7HB3jNGJVs55zgGIOsY54i/WZrE3mAQrk6Ae8eTmeloA71vbZaXUjVNjncKH
	 vLBO5NkPRl+Le+38fOD4ljoM7uvLGfDUSKOcscXFeUllb4ZqRV6+I+h2zTP9MvrC2d
	 cn9DpIhxSMlYw==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
To: Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Mattijs Korpershoek <mkorpershoek@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v3 1/2] dma-buf: heaps: system: Remove global variable
In-Reply-To: <20250407-dma-buf-ecc-heap-v3-1-97cdd36a5f29@kernel.org>
References: <20250407-dma-buf-ecc-heap-v3-0-97cdd36a5f29@kernel.org>
 <20250407-dma-buf-ecc-heap-v3-1-97cdd36a5f29@kernel.org>
Date: Tue, 08 Apr 2025 10:43:53 +0200
Message-ID: <875xjf11rq.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Maxime,

Thank you for the patch.

On lun., avril 07, 2025 at 18:29, Maxime Ripard <mripard@kernel.org> wrote:

> The system heap is storing its struct dma_heap pointer in a global
> variable but isn't using it anywhere.
>
> Let's move the global variable into system_heap_create() to make it
> local.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Mattijs Korpershoek <mkorpershoek@kernel.org>

> ---
>  drivers/dma-buf/heaps/system_heap.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
> index 26d5dc89ea1663a0d078e3a5723ca3d8d12b935f..82b1b714300d6ff5f3e543059dd8215ceaa00c69 100644
> --- a/drivers/dma-buf/heaps/system_heap.c
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -19,12 +19,10 @@
>  #include <linux/module.h>
>  #include <linux/scatterlist.h>
>  #include <linux/slab.h>
>  #include <linux/vmalloc.h>
>  
> -static struct dma_heap *sys_heap;
> -
>  struct system_heap_buffer {
>  	struct dma_heap *heap;
>  	struct list_head attachments;
>  	struct mutex lock;
>  	unsigned long len;
> @@ -422,10 +420,11 @@ static const struct dma_heap_ops system_heap_ops = {
>  };
>  
>  static int __init system_heap_create(void)
>  {
>  	struct dma_heap_export_info exp_info;
> +	struct dma_heap *sys_heap;
>  
>  	exp_info.name = "system";
>  	exp_info.ops = &system_heap_ops;
>  	exp_info.priv = NULL;
>  
>
> -- 
> 2.49.0

