Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5418D84E12
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2019 15:59:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729722AbfHGN7e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Aug 2019 09:59:34 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:53100 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729516AbfHGN7e (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Aug 2019 09:59:34 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 16B7128A908
Message-ID: <73d82df753e0579bd122dfaf9fa12ba8cad95d88.camel@collabora.com>
Subject: Re: [PATCH v3] media: imx: mipi csi-2: Don't fail if initial state
 times-out
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, hverkuil@xs4all.nl,
        slongerbeam@gmail.com, linux-imx@nxp.com,
        linux-media@vger.kernel.org, kernel@pengutronix.de,
        shawnguo@kernel.org, mchehab@kernel.org
Date:   Wed, 07 Aug 2019 10:59:22 -0300
In-Reply-To: <20190807120626.GE822@valkosipuli.retiisi.org.uk>
References: <20190627222912.25485-1-festevam@gmail.com>
         <1561963729.3753.5.camel@pengutronix.de>
         <8b859fd7758c3f95b45b5b70909be0d2ae2e4f34.camel@collabora.com>
         <20190807120626.GE822@valkosipuli.retiisi.org.uk>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thanks for reviewing the patch.

On Wed, 2019-08-07 at 15:06 +0300, Sakari Ailus wrote:
> On Tue, Jul 30, 2019 at 05:14:24AM -0300, Ezequiel Garcia wrote:
> > Hey Hans,
> > 
> > On Mon, 2019-07-01 at 08:48 +0200, Philipp Zabel wrote:
> > > On Thu, 2019-06-27 at 19:29 -0300, Fabio Estevam wrote:
> > > > From: Ezequiel Garcia <ezequiel@collabora.com>
> > > > 
> > > > Not all sensors will be able to guarantee a proper initial state.
> > > > This may be either because the driver is not properly written,
> > > > or (probably unlikely) because the hardware won't support it.
> > > > 
> > > > While the right solution in the former case is to fix the sensor
> > > > driver, the real world not always allows right solutions, due to lack
> > > > of available documentation and support on these sensors.
> > > > 
> > > > Let's relax this requirement, and allow the driver to support stream start,
> > > > even if the sensor initial sequence wasn't the expected.
> > > > 
> > > > Also improve the warning message to better explain the problem and provide
> > > > a hint that the sensor driver needs to be fixed.
> > > > 
> > > > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > > > Signed-off-by: Fabio Estevam <festevam@gmail.com>
> > > 
> > > Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> > > 
> > 
> > This seems ready to pick and it has Philipp's and Steve's RB.
> 
> Hi Ezequiel,
> 
> In general the LP-11 condition should be detected by hardware (or firmware)
> in such a way that it's detected even if a transmitter that holds the state
> just a short period of time. In other words, software is not supposed to be
> even testing for it.
> 
> Have you checked how it works if you simply leave out this test?
> 

The current change relaxes a condition, which we observed was too strict.
Some drivers might be unable to enter LP-11 state, but I don't think
that's a reason to fail capture.

We had to fix at least OV5645 and OV5640 recently because of this,
and I can imagine more drivers will have the same issue.

The way I see it, the driver is imposing a condition that is too strict,
and that's why relaxing it makes sense.

No, regarding removing the test completely, I'm not sure I want to
propose such a change, which would be undoubtfully more invasive.

Thanks,
Ezequiel

