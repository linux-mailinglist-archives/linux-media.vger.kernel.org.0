Return-Path: <linux-media+bounces-35573-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF7EAE370D
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 09:35:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 123FB3B4378
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 07:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B20CB2236E8;
	Mon, 23 Jun 2025 07:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Mtian0T9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832F31F8733;
	Mon, 23 Jun 2025 07:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750663989; cv=none; b=Xlfm/bKAJoyEz4yccAB2FZEgXaWchjhVwsaI1r8U2Y2Mv6FCitqGCYVHm8cBVjTgz7XCX7TusBouJNUjsp+20lcTfqEnE7zz8oJMRiSTMuyUJa6V3yjC5l4ODFhThdq343yhWSoJyVAa8i6CoKBfycH2ELeEUFdF3nxjho7m9as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750663989; c=relaxed/simple;
	bh=UayubYFz5rJKfTFo7YJBUpKr2fJ6BCeCBp0NkuGx4oY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WAEeTQoNi/IkEh+FybVHpG9ccu+AC/jpkAiNdwatSvxB2T41cetN8mw+Eyu0eLSITVEOrn9C/s/p8KjJ6l2fg7NMAlqzNAqsLR8JcxTJrPMPALF2JNxOFafNMslxo4I9KwDqBwsygiGq8kVlt69w5VX38zUPNXpX/GNuz/ji9qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Mtian0T9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-136-88.net.vodafone.it [5.90.136.88])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7CD6A42B;
	Mon, 23 Jun 2025 09:32:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750663963;
	bh=UayubYFz5rJKfTFo7YJBUpKr2fJ6BCeCBp0NkuGx4oY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mtian0T95yK+3hjMa53YLyq/MPgfzriYR7LJNGhIEZEg1sqOvdp+P7W0uHB8LxVxL
	 6flQ2G0eVMN9gDaB1huau+Wry4fPMqTFkG2i03m7YG+01e402gGtWlhrsLWpFZc2B6
	 /RuwSol7spkqGDK6ng+rfpJUicAVNJrZN2yBig8Q=
Date: Mon, 23 Jun 2025 09:32:56 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Zhang Shurong <zhang_shurong@foxmail.com>
Cc: jacopo@jmondi.org, mchehab@kernel.org, u.kleine-koenig@pengutronix.de, 
	hverkuil@xs4all.nl, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] media: rj54n1cb0c: Fix memleak in rj54n1_probe()
Message-ID: <vlkde3efn6rvcu7qppql263mst25ioym24q2o2gcxjf4z6er2e@m4wyclvott4b>
References: <tencent_A9851A542D89AE1B94DA80AD2CB0280F5907@qq.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <tencent_A9851A542D89AE1B94DA80AD2CB0280F5907@qq.com>

Hi Zhang

On Mon, Jun 23, 2025 at 10:26:04AM +0800, Zhang Shurong wrote:
> rj54n1_probe() won't clean all the allocated resources in fail
> path, which may causes the memleaks. Add v4l2_ctrl_handler_free() to
> prevent memleak.
>
> Fixes: f187352dcd45 ("media: i2c: Copy rj54n1cb0c soc_camera sensor driver")

No empty line between this two I think

>
> Signed-off-by: Zhang Shurong <zhang_shurong@foxmail.com>
> ---
> Changes in v2:
> - Fixed compile error
> Changes in v3:
> - Fixed coding style warnings identified by scripts/checkpatch.pl
> ---
>  drivers/media/i2c/rj54n1cb0c.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/rj54n1cb0c.c b/drivers/media/i2c/rj54n1cb0c.c
> index b7ca39f63dba..a2fe906408c5 100644
> --- a/drivers/media/i2c/rj54n1cb0c.c
> +++ b/drivers/media/i2c/rj54n1cb0c.c
> @@ -1330,8 +1330,10 @@ static int rj54n1_probe(struct i2c_client *client)
>  	v4l2_ctrl_new_std(&rj54n1->hdl, &rj54n1_ctrl_ops,
>  			V4L2_CID_AUTO_WHITE_BALANCE, 0, 1, 1, 1);
>  	rj54n1->subdev.ctrl_handler = &rj54n1->hdl;

Could you move this after the  below check ?

> -	if (rj54n1->hdl.error)
> +	if (rj54n1->hdl.error) {
> +		v4l2_ctrl_handler_free(&rj54n1->hdl);
>  		return rj54n1->hdl.error;

There already is a label "err_free_ctrl" you could jump to with

                ret = rj54n1->hdl.error;
                goto err_free_ctrl;

Doesn't make much difference, so I guess it's up to what you like the
best here.

Thanks
  j

> +	}
>
>  	rj54n1->clk_div		= clk_div;
>  	rj54n1->rect.left	= RJ54N1_COLUMN_SKIP;
> --
> 2.39.5
>

