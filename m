Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65E42298172
	for <lists+linux-media@lfdr.de>; Sun, 25 Oct 2020 12:19:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1415382AbgJYLSt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 25 Oct 2020 07:18:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1415378AbgJYLSt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 25 Oct 2020 07:18:49 -0400
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.eu [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41922C0613CE;
        Sun, 25 Oct 2020 04:18:49 -0700 (PDT)
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 02001634C92;
        Sun, 25 Oct 2020 13:18:23 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1kWe2b-0001Gy-4E; Sun, 25 Oct 2020 13:18:25 +0200
Date:   Sun, 25 Oct 2020 13:18:25 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Dan Scally <djrscally@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linus.walleij@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
        heikki.krogerus@linux.intel.com, dmitry.torokhov@gmail.com,
        laurent.pinchart+renesas@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, jacopo+renesas@jmondi.org,
        robh@kernel.org, davem@davemloft.net, linux@rasmusvillemoes.dk,
        andriy.shevchenko@linux.intel.com, sergey.senozhatsky@gmail.com,
        rostedt@goodmis.org, pmladek@suse.com, mchehab@kernel.org,
        tian.shu.qiu@intel.com, bingbu.cao@intel.com,
        sakari.ailus@linux.intel.com, yong.zhi@intel.com,
        rafael@kernel.org, gregkh@linuxfoundation.org, kitakar@gmail.com
Subject: Re: [RFC PATCH v3 9/9] ipu3-cio2: Add functionality allowing
 software_node connections to sensors on platforms designed for Windows
Message-ID: <20201025111824.GB3774@valkosipuli.retiisi.org.uk>
References: <20201019225903.14276-1-djrscally@gmail.com>
 <20201019225903.14276-10-djrscally@gmail.com>
 <20201024151458.GA3774@valkosipuli.retiisi.org.uk>
 <18a3661c-4bee-7421-9121-acd65401cf16@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18a3661c-4bee-7421-9121-acd65401cf16@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

On Sat, Oct 24, 2020 at 09:28:07PM +0100, Dan Scally wrote:
...
> >> +int cio2_bridge_build(struct pci_dev *cio2)
> >> +{
> >> +	struct fwnode_handle *fwnode;
> >> +	int ret;
> >> +
> >> +	pci_dev_get(cio2);
> > Could you check that this isn't used by more than one user? The current
> > implementation assumes that. I'm not sure if there could be more instances
> > of CIO2 but if there were, that'd be an issue currently.
> 
> I can check; can't think of anything better than just failing out if it
> turns out to be in use already though - any ideas or is that appropriate?

A negative error code would be appropriate, e.g. -EBUSY.

-- 
Regards,

Sakari Ailus
