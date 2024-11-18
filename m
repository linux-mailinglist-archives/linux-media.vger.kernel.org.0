Return-Path: <linux-media+bounces-21502-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF1D9D0B7A
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 10:15:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0629EB22996
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 09:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 145B818C03E;
	Mon, 18 Nov 2024 09:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="LX0xMMgw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AF41885AD
	for <linux-media@vger.kernel.org>; Mon, 18 Nov 2024 09:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731921330; cv=none; b=Ag+SwHyh5zys38owElmy2Nl7wa779ZZy6mku1LhOHzmNSQ/WZaFLAxmkaumsJLfbLDZ22PrkevBNkn/dU3LTpSnVkEJ5wTBOzFc76jYDZNtymdzX9ns1N7c4KZCsy6Od4PCA+HYQdLAlAKMc5gBakGycsgE3vMF5AHpBKhFwcKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731921330; c=relaxed/simple;
	bh=5bV0KC+Xims9Nr98anAeAn6srjelomTm/DXSTKhaYuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iwOUMvgeWF5L6HFV67cq/tInbO7kJyDTd0MmaVD5qgjhrqUSZ8ENFJREyezPScBttczMdvmIyHRrtlQtJkVh9ad0TCjlRC8DWDzJFmAhFy9/YQSeLRbnU0HCita1/j5U9wGKRyBa72IspQi/v4mxFuX5d6xh1wh9QR2s3noNEPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net; spf=none smtp.mailfrom=ursulin.net; dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b=LX0xMMgw; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ursulin.net
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43193678216so36207215e9.0
        for <linux-media@vger.kernel.org>; Mon, 18 Nov 2024 01:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1731921327; x=1732526127; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vgBc0WpMo9WuNAB3fbwxkobyvq9Qa1bYqtOSW5URvVE=;
        b=LX0xMMgwuJihVkeFTqomu8Ui7PpQKi9E/XBvJbu5HoaqmCDbxcxoYLWI25spi2qUCC
         856EGs0j7i3HuomOx/Ts7W07ca7Aw89O+pYG+KGPAy9ht65yBlHseBLGlZLob/Xt/AVQ
         3VSPTuyODfrGgjF9YGtgpX0cuwUmBrCGlpK0lInocyJur+EXLcF9crm3NoQAP0nNn/LY
         X3Iy9YjmNNOxmEBgL7Ka0HzaY/6UM6c1waEOQpBhf/P/u21NdrIqKRU3qU3FvS+lY21P
         hX+T4W7m0JWb8lOt4O4Tj6AWmmEkBcHwtMg8XzohRsw0uPLGdLnRkHdyT4fv7GJDuHXy
         NiFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731921327; x=1732526127;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vgBc0WpMo9WuNAB3fbwxkobyvq9Qa1bYqtOSW5URvVE=;
        b=ow2hVKzK02I8O9uIbIYBiGF19V2Vy74ttYJu62gNHYTG+1rfrigD0TbUWy1uQJWGXL
         69I4C8c0qPUIYWEI3ivQYtX8iW8V3eTjmSTAUydPR1nIF2yuCjbSNo8Z5iluuwBB7t9O
         4l0RPGeFnuZM03gsiDzIUWT0uagq8TnqaDyfjbWESPKeXZr9oS+eu5WKxabW+DtM2O61
         HWZ9lEVZn5NSwnioIb6nNm3/yzeBajStAx1EKtzJhcUWNNydzBS38ulAk8gjUUaR3qcP
         AlwA1x8mj0ZcR+GajWUFVpEjW92O1b6H9D+hnuzdDzqwT66jGsL5ynqISPPIP8pmh4Ag
         NQZQ==
X-Gm-Message-State: AOJu0YztMHunkUQ9rF1TbEgsqjUTIKWzavR8GemIH1ttRdNWwDkpPKQ4
	LTPurqxf9gGsuJbZaDyRu6FeeR1msR9riKx4bmPFDpis/wqwCxDAaHAL5M1Z7Ew=
X-Google-Smtp-Source: AGHT+IEIFBDAw5D+ahQKLZjgRDXj6yIsgMktblXupw/QSnASFZwhVB5g5FmH8LJ0iyETcG1odFzaHg==
X-Received: by 2002:a05:6000:4189:b0:382:4a66:f517 with SMTP id ffacd0b85a97d-3824a66f66fmr577502f8f.4.1731921326636;
        Mon, 18 Nov 2024 01:15:26 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38244220183sm3552606f8f.99.2024.11.18.01.15.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Nov 2024 01:15:26 -0800 (PST)
Message-ID: <468d41ad-9f89-4a83-8eb1-9bd7efaf1367@ursulin.net>
Date: Mon, 18 Nov 2024 09:15:25 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: Fix __dma_buf_debugfs_list_del argument for
 !CONFIG_DEBUG_FS
To: "T.J. Mercier" <tjmercier@google.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20241117170326.1971113-1-tjmercier@google.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20241117170326.1971113-1-tjmercier@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 17/11/2024 17:03, T.J. Mercier wrote:
> The arguments for __dma_buf_debugfs_list_del do not match for both the
> CONFIG_DEBUG_FS case and the !CONFIG_DEBUG_FS case. The !CONFIG_DEBUG_FS
> case should take a struct dma_buf *, but it's currently struct file *.
> This can lead to the build error:
> 
> error: passing argument 1 of ‘__dma_buf_debugfs_list_del’ from
> incompatible pointer type [-Werror=incompatible-pointer-types]
> 
> dma-buf.c:63:53: note: expected ‘struct file *’ but argument is of
> type ‘struct dma_buf *’
>     63 | static void __dma_buf_debugfs_list_del(struct file *file)
> 
> Fixes: bfc7bc539392 ("dma-buf: Do not build debugfs related code when !CONFIG_DEBUG_FS")
> Signed-off-by: T.J. Mercier <tjmercier@google.com>
> ---
>   drivers/dma-buf/dma-buf.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 8892bc701a66..afb8c1c50107 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -60,7 +60,7 @@ static void __dma_buf_debugfs_list_add(struct dma_buf *dmabuf)
>   {
>   }
>   
> -static void __dma_buf_debugfs_list_del(struct file *file)
> +static void __dma_buf_debugfs_list_del(struct dma_buf *dmabuf)
>   {
>   }
>   #endif

Huh I wonder how this sneaked by until now.. thanks for fixing!

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

