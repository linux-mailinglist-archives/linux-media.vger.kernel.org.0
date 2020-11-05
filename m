Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8ECF82A7D9B
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 12:56:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730186AbgKEL4F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 06:56:05 -0500
Received: from mga18.intel.com ([134.134.136.126]:29001 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726067AbgKEL4F (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Nov 2020 06:56:05 -0500
IronPort-SDR: iQiVdA8O7cQ1fSQehcUds/OIOS9IUvWicwNSc5ghLyN81LqbxZ8B0rakZ71c+yu2jRVgSHymG1
 UjUw+AOPqI2A==
X-IronPort-AV: E=McAfee;i="6000,8403,9795"; a="157147629"
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; 
   d="scan'208";a="157147629"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 03:56:04 -0800
IronPort-SDR: DgzY6llBUfVi8BuWlv6z72AKyKvbaLTc4P82dGa9MSMMhSvXWUkwzdvQ17Xl4ePb2p4l8VIR9m
 KAly6Dqm3WEA==
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; 
   d="scan'208";a="358398203"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 03:56:03 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 3C51F20901; Thu,  5 Nov 2020 13:56:01 +0200 (EET)
Date:   Thu, 5 Nov 2020 13:56:01 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH v2 046/106] ccs: Add support for manufacturer regs from
 sensor and module files
Message-ID: <20201105115601.GC26150@paasikivi.fi.intel.com>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-39-sakari.ailus@linux.intel.com>
 <20201105123413.07eb4a9a@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201105123413.07eb4a9a@coco.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Thanks for the review.

On Thu, Nov 05, 2020 at 12:34:13PM +0100, Mauro Carvalho Chehab wrote:
> Em Wed,  7 Oct 2020 11:44:59 +0300
> Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:

...

> > diff --git a/drivers/media/i2c/ccs/ccs-reg-access.c b/drivers/media/i2c/ccs/ccs-reg-access.c
> > index aad2727570ec..9fda16b221a7 100644
> > --- a/drivers/media/i2c/ccs/ccs-reg-access.c
> > +++ b/drivers/media/i2c/ccs/ccs-reg-access.c
> > @@ -236,12 +236,38 @@ int ccs_read_addr_noconv(struct ccs_sensor *sensor, u32 reg, u32 *val)
> >  	return ccs_read_addr_raw(sensor, reg, val, false, true, false);
> >  }
> >  
> > +static int ccs_write_retry(struct i2c_client *client, struct i2c_msg *msg)
> > +{
> > +	unsigned int retries;
> > +	int r;
> > +
> > +	for (retries = 0; retries < 5; retries++) {
> > +		/*
> > +		 * Due to unknown reason sensor stops responding. This
> > +		 * loop is a temporaty solution until the root cause
> > +		 * is found.
> > +		 */
> > +		r = i2c_transfer(client->adapter, msg, 1);
> > +		if (r != 1) {
> > +			usleep_range(2000, 2000);
> 
> Huh? Does it need to sleep precisely for 2000 us?

I believe this one does not, indeed. I'll make it a range, but add a
separate patch for it as this patch just moves the code form one place to
another.

-- 
Sakari Ailus
