Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43A04EC802
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2019 18:37:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728872AbfKARhL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Nov 2019 13:37:11 -0400
Received: from mga01.intel.com ([192.55.52.88]:3493 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727397AbfKARhL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 1 Nov 2019 13:37:11 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 01 Nov 2019 10:37:10 -0700
X-IronPort-AV: E=Sophos;i="5.68,256,1569308400"; 
   d="scan'208";a="194737696"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 01 Nov 2019 10:37:09 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 5FCBD20BB5; Fri,  1 Nov 2019 19:37:07 +0200 (EET)
Date:   Fri, 1 Nov 2019 19:37:07 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] media: i2c: IMX296 camera sensor driver
Message-ID: <20191101173707.GP10211@paasikivi.fi.intel.com>
References: <20191031132309.10965-1-laurent.pinchart@ideasonboard.com>
 <20191101145246.GA13101@Mani-XPS-13-9360>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191101145246.GA13101@Mani-XPS-13-9360>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Manivannan,

On Fri, Nov 01, 2019 at 08:22:46PM +0530, Manivannan Sadhasivam wrote:
...
> > +static int imx296_probe(struct i2c_client *client,
> > +			const struct i2c_device_id *did)
> > +{
> > +	struct i2c_adapter *adapter = to_i2c_adapter(client->dev.parent);
> > +	unsigned long clk_rate;
> > +	struct imx296 *imx;
> 
> imx sounds like a generic name since it may imply to some NXP SoC family too,
> so I'd suggest using imx296.

Here, "imx" is being used in the scope of this driver only. I see no reason
to change it; it's obviously not related to i.MX SoCs.

But I think it could be called e.g. "sensor" as well for that's what it is.

-- 
Regards,

Sakari Ailus
