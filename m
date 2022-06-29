Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BA8755F9F2
	for <lists+linux-media@lfdr.de>; Wed, 29 Jun 2022 10:03:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231771AbiF2IA2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jun 2022 04:00:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231143AbiF2IAX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jun 2022 04:00:23 -0400
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECD3E3A70A
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 01:00:22 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 435A524001E;
        Wed, 29 Jun 2022 08:00:08 +0000 (UTC)
Date:   Wed, 29 Jun 2022 10:00:07 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Cc:     linuxfancy@googlegroups.com, linux-amarula@amarulasolutions.com,
        quentin.schulz@theobroma-systems.com,
        Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/7] media: ov5693: add dvdd into ov5693_supply_names
 array
Message-ID: <20220629080007.fbplnalzluuheqzk@uno.localdomain>
References: <20220627150453.220292-1-tommaso.merciai@amarulasolutions.com>
 <20220627150453.220292-3-tommaso.merciai@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220627150453.220292-3-tommaso.merciai@amarulasolutions.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tommaso

On Mon, Jun 27, 2022 at 05:04:48PM +0200, Tommaso Merciai wrote:
> Add missing "dvdd" (Digital circuit power) entry into ov5693_supply_names
> array
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>

Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
   j
> ---
>  drivers/media/i2c/ov5693.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
> index f410333c4c67..9e84468d920e 100644
> --- a/drivers/media/i2c/ov5693.c
> +++ b/drivers/media/i2c/ov5693.c
> @@ -132,6 +132,7 @@
>  static const char * const ov5693_supply_names[] = {
>  	"avdd",		/* Analog power */
>  	"dovdd",	/* Digital I/O power */
> +	"dvdd",		/* Digital circuit power */
>  };
>
>  #define OV5693_NUM_SUPPLIES	ARRAY_SIZE(ov5693_supply_names)
> --
> 2.25.1
>
