Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D20BF5BD44A
	for <lists+linux-media@lfdr.de>; Mon, 19 Sep 2022 19:59:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230309AbiISR66 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Sep 2022 13:58:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231483AbiISR6u (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Sep 2022 13:58:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65F8F459BD
        for <linux-media@vger.kernel.org>; Mon, 19 Sep 2022 10:58:49 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 49A3E499;
        Mon, 19 Sep 2022 19:58:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1663610327;
        bh=2EAFH9EshzLSJw7g3UMnKYXw/K2r4PJl2+R6cE8s7gk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=W9TYiO+GUf1BuuYguDs+Fp+B+R/0owYzsCAjddhy4Z4RKR6In+eeFk0LBUGl6/wNL
         drT1njK86UyxDnk/Zl4R4vGlZ4jrjFP+i/H4wDlzNG1BrLn/ItPWU5jhCgCtNa5hFC
         Y3z8XOE/QCtZGnt8usefrX3jS1GUEpnlFHrqbjXo=
Date:   Mon, 19 Sep 2022 20:58:34 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     bunk@kernel.org, clabbe@baylibre.com, crope@iki.fi,
        cuigaosheng1@huawei.com, elezegarcia@gmail.com,
        hans.verkuil@cisco.com, hverkuil-cisco@xs4all.nl,
        linux@rainbow-software.org, logans@cottsay.net,
        m.chehab@samsung.com, mchehab@kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 2/8] media: platform: remove unused
 vsp1_subdev_internal_ops declaration
Message-ID: <YyitytHHZPNYa5Gr@pendragon.ideasonboard.com>
References: <20220911091519.3212868-1-cuigaosheng1@huawei.com>
 <20220911091519.3212868-3-cuigaosheng1@huawei.com>
 <166290349932.1189409.12318656202607870912@Monstersaurus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <166290349932.1189409.12318656202607870912@Monstersaurus>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Sep 11, 2022 at 02:38:19PM +0100, Kieran Bingham wrote:
> Quoting Gaosheng Cui (2022-09-11 10:15:13)
> > vsp1_subdev_internal_ops has been removed since
> > commit 0efdf0f5eaaf ("[media] v4l: vsp1: Implement and use the
> > subdev pad::init_cfg configuration"), so remove it.
> > 
> > Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> 
> It does look lonely indeed.
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

The subject line should start with "media: platform: vsp1:". I'll fix
this when applying.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> > ---
> >  drivers/media/platform/renesas/vsp1/vsp1_entity.h | 2 --
> >  1 file changed, 2 deletions(-)
> > 
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.h b/drivers/media/platform/renesas/vsp1/vsp1_entity.h
> > index f22724439cdc..17f98a6a972e 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_entity.h
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.h
> > @@ -130,8 +130,6 @@ int vsp1_entity_init(struct vsp1_device *vsp1, struct vsp1_entity *entity,
> >                      const struct v4l2_subdev_ops *ops, u32 function);
> >  void vsp1_entity_destroy(struct vsp1_entity *entity);
> >  
> > -extern const struct v4l2_subdev_internal_ops vsp1_subdev_internal_ops;
> > -
> >  int vsp1_entity_link_setup(struct media_entity *entity,
> >                            const struct media_pad *local,
> >                            const struct media_pad *remote, u32 flags);

-- 
Regards,

Laurent Pinchart
