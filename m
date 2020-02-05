Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BD13153228
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2020 14:45:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728018AbgBENpu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Feb 2020 08:45:50 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:53950 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727995AbgBENpu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Feb 2020 08:45:50 -0500
Received: from [IPv6:2804:214:85ec:bd22:b29b:72b8:8fc3:cfae] (unknown [IPv6:2804:214:85ec:bd22:b29b:72b8:8fc3:cfae])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9B23F2947F3;
        Wed,  5 Feb 2020 13:45:46 +0000 (GMT)
Subject: Re: [PATCH] media: staging: rkisp1: fix test of return value of
 media_entity_get_fwnode_pad
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org
References: <20200204214446.20381-1-dafna.hirschfeld@collabora.com>
 <20200204214446.20381-2-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <c814ef05-24ab-d8d8-f839-c2228d0ad15f@collabora.com>
Date:   Wed, 5 Feb 2020 10:45:41 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200204214446.20381-2-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 2/4/20 7:44 PM, Dafna Hirschfeld wrote:
> media_entity_get_fwnode_pad returns negative value on error
> and the pad numeber on success. Therefore change the error test
> from 'if (ret)' to 'if (ret < 0)' .
> 
> Fixes: d65dd85281fb ("media: staging: rkisp1: add Rockchip ISP1 base driver")
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen

> ---
>  drivers/staging/media/rkisp1/rkisp1-dev.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-dev.c b/drivers/staging/media/rkisp1/rkisp1-dev.c
> index 21837d4dc9e1..9d866396a5de 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-dev.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-dev.c
> @@ -128,7 +128,7 @@ static int rkisp1_create_links(struct rkisp1_device *rkisp1)
>  
>  		ret = media_entity_get_fwnode_pad(&sd->entity, sd->fwnode,
>  						  MEDIA_PAD_FL_SOURCE);
> -		if (ret) {
> +		if (ret < 0) {
>  			dev_err(sd->dev, "failed to find src pad for %s\n",
>  				sd->name);
>  			return ret;
> 
