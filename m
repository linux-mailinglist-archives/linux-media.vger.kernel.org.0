Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 820826EC825
	for <lists+linux-media@lfdr.de>; Mon, 24 Apr 2023 10:54:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231137AbjDXIyH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Apr 2023 04:54:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230287AbjDXIyF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Apr 2023 04:54:05 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC71F185
        for <linux-media@vger.kernel.org>; Mon, 24 Apr 2023 01:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682326443; x=1713862443;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HOtlMKxpZZ/YVBiY7W1zS9RCAdBCw2q3xHzHYuf9/GI=;
  b=VxN85KMQGkegKrN6ay4kMQVp9Feg7+zXVq6nSeOjAPRyQn1RE0JZJ79B
   8Am8ashWkgl+MNePNMbIKbLVmz6YCrvlf3q9Wkzgq6U7Zt1g+ZdB8Xd1P
   bvts/taXqajZbcy1RoRoa1TY8kr30j7g5cxJJ5DYDa+z4Vl64f1StD48u
   3648OEgY9EHYMxyaX110Mm52dXGePnOEut3sTqRIyNtl+XJBR3M34bol6
   bJ13R4HyIBDdRFXde5f+QIjlsZxW11mN4WwW20JlSyJGVPylkENQnpkZ0
   ENB5G9nZBq4ASYW+zpwFIBvcd5fn4gAvhbJUI6xjcDqj9XIsL7Mwd0QeZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="345156578"
X-IronPort-AV: E=Sophos;i="5.99,222,1677571200"; 
   d="scan'208";a="345156578"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2023 01:54:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="817178568"
X-IronPort-AV: E=Sophos;i="5.99,222,1677571200"; 
   d="scan'208";a="817178568"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2023 01:54:00 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id DC13F121435;
        Mon, 24 Apr 2023 11:53:57 +0300 (EEST)
Date:   Mon, 24 Apr 2023 11:53:57 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     "Wu, Wentong" <wentong.wu@intel.com>
Cc:     "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "djrscally@gmail.com" <djrscally@gmail.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "bingbu.cao@linux.intel.com" <bingbu.cao@linux.intel.com>,
        "Wang, Zhifeng" <zhifeng.wang@intel.com>,
        "Ye, Xiang" <xiang.ye@intel.com>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>
Subject: Re: [PATCH v5 1/3] media: pci: intel: ivsc: Add CSI submodule
Message-ID: <ZEZDpTRznBAUToau@kekkonen.localdomain>
References: <1681096465-17287-1-git-send-email-wentong.wu@intel.com>
 <1681096465-17287-2-git-send-email-wentong.wu@intel.com>
 <ZEVj2Je9sNKDcBXn@kekkonen.localdomain>
 <DM6PR11MB4316D6790B4795647537A2E08D679@DM6PR11MB4316.namprd11.prod.outlook.com>
 <ZEYoKq4yaj0B//0u@kekkonen.localdomain>
 <DM6PR11MB431640E716F14528ACA35F5C8D679@DM6PR11MB4316.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR11MB431640E716F14528ACA35F5C8D679@DM6PR11MB4316.namprd11.prod.outlook.com>
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Wentong,

On Mon, Apr 24, 2023 at 07:09:34AM +0000, Wu, Wentong wrote:
> > > > > +	if (!csi->remote)
> > > > > +		return -ENODEV;
> > > > > +
> > > > > +	ctrl = v4l2_ctrl_find(csi->remote->ctrl_handler, V4L2_CID_LINK_FREQ);
> > > > > +	if (!ctrl)
> > > > > +		return -EINVAL;
> > > > > +	qm.index = v4l2_ctrl_g_ctrl(ctrl);
> > > > > +
> > > > > +	ret = v4l2_querymenu(csi->remote->ctrl_handler, &qm);
> > > > > +	if (ret)
> > > > > +		return ret;
> > > >
> > > > Please use v4l2_get_link_freq() as already discussed.
> > >
> > > ack, thanks,
> > >
> > > >
> > > > Didn't we also discuss that you could do this in the s_stream() callback?
> > >
> > > We don't need configure CSI2 link if call s_stream with enable = 0,
> > >
> > > But I'm ok to get this in s_stream, thanks
> > 
> > Yes, you should only query this if streaming is being enabled.
> 
> Can we just query the link freq in mei_csi_notify_bound and record it?

Yes. It can't change during streaming in any case.

> > > > > +static int mei_csi_parse_firmware(struct mei_csi *csi) {
> > > > > +	struct v4l2_fwnode_endpoint v4l2_ep = {
> > > > > +		.bus_type = V4L2_MBUS_CSI2_DPHY,
> > > > > +	};
> > > > > +	struct device *dev = &csi->cldev->dev;
> > > > > +	struct v4l2_async_subdev *asd;
> > > > > +	struct fwnode_handle *fwnode;
> > > > > +	struct fwnode_handle *ep;
> > > > > +	int ret;
> > > > > +
> > > > > +	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0, 0);
> > > > > +	if (!ep) {
> > > > > +		dev_err(dev, "not connected to subdevice\n");
> > > > > +		return -EINVAL;
> > > > > +	}
> > > > > +
> > > > > +	ret = v4l2_fwnode_endpoint_parse(ep, &v4l2_ep);
> > > > > +	if (ret) {
> > > > > +		dev_err(dev, "could not parse v4l2 endpoint\n");
> > > > > +		fwnode_handle_put(ep);
> > > > > +		return -EINVAL;
> > > > > +	}
> > > > > +
> > > > > +	fwnode = fwnode_graph_get_remote_endpoint(ep);
> > > > > +	fwnode_handle_put(ep);
> > > > > +
> > > > > +	v4l2_async_nf_init(&csi->notifier);
> > > > > +	csi->notifier.ops = &mei_csi_notify_ops;
> > > > > +
> > > > > +	asd = v4l2_async_nf_add_fwnode(&csi->notifier, fwnode,
> > > > > +				       struct v4l2_async_subdev);
> > > > > +	if (IS_ERR(asd)) {
> > > > > +		fwnode_handle_put(fwnode);
> > > > > +		return PTR_ERR(asd);
> > > > > +	}
> > > > > +
> > > > > +	ret = v4l2_fwnode_endpoint_alloc_parse(fwnode, &v4l2_ep);
> > > >
> > > > It seems you're parsing the remote endpoint properties here. This
> > > > shouldn't be needed for any reason.
> > >
> > > We need sensor's lane number to configure IVSC's CSI2
> > >
> > > >
> > > > > +	fwnode_handle_put(fwnode);
> > > > > +	if (ret)
> > > > > +		return ret;
> > > > > +	csi->nr_of_lanes = v4l2_ep.bus.mipi_csi2.num_data_lanes;
> > > >
> > > > Instead the number of lanes comes from the local endpoint.
> > >
> > > The lane number of IVSC follows sensor's lane number, why local endpoint?
> > 
> > Because you shouldn't access other devices' endpoint properties in drivers.
> > They are outside of the scope of the device's bindings.
> 
> Ok, in v3 patch set, it was trying to get the lane number as below:
> 
> 	+	ret = v4l2_subdev_call(csi->remote, pad, get_mbus_config,
> 	+			       csi->remote_pad, &mbus_config);
> 	+	if (ret)
> 	+		return ret;
> 	+
> 	+	if (mbus_config.type != V4L2_MBUS_CSI2_DPHY)
> 	+		return -EINVAL;
> 	+
> 	+	csi->nr_of_lanes = mbus_config.bus.mipi_csi2.num_data_lanes;
> 
> Can we use above subdev_call in mei_csi_notify_bound to get lane number?

My point is that you're not supposed to find this from an external device
or its firmware node. This information should instead be present in the
device's own firmware nodes. It's the IPU bridge's job to put it there.

Please see Documentation/firmware-guide/acpi/dsd/graph.rst and
Documentation/devicetree/bindings/media/video-interfaces.yaml .

-- 
Kind regards,

Sakari Ailus
