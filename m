Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C74C245F53A
	for <lists+linux-media@lfdr.de>; Fri, 26 Nov 2021 20:33:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233186AbhKZTgM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Nov 2021 14:36:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232948AbhKZTeJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Nov 2021 14:34:09 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73533C061D71
        for <linux-media@vger.kernel.org>; Fri, 26 Nov 2021 10:57:06 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4FD6262330;
        Fri, 26 Nov 2021 18:55:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7230EC93056;
        Fri, 26 Nov 2021 18:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637952904;
        bh=gtBDOf+Hvarye7/1kb+5zZAMsxQUS/gW1IZ5yAwRGiM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hUmRsRUW1H/ipwzlnhHGll3UMynD470cUbdTAwfhmLF8KmHg+J1ngYLCViOgkCsbS
         wmQoK7zcK75pqNHGp5jO4JrbMA4DGXNTZK9KToZbwcdfbjZI3YgBHb4zlpcqMxIr5c
         D9tKhIT4+ZBca8wM7NXtPcncKdmZfA/aVQ7YwLOt0mAwArl3zVjqbqzq9d2RF/buEr
         dPUfRBVm5OwRFgN6LKHWAkSkJQcuub/ywkomAo0ZacLCDGLl3oDLfkyxK3OyO+QcEy
         ScIIAsTadrjix6xa+CzdaquSq80vT9ToG4BddfQ2f+DJjsBTDZDtqsfreX1MYJ8Ngt
         rgsu/pdNRychg==
Date:   Fri, 26 Nov 2021 11:54:58 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        llvm@lists.linux.dev
Subject: Re: [PATCH 01/20] media: adv7842: get rid of two unused functions
Message-ID: <YaEtgrPMAcrjJdYa@archlinux-ax161>
References: <cover.1637781097.git.mchehab+huawei@kernel.org>
 <e97de1cfd545c5861634619112770cf0710a6241.1637781097.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e97de1cfd545c5861634619112770cf0710a6241.1637781097.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 24, 2021 at 08:13:04PM +0100, Mauro Carvalho Chehab wrote:
> Those functions just call a V4L2 core macro, and aren't used
> anywhere. Get rid of them, in order to avoid clang warnings with
> W=1.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH 00/20] at: https://lore.kernel.org/all/cover.1637781097.git.mchehab+huawei@kernel.org/
> 
>  drivers/media/i2c/adv7842.c | 10 ----------
>  1 file changed, 10 deletions(-)
> 
> diff --git a/drivers/media/i2c/adv7842.c b/drivers/media/i2c/adv7842.c
> index 7f8acbdf0db4..9d6eed0f8281 100644
> --- a/drivers/media/i2c/adv7842.c
> +++ b/drivers/media/i2c/adv7842.c
> @@ -256,21 +256,11 @@ static inline struct v4l2_subdev *to_sd(struct v4l2_ctrl *ctrl)
>  	return &container_of(ctrl->handler, struct adv7842_state, hdl)->sd;
>  }
>  
> -static inline unsigned hblanking(const struct v4l2_bt_timings *t)
> -{
> -	return V4L2_DV_BT_BLANKING_WIDTH(t);
> -}
> -
>  static inline unsigned htotal(const struct v4l2_bt_timings *t)
>  {
>  	return V4L2_DV_BT_FRAME_WIDTH(t);
>  }
>  
> -static inline unsigned vblanking(const struct v4l2_bt_timings *t)
> -{
> -	return V4L2_DV_BT_BLANKING_HEIGHT(t);
> -}
> -
>  static inline unsigned vtotal(const struct v4l2_bt_timings *t)
>  {
>  	return V4L2_DV_BT_FRAME_HEIGHT(t);
> -- 
> 2.33.1
> 
> 
