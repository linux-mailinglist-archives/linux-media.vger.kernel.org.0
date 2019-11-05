Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C21BF0412
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2019 18:28:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731028AbfKER17 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Nov 2019 12:27:59 -0500
Received: from mga05.intel.com ([192.55.52.43]:39804 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730943AbfKER17 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 Nov 2019 12:27:59 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Nov 2019 09:27:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,271,1569308400"; 
   d="scan'208";a="195890394"
Received: from jklimiuk-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.252.42.206])
  by orsmga008.jf.intel.com with ESMTP; 05 Nov 2019 09:27:45 -0800
Received: by kekkonen.fi.intel.com (Postfix, from userid 1000)
        id 601962200C; Tue,  5 Nov 2019 19:24:15 +0200 (EET)
Date:   Tue, 5 Nov 2019 19:24:15 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] media: i2c: IMX296 camera sensor driver
Message-ID: <20191105172414.GA14607@kekkonen.localdomain>
References: <20191031132309.10965-1-laurent.pinchart@ideasonboard.com>
 <20191101145246.GA13101@Mani-XPS-13-9360>
 <20191104134206.GC4913@pendragon.ideasonboard.com>
 <20191105150355.GA674@Mani-XPS-13-9360>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191105150355.GA674@Mani-XPS-13-9360>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 05, 2019 at 08:33:55PM +0530, Manivannan Sadhasivam wrote:
...
> > > > +static int imx296_remove(struct i2c_client *client)
> > > > +{
> > > > +	struct v4l2_subdev *subdev = i2c_get_clientdata(client);
> > > > +	struct imx296 *imx = to_imx296(subdev);
> > > > +
> > > > +	v4l2_async_unregister_subdev(subdev);
> > > > +	media_entity_cleanup(&subdev->entity);
> > > > +	v4l2_ctrl_handler_free(&imx->ctrls);
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +#if IS_ENABLED(CONFIG_OF)
> 
> I think you don't need this guard if of_match_ptr is used.

There's also need for of_match_ptr, it should be removed.

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
