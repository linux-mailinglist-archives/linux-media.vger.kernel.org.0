Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D30B1B0EFA
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2019 14:40:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731679AbfILMkj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Sep 2019 08:40:39 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:39021 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730454AbfILMkj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Sep 2019 08:40:39 -0400
Received: from [IPv6:2001:420:44c1:2577:24f7:5447:c5bf:b985] ([IPv6:2001:420:44c1:2577:24f7:5447:c5bf:b985])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 8OOoiPlkeV17O8OOriydkz; Thu, 12 Sep 2019 14:40:37 +0200
Subject: Re: [PATCH 1/6] v4l: subdev: Set sd->devnode before registering the
 subdev
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
References: <20190819124728.10511-1-sakari.ailus@linux.intel.com>
 <20190819124728.10511-2-sakari.ailus@linux.intel.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <d62c2300-70b5-4b98-7b9a-6aaec44c724c@xs4all.nl>
Date:   Thu, 12 Sep 2019 14:40:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190819124728.10511-2-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfAfa/UftSsvDvoRxMVGtDXC/G62Qkg6rPq1C7M+CvuyXRpPIK0xQ8Pva0mUQYljPwElAcTUUx4UUQMD5wYMLHCWWZ/i9q+I4IDQp+V0lEnoP8JfHbPlg
 8xJ4xoHrXcQbeLSerJ+slwpeCCq+WDJsMFBHxwPKvtSpXFlp7Om7yt9RkEDzFlFrYkY5oLZuOOnkia7F0+ChXTXu6LdEGjYCt27Wt9ZzhZzcQkUGz9YCXtXM
 T/pAXQYI24t2qZTEaKL8G6Re1xl13ry/oNElKPsLvmqcH/qPOH7NBb5KppccMbw1arXmqCCD08cp7D7Ltmyz4q/S2PpunnoQBMVjuIgvN+k=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/19/19 2:47 PM, Sakari Ailus wrote:
> The subdev's video device node was only assigned after registering the
> device node in the system. While it is unlikely that a driver needed to
> use this field in handling system calls to its file handle, there remains
> a slim chance the devnode field remains NULL while the driver expects to
> find a video node there.
> 
> Assign the devnode field before registering the device, and assign it back
> to NULL if the registration failed.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

> ---
>  drivers/media/v4l2-core/v4l2-device.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-device.c b/drivers/media/v4l2-core/v4l2-device.c
> index aa277f5bc862..8c79699b1be7 100644
> --- a/drivers/media/v4l2-core/v4l2-device.c
> +++ b/drivers/media/v4l2-core/v4l2-device.c
> @@ -248,13 +248,14 @@ int v4l2_device_register_subdev_nodes(struct v4l2_device *v4l2_dev)
>  		vdev->fops = &v4l2_subdev_fops;
>  		vdev->release = v4l2_device_release_subdev_node;
>  		vdev->ctrl_handler = sd->ctrl_handler;
> +		sd->devnode = vdev;
>  		err = __video_register_device(vdev, VFL_TYPE_SUBDEV, -1, 1,
>  					      sd->owner);
>  		if (err < 0) {
> +			sd->devnode = NULL;
>  			kfree(vdev);
>  			goto clean_up;
>  		}
> -		sd->devnode = vdev;
>  #if defined(CONFIG_MEDIA_CONTROLLER)
>  		sd->entity.info.dev.major = VIDEO_MAJOR;
>  		sd->entity.info.dev.minor = vdev->minor;
> 

