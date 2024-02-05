Return-Path: <linux-media+bounces-4714-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC21849DA6
	for <lists+linux-media@lfdr.de>; Mon,  5 Feb 2024 16:04:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8323C281D9E
	for <lists+linux-media@lfdr.de>; Mon,  5 Feb 2024 15:04:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1D2F2C693;
	Mon,  5 Feb 2024 15:04:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578FF2C690
	for <linux-media@vger.kernel.org>; Mon,  5 Feb 2024 15:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707145443; cv=none; b=mgOVaw0eJVUWWXk/MVi5sCBa7b5Wf+Z1Ykt500IlK3wj0T2BJ/HW8Y9s8828CO5meFfaHPb2PY0lUgRYAC7KyQ6AExiB7/xKABV32c1U7+Qk8NIIV3z4eOSYpznXiR+Remsd7zsMOUlLGqAbcrkWBcrD9bG0pdgd/9cOLmrjOOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707145443; c=relaxed/simple;
	bh=8ZIRinbDDqbDs3WtebeJ3dOII5Sbrd7bQbHuXskKfBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bPhMgzRy9F2dHQsGMffOdq6w8Qy7kCFICmZs8mMJe0OKP2Pj7PIGJVlSmjJDbOm6T7y55JUx413e2qkxgtqV9urUxFoYiTQaBxlcarI5QUl/UtJ9gLVW9+zcp3JU6ODHDTjZUuvqDIfmrHYtxThFvovPHPntvxcosMLf/441T6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E8C4C433F1;
	Mon,  5 Feb 2024 15:04:01 +0000 (UTC)
Message-ID: <7451f022-1bcc-48d2-9b73-211bbff36158@xs4all.nl>
Date: Mon, 5 Feb 2024 16:04:01 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 24/29] media: Documentation: Document how Media device
 resources are released
Content-Language: en-US, nl
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
 <20231220103713.113386-25-sakari.ailus@linux.intel.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20231220103713.113386-25-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/12/2023 11:37, Sakari Ailus wrote:
> Document that after unregistering, Media device memory resources are
> released by the release() callback rather than by calling
> media_device_cleanup().
> 
> Also add that driver memory resources should be bound to the Media device,
> not V4L2 device.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

> ---
>  Documentation/driver-api/media/mc-core.rst | 18 ++++++++++++++++--
>  include/media/media-device.h               |  6 ++++--
>  2 files changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/driver-api/media/mc-core.rst b/Documentation/driver-api/media/mc-core.rst
> index 2456950ce8ff..346f67760671 100644
> --- a/Documentation/driver-api/media/mc-core.rst
> +++ b/Documentation/driver-api/media/mc-core.rst
> @@ -46,13 +46,27 @@ Drivers initialise media device instances by calling
>  :c:func:`media_device_init()`. After initialising a media device instance, it is
>  registered by calling :c:func:`__media_device_register()` via the macro
>  ``media_device_register()`` and unregistered by calling
> -:c:func:`media_device_unregister()`. An initialised media device must be
> -eventually cleaned up by calling :c:func:`media_device_cleanup()`.
> +:c:func:`media_device_unregister()`. The resources of an unregistered media
> +device will be released by the ``release()`` callback of :c:type:`media_device`
> +ops, which will be called when the last user of the media device has released it
> +calling :c:func:`media_device_put()`.
> +
> +The ``release()`` callback is the way all the resources of the media device are
> +released once :c:func:`media_device_init()` has been called. This is also
> +relevant during device driver's probe function as the ``release()`` callback
> +will also have to be able to safely release the resources related to a partially
> +initialised media device.
>  
>  Note that it is not allowed to unregister a media device instance that was not
>  previously registered, or clean up a media device instance that was not
>  previously initialised.
>  
> +Media device and driver's per-device context
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +Drivers should use the struct media_device_ops ``release()`` callback to release
> +their own resources and not e.g. that of the struct v4l2_device.
> +
>  Entities
>  ^^^^^^^^
>  
> diff --git a/include/media/media-device.h b/include/media/media-device.h
> index c6816be0eee8..98e1892f1b51 100644
> --- a/include/media/media-device.h
> +++ b/include/media/media-device.h
> @@ -250,8 +250,10 @@ void media_device_init(struct media_device *mdev);
>   *
>   * @mdev:	pointer to struct &media_device
>   *
> - * This function that will destroy the graph_mutex that is
> - * initialized in media_device_init().
> + * This function that will destroy the graph_mutex that is initialized in
> + * media_device_init(). Note that *only* drivers that do not manage releasing
> + * the memory of th media device itself call this function. This function is
> + * thus effectively DEPRECATED.
>   */
>  void media_device_cleanup(struct media_device *mdev);
>  


