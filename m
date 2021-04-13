Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B57235DCF1
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 12:57:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344157AbhDMK5F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 06:57:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230123AbhDMK5E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 06:57:04 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F316C061574;
        Tue, 13 Apr 2021 03:56:45 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id l76so11637248pga.6;
        Tue, 13 Apr 2021 03:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MAGppu7VhjPYwD2qxh3YHD4bU0Gc/HYHrVGQQoZyahU=;
        b=IpBgHtCyRL3gNX7opeVdx95bt1xmEcYgkCa30wTNZuMfWkAVXRuTEWI4jgzM1rBc42
         m1D37NMSaDkwEZJSB1NgiZZO29QYuHbeG7k2kgGriwCVqfXTG+J71SRz98Vcrj08K8G7
         /vNA4lDX4R3bmuN7vN8UhCKOjtX/CT4AK00ly9qczRoNzkFH6RmIc/plfHTzm8QL3EDQ
         olouQdpxWpRtS8QKQtbd5L5PoJxG2Vs708sNFKzU8OJzxxAMM7nDZL540Ltip/bWog2t
         atYMFAR8BBQpZx45KnpCL466T40IgtZM9HkW/jrXLgKXxgqTYhAOVSUf7UZ8WUteI/hC
         TnLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MAGppu7VhjPYwD2qxh3YHD4bU0Gc/HYHrVGQQoZyahU=;
        b=gnqPM9SAk61xVDMWEans6DfGlqhF2M2L1saRJXBcYBXgGF7B9Mm/Xx1aHWH7N0Y4SF
         jEytr3H3XS6sWFSzy/6gtU1ml/HvgWEb+1AA8cpCR4feAJCUBej87Kq4HmNw3yCJ4gFZ
         XpA1RtzXTQELtSE7se054IOi78lDWN1/9A0Ih16bod/K+w9BADJLk/q1NspM1Lte1LXY
         4zTCK095GEMeQHshWALzFT9lyZluYSq64Km7E8RBS97qPRMU5MF6cOJD9rTO+KixK7Cc
         ItVl7/UXxyT9hVlO3Dcr4wTeq4iWSss5Amyjz2cHq2bvx1knXsbSmdGObZdWCpqXSfZN
         +xSQ==
X-Gm-Message-State: AOAM532O0C70vu0rRnHQF0EGSJxulIzjCHozY8ICFD53LpluNIZDXBW2
        WahJ6u0Y89xo1JoZo+ADD3qazWrAgmC3jw==
X-Google-Smtp-Source: ABdhPJzTKQeZIzirwZSD206tzj/T5X/VUTXAEmxsu+8U62aE7swXsuUaMYXGjeJg9TJkqfZhp7MHQw==
X-Received: by 2002:a63:703:: with SMTP id 3mr31987197pgh.253.1618311404850;
        Tue, 13 Apr 2021 03:56:44 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id h68sm12219382pfe.111.2021.04.13.03.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 03:56:44 -0700 (PDT)
Date:   Tue, 13 Apr 2021 16:26:36 +0530
From:   Mitali Borkar <mitaliborkar810@gmail.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: Re: [PATCH v2 3/4] staging: media: intel-ipu3: reduce length of line
Message-ID: <YHV45I6ZDsXNwdiG@kali>
References: <cover.1618289130.git.mitaliborkar810@gmail.com>
 <f18b704654797e29f3bbbe49689eaa2c0ad28d59.1618289130.git.mitaliborkar810@gmail.com>
 <20210413100134.GR3@paasikivi.fi.intel.com>
 <YHV1uOq9pXmGUD+x@kali>
 <20210413104432.GU3@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210413104432.GU3@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Apr 13, 2021 at 01:44:32PM +0300, Sakari Ailus wrote:
> On Tue, Apr 13, 2021 at 04:13:04PM +0530, Mitali Borkar wrote:
> > On Tue, Apr 13, 2021 at 01:01:34PM +0300, Sakari Ailus wrote:
> > > Hi Mitali,
> > > 
> > > Thanks for the update.
> > > 
> > > On Tue, Apr 13, 2021 at 10:46:06AM +0530, Mitali Borkar wrote:
> > > > Reduced length of the line under 80 characters to meet linux-kernel
> > > > coding style.
> > > > 
> > > > Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> > > > ---
> > > > 
> > > > Changes from v1:- Reduced length of the line under 80 characters
> > > > 
> > > >  drivers/staging/media/ipu3/include/intel-ipu3.h | 3 ++-
> > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h b/drivers/staging/media/ipu3/include/intel-ipu3.h
> > > > index 6a72c81d2b67..52dcc6cdcffc 100644
> > > > --- a/drivers/staging/media/ipu3/include/intel-ipu3.h
> > > > +++ b/drivers/staging/media/ipu3/include/intel-ipu3.h
> > > > @@ -247,7 +247,8 @@ struct ipu3_uapi_ae_ccm {
> > > >   */
> > > >  struct ipu3_uapi_ae_config {
> > > >  	struct ipu3_uapi_ae_grid_config grid_cfg __aligned(32);
> > > > -	struct ipu3_uapi_ae_weight_elem weights[IPU3_UAPI_AE_WEIGHTS] __aligned(32);
> > > > +	struct ipu3_uapi_ae_weight_elem weights[IPU3_UAPI_AE_WEIGHTS]
> > > > +							__aligned(32);
> > > 
> > > Do you still have the other two patches in your tree? This doesn't apply
> > > here due to the different attribute syntax.
> > >
> > I have patch 1/6 and 2/6 in my tree which you asked me to drop.
> 
> Could you drop them and then submit v3?
>
I am extremely sorry Sir, but I am still learning to use git, drop them
means to delete those commits? Even if I delete those, this patch was
made after those, so the changes I made then will remain as it is, so
what to do now? 

> Thanks.
> 
> -- 
> Sakari Ailus
