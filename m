Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B19014638D
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2019 18:00:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725809AbfFNQAg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Jun 2019 12:00:36 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:53587 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725775AbfFNQAg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Jun 2019 12:00:36 -0400
Received: from uno.localdomain (unknown [37.177.106.100])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 87B9D200012;
        Fri, 14 Jun 2019 16:00:28 +0000 (UTC)
Date:   Fri, 14 Jun 2019 18:01:41 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se
Subject: Re: [PATCH v2 3/9] v4l2-async: Get fwnode reference when putting it
 to the notifier's list
Message-ID: <20190614160141.mlw5imwejevunhou@uno.localdomain>
References: <20190606130225.10751-1-sakari.ailus@linux.intel.com>
 <20190606130225.10751-4-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7ynooue2wjmfh4d2"
Content-Disposition: inline
In-Reply-To: <20190606130225.10751-4-sakari.ailus@linux.intel.com>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--7ynooue2wjmfh4d2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Sakari,

On Thu, Jun 06, 2019 at 04:02:19PM +0300, Sakari Ailus wrote:
> The v4l2_async_notifier_add_fwnode_subdev() did not take a reference of
> the added fwnode, relying on the caller to handle that instead, in essence
> putting the fwnode to be added if there was an error.
>
> As the reference is eventually released during the notifier cleanup, this
> is not intuitive nor logical. Improve this by always getting a reference
> when the function succeeds, and the caller releasing the reference when it
> does not *itself* need it anymore.
>
> Luckily, perhaps, there were just a handful of callers using the function.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/platform/am437x/am437x-vpfe.c   |  5 ++---
>  drivers/media/platform/davinci/vpif_capture.c | 16 ++++++++--------
>  drivers/media/platform/qcom/camss/camss.c     |  2 +-
>  drivers/media/platform/xilinx/xilinx-vipp.c   |  2 +-
>  drivers/media/v4l2-core/v4l2-async.c          |  3 ++-
>  drivers/media/v4l2-core/v4l2-fwnode.c         | 23 ++++++-----------------
>  include/media/v4l2-async.h                    |  5 +++--
>  7 files changed, 23 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
> index db263c0ce48e..ccdbd9227955 100644
> --- a/drivers/media/platform/am437x/am437x-vpfe.c
> +++ b/drivers/media/platform/am437x/am437x-vpfe.c
> @@ -2505,10 +2505,9 @@ vpfe_get_pdata(struct vpfe_device *vpfe)
>  		pdata->asd[i] = v4l2_async_notifier_add_fwnode_subdev(
>  			&vpfe->notifier, of_fwnode_handle(rem),
>  			sizeof(struct v4l2_async_subdev));
> -		if (IS_ERR(pdata->asd[i])) {
> -			of_node_put(rem);
> +		of_node_put(rem);
> +		if (IS_ERR(pdata->asd[i]))
>  			goto cleanup;
> -		}
>  	}
>
>  	of_node_put(endpoint);
> diff --git a/drivers/media/platform/davinci/vpif_capture.c b/drivers/media/platform/davinci/vpif_capture.c
> index 8fdea45ae090..2a0c3f3fb443 100644
> --- a/drivers/media/platform/davinci/vpif_capture.c
> +++ b/drivers/media/platform/davinci/vpif_capture.c
> @@ -1512,6 +1512,7 @@ static struct vpif_capture_config *
>  vpif_capture_get_pdata(struct platform_device *pdev)
>  {
>  	struct device_node *endpoint = NULL;
> +	struct device_node *rem = NULL, *rem_ep = NULL;
>  	struct vpif_capture_config *pdata;
>  	struct vpif_subdev_info *sdinfo;
>  	struct vpif_capture_chan_config *chan;
> @@ -1542,7 +1543,6 @@ vpif_capture_get_pdata(struct platform_device *pdev)
>
>  	for (i = 0; i < VPIF_CAPTURE_NUM_CHANNELS; i++) {
>  		struct v4l2_fwnode_endpoint bus_cfg = { .bus_type = 0 };
> -		struct device_node *rem, *rem_ep;
>  		unsigned int flags;
>  		int err;
>
> @@ -1565,7 +1565,6 @@ vpif_capture_get_pdata(struct platform_device *pdev)
>  			of_node_put(rem_ep);
>  			goto done;
>  		}
> -		of_node_put(rem_ep);
>
>  		sdinfo = &pdata->subdev_info[i];
>  		chan = &pdata->chan_config[i];
> @@ -1573,10 +1572,8 @@ vpif_capture_get_pdata(struct platform_device *pdev)
>  					    VPIF_CAPTURE_NUM_CHANNELS,
>  					    sizeof(*chan->inputs),
>  					    GFP_KERNEL);
> -		if (!chan->inputs) {
> -			of_node_put(rem);
> +		if (!chan->inputs)
>  			goto err_cleanup;
> -		}
>
>  		chan->input_count++;
>  		chan->inputs[i].input.type = V4L2_INPUT_TYPE_CAMERA;
> @@ -1588,6 +1585,7 @@ vpif_capture_get_pdata(struct platform_device *pdev)
>  		if (err) {
>  			dev_err(&pdev->dev, "Could not parse the endpoint\n");
>  			of_node_put(rem);
> +			of_node_put(rem_ep);
>  			goto done;
>  		}
>
> @@ -1608,11 +1606,11 @@ vpif_capture_get_pdata(struct platform_device *pdev)
>  		pdata->asd[i] = v4l2_async_notifier_add_fwnode_subdev(
>  			&vpif_obj.notifier, of_fwnode_handle(rem_ep),
>  			sizeof(struct v4l2_async_subdev));
> -		if (IS_ERR(pdata->asd[i])) {
> -			of_node_put(rem);
> +		if (IS_ERR(pdata->asd[i]))
>  			goto err_cleanup;
> -		}
>
> +		of_node_put(rem);
> +		of_node_put(rem_ep);
>  	}
>
>  done:
> @@ -1624,6 +1622,8 @@ vpif_capture_get_pdata(struct platform_device *pdev)
>  	return pdata;
>
>  err_cleanup:
> +	of_node_put(rem);
> +	of_node_put(rem_ep);
>  	of_node_put(endpoint);
>  	v4l2_async_notifier_cleanup(&vpif_obj.notifier);
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index a979f210f441..4ab4a47d34f3 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -486,9 +486,9 @@ static int camss_of_parse_ports(struct camss *camss)
>
>  		asd = v4l2_async_notifier_add_fwnode_subdev(
>  			&camss->notifier, remote, sizeof(*csd));
> +		fwnode_handle_put(remote);
>  		if (IS_ERR(asd)) {
>  			ret = PTR_ERR(asd);
> -			fwnode_handle_put(remote);
>  			goto err_cleanup;
>  		}
>
> diff --git a/drivers/media/platform/xilinx/xilinx-vipp.c b/drivers/media/platform/xilinx/xilinx-vipp.c
> index 41df417153bd..d788f4870a23 100644
> --- a/drivers/media/platform/xilinx/xilinx-vipp.c
> +++ b/drivers/media/platform/xilinx/xilinx-vipp.c
> @@ -392,9 +392,9 @@ static int xvip_graph_parse_one(struct xvip_composite_device *xdev,
>  		asd = v4l2_async_notifier_add_fwnode_subdev(
>  			&xdev->notifier, remote,
>  			sizeof(struct xvip_graph_entity));
> +		fwnode_handle_put(remote);
>  		if (IS_ERR(asd)) {
>  			ret = PTR_ERR(asd);
> -			fwnode_handle_put(remote);
>  			goto err_notifier_cleanup;
>  		}
>  	}
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index 304969ff3191..dc4e83b4f6ba 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -596,10 +596,11 @@ v4l2_async_notifier_add_fwnode_subdev(struct v4l2_async_notifier *notifier,
>  		return ERR_PTR(-ENOMEM);
>
>  	asd->match_type = V4L2_ASYNC_MATCH_FWNODE;
> -	asd->match.fwnode = fwnode;
> +	asd->match.fwnode = fwnode_handle_get(fwnode);
>
>  	ret = v4l2_async_notifier_add_subdev(notifier, asd);
>  	if (ret) {
> +		fwnode_handle_put(fwnode);
>  		kfree(asd);
>  		return ERR_PTR(ret);
>  	}
> diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> index 810b6584b522..b48725824580 100644
> --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> @@ -780,23 +780,17 @@ static int v4l2_fwnode_reference_parse(struct device *dev,
>  		asd = v4l2_async_notifier_add_fwnode_subdev(notifier,
>  							    args.fwnode,
>  							    sizeof(*asd));
> +		fwnode_handle_put(args.fwnode);
>  		if (IS_ERR(asd)) {
> -			ret = PTR_ERR(asd);
>  			/* not an error if asd already exists */
> -			if (ret == -EEXIST) {
> -				fwnode_handle_put(args.fwnode);
> +			if (PTR_ERR(asd) == -EEXIST)
>  				continue;
> -			}
>
> -			goto error;
> +			return PTR_ERR(asd);
>  		}
>  	}
>
>  	return 0;
> -
> -error:
> -	fwnode_handle_put(args.fwnode);
> -	return ret;
>  }
>
>  /*
> @@ -1085,22 +1079,17 @@ v4l2_fwnode_reference_parse_int_props(struct device *dev,
>
>  		asd = v4l2_async_notifier_add_fwnode_subdev(notifier, fwnode,
>  							    sizeof(*asd));
> +		fwnode_handle_put(fwnode);
>  		if (IS_ERR(asd)) {
>  			/* not an error if asd already exists */
> -			if (PTR_ERR(asd) == -EEXIST) {
> -				fwnode_handle_put(fwnode);
> +			if (PTR_ERR(asd) == -EEXIST)
>  				continue;
> -			}
>
> -			goto error;
> +			return PTR_ERR(asd);
>  		}
>  	}
>
>  	return PTR_ERR(fwnode) == -ENOENT ? 0 : PTR_ERR(fwnode);
> -
> -error:
> -	fwnode_handle_put(fwnode);
> -	return PTR_ERR(fwnode);
>  }
>
>  int v4l2_async_notifier_parse_fwnode_sensor_common(struct device *dev,
> diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
> index 1497bda66c3b..b9141ffa188a 100644
> --- a/include/media/v4l2-async.h
> +++ b/include/media/v4l2-async.h
> @@ -175,8 +175,9 @@ int v4l2_async_notifier_add_subdev(struct v4l2_async_notifier *notifier,
>   *		     the driver's async sub-device struct, i.e. both
>   *		     begin at the same memory address.
>   *
> - * Allocate a fwnode-matched asd of size asd_struct_size, and add it
> - * to the notifiers @asd_list.
> + * Allocate a fwnode-matched asd of size asd_struct_size, and add it to the
> + * notifiers @asd_list. The function also gets a reference of the fwnode which
> + * is released later at notifier cleanup time.

I would add that, as a consequence, the caller need to put their local
references as soon as they don't need them anymore (possibly just
after calling this function).

That apart
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
   j

>   */
>  struct v4l2_async_subdev *
>  v4l2_async_notifier_add_fwnode_subdev(struct v4l2_async_notifier *notifier,
> --
> 2.11.0
>

--7ynooue2wjmfh4d2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl0DxOUACgkQcjQGjxah
VjypCA//Yl5bpYOE+NfHnb733spfRXVatpKbR+2/x4fxMshvc/7/MyaTruPQqsSq
5Rww6RBKf88BIFTGuWKNpBcpJLy35hRYBjfKvsZ2ifvRb2ABKlp7aBK2o9Ao/ONs
sQlrFYHovMnXrCuKkMKMHB2gN3O5+D2wtDmUtStPVzAn4goHPDROPqZjPrrq5mc3
O9ZHNNwMCKclSMEsSemjecKaBsEF4OdTW1+70nh+oCORin3bhZLc/rUwT7zJKkZY
gZx3hrvESKAH7QWEEebZ3Ae5Fvx363EHFYwVsLqkLmnnPdflZD55imvn7Oe7pDj8
45wd0TGXSjj6GSNZ5Sx0hstNrfVVTNSpMvBxjoDyO39L3Bb2X8lZvcYzLPwEz6Xj
s8bL/4+b7VpTHPDeHFNgfGnGYhzuc4kgGt570C6cHdIpNRPhR9yYVHxa0iTcHuNP
bAtlAjFtZNgLqxKiXXPj0Z5x6tA7kLP9m0RGrWmBliCkChkdzdnqNHGVdwTGAMKg
yzu56Gsc2A3iAXWLv9FZZa/B3ySJWPhULTtYIugNBxZYClWEr1Svl6sTmZdZ+ETO
0Bn+u84vSD+HIPR1RjALhIYqbvXebsQU11PLFyvDzCP/Pbz1PqZRcBZHPQ+QHsJJ
Z1P25KC9PrkdFSxqVyd4Zbr4/24JHJ2F+EZ59bNnDvFwz6f7fiU=
=1Wg8
-----END PGP SIGNATURE-----

--7ynooue2wjmfh4d2--
