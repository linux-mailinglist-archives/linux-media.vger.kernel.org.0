Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B9B136B121
	for <lists+linux-media@lfdr.de>; Mon, 26 Apr 2021 11:57:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232547AbhDZJ5p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Apr 2021 05:57:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232140AbhDZJ5m (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Apr 2021 05:57:42 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD9D0C061574;
        Mon, 26 Apr 2021 02:56:15 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id h4so46138863wrt.12;
        Mon, 26 Apr 2021 02:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=fFrpLw8QRN6vigSnYp4kRiIX6O8iZ1qdCoLeSD99j/E=;
        b=UiEbq31xW2yfzewFdiGOSvdnzzU6gwgQVDxyFgADH4SPXqxFMyLJixhfCzNDXTtDfc
         pwWWi6aH52QE6G0CbN9XhZJPUUD8Aifh8hnJBWgr9qWp+TDxtPWc/dGnZBJrATrd+ziY
         sEIFzL32gpG0FuhVgMyAhl+cDBceXNQAhTYs7SSKpT1d1NI+pXSSZbEudhuXA7f5t1Ac
         PXiifXApotpnd5iPe8KL5/cLQo/OpN3lVFTTTatB+GL5QjzItLhOga6tt4HlFgaCp6Cp
         XoI4FTTrBBjxmL+MqNR5kSEg/7akCSPUBNCHa5W5lQLiTI67ZbWoadBO6Vs+FFsUzbv3
         ctkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fFrpLw8QRN6vigSnYp4kRiIX6O8iZ1qdCoLeSD99j/E=;
        b=n//+ugT01sGzOoMo4HcmVcPf/HIHMrBuJiCjUa+FY+BjDv5r1aZ1xq3aL01C2u3ZUG
         ffF74Iy85kZ1iFxWIbFNxFaQiH5Bexm0LJaIEqTa138Uy7I6hEqtTi1VRMqJv9nD9uJt
         aAUHKOuJ6mKn0Us3MgvScCf+BfkD0ls8wWoFZwYfvMzzSRhGAdpMIEYsCgZ2yVzonutS
         WSshyUvtHBd+HAiHSS9m5hLnrzTRovG+J/Iokok1bNVBLUi25JeQADmzl5QO+7cxd8sV
         lDOB5EYfPYroPIP4rF34dXHUbA/Vb77xFv76vwkSPfF4JsY1s8zX4FFCcwtp8CM9XAd4
         8jZA==
X-Gm-Message-State: AOAM532GllIeW3bhhQjHpJGLgAa3qeMdoC6u7TfJEwge5jszJkgcxZfp
        vgy419svrLqQfDFUzXlUfTU=
X-Google-Smtp-Source: ABdhPJwyZo7M9v9oTq0MC2DAArmuW17pnDqMMx5MQN3viGqRyyswS0Esyw61bJbNTggDDszdzo8IYA==
X-Received: by 2002:a5d:414c:: with SMTP id c12mr21939668wrq.392.1619430974371;
        Mon, 26 Apr 2021 02:56:14 -0700 (PDT)
Received: from agape.jhs ([5.171.73.32])
        by smtp.gmail.com with ESMTPSA id l20sm18251702wmg.33.2021.04.26.02.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Apr 2021 02:56:14 -0700 (PDT)
Date:   Mon, 26 Apr 2021 11:56:11 +0200
From:   Fabio Aiuto <fabioaiuto83@gmail.com>
To:     Deepak R Varma <drv@mailo.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v3 2/6] staging: media: atomisp: balance braces
 around if...else block
Message-ID: <20210426095610.GA1418@agape.jhs>
References: <cover.1619199344.git.drv@mailo.com>
 <71220662c5facd746e56288cc74786c96fa3c5a7.1619199344.git.drv@mailo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71220662c5facd746e56288cc74786c96fa3c5a7.1619199344.git.drv@mailo.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Apr 25, 2021 at 02:12:20PM +0530, Deepak R Varma wrote:
> Balance braces around the if else blocks as per the code style guidelines.
> Resolves checkpatch script CHECK / WARNING feedback messages.
> 
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
> 
> Changes since v2:
>    - None.
> Changes since v1:
>    - None.
> 
>  drivers/staging/media/atomisp/i2c/atomisp-gc0310.c  | 4 ++--
>  drivers/staging/media/atomisp/i2c/atomisp-gc2235.c  | 4 ++--
>  drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c | 4 ++--
>  drivers/staging/media/atomisp/i2c/atomisp-ov2680.c  | 7 ++++---
>  drivers/staging/media/atomisp/i2c/atomisp-ov2722.c  | 4 ++--
>  5 files changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> index 6be3ee1d93a5..d68a2bcc9ae1 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> @@ -872,9 +872,9 @@ static int gc0310_s_power(struct v4l2_subdev *sd, int on)
>  {
>  	int ret;
>  
> -	if (on == 0)
> +	if (on == 0) {
>  		return power_down(sd);
> -	else {
> +	} else {
>  		ret = power_up(sd);
>  		if (!ret)
>  			return gc0310_init(sd);
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> index 6ba4a8adff7c..e722c639b60d 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> @@ -658,9 +658,9 @@ static int gc2235_s_power(struct v4l2_subdev *sd, int on)
>  {
>  	int ret;
>  
> -	if (on == 0)
> +	if (on == 0) {
>  		ret = power_down(sd);
> -	else {
> +	} else {
>  		ret = power_up(sd);
>  		if (!ret)
>  			ret = __gc2235_init(sd);
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> index f5de81132177..465fc4468442 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> @@ -568,9 +568,9 @@ static int power_down(struct v4l2_subdev *sd)
>  
>  static int mt9m114_s_power(struct v4l2_subdev *sd, int power)
>  {
> -	if (power == 0)
> +	if (power == 0) {
>  		return power_down(sd);
> -	else {
> +	} else {
>  		if (power_up(sd))
>  			return -EINVAL;
>  
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> index c90730513438..92c52431bd8f 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> @@ -461,11 +461,12 @@ static int ov2680_v_flip(struct v4l2_subdev *sd, s32 value)
>  	ret = ov2680_read_reg(client, 1, OV2680_FLIP_REG, &val);
>  	if (ret)
>  		return ret;
> -	if (value) {
> +
> +	if (value)
>  		val |= OV2680_FLIP_MIRROR_BIT_ENABLE;
> -	} else {
> +	else
>  		val &= ~OV2680_FLIP_MIRROR_BIT_ENABLE;
> -	}
> +

Hi Deepak,

what you did above is not what is written in the commit message
description about. Here unneeded bracks are removed in both
branches, is not a matter of braces balancing.

thank you,

fabio 

>  	ret = ov2680_write_reg(client, 1,
>  			       OV2680_FLIP_REG, val);
>  	if (ret)
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> index aec7392fd1de..d046a9804f63 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> @@ -772,9 +772,9 @@ static int ov2722_s_power(struct v4l2_subdev *sd, int on)
>  {
>  	int ret;
>  
> -	if (on == 0)
> +	if (on == 0) {
>  		return power_down(sd);
> -	else {
> +	} else {
>  		ret = power_up(sd);
>  		if (!ret)
>  			return ov2722_init(sd);
> -- 
> 2.25.1
> 
> 
> 
> 
