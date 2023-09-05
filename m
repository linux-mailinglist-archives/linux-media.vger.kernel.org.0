Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E345E792C89
	for <lists+linux-media@lfdr.de>; Tue,  5 Sep 2023 19:37:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235742AbjIERh3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Sep 2023 13:37:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237851AbjIERhM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Sep 2023 13:37:12 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E064288E6
        for <linux-media@vger.kernel.org>; Tue,  5 Sep 2023 10:07:47 -0700 (PDT)
Received: from pendragon.ideasonboard.com (ftip006315900.acc1.colindale.21cn-nte.bt.net [81.134.214.249])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 39C82128D;
        Tue,  5 Sep 2023 19:04:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1693933465;
        bh=8Ti4/gzfum+T+LTcRF/WdytwZzTvwavKFVQbbcteMac=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=H2R9R2gMQNHSDF4GS80ClNE3HMa9bknTQoflQhXjorSF7M1ZUb4Ui+QXQh+V/R1wD
         3AHbcYAd0nxzNSRLf5YJzwy0+5FJ0wV83qTTYbu4ROZlWG+eQxSqQqSVuG+Np9ieFo
         wvklT3Y8czoc0CVAE+DVm+Ct1Zu3ScpB4oaOq43w=
Date:   Tue, 5 Sep 2023 20:06:04 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>
Subject: Re: [PATCH v3 06/10] media: uapi: Add a macro to tell whether an
 mbus code is metadata
Message-ID: <20230905170604.GG7971@pendragon.ideasonboard.com>
References: <20230808075538.3043934-1-sakari.ailus@linux.intel.com>
 <20230808075538.3043934-7-sakari.ailus@linux.intel.com>
 <98069c4c-d2fd-9117-08cd-eb595df77d4a@ideasonboard.com>
 <ZPcE+b3EYWM8G8vE@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZPcE+b3EYWM8G8vE@kekkonen.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Sep 05, 2023 at 10:37:45AM +0000, Sakari Ailus wrote:
> On Tue, Sep 05, 2023 at 12:47:21PM +0300, Tomi Valkeinen wrote:
> > On 08/08/2023 10:55, Sakari Ailus wrote:
> > > Add a macro to tell whether a given mbus code is metadata.
> > > 
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >   include/uapi/linux/media-bus-format.h | 3 +++
> > >   1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
> > > index 9ee031397372..2486b4178c5f 100644
> > > --- a/include/uapi/linux/media-bus-format.h
> > > +++ b/include/uapi/linux/media-bus-format.h
> > > @@ -182,4 +182,7 @@
> > >   #define MEDIA_BUS_FMT_META_20			0x8006
> > >   #define MEDIA_BUS_FMT_META_24			0x8007
> > > +#define MEDIA_BUS_FMT_IS_META(code)		\
> > > +	((code) & 0xf000 == 0x7000 || (code) & 0xf000 == 0x8000)
> > > +
> > >   #endif /* __LINUX_MEDIA_BUS_FORMAT_H */
> > 
> > mbus code seems to be u32, so the above won't work. Maybe:
> > 
> > (((code) & ~0xfffULL) == 0x7000 || ((code) & ~0xfffULL) == 0x8000)
> > 
> > Also, embedded formats with 0x9nnn codes are added later in the series.
> 
> Thanks, I'll address these for v4.

It would be nice to make this an inline function, to avoid evaluating
the code twice. I think you can move it to an internal kernel header, it
doesn't need to be exposed to userspace.

-- 
Regards,

Laurent Pinchart
