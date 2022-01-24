Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3912498493
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 17:22:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243662AbiAXQWE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jan 2022 11:22:04 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:57336 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240842AbiAXQWE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jan 2022 11:22:04 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C335B143B;
        Mon, 24 Jan 2022 17:22:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1643041323;
        bh=XZYfP1fGV1CegXoyedwxHdbtrZYJ954FF5t5qJBRXmI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Li47N3zNCRLIC3iUwFIaP//k9KwEeqr00UhZb5IgIB8qgPKwuXZ1l67c6TNG93HlZ
         anZVvsX/2eHwxjjnZPBdIVkbZON6MOg9ojpQP9l8EQgkUFfBaw2jA4qL+7BYnRzzR+
         bUwqQf9d9+HRwwNpH5+us33d1bb23jC3KJ2y25Ww=
Date:   Mon, 24 Jan 2022 18:21:44 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl
Subject: Re: [PATCH 2/3] media: Set bus_info in media_device_init()
Message-ID: <Ye7SGBb8BEvcoZzt@pendragon.ideasonboard.com>
References: <20220122163656.168440-1-sakari.ailus@linux.intel.com>
 <20220122163656.168440-3-sakari.ailus@linux.intel.com>
 <YeyXwO1AwD5IhaUz@pendragon.ideasonboard.com>
 <Ye7M5EjPEVq6VwfZ@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Ye7M5EjPEVq6VwfZ@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Mon, Jan 24, 2022 at 05:59:32PM +0200, Sakari Ailus wrote:
> On Sun, Jan 23, 2022 at 01:48:16AM +0200, Laurent Pinchart wrote:
> > On Sat, Jan 22, 2022 at 06:36:55PM +0200, Sakari Ailus wrote:
> > > Set bus_info field based on struct device in media_device_init(). Also
> > > remove corresponding code from drivers.
> > 
> > This looks fine to me, but the documentation should be updated to
> > explain that bus_info will be set by media_device_init(), and that
> > driver may then override the value if desired (and probably also list
> > the rules under which such an override is allowed).
> 
> We haven't really documented that for other fields either and rather relied
> more on examples. I can add that if you still think so though.

There's sooooo much cargo-cult in V4L2 that adding a bit more may not
make a big difference, but on the other hand, now is as good as ever to
start and address this :-)

-- 
Regards,

Laurent Pinchart
