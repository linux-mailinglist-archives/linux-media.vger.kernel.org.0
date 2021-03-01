Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F7AC327817
	for <lists+linux-media@lfdr.de>; Mon,  1 Mar 2021 08:13:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232390AbhCAHMh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Mar 2021 02:12:37 -0500
Received: from mga07.intel.com ([134.134.136.100]:24872 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232378AbhCAHM2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Mar 2021 02:12:28 -0500
IronPort-SDR: Q8aSsrMocQFKD9cYWi8+Z8Qo/ORr6YXw8C4SXRBYNzQtNgU02muMpcWLbfdgr/HirsiKEWpbLw
 c1u1aHroKnTw==
X-IronPort-AV: E=McAfee;i="6000,8403,9909"; a="250432278"
X-IronPort-AV: E=Sophos;i="5.81,214,1610438400"; 
   d="scan'208";a="250432278"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2021 23:10:41 -0800
IronPort-SDR: /OugGBR8rq5lqEjdZkAUSg9yc1F4w7ipJkCTgTmnf3ciFPsl1O78JsfAcuoQjOoHABUNi24xuH
 nTBUd5pH2URA==
X-IronPort-AV: E=Sophos;i="5.81,214,1610438400"; 
   d="scan'208";a="517326248"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2021 23:10:39 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id C065C202DD;
        Mon,  1 Mar 2021 09:10:37 +0200 (EET)
Date:   Mon, 1 Mar 2021 09:10:37 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Colin King <colin.king@canonical.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: adp1653: fix error handling from a call to
 adp1653_get_fault
Message-ID: <20210301071037.GP3@paasikivi.fi.intel.com>
References: <20210226232229.1076199-1-colin.king@canonical.com>
 <20210227101719.GG2087@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210227101719.GG2087@kadam>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan, Colin,

On Sat, Feb 27, 2021 at 01:17:20PM +0300, Dan Carpenter wrote:
> On Fri, Feb 26, 2021 at 11:22:29PM +0000, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > The error check on rval from the call to adp1653_get_fault currently
> > returns if rval is non-zero. This appears to be incorrect as the
> > following if statement checks for various bit settings in rval so
> > clearly rval is expected to be non-zero at that point. Coverity
> > flagged the if statement up as deadcode.  Fix this so the error
> > return path only occurs when rval is negative.
> > 
> > Addresses-Coverity: ("Logically dead code")
> > Fixes: 287980e49ffc ("remove lots of IS_ERR_VALUE abuses")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> >  drivers/media/i2c/adp1653.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/i2c/adp1653.c b/drivers/media/i2c/adp1653.c
> > index 522a0b10e415..1a4878385394 100644
> > --- a/drivers/media/i2c/adp1653.c
> > +++ b/drivers/media/i2c/adp1653.c
> > @@ -170,7 +170,7 @@ static int adp1653_set_ctrl(struct v4l2_ctrl *ctrl)
> >  	int rval;
> >  
> >  	rval = adp1653_get_fault(flash);
> > -	if (rval)
> > +	if (rval < 0)
> >  		return rval;
> 
> This is good, but all the other callers need to fixed as well:
> 
> 
>    140  static int adp1653_get_ctrl(struct v4l2_ctrl *ctrl)
>    141  {
>    142          struct adp1653_flash *flash =
>    143                  container_of(ctrl->handler, struct adp1653_flash, ctrls);
>    144          int rval;
>    145  
>    146          rval = adp1653_get_fault(flash);
>    147          if (rval)
>    148                  return rval;
>    149  
>    150          ctrl->cur.val = 0;
>    151  
>    152          if (flash->fault & ADP1653_REG_FAULT_FLT_SCP)
>                     ^^^^^^^^^^^^
> flash->fault is the equivalent of "rval" for non-negative returns so
> this condition can never be true.  We should never be returning these
> weird firmware ADP1653_REG_FAULT_FLT_SCP fault codes to the v4l2 layers.

I think this could be fixed and cleaned up by always retuning zero on
success, and checking for flash->faults while holding the mutex in
adp1653_init_device. I could fix that, too, just let me know...

-- 
Regards,

Sakari Ailus
