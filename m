Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 435EC2A7EE5
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 13:46:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730200AbgKEMqU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 07:46:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:48404 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730044AbgKEMqU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Nov 2020 07:46:20 -0500
Received: from coco.lan (ip5f5ad5d8.dynamic.kabel-deutschland.de [95.90.213.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4628D20782;
        Thu,  5 Nov 2020 12:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604580379;
        bh=Ig35OUeYpSQKKOG25sTrprYxb9IcwY5HFgl6kzQL4g0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=llYIqzbGxrqV6DywuD2F5WV9x1GNWq9BwRc8bUnSldMTwW00CLmzNTxuThBYSZX/e
         arZp+1tl70tYHnEnCbY1NvwZJ6pX3d1nEvly0j9wWOFFlaUd/HJaN40VZg/QEymmfT
         gRy0nRCrKEEzPzudgJCywTx4X7jZezcAFiOAyM+I=
Date:   Thu, 5 Nov 2020 13:46:15 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH v2 046/106] ccs: Add support for manufacturer regs from
 sensor and module files
Message-ID: <20201105134615.301c0083@coco.lan>
In-Reply-To: <20201105115601.GC26150@paasikivi.fi.intel.com>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
        <20201007084557.25843-1-sakari.ailus@linux.intel.com>
        <20201007084557.25843-39-sakari.ailus@linux.intel.com>
        <20201105123413.07eb4a9a@coco.lan>
        <20201105115601.GC26150@paasikivi.fi.intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 5 Nov 2020 13:56:01 +0200
Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:

> Hi Mauro,
> 
> Thanks for the review.
> 
> On Thu, Nov 05, 2020 at 12:34:13PM +0100, Mauro Carvalho Chehab wrote:
> > Em Wed,  7 Oct 2020 11:44:59 +0300
> > Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:  
> 
> ...
> 
> > > diff --git a/drivers/media/i2c/ccs/ccs-reg-access.c b/drivers/media/i2c/ccs/ccs-reg-access.c
> > > index aad2727570ec..9fda16b221a7 100644
> > > --- a/drivers/media/i2c/ccs/ccs-reg-access.c
> > > +++ b/drivers/media/i2c/ccs/ccs-reg-access.c
> > > @@ -236,12 +236,38 @@ int ccs_read_addr_noconv(struct ccs_sensor *sensor, u32 reg, u32 *val)
> > >  	return ccs_read_addr_raw(sensor, reg, val, false, true, false);
> > >  }
> > >  
> > > +static int ccs_write_retry(struct i2c_client *client, struct i2c_msg *msg)
> > > +{
> > > +	unsigned int retries;
> > > +	int r;
> > > +
> > > +	for (retries = 0; retries < 5; retries++) {
> > > +		/*
> > > +		 * Due to unknown reason sensor stops responding. This
> > > +		 * loop is a temporaty solution until the root cause
> > > +		 * is found.
> > > +		 */
> > > +		r = i2c_transfer(client->adapter, msg, 1);
> > > +		if (r != 1) {
> > > +			usleep_range(2000, 2000);  
> > 
> > Huh? Does it need to sleep precisely for 2000 us?  
> 
> I believe this one does not, indeed. I'll make it a range, but add a
> separate patch for it as this patch just moves the code form one place to
> another.

Ok.
> 



Thanks,
Mauro
