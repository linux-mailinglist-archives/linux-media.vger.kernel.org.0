Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD0F934B76B
	for <lists+linux-media@lfdr.de>; Sat, 27 Mar 2021 14:42:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230105AbhC0Nlb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Mar 2021 09:41:31 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:51252 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230015AbhC0NlN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Mar 2021 09:41:13 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id EEB381F47285
Message-ID: <de3087db97361d9738720c48fb1bf9fbc511d818.camel@collabora.com>
Subject: Re: [PATCHv3] media/mc: show outstanding requests in debugfs
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date:   Sat, 27 Mar 2021 10:41:05 -0300
In-Reply-To: <65a2ef0d-821a-c9c7-cebe-792178f5e227@xs4all.nl>
References: <65a2ef0d-821a-c9c7-cebe-792178f5e227@xs4all.nl>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thanks a lot for pushing this, it looks super useful (I missed the v2).

On Sat, 2021-03-27 at 11:49 +0100, Hans Verkuil wrote:
> It can be hard to debug if all requests and request objects are correctly
> cleaned up when all related filehandles are closed.
> 
> This patch adds a new 'requests' debugfs entry (if CONFIG_VIDEO_ADV_DEBUG
> is set) to report the number of open requests and request objects for a
> given media device node.
> 

I have always associated CONFIG_VIDEO_ADV_DEBUG to VIDIOC_DBG_S/G_REGISTER
only. At least to me, re-using CONFIG_VIDEO_ADV_DEBUG is confusing: it's only
documented in the code what this debug option does.

How about just using CONFIG_DEBUG_FS, or adding a new one like
CONFIG_MEDIA_CONTROLLER_DEBUG or CONFIG_MEDIA_CONTROLLER_REQUEST_DEBUG?

(Coming to think about it, IMO the call-balance checks in drivers/media/common/videobuf2/videobuf2-core.c
should be behind a specific option named like CONFIG_VIDEOBUF2_DEBUG)  

> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
> This patch has been outstanding for too long, it is time that this is
> merged since it is really useful to have, especially for regression testing.
> 
> Changes since v2:
> https://patchwork.linuxtv.org/project/linux-media/patch/20200818143719.102128-2-hverkuil-cisco@xs4all.nl/
> 
> - Fix some CamelCase occurances in comments
> ---
>  drivers/media/mc/mc-device.c  | 27 +++++++++++++++++++++++++++
>  drivers/media/mc/mc-devnode.c | 13 +++++++++++++
>  drivers/media/mc/mc-request.c |  5 +++++
>  include/media/media-device.h  |  9 +++++++++
>  include/media/media-devnode.h |  4 ++++
>  include/media/media-request.h |  2 ++
>  6 files changed, 60 insertions(+)
> 
> diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
> index 9e56d2ad6b94..868ac3200eb7 100644
> --- a/drivers/media/mc/mc-device.c
> +++ b/drivers/media/mc/mc-device.c
> @@ -691,6 +691,23 @@ void media_device_unregister_entity(struct media_entity *entity)
>  }
>  EXPORT_SYMBOL_GPL(media_device_unregister_entity);
> 
> +#if IS_ENABLED(CONFIG_DEBUG_FS) && IS_ENABLED(CONFIG_VIDEO_ADV_DEBUG)
> +/*
> + * Log the state of media requests.
> + * Very useful for debugging.
> + */
> +static int media_device_requests(struct seq_file *file, void *priv)
> +{
> +       struct media_device *dev = dev_get_drvdata(file->private);
> +
> +       seq_printf(file, "number of requests: %d\n",
> +                  atomic_read(&dev->num_requests));
> +       seq_printf(file, "number of request objects: %d\n",
> +                  atomic_read(&dev->num_request_objects));

Is it not better to print some entry per-requests and per-request objects
instead of counters?

I.e. for each request we create a file entry, and that file entry
would read the objects.

Thanks,
Ezequiel

