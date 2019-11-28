Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B5DE10C9C5
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2019 14:45:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726622AbfK1Now (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Nov 2019 08:44:52 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:51237 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726561AbfK1Now (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Nov 2019 08:44:52 -0500
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 7511160013;
        Thu, 28 Nov 2019 13:44:49 +0000 (UTC)
Date:   Thu, 28 Nov 2019 14:46:57 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH v2 05/23] media: entity: Add functions to convert fwnode
 endpoints to media links
Message-ID: <20191128134657.mlxzawiywyjlqzst@uno.localdomain>
References: <20191124190703.12138-1-slongerbeam@gmail.com>
 <20191124190703.12138-6-slongerbeam@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gcxnioxb5vvdk3wu"
Content-Disposition: inline
In-Reply-To: <20191124190703.12138-6-slongerbeam@gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--gcxnioxb5vvdk3wu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Steve,

On Sun, Nov 24, 2019 at 11:06:45AM -0800, Steve Longerbeam wrote:
> Adds two functions:
>
> media_create_fwnode_pad_links(), which converts fwnode endpoints that
> connect a local pad to all pads on a remote entity into media links.
>
> media_create_fwnode_links(), which converts fwnode endpoints that
> connect all pads from a local entity to all pads on a remote entity into
> media links.
>
> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
> ---
> Changes in v2:
> - fixed/improved the prototype descriptions.
> ---
>  drivers/media/mc/mc-entity.c | 178 +++++++++++++++++++++++++++++++++++
>  include/media/media-entity.h |  71 ++++++++++++++
>  2 files changed, 249 insertions(+)
>
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index e9e090244fd4..45bbd6c91019 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -787,6 +787,184 @@ int media_create_pad_links(const struct media_device *mdev,
>  }
>  EXPORT_SYMBOL_GPL(media_create_pad_links);
>
> +static int __media_create_fwnode_pad_link(struct media_pad *local_pad,
> +					struct media_entity *remote,
> +					const struct fwnode_handle *remote_ep,
> +					const u32 flags)
> +{
> +	struct media_entity *local = local_pad->entity;
> +	unsigned long local_dir = local_pad->flags;
> +	unsigned long remote_dir = (local_dir & MEDIA_PAD_FL_SOURCE) ?
> +		MEDIA_PAD_FL_SINK : MEDIA_PAD_FL_SOURCE;
> +	struct media_entity *src, *sink;
> +	int src_pad, sink_pad;
> +	int remote_pad;
> +	int ret;
> +
> +	remote_pad = media_entity_get_fwnode_pad(remote, remote_ep,
> +						 remote_dir);
> +	if (remote_pad < 0)
> +		return 0;
> +
> +	if (local_dir & MEDIA_PAD_FL_SOURCE) {
> +		src = local;
> +		src_pad = local_pad->index;
> +		sink = remote;
> +		sink_pad = remote_pad;
> +	} else {
> +		src = remote;
> +		src_pad = remote_pad;
> +		sink = local;
> +		sink_pad = local_pad->index;
> +	}
> +
> +	/* make sure link doesn't already exist */
> +	if (media_entity_find_link(&src->pads[src_pad],
> +				   &sink->pads[sink_pad]))
> +		return 0;
> +
> +	ret = media_create_pad_link(src, src_pad, sink, sink_pad, flags);
> +	if (ret) {
> +		dev_dbg(sink->graph_obj.mdev->dev,
> +			"%s:%d -> %s:%d failed with %d\n",
> +			src->name, src_pad, sink->name, sink_pad,
> +			ret);
> +		return ret;
> +	}
> +
> +	dev_dbg(sink->graph_obj.mdev->dev, "%s:%d -> %s:%d\n",
> +		src->name, src_pad, sink->name, sink_pad);
> +
> +	return 0;
> +}
> +
> +int __media_create_fwnode_pad_links(struct media_pad *local_pad,
> +				    const struct fwnode_handle *local_fwnode,
> +				    struct media_entity *remote,
> +				    const struct fwnode_handle *remote_fwnode,
> +				    const u32 link_flags)
> +{
> +	struct fwnode_handle *endpoint;
> +
> +	fwnode_graph_for_each_endpoint(remote_fwnode, endpoint) {
> +		struct fwnode_link link;
> +		int ret;
> +
> +		ret = fwnode_graph_parse_link(endpoint, &link);
> +		if (ret)
> +			continue;
> +
> +		/*
> +		 * if this endpoint does not link to the local fwnode
> +		 * device, ignore it and continue.
> +		 */
> +		if (link.remote_port_parent != local_fwnode) {
> +			fwnode_graph_put_link(&link);
> +			continue;
> +		}
> +
> +		ret = __media_create_fwnode_pad_link(local_pad,
> +						     remote, endpoint,
> +						     link_flags);
> +
> +		fwnode_graph_put_link(&link);
> +
> +		if (ret) {
> +			fwnode_handle_put(endpoint);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(__media_create_fwnode_pad_links);
> +
> +int media_create_fwnode_pad_links(struct media_pad *local_pad,
> +				  const struct fwnode_handle *local_fwnode,
> +				  struct media_entity *remote,
> +				  const struct fwnode_handle *remote_fwnode,
> +				  const u32 link_flags)
> +{
> +	struct media_device *mdev = local_pad->entity->graph_obj.mdev;
> +	int ret;
> +
> +	mutex_lock(&mdev->graph_mutex);
> +	ret = __media_create_fwnode_pad_links(local_pad, local_fwnode,
> +					      remote, remote_fwnode,
> +					      link_flags);
> +	mutex_unlock(&mdev->graph_mutex);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(media_create_fwnode_pad_links);
> +
> +int __media_create_fwnode_links(struct media_entity *local,
> +				const struct fwnode_handle *local_fwnode,
> +				struct media_entity *remote,
> +				const struct fwnode_handle *remote_fwnode,
> +				const u32 link_flags)
> +{
> +	struct fwnode_handle *endpoint;
> +
> +	fwnode_graph_for_each_endpoint(local_fwnode, endpoint) {
> +		struct fwnode_link link;
> +		int local_pad;
> +		int ret;
> +
> +		local_pad = media_entity_get_fwnode_pad(local, endpoint,
> +							MEDIA_PAD_FL_SINK |
> +							MEDIA_PAD_FL_SOURCE);

I wonder.. I feel like we could have saved a lot of churn if we record
the local endpoint on which we register an async device, likely in
struct v4l2_async_subdev.

At bound() time we would receive back the local endpoint on which the
just bound subdev was originally registered, we could get the remote
endpoint by parsing the fwnode_graph_link and from there we could
provide utilities like the ones you have here, by saving testing all
endpoints until we don't find one that matches the subdev which got
bound.

This would probably just work for V4L2_ASYNC_MATCH_FWNODE though, but
have you considered this solution ? It would avoid trying all the
local endpoints blindly here and it would encourage drivers to provide
a function to do the endpoint->pad_index translation (which ideally
they should, to avoid workarounds like the ones we have in
media_entity_get_fwnode_pad()

Thanks
  j

> +		if (local_pad < 0)
> +			continue;
> +
> +		ret = fwnode_graph_parse_link(endpoint, &link);
> +		if (ret)
> +			continue;
> +
> +		/*
> +		 * if this endpoint does not link to the remote fwnode
> +		 * device, ignore it and continue.
> +		 */
> +		if (link.remote_port_parent != remote_fwnode) {
> +			fwnode_graph_put_link(&link);
> +			continue;
> +		}
> +
> +		ret = __media_create_fwnode_pad_link(&local->pads[local_pad],
> +						     remote,
> +						     link.remote.local_fwnode,
> +						     link_flags);
> +
> +		fwnode_graph_put_link(&link);
> +
> +		if (ret) {
> +			fwnode_handle_put(endpoint);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(__media_create_fwnode_links);
> +
> +int media_create_fwnode_links(struct media_entity *local,
> +			      const struct fwnode_handle *local_fwnode,
> +			      struct media_entity *remote,
> +			      const struct fwnode_handle *remote_fwnode,
> +			      const u32 link_flags)
> +{
> +	struct media_device *mdev = local->graph_obj.mdev;
> +	int ret;
> +
> +	mutex_lock(&mdev->graph_mutex);
> +	ret = __media_create_fwnode_links(local, local_fwnode,
> +					  remote, remote_fwnode, link_flags);
> +	mutex_unlock(&mdev->graph_mutex);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(media_create_fwnode_links);
> +
>  void __media_entity_remove_links(struct media_entity *entity)
>  {
>  	struct media_link *link, *tmp;
> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> index de7fc3676b5a..100673ad83c4 100644
> --- a/include/media/media-entity.h
> +++ b/include/media/media-entity.h
> @@ -772,6 +772,77 @@ int media_create_pad_links(const struct media_device *mdev,
>  			   u32 flags,
>  			   const bool allow_both_undefined);
>
> +/**
> + * media_create_fwnode_pad_links() - create links between a single local pad
> + *			and a remote entity, using the fwnode endpoints
> + *			between them.
> + *
> + * @local_pad: Pointer to &media_pad of the local media pad.
> + * @local_fwnode: Pointer to the local device's firmware node.
> + * @remote: Pointer to &media_entity of the remote device.
> + * @remote_fwnode: Pointer to the remote device's firmware node.
> + * @link_flags: Link flags, as defined in include/uapi/linux/media.h.
> + *
> + * .. note::
> + *
> + *    Before calling this function, media_entity_pads_init() and
> + *    media_device_register_entity() should be called previously for
> + *    both entities to be linked.
> + *
> + *    Locked (via the mdev graph_mutex) and unlocked versions of this
> + *    function are provided. If this function is called from v4l2-async
> + *    notifier bound handlers, the locked version should be used to
> + *    prevent races with other subdevices loading and binding to their
> + *    notifiers in parallel. The unlocked version can for example be
> + *    called from v4l2-async notifier complete handlers, after all
> + *    subdevices have loaded and bound.
> + */
> +int __media_create_fwnode_pad_links(struct media_pad *local_pad,
> +				    const struct fwnode_handle *local_fwnode,
> +				    struct media_entity *remote,
> +				    const struct fwnode_handle *remote_fwnode,
> +				    const u32 link_flags);
> +int media_create_fwnode_pad_links(struct media_pad *local_pad,
> +				  const struct fwnode_handle *local_fwnode,
> +				  struct media_entity *remote,
> +				  const struct fwnode_handle *remote_fwnode,
> +				  const u32 link_flags);
> +
> +/**
> + * media_create_fwnode_links() - create links between two entities, using
> + *				the fwnode endpoints between them.
> + *
> + * @local: Pointer to &media_entity of the local device.
> + * @local_fwnode: Pointer to the local device's firmware node.
> + * @remote: Pointer to &media_entity of the remote device.
> + * @remote_fwnode: Pointer to the remote device's firmware node.
> + * @link_flags: Link flags, as defined in include/uapi/linux/media.h.
> + *
> + * .. note::
> + *
> + *    Before calling this function, media_entity_pads_init() and
> + *    media_device_register_entity() should be called previously for
> + *    both entities to be linked.
> + *
> + *    Locked (via the mdev graph_mutex) and unlocked versions of this
> + *    function are provided. If this function is called from v4l2-async
> + *    notifier bound handlers, the locked version should be used to
> + *    prevent races with other subdevices loading and binding to their
> + *    notifiers in parallel. The unlocked version can for example be
> + *    called from v4l2-async notifier complete handlers, after all
> + *    subdevices have loaded and bound.
> + */
> +int __media_create_fwnode_links(struct media_entity *local,
> +				const struct fwnode_handle *local_fwnode,
> +				struct media_entity *remote,
> +				const struct fwnode_handle *remote_fwnode,
> +				const u32 link_flags);
> +int media_create_fwnode_links(struct media_entity *local,
> +			      const struct fwnode_handle *local_fwnode,
> +			      struct media_entity *remote,
> +			      const struct fwnode_handle *remote_fwnode,
> +			      const u32 link_flags);
> +
>  void __media_entity_remove_links(struct media_entity *entity);
>
>  /**
> --
> 2.17.1
>

--gcxnioxb5vvdk3wu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl3fz9EACgkQcjQGjxah
VjyiGBAAwq1enYXmYGiKedYw6kB7Fi7KYBWPKHwdXtSeGtFronufSA9TtaqkNRRO
KsD4fo9Bv8zOruowrwz+CCEOerp2ENMFKnFge5ptq/9ESVhUV7sBLohTAr+mZjZH
PLBPWK6dJv9Pt+M+0Y0Bdkds6r0tD/6LyPXyb8j3mSPa/4MHxL5/j9wFGZ/taBJp
VgOfNwxZAHlykROBTJ5UTdyia9tzbbJ0deIOwymbuMf8+rLHUZj/VqsDUtZpi6Go
V8GObQ4wis2KIU0bcF5KMtJgfI5npK8xUKcE/vPaTi35YxVm0TF6nz9tbs9HEEnj
48QS//OXVeFvWBd/hLQg9dYYayoxjaX4MYyhjS+0uOCFLw/pr4P6tPy+o1L8FiJh
k87syfSoCVi5koV8LgEvzbQlC2p6IFCa16LbB+CYKpOywvkv3wW8/YHZAQsVW1Kw
pH7M+2x8RVOfpmXlvbxuk/VuSHYFnm7XiwZ1g7D2kao4dgd0RTOUr4w3pLVm9liT
xfmGPqwkJJBX9vx1j8cL7EEsi9mU+yz1b51RkIYtq1S5VLOCsm/dyWBN/BUTgBRv
Ryf+EJxx1Pla51iofhhi5MhMhN23ZDOk/Q+BM+3CnM+gc5usD0yI20iz0qvuP5c4
1eoFUHNUpl19/w2FvK0I/D6CHVXgAHrtKmCbwgB7fbK7qp2tBsc=
=/HlE
-----END PGP SIGNATURE-----

--gcxnioxb5vvdk3wu--
