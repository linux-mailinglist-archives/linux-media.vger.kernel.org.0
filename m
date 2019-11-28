Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F0C910C850
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2019 13:02:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726448AbfK1MCG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Nov 2019 07:02:06 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:40589 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726227AbfK1MCG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Nov 2019 07:02:06 -0500
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 86F0460007;
        Thu, 28 Nov 2019 12:02:03 +0000 (UTC)
Date:   Thu, 28 Nov 2019 13:04:11 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH v2 02/23] media: entity: Modify default behavior of
 media_entity_get_fwnode_pad
Message-ID: <20191128120411.x7avm62lyq36gdya@uno.localdomain>
References: <20191124190703.12138-1-slongerbeam@gmail.com>
 <20191124190703.12138-3-slongerbeam@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wdwotjv2merb2wut"
Content-Disposition: inline
In-Reply-To: <20191124190703.12138-3-slongerbeam@gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--wdwotjv2merb2wut
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Steve,

On Sun, Nov 24, 2019 at 11:06:42AM -0800, Steve Longerbeam wrote:
> Modify the default behavior of media_entity_get_fwnode_pad() (when the
> entity does not provide the get_fwnode_pad op) to first assume the entity
> implements a 1:1 mapping between fwnode port number and media pad index.
>
> If the 1:1 mapping is not valid, e.g. the port number falls outside the
> entity's pad index range, or the pad at that port number doesn't match the
> given direction_flags, fall-back to the previous behavior that searches
> the entity for the first pad that matches the given direction_flags.
>
> The previous default behavior can choose the wrong pad for entities with
> multiple sink or source pads. With this change the function will choose
> the correct pad index if the entity implements a 1:1 port to pad mapping
> at that port.
>
> Add some comments to the @get_fwnode_pad operation to make it more clear
> under what conditions entities must implement the operation.
>

I understand the rationale behind this, but this is not better than
assuming the first pad with a matching direction flag is the right
one imho.

This should help for subdevices with multiple sink/sources, but they
should really implement get_fwnode_pad() instead of relying on yet another
assumption as we had "the first pad with matching direction is the right
one" and now we also have "the pad at index endpoint.port is the right
one". As you've been testing it, how many of the current mailine
supported devices actually need this and could not:
1) Implement get_fwnode_pad() as you are doing for adv748x
2) Keep assuming the first pad with a matching flag is the correct one

Thanks
   j
> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
> ---
>  drivers/media/mc/mc-entity.c | 25 ++++++++++++++++++++-----
>  include/media/media-entity.h | 21 +++++++++++++++------
>  2 files changed, 35 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index c333320f790a..47a39d9383d8 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -370,22 +370,37 @@ int media_entity_get_fwnode_pad(struct media_entity *entity,
>  				unsigned long direction_flags)
>  {
>  	struct fwnode_endpoint endpoint;
> -	unsigned int i;
>  	int ret;
>
> +	ret = fwnode_graph_parse_endpoint(fwnode, &endpoint);
> +	if (ret)
> +		return ret;
> +
>  	if (!entity->ops || !entity->ops->get_fwnode_pad) {
> +		unsigned int i;
> +
> +		/*
> +		 * for the default case, first try a 1:1 mapping between
> +		 * fwnode port number and pad index.
> +		 */
> +		ret = endpoint.port;
> +		if (ret < entity->num_pads &&
> +		    (entity->pads[ret].flags & direction_flags))
> +			return ret;
> +
> +		/*
> +		 * if that didn't work search the entity for the first
> +		 * pad that matches the @direction_flags.
> +		 */
>  		for (i = 0; i < entity->num_pads; i++) {
>  			if (entity->pads[i].flags & direction_flags)
>  				return i;
>  		}
>
> +		/* else fail */
>  		return -ENXIO;
>  	}
>
> -	ret = fwnode_graph_parse_endpoint(fwnode, &endpoint);
> -	if (ret)
> -		return ret;
> -
>  	ret = entity->ops->get_fwnode_pad(entity, &endpoint);
>  	if (ret < 0)
>  		return ret;
> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> index cde80ad029b7..ed00adb4313b 100644
> --- a/include/media/media-entity.h
> +++ b/include/media/media-entity.h
> @@ -199,6 +199,12 @@ struct media_pad {
>   * @get_fwnode_pad:	Return the pad number based on a fwnode endpoint or
>   *			a negative value on error. This operation can be used
>   *			to map a fwnode to a media pad number. Optional.
> + *			Entities do not need to implement this operation
> + *			unless two conditions are met:
> + *			- the entity has more than one sink and/or source
> + *			  pad, _and_
> + *			- the entity does not implement a 1:1 mapping of
> + *			  fwnode port numbers to pad indexes.
>   * @link_setup:		Notify the entity of link changes. The operation can
>   *			return an error, in which case link setup will be
>   *			cancelled. Optional.
> @@ -858,21 +864,24 @@ struct media_link *media_entity_find_link(struct media_pad *source,
>  struct media_pad *media_entity_remote_pad(const struct media_pad *pad);
>
>  /**
> - * media_entity_get_fwnode_pad - Get pad number from fwnode
> + * media_entity_get_fwnode_pad - Get pad number from an endpoint fwnode
>   *
>   * @entity: The entity
> - * @fwnode: Pointer to the fwnode_handle which should be used to find the pad
> + * @fwnode: Pointer to the endpoint fwnode_handle which should be used to
> + *          find the pad
>   * @direction_flags: Expected direction of the pad, as defined in
>   *		     :ref:`include/uapi/linux/media.h <media_header>`
>   *		     (seek for ``MEDIA_PAD_FL_*``)
>   *
>   * This function can be used to resolve the media pad number from
> - * a fwnode. This is useful for devices which use more complex
> - * mappings of media pads.
> + * an endpoint fwnode. This is useful for devices which use more
> + * complex mappings of media pads.
>   *
>   * If the entity does not implement the get_fwnode_pad() operation
> - * then this function searches the entity for the first pad that
> - * matches the @direction_flags.
> + * then this function first assumes the entity implements a 1:1 mapping
> + * between fwnode port number and media pad index. If the 1:1 mapping
> + * is not valid, then the function searches the entity for the first pad
> + * that matches the @direction_flags.
>   *
>   * Return: returns the pad number on success or a negative error code.
>   */
> --
> 2.17.1
>

--wdwotjv2merb2wut
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl3ft7sACgkQcjQGjxah
VjxAAw//RGCmAcdR4COlNeF1piXP5h020myfb9ZXvtejESBUazQIahtjXqRN5/d0
6HWgFwXQSyITE1nGVc9hCYHsJuaW+nbHXiuvKVgNAOMQcUTi7W+H7TrcsOmvOpTl
5/PB665AEstFytbYnFdujMOlnk5zbil4VFRx3Fd56Hi/vhLjaMG94CRpoa5uW4N0
iAkgN0Oag2zSlmDW7j3DsrN3n8elhRn2MgX+nc1/VB089Fwk0yuUCPoiSll8OsHF
M/uxfGUPppsnxBVnfjdTsPK6rJp8/HdAoTM4oGbhFfA7AGsXErc5AKkbW+aFuqcC
LlxpXuqixWquSOUit65BLBnk9rRy1Jc860sC5EZZnir6mq8le/DiVj309EL/RmLe
+AJ4kWzGrSaKc+vNamJJSugTt6FweIoCTf42km3qUCpuNeM2AjtP4fDWXD+9mxcW
oe/CjbRGXY1N99FrDi9n/UFP/V9V3sRlqQkLcQ2PKPkgcs1PiWJdrKkYgFK5ma1u
85tEidAnJ60WJTDRNlDWBCTkP1t5XnwOa5KbqglUgDecHcyhaINo3a1RBmi7Z9SX
7EUm3RHWB45l8JffX/wgrHwwRJrGA1tMzeibRlWTYDF9hqH4oxdlfrH1Le3VXlhn
oBf3uPDWwNPiJbdw/X7OgwBFp5xvvcavVMkxMVhxDrYAT9xtGQ0=
=8dQr
-----END PGP SIGNATURE-----

--wdwotjv2merb2wut--
