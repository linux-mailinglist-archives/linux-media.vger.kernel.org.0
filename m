Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68DB2632944
	for <lists+linux-media@lfdr.de>; Mon, 21 Nov 2022 17:19:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbiKUQTi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Nov 2022 11:19:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbiKUQTg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Nov 2022 11:19:36 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8FD5C689D
        for <linux-media@vger.kernel.org>; Mon, 21 Nov 2022 08:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669047575; x=1700583575;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ofycyJ2XvhOqqgWY/qx5sCtxX6B6nK7QZ1PHfT3l5dc=;
  b=CHvE9OuK5Y+83u/9CKxfXoSQFyrRkoDpOfS9roKynuOlFl3b/mFj22Qp
   1zT/fva2nsNa1pLXuav3jrgoIv70iYhEtNJNPaLoawm37r8TbCrud922s
   JKtnpaarLss6Ru2Tph4oDfYjtGSiIc6TcUaAotyNmWDmzFFr/YV/CLwnv
   z23+DbTmv8P3lQYFXChac4wNLhQCicvOqKO3DU/Qe7lNHKcGkoNaNeVhi
   07C2+hL9zHlgODct5HT10MuEIBN12dEZdO+BdZtgp6QJJphsa5SXqcW1x
   +5+eMLIn4kasKWWE+sBxAB2ashxeq2UAJnw6xQ8L3uHcggmMzbYSGdtUm
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="293987501"
X-IronPort-AV: E=Sophos;i="5.96,181,1665471600"; 
   d="scan'208";a="293987501"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2022 08:19:35 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="766014399"
X-IronPort-AV: E=Sophos;i="5.96,181,1665471600"; 
   d="scan'208";a="766014399"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2022 08:19:32 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 225132015F;
        Mon, 21 Nov 2022 18:19:31 +0200 (EET)
Date:   Mon, 21 Nov 2022 16:19:31 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: Re: [PATCH v2] media: mt9p031: Increase post-reset delay
Message-ID: <Y3ulEzRbLcJWBWsm@paasikivi.fi.intel.com>
References: <20220823222216.411656-1-marex@denx.de>
 <8d9a6e49-fde7-74a3-a2c7-adc370dfade6@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d9a6e49-fde7-74a3-a2c7-adc370dfade6@denx.de>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marek,

On Sun, Nov 20, 2022 at 02:55:22PM +0100, Marek Vasut wrote:
> On 8/24/22 00:22, Marek Vasut wrote:
> > The MT9P006 sensor driver sporadically fails to probe because the sensor
> > responds with a NACK condition to I2C address on the bus during an attempt
> > to read the sensor MT9P031_CHIP_VERSION register in mt9p031_registered().
> > 
> > Neither the MT9P006 nor MT9P031 datasheets are clear on reset signal timing.
> > Older MT9M034 [1] datasheet provides those timing figures in Appendix-A and
> > indicates it is necessary to wait 850000 EXTCLK cycles before starting any
> > I2C communication.
> > 
> > Add such a delay, which does make the sporadic I2C NACK go away, so it is
> > likely similar constraint applies to this sensor.
> > 
> > [1] https://www.onsemi.com/pdf/datasheet/mt9m034-d.pdf
> > 
> > Signed-off-by: Marek Vasut <marex@denx.de>
> > ---
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Cc: Stefan Riedmueller <s.riedmueller@phytec.de>
> > ---
> > V2: - In case clk_get_rate() returns 0, use slowest supported clock
> >        to avoid division by zero
> 
> Any news on this patch ?

Thanks for the ping. It's in my tree now.

-- 
Kind regards,

Sakari Ailus
