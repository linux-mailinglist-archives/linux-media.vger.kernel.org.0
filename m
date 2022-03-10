Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A45C4D4314
	for <lists+linux-media@lfdr.de>; Thu, 10 Mar 2022 10:06:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238042AbiCJJHX convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 10 Mar 2022 04:07:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236482AbiCJJHX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Mar 2022 04:07:23 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0206F138597
        for <linux-media@vger.kernel.org>; Thu, 10 Mar 2022 01:06:23 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1nSEkW-0005J8-Lw; Thu, 10 Mar 2022 10:06:20 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1nSEkV-003qSW-FH; Thu, 10 Mar 2022 10:06:18 +0100
Received: from pza by lupine with local (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1nSEkU-0002aG-2K; Thu, 10 Mar 2022 10:06:18 +0100
Message-ID: <f78fdc3b9c97230311a022f79070ab78877ccd20.camel@pengutronix.de>
Subject: Re: [PATCH 2/3] media: vsp1: Add support to deassert/assert reset
 line
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Date:   Thu, 10 Mar 2022 10:06:18 +0100
In-Reply-To: <20220309194521.7028-3-biju.das.jz@bp.renesas.com>
References: <20220309194521.7028-1-biju.das.jz@bp.renesas.com>
         <20220309194521.7028-3-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Biju,

On Mi, 2022-03-09 at 19:45 +0000, Biju Das wrote:
[...]
> @@ -569,7 +570,19 @@ static void vsp1_mask_all_interrupts(struct
> vsp1_device *vsp1)
>   */
>  int vsp1_device_get(struct vsp1_device *vsp1)
>  {
> -       return pm_runtime_resume_and_get(vsp1->dev);
> +       int ret = reset_control_deassert(vsp1->rstc);
> +
> +       if (ret < 0)
> +               goto err;
> +
> +       ret = pm_runtime_resume_and_get(vsp1->dev);
> +       if (ret < 0)
> +               goto err;
> +
> +       return 0;
> +err:
> +       reset_control_assert(vsp1->rstc);
> +       return ret;
>  }
>  
>  /*
> @@ -581,6 +594,7 @@ int vsp1_device_get(struct vsp1_device *vsp1)
>  void vsp1_device_put(struct vsp1_device *vsp1)
>  {
>         pm_runtime_put_sync(vsp1->dev);
> +       reset_control_assert(vsp1->rstc);

Now the comment above doesn't fit anymore, since reset_control_assert
is not reference counted in case vsp1->rstc has exclusive control:

/*                                                                                                                                            
 * vsp1_device_put - Release the VSP1 device                                                                                                  
 *                                                                                                                                            
 * Decrement the VSP1 reference count and cleanup the device if the last                                                                      
 * reference is released.                                                                                                                     
 */  

regards
Philipp
