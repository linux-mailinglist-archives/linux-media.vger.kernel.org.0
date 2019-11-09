Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B0BAF5F92
	for <lists+linux-media@lfdr.de>; Sat,  9 Nov 2019 15:38:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726349AbfKIOib (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Nov 2019 09:38:31 -0500
Received: from mail-qv1-f50.google.com ([209.85.219.50]:34888 "EHLO
        mail-qv1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726282AbfKIOia (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 9 Nov 2019 09:38:30 -0500
Received: by mail-qv1-f50.google.com with SMTP id y18so3356228qve.2
        for <linux-media@vger.kernel.org>; Sat, 09 Nov 2019 06:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Qt2wMGdl1RipdnSLZNHfmX2yJVEaI/jqpdJ8zv3Tan0=;
        b=t8+Alah8bysBpO6Bzd3hkiSznPxxGhApn7zKMQby5MIyMcN15w5bCKuMGisUCKr6aH
         IWCvtN7Sr0gyZluPct9ngNh4iIEkVYMQqXhE9hoGrocEXEMysk/7V2vo8MO+zXDZ3/Io
         InPygC0aj1sylUbRVxc+cns5Zp4Wi2CnedfRufUYY/bBYeCkYdXA7nJiWuZkd0KUOS7u
         RUD36hEQkEk8qKiZg9IndZZBhJoMVfSPAYol+Ho4v9jksXZgT19FKk8Mq3G9p0opE14J
         Q/Rc/hvuAesXZx2JBP1zY13MraXnd4rjdzq7nZrKNCtQej2QiBGA3r8qCh+ngOzjVRjT
         HKag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Qt2wMGdl1RipdnSLZNHfmX2yJVEaI/jqpdJ8zv3Tan0=;
        b=CM8Iq9j3nV76I1pdI2laOSFTuLrGZ7MsyiNLpXKR61nSFL+CJ7DhxZGlg88oxVHLBS
         EexCSLHfrc/w6vqDCABorsS9OrSpT48MsGBIjJS2vfQHmqsIqlnqkhYqacJ7TxAo64AT
         SxErpvbMYhzdaQv/5S2P49+GIRnV+VlXerbRDfPvt59s9setl6x9xUGKZnOr8qtQdIWY
         /7nAiPfWoDC2iP9BVAoOxJgPmDalhaDTji/ECUNsXW72YNcPseZiF0Ixv+6Xr+g9AbFn
         K8RAUno3uy3Mc+9mjgo1tsPeOAUBNpNmgwopCVO/BCZgJcDZHzx3GbasGy/ryRKhHrCl
         meRA==
X-Gm-Message-State: APjAAAXmxI7KztdBy29VuVeInorOZW37IXcCjbsiUO54ZZvg+pIdh1NQ
        YG8CkOgXWTROUNS6FRfnZbBNVF1ZCJs=
X-Google-Smtp-Source: APXvYqy9jfnfWQy6j7o3WmwE225s6tK525MnQ1epAwgeeSHhPZiSQg8kQza1zdWU/zrIz8j1HM773g==
X-Received: by 2002:ad4:4dce:: with SMTP id cw14mr15391384qvb.185.1573310309270;
        Sat, 09 Nov 2019 06:38:29 -0800 (PST)
Received: from skullcanyon ([192.222.193.21])
        by smtp.gmail.com with ESMTPSA id j25sm4095431qkk.3.2019.11.09.06.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2019 06:38:28 -0800 (PST)
Message-ID: <1e716ce134c5444949a1fe9be032a5ca3566f6e3.camel@ndufresne.ca>
Subject: Re: Overlay support in the i.MX7 display
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>
Cc:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Date:   Sat, 09 Nov 2019 09:38:27 -0500
In-Reply-To: <78b6262cf5f6e9f60746559314fc9f1912365912.camel@pengutronix.de>
References: <20191101084318.GA8428@pendragon.ideasonboard.com>
         <78b6262cf5f6e9f60746559314fc9f1912365912.camel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mardi 05 novembre 2019 à 10:17 +0100, Philipp Zabel a écrit :
> Hi Laurent,
> 
> On Fri, 2019-11-01 at 10:43 +0200, Laurent Pinchart wrote:
> > Hello,
> > 
> > I'm looking at the available options to support overlays in the display
> > pipeline of the i.MX7. The LCDIF itself unfortunaltey doesn't support
> > overlays, the feature being implemented in the PXP. A driver for the PXP
> > is available but only supports older SoCs whose PXP doesn't support
> > overlays. This driver is implemented as a V4L2 mem2mem driver, which
> > makes support of additional input channels impossible.
> > 
> > Here are the options I can envision:
> > 
> > - Extend the existing PXP driver to support multiple channels. This is
> >   technically feasible, but will require moving away from the V4L2
> >   mem2mem framework, which would break userspace. I don't think this
> >   path could lead anywhere.
> 
> I may be biased, but please don't break the V4L2 mem2mem usecase :)
> 
> > - Write a new PXP driver for the i.MX7, still using V4L2, but with
> >   multiple video nodes. This would allow blending multiple layers, but
> >   would require writing the output to memory, while the PXP has support
> >   for direct connections to the LCDIF (through small SRAM buffers).
> >   Performances would thus be suboptimal. The API would also be awkward,
> >   as using the PXP for display would require usage of V4L2 in
> >   applications.
> 
> I'm not sure V4L2 is the best API for multi-pass 2D composition,
> especially as the PXP is able to blit an overlay onto a background in
> place.

There was some userspace (GStreamer element) doing exactly that with
v4l2 m2m using the imx6 driver. The API was fine, even though fences
would have made programming it easier.

https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/issues/308

(not merge as we don't have an agreement on kernel side, notably we
don't even have a way to control the blend function, so the result is
likely dependant on the use case the driver was written for)

The real limitation was that these IP usually supports more then just
blit/blend over another surface, and as you said, supports background.
And to support this use case, we'd need an m2m driver with multiple queues per direction. That was discussed in that last workshop at ELCE, and applies to other m2m IP like muxers and demuxers which exist on STB kind of SoC.

> 
> > - Extend the mxsfb driver with PXP support, and expose the PXP inputs as
> >   KMS planes. The PXP would only be used when available, and would be
> >   transparent to applications. This would however prevent using it
> >   separately from the display (to perform multi-pass alpha blending for
> >   instance).
> 
> For the SRAM block row buffer path to the LCDIF, I think the KMS plane
> abstraction is the way to go. The DRM and V4L2 drivers could be made to
> use a shared backend, such that only one of plane composition and V4L2
> scaling/CSC functions can work at the same time.
> 
> > What would be the best option going forward ? Would any of you, by any
> > chance, have already started work in this area ?
> 
> I have not worked on this.
> 
> regards
> Philipp
> 

