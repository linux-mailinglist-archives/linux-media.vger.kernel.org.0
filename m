Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBF714349F0
	for <lists+linux-media@lfdr.de>; Wed, 20 Oct 2021 13:18:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230137AbhJTLVL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Oct 2021 07:21:11 -0400
Received: from mga14.intel.com ([192.55.52.115]:51621 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229864AbhJTLVK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Oct 2021 07:21:10 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10142"; a="229026478"
X-IronPort-AV: E=Sophos;i="5.87,166,1631602800"; 
   d="scan'208";a="229026478"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2021 04:18:56 -0700
X-IronPort-AV: E=Sophos;i="5.87,166,1631602800"; 
   d="scan'208";a="718919085"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2021 04:18:55 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 1543D202B4;
        Wed, 20 Oct 2021 14:18:53 +0300 (EEST)
Date:   Wed, 20 Oct 2021 14:18:53 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Qing Wang <wangqing@vivo.com>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH V3] media: i2c: ccs: replace snprintf in show functions
 with sysfs_emit
Message-ID: <YW/7HRMQ1CMY2zNy@paasikivi.fi.intel.com>
References: <1634696055-55861-1-git-send-email-wangqing@vivo.com>
 <163472325682.2382401.4060377847168062683@Monstersaurus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <163472325682.2382401.4060377847168062683@Monstersaurus>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 20, 2021 at 10:47:36AM +0100, Kieran Bingham wrote:
> Hi Qing,
> 
> Quoting Qing Wang (2021-10-20 03:14:15)
> > show() should not use snprintf() when formatting the value to be
> > returned to user space.
> > 
> > Fix the following coccicheck warning:
> > drivers/media/i2c/ccs/ccs-core.c:3761: WARNING: use scnprintf or sprintf.
> > 
> > V3:
> > - Fix some formatting problems.
> 
> This could go below the --- so that it doesn't get entered into the
> commit itself, but I suspect that can be handled while applying. Not
> sure what the preferences are for that.

You're right in saying it needs to be after '---' line. But no need to
resend for that.

> 
> Anyway, thank you for updating with my suggestions.
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> > 
> > Signed-off-by: Qing Wang <wangqing@vivo.com>
> > ---
> >  drivers/media/i2c/ccs/ccs-core.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> > index 5363f3b..9158d3c
> > --- a/drivers/media/i2c/ccs/ccs-core.c
> > +++ b/drivers/media/i2c/ccs/ccs-core.c
> > @@ -2758,13 +2758,13 @@ ident_show(struct device *dev, struct device_attribute *attr, char *buf)
> >         struct ccs_module_info *minfo = &sensor->minfo;
> >  
> >         if (minfo->mipi_manufacturer_id)
> > -               return snprintf(buf, PAGE_SIZE, "%4.4x%4.4x%2.2x\n",
> > -                               minfo->mipi_manufacturer_id, minfo->model_id,
> > -                               minfo->revision_number) + 1;
> > +               return sysfs_emit(buf, "%4.4x%4.4x%2.2x\n",
> > +                                 minfo->mipi_manufacturer_id, minfo->model_id,
> > +                                 minfo->revision_number) + 1;
> >         else
> > -               return snprintf(buf, PAGE_SIZE, "%2.2x%4.4x%2.2x\n",
> > -                               minfo->smia_manufacturer_id, minfo->model_id,
> > -                               minfo->revision_number) + 1;
> > +               return sysfs_emit(buf, "%2.2x%4.4x%2.2x\n",
> > +                                 minfo->smia_manufacturer_id, minfo->model_id,
> > +                                 minfo->revision_number) + 1;
> >  }
> >  static DEVICE_ATTR_RO(ident);
> >  
> > -- 
> > 2.7.4
> >

-- 
Sakari Ailus
