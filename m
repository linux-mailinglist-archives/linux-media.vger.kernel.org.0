Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC3752EA702
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 10:11:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725836AbhAEJLN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 04:11:13 -0500
Received: from mga07.intel.com ([134.134.136.100]:29675 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725789AbhAEJLM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 Jan 2021 04:11:12 -0500
IronPort-SDR: 7BFXAPgowt6F1qzfRF7X0x0dfceWR68oYAZXfvLt7IErLvxSTw/vPSc+n0T1hT9kyq3b49PjjC
 GcbzWDXEwOuw==
X-IronPort-AV: E=McAfee;i="6000,8403,9854"; a="241160344"
X-IronPort-AV: E=Sophos;i="5.78,476,1599548400"; 
   d="scan'208";a="241160344"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2021 01:09:26 -0800
IronPort-SDR: OJstUvai6uTrf/tAQsQMDyNtKkiDITzatLeNyTPnszEXk+IUi4lSFDSPyQgnQIoeESoCKWV5nF
 WoxoNk4ZN8Rg==
X-IronPort-AV: E=Sophos;i="5.78,476,1599548400"; 
   d="scan'208";a="386981017"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2021 01:09:23 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 80BE4206FD; Tue,  5 Jan 2021 11:09:21 +0200 (EET)
Date:   Tue, 5 Jan 2021 11:09:21 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Guennadi Liakhovetski <g.liakhovetski@gmx.de>,
        Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v4 2/2] dt-bindings: media: Use graph and
 video-interfaces schemas
Message-ID: <20210105090921.GP11878@paasikivi.fi.intel.com>
References: <20210104165808.2166686-1-robh@kernel.org>
 <20210104165808.2166686-3-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210104165808.2166686-3-robh@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob,

On Mon, Jan 04, 2021 at 09:58:08AM -0700, Rob Herring wrote:
> Now that we have graph and video-interfaces schemas, rework the media
> related schemas to use them.
> 
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Jacopo Mondi <jacopo@jmondi.org>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: linux-media@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Thanks, this really cleans things up!

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
