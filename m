Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7C242F07E8
	for <lists+linux-media@lfdr.de>; Sun, 10 Jan 2021 16:09:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726939AbhAJPJB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 Jan 2021 10:09:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:38336 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726884AbhAJPJB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 Jan 2021 10:09:01 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 207C52376E;
        Sun, 10 Jan 2021 15:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1610291277;
        bh=8lazxr0bsHJMCHXodV1dqv/fHtdhHix0sogPQF33OI4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pqsSaWM9/Let0R26dPQ6yRoLzEGcf2G8E7znpgam22JZDrxjRLvR8GQ1oJ6fyEatS
         YPqxeKzHJDJ7sN0Aq0za7inn2Ba60iY/91xFpDPvPzPX3P4xLEJBCUZdWxQg27cXv3
         9k0+syJWNP+qYG/b2g/5iGoojeEvWjqGBcz9L2DI=
Date:   Sun, 10 Jan 2021 16:09:11 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-media@vger.kernel.org, devel@acpica.org, rjw@rjwysocki.net,
        lenb@kernel.org, mchehab@kernel.org, sergey.senozhatsky@gmail.com,
        yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        robert.moore@intel.com, erik.kaneda@intel.com, pmladek@suse.com,
        rostedt@goodmis.org, andriy.shevchenko@linux.intel.com,
        linux@rasmusvillemoes.dk,
        laurent.pinchart+renesas@ideasonboard.com,
        jacopo+renesas@jmondi.org, kieran.bingham+renesas@ideasonboard.com,
        hverkuil-cisco@xs4all.nl, m.felsch@pengutronix.de,
        niklas.soderlund+renesas@ragnatech.se,
        prabhakar.mahadev-lad.rj@bp.renesas.com, slongerbeam@gmail.com,
        heikki.krogerus@linux.intel.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v5 05/15] software_node: Enforce parent before child
 ordering of nodes arrays
Message-ID: <X/sYl0e2gO2fJ4Nf@kroah.com>
References: <20210107132838.396641-1-djrscally@gmail.com>
 <20210107132838.396641-6-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210107132838.396641-6-djrscally@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jan 07, 2021 at 01:28:28PM +0000, Daniel Scally wrote:
> Registering software_nodes with the .parent member set to point to a
> currently unregistered software_node has the potential for problems,
> so enforce parent -> child ordering in arrays passed in to
> software_node_register_nodes().
> 
> Software nodes that are children of another software node should be
> unregistered before their parent. To allow easy unregistering of an array
> of software_nodes ordered parent to child, reverse the order in which
> software_node_unregister_nodes() unregisters software_nodes.
> 
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
> Changes in v5:
> 
> 	- None

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
