Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81EEA3A5DE3
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 09:48:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232562AbhFNHuc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 03:50:32 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:58119 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232520AbhFNHua (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 03:50:30 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id D8D5724001A;
        Mon, 14 Jun 2021 07:48:25 +0000 (UTC)
Date:   Mon, 14 Jun 2021 09:49:15 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Zou Wei <zou_wei@huawei.com>
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] media: mt9v111: Add missing MODULE_DEVICE_TABLE
Message-ID: <20210614074915.y5w2umeh3j7s5s32@uno.localdomain>
References: <1620704856-104451-1-git-send-email-zou_wei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1620704856-104451-1-git-send-email-zou_wei@huawei.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Zou

On Tue, May 11, 2021 at 11:47:36AM +0800, Zou Wei wrote:
> This patch adds missing MODULE_DEVICE_TABLE definition which generates
> correct modalias for automatic loading of this driver when it is built
> as an external module.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zou Wei <zou_wei@huawei.com>

Sorry for getting late on this

Acked-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
   j

> ---
>  drivers/media/i2c/mt9v111.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/media/i2c/mt9v111.c b/drivers/media/i2c/mt9v111.c
> index 97c7527..f16e632 100644
> --- a/drivers/media/i2c/mt9v111.c
> +++ b/drivers/media/i2c/mt9v111.c
> @@ -1260,6 +1260,7 @@ static const struct of_device_id mt9v111_of_match[] = {
>  	{ .compatible = "aptina,mt9v111", },
>  	{ /* sentinel */ },
>  };
> +MODULE_DEVICE_TABLE(of, mt9v111_of_match);
>
>  static struct i2c_driver mt9v111_driver = {
>  	.driver = {
> --
> 2.6.2
>
