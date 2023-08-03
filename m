Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB62976E8D2
	for <lists+linux-media@lfdr.de>; Thu,  3 Aug 2023 14:52:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235702AbjHCMwq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Aug 2023 08:52:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234511AbjHCMwo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Aug 2023 08:52:44 -0400
Received: from mgamail.intel.com (unknown [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F02FC3A9A
        for <linux-media@vger.kernel.org>; Thu,  3 Aug 2023 05:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691067160; x=1722603160;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ycqLa0fO3lBu9iGc9LryDzh5XPpvGwTmQzCDPXfM1Cc=;
  b=U873tuOe3c8+jg+uAcJI7uqjx5zWn7sEqEhZvb1z+XiiH49kV6gYX3RH
   QXhSJBp+yMt7SPT/NrAqWlrXAfPkdY7AZnO+xm9ixmkhYgiYDUS0gu8bZ
   9aKpMT06rfsDZEyyADFqxnAtHrXCYj1KZbXK3L9gYmyV+sVKfjqsdC/pk
   Ltmz09jItbIKt9idLQRW7z7LfUpZTHNbAolHjwGWN2d7Y4Fx0Mb5p/Abq
   mQaeUp3cwz7zKSWkhAd3DM9eVOLGsbvV3rgjw9qJbqg08W6gaj6BvkAgV
   yHIj0SE/eo11vWAQA8Le4dkb46ENGiMUbs1+dzltOSxW9Ovk3r8Z2LPpw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="368760913"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="scan'208";a="368760913"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 05:52:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="732742537"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="scan'208";a="732742537"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 05:52:37 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 3DD441204CF;
        Thu,  3 Aug 2023 15:52:35 +0300 (EEST)
Date:   Thu, 3 Aug 2023 12:52:35 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v5 02/32] media: ov2680: Fix ov2680_bayer_order()
Message-ID: <ZMujE3Od0lzvuCml@kekkonen.localdomain>
References: <20230803093348.15679-1-hdegoede@redhat.com>
 <20230803093348.15679-3-hdegoede@redhat.com>
 <ZMuiAde+4OSlEEVz@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZMuiAde+4OSlEEVz@kekkonen.localdomain>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 03, 2023 at 12:48:01PM +0000, Sakari Ailus wrote:
> Hi Hans,
> 
> On Thu, Aug 03, 2023 at 11:33:17AM +0200, Hans de Goede wrote:
> > The index into ov2680_hv_flip_bayer_order[] should be 0-3, but
> > ov2680_bayer_order() was using 0 + BIT(2) + (BIT(2) << 1) as
> > max index, while the intention was to use: 0 + 1 + 2 as max index.
> > 
> > Fix the index calculation in ov2680_bayer_order(), while at it
> > also just use the ctrl values rather then reading them back using
> > a slow i2c-read transaction.
> > 
> > This also allows making the function void, since there now are
> > no more i2c-reads to error check.
> > 
> > Note the check for the ctrls being NULL is there to allow
> > adding an ov2680_fill_format() helper later, which will call
> > ov2680_set_bayer_order() during probe() before the ctrls are created.
> > 
> > Fixes: 3ee47cad3e69 ("media: ov2680: Add Omnivision OV2680 sensor driver")
> > Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> > Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
> > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> This doesn't seem to compile:
> 
> > /home/jenkins/linux/drivers/media/i2c/ov2680.c: In function                   
> 'ov2680_vflip_disable':                                                         
> > /home/jenkins/linux/drivers/media/i2c/ov2680.c:351:9: error: implicit         
> declaration of function 'ov2680_bayer_order'; did you mean                      
> 'ov2680_set_bayer_order'? [-Werror=implicit-function-declaration]               
> >   351 |  return ov2680_bayer_order(sensor);                                   
> >       |         ^~~~~~~~~~~~~~~~~~                                            
> >       |         ov2680_set_bayer_order                                        
> > cc1: some warnings being treated as errors                                    
> 
> I guess you missed converting some calls?

Actually the fix was trivial and the code is removed in the next patch
nonetheless. The change I made here was:

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index 621144f16fdc..60c4e575aa86 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -348,7 +348,8 @@ static int ov2680_vflip_disable(struct ov2680_dev *sensor)
 	if (ret < 0)
 		return ret;
 
-	return ov2680_bayer_order(sensor);
+	ov2680_set_bayer_order(sensor);
+	return 0;
 }
 
 static int ov2680_hflip_enable(struct ov2680_dev *sensor)
@@ -359,7 +360,8 @@ static int ov2680_hflip_enable(struct ov2680_dev *sensor)
 	if (ret < 0)
 		return ret;
 
-	return ov2680_bayer_order(sensor);
+	ov2680_set_bayer_order(sensor);
+	return 0;
 }
 
 static int ov2680_hflip_disable(struct ov2680_dev *sensor)

-- 
Sakari Ailus
