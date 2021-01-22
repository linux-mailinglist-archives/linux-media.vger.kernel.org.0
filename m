Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A6E8300AA8
	for <lists+linux-media@lfdr.de>; Fri, 22 Jan 2021 19:11:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729343AbhAVR0Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Jan 2021 12:26:25 -0500
Received: from mga02.intel.com ([134.134.136.20]:41761 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729553AbhAVRDj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Jan 2021 12:03:39 -0500
IronPort-SDR: gLBTn5FpTDUnpRFoVT0rLXvirqqC4Aqhwx0QibHa5K9lxZGUvBUSNa3SsJzLb3f08EhR6zTA8M
 kqrlLawIiT0w==
X-IronPort-AV: E=McAfee;i="6000,8403,9872"; a="166573825"
X-IronPort-AV: E=Sophos;i="5.79,367,1602572400"; 
   d="scan'208";a="166573825"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2021 09:01:49 -0800
IronPort-SDR: UckGca5CZ28evMMRtzlVJOWlrAwGXsPkrkuvGCW2bDBrnTf/ZTUpqa3HsL7T8anjjaPAQnJd68
 1lQ9C9/EJWsw==
X-IronPort-AV: E=Sophos;i="5.79,367,1602572400"; 
   d="scan'208";a="348335508"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2021 09:01:46 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 29C6C20690; Fri, 22 Jan 2021 19:01:44 +0200 (EET)
Date:   Fri, 22 Jan 2021 19:01:44 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Guennadi Liakhovetski <g.liakhovetski@gmx.de>,
        Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH v4 1/2] media: dt-bindings: Convert video-interfaces.txt
 properties to schemas
Message-ID: <20210122170144.GE27155@paasikivi.fi.intel.com>
References: <20210104165808.2166686-1-robh@kernel.org>
 <20210104165808.2166686-2-robh@kernel.org>
 <CAL_Jsq+dpVvA0iOMzaPf50Decc1hj7zH0eq-RyuVkdzp729vEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+dpVvA0iOMzaPf50Decc1hj7zH0eq-RyuVkdzp729vEQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob,

On Fri, Jan 22, 2021 at 10:23:44AM -0600, Rob Herring wrote:
> On Mon, Jan 4, 2021 at 10:58 AM Rob Herring <robh@kernel.org> wrote:
> >
> > Convert video-interfaces.txt to DT schema. As it contains a mixture of
> > device level and endpoint properties, split it up into 2 schemas.
> 
> Ping!
> 
> Can this please be applied to the media tree so I can tell folks to
> use it in reviews of media bindings.

Yes, it can. It's in my tree now.

-- 
Kind regards,

Sakari Ailus
