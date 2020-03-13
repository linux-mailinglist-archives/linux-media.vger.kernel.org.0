Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60B18184A95
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 16:23:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726968AbgCMPXt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Mar 2020 11:23:49 -0400
Received: from mga09.intel.com ([134.134.136.24]:13040 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726861AbgCMPXs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Mar 2020 11:23:48 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Mar 2020 08:23:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,549,1574150400"; 
   d="scan'208";a="261919545"
Received: from mmatus1x-mobl.ger.corp.intel.com (HELO mara.localdomain) ([10.249.153.214])
  by orsmga002.jf.intel.com with ESMTP; 13 Mar 2020 08:23:44 -0700
Received: from sailus by mara.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1jCm9v-0000ZK-TW; Fri, 13 Mar 2020 17:23:38 +0200
Date:   Fri, 13 Mar 2020 17:23:34 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Helen Koike <helen.koike@collabora.com>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v2 2/2] media: staging: rkisp1: replace the call to
 v4l2_async_notifier_parse_fwnode_endpoints_by_port
Message-ID: <20200313152334.GA2173@mara.localdomain>
References: <20200312154604.24996-1-dafna.hirschfeld@collabora.com>
 <20200312154604.24996-3-dafna.hirschfeld@collabora.com>
 <20200313091804.GP5379@paasikivi.fi.intel.com>
 <ea74e214-6fba-dede-5355-2b1c48e1a3a0@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea74e214-6fba-dede-5355-2b1c48e1a3a0@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Helen,

On Fri, Mar 13, 2020 at 11:06:54AM -0300, Helen Koike wrote:
> Hi Sakari,
> 
> On 3/13/20 6:18 AM, Sakari Ailus wrote:
> > Hi Dafna,
> > 
> > Thanks for the patch.
> > 
> > On Thu, Mar 12, 2020 at 04:46:04PM +0100, Dafna Hirschfeld wrote:
> >> don't call 'v4l2_async_notifier_parse_fwnode_endpoints_by_port'
> >> in order to register async subdevices. Instead call
> >> 'v4l2_fwnode_endpoint_parse' to parse the remote endpoints
> >> and then register each async subdev with
> >> 'v4l2_async_notifier_add_fwnode_remote_subdev'
> >>
> >> Also remove the relevant item in the TODO file
> >>
> >> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> >> ---
> >>  drivers/staging/media/rkisp1/TODO         |  3 -
> >>  drivers/staging/media/rkisp1/rkisp1-dev.c | 94 +++++++++++++----------
> >>  2 files changed, 55 insertions(+), 42 deletions(-)
> >>
> >> diff --git a/drivers/staging/media/rkisp1/TODO b/drivers/staging/media/rkisp1/TODO
> >> index 0aa9877dd64a..1aa3bb9fd6cb 100644
> >> --- a/drivers/staging/media/rkisp1/TODO
> >> +++ b/drivers/staging/media/rkisp1/TODO
> >> @@ -1,6 +1,3 @@
> >> -* Don't use v4l2_async_notifier_parse_fwnode_endpoints_by_port().
> >> -e.g. isp_parse_of_endpoints in drivers/media/platform/omap3isp/isp.c
> >> -cio2_parse_firmware in drivers/media/pci/intel/ipu3/ipu3-cio2.c.
> >>  * Fix pad format size for statistics and parameters entities.
> >>  * Use threaded interrupt for rkisp1_stats_isr(), remove work queue.
> >>  * Fix checkpatch errors.
> >> diff --git a/drivers/staging/media/rkisp1/rkisp1-dev.c b/drivers/staging/media/rkisp1/rkisp1-dev.c
> >> index d2186856bb24..1035a39f3e49 100644
> >> --- a/drivers/staging/media/rkisp1/rkisp1-dev.c
> >> +++ b/drivers/staging/media/rkisp1/rkisp1-dev.c
> >> @@ -233,35 +233,6 @@ static int rkisp1_subdev_notifier_complete(struct v4l2_async_notifier *notifier)
> >>  	return 0;
> >>  }
> >>  
> >> -static int rkisp1_fwnode_parse(struct device *dev,
> >> -			       struct v4l2_fwnode_endpoint *vep,
> >> -			       struct v4l2_async_subdev *asd)
> >> -{
> >> -	struct rkisp1_sensor_async *s_asd =
> >> -			container_of(asd, struct rkisp1_sensor_async, asd);
> >> -
> >> -	if (vep->bus_type != V4L2_MBUS_CSI2_DPHY) {
> >> -		dev_err(dev, "Only CSI2 bus type is currently supported\n");
> >> -		return -EINVAL;
> >> -	}
> >> -
> >> -	if (vep->base.port != 0) {
> >> -		dev_err(dev, "The ISP has only port 0\n");
> >> -		return -EINVAL;
> >> -	}
> >> -
> >> -	s_asd->mbus_type = vep->bus_type;
> >> -	s_asd->lanes = vep->bus.mipi_csi2.num_data_lanes;
> >> -
> >> -	/* Parallel bus is currently not supported */
> >> -	s_asd->parallel_bus_flags = 0;
> >> -
> >> -	if (s_asd->lanes < 1 || s_asd->lanes > 4)
> >> -		return -EINVAL;
> >> -
> >> -	return 0;
> >> -}
> >> -
> >>  static const struct v4l2_async_notifier_operations rkisp1_subdev_notifier_ops = {
> >>  	.bound = rkisp1_subdev_notifier_bound,
> >>  	.unbind = rkisp1_subdev_notifier_unbind,
> >> @@ -271,23 +242,68 @@ static const struct v4l2_async_notifier_operations rkisp1_subdev_notifier_ops =
> >>  static int rkisp1_subdev_notifier(struct rkisp1_device *rkisp1)
> >>  {
> >>  	struct v4l2_async_notifier *ntf = &rkisp1->notifier;
> >> -	struct device *dev = rkisp1->dev;
> >> +	int next_id = 0;
> >>  	int ret;
> >>  
> >>  	v4l2_async_notifier_init(ntf);
> >>  
> >> -	ret = v4l2_async_notifier_parse_fwnode_endpoints_by_port(dev, ntf,
> >> -					sizeof(struct rkisp1_sensor_async),
> >> -					0, rkisp1_fwnode_parse);
> >> -	if (ret)
> >> -		return ret;
> >> +	while (1) {
> > 
> > I might loop over each port here instead.
> 
> ISP has a single port (please, see my comment below).
> 
> > 
> >> +		struct v4l2_fwnode_endpoint vep = {
> >> +			.bus_type = V4L2_MBUS_CSI2_DPHY
> >> +		};
> >> +		struct rkisp1_sensor_async *rk_asd = NULL;
> >> +		struct fwnode_handle *ep;
> >>  
> >> -	if (list_empty(&ntf->asd_list))
> >> -		return -ENODEV;
> >> +		ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(rkisp1->dev),
> >> +			0, next_id, FWNODE_GRAPH_ENDPOINT_NEXT);
> > 
> > The port number is always zero, whereas the endpoint id changes on each
> > iteration. Is that intended?
> 
> Yes, so ISP has a single connection port (a single MIPI-DPHY bus), but hardware can plug more then one
> sensor in this port (but only one can be active at a time).
> 
> At least this is how I understand how the modeling should be.
> And this is how we modeled the device tree bindings:
> https://git.linuxtv.org/media_tree.git/tree/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml#n139
> 
> Make sense?

Ack; then this seems fine. I thought there were several receivers.

-- 
Regards,

Sakari Ailus
