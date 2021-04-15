Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78F6D36103F
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 18:36:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233664AbhDOQhG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Apr 2021 12:37:06 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:45771 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231549AbhDOQhG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Apr 2021 12:37:06 -0400
X-Originating-IP: 24.194.32.49
Received: from coplandos.local (cpe-24-194-32-49.nycap.res.rr.com [24.194.32.49])
        (Authenticated sender: vrzh@vrzh.net)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 1B43B1C0009;
        Thu, 15 Apr 2021 16:36:39 +0000 (UTC)
Date:   Thu, 15 Apr 2021 12:39:49 -0400
From:   Martiros Shakhzadyan <vrzh@vrzh.net>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Martiros Shakhzadyan <vrzh@vrzh.net>
Subject: Re: [PATCH] staging: media: atomisp: Use goto instead of return in
 ia_css_init()
Message-ID: <YHhsVeu4jKRngp0w@coplandos.local>
References: <20210415005106.530914-1-vrzh@vrzh.net>
 <20210415005106.530914-8-vrzh@vrzh.net>
 <7943beba-cbb5-4c85-4381-f81fb49d189f@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7943beba-cbb5-4c85-4381-f81fb49d189f@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Apr 15, 2021 at 03:56:35PM +0200, Hans Verkuil wrote:
> Hi Martiros,
> 
> On 15/04/2021 02:51, Martiros Shakhzadyan wrote:
> > Replace multiple return statements with goto in ia_css_init(), matching
> > other functions.
> > 
> > Signed-off-by: Martiros Shakhzadyan <vrzh@vrzh.net>
> > ---
> >  drivers/staging/media/atomisp/pci/sh_css.c | 45 +++++++++-------------
> >  1 file changed, 19 insertions(+), 26 deletions(-)
> > 
> > diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
> > index bb752d47457c..4e3ef68014ec 100644
> > --- a/drivers/staging/media/atomisp/pci/sh_css.c
> > +++ b/drivers/staging/media/atomisp/pci/sh_css.c
> > @@ -1695,10 +1695,8 @@ ia_css_init(struct device *dev, const struct ia_css_env *env,
> >  	my_css.flush     = flush_func;
> >  
> >  	err = ia_css_rmgr_init();
> > -	if (err) {
> > -		IA_CSS_LEAVE_ERR(err);
> > -		return err;
> > -	}
> > +	if (err)
> > +		goto ERR;
> 
> Sorry, this doesn't work.
> 
> First a style issue: goto label are typically lowercase, not uppercase.
> I do see that elsewhere in this source they use ERR as well, but that should
> really all be changed to lowercase.

Will keep that in mind as I continue to work on this file.
> But more importantly, if you look up the definition of IA_CSS_LEAVE_ERR
> you see:
> 
> #define IA_CSS_LEAVE_ERR(__err) \
>         ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, \
>                 "%s() %d: leave: return_err=%d\n", __func__, __LINE__, __err)
> 
> I.e., it is used to debug the code and print where the error is returned
> (__func__ and __LINE__). By moving this to the end, the __LINE__ is always
> the same for all 'error' cases, thus defeating the purpose of this debug line.
Makes sense. I did consider this, however the rest of the error goto
instances have already been implemented with a similar macro
(IS_CSS_LEAVE_ERR_PRIVATE) at exit, so I thought perhaps it was
acceptable. Should I update these functions accordingly (e.g.
create_host_*pipeline() series of functions)?
> So I won't take this patch.
> 
> Regards,
> 
> 	Hans
> 
Thanks for the review! -M
> >  
> >  	IA_CSS_LOG("init: %d", my_css_save_initialized);
> >  
> > @@ -1730,27 +1728,23 @@ ia_css_init(struct device *dev, const struct ia_css_env *env,
> >  	gpio_reg_store(GPIO0_ID, _gpio_block_reg_do_0, 0);
> >  
> >  	err = ia_css_refcount_init(REFCOUNT_SIZE);
> > -	if (err) {
> > -		IA_CSS_LEAVE_ERR(err);
> > -		return err;
> > -	}
> > +	if (err)
> > +		goto ERR;
> > +
> >  	err = sh_css_params_init();
> > -	if (err) {
> > -		IA_CSS_LEAVE_ERR(err);
> > -		return err;
> > -	}
> > +	if (err)
> > +		goto ERR;
> > +
> >  	if (fw) {
> >  		ia_css_unload_firmware(); /* in case we already had firmware loaded */
> >  		err = sh_css_load_firmware(dev, fw->data, fw->bytes);
> > -		if (err) {
> > -			IA_CSS_LEAVE_ERR(err);
> > -			return err;
> > -		}
> > +		if (err)
> > +			goto ERR;
> > +
> >  		err = ia_css_binary_init_infos();
> > -		if (err) {
> > -			IA_CSS_LEAVE_ERR(err);
> > -			return err;
> > -		}
> > +		if (err)
> > +			goto ERR;
> > +
> >  		fw_explicitly_loaded = false;
> >  #ifndef ISP2401
> >  		my_css_save.loaded_fw = (struct ia_css_fw *)fw;
> > @@ -1760,10 +1754,8 @@ ia_css_init(struct device *dev, const struct ia_css_env *env,
> >  		return -EINVAL;
> >  
> >  	err = ia_css_spctrl_load_fw(SP0_ID, &spctrl_cfg);
> > -	if (err) {
> > -		IA_CSS_LEAVE_ERR(err);
> > -		return err;
> > -	}
> > +	if (err)
> > +		goto ERR;
> >  
> >  #if WITH_PC_MONITORING
> >  	if (!thread_alive) {
> > @@ -1774,8 +1766,8 @@ ia_css_init(struct device *dev, const struct ia_css_env *env,
> >  	}
> >  #endif
> >  	if (!sh_css_hrt_system_is_idle()) {
> > -		IA_CSS_LEAVE_ERR(-EBUSY);
> > -		return -EBUSY;
> > +		err = -EBUSY;
> > +		goto ERR;
> >  	}
> >  	/* can be called here, queuing works, but:
> >  	   - when sp is started later, it will wipe queued items
> > @@ -1801,6 +1793,7 @@ ia_css_init(struct device *dev, const struct ia_css_env *env,
> >  
> >  	sh_css_params_map_and_store_default_gdc_lut();
> >  
> > +ERR:
> >  	IA_CSS_LEAVE_ERR(err);
> >  	return err;
> >  }
> > 
> 
