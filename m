Return-Path: <linux-media+bounces-15966-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BA40B94B78C
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2024 09:19:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EBD811C22B86
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2024 07:19:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B5B5188011;
	Thu,  8 Aug 2024 07:16:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19A7184101;
	Thu,  8 Aug 2024 07:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723101417; cv=none; b=Vxt5w/LIC8lZBhKgBEJcVs2JLDRP0xtzJ+teuVBN7mnda1Cp3Fphl1l/eplQ6jtajKBOlihzv0Dzpy6+WAZLJIxOx+3XSIndCDAA3mbxQgYMh4typoV6cFkoCFZFGLnAuhD/7Z1EROaWRr2jyQHDTEPjhZ4oRsU+vedpyGUV27A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723101417; c=relaxed/simple;
	bh=GNX17Az60YeGKt7Nfwq+OgDxEzfrTgVDWi+qZPpSRAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=J0Anpcz5SgUMsfTuBJ8LK35yHWQiY/TPhnPWqy3DpP4Uy/h6yybN5Egh5nHnoTpJvd/1ay15xERCwx6dbIlbH8dt7a63gh7DQ3LNNRbdabSxUTHvZMjt9x4lYII7uUH5tseSXveFOCSTvBMkICbnYSvHoRtIKJACn7OdYOE74Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 948ADC32782;
	Thu,  8 Aug 2024 07:16:55 +0000 (UTC)
Message-ID: <4f571812-9f3b-4285-8745-76a511e143d6@xs4all.nl>
Date: Thu, 8 Aug 2024 09:16:54 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: aspeed: fix clock stopping logic
To: Phil Eichinger <phil@zankapfel.net>, eajames@linux.ibm.com,
 mchehab@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
 sboyd@kernel.org, jae.hyun.yoo@linux.intel.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jammy Huang <jammy_huang@aspeedtech.com>
References: <20240719094056.1169057-1-phil@zankapfel.net>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240719094056.1169057-1-phil@zankapfel.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

+Jammy Huang

Jammy,

Can you review this patch? It looks OK to me, but I wonder if in aspeed_video_on
the order of the clocks should be reversed as well to match the new video_off
sequence.

Regards,

	Hans

On 19/07/2024 11:40, Phil Eichinger wrote:
> When stopping clocks for Video Capture and Video Engine in
> aspeed_video_off() the order is reversed.
> 
> Occasionally during screen blanking hard lock-ups occur on AST2500,
> accompanied by the heart beat LED stopping.
> 
> Stopping Video Capture clock before Video Engine seems logical and fixes
> the random lock-ups.
> 
> Fixes: 3536169f8531 ("media: aspeed: fix clock handling logic")
> Signed-off-by: Phil Eichinger <phil@zankapfel.net>
> ---
>  drivers/media/platform/aspeed/aspeed-video.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
> index fc6050e3be0d..8f1f3c847162 100644
> --- a/drivers/media/platform/aspeed/aspeed-video.c
> +++ b/drivers/media/platform/aspeed/aspeed-video.c
> @@ -661,8 +661,8 @@ static void aspeed_video_off(struct aspeed_video *video)
>  	aspeed_video_write(video, VE_INTERRUPT_STATUS, 0xffffffff);
>  
>  	/* Turn off the relevant clocks */
> -	clk_disable(video->eclk);
>  	clk_disable(video->vclk);
> +	clk_disable(video->eclk);
>  
>  	clear_bit(VIDEO_CLOCKS_ON, &video->flags);
>  }


