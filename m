Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D4D785CBD
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2019 10:26:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731839AbfHHI0K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Aug 2019 04:26:10 -0400
Received: from retiisi.org.uk ([95.216.213.190]:53630 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731592AbfHHI0K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 8 Aug 2019 04:26:10 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id BED9A634C87;
        Thu,  8 Aug 2019 11:26:04 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1hvdkL-0000IK-JF; Thu, 08 Aug 2019 11:26:05 +0300
Date:   Thu, 8 Aug 2019 11:26:05 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, hverkuil@xs4all.nl,
        slongerbeam@gmail.com, linux-imx@nxp.com,
        linux-media@vger.kernel.org, kernel@pengutronix.de,
        shawnguo@kernel.org, mchehab@kernel.org
Subject: Re: [PATCH v3] media: imx: mipi csi-2: Don't fail if initial state
 times-out
Message-ID: <20190808082605.GA917@valkosipuli.retiisi.org.uk>
References: <20190627222912.25485-1-festevam@gmail.com>
 <1561963729.3753.5.camel@pengutronix.de>
 <8b859fd7758c3f95b45b5b70909be0d2ae2e4f34.camel@collabora.com>
 <20190807120626.GE822@valkosipuli.retiisi.org.uk>
 <73d82df753e0579bd122dfaf9fa12ba8cad95d88.camel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73d82df753e0579bd122dfaf9fa12ba8cad95d88.camel@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

On Wed, Aug 07, 2019 at 10:59:22AM -0300, Ezequiel Garcia wrote:
> Hi Sakari,
> 
> Thanks for reviewing the patch.
> 
> On Wed, 2019-08-07 at 15:06 +0300, Sakari Ailus wrote:
> > On Tue, Jul 30, 2019 at 05:14:24AM -0300, Ezequiel Garcia wrote:
> > > Hey Hans,
> > > 
> > > On Mon, 2019-07-01 at 08:48 +0200, Philipp Zabel wrote:
> > > > On Thu, 2019-06-27 at 19:29 -0300, Fabio Estevam wrote:
> > > > > From: Ezequiel Garcia <ezequiel@collabora.com>
> > > > > 
> > > > > Not all sensors will be able to guarantee a proper initial state.
> > > > > This may be either because the driver is not properly written,
> > > > > or (probably unlikely) because the hardware won't support it.
> > > > > 
> > > > > While the right solution in the former case is to fix the sensor
> > > > > driver, the real world not always allows right solutions, due to lack
> > > > > of available documentation and support on these sensors.
> > > > > 
> > > > > Let's relax this requirement, and allow the driver to support stream start,
> > > > > even if the sensor initial sequence wasn't the expected.
> > > > > 
> > > > > Also improve the warning message to better explain the problem and provide
> > > > > a hint that the sensor driver needs to be fixed.
> > > > > 
> > > > > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > > > > Signed-off-by: Fabio Estevam <festevam@gmail.com>
> > > > 
> > > > Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> > > > 
> > > 
> > > This seems ready to pick and it has Philipp's and Steve's RB.
> > 
> > Hi Ezequiel,
> > 
> > In general the LP-11 condition should be detected by hardware (or firmware)
> > in such a way that it's detected even if a transmitter that holds the state
> > just a short period of time. In other words, software is not supposed to be
> > even testing for it.
> > 
> > Have you checked how it works if you simply leave out this test?
> > 
> 
> The current change relaxes a condition, which we observed was too strict.
> Some drivers might be unable to enter LP-11 state, but I don't think
> that's a reason to fail capture.

Some devices can be commanded to enter LP-11 state but some will just
briefly visit that state. The LP-11 state is mandatory but software should
not be involved in detecting it if at all possible.

So if the hardware does not require further initialisation to be done in
LP-11 state, you should remove the check.

> 
> We had to fix at least OV5645 and OV5640 recently because of this,
> and I can imagine more drivers will have the same issue.

This is actually an issue in the IMX driver (or hardware), not in the
sensor driver. It may be that sometimes it's easier to work around it in
the sensor driver.

So, I'd like to know whether the check itself is a driver bug, or something
that the hardware requires. The fact that you're sending this patch
suggests the former.

-- 
Regards,

Sakari Ailus
