Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA5BF13465B
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2020 16:36:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728955AbgAHPgi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jan 2020 10:36:38 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:50363 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728952AbgAHPgi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jan 2020 10:36:38 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1ipDNj-0007qN-VJ; Wed, 08 Jan 2020 16:36:27 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1ipDNi-0002vF-3B; Wed, 08 Jan 2020 16:36:26 +0100
Date:   Wed, 8 Jan 2020 16:36:26 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     mchehab@kernel.org, hans.verkuil@cisco.com,
        jacopo+renesas@jmondi.org, robh+dt@kernel.org,
        laurent.pinchart@ideasonboard.com, devicetree@vger.kernel.org,
        kernel@pengutronix.de, linux-media@vger.kernel.org
Subject: Re: [PATCH v11 04/15] media: v4l2-fwnode: add initial connector
 parsing support
Message-ID: <20200108153626.we3zasacpriksczs@pengutronix.de>
References: <20190930093900.16524-1-m.felsch@pengutronix.de>
 <20190930093900.16524-5-m.felsch@pengutronix.de>
 <20191115233439.GB2696@mara.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191115233439.GB2696@mara.localdomain>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 14:42:59 up 54 days,  5:01, 46 users,  load average: 0.01, 0.03,
 0.00
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On 19-11-16 01:34, Sakari Ailus wrote:
> Hi Marco,
> 
> On Mon, Sep 30, 2019 at 11:38:49AM +0200, Marco Felsch wrote:

...

> > +int v4l2_fwnode_connector_alloc_parse(struct fwnode_handle *fwnode,
> > +				      struct v4l2_fwnode_connector *connector)
> > +{
> > +	struct fwnode_handle *remote_pp, *remote_ep;
> > +	const char *type_name;
> > +	unsigned int i = 0, ep_num = 0;
> > +	int err;
> > +
> > +	memset(connector, 0, sizeof(*connector));
> > +
> > +	remote_pp = fwnode_graph_get_remote_port_parent(fwnode);
> > +	if (!remote_pp)
> > +		return -ENOLINK;

I will align the API with the v4l2_fwnode_endpoint_alloc_parse()
function so the caller need to pass the connector fwnode handle.

> > +
> > +	/* Parse all common properties first. */
> > +	fwnode_graph_for_each_endpoint(remote_pp, remote_ep)
> > +		ep_num++;
> 
> If there are no endpoints, ep_num will be zero and kmalloc_array() will
> return NULL? There should be a way there are no endpoints, rather than
> returning -ENOMEM.
> 
> > +
> > +	connector->nr_of_links = ep_num;
> > +	connector->links = kmalloc_array(ep_num, sizeof(*connector->links),
> > +					 GFP_KERNEL);
> > +	if (!connector->links) {
> > +		err = -ENOMEM;
> > +		goto err_put_fwnode;
> > +	}
> > +
> > +	fwnode_graph_for_each_endpoint(remote_pp, remote_ep) {
> > +		err = v4l2_fwnode_parse_link(remote_ep, &connector->links[i]);
> 
> If you start parsing a connector starting from another device connected to
> it, nothing seems to prevent parsing the same links twice, in case the
> connector is connected to more than one sub-device.
> 
> Or do I miss something crucial here?

Yes thats right but it seems that sharing connectors isn't supported at
all. All bridge drivers using connectors implementing the connector
handling by their self. Anyway, I will add a function parameter to check
that we parse only the endpoints connected to the calling sub-dev.

Regards,
  Marco

> > +		if (err) {
> > +			fwnode_handle_put(remote_ep);
> > +			goto err_free_links;
> > +		}
> > +		i++;
> > +	}
> > +
> > +	/*
> > +	 * Links reference counting guarantees access -> no duplication needed
> > +	 */
> > +	fwnode_property_read_string(remote_pp, "label", &connector->label);
> > +
> > +	/* The connector-type is stored within the compatible string. */
> > +	err = fwnode_property_read_string(remote_pp, "compatible", &type_name);
> > +	if (err) {
> > +		err = -EINVAL;
> > +		goto err_free_links;
> > +	}
> > +	connector->type = v4l2_fwnode_string_to_connector_type(type_name);
> > +
> > +	/* Now parse the connector specific properties. */
> > +	switch (connector->type) {
> > +	case V4L2_CONN_COMPOSITE:
> > +	case V4L2_CONN_SVIDEO:
> > +		err = v4l2_fwnode_connector_parse_analog(remote_pp, connector);
> > +		break;
> > +	case V4L2_CONN_UNKNOWN:
> > +	default:
> > +		pr_err("Unknown connector type\n");
> > +		err = -EINVAL;
> > +		goto err_free_links;
> > +	}
> > +
> > +	fwnode_handle_put(remote_pp);
> > +
> > +	return err;
> > +
> > +err_free_links:
> > +	for (i = 0; i < ep_num; i++)
> > +		v4l2_fwnode_put_link(&connector->links[i]);
> > +	kfree(connector->links);
> > +err_put_fwnode:
> > +	fwnode_handle_put(remote_pp);
> > +
> > +	return err;
> > +}
> > +EXPORT_SYMBOL_GPL(v4l2_fwnode_connector_alloc_parse);
> > +
