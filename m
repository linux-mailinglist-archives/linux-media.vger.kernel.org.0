Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E89A1F1414
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2020 10:02:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729047AbgFHIC0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Jun 2020 04:02:26 -0400
Received: from retiisi.org.uk ([95.216.213.190]:53930 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725840AbgFHICZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Jun 2020 04:02:25 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id ED924634C87;
        Mon,  8 Jun 2020 11:00:42 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1jiCi3-0004mZ-3R; Mon, 08 Jun 2020 11:00:43 +0300
Date:   Mon, 8 Jun 2020 11:00:43 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     mchehab@kernel.org, manivannan.sadhasivam@linaro.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org
Subject: Re: [PATCH v3 08/10] media: i2c: imx290: Add support to enumerate
 all frame sizes
Message-ID: <20200608080043.GN9947@valkosipuli.retiisi.org.uk>
References: <20200524192505.20682-1-andrey.konovalov@linaro.org>
 <20200524192505.20682-9-andrey.konovalov@linaro.org>
 <20200526091716.GJ8214@valkosipuli.retiisi.org.uk>
 <effee6cc-680f-3234-2e56-2f6b24d107cd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <effee6cc-680f-3234-2e56-2f6b24d107cd@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Jun 07, 2020 at 07:28:56PM +0300, Andrey Konovalov wrote:
> Hi Sakari,
> 
> Thank you for the review!
> 
> On 26.05.2020 12:17, Sakari Ailus wrote:
> > Hi Andrey,
> > 
> > On Sun, May 24, 2020 at 10:25:03PM +0300, Andrey Konovalov wrote:
> > > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > 
> > > Add support to enumerate all frame sizes supported by IMX290. This is
> > > required for using with userspace tools such as libcamera.
> > > 
> > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
> > > ---
> > >   drivers/media/i2c/imx290.c | 20 ++++++++++++++++++++
> > >   1 file changed, 20 insertions(+)
> > > 
> > > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > > index 6e70ff22bc5f..88850f3b1427 100644
> > > --- a/drivers/media/i2c/imx290.c
> > > +++ b/drivers/media/i2c/imx290.c
> > > @@ -471,6 +471,25 @@ static int imx290_enum_mbus_code(struct v4l2_subdev *sd,
> > >   	return 0;
> > >   }
> > > +static int imx290_enum_frame_size(struct v4l2_subdev *subdev,
> > > +				  struct v4l2_subdev_pad_config *cfg,
> > > +				  struct v4l2_subdev_frame_size_enum *fse)
> > > +{
> > > +	if ((fse->code != imx290_formats[0].code) &&
> > > +	    (fse->code != imx290_formats[1].code))
> > > +		return -EINVAL;
> > 
> > Please skip the modes that do not have the code specified by the user. They
> > should not be enumerated here.
> 
> I've double checked this part of the code, and it doesn't seem to need changes.
> The reason is that for the both codes the set of the modes and the frame sizes is
> exactly the same. And the fse->code check above just guards against the codes not
> supported by the driver at all.

Indeed. Please then ignore the comment.

-- 
Sakari Ailus
