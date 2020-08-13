Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A22E2440F0
	for <lists+linux-media@lfdr.de>; Thu, 13 Aug 2020 23:55:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726597AbgHMVzM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Aug 2020 17:55:12 -0400
Received: from mga14.intel.com ([192.55.52.115]:14131 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726205AbgHMVzL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Aug 2020 17:55:11 -0400
IronPort-SDR: gOPz0Lvuug6nd1lJdswMAqWMhhBtUFKPsjzu/am1tY783wvP2SbKbFUh0sBK0fqN+gngr6EzV4
 jVjgp9d2pFLw==
X-IronPort-AV: E=McAfee;i="6000,8403,9712"; a="153553652"
X-IronPort-AV: E=Sophos;i="5.76,309,1592895600"; 
   d="scan'208";a="153553652"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2020 14:55:11 -0700
IronPort-SDR: eFLGK9y2LhwRrxsytEDwPP051lVfVP+dpt0KjHb75lXCYyXcYKVqPqMpdoioqBZ2YmEMynbXqh
 X2cMxAmFJSyQ==
X-IronPort-AV: E=Sophos;i="5.76,309,1592895600"; 
   d="scan'208";a="325544031"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2020 14:55:08 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 34D0620699; Fri, 14 Aug 2020 00:55:05 +0300 (EEST)
Date:   Fri, 14 Aug 2020 00:55:05 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: linux-next: Tree for Aug 13 (drivers/media/i2c/max9286.c)
Message-ID: <20200813215505.GC24582@paasikivi.fi.intel.com>
References: <20200813165846.27887669@canb.auug.org.au>
 <17a1c5aa-2f38-c84d-bf2d-485862dc0615@infradead.org>
 <3262a9fc-46e2-3109-3764-e7153edf486d@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3262a9fc-46e2-3109-3764-e7153edf486d@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

On Thu, Aug 13, 2020 at 08:01:01PM +0100, Kieran Bingham wrote:
> Hi Randy,
> 
> On 13/08/2020 19:35, Randy Dunlap wrote:
> > On 8/12/20 11:58 PM, Stephen Rothwell wrote:
> >> Hi all,
> >>
> >> News: The merge window has opened, so please do not add any v5.10
> >> related material to your linux-next included branches until after the
> >> merge window closes again.
> >>
> >> Changes since 20200812:
> >>
> > 
> > on x86_64:
> > 
> > # CONFIG_GPIOLIB is not set
> > 
> > ../drivers/media/i2c/max9286.c: In function 'max9286_register_gpio':
> > ../drivers/media/i2c/max9286.c:1033:6: error: 'struct gpio_chip' has no member named 'of_node'
> >   gpio->of_node = dev->of_node;
> > 
> 
> Thanks for the report, Sakari has already submitted a fix [0] for this.
> I assume it just needs a nudge to get picked up via Mauro's tree.
> 
> [0]
> https://lore.kernel.org/linux-media/20200803090935.23619-1-sakari.ailus@linux.intel.com/

Yes. I'll send a pull request soon.

-- 
Sakari Ailus
