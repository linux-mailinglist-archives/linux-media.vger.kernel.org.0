Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 737FC4B9E5F
	for <lists+linux-media@lfdr.de>; Thu, 17 Feb 2022 12:11:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239613AbiBQLKv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Feb 2022 06:10:51 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:52238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239631AbiBQLKr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Feb 2022 06:10:47 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 638C5295FF9
        for <linux-media@vger.kernel.org>; Thu, 17 Feb 2022 03:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645096233; x=1676632233;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jcM2ZnP4ZLMiFbCkkujintb4X4oaHr+JxMOg5JWIVXc=;
  b=kYvc/hbwMMyYy8gcoF6pjdLcUL8J+sy1hb+wWyV66v8GTKS+jK73+w/8
   8vigwSe1kjufqwtmlzqKPKHKPiYTq61o9B2NCPUsPluaqcMQ0KZYvmVFt
   NRLp1Z+H+QvSKDXsjqJMj31Lz+q42k/5em1ID5ZimPsYVJPZHgB6uhC+2
   NMdXBqmptDNe8UFaB2ZmTt423KtkfMmSdYYK4jL0gsyB3DdM/6q3ZYprj
   JIisKMHpv0L+SHwkKuSTX3PTk4VyV18KvJi7Nq93hYsfB82nm4a26x6vZ
   OcuemHeOqNAAtK+GiSGSdHjzLfxa+eEQBuMy+jIcrp5kGHQ3Oe3Luyqfv
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="275439837"
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; 
   d="scan'208";a="275439837"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2022 03:10:33 -0800
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; 
   d="scan'208";a="488123055"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2022 03:10:31 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 9408D2022A;
        Thu, 17 Feb 2022 13:10:29 +0200 (EET)
Date:   Thu, 17 Feb 2022 13:10:29 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Eugen.Hristev@microchip.com
Cc:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] microchip-csi2dc: Remove VC support for now
Message-ID: <Yg4tJfaXLx2VXUUc@paasikivi.fi.intel.com>
References: <20220202153609.240387-1-sakari.ailus@linux.intel.com>
 <20220208061129.158ba126@sal.lan>
 <ed240352-0588-d963-2b0a-7b65280e96b0@microchip.com>
 <YgJOqb06gmNhFw6X@pendragon.ideasonboard.com>
 <5168daa7-2f8b-fdbe-7a15-12de3428322a@microchip.com>
 <Ygv9SP2OpIHDtXfA@paasikivi.fi.intel.com>
 <c0676a4e-803f-9f1c-542b-4b007705ef3d@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c0676a4e-803f-9f1c-542b-4b007705ef3d@microchip.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Feb 15, 2022 at 08:10:18PM +0000, Eugen.Hristev@microchip.com wrote:
> On 2/15/22 9:21 PM, Sakari Ailus wrote:
> > Hi Eugen,
> > 
> > On Tue, Feb 08, 2022 at 11:36:16AM +0000, Eugen.Hristev@microchip.com wrote:
> >> I am sorry, I was referring to the get_mbus_config which was recently
> >> added, which in my case uses V4L2_MBUS_CSI2_CHANNEL_* .
> >> Without the get_mbus_config, I wasn't supposed to use the
> >> V4L2_MBUS_CSI2_CHANNEL_* at all .
> >> Hence my confusion in adding them into the same bucket.
> >>
> >> My driver uses these flags because my initial implementation to get the
> >> VC from the devicetree was rejected and this was suggested instead.
> > 
> > As noted by Laurent, this feature is not supported in mainline currently.
> > Beyond that, no transmitter driver uses virtual channel different from
> > zero, so the case for setting non-zero virtual channel in absence of
> > multiple streams does not exist.
> > 
> > Also the interfaces required to make use of multiple streams do not exist
> > in mainline at the moment. They will be added by the streams patchset
> > eventually, and adding support for them requires extra driver work.
> > 
> > Thus, we're not losing any functionality by dropping the defines and
> > potentially associated driver code. Therefore I see no reason to postpone
> > these patches.
> 
> Hi Sakari,
> 
> I understand. I am fine with the patch.

Thank you, Eugen.

-- 
Sakari Ailus
