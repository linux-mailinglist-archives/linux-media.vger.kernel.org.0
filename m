Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59FBE3130BF
	for <lists+linux-media@lfdr.de>; Mon,  8 Feb 2021 12:26:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233183AbhBHLZJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Feb 2021 06:25:09 -0500
Received: from mga05.intel.com ([192.55.52.43]:17113 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233179AbhBHLWv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Feb 2021 06:22:51 -0500
IronPort-SDR: hnMylVfs1+b/yQ2qRfHbreiULhS+kqxpP1gA7mlw3rD6GggwIh9VzbRZ2MEdZihl+YFioTY0JE
 9j3wAh0nnQNw==
X-IronPort-AV: E=McAfee;i="6000,8403,9888"; a="266528435"
X-IronPort-AV: E=Sophos;i="5.81,161,1610438400"; 
   d="scan'208";a="266528435"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2021 03:19:37 -0800
IronPort-SDR: Vsf8zbpmYkm+v0c02triLBriM50V38NpNc9ZFeCccl7Ky6EWNi0U6xEpPXEL/TKQhwxgiLkxeg
 P54mYopT2TBA==
X-IronPort-AV: E=Sophos;i="5.81,161,1610438400"; 
   d="scan'208";a="395347992"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2021 03:19:33 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id F17812082C; Mon,  8 Feb 2021 13:19:30 +0200 (EET)
Date:   Mon, 8 Feb 2021 13:19:30 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Maxime Ripard <mripard@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH 1/1] Documentation: media: Rework camera sensor, CSI-2,
 async doc syntax
Message-ID: <20210208111930.GR32460@paasikivi.fi.intel.com>
References: <20210208104419.2805-1-sakari.ailus@linux.intel.com>
 <6564b853-9631-8b76-9881-b39401fb93f9@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6564b853-9631-8b76-9881-b39401fb93f9@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

On Mon, Feb 08, 2021 at 11:08:45AM +0000, Kieran Bingham wrote:
> Hi Sakari,
> 
> On 08/02/2021 10:44, Sakari Ailus wrote:
> > Improve syntax used for camera sensor, CSI-2 ReST and V4L2 async syntax
> > for better compatibility with newer Sphinx versions and use function
> > references where applicable.
> > 
> > Not all internal references still work as kerneldoc doesn't appear to
> > support macros the way they are now used by v4l2-async.
> > 
> 
> Do you mean that with this some references will no longer
> highlight/link, where they used to? or that they no longer do, so this
> fixes them?

Some that should work don't while there's nothing wrong with the references
themselves. In particular the async subdev helpers that are now based on
macros are affected. This requires some more investigation and quite
possibly a kerneldoc change.

> 
> The changes below look consistent and intentional though:
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Thanks!

-- 
Regards,

Sakari Ailus
