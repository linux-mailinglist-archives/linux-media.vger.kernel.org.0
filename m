Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8574E50E92C
	for <lists+linux-media@lfdr.de>; Mon, 25 Apr 2022 21:09:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244743AbiDYTLl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Apr 2022 15:11:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235743AbiDYTLl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Apr 2022 15:11:41 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D799B24099
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 12:08:36 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DFEFF496;
        Mon, 25 Apr 2022 21:08:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650913715;
        bh=w84GdN8TE6etnU+RLgVIIiz/BXWBEgYswbqQDCCTozY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=i3joH+vsRoL3SiIf5gt6SGHDUtE5YLke5SNHWnp/GCK8IBcHJDoq+3lYtdYUM5xXw
         SLkta4oB8gupozn3y7LOZuATjW0kNbPoUwoNjqWXdja1oHnKDziSc5JS9VZSMIY/Bo
         /or6hcVfj23a74FMaxwzYNHOZnK9ZCIat+1hMKIY=
Date:   Mon, 25 Apr 2022 22:08:35 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 13/21] media: rkisp1: Compile debugfs support
 conditionally
Message-ID: <Ymbxs2p9Tuf331qM@pendragon.ideasonboard.com>
References: <20220421234240.1694-1-laurent.pinchart@ideasonboard.com>
 <20220421234240.1694-14-laurent.pinchart@ideasonboard.com>
 <YmZ+89lToRXl4vFB@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YmZ+89lToRXl4vFB@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

On Mon, Apr 25, 2022 at 12:58:59PM +0200, Ricardo Ribalda wrote:
> Laurent Pinchart wrote:
> 
> > When CONFIG_DEBUGFS is disabled, there's no need to compile the debugfs
> > support in. Make it conditional.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>
> > ---
> > Changes since v3:
> > 
> > - Fix double mention of rkisp1-debug.o in Makefile
> > ---
> >  .../media/platform/rockchip/rkisp1/Makefile    | 18 ++++++++++--------
> >  .../platform/rockchip/rkisp1/rkisp1-common.h   |  9 +++++++++
> >  2 files changed, 19 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/media/platform/rockchip/rkisp1/Makefile b/drivers/media/platform/rockchip/rkisp1/Makefile
> > index 1a39bdcc608e..f7543a82aa10 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/Makefile
> > +++ b/drivers/media/platform/rockchip/rkisp1/Makefile
> > @@ -1,11 +1,13 @@
> >  # SPDX-License-Identifier: GPL-2.0
> 
> Are you sure that this work when rockchip is built as module?

I'm fairly confident it does, as I build the driver as a module :-)

> > +rockchip-isp1-y := rkisp1-capture.o \
> > +		   rkisp1-common.o \
> > +		   rkisp1-dev.o \
> > +		   rkisp1-isp.o \
> > +		   rkisp1-resizer.o \
> > +		   rkisp1-stats.o \
> > +		   rkisp1-params.o
> > +
> > +rockchip-isp1-$(CONFIG_DEBUG_FS) += rkisp1-debug.o
> > +
> >  obj-$(CONFIG_VIDEO_ROCKCHIP_ISP1) += rockchip-isp1.o
> > -rockchip-isp1-objs += 	rkisp1-capture.o \
> > -			rkisp1-common.o \
> > -			rkisp1-debug.o \
> > -			rkisp1-dev.o \
> > -			rkisp1-isp.o \
> > -			rkisp1-resizer.o \
> > -			rkisp1-stats.o \
> > -			rkisp1-params.o
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > index 07a92ed8bdc8..a7ffe2830fa8 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > @@ -518,7 +518,16 @@ void rkisp1_stats_unregister(struct rkisp1_device *rkisp1);
> >  int rkisp1_params_register(struct rkisp1_device *rkisp1);
> >  void rkisp1_params_unregister(struct rkisp1_device *rkisp1);
> >  
> > +#if IS_ENABLED(CONFIG_DEBUG_FS)
> >  void rkisp1_debug_init(struct rkisp1_device *rkisp1);
> >  void rkisp1_debug_cleanup(struct rkisp1_device *rkisp1);
> > +#else
> > +static inline void rkisp1_debug_init(struct rkisp1_device *rkisp1)
> > +{
> > +}
> > +static inline void rkisp1_debug_cleanup(struct rkisp1_device *rkisp1)
> > +{
> > +}
> > +#endif
> >  
> >  #endif /* _RKISP1_COMMON_H */

-- 
Regards,

Laurent Pinchart
