Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CBD831D6AF
	for <lists+linux-media@lfdr.de>; Wed, 17 Feb 2021 09:37:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231478AbhBQIh1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Feb 2021 03:37:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:47386 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230303AbhBQIhZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Feb 2021 03:37:25 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1AF9264E28;
        Wed, 17 Feb 2021 08:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1613551004;
        bh=i4kNSveyDKj4UzuU1mXSC8PvJCQPboPkNLn+8F+ab1k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=yv8i9+KWelFKyWLh1az5qyANS5nqW/AHNH77/f72B/vWnXtGRFkSTStnMXIzvn9+/
         7Yapooh4A9SgaLexotU/96Kqx2XvJlhLyMEQmHNANmx1G4weIrm/bwd1/Aq4aDsYwO
         o+5GaOV3bjjAb3IKdFImyUa6w0MOJR8ndzyMTx1U=
Date:   Wed, 17 Feb 2021 09:36:41 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc:     peng.fan@nxp.com, kernel@collabora.com, devel@driverdev.osuosl.org,
        Anson.Huang@nxp.com, krzk@kernel.org,
        linux-rockchip@lists.infradead.org, wens@csie.org,
        linux-imx@nxp.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, p.zabel@pengutronix.de,
        s.hauer@pengutronix.de, mripard@kernel.org, robh+dt@kernel.org,
        mchehab@kernel.org, ezequiel@collabora.com,
        linux-arm-kernel@lists.infradead.org, aisheng.dong@nxp.com,
        jernej.skrabec@siol.net, adrian.ratiu@collabora.com,
        linux-kernel@vger.kernel.org, paul.kocialkowski@bootlin.com,
        kernel@pengutronix.de, hverkuil-cisco@xs4all.nl,
        shawnguo@kernel.org, shengjiu.wang@nxp.com
Subject: Re: [PATCH v1 00/18] Add HANTRO G2/HEVC decoder support for IMX8MQ
Message-ID: <YCzVmRVL79KMkxXQ@kroah.com>
References: <20210217080306.157876-1-benjamin.gaignard@collabora.com>
 <YCzO7SRmBKzGeMUS@kroah.com>
 <04dfae0b-92e5-e02d-c687-ba4d28b7aaf2@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <04dfae0b-92e5-e02d-c687-ba4d28b7aaf2@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Feb 17, 2021 at 09:28:09AM +0100, Benjamin Gaignard wrote:
> 
> Le 17/02/2021 à 09:08, Greg KH a écrit :
> > On Wed, Feb 17, 2021 at 09:02:48AM +0100, Benjamin Gaignard wrote:
> > > The IMX8MQ got two VPUs but until now only G1 has been enabled.
> > > This series aim to add the second VPU (aka G2) and provide basic
> > > HEVC decoding support.
> > Why are you adding this directly to drivers/staging/media/ and not
> > drivers/media/?  Why can't this just go to the main location and not
> > live in staging?
> 
> G2/HEVC is added inside the already exiting Hantro driver, it is "just"
> an other codec from Hantro driver point of view.
> In addition of that v4l2-hevc uAPI is still unstable.
> One goal of this series is to have one more consumer of this v4l2-hevc
> uAPI so maybe we can claim it to be stable enough to move away from staging
> and then do the same for Hantro driver. That would be a great achievement !

I know I do not like seeing new additions/features/whatever being added
to staging drivers as that encourages people to do new stuff on them
without doing the real work needed to get them out of staging.

So what is preventing the existing driver from getting out of staging
now?

And how are you all creating new userspace apis for staging drivers to
the v4l layer?  What happens when you export something new and then
userspace starts to rely on it and then you change it?

Anyway, the media staging drivers are on their own, I don't touch them,
it just feels odd to me...

thanks,

greg k-h
