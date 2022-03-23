Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BECF24E5490
	for <lists+linux-media@lfdr.de>; Wed, 23 Mar 2022 15:50:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237571AbiCWOwK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Mar 2022 10:52:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237456AbiCWOwI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Mar 2022 10:52:08 -0400
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE0897D01E;
        Wed, 23 Mar 2022 07:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648047036; x=1679583036;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=fwXFLMb5LodOP5kgRkOCP/0VMxHCoX9GTRZSvMm0BBc=;
  b=BrXGBxqo8+DAQGk9giAD6taP6DvBnUMPlXttb5vSpnrmwcJJxDxovu4z
   QRJxmaJp/5rgkRC47Jfo2CDN8lku2GNMUWKc0DLkdJ5rzvQRZLk+ZwubS
   zxqmfgZ+t+WjRKHZ9UcN1rcqFXObVHRvYiok0FES/Jb0S98f7F6muJtMt
   fYeHgtSkbTEpylM97Bo7FqXjyRNtTGGXQ2+qfIpT71w7jP8WO1rWdgPlG
   FSiiJKgBZk/2EUUpbtdS9PdeXqeAphY/i4A3DijNdjZiY8rq0/tczSAK9
   iPnyb+8shHfMDLWM9iyvTYY0jQS10PaOyGANzncLvvKrkAHs+pT/vDX6A
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10295"; a="318836459"
X-IronPort-AV: E=Sophos;i="5.90,204,1643702400"; 
   d="scan'208";a="318836459"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2022 07:50:36 -0700
X-IronPort-AV: E=Sophos;i="5.90,204,1643702400"; 
   d="scan'208";a="544221372"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2022 07:50:35 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id EB7362012F;
        Wed, 23 Mar 2022 16:50:32 +0200 (EET)
Date:   Wed, 23 Mar 2022 16:50:32 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        robh@kernel.org
Subject: Re: [PATCH 2/2] dw9807-vcm: Add "dongwoon,dw9807" compatible string
Message-ID: <YjszuFazVgIBw3gl@paasikivi.fi.intel.com>
References: <20220318165119.12191-1-sakari.ailus@linux.intel.com>
 <20220318165119.12191-3-sakari.ailus@linux.intel.com>
 <7e937551-fba4-760d-f3ce-16f811e10bd8@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7e937551-fba4-760d-f3ce-16f811e10bd8@kernel.org>
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Krysztof,

On Sun, Mar 20, 2022 at 12:58:08PM +0100, Krzysztof Kozlowski wrote:
> On 18/03/2022 17:51, Sakari Ailus wrote:
> > There is firmware out there that uses "dongwoon,dw9807" compatible string
> > that never made it to upstream as-is. Add it to the driver to make it load
> > on such systems.
> > 
> > The chip also has an EEPROM part which is AT24 compatible (for reading
> > purposes) on a separate I²C address. Adding possible support for this in
> > the future is not affected by this change.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/i2c/dw9807-vcm.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/media/i2c/dw9807-vcm.c b/drivers/media/i2c/dw9807-vcm.c
> > index 95e06f13bc9ed..ada8e467a0450 100644
> > --- a/drivers/media/i2c/dw9807-vcm.c
> > +++ b/drivers/media/i2c/dw9807-vcm.c
> > @@ -295,6 +295,8 @@ static int  __maybe_unused dw9807_vcm_resume(struct device *dev)
> >  
> >  static const struct of_device_id dw9807_of_table[] = {
> >  	{ .compatible = "dongwoon,dw9807-vcm" },
> > +	/* Compatibility for older firmware */
> > +	{ .compatible = "dongwoon,dw9807" },
> 
> You need to add it to the bindings as well.

Why? Generally things that are there for binary compatibility but
deprecated are not documented in bindings.

-- 
Sakari Ailus
