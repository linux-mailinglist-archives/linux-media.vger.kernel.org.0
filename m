Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE96235A13B
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 16:36:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233892AbhDIOgm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 10:36:42 -0400
Received: from mga09.intel.com ([134.134.136.24]:14483 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233527AbhDIOgl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 9 Apr 2021 10:36:41 -0400
IronPort-SDR: EXrV0pK9nsxJiYlkj5GkA48kHP/t0eezsA4omouLFxqE3UcVoBYA9+e4MX857GyHwaq4oEC3lQ
 zaVFolzhtuDA==
X-IronPort-AV: E=McAfee;i="6000,8403,9949"; a="193887475"
X-IronPort-AV: E=Sophos;i="5.82,209,1613462400"; 
   d="scan'208";a="193887475"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2021 07:36:18 -0700
IronPort-SDR: 9KSI6oUfGduERwdNAjng/1qVCSt0hRsyUm2GuJ43iKiPRFfv0f3nL3gd7xmOZWeZS+RlVamc7Q
 p/LivYNLvPnQ==
X-IronPort-AV: E=Sophos;i="5.82,209,1613462400"; 
   d="scan'208";a="531015344"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2021 07:36:16 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id BA756201C0;
        Fri,  9 Apr 2021 17:36:13 +0300 (EEST)
Date:   Fri, 9 Apr 2021 17:36:13 +0300
From:   'Sakari Ailus' <sakari.ailus@linux.intel.com>
To:     Martina Krasteva <martinax.krasteva@linux.intel.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        daniele.alessandrelli@linux.intel.com,
        paul.j.murphy@linux.intel.com, gjorgjix.rosikopulos@linux.intel.com
Subject: Re: [PATCH 09/10] media: Keem Bay Camera: Add metadata video node
Message-ID: <20210409143613.GD3@paasikivi.fi.intel.com>
References: <20210319180632.585-1-martinax.krasteva@linux.intel.com>
 <20210319180632.585-10-martinax.krasteva@linux.intel.com>
 <20210409102415.GA3@paasikivi.fi.intel.com>
 <000501d72d4b$57b9caf0$072d60d0$@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000501d72d4b$57b9caf0$072d60d0$@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martina,

On Fri, Apr 09, 2021 at 03:19:20PM +0100, Martina Krasteva wrote:
> Hi Sakari,
> 
> Thank you for the review :)

You're welcome!

...

> > > +static const struct kmb_vpu_warp_params warp_default = {
> > > +	.type = 0,
> > > +	.relative = 0,
> > > +	.format = 0,
> > > +	.position = 0,
> > > +	.reserved = { 0 },
> > > +	.width = 8,
> > > +	.height = 4,
> > > +	.stride = 128,
> > > +	.enable = 0,
> > > +	.matrix = {1, 0, 0, 0, 1, 0, 0, 0, 1},
> > > +	.mode = 1,
> > > +	.values = {0, 128, 128},
> > 
> > These seem to be default values for the parameters.
> > 
> > Are any of the values above dependent on the image sizes, for instance?
> > 

> Some of them might be resolution dependent, I need to double check. How
> should we handle the defaults that are dependent? Should we disable them
> or initialize with 0

Good question. I hope there aren't any, but if there are, the values could
be need to be either derived from the V4L2 mbus or pixel format
configuration somehow, i.e. they'd be zeros here.

-- 
Kind regards,

Sakari Ailus
