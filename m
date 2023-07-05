Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E7FB7482FE
	for <lists+linux-media@lfdr.de>; Wed,  5 Jul 2023 13:39:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231334AbjGELjB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jul 2023 07:39:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229850AbjGELjA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jul 2023 07:39:00 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A5631706
        for <linux-media@vger.kernel.org>; Wed,  5 Jul 2023 04:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688557139; x=1720093139;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FE8LM79e6Ir3xSKI1MLiO7HoSXOZ59I1kRUZuQVnXAU=;
  b=Rd4NknTylxbtWNXAXaQUJ5cC3Icfgo8vwpcw3q3MMK6L5AoMVqpo6dpm
   Q7DK/J7k4LL6j9j2jfu7D2k0Mg1uVjcTnQFzvPVkQcAekgR92gTv8RDDz
   l/zg/HyaohHOYeP6DbbLQeXpBs8rgrP5rRajMvoRUW3tmUzOCRjHgsaAZ
   wws4WyhpKabdVan5v/wPJ+6dykv7sIATgpuzJQlAg9EIfU5syNNez7XM2
   4yXuDr+xpVnbyMIPNUMwMYtRjswil+Phh8jhuzmA/ahNp38/U7Z2tHClb
   jtwMtzp5fRdME2+4Mp6DZMriFlAOOlmPlPlyzNLvKHpOqOSTu3iGPvu/X
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="366801627"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="366801627"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2023 04:38:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="696421769"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="696421769"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2023 04:38:55 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 43C2911FB8E;
        Wed,  5 Jul 2023 14:38:51 +0300 (EEST)
Date:   Wed, 5 Jul 2023 11:38:51 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2 12/15] media: ipu-bridge: Add GalaxyCore GC0310 to
 ipu_supported_sensors[]
Message-ID: <ZKVWSzKrddTNe048@kekkonen.localdomain>
References: <20230630110643.209761-1-hdegoede@redhat.com>
 <20230630110643.209761-13-hdegoede@redhat.com>
 <ZKP5KIXBVaLWetVH@kekkonen.localdomain>
 <80024c5b-d35b-96ac-ff5b-1e013c3ef113@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <80024c5b-d35b-96ac-ff5b-1e013c3ef113@redhat.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Tue, Jul 04, 2023 at 12:59:53PM +0200, Hans de Goede wrote:
> Hi Sakari,
> 
> On 7/4/23 12:49, Sakari Ailus wrote:
> > Hi Hans,
> > 
> > On Fri, Jun 30, 2023 at 01:06:40PM +0200, Hans de Goede wrote:
> >> The GalaxyCore GC0310 is used together with the atomisp no various
> >> devices, add it to ipu_supported_sensors[].
> >>
> >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >> ---
> >>  drivers/media/pci/intel/ipu-bridge.c | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
> >> index eb7c56e8ef9f..07a34f20af8e 100644
> >> --- a/drivers/media/pci/intel/ipu-bridge.c
> >> +++ b/drivers/media/pci/intel/ipu-bridge.c
> >> @@ -36,6 +36,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
> >>  	IPU_SENSOR_CONFIG("INT3537", 1, 437000000),
> >>  	/* Omnivision ov13b10 */
> >>  	IPU_SENSOR_CONFIG("OVTIDB10", 1, 560000000),
> >> +	/* GalaxyCore GC0310 */
> >> +	IPU_SENSOR_CONFIG("INT0310", 0),
> > 
> > 
> > Where is this HID from? A DSDT somewhere??
> 
> This is used in many atomisp DSDTs on many atomisp devices,
> see below for a quick grep to my no disk "database" of DSDTs.
> 
> This is also already used by the existing gc0310 driver for
> atomisp:
> 
> https://git.linuxtv.org/media_stage.git/tree/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> 
> Note with the latest media_stage.git branch, which has
> my "[GIT PULL] media: atomisp: Changes for 6.5-1" merged:
> 
> https://lore.kernel.org/linux-media/4177be8a-7a77-c452-7b98-91d5e5af8e8b@redhat.com/
> 
> The gc0310 driver is now a fully standard v4l2 driver no longer using any
> atomisp-isms / custom API. As such I have a patch pending to move
> it to drivers/media/i2c :
> 
> https://lore.kernel.org/linux-media/20230525190100.130010-6-hdegoede@redhat.com/
> 
> that patch is waiting for you to ack (or merge) it. Note if you chose to merge this
> yourself, this should be applied on top of the latest media_stage/master
> not on top of 6.4-rc1 .

Ack, thanks for the info. This seems to be from a different range than the
newer ones with INT34 prefix. Must be an older allocation I guess.

> 
> Regards,
> 
> Hans
> 
> p.s.
> 
> The promised list of matching DSDT-s. Note not all of these necessary actually
> use the sensor (but some do) let me know if you want a DSDT of a device which
> actually uses the GC0310 :

With the above explanation, I have no concerns.

Thanks.

-- 
Kind regards,

Sakari Ailus
