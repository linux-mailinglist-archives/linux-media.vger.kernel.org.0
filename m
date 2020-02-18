Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC5011625FB
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2020 13:18:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726347AbgBRMSp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Feb 2020 07:18:45 -0500
Received: from mga17.intel.com ([192.55.52.151]:61091 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726086AbgBRMSp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Feb 2020 07:18:45 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Feb 2020 04:18:44 -0800
X-IronPort-AV: E=Sophos;i="5.70,456,1574150400"; 
   d="scan'208";a="228717519"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Feb 2020 04:18:42 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 0DF6220E95; Tue, 18 Feb 2020 14:18:40 +0200 (EET)
Date:   Tue, 18 Feb 2020 14:18:40 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     mchehab@kernel.org, hans.verkuil@cisco.com,
        jacopo+renesas@jmondi.org, robh+dt@kernel.org,
        laurent.pinchart@ideasonboard.com, devicetree@vger.kernel.org,
        kernel@pengutronix.de, linux-media@vger.kernel.org
Subject: Re: [PATCH v11 04/15] media: v4l2-fwnode: add initial connector
 parsing support
Message-ID: <20200218121839.GA5379@paasikivi.fi.intel.com>
References: <20190930093900.16524-1-m.felsch@pengutronix.de>
 <20190930093900.16524-5-m.felsch@pengutronix.de>
 <20191115233439.GB2696@mara.localdomain>
 <20200115170621.jszy2p3e4w3b3hpn@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200115170621.jszy2p3e4w3b3hpn@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marco,

On Wed, Jan 15, 2020 at 06:06:21PM +0100, Marco Felsch wrote:
> Hi Sakari,
> 
> On 19-11-16 01:34, Sakari Ailus wrote:
> > Hi Marco,
> > 
> > On Mon, Sep 30, 2019 at 11:38:49AM +0200, Marco Felsch wrote:
> 
> ...
> 
> Let me sum up our irc discussion about that kAPI.
> 
> Our starting point is a fwnode based subdev which has connectors in
> front of there pins. Connectors are used to limit the subdev to some
> device limits e.g. if the device support only PAL-Input streams and the
> subdev has an buggy autodetect mechanism. In that case the connector can
> be used by the subdev to set the possible TV-Norms to PAL. Currently the
> tvp5150 is the only fwnode based subdev implementing connectors.
> 
> Connectors have common and connector specific properties. All current
> provided connectors can be found here:
> Documentation/devicetree/bindings/display/connector/ .
> 
> Parsing the properties is common to all _upcoming_ fwnode based subdevs
> so this should be done within the core. So lets move on to the parsing
> helper.
> 
> > > +int v4l2_fwnode_connector_alloc_parse(struct fwnode_handle *fwnode,
> > > +				      struct v4l2_fwnode_connector *connector)
> > > +{
> 
> This kAPI seems to fit all current use cases. The API is not responsible
> to alloc the 'struct v4l2_fwnode_connector' instead it is only used to
> fill this struct. The given 'struct fwnode_handle' should be the subdev
> local ep-fwnode because the user already has a reference to this ep.
> 
> This helper has two use-cases:
>   1) Parsing the connector properties and add the initial (1st) link.
>   2) Add further n-links upon n-calls to an already parsed connector.
> 
> Going this way we need to ensure that the caller init the 'struct
> v4l2_fwnode_connector' to '0' before call this helper. This can be
> documented within the kAPI doc.

The problem with the above is that although the API does not prevent
sharing connectors as such, it does not support it either: parsing a
connector on another sub-device ends up looking like a new connector,
independently of whether one (or more) entities representing the same
connector already exist.

Either way, I discussed this with Hans, and we concluded it's fine for now.
We've dealt with similar changes before, so when someone needs sharing
connectors, he'll need to implement it, also changing the kAPI drivers use.

Could you address the other comments I've given on the set?

-- 
Kind regards,

Sakari Ailus
