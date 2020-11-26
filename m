Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C3942C51DA
	for <lists+linux-media@lfdr.de>; Thu, 26 Nov 2020 11:15:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732875AbgKZKMt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Nov 2020 05:12:49 -0500
Received: from relay10.mail.gandi.net ([217.70.178.230]:49337 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728014AbgKZKMt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Nov 2020 05:12:49 -0500
Received: from uno.localdomain (host-80-104-176-17.retail.telecomitalia.it [80.104.176.17])
        (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 477A0240017;
        Thu, 26 Nov 2020 10:12:45 +0000 (UTC)
Date:   Thu, 26 Nov 2020 11:12:51 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/5] v4l2-fwnode: Remove
 v4l2_async_notifier_parse_fwnode_endpoints_by_port() helper
Message-ID: <20201126101251.jcsvi6g5xsbnc52w@uno.localdomain>
References: <20201125164450.2056963-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201125164450.2056963-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas, Sakari,

On Wed, Nov 25, 2020 at 05:44:45PM +0100, Niklas Söderlund wrote:
> Hello,
>
> This series aims to remove a V4L2 helper that provides a too simple
> implementation, v4l2_async_notifier_parse_fwnode_endpoints_by_port().
> Instead drivers shall implement what the helper does directly to get
> greater control of the process. There is only one user left in tree of
> this interface, R-Car VIN.

What is the plan going forward ?
removing v4l2_async_notifier_parse_fwnode_endpoints_by_port() here
then remove v4l2_async_notifier_parse_fwnode_endpoints() as it has a
single user in mainline too ?

Are we standardizing all platform drivers to use
v4l2_async_notifier_add_fwnode_subdev() and perform fwnode.match
initialization by themselves or is there a plan to replace
v4l2_async_notifier_parse_fwnode_endpoints*() with something else ?

Thanks
  j

>
> This series starts therefor to rework the R-Car VIN driver to not depend
> on the helper. And in the process a small fwnode imbalance is fixed.
> After the last user of the helper is reworked the series removes the
> helper to prevent usage of it to resurface.
>
> This series is based on-top of the latest media tree and is tested on
> Renesas R-Car M3-N and Koelsch without any regressions or change in
> behavior detected.
>
> Niklas Söderlund (5):
>   rcar-vin: Only dynamically allocate v4l2_async_subdev
>   rcar-vin: Rework parallel firmware parsing
>   rcar-vin: Use v4l2_async_subdev instead of fwnode_handle to match
>     subdevices
>   rcar-vin: Rework CSI-2 firmware parsing
>   v4l2-fwnode: Remove
>     v4l2_async_notifier_parse_fwnode_endpoints_by_port()
>
>  drivers/media/platform/rcar-vin/rcar-core.c | 156 ++++++++++++--------
>  drivers/media/platform/rcar-vin/rcar-dma.c  |  16 +-
>  drivers/media/platform/rcar-vin/rcar-v4l2.c |  12 +-
>  drivers/media/platform/rcar-vin/rcar-vin.h  |   8 +-
>  drivers/media/v4l2-core/v4l2-fwnode.c       |  14 --
>  include/media/v4l2-fwnode.h                 |  53 -------
>  6 files changed, 113 insertions(+), 146 deletions(-)
>
> --
> 2.29.2
>
