Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CC3330A833
	for <lists+linux-media@lfdr.de>; Mon,  1 Feb 2021 14:03:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231444AbhBANCY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Feb 2021 08:02:24 -0500
Received: from mga02.intel.com ([134.134.136.20]:45162 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231407AbhBANCV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Feb 2021 08:02:21 -0500
IronPort-SDR: ue53PEkyxzdVwtxhJPzr2oGFQ+6EvC4gK237e+cHWxjFchTUEWY6xFxW9xVjDC3gTgZ2NXoj6g
 u8Na4tv4j5+g==
X-IronPort-AV: E=McAfee;i="6000,8403,9881"; a="167783514"
X-IronPort-AV: E=Sophos;i="5.79,392,1602572400"; 
   d="scan'208";a="167783514"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 05:00:34 -0800
IronPort-SDR: CEJO6CGtuOUZzqRMf3c5sa+tOuMc4nu8NACV8ZJ3VqfOg7lwAXvQdYIC9VSjK/E5E4haESLHqS
 fun0trDq3GjQ==
X-IronPort-AV: E=Sophos;i="5.79,392,1602572400"; 
   d="scan'208";a="395602638"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 05:00:31 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id D281E2074F; Mon,  1 Feb 2021 15:00:29 +0200 (EET)
Date:   Mon, 1 Feb 2021 15:00:29 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        sergei.shtylyov@gmail.com
Subject: Re: [PATCH v8 0/5] media: i2c: Add RDACM21 camera module
Message-ID: <20210201130029.GM32460@paasikivi.fi.intel.com>
References: <20210114170429.139762-1-jacopo+renesas@jmondi.org>
 <20210201085440.zcc5kuu4gyiyasvy@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210201085440.zcc5kuu4gyiyasvy@uno.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Mon, Feb 01, 2021 at 09:54:40AM +0100, Jacopo Mondi wrote:
> Hi Sakari,
> 
> On Thu, Jan 14, 2021 at 06:04:24PM +0100, Jacopo Mondi wrote:
> > One more iteration to squash in all the fixups sent in v7 and address
> > a comment from Sergei in [2/5] commit message.
> >
> > All patches now reviewed and hopefully ready to be collected!
> 
> All patches seems reviewed, do you think we can still collect this for
> the v5.12 merge window ?

The set seems good to me. There was some fuzz in the DT binding patch; I
hope the resolution is ok:

<URL:https://git.linuxtv.org/sailus/media_tree.git/commit/?id=c9930c965596af73c61e1a6a9ef2d2128582ef38>

Feel free to cc me on the next time. :-)

-- 
Regards,

Sakari Ailus
