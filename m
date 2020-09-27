Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B64027A053
	for <lists+linux-media@lfdr.de>; Sun, 27 Sep 2020 11:43:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726252AbgI0Jnd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 27 Sep 2020 05:43:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:53218 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726149AbgI0Jnd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 27 Sep 2020 05:43:33 -0400
Received: from coco.lan (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D855423899;
        Sun, 27 Sep 2020 09:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601199812;
        bh=yO4LD++4ZyeaPoWRoDVXFsYHuJ8jBIt8Yey5f9snHfc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=t7QCBm7r7VbXKNiFCkhgXu5hNfCwYL7tBF5GpUMqAtdVTbvI9ssVyBN+/Ya9LDKr9
         B2t76OgLRtQhFLqkNBuIpVjWKCM+bY+yqz3MRLMLc2vEJhqwn2GUF8Ppk/I7YUotsX
         +gRM7B+Tb+PMj+jw22r6ige5CQ5HTSSPgHNA64nM=
Date:   Sun, 27 Sep 2020 11:43:26 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        helen.koike@collabora.com, hverkuil@xs4all.nl
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        ezequiel@collabora.com, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        tfiga@chromium.org
Subject: Re: [PATCH v3 12/12] media: staging: rkisp1: cap: protect access to
 buf with the spin lock
Message-ID: <20200927114326.7446d970@coco.lan>
In-Reply-To: <20200922113402.12442-13-dafna.hirschfeld@collabora.com>
References: <20200922113402.12442-1-dafna.hirschfeld@collabora.com>
        <20200922113402.12442-13-dafna.hirschfeld@collabora.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue, 22 Sep 2020 13:34:02 +0200
Dafna Hirschfeld <dafna.hirschfeld@collabora.com> escreveu:

> The function 'rkisp1_stream_start' calls 'rkisp1_set_next_buf'
> which access the buffers, so the call should be protected by
> taking the cap->buf.lock.
> After this patch, all locks are reviewed and commented so remove
> the TODO item "review and comment every lock"
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/staging/media/rkisp1/TODO             | 1 -
>  drivers/staging/media/rkisp1/rkisp1-capture.c | 2 ++
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/rkisp1/TODO b/drivers/staging/media/rkisp1/TODO
> index f0c90d1c86a8..9662e9b51c7f 100644
> --- a/drivers/staging/media/rkisp1/TODO
> +++ b/drivers/staging/media/rkisp1/TODO
> @@ -1,6 +1,5 @@
>  * Fix pad format size for statistics and parameters entities.
>  * Fix checkpatch errors.
> -* Review and comment every lock
>  * Handle quantization
>  * streaming paths (mainpath and selfpath) check if the other path is streaming
>  in several places of the code, review this, specially that it doesn't seem it


FYI,

There was a trivial context conflict here. Basically, the upstream
version has this:


	 * Add uapi docs. Remember to add documentation of how quantization is handled.

I solved the conflict, but as some patches for rkisp1 got merged
on a different pull request, and there were some uapi docs at the
other PR, maybe this would need to be revisited.

Thanks,
Mauro
