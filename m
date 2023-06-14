Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E25672FEEC
	for <lists+linux-media@lfdr.de>; Wed, 14 Jun 2023 14:43:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244684AbjFNMnh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jun 2023 08:43:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244680AbjFNMng (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jun 2023 08:43:36 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 107011FD4
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 05:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686746615; x=1718282615;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tjNh81dKo4C8gChwSr63agGeS01/midopVlxJHXTvlE=;
  b=Uz0mqAP2Bxmyl/YXri1j0OLu+0bPegHDd1KF830UQwjEDsCDIDS5wHtp
   PoaHY63/dXW0BRcdT2f53937YLD7T2J6sATrUFZT8z3v1htmqbWQAUPEt
   e3QxNVOEZsLaymWJ1k46NimQ9fkAhMlBveBMVm4u7cupb+EaK4qwfJ/fB
   uEk6lPVB9Pg+5BOjTtWQrqU5m7VA9q8TjPO0PqfzF8dU3Gmbqt/468rZA
   /mj/77SUht98V/7rOuJfrDxem4e8IQtj7DSg8jnRdkBzMUQ9feZW9SDeb
   suUqYDnoNRk89u7N33IftVl+qYw1dbW0mUXKbb21e1p7VWJcH6BbRucBF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="422201992"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; 
   d="scan'208";a="422201992"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2023 05:43:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="712053706"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; 
   d="scan'208";a="712053706"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2023 05:43:24 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 33AC8120C3B;
        Wed, 14 Jun 2023 15:43:21 +0300 (EEST)
Date:   Wed, 14 Jun 2023 12:43:21 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com,
        niklas.soderlund@ragnatech.se,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Yong Deng <yong.deng@magewell.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Benoit Parrot <bparrot@ti.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [RESEND PATCH v3 31/32] media: v4l: async: Set v4l2_device in
 async notifier init
Message-ID: <ZIm16SJo4fOFx6G4@kekkonen.localdomain>
References: <20230525091615.2324824-1-sakari.ailus@linux.intel.com>
 <20230525091615.2324824-32-sakari.ailus@linux.intel.com>
 <20230530062209.GA6865@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530062209.GA6865@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Tue, May 30, 2023 at 09:22:09AM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Thu, May 25, 2023 at 12:16:14PM +0300, Sakari Ailus wrote:
> > Set the v4l2_device already in async notifier init, so struct device
> > related to it will be available before the notifier is registered.
> > 
> > This is done in order to make struct device available earlier, during
> > construction of the async connections, for sensible debug prints.
> 
> I'm worried that the tighter dependency between the notifier and the
> v4l2_device will cause issues later. If it's just to get a struct device
> pointer, wouldn't it be better to pass the struct device to
> v4l2_async_nf_init() ?

And add a device field to the notifier?

I'm really not too worried about this; the device field is available from
the very beginning of the driver's probe function and registering the V4L2
device does not expose any driver interfaces. So I don't see a technical
reason for this.

A better name for v4l2_device_register() would actually be
v4l2_device_init(). Other renaming may follow from that, too. But that is
out of scope of this set in any case.

> 
> > This patch has been mostly generated using the following two commands:
> > 
> > git grep -l v4l2_async_nf_init -- drivers/media/ drivers/staging/media/ |
> > 	while read i; do perl -e '
> > 	@a=<>; unlink("'$i'"); open(F, "> '$i'");
> > 	for $f ({i=>"v4l2_async_nf_init", r=>"v4l2_async_nf_register"},
> > 		{i=>"v4l2_async_subdev_nf_init",
> > 		 r=>"v4l2_async_subdev_nf_register"} ) {
> > 	my $b; @a = map { $b = "$1, $2" if
> > 	s/$f->{r}\(([^,]*),\s*([^\)]*)\)/v4l2_async_nf_register\($2\)/;
> > 	$_; } @a; @a = map { if (defined $b) {
> > 	s/v4l2_async_nf_init\([^\)]*\)/$f->{i}\($b\)/;
> > 	s/$f->{r}\(\K[^,]*,\s*//; }; $_; } @a; }; print F @a; close F;'
> > 	< $i; done
> > 
> > git grep -lP 'v4l2_async_(subdev_|)nf_init' | xargs perl -i -pe \
> > 	's/v4l2_async_(subdev_|)nf_init\(\K([^,]*),\s*([^,]*)\)/$3, $2\)/'
> 
> It may be nice to play with perl code, but I'd like more focus on the
> human-readable part of the commit message, please. The above isn't
> useful to anyone but you, while an English text that explains how the
> v4l2_async_nf_init() function has now been split into
> v4l2_async_nf_init() and v4l2_async_subdev_nf_init() is missing.

I can add a few words about this.

The Perl code was useful for re-creating the patch but by now it has been
modified manually so much it's no longer useful. I'll drop it.

-- 
Kind regards,

Sakari Ailus
