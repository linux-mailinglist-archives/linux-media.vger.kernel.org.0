Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 764D2209D3A
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2020 13:05:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404140AbgFYLFi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jun 2020 07:05:38 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:42309 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2404135AbgFYLFh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jun 2020 07:05:37 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id oPh4jenqO97i5oPhBjVesi; Thu, 25 Jun 2020 13:05:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1593083135; bh=weU4JmQLlWhZvLdZf3KCuYvnbwNey9WayGdTSOxoiiA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=UymqP3b6ZGCUAw5KO3OgN3M05RMxzYAmKEhNIK5jqCyesYGNY6TMeioEQyz08ycHp
         Rfvh0tY7i49loIYauppcbieTSxQF3ZzRJNlEzQMjVHQfXsrntjH3PuzQMy74wKy544
         6PnRnmHK2pEU76Q/kQVAJNTgm5sn6C4JBf1Y3HTHotUeSL7ArvVV0WpHk2WASL4ZyY
         Nj3LQYIFJK27EdTk/7lxbGyO3b+/nBQdgRBHElIQKOz9kYVHzkrVfRNWJZXwT+Jjwu
         E0GqzNOna/jCiNqnmdHYnVZ8kqTWWwJcL2V6CBnNetxeeUf4+G/FB5eiKt9BwoLoP9
         PX8oSwOHOA7NA==
Subject: Re: [PATCH] media: i2c: tvp5150: Fix horizontal crop stop boundry
To:     Robin van der Gracht <robin@protonic.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Marco Felsch <m.felsch@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Andreas Pretzsch <apr@cn-eng.de>
References: <20190917071442.24986-1-robin@protonic.nl>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <23cbd4c0-b53e-d01f-e6d6-b4d2d689bb59@xs4all.nl>
Date:   Thu, 25 Jun 2020 13:05:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20190917071442.24986-1-robin@protonic.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLhaxhQe8g30ybcfYCwJLKehBtAxYBjc6Rbnv56NHC2zhbP/YsVBhDCZ7ioHZ6ms8Q/k62Bf/tPNb7GjvW2oD9e//mLiYEyUNULs+GqEd/5r84scJHJM
 2wmErvxx+0nOAqgGYXWCeUbc8vIGXnKsXOjLxkFnxiGbOY1ZjAqU/aOP22q8imENZKnxnNJ2eFH80Ivxmb4ncisppHduZ8eNNUB2KhuJNjt9ie2w6hoa1p94
 ty8R007NI50mrUCfbEa6f8fFZOCJfYtSVkW5c0/hfqoY1IfncjmNnPwX9THv75lhtxAcQQ7kElNicul+xSDF7s2lj0mhkbnw1lGBOq7YO9qO55jaGkZCwQDD
 Elo1bFLZz4sZaQCScXzgu4CWyKQCWQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17/09/2019 09:14, Robin van der Gracht wrote:
> The value for AVID stop is relative to the width of the active video area,
> not the maximum register value. Zero means equal and a negative value means
> we're cropping on the right side.

While going through old unreviewed patches I came across this one (sorry Robin,
your patch fell through the cracks).

Can someone verify/test that this is correct? Marco perhaps?

Regards,

	Hans

> 
> Signed-off-by: Robin van der Gracht <robin@protonic.nl>
> ---
>  drivers/media/i2c/tvp5150.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
> index f47cb9a023fb..6bc65ab5e8ab 100644
> --- a/drivers/media/i2c/tvp5150.c
> +++ b/drivers/media/i2c/tvp5150.c
> @@ -1231,10 +1231,10 @@ __tvp5150_set_selection(struct v4l2_subdev *sd, struct v4l2_rect rect)
>  	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_ST_LSB,
>  		     rect.left | (1 << TVP5150_CROP_SHIFT));
>  	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_STP_MSB,
> -		     (rect.left + rect.width - TVP5150_MAX_CROP_LEFT) >>
> +		     (rect.left + rect.width - TVP5150_H_MAX) >>
>  		     TVP5150_CROP_SHIFT);
>  	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_STP_LSB,
> -		     rect.left + rect.width - TVP5150_MAX_CROP_LEFT);
> +		     rect.left + rect.width - TVP5150_H_MAX);
>  }
>  
>  static int tvp5150_set_selection(struct v4l2_subdev *sd,
> 

