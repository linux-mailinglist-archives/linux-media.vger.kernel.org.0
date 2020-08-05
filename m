Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 391F723D246
	for <lists+linux-media@lfdr.de>; Wed,  5 Aug 2020 22:11:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728430AbgHEUKk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Aug 2020 16:10:40 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:57938 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726293AbgHEQ2Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Aug 2020 12:28:24 -0400
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 177683B10E3;
        Wed,  5 Aug 2020 12:49:58 +0000 (UTC)
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 34158C0009;
        Wed,  5 Aug 2020 12:47:31 +0000 (UTC)
Date:   Wed, 5 Aug 2020 14:51:13 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH] media: ov5640: Correct Bit Div register in clock tree
 diagram
Message-ID: <20200805125113.rhrhy6j6uccv3jmz@uno.localdomain>
References: <20200803090658.10073-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200803090658.10073-1-paul.kocialkowski@bootlin.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

On Mon, Aug 03, 2020 at 11:06:58AM +0200, Paul Kocialkowski wrote:
> Although the code is correct and doing the right thing, the clock diagram
> showed the wrong register for the bit divider, which had me doubting the
> understanding of the tree. Fix this to avoid doubts in the future.

Thanks for spotting this! Correct indeed!

I'm not sure it's worth a fixes tag, but just in case:
Fixes: aa2882481cada ("media: ov5640: Adjust the clock based on the expected rate")


Acked-by: Jacopo Mondi <jacopo@jmondi.org>
>
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  drivers/media/i2c/ov5640.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 854031f0b64a..fe08a45b0426 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -751,7 +751,7 @@ static int ov5640_mod_reg(struct ov5640_dev *sensor, u16 reg,
>   *               +->| PLL Root Div | - reg 0x3037, bit 4
>   *                  +-+------------+
>   *                    |  +---------+
> - *                    +->| Bit Div | - reg 0x3035, bits 0-3
> + *                    +->| Bit Div | - reg 0x3034, bits 0-3
>   *                       +-+-------+
>   *                         |  +-------------+
>   *                         +->| SCLK Div    | - reg 0x3108, bits 0-1
> --
> 2.26.2
>
