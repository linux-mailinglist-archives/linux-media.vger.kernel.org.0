Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C09A17AA0E5
	for <lists+linux-media@lfdr.de>; Thu, 21 Sep 2023 22:51:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232179AbjIUUup (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Sep 2023 16:50:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232473AbjIUUub (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Sep 2023 16:50:31 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEDFCD2068
        for <linux-media@vger.kernel.org>; Thu, 21 Sep 2023 11:45:41 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2b95d5ee18dso22283981fa.1
        for <linux-media@vger.kernel.org>; Thu, 21 Sep 2023 11:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20230601.gappssmtp.com; s=20230601; t=1695321940; x=1695926740; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5qHSfSCqrovxL6GDTyoOuCZ+/MuVj0+loftxjgaYqcg=;
        b=bE5lMTsfU3a8JLoOggKr3vTnzaeYf7nrht3y43fqk9AY8eFrgRiIKMfYhmrh9+gYkH
         Hru/QAx6FXRepqdAuxwQSr3VK1JRaSC6wZqlRRPlnf8LWpSO2qeHJx892v6rtPShTVk3
         c6CIXpoSvn+UOevy5rLdZK+gxqfWQCAQS53Vz4HXag8jbjgSyv1iTARKXqJzspoKFtaZ
         GuoaU3f/l5u/fUl0uVgXiggHUB9FLSHZB4e8hv0H1wFj0Q6Efn3evnRFw0JPydUwOlHf
         g/99Zy/rr4wu0I/MM6dDuis2cfQQ3qcH+6tutaMc8DYM3uA9H7AZiImGq0a3x2qF6kHz
         FsuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695321940; x=1695926740;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5qHSfSCqrovxL6GDTyoOuCZ+/MuVj0+loftxjgaYqcg=;
        b=e8xiOV7T5+Ew0XUBOGHUEhx7hhBbMTdqqctUvNHoFYMPo5olzP5z2FxRw2APoOb1tn
         +TtokYI47ob3vkPhNbhmTwwJDcvvhF7NJTaxRoytbU60ip5ZV83qg47V+82XBHTXvQOB
         w+MmcRGdKO1JgtSjKQf9XxDyk+aGlPfZTVLlZs3ihSizo8LAmxNtZbzVx/TpXiNniv24
         xZUe0VN6EsbG35TK32Fn/EUkHfAfl+kVY5KzyhBMFFMlJcMM+5ToiPGIRSUNTHpJ55i2
         SOrTIN5BJTzhUJNX4qHru4pRACSTrYNcEZgHX8Ps0OqRwyXqNYCXPmPHFQupdQpHpANu
         +tdg==
X-Gm-Message-State: AOJu0YzoOZAEXxpqVytvaXXt0Y4fBOPsi0vtZUgsvKdBLAAUyIDA7igM
        Jjup/R5hV4bbdFUGRpAfuBMdKg==
X-Google-Smtp-Source: AGHT+IFY2VAcdPoG/7HtbQAXH8lj0D23g3bRz0xCFuTHjFUDK8ABHnoID8XZcPvApsuFZ50cfhi2pw==
X-Received: by 2002:a2e:92c3:0:b0:2bf:7905:12c3 with SMTP id k3-20020a2e92c3000000b002bf790512c3mr5431739ljh.40.1695321938911;
        Thu, 21 Sep 2023 11:45:38 -0700 (PDT)
Received: from localhost (h-46-59-36-206.A463.priv.bahnhof.se. [46.59.36.206])
        by smtp.gmail.com with ESMTPSA id s18-20020a2e2c12000000b002b9e346a152sm468179ljs.96.2023.09.21.11.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 11:45:38 -0700 (PDT)
Date:   Thu, 21 Sep 2023 20:45:37 +0200
From:   Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>, guoniu.zhou@oss.nxp.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-imx@nxp.com, mchehab@kernel.org,
        alexander.stein@ew.tq-group.com, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, conor+dt@kernel.org,
        jacopo.mondi@ideasonboard.com
Subject: Re: [PATCH v2 2/2] media: nxp: add driver for i.MX93 MIPI CSI-2
 controller and D-PHY
Message-ID: <ZQyPURd-I2WwOsh5@oden.dyn.berto.se>
References: <20230710060352.584286-1-guoniu.zhou@oss.nxp.com>
 <20230710060352.584286-3-guoniu.zhou@oss.nxp.com>
 <ZQIdQmsv4wEmmyau@valkosipuli.retiisi.eu>
 <20230917212509.GB16448@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230917212509.GB16448@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On 2023-09-18 00:25:09 +0300, Laurent Pinchart wrote:

[snip]

> > > diff --git a/drivers/media/platform/nxp/dwc-mipi-csi2.h 
> > > b/drivers/media/platform/nxp/dwc-mipi-csi2.h
> > > new file mode 100644
> > > index 000000000000..470023787c25
> > > --- /dev/null
> > > +++ b/drivers/media/platform/nxp/dwc-mipi-csi2.h
> > > @@ -0,0 +1,299 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > +/*
> > > + * Copyright 2023 NXP
> > > + */
> > > +
> > > +#ifndef __DWC_MIPI_CSI2_H__
> > > +#define __DWC_MIPI_CSI2_H__
> > > +
> > > +#include <linux/device.h>
> > > +#include <linux/delay.h>
> > > +#include <linux/io.h>
> > > +
> > > +#include <media/v4l2-ctrls.h>
> > > +#include <media/v4l2-device.h>
> > > +#include <media/v4l2-fwnode.h>
> > > +#include <media/v4l2-mc.h>
> > > +#include <media/v4l2-subdev.h>
> > 
> > I don't think you need many of these headers here. Please move to the .c
> > file those you don't need here.
> > 
> > > +
> > > +/* MIPI CSI-2 Host Controller Registers Define */
> > > +
> 
> Niklas, is it me, or do the registers here look very familiar ? The
> R-Car V4H may have the same CSI-2 RX. Should we have a single driver ?

I agree it looks very familiar. The register space to indeed start out 
aligned between this driver and R-Car V4H (not checked every bit tho).  
But once we get to later registers it seems the two diverge a bit. If 
this is due to usage or something else I don't know. I have very sparse 
documentation for the V4H.

It becomes even more interesting. Have a look at this drivers 
hsfreqrange lookup table, dwc_csi_mbps_table[]. That overlaps with R-Car 
V3U (rcar-csi2.c hsfreqrange_v3u[]) instead of V4H, but V3U appears to 
support faster bus.

I think we can agree these two drivers are very similar, but not 
identical. The most interesting register here is the first one 
CSI2RX_VERSION. Maybe if we can figure that out we could start to think 
about a generic driver? Unfortunately I have no documentation for the 
content of this register. And the V4H driver do not use it, so I don't 
even know if it contains anything.

Is there any publicly documentation about this device? I have very 
sparse documentation about V4H, and nothing I can share. As to not block 
anyone maybe two drivers are OK and if we can figure out what parts, if 
any can be shared?

-- 
Kind Regards,
Niklas Söderlund
