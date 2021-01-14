Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DABB2F6230
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 14:41:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728786AbhANNkY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jan 2021 08:40:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726570AbhANNkW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jan 2021 08:40:22 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C14D1C0613C1
        for <linux-media@vger.kernel.org>; Thu, 14 Jan 2021 05:39:41 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 7C73D1F41699
Message-ID: <38064ab4f6d0fc4302171e3c24bb8be37e500b86.camel@collabora.com>
Subject: Re: [PATCH 12/13] media: Clarify v4l2-async subdevice addition API
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        kernel@collabora.com, Sakari Ailus <sakari.ailus@linux.intel.com>
Date:   Thu, 14 Jan 2021 10:39:33 -0300
In-Reply-To: <X/+qw3OtGpveRK17@pendragon.ideasonboard.com>
References: <20210112132339.5621-1-ezequiel@collabora.com>
         <20210112132339.5621-13-ezequiel@collabora.com>
         <X/+qw3OtGpveRK17@pendragon.ideasonboard.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2021-01-14 at 04:21 +0200, Laurent Pinchart wrote:
> Hi Ezequiel,
> 
> Thank you for the patch.
> 
> On Tue, Jan 12, 2021 at 10:23:38AM -0300, Ezequiel Garcia wrote:
> > Now that most users of v4l2_async_notifier_add_subdev have
> > been converted, let's fix the documentation so it's more clear
> > how the v4l2-async API should be used.
> > 
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > ---
> >  .../driver-api/media/v4l2-subdev.rst          | 38 ++++++++++++++++---
> >  include/media/v4l2-async.h                    | 12 +++++-
> >  2 files changed, 43 insertions(+), 7 deletions(-)
> > 
> > diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
> > index bb5b1a7cdfd9..5ddf9de4fcf7 100644
> > --- a/Documentation/driver-api/media/v4l2-subdev.rst
> > +++ b/Documentation/driver-api/media/v4l2-subdev.rst
> > @@ -204,11 +204,39 @@ Before registering the notifier, bridge drivers must do two things:
> >  first, the notifier must be initialized using the
> >  :c:func:`v4l2_async_notifier_init`. Second, bridge drivers can then
> >  begin to form a list of subdevice descriptors that the bridge device
> > -needs for its operation. Subdevice descriptors are added to the notifier
> > -using the :c:func:`v4l2_async_notifier_add_subdev` call. This function
> > -takes two arguments: a pointer to struct :c:type:`v4l2_async_notifier`,
> > -and a pointer to the subdevice descripter, which is of type struct
> > -:c:type:`v4l2_async_subdev`.
> > +needs for its operation. Several functions are available, to
> > +add subdevice descriptors to a notifier, depending on the type of device:
> 
> You could reflow this to
> 
> needs for its operation. Several functions are available, to add subdevice
> descriptors to a notifier, depending on the type of device:
> 
> > +:c:func:`v4l2_async_notifier_add_devname_subdev`,
> > +:c:func:`v4l2_async_notifier_add_fwnode_subdev` or
> > +:c:func:`v4l2_async_notifier_add_i2c_subdev`.
> 
> Should you also list v4l2_async_notifier_add_fwnode_remote_subdev() (and

Yes.

> possibly v4l2_async_notifier_parse_fwnode_endpoints()) here ?
> 

Unsure. I'd rather not document this one, as it's deprecated
and we want to remove it.

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 

Thanks!
Ezequiel

