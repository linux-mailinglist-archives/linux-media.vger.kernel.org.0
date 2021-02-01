Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8161230AEDB
	for <lists+linux-media@lfdr.de>; Mon,  1 Feb 2021 19:15:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232285AbhBASPc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Feb 2021 13:15:32 -0500
Received: from relay10.mail.gandi.net ([217.70.178.230]:32939 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232033AbhBASPO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Feb 2021 13:15:14 -0500
Received: from uno.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id C288A240009;
        Mon,  1 Feb 2021 18:14:14 +0000 (UTC)
Date:   Mon, 1 Feb 2021 19:14:36 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        sergei.shtylyov@gmail.com
Subject: Re: [PATCH v8 0/5] media: i2c: Add RDACM21 camera module
Message-ID: <20210201181436.6giorxpojizp3rv4@uno.localdomain>
References: <20210114170429.139762-1-jacopo+renesas@jmondi.org>
 <20210201085440.zcc5kuu4gyiyasvy@uno.localdomain>
 <20210201130029.GM32460@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210201130029.GM32460@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Mon, Feb 01, 2021 at 03:00:29PM +0200, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Mon, Feb 01, 2021 at 09:54:40AM +0100, Jacopo Mondi wrote:
> > Hi Sakari,
> >
> > On Thu, Jan 14, 2021 at 06:04:24PM +0100, Jacopo Mondi wrote:
> > > One more iteration to squash in all the fixups sent in v7 and address
> > > a comment from Sergei in [2/5] commit message.
> > >
> > > All patches now reviewed and hopefully ready to be collected!
> >
> > All patches seems reviewed, do you think we can still collect this for
> > the v5.12 merge window ?
>
> The set seems good to me. There was some fuzz in the DT binding patch; I
> hope the resolution is ok:
>
> <URL:https://git.linuxtv.org/sailus/media_tree.git/commit/?id=c9930c965596af73c61e1a6a9ef2d2128582ef38>

Yes, looks good!

>
> Feel free to cc me on the next time. :-)

yeah sorry, I went through too many iterations :)

Thanks
  j

>
> --
> Regards,
>
> Sakari Ailus
