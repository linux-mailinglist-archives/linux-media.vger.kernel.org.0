Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CEE211F443
	for <lists+linux-media@lfdr.de>; Sat, 14 Dec 2019 22:31:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726967AbfLNVbo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 14 Dec 2019 16:31:44 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:37115 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726783AbfLNVbo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 14 Dec 2019 16:31:44 -0500
Received: by mail-wr1-f66.google.com with SMTP id w15so2660329wru.4
        for <linux-media@vger.kernel.org>; Sat, 14 Dec 2019 13:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=lcaF7JZ3fbivz18eyv4sxR9H66lXNh5pG0WqxsPgxMc=;
        b=Ac2zwY3/BxkyYF71VSDbFq/Klyn768iMD6BrnXga6kwO4Xv1cpfgGUnd62VgzqF7S6
         /qOGGkmMfGZj2w1vzpRu3cGGq6Cr9IOBcc3tF1v44QL1gsNVAkGSDujdwqyRJlWdfsd/
         gPA4UDog4RmE7N/ZKX31ziJPwUAQwzsE/g4yG22EcRizEUtZ+sI9FZD452kUl1hKJnzm
         67heHp2L2gKmSStMc6Zi3U1Ql5041RS/l8LA40svnkmsZVAPpYtrWHO+MXudUjAdINs/
         oYNuBaoQM2toKkC3FQXTKZtjMqvX0Hxrp+t0M2LqGrTqYzBFyYMV91HLUEUIgJpg+i5c
         vjLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=lcaF7JZ3fbivz18eyv4sxR9H66lXNh5pG0WqxsPgxMc=;
        b=afuj1AZ3KCFm4HifwlmQbTAYJTVjbaAkS7WB+Ebl0f6PwciU92EmmelzbaXJsHWZE9
         5pf3vNa+V6aBnbhCbB8Cl6yoDAhCBQoF1GequSBVUXUtBbnthPSPnjHPy5JulGfjtdna
         qp6a1UExTCJqgSP1n99KJB/1AK6s1cYDpvz1kHtWY79ePxfE1jDz7hjmgWx7cbXmyUvS
         F5jp5QiqbvrXkbomRJloU5zb4QngzSMmNuB6mVL5zNJZlwM5lNlkXLGCJgGMmND3hZxg
         v2nKPpqZKVRL0Mbyc9jZn8MHkb+V9MywbSlb0yMPhrKBBLdlEz3AEyKBj/7WNoUP2KF7
         kSQw==
X-Gm-Message-State: APjAAAW77bY1AMM9i5ZI0oQabGfh1ETe+MRUV0nk6m9ZsTldzAHP+8of
        iMzjBPi4EpJAVjolBXcpiDQ+0rEa
X-Google-Smtp-Source: APXvYqyYSqQ7BpWMfvAIMkT+hmZYYLhaJH3fEGfaq1XxkNM6QeS3EggRtT7XXdjXbKypm2zr4CKMdA==
X-Received: by 2002:a5d:4692:: with SMTP id u18mr21351807wrq.206.1576359099921;
        Sat, 14 Dec 2019 13:31:39 -0800 (PST)
Received: from [172.30.89.12] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id k8sm15558707wrl.3.2019.12.14.13.31.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Dec 2019 13:31:39 -0800 (PST)
Subject: Re: [PATCH v2 05/23] media: entity: Add functions to convert fwnode
 endpoints to media links
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org
References: <20191124190703.12138-1-slongerbeam@gmail.com>
 <20191124190703.12138-6-slongerbeam@gmail.com>
 <20191128134657.mlxzawiywyjlqzst@uno.localdomain>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <a685789a-cfe5-73eb-99d6-034043734a68@gmail.com>
Date:   Sat, 14 Dec 2019 13:31:37 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191128134657.mlxzawiywyjlqzst@uno.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On 11/28/19 5:46 AM, Jacopo Mondi wrote:
> Hi Steve,
>
> On Sun, Nov 24, 2019 at 11:06:45AM -0800, Steve Longerbeam wrote:
>> Adds two functions:
>>
>> media_create_fwnode_pad_links(), which converts fwnode endpoints that
>> connect a local pad to all pads on a remote entity into media links.
>>
>> media_create_fwnode_links(), which converts fwnode endpoints that
>> connect all pads from a local entity to all pads on a remote entity into
>> media links.
>>
>> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
>> ---
>> Changes in v2:
>> - fixed/improved the prototype descriptions.
>> ---
>>   drivers/media/mc/mc-entity.c | 178 +++++++++++++++++++++++++++++++++++
>>   include/media/media-entity.h |  71 ++++++++++++++
>>   2 files changed, 249 insertions(+)
>>
>> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
>> index e9e090244fd4..45bbd6c91019 100644
>> --- a/drivers/media/mc/mc-entity.c
>> +++ b/drivers/media/mc/mc-entity.c
>> @@ -787,6 +787,184 @@ int media_create_pad_links(const struct media_device *mdev,
>>   }
>>   EXPORT_SYMBOL_GPL(media_create_pad_links);
>>
>> +static int __media_create_fwnode_pad_link(struct media_pad *local_pad,
>> +					struct media_entity *remote,
>> +					const struct fwnode_handle *remote_ep,
>> +					const u32 flags)
>> +{
>> +	struct media_entity *local = local_pad->entity;
>> +	unsigned long local_dir = local_pad->flags;
>> +	unsigned long remote_dir = (local_dir & MEDIA_PAD_FL_SOURCE) ?
>> +		MEDIA_PAD_FL_SINK : MEDIA_PAD_FL_SOURCE;
>> +	struct media_entity *src, *sink;
>> +	int src_pad, sink_pad;
>> +	int remote_pad;
>> +	int ret;
>> +
>> +	remote_pad = media_entity_get_fwnode_pad(remote, remote_ep,
>> +						 remote_dir);
>> +	if (remote_pad < 0)
>> +		return 0;
>> +
>> +	if (local_dir & MEDIA_PAD_FL_SOURCE) {
>> +		src = local;
>> +		src_pad = local_pad->index;
>> +		sink = remote;
>> +		sink_pad = remote_pad;
>> +	} else {
>> +		src = remote;
>> +		src_pad = remote_pad;
>> +		sink = local;
>> +		sink_pad = local_pad->index;
>> +	}
>> +
>> +	/* make sure link doesn't already exist */
>> +	if (media_entity_find_link(&src->pads[src_pad],
>> +				   &sink->pads[sink_pad]))
>> +		return 0;
>> +
>> +	ret = media_create_pad_link(src, src_pad, sink, sink_pad, flags);
>> +	if (ret) {
>> +		dev_dbg(sink->graph_obj.mdev->dev,
>> +			"%s:%d -> %s:%d failed with %d\n",
>> +			src->name, src_pad, sink->name, sink_pad,
>> +			ret);
>> +		return ret;
>> +	}
>> +
>> +	dev_dbg(sink->graph_obj.mdev->dev, "%s:%d -> %s:%d\n",
>> +		src->name, src_pad, sink->name, sink_pad);
>> +
>> +	return 0;
>> +}
>> +
>> +int __media_create_fwnode_pad_links(struct media_pad *local_pad,
>> +				    const struct fwnode_handle *local_fwnode,
>> +				    struct media_entity *remote,
>> +				    const struct fwnode_handle *remote_fwnode,
>> +				    const u32 link_flags)
>> +{
>> +	struct fwnode_handle *endpoint;
>> +
>> +	fwnode_graph_for_each_endpoint(remote_fwnode, endpoint) {
>> +		struct fwnode_link link;
>> +		int ret;
>> +
>> +		ret = fwnode_graph_parse_link(endpoint, &link);
>> +		if (ret)
>> +			continue;
>> +
>> +		/*
>> +		 * if this endpoint does not link to the local fwnode
>> +		 * device, ignore it and continue.
>> +		 */
>> +		if (link.remote_port_parent != local_fwnode) {
>> +			fwnode_graph_put_link(&link);
>> +			continue;
>> +		}
>> +
>> +		ret = __media_create_fwnode_pad_link(local_pad,
>> +						     remote, endpoint,
>> +						     link_flags);
>> +
>> +		fwnode_graph_put_link(&link);
>> +
>> +		if (ret) {
>> +			fwnode_handle_put(endpoint);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(__media_create_fwnode_pad_links);
>> +
>> +int media_create_fwnode_pad_links(struct media_pad *local_pad,
>> +				  const struct fwnode_handle *local_fwnode,
>> +				  struct media_entity *remote,
>> +				  const struct fwnode_handle *remote_fwnode,
>> +				  const u32 link_flags)
>> +{
>> +	struct media_device *mdev = local_pad->entity->graph_obj.mdev;
>> +	int ret;
>> +
>> +	mutex_lock(&mdev->graph_mutex);
>> +	ret = __media_create_fwnode_pad_links(local_pad, local_fwnode,
>> +					      remote, remote_fwnode,
>> +					      link_flags);
>> +	mutex_unlock(&mdev->graph_mutex);
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(media_create_fwnode_pad_links);
>> +
>> +int __media_create_fwnode_links(struct media_entity *local,
>> +				const struct fwnode_handle *local_fwnode,
>> +				struct media_entity *remote,
>> +				const struct fwnode_handle *remote_fwnode,
>> +				const u32 link_flags)
>> +{
>> +	struct fwnode_handle *endpoint;
>> +
>> +	fwnode_graph_for_each_endpoint(local_fwnode, endpoint) {
>> +		struct fwnode_link link;
>> +		int local_pad;
>> +		int ret;
>> +
>> +		local_pad = media_entity_get_fwnode_pad(local, endpoint,
>> +							MEDIA_PAD_FL_SINK |
>> +							MEDIA_PAD_FL_SOURCE);
> I wonder.. I feel like we could have saved a lot of churn if we record
> the local endpoint on which we register an async device, likely in
> struct v4l2_async_subdev.
>
> At bound() time we would receive back the local endpoint on which the
> just bound subdev was originally registered, we could get the remote
> endpoint by parsing the fwnode_graph_link and from there we could
> provide utilities like the ones you have here, by saving testing all
> endpoints until we don't find one that matches the subdev which got
> bound.
>
> This would probably just work for V4L2_ASYNC_MATCH_FWNODE though, but
> have you considered this solution ? It would avoid trying all the
> local endpoints blindly here and it would encourage drivers to provide
> a function to do the endpoint->pad_index translation (which ideally
> they should, to avoid workarounds like the ones we have in
> media_entity_get_fwnode_pad()

It sounds like a promising idea, I'll start looking into it.

Steve

> Thanks
>    j
>
>> +		if (local_pad < 0)
>> +			continue;
>> +
>> +		ret = fwnode_graph_parse_link(endpoint, &link);
>> +		if (ret)
>> +			continue;
>> +
>> +		/*
>> +		 * if this endpoint does not link to the remote fwnode
>> +		 * device, ignore it and continue.
>> +		 */
>> +		if (link.remote_port_parent != remote_fwnode) {
>> +			fwnode_graph_put_link(&link);
>> +			continue;
>> +		}
>> +
>> +		ret = __media_create_fwnode_pad_link(&local->pads[local_pad],
>> +						     remote,
>> +						     link.remote.local_fwnode,
>> +						     link_flags);
>> +
>> +		fwnode_graph_put_link(&link);
>> +
>> +		if (ret) {
>> +			fwnode_handle_put(endpoint);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(__media_create_fwnode_links);
>> +
>> +int media_create_fwnode_links(struct media_entity *local,
>> +			      const struct fwnode_handle *local_fwnode,
>> +			      struct media_entity *remote,
>> +			      const struct fwnode_handle *remote_fwnode,
>> +			      const u32 link_flags)
>> +{
>> +	struct media_device *mdev = local->graph_obj.mdev;
>> +	int ret;
>> +
>> +	mutex_lock(&mdev->graph_mutex);
>> +	ret = __media_create_fwnode_links(local, local_fwnode,
>> +					  remote, remote_fwnode, link_flags);
>> +	mutex_unlock(&mdev->graph_mutex);
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(media_create_fwnode_links);
>> +
>>   void __media_entity_remove_links(struct media_entity *entity)
>>   {
>>   	struct media_link *link, *tmp;
>> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
>> index de7fc3676b5a..100673ad83c4 100644
>> --- a/include/media/media-entity.h
>> +++ b/include/media/media-entity.h
>> @@ -772,6 +772,77 @@ int media_create_pad_links(const struct media_device *mdev,
>>   			   u32 flags,
>>   			   const bool allow_both_undefined);
>>
>> +/**
>> + * media_create_fwnode_pad_links() - create links between a single local pad
>> + *			and a remote entity, using the fwnode endpoints
>> + *			between them.
>> + *
>> + * @local_pad: Pointer to &media_pad of the local media pad.
>> + * @local_fwnode: Pointer to the local device's firmware node.
>> + * @remote: Pointer to &media_entity of the remote device.
>> + * @remote_fwnode: Pointer to the remote device's firmware node.
>> + * @link_flags: Link flags, as defined in include/uapi/linux/media.h.
>> + *
>> + * .. note::
>> + *
>> + *    Before calling this function, media_entity_pads_init() and
>> + *    media_device_register_entity() should be called previously for
>> + *    both entities to be linked.
>> + *
>> + *    Locked (via the mdev graph_mutex) and unlocked versions of this
>> + *    function are provided. If this function is called from v4l2-async
>> + *    notifier bound handlers, the locked version should be used to
>> + *    prevent races with other subdevices loading and binding to their
>> + *    notifiers in parallel. The unlocked version can for example be
>> + *    called from v4l2-async notifier complete handlers, after all
>> + *    subdevices have loaded and bound.
>> + */
>> +int __media_create_fwnode_pad_links(struct media_pad *local_pad,
>> +				    const struct fwnode_handle *local_fwnode,
>> +				    struct media_entity *remote,
>> +				    const struct fwnode_handle *remote_fwnode,
>> +				    const u32 link_flags);
>> +int media_create_fwnode_pad_links(struct media_pad *local_pad,
>> +				  const struct fwnode_handle *local_fwnode,
>> +				  struct media_entity *remote,
>> +				  const struct fwnode_handle *remote_fwnode,
>> +				  const u32 link_flags);
>> +
>> +/**
>> + * media_create_fwnode_links() - create links between two entities, using
>> + *				the fwnode endpoints between them.
>> + *
>> + * @local: Pointer to &media_entity of the local device.
>> + * @local_fwnode: Pointer to the local device's firmware node.
>> + * @remote: Pointer to &media_entity of the remote device.
>> + * @remote_fwnode: Pointer to the remote device's firmware node.
>> + * @link_flags: Link flags, as defined in include/uapi/linux/media.h.
>> + *
>> + * .. note::
>> + *
>> + *    Before calling this function, media_entity_pads_init() and
>> + *    media_device_register_entity() should be called previously for
>> + *    both entities to be linked.
>> + *
>> + *    Locked (via the mdev graph_mutex) and unlocked versions of this
>> + *    function are provided. If this function is called from v4l2-async
>> + *    notifier bound handlers, the locked version should be used to
>> + *    prevent races with other subdevices loading and binding to their
>> + *    notifiers in parallel. The unlocked version can for example be
>> + *    called from v4l2-async notifier complete handlers, after all
>> + *    subdevices have loaded and bound.
>> + */
>> +int __media_create_fwnode_links(struct media_entity *local,
>> +				const struct fwnode_handle *local_fwnode,
>> +				struct media_entity *remote,
>> +				const struct fwnode_handle *remote_fwnode,
>> +				const u32 link_flags);
>> +int media_create_fwnode_links(struct media_entity *local,
>> +			      const struct fwnode_handle *local_fwnode,
>> +			      struct media_entity *remote,
>> +			      const struct fwnode_handle *remote_fwnode,
>> +			      const u32 link_flags);
>> +
>>   void __media_entity_remove_links(struct media_entity *entity);
>>
>>   /**
>> --
>> 2.17.1
>>

