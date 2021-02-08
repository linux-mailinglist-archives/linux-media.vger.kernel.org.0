Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D79E313202
	for <lists+linux-media@lfdr.de>; Mon,  8 Feb 2021 13:17:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231235AbhBHMQn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Feb 2021 07:16:43 -0500
Received: from mga07.intel.com ([134.134.136.100]:42087 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230493AbhBHMQ3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Feb 2021 07:16:29 -0500
IronPort-SDR: AsRHd87QCU07lrfzAJNdkkfpcw66ODCEC9qu2lzHwlimz0SCF+cSsNT/egPwCQnN7Y79fZJeae
 NCmZZ4SDjFhw==
X-IronPort-AV: E=McAfee;i="6000,8403,9888"; a="245771402"
X-IronPort-AV: E=Sophos;i="5.81,161,1610438400"; 
   d="scan'208";a="245771402"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2021 04:14:41 -0800
IronPort-SDR: pgOVNYkHrnlA7tf1hYOixRFltlFVdXx+vj/dLK2yAVXB+OsJAyD5RDrYOrFRsy4TLrHxRA88DU
 TL3QhHHHJtwA==
X-IronPort-AV: E=Sophos;i="5.81,161,1610438400"; 
   d="scan'208";a="418761832"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2021 04:14:40 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 1E5002082C; Mon,  8 Feb 2021 14:14:38 +0200 (EET)
Date:   Mon, 8 Feb 2021 14:14:38 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Martina Krasteva <martinax.krasteva@linux.intel.com>
Subject: Re: [PATCH] imx334: 'ret' is uninitialized, should have been
 PTR_ERR()
Message-ID: <20210208121437.GV32460@paasikivi.fi.intel.com>
References: <917ccfef-b93e-4d90-0b5a-4974145ab187@xs4all.nl>
 <20210208120830.GT32460@paasikivi.fi.intel.com>
 <362ff64d-f72d-eb2e-7d10-40334f7e9ef6@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <362ff64d-f72d-eb2e-7d10-40334f7e9ef6@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Feb 08, 2021 at 01:13:19PM +0100, Hans Verkuil wrote:
> On 08/02/2021 13:08, Sakari Ailus wrote:
> > Hi Hans,
> > 
> > On Mon, Feb 08, 2021 at 12:32:29PM +0100, Hans Verkuil wrote:
> >> Fix this compiler warning:
> >>
> >> drivers/media/i2c/imx334.c: In function 'imx334_parse_hw_config':
> >> include/linux/dev_printk.h:112:2: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
> >>   112 |  _dev_err(dev, dev_fmt(fmt), ##__VA_ARGS__)
> >>       |  ^~~~~~~~
> >> drivers/media/i2c/imx334.c:783:6: note: 'ret' was declared here
> >>   783 |  int ret;
> >>       |      ^~~
> >>
> >> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> >> ---
> >>  drivers/media/i2c/imx334.c | 3 ++-
> >>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
> >> index 07e31bc2ef18..ad530f0d338a 100644
> >> --- a/drivers/media/i2c/imx334.c
> >> +++ b/drivers/media/i2c/imx334.c
> >> @@ -790,7 +790,8 @@ static int imx334_parse_hw_config(struct imx334 *imx334)
> >>  	imx334->reset_gpio = devm_gpiod_get_optional(imx334->dev, "reset",
> >>  						     GPIOD_OUT_LOW);
> >>  	if (IS_ERR(imx334->reset_gpio)) {
> >> -		dev_err(imx334->dev, "failed to get reset gpio %d", ret);
> >> +		dev_err(imx334->dev, "failed to get reset gpio %ld",
> >> +			PTR_ERR(imx334->reset_gpio));
> >>  		return PTR_ERR(imx334->reset_gpio);
> >>  	}
> >>
> > 
> > Thanks for the patch.
> > 
> > Feel free to merge this through your tree if you think you'll have other
> > fixes. In that case,
> > 
> > Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > 
> > I can also pick it if you like.
> > 
> 
> Can you pick it up? I have no new PRs planned this week.

Sure!

-- 
Sakari Ailus
