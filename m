Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07AC42EBF58
	for <lists+linux-media@lfdr.de>; Wed,  6 Jan 2021 15:20:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726073AbhAFOTo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jan 2021 09:19:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725803AbhAFOTn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jan 2021 09:19:43 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CFCDC06134C
        for <linux-media@vger.kernel.org>; Wed,  6 Jan 2021 06:19:03 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 5C4F51F45F23
Message-ID: <f9ba8e79777ddac8c68ddc9eda7e1a708b1afc0a.camel@collabora.com>
Subject: Re: [PATCH 3/6] media: ov9640: Use the generic clock framework
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Petr Cvek <petrcvekcz@gmail.com>, linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     kernel@collabora.com, Arnd Bergmann <arnd@arndb.de>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Date:   Wed, 06 Jan 2021 11:18:53 -0300
In-Reply-To: <ade9d36d-fb0f-7979-96a3-da550680c7ea@gmail.com>
References: <20210104165739.116404-1-ezequiel@collabora.com>
         <20210104165739.116404-4-ezequiel@collabora.com>
         <ade9d36d-fb0f-7979-96a3-da550680c7ea@gmail.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2021-01-05 at 17:18 +0100, Petr Cvek wrote:
> > diff --git a/drivers/media/i2c/ov9640.h b/drivers/media/i2c/ov9640.h
> > index a8ed6992c1a8..a1f9150b2050 100644
> > --- a/drivers/media/i2c/ov9640.h
> > +++ b/drivers/media/i2c/ov9640.h
> > @@ -180,6 +180,8 @@ enum {
> >  };
> >  #define        H_SXGA  960
> >  
> > +struct clk;
> > +
> 
> Seems to be unnecessary as struct clk will be included from ov9640.c (the same way struct v4l2_clk was).
> 
> The rest seems fine by me.
> 

Hm, I'm now wondering why I added that.

Guess it can be dropped, yes.

Thanks,
Ezequiel


