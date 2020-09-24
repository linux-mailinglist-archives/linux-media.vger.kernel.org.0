Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2D372777BF
	for <lists+linux-media@lfdr.de>; Thu, 24 Sep 2020 19:26:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728697AbgIXR0I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Sep 2020 13:26:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727988AbgIXR0I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Sep 2020 13:26:08 -0400
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00FA0C0613CE;
        Thu, 24 Sep 2020 10:26:07 -0700 (PDT)
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 40AD7634C87;
        Thu, 24 Sep 2020 20:24:45 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1kLUz7-00030R-DQ; Thu, 24 Sep 2020 20:24:45 +0300
Date:   Thu, 24 Sep 2020 20:24:45 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, hverkuil@xs4all.nl,
        jacopo+renesas@jmondi.org, leonl@leopardimaging.com,
        robh+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/3] media: i2c: imx274: Remove stop stream i2c writes
 during remove
Message-ID: <20200924172445.GJ8644@valkosipuli.retiisi.org.uk>
References: <1600724379-7324-1-git-send-email-skomatineni@nvidia.com>
 <1600724379-7324-3-git-send-email-skomatineni@nvidia.com>
 <d6be54a7-76b8-4206-0d76-6f93ec545e72@lucaceresoli.net>
 <20200922084746.GA8644@valkosipuli.retiisi.org.uk>
 <b243afda-b00f-4c0e-2eea-cc5d03cbebe7@lucaceresoli.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b243afda-b00f-4c0e-2eea-cc5d03cbebe7@lucaceresoli.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 24, 2020 at 12:09:22PM +0200, Luca Ceresoli wrote:
> On 22/09/20 10:47, Sakari Ailus wrote:
> > Hi Luca,
> > 
> > On Tue, Sep 22, 2020 at 10:09:33AM +0200, Luca Ceresoli wrote:
> >> Hi,
> >>
> >> On 21/09/20 23:39, Sowjanya Komatineni wrote:
> >>> Sensor should already be in standby during remove and there is no
> >>> need to configure sensor registers for stream stop.
> >>
> >> I beg your pardon for the newbie question: does the V4L2 framework
> >> guarantee that the stream is stopped (.s_stream(..., 0)) before removing
> >> the driver?
> > 
> > It doesn't. That's however one of the lesser concerns, and I don't think
> > it'd help if drivers tried to prepare for that.
> 
> Thanks for the clarification.
> 
> I've been working with hardware where the sensor is always powered. In
> this case, and with this patch applied, the sensor would keep producing
> frames after driver removal. This looks wrong, unless I'm overlooking
> something.
> 
> BTW at first sight it looks like the framework should take care of
> stopping the stream before removal, not the individual drivers, but
> maybe there are good reasons this is not done?

Yes, it should.

This is a complex problem area to address. The framework (V4L2) wasn't
originally built with object refcounting when support was added for complex
cameras that comprise multiple devices because it wasn't thought it would
be really needed. And it's hard to add that later on.

Either way, there's little individual drivers can do to address that; the
framework support needs to be there first.

The same goes with Media controller; it's not just V4L2.

-- 
Sakari Ailus
