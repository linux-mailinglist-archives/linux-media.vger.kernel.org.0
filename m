Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6378D30C987
	for <lists+linux-media@lfdr.de>; Tue,  2 Feb 2021 19:22:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238463AbhBBSVH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Feb 2021 13:21:07 -0500
Received: from mga18.intel.com ([134.134.136.126]:21133 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238447AbhBBSRi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Feb 2021 13:17:38 -0500
IronPort-SDR: wNVJyN412XDs+KwSZMlTXL+O0JAExOBJBFtrmtyXqJjN2KokTNNW/oeslhIRhaV23XesDl6OQD
 b8FXgFKUDdOg==
X-IronPort-AV: E=McAfee;i="6000,8403,9883"; a="168581597"
X-IronPort-AV: E=Sophos;i="5.79,396,1602572400"; 
   d="scan'208";a="168581597"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2021 10:15:48 -0800
IronPort-SDR: Dx8HOmfByZyfCmB2AjoR6YmbbuL2gyrvn+8+Ua3rZ2nK7LXpy9HaC90smzwHxEstCCZDqnmNNY
 dC3fyUQbQ8rA==
X-IronPort-AV: E=Sophos;i="5.79,396,1602572400"; 
   d="scan'208";a="359161561"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2021 10:15:44 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 632F52074F; Tue,  2 Feb 2021 20:15:42 +0200 (EET)
Date:   Tue, 2 Feb 2021 20:15:42 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Helen Koike <helen.koike@collabora.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Maxime Ripard <mripard@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH v5.1 13/13] media: Clarify v4l2-async subdevice addition
 API
Message-ID: <20210202181542.GU32460@paasikivi.fi.intel.com>
References: <20210202135611.13920-14-sakari.ailus@linux.intel.com>
 <20210202142533.14989-1-sakari.ailus@linux.intel.com>
 <c8bfacda-24d3-ab8a-b017-6c08c99484cd@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8bfacda-24d3-ab8a-b017-6c08c99484cd@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Feb 02, 2021 at 12:23:52PM -0300, Helen Koike wrote:
> 
> 
> On 2/2/21 11:25 AM, Sakari Ailus wrote:
> > From: Ezequiel Garcia <ezequiel@collabora.com>
> > 
> > Now that most users of v4l2_async_notifier_add_subdev have been converted,
> > let's fix the documentation so it's more clear how the v4l2-async API
> > should be used.
> > 
> > Document functions that drivers should use, and their purpose.
> > 
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> Reviewed-by: Helen Koike <helen.koike@collabora.com>
> 
> Thanks for working on this :)

And thank you for the reviews! :-)

-- 
Sakari Ailus
