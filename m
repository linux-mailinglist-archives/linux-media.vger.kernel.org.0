Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B70E85403F6
	for <lists+linux-media@lfdr.de>; Tue,  7 Jun 2022 18:41:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245690AbiFGQld (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jun 2022 12:41:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344075AbiFGQlb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Jun 2022 12:41:31 -0400
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43A45C9644
        for <linux-media@vger.kernel.org>; Tue,  7 Jun 2022 09:41:30 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 6C931E0004;
        Tue,  7 Jun 2022 16:41:27 +0000 (UTC)
Date:   Tue, 7 Jun 2022 18:41:25 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        dafna@fastmail.com, heiko@sntech.de, foss+kernel@0leil.net
Subject: Re: [PATCH] media: rkisp1: Don't create data links for non-sensor
 subdevs
Message-ID: <20220607164125.oabtqz6kh5bo6k6v@uno.localdomain>
References: <20220606225149.2941160-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220606225149.2941160-1-djrscally@gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan

On Mon, Jun 06, 2022 at 11:51:49PM +0100, Daniel Scally wrote:
> With the introduction of ancillary links, not all subdevs linked to
> the ISP's v4l2_dev necessarily represent sensors / bridges. Check the
> function for the subdevs and skip any that represent lens or flash
> controllers before creating data links.
>
> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
>
> This should fix the issues that have been noticed, but perhaps a new flag like
> MEDIA_ENT_FL_HAS_SOURCE or something would be a better way to denote subdevs
> that need data links?
>

I agree this a bit fragile...

I noticed ancillary links are only created for subdev notifiers,
which have a populated 'sd' and consequentially an entity. Could an
helper that walks the links of the notifier's subdev links and checks
if the subdev at hand is already linked, help ? Maybe with an optional
set of link flags to match on ?


>  drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> index 3f5cfa7eb937..e90f0216cb06 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> @@ -134,6 +134,10 @@ static int rkisp1_create_links(struct rkisp1_device *rkisp1)
>  		    sd == &rkisp1->resizer_devs[RKISP1_SELFPATH].sd)
>  			continue;
>
> +		if (sd->entity.function == MEDIA_ENT_F_LENS ||
> +		    sd->entity.function == MEDIA_ENT_F_FLASH)
> +			continue;
> +
>  		ret = media_entity_get_fwnode_pad(&sd->entity, sd->fwnode,
>  						  MEDIA_PAD_FL_SOURCE);
>  		if (ret < 0) {
> --
> 2.25.1
>
