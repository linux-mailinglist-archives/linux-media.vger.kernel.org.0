Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE0864DD5BA
	for <lists+linux-media@lfdr.de>; Fri, 18 Mar 2022 09:01:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233516AbiCRIBb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Mar 2022 04:01:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233512AbiCRIBW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Mar 2022 04:01:22 -0400
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::225])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E427017FD16;
        Fri, 18 Mar 2022 01:00:01 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id E12BB1C0002;
        Fri, 18 Mar 2022 07:59:59 +0000 (UTC)
Date:   Fri, 18 Mar 2022 08:59:58 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: platform: renesas-ceu: Fix unused variable warning
Message-ID: <20220318075958.bdafvfgagtboy3ge@uno.localdomain>
References: <20220317204903.28163-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220317204903.28163-1-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Thu, Mar 17, 2022 at 10:49:03PM +0200, Laurent Pinchart wrote:
> The ceu_data_rz variable is unused when CONFIG_OF isn't set. This
> generates a compiler warning. Fix it.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks!
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>


> ---
>  drivers/media/platform/renesas/renesas-ceu.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/platform/renesas/renesas-ceu.c b/drivers/media/platform/renesas/renesas-ceu.c
> index 2e8dbacc414e..f70f91b006b7 100644
> --- a/drivers/media/platform/renesas/renesas-ceu.c
> +++ b/drivers/media/platform/renesas/renesas-ceu.c
> @@ -1606,15 +1606,15 @@ struct ceu_data {
>  	u32 irq_mask;
>  };
>
> -static const struct ceu_data ceu_data_rz = {
> -	.irq_mask = CEU_CETCR_ALL_IRQS_RZ,
> -};
> -
>  static const struct ceu_data ceu_data_sh4 = {
>  	.irq_mask = CEU_CETCR_ALL_IRQS_SH4,
>  };
>
>  #if IS_ENABLED(CONFIG_OF)
> +static const struct ceu_data ceu_data_rz = {
> +	.irq_mask = CEU_CETCR_ALL_IRQS_RZ,
> +};
> +
>  static const struct of_device_id ceu_of_match[] = {
>  	{ .compatible = "renesas,r7s72100-ceu", .data = &ceu_data_rz },
>  	{ .compatible = "renesas,r8a7740-ceu", .data = &ceu_data_rz },
>
> base-commit: 10ed1ec9c9cab63310038579c2e1303324bfa44a
> --
> Regards,
>
> Laurent Pinchart
>
