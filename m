Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 322D4E9839
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2019 09:36:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726084AbfJ3Igd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Oct 2019 04:36:33 -0400
Received: from retiisi.org.uk ([95.216.213.190]:51778 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726028AbfJ3Igd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Oct 2019 04:36:33 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 71E17634C87;
        Wed, 30 Oct 2019 10:35:45 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1iPjSC-0001cI-Hz; Wed, 30 Oct 2019 10:35:44 +0200
Date:   Wed, 30 Oct 2019 10:35:44 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     mchehab@kernel.org, robh+dt@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org
Subject: Re: [PATCH v3 2/2] media: i2c: Add IMX296 CMOS image sensor driver
Message-ID: <20191030083544.GG5017@valkosipuli.retiisi.org.uk>
References: <20191025175908.14260-1-manivannan.sadhasivam@linaro.org>
 <20191025175908.14260-3-manivannan.sadhasivam@linaro.org>
 <20191029121320.GA5017@valkosipuli.retiisi.org.uk>
 <20191030062634.GA11637@Mani-XPS-13-9360>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191030062634.GA11637@Mani-XPS-13-9360>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 30, 2019 at 11:56:34AM +0530, Manivannan Sadhasivam wrote:
> Hi Sakari,
> 
> Thanks for the review!

You're welcome!

> 
> On Tue, Oct 29, 2019 at 02:13:20PM +0200, Sakari Ailus wrote:
> > Hi Manivannan,
> > 
> > On Fri, Oct 25, 2019 at 11:29:08PM +0530, Manivannan Sadhasivam wrote:

...

> > > +static struct i2c_driver imx296_i2c_driver = {
> > > +	.probe_new  = imx296_probe,
> > > +	.remove = imx296_remove,
> > > +	.driver = {
> > > +		.name  = "imx296",
> > > +		.pm = &imx296_pm_ops,
> > > +		.of_match_table = of_match_ptr(imx296_of_match),
> > 
> > No need for of_match_ptr here.
> > 
> 
> AFAIK, of_match_ptr is needed for !OF case. Else we need to manually add
> #ifdef clut to make it NULL. Does the situation changed now?

ACPI based systems can also make use of the compatible string for matching
drivers with devices through of_match_table. This may sometimes be the most
practical approach. I.e. you don't need ifdefs either.

-- 
Regards,

Sakari Ailus
