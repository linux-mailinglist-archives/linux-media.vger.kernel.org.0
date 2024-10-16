Return-Path: <linux-media+bounces-19720-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0F59A02D6
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 09:41:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 675801C2475A
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 07:41:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 555CF1C233A;
	Wed, 16 Oct 2024 07:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="miGEiOQo"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D8E15C145;
	Wed, 16 Oct 2024 07:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729064476; cv=none; b=fQWCXvpKigqo8BBLn+6MGtjNPEN9JgWL7G/MTL5qIvSMxLU/czysDftqSSC+2cZuHzdIKudULuISjRTQAIx1VJGEA/qWuYWB4cub32M78AccYFwZt7qPbZy2e9xY5sfC+A31jf7N5CvRvlrka5l0MF/p9weJVdPCoW16v8nZrkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729064476; c=relaxed/simple;
	bh=tKXMfFBGIn5G5s0ymqFGFyYf7iX+GK9QcNqPHOg8eWE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qwTnSsLkzmP/2bf4DAThwNYUwiba7wmwBnN7uKEHhD+dl1HsokLOATxrB0bkmvymbHmZGFuyZRpwQVrLtYZyfC5mZrOf+44c1fZ9VsnY98yGXcmMas8BhtXDDvtPg4AWqahB1uBq59ddiiXsYOwyNUrp4bEsH7MVYnM1csOtOew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=miGEiOQo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7657DC4CEC5;
	Wed, 16 Oct 2024 07:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729064476;
	bh=tKXMfFBGIn5G5s0ymqFGFyYf7iX+GK9QcNqPHOg8eWE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=miGEiOQocvAdudkhHImLi7l7i0GEvzwAcDLKeRqGmSDE8lf44MvsJFepQUYxkP2hn
	 hxeAcMMaRoYSiIUxu6Cafxh11vzjkTBDMbt1hsNWNrXiyf3crNTQ9PU9pjTvmFDfHq
	 vkjW/kfYU2frshBxgGOWcu31Z3xeo3KsAK7XBnW3yutgI8M82RHSXO3O33Waqz/5ki
	 S6oz8/61IM95Eh+fuzkMVlGh5es7i2NMcNrSqesoCuvNoa41FYwjwvNxtvqA/wJB6F
	 WxUtpwcJk6ccfKOYttSh1UXnfY9E/AtI4TYMaA6HhelWSIeC3EDxolfvfUu8CMjtqo
	 KqN968u6AdlAA==
Date: Wed, 16 Oct 2024 09:41:11 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] media: i2c: ds90ub960: Fix missing return check
 on ub960_rxport_read call
Message-ID: <20241016094111.7f5e899a@foz.lan>
In-Reply-To: <20241002165329.957739-1-colin.i.king@gmail.com>
References: <20241002165329.957739-1-colin.i.king@gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Wed,  2 Oct 2024 17:53:29 +0100
Colin Ian King <colin.i.king@gmail.com> escreveu:

> The function ub960_rxport_read is being called and afterwards ret is
> being checked for any failures, however ret is not being assigned to
> the return of the function call. Fix this by assigning ret to the
> return of the call which appears to be missing.
> 
> Fixes: afe267f2d368 ("media: i2c: add DS90UB960 driver")
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

No Cc: stable. Please follow the submission rules for fixes as stated
at:
	Documentation/process/stable-kernel-rules.rst

In summary, all patches containing fixes shall have a Cc stable. There 
are rules there for the very few exceptions where a patch is not meant
to be backported:

     Cc: <stable+noautosel@kernel.org> # reason goes here, and must be present



> ---
>  drivers/media/i2c/ds90ub960.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
> index ffe5f25f8647..58424d8f72af 100644
> --- a/drivers/media/i2c/ds90ub960.c
> +++ b/drivers/media/i2c/ds90ub960.c
> @@ -1286,7 +1286,7 @@ static int ub960_rxport_get_strobe_pos(struct ub960_data *priv,
>  
>  	clk_delay += v & UB960_IR_RX_ANA_STROBE_SET_CLK_DELAY_MASK;
>  
> -	ub960_rxport_read(priv, nport, UB960_RR_SFILTER_STS_1, &v);
> +	ret = ub960_rxport_read(priv, nport, UB960_RR_SFILTER_STS_1, &v);
>  	if (ret)
>  		return ret;
>  



Thanks,
Mauro

