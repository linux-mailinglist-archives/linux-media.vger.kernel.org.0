Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A63F97D66C4
	for <lists+linux-media@lfdr.de>; Wed, 25 Oct 2023 11:29:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233957AbjJYJ27 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Oct 2023 05:28:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233714AbjJYJ26 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Oct 2023 05:28:58 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29B86DE
        for <linux-media@vger.kernel.org>; Wed, 25 Oct 2023 02:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698226136; x=1729762136;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5m1fR6bdGcwzZ15VRMIAnlflUe0s7FJIRx4yGGjAZIE=;
  b=dBQ7otdVyuP2ePfwSgAWWsKWMe4w/xvYuGaRMjldbxuTGKX+z3xqdrSJ
   VyiPzB6F5lD381a5SZxnVacN8ptkwp9w8F+RAEqNeVxqFxnpUe9LZ+zws
   WLyWoJVWH5h7ZLeeDIHGrwh0k33+nxTiEJ0LFKbgQINsrQ4IxtpzrnVTP
   YNp0KyJJYM7cYPs3v8m78t8e0rxpxjWhoZWPcH+cTVxbVa0X624etNY5k
   QJCsHsjZJAvl2rM20TgBPuO6wBW2GoH8Zp0sv/IkG99V9oCod6m8Vi0Qi
   Sew3DcOVFhuhDGV/2dOuFKZEvjaVhoBMZ684tVQ/NZSibYNjHU+fz4W8k
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="473508802"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="473508802"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 02:28:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="1005946638"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="1005946638"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 02:28:52 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id E569611F89D;
        Wed, 25 Oct 2023 12:28:49 +0300 (EEST)
Date:   Wed, 25 Oct 2023 09:28:49 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        Umang Jain <umang.jain@ideasonboard.com>,
        linux-staging@lists.linux.dev
Cc:     linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Carpenter <error27@gmail.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "Ricardo B . Marliere" <ricardo@marliere.net>
Subject: Re: [PATCH 1/1] staging: vc04_services: Use %p4cc format modifier to
 print FourCC codes
Message-ID: <ZTjf0fT0yl2cwGWJ@kekkonen.localdomain>
References: <20231025060717.71895-1-umang.jain@ideasonboard.com>
 <20231025060717.71895-2-umang.jain@ideasonboard.com>
 <bd7f3a75-598a-428e-85c3-8dd867043c1f@kadam.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd7f3a75-598a-428e-85c3-8dd867043c1f@kadam.mountain>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 25, 2023 at 10:10:08AM +0300, Dan Carpenter wrote:
> On Wed, Oct 25, 2023 at 02:07:17AM -0400, Umang Jain wrote:
> > Drop VCHIQ_FOURCC_AS_4CHARS macro in favour of %p4cc format
> > modifier to print FourCC codes in the logs.
> > 
> > vchiq_use_internal() and vchiq_release_internal() uses entity
> > character-array to store a transient string that contains
> > a FourCC code. Increase the length of entity array(to 64 bytes)
> > since %p4cc requires more bytes to hold the output characters.
> > 
> > Suggested-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> > Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> > ---
> >  .../interface/vchiq_arm/vchiq_arm.c           | 20 +++++-----
> >  .../interface/vchiq_arm/vchiq_core.c          | 40 +++++++++----------
> >  .../interface/vchiq_arm/vchiq_core.h          |  6 ---
> >  .../interface/vchiq_arm/vchiq_dev.c           |  7 ++--
> >  4 files changed, 33 insertions(+), 40 deletions(-)
> > 
> > diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > index fc6d33ec5e95..de6a24304a4d 100644
> > --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > @@ -1441,7 +1441,7 @@ vchiq_use_internal(struct vchiq_state *state, struct vchiq_service *service,
> >  {
> >  	struct vchiq_arm_state *arm_state = vchiq_platform_get_arm_state(state);
> >  	int ret = 0;
> > -	char entity[16];
> > +	char entity[64];
> >  	int *entity_uc;
> >  	int local_uc;
> >  
> > @@ -1454,8 +1454,8 @@ vchiq_use_internal(struct vchiq_state *state, struct vchiq_service *service,
> >  		sprintf(entity, "VCHIQ:   ");
> >  		entity_uc = &arm_state->peer_use_count;
> >  	} else if (service) {
> > -		sprintf(entity, "%c%c%c%c:%03d",
> > -			VCHIQ_FOURCC_AS_4CHARS(service->base.fourcc),
> > +		sprintf(entity, "%p4cc:%03d",
> 
> Not related to your patch but these sprintfs() make me very
> uncomfortable.
> 
> KTODO: change sprintf() to snprintf() in staging/vc04_services/

Umang: how about one patch on top of this? :-) There are just five
instances of it.

-- 
Sakari Ailus
