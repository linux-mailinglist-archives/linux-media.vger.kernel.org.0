Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A187145F5B1
	for <lists+linux-media@lfdr.de>; Fri, 26 Nov 2021 21:16:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239666AbhKZUTd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Nov 2021 15:19:33 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:51692 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231844AbhKZURd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Nov 2021 15:17:33 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 68B6162289;
        Fri, 26 Nov 2021 20:14:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E543CC9305B;
        Fri, 26 Nov 2021 20:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637957658;
        bh=LJWDp+epUzTOajbnEOG6waIEKyhlcG6XiZRuDYcGmts=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AXqQ7vDDjbCN0LkAS9r6pQjFXF7+2kAJnyOhF4goP8ofkPUg3UaYs1UhscAPGM7NB
         I8Z86dQhRFipy/L0aWQdnOfrMIvw4rIPfgVLMN/ffPVnQJQJroslddp0lKt3LuXJeT
         LUyVDXrW+gTZ9vD89+RFr8Ht9wGAeujuEfhsa1XtUhiMGuSxkJO8p/Smg4whsaJnCT
         W1TYuMHuD9730Voa4lr4gVKexb3yeg8joEtTTUe0J7noGhlibicNdJV0KDsWPohYsG
         zXlVUi5Xk+vRXCeD2czkBtIOYvvzZvZ6fJf6z3DcJ5mIsfV1r1TAWVDWfXVYVkVtN9
         Tp9GeXJ4rGRHw==
Date:   Fri, 26 Nov 2021 13:14:13 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Xiaofeng Cao <caoxiaofeng@yulong.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 10/20] media: radio-si476x: drop a container_of()
 abstraction macro
Message-ID: <YaFAFQkfEl1Mcykj@archlinux-ax161>
References: <cover.1637781097.git.mchehab+huawei@kernel.org>
 <85bd768b1525f29a5710c2139bfa241fc7565fe1.1637781097.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85bd768b1525f29a5710c2139bfa241fc7565fe1.1637781097.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 24, 2021 at 08:13:13PM +0100, Mauro Carvalho Chehab wrote:
> This isn't used anywhere. So, drop it.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH 00/20] at: https://lore.kernel.org/all/cover.1637781097.git.mchehab+huawei@kernel.org/
> 
>  drivers/media/radio/radio-si476x.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/media/radio/radio-si476x.c b/drivers/media/radio/radio-si476x.c
> index b39a68f83c5f..0bf99e1cd1d8 100644
> --- a/drivers/media/radio/radio-si476x.c
> +++ b/drivers/media/radio/radio-si476x.c
> @@ -312,12 +312,6 @@ struct si476x_radio {
>  	u32 audmode;
>  };
>  
> -static inline struct si476x_radio *
> -v4l2_dev_to_radio(struct v4l2_device *d)
> -{
> -	return container_of(d, struct si476x_radio, v4l2dev);
> -}
> -
>  static inline struct si476x_radio *
>  v4l2_ctrl_handler_to_radio(struct v4l2_ctrl_handler *d)
>  {
> -- 
> 2.33.1
> 
> 
