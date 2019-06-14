Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D11A463AF
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2019 18:13:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725886AbfFNQNJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Jun 2019 12:13:09 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:33407 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbfFNQNJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Jun 2019 12:13:09 -0400
X-Originating-IP: 37.177.106.100
Received: from uno.localdomain (unknown [37.177.106.100])
        (Authenticated sender: jacopo@jmondi.org)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id DA6DBE0006;
        Fri, 14 Jun 2019 16:13:03 +0000 (UTC)
Date:   Fri, 14 Jun 2019 18:14:16 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se
Subject: Re: [PATCH v2 4/9] v4l2-async: Add
 v4l2_async_notifier_add_fwnode_remote_subdev
Message-ID: <20190614161416.z4ykn7rdzmizxsts@uno.localdomain>
References: <20190606130225.10751-1-sakari.ailus@linux.intel.com>
 <20190606130225.10751-5-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lpad46l3vonoew3k"
Content-Disposition: inline
In-Reply-To: <20190606130225.10751-5-sakari.ailus@linux.intel.com>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--lpad46l3vonoew3k
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Sakari,

On Thu, Jun 06, 2019 at 04:02:20PM +0300, Sakari Ailus wrote:
> v4l2_async_notifier_add_fwnode_remote_subdev is a convenience function for
> parsing information on V4L2 fwnode subdevs.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-async.c | 23 +++++++++++++++++++++++
>  include/media/v4l2-async.h           | 25 +++++++++++++++++++++++++
>  2 files changed, 48 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index dc4e83b4f6ba..2ea8afbcbf8f 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -609,6 +609,29 @@ v4l2_async_notifier_add_fwnode_subdev(struct v4l2_async_notifier *notifier,
>  }
>  EXPORT_SYMBOL_GPL(v4l2_async_notifier_add_fwnode_subdev);
>
> +int
> +v4l2_async_notifier_add_fwnode_remote_subdev(struct v4l2_async_notifier *notif,
> +					     struct fwnode_handle *endpoint,
> +					     struct v4l2_async_subdev *asd)
> +{
> +	struct fwnode_handle *remote_ep;
> +	int ret;
> +
> +	remote_ep = fwnode_graph_get_remote_endpoint(endpoint);
> +	if (!remote_ep)
> +		return -ENOTCONN;
> +
> +	asd->match_type = V4L2_ASYNC_MATCH_FWNODE;
> +	asd->match.fwnode = remote_ep;
> +
> +	ret = v4l2_async_notifier_add_subdev(notif, asd);
> +	if (ret)
> +		fwnode_handle_put(remote_ep);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_async_notifier_add_fwnode_remote_subdev);
> +
>  struct v4l2_async_subdev *
>  v4l2_async_notifier_add_i2c_subdev(struct v4l2_async_notifier *notifier,
>  				   int adapter_id, unsigned short address,
> diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
> index b9141ffa188a..55ce3c1672a4 100644
> --- a/include/media/v4l2-async.h
> +++ b/include/media/v4l2-async.h
> @@ -185,6 +185,31 @@ v4l2_async_notifier_add_fwnode_subdev(struct v4l2_async_notifier *notifier,
>  				      unsigned int asd_struct_size);
>
>  /**
> + * v4l2_async_notifier_add_fwnode_remote_subdev - Allocate and add a fwnode
> + *						  remote async subdev to the
> + *						  notifier's master asd_list.
> + *
> + * @notif: pointer to &struct v4l2_async_notifier
> + * @endpoint: local endpoint the remote sub-device to be matched

Not sure I get what you mean here, maybe you're missing a "to" between
the "local endpoint" and "the remote sub-device" ?

> + * @asd: Async sub-device struct allocated by the caller. The &struct
> + *	 v4l2_async_subdev shall be the first member of the driver's async
> + *	 sub-device struct, i.e. both begin at the same memory address.
> + *
> + * Gets the remote endpoint of a given local endpoint, set it up for fwnode
> + * matching and add the async sub-device to the notifier's @asd_list. The

and adds

> + * function also gets a reference of the fwnode which is released later at
> + * notifier cleanup time.
> + *
> + * This is just like @v4l2_async_notifier_add_fwnode_subdev, but with the
> + * exception that the fwnode refers to a local endpoint, not the remote one, and
> + * the function relies on the caller to allocate the async sub-device struct.

This makes v4l2_async_notifier_add_fwnode_subdev behave differently from
v4l2_async_notifier_add_subdev and the here introduced
v4l2_async_notifier_add_remote_subdev in the sense that it's the only
one that allocates the asd for the caller. I'm not sure I see the
advantage of having many functions for doing similar things with a
slightly different interface. What is the reason add_fwnode-subdev
allocates the asd for the caller?

Thanks
  j

> + */
> +int
> +v4l2_async_notifier_add_fwnode_remote_subdev(struct v4l2_async_notifier *notif,
> +					     struct fwnode_handle *endpoint,
> +					     struct v4l2_async_subdev *asd);
> +
> +/**
>   * v4l2_async_notifier_add_i2c_subdev - Allocate and add an i2c async
>   *				subdev to the notifier's master asd_list.
>   *
> --
> 2.11.0
>

--lpad46l3vonoew3k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl0Dx9gACgkQcjQGjxah
Vjyfzg/+K6OfxY8Z8aTK9qobSm0OSSgWDJc3SivYJemAA82b7no+9qmvjNeOz/oa
qUeCUkV0F0UJ5cQbslY98AWIc4uQJpjuLzu57OiyWb77Suzsj1j5PG/Yj1Xxndye
7zLF9/j1VUe3QY79tqXdkw5udVMQvpkOgPTPeLTjCOr4nnCPOVLaLZLSoCZUG4H8
h0EyViwE8lNRSzgYGr6LHuZQXNhBY3XHBXUCUUgxFTwXTr8/kvztSuVHoF8DtsfW
/AYEoWUL3jIMkAbuqrKOTGTAIv+UXAXtY3jo8ITghPdRi4hZVlJKGppVw11vWI+C
70iyaJ9V8SSO6ccWkRvHJb9eBzg0GUzaB27EhZmG7ukogLwEz9LKIHpVXcsmEnjS
yBXT9W9JPN+9qMToCSZ9M4Oltd4/dHltTpg9Isi/8NCxhHqlI48etw1fzNgrkAyL
eNr3OMkXkOS7tDbftKrX9qVLNx0mqPz1z1XDpcN4pleNEXGnM7ldCBIGUZByaxGS
k5Qhx+jf9W/pYD8Vs3H1osCN4eCopKXVBgev9j66olVWzZmOXjEL9FSwXVuL6gni
E0Iv/cJFI0S7yQ05TBj7kCAJeAmXG4r3joJ5LqcFlWRJO1umhcUufT9XzQTIZlYd
XG2GASMfQoHgCuyhCc5b6PWHQjYerzyDNR7bFHWHDZ2fyUIT1pU=
=Ep40
-----END PGP SIGNATURE-----

--lpad46l3vonoew3k--
