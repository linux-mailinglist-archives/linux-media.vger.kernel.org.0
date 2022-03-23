Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F34604E5556
	for <lists+linux-media@lfdr.de>; Wed, 23 Mar 2022 16:34:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245194AbiCWPfZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Mar 2022 11:35:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245275AbiCWPfW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Mar 2022 11:35:22 -0400
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B6767A98C;
        Wed, 23 Mar 2022 08:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648049628; x=1679585628;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=UUvy3PmLdXRoXIoIHmStQjl4OzUkEA0LzuGBcPCBCiU=;
  b=VXQ7MM4BcXXPvd1ScLJbSqpvXxu3I8DG6kd+H7exaD9aRXvJlhALD9vf
   1IGMVlt4PN1WW0Ocm4qqk8sGdCZWzAgakWtiG7fhQYSJGGBWf3Y0vkZCe
   2MBuA4/S+KM3gJMkDWVOLar/tSuF9deO6n70Xxaaw4rVRyw6+YMTOJdb5
   STTv5BCY9Y93ablYG3IMB90NmJ1nmdezNTBoZBGfyywU1RVuGaqSOy7qz
   iH5LYQO0eILMb3o4W37XlxP/O4vE1yRu4QUolTUPjkumQH0QrXsrt6JNn
   Kl2rdc9iws8kFi4sKc+lhNLehyYwB+fGV0sCU3mANGAoUllAo8DZiGjM3
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10295"; a="318847029"
X-IronPort-AV: E=Sophos;i="5.90,204,1643702400"; 
   d="scan'208";a="318847029"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2022 08:33:47 -0700
X-IronPort-AV: E=Sophos;i="5.90,204,1643702400"; 
   d="scan'208";a="501038440"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2022 08:33:46 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 8D7C6204A8;
        Wed, 23 Mar 2022 17:33:44 +0200 (EET)
Date:   Wed, 23 Mar 2022 17:33:44 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        robh@kernel.org
Subject: Re: [PATCH 2/2] dw9807-vcm: Add "dongwoon,dw9807" compatible string
Message-ID: <Yjs92Ol/S/K5qlPX@paasikivi.fi.intel.com>
References: <20220318165119.12191-1-sakari.ailus@linux.intel.com>
 <20220318165119.12191-3-sakari.ailus@linux.intel.com>
 <7e937551-fba4-760d-f3ce-16f811e10bd8@kernel.org>
 <YjszuFazVgIBw3gl@paasikivi.fi.intel.com>
 <c51c156a-4e70-86ca-8fe6-a03fbad258f7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c51c156a-4e70-86ca-8fe6-a03fbad258f7@kernel.org>
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Mar 23, 2022 at 03:59:03PM +0100, Krzysztof Kozlowski wrote:
> On 23/03/2022 15:50, Sakari Ailus wrote:
> > Hi Krysztof,
> > 
> > On Sun, Mar 20, 2022 at 12:58:08PM +0100, Krzysztof Kozlowski wrote:
> >> On 18/03/2022 17:51, Sakari Ailus wrote:
> >>> There is firmware out there that uses "dongwoon,dw9807" compatible string
> >>> that never made it to upstream as-is. Add it to the driver to make it load
> >>> on such systems.
> >>>
> >>> The chip also has an EEPROM part which is AT24 compatible (for reading
> >>> purposes) on a separate I�C address. Adding possible support for this in
> >>> the future is not affected by this change.
> >>>
> >>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> >>> ---
> >>>  drivers/media/i2c/dw9807-vcm.c | 2 ++
> >>>  1 file changed, 2 insertions(+)
> >>>
> >>> diff --git a/drivers/media/i2c/dw9807-vcm.c b/drivers/media/i2c/dw9807-vcm.c
> >>> index 95e06f13bc9ed..ada8e467a0450 100644
> >>> --- a/drivers/media/i2c/dw9807-vcm.c
> >>> +++ b/drivers/media/i2c/dw9807-vcm.c
> >>> @@ -295,6 +295,8 @@ static int  __maybe_unused dw9807_vcm_resume(struct device *dev)
> >>>  
> >>>  static const struct of_device_id dw9807_of_table[] = {
> >>>  	{ .compatible = "dongwoon,dw9807-vcm" },
> >>> +	/* Compatibility for older firmware */
> >>> +	{ .compatible = "dongwoon,dw9807" },
> >>
> >> You need to add it to the bindings as well.
> > 
> > Why? Generally things that are there for binary compatibility but
> > deprecated are not documented in bindings.
> 
> Because:
> 1. Otherwise it will get removed by someone as undocumented, unknown
> stuff. Someone might treat it as mistake.
> 2. Putting it in the driver code is already self-documenting, so someone
> might start using it. This should be clearly discouraged and bindings
> help in it - the compatible is marked as deprecated with the comment you
> mentioned.

That's why there's a comment. I could add a warning telling not to use it
anywhere.

This really does not belong to bindings.

> 3. Bindings are used beyond Linux kernel, so they might document
> something more than we use here in DT.

-- 
Sakari Ailus
