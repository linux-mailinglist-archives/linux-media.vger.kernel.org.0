Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F4099F0723
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2019 21:41:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726640AbfKEUle (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Nov 2019 15:41:34 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45490 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725806AbfKEUld (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Nov 2019 15:41:33 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CDB6E559;
        Tue,  5 Nov 2019 21:41:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1572986492;
        bh=Zb+m8W7oaxJfnlZYjHP8JQPrwVSnbEfYozsCYchGIKw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YT/A8YdiCasmNrQtEMnehzMBpFWJRN9wXqje/nMmWEOcXVwYLVNrxHZpOIsP3qXPe
         vxKq/OY9u1Pm4pS6PzSZPLDErcWSLF/aJK9y5QyAILOWe2z1wIr2caqBEZcGOJurxD
         7hZaSBGzjlpUxka/wD6iYszNbqczxVT72THqHOuk=
Date:   Tue, 5 Nov 2019 22:41:23 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] media: i2c: IMX296 camera sensor driver
Message-ID: <20191105204123.GG4869@pendragon.ideasonboard.com>
References: <20191031132309.10965-1-laurent.pinchart@ideasonboard.com>
 <20191101145246.GA13101@Mani-XPS-13-9360>
 <20191104134206.GC4913@pendragon.ideasonboard.com>
 <20191105150355.GA674@Mani-XPS-13-9360>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191105150355.GA674@Mani-XPS-13-9360>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mani,

On Tue, Nov 05, 2019 at 08:33:55PM +0530, Manivannan Sadhasivam wrote:
> On Mon, Nov 04, 2019 at 03:42:06PM +0200, Laurent Pinchart wrote:
> > On Fri, Nov 01, 2019 at 08:22:46PM +0530, Manivannan Sadhasivam wrote:
> >> On Thu, Oct 31, 2019 at 03:23:09PM +0200, Laurent Pinchart wrote:
> >>> The IMX296LLR is a monochrome 1.60MP CMOS sensor from Sony. The driver
> >>> supports cropping and binning (but not both at the same time due to
> >>> hardware limitations) and exposure, gain, vertical blanking and test
> >>> pattern controls.
> >>> 
> >>> Preliminary support is also included for the color IMX296LQR sensor.
> >>> 
> >>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>> ---
> >>> This driver is a parallel implementation of IMX296 support, compatible
> >>> with the DT bindings submitted by Mani in
> >>> https://lore.kernel.org/linux-media/20191030094902.32582-1-manivannan.sadhasivam@linaro.org/.
> >>> 
> >>>  drivers/media/i2c/Kconfig  |   12 +
> >>>  drivers/media/i2c/Makefile |    1 +
> >>>  drivers/media/i2c/imx296.c | 1026 ++++++++++++++++++++++++++++++++++++
> >>>  3 files changed, 1039 insertions(+)
> >>>  create mode 100644 drivers/media/i2c/imx296.c

[snip]

> >>> diff --git a/drivers/media/i2c/imx296.c b/drivers/media/i2c/imx296.c
> >>> new file mode 100644
> >>> index 000000000000..4140637983fd
> >>> --- /dev/null
> >>> +++ b/drivers/media/i2c/imx296.c

[snip]

> >>> +struct imx296 {
> >>> +	struct device *dev;
> >>> +	struct clk *clk;
> >>> +	struct regulator *supply;
> >> 
> >> Any plan to use 3 power supplies as discussed in bindings patch?
> > 
> > I'd like to reach a conclusion on that discussion first :-) Do you think
> > we should add them right away, or only when needed ? There's no issue
> > with backward compatibility, if we start with one power supply only the
> > next two would be optional.
> 
> The use of single power supply still doesn't look good to me. Could you please
> add all of them?

I can give this a try. I'm annoyed that it will make my DT more complex
as I have a single controllable power supply from which the three sensor
supplies are derived. Could you share the sensor DT fragment for your
platform to give me a second example ?

[snip]

-- 
Regards,

Laurent Pinchart
