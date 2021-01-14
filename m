Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC7E32F6222
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 14:39:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727302AbhANNho (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jan 2021 08:37:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725955AbhANNho (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jan 2021 08:37:44 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F258FC061575
        for <linux-media@vger.kernel.org>; Thu, 14 Jan 2021 05:37:03 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id C7F121F45BE3
Message-ID: <1ff4e56a7f0bd551f97cf7c818d2de7b1a875f65.camel@collabora.com>
Subject: Re: [PATCH 11/13] media: v4l2-async: Drop
 v4l2_fwnode_reference_parse_sensor_common mention
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        kernel@collabora.com, Sakari Ailus <sakari.ailus@linux.intel.com>
Date:   Thu, 14 Jan 2021 10:36:54 -0300
In-Reply-To: <X/+o/P3DB+SBzieL@pendragon.ideasonboard.com>
References: <20210112132339.5621-1-ezequiel@collabora.com>
         <20210112132339.5621-12-ezequiel@collabora.com>
         <X/+o/P3DB+SBzieL@pendragon.ideasonboard.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2021-01-14 at 04:14 +0200, Laurent Pinchart wrote:
> Hi Ezequiel,
> 
> Thank you for the patch.
> 
> On Tue, Jan 12, 2021 at 10:23:37AM -0300, Ezequiel Garcia wrote:
> > The v4l2_async_notifier_cleanup documentation mentions
> > v4l2_fwnode_reference_parse_sensor_common, which doesn't exist.
> > Drop it.
> 
> The function is actually called
> v4l2_async_notifier_parse_fwnode_sensor_common(). It was introduced in
> commit 7a9ec808ad46 ("media: v4l: fwnode: Add convenience function for
> parsing common external refs") with an incorrect name in the
> documentation. Commit b064945517ee ("media: fix kernel-doc markups")
> fixed the kerneldoc header for the function, but forgot to address this
> location.
> 

OK, I'll fix the commit description.

Thanks,
Ezequiel

