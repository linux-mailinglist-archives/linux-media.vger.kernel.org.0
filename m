Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21C3A1890F4
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2020 23:02:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726916AbgCQWCu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Mar 2020 18:02:50 -0400
Received: from mga06.intel.com ([134.134.136.31]:6684 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726761AbgCQWCu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Mar 2020 18:02:50 -0400
IronPort-SDR: m3bWlECTAAmt3eVIrDR8g5U9KEOM9Y+XWuhZAlRwNEsaHsWN/8Z2JWWSq8JrLGwg9nOSox/Keg
 k1+BIzQmyCsg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2020 15:02:49 -0700
IronPort-SDR: guW7oQshYkDx4RbTdr5Fxc1NIqz7lebM5ub/0NkxldkDwL/zEghb3MDUWi7ur0sW5IUPhuwlax
 /qdm3UlCONdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,565,1574150400"; 
   d="scan'208";a="236455642"
Received: from rosenste-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.252.41.149])
  by fmsmga007.fm.intel.com with ESMTP; 17 Mar 2020 15:02:47 -0700
Received: by kekkonen.fi.intel.com (Postfix, from userid 1000)
        id EA85D21F46; Wed, 18 Mar 2020 00:02:33 +0200 (EET)
Date:   Wed, 18 Mar 2020 00:02:33 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH/RFC] media: v4l2: Extend VIDIOC_ENUM_FMT to support
 MC-centric devices
Message-ID: <20200317220233.GE13878@kekkonen.localdomain>
References: <20200313152406.13347-1-laurent.pinchart@ideasonboard.com>
 <20200317115854.h4oh2m2kipzjhmg3@uno.localdomain>
 <20200317130601.GI4864@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200317130601.GI4864@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Mar 17, 2020 at 03:06:01PM +0200, Laurent Pinchart wrote:
...
> > I have not followed CAP_IO_MC closely, but I
> > wonder if that could help catching that situation in the core and
> > return an error earlier. Maybe there could be a way for drivers to
> > advertise support for that feature to the core and fail earlier if
> > mbus_code is set and they don't claim to support it ?
> 
> I was thinking of linking the two, making this extension mandatory for
> drivers that advertise CAP_IO_MC, in which case we could indeed drop the
> flag.
> 
> Hans, what's your preference ?

My mild preference would be towards binding this to CAP_IO_MC flag.

-- 
Regards,

Sakari Ailus
