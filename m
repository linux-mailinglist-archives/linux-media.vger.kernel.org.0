Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CC0C373E89
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 17:30:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232949AbhEEPbQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 11:31:16 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48046 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230144AbhEEPbP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 May 2021 11:31:15 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DF727549;
        Wed,  5 May 2021 17:30:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1620228617;
        bh=3bOKcQ9o3B/ax8mH3Za6LDvhc7x7pI+AFKtdFUjA3uA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lModLIPqC7RElwcVfN9a6qomNyFmDh5Ptr9+DtSs4q6RvS/hyiLCbWPHPYWsg/QDF
         Ow3u6KtBaYvulI3i/ftJ5nsiekRYmwveYjbIj/RfuqFUvAqx56nqLM+AfzB2Q0CRWn
         108Og3TtLHL8W8mvMAFju3TrpbLGxk6PfZk3BbM4=
Date:   Wed, 5 May 2021 18:30:12 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hverkuil-cisco@xs4all.nl, p.zabel@pengutronix.de,
        jacopo+renesas@jmondi.org, niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, nicolas.dufresne@collabora.com,
        dafna.hirschfeld@collabora.com, kernel@pengutronix.de,
        linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org
Subject: Re: Undefined MC-centric behaviour
Message-ID: <YJK6BAUvvVYlKCnb@pendragon.ideasonboard.com>
References: <20210505150917.z4le5unajb45jbx2@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210505150917.z4le5unajb45jbx2@pengutronix.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marco,

On Wed, May 05, 2021 at 05:09:17PM +0200, Marco Felsch wrote:
> Hi all,
> 
> first of all hopefully I got most of you within To: or Cc:.
> 
> During making the iMX6 IPU driver MC-cenric compatible without breaking
> backward compatibility we noticed that the API/API-Doc don't mention the
> behviour for:
>  - vidioc_enum_framesizes()
>  - vidioc_enum_frameintervals()
> 
> I our opinion:
>  - vidioc_enum_framesizes(): should only limit to the DMA restrictions

Sounds good I think. Should we then document that the ioctl should
return a single continuous or stepwise range ? I can't really imagine
the DMA engine limits to require discrete enumeration.

>  - vidioc_enum_frameintervals(): should return nothing since it is up to
>    user space to select the correct one from the last downstream
>    v4l2-subdev element (_not_ the sensor).

Why not the sensor ? The frame interval is set by the source, isn't it ?

> Now the discussion can start :)

Thanks for quickstarting this :-)

-- 
Regards,

Laurent Pinchart
