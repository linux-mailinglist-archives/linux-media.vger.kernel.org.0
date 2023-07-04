Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4AEA746F10
	for <lists+linux-media@lfdr.de>; Tue,  4 Jul 2023 12:49:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230402AbjGDKtV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jul 2023 06:49:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229793AbjGDKtU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jul 2023 06:49:20 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EC31E62
        for <linux-media@vger.kernel.org>; Tue,  4 Jul 2023 03:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688467759; x=1720003759;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Fv5vSrN6EwcPnxhzxW6ssWiLfBF/EoGd++Ms4YzZQ2I=;
  b=WV78XooCNMWAIXFYdf5gE4hM6EQh8idipM3L5YOLNzE1KJy7qT4ny0jZ
   Q8jSEItfjdmlJnjwwb200rIEHiW7kRsJqgw4DKGqbx6w1RH3mPe4n1L2l
   ZgCm9nTsmF0X3l9HoFT1LOt8+bSshh010vhxfG0+/G9iwgopRhyhCCRrF
   arOXYJBi/xe6e4MFsamWJ00yLRcnB4PPTYyxXz00PNffw/lJ1BmcV3a4W
   6oNvqaIAA8ayj3DA8NU40hYnEtE0i480yF9MyVKogy2rkQkPy8+sZep4k
   7IYslqN9HXdbKp3+FOhSv5FUFZah74mpnK0pCReFaQSDGx0e5AsTqBcIY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="361957345"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="361957345"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2023 03:49:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="748387660"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="748387660"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2023 03:49:16 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 09E9311FBCE;
        Tue,  4 Jul 2023 13:49:13 +0300 (EEST)
Date:   Tue, 4 Jul 2023 10:49:12 +0000
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
Message-ID: <ZKP5KIXBVaLWetVH@kekkonen.localdomain>
References: <20230630110643.209761-1-hdegoede@redhat.com>
 <20230630110643.209761-13-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230630110643.209761-13-hdegoede@redhat.com>
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

On Fri, Jun 30, 2023 at 01:06:40PM +0200, Hans de Goede wrote:
> The GalaxyCore GC0310 is used together with the atomisp no various
> devices, add it to ipu_supported_sensors[].
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/media/pci/intel/ipu-bridge.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
> index eb7c56e8ef9f..07a34f20af8e 100644
> --- a/drivers/media/pci/intel/ipu-bridge.c
> +++ b/drivers/media/pci/intel/ipu-bridge.c
> @@ -36,6 +36,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
>  	IPU_SENSOR_CONFIG("INT3537", 1, 437000000),
>  	/* Omnivision ov13b10 */
>  	IPU_SENSOR_CONFIG("OVTIDB10", 1, 560000000),
> +	/* GalaxyCore GC0310 */
> +	IPU_SENSOR_CONFIG("INT0310", 0),


Where is this HID from? A DSDT somewhere??

>  };
>  
>  static const struct ipu_property_names prop_names = {

-- 
Kind regards,

Sakari Ailus
