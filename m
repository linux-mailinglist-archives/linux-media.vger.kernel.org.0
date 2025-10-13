Return-Path: <linux-media+bounces-44263-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D46C1BD2961
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 12:35:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29C4A3AA9E1
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 10:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15A582FF16A;
	Mon, 13 Oct 2025 10:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tujRhX6e"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C45F1E5B9A;
	Mon, 13 Oct 2025 10:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760351741; cv=none; b=H6JIqlKarEWW1N1pPEY05dPr67QZEY1fKDwUIVeKWmRPc28t7rJPF5WMzklfIEhKIHgom12DOVbhNUZo7I2c5MJMA9lITp5CmhzVIQL/haDfFu58L5T+Fx5LAFgLbyTOQehRFT9lq7SRwJEgHQNouVxw6eNqBaD45emh1Q2S9qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760351741; c=relaxed/simple;
	bh=mSlTLpr9dlmJ/MLh0hm/KQWg73tObXOepMvzYnhvn+U=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Ixsk9zwieC9UPL9/uNxPcP5651oQUMSt6WX1EMjPVLX5JLZYAWp+BWGbOpjHRPUAH9KFoUMqbdSnEitvu9FS8p7iuvtIFCfzrmFRRcojG5UBegxjYsL7+UHuXKqK0u3OzPVjnAK9TqnIjAj+hBmd991LhIBserEoDn/Pvo3aKaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tujRhX6e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9F1CC4CEE7;
	Mon, 13 Oct 2025 10:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760351741;
	bh=mSlTLpr9dlmJ/MLh0hm/KQWg73tObXOepMvzYnhvn+U=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=tujRhX6elWFk1HnyxG44dEeFYaKaNBLQH/8WjzO4isMctYz3Cql1ZVus9RmrS8XoU
	 KzZkEqMO80y49PmWdand+ZFxATx2FIlkX9wXmaLj2jAY0RyIVfxBlz+mFIIgareN6s
	 xSfsBJfz3EERw6w/vvefH7kOgY58ZXydNwQx1QgzBAN/zXb0fofU0IcX6YQ4kXzykO
	 Nr7oFHtfNjFisGCCrKeH2FdXn6D6eMuQSdy/svQ+zAmSbnksN2b5ZuFVzfPNNjU4Ym
	 p8+sZa8duSpBVIVf5vNkGeJxMp2rkzhV+1dpn3hlo6AiMzAhL5UoB7NjWEG1rl9D85
	 bs64liGYEIA2Q==
Message-ID: <958a157f-e01d-499c-9f3e-d19e33b1de74@kernel.org>
Date: Mon, 13 Oct 2025 12:35:38 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] media: saa6588: Fix unsafe debug printk macro
To: Shrikant Raskar <raskar.shree97@gmail.com>, hverkuil@kernel.org,
 mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250923175927.4380-1-raskar.shree97@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20250923175927.4380-1-raskar.shree97@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/09/2025 19:59, Shrikant Raskar wrote:
> The existing dprintk macro used an unwrapped `if` statement, which can lead
> to logic errors when used in if/else constructs. This patch wraps the macro
> in a do { } while (0) block to ensure safe usage.
> 
> This change resolves the following checkpatch error:
> ERROR: Macros starting with if should be enclosed by a do - while loop to
> avoid possible if/else logic defects
> 
> Signed-off-by: Shrikant Raskar <raskar.shree97@gmail.com>
> ---
>  drivers/media/i2c/saa6588.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/saa6588.c b/drivers/media/i2c/saa6588.c
> index fb09e4560d8a..71d34d229564 100644
> --- a/drivers/media/i2c/saa6588.c
> +++ b/drivers/media/i2c/saa6588.c
> @@ -50,7 +50,7 @@ MODULE_LICENSE("GPL");
>  
>  #define UNSET       (-1U)
>  #define PREFIX      "saa6588: "
> -#define dprintk     if (debug) printk
> +#define dprintk(fmt, args...)  do { if (debug) printk(fmt, ##args); } while (0)
>  
>  struct saa6588 {
>  	struct v4l2_subdev sd;

I think we can do better than this.

Looking at how dprintk is used in this driver, I see that in almost all cases
it is preceded by a 'if (debug > X)' condition. Except for one occurrence in
saa6588_configure().

So I would propose to just drop dprintk, and instead change dprintk to
pr_info and pr_cont. And add a 'if (debug)' in saa6588_configure().

Actually, v4l2_info(&s->sd, ...) would be even better, then the PREFIX can
be dropped as well.

Regards,

	Hans

