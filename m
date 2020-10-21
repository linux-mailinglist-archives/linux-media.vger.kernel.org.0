Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F250294AA6
	for <lists+linux-media@lfdr.de>; Wed, 21 Oct 2020 11:38:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438165AbgJUJiG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Oct 2020 05:38:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437415AbgJUJiG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Oct 2020 05:38:06 -0400
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.eu [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29940C0613CE;
        Wed, 21 Oct 2020 02:38:06 -0700 (PDT)
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 48E78634C8E;
        Wed, 21 Oct 2020 12:37:58 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1kVAZD-0000e6-Du; Wed, 21 Oct 2020 12:37:59 +0300
Date:   Wed, 21 Oct 2020 12:37:59 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Dan Scally <djrscally@gmail.com>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux.walleij@linaro.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        heikki.krogerus@linux.intel.com, dmitry.torokhov@gmail.com,
        laurent.pinchart+renesas@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, jacopo+renesas@jmondi.org,
        robh@kernel.org, davem@davemloft.net, linux@rasmusvillemoes.dk,
        sergey.senozhatsky@gmail.com, rostedt@goodmis.org,
        pmladek@suse.com, mchehab@kernel.org, tian.shu.qiu@intel.com,
        bingbu.cao@intel.com, sakari.ailus@linux.intel.com,
        yong.zhi@intel.com, rafael@kernel.org, gregkh@linuxfoundation.org,
        kitakar@gmail.com, dan.carpenter@oracle.org
Subject: Re: [RFC PATCH v3 3/9] software_node: Fix failure to hold refcount
 in software_node_get_next_child
Message-ID: <20201021093759.GE843@valkosipuli.retiisi.org.uk>
References: <20201019225903.14276-1-djrscally@gmail.com>
 <20201019225903.14276-4-djrscally@gmail.com>
 <20201020133148.GB843@valkosipuli.retiisi.org.uk>
 <c1a7beba-faff-e06d-1517-5b30d777b252@gmail.com>
 <20201021093321.GM4077@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201021093321.GM4077@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 21, 2020 at 12:33:21PM +0300, Andy Shevchenko wrote:
> On Wed, Oct 21, 2020 at 12:25:28AM +0100, Dan Scally wrote:
> > On 20/10/2020 14:31, Sakari Ailus wrote:
> > > On Mon, Oct 19, 2020 at 11:58:57PM +0100, Daniel Scally wrote:
> 
> > >> +	return software_node_get(&c->fwnode);
> > > I believe similarly, the function should drop the reference to the previous
> > > node, and not expect the caller to do this. The OF equivalent does the
> > > same.
> > 
> > I think I prefer it this way myself, since the alternative is having to
> > explicitly call *_node_get() on a returned child if you want to keep it
> > but also keep iterating. But I agree that it's important to take a
> > consistent approach. I'll add that too; this will mean
> > swnode_graph_find_next_port() and
> > software_node_graph_get_next_endpoint() in patch 4 of this series will
> > need changing slightly to square away their references.
> 
> What about ACPI case? Does it square?

In ACPI, we seem to assume these nodes are always there and thus don't need
reference counting.

-- 
Sakari Ailus
