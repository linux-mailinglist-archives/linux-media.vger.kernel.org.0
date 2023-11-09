Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E23187E61EF
	for <lists+linux-media@lfdr.de>; Thu,  9 Nov 2023 02:53:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231187AbjKIBxr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Nov 2023 20:53:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229697AbjKIBxr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Nov 2023 20:53:47 -0500
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E293E269F
        for <linux-media@vger.kernel.org>; Wed,  8 Nov 2023 17:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699494824; x=1731030824;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=1Ar/lkEPxi4HJILFU9GAIA9OzsLN/dR11twIsOpGjiM=;
  b=d+AT2K7OSpydC0QhJGF1jXfwGluejLKONabBcie4o+UK8/RNgoy8sYXy
   uyaVeex4qq2NhWkHVt5iOrl8m8Xcjc6Zh3zc0ywQiNkMln/h2YnI7Hkcn
   80TaFag5xbXC5zM3vOb7PPPsyBBlpsaKn71F51SEUpCEOCrw2CiPMAfH1
   QHz3Qwy8fcq5Diu+qgnHJ9gqfj/32tXrJgg4GAGLuqEpA6TWISNT68rFy
   0a+/oz1q2stVn3X9E3ElI7wx2MLH6l/+6ST/ZfQ9pRSBXoGShQc8AZQlm
   nPoZKDmbI4c7nLOTp3pF98hqKfs06VyUUSum41wsarfaB4hLPSJUISLA9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="392772527"
X-IronPort-AV: E=Sophos;i="6.03,287,1694761200"; 
   d="scan'208";a="392772527"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2023 17:53:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,288,1694761200"; 
   d="scan'208";a="10998517"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.139]) ([10.238.232.139])
  by orviesa001.jf.intel.com with ESMTP; 08 Nov 2023 17:53:40 -0800
Subject: Re: [PATCH v2 08/15] media: intel/ipu6: add IPU6 CSI2 receiver v4l2
 sub-device
To:     "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        Andreas Helbech Kleist <andreaskleist@gmail.com>
Cc:     "Cao, Bingbu" <bingbu.cao@intel.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
        "claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>,
        "tfiga@chromium.org" <tfiga@chromium.org>,
        "senozhatsky@chromium.org" <senozhatsky@chromium.org>,
        "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
        "Wang, Hongju" <hongju.wang@intel.com>
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
 <20231024112924.3934228-9-bingbu.cao@intel.com>
 <7c0a91f986baf62efcf0f021924653a00cdcc503.camel@gmail.com>
 <DM8PR11MB565383A795F071F50B04D1BF99A8A@DM8PR11MB5653.namprd11.prod.outlook.com>
 <a22cea646d0d8b8022c3be8e4625d6e67a3eb7bf.camel@gmail.com>
 <ZUuqDS7xOJcLpXvy@smile.fi.intel.com>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <fe660f26-b18e-f612-21e4-df32c7841f1e@linux.intel.com>
Date:   Thu, 9 Nov 2023 09:48:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ZUuqDS7xOJcLpXvy@smile.fi.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Andy,

On 11/8/23 11:32 PM, andriy.shevchenko@linux.intel.com wrote:
> On Wed, Nov 08, 2023 at 04:00:02PM +0100, Andreas Helbech Kleist wrote:
>> On Wed, 2023-11-08 at 14:50 +0000, Cao, Bingbu wrote:
> 
> ...
> 
>> Now we're talking about casts. There is a cast to int32_t, but the rest
>> of the code uses the s32/u32 typedefs. I don't know if one or the other
>> is recommended for new code, but I think it should at least be
>> consistent across the driver.
> 
> s32/u32 are preferable in the kernel code.
> 
> Also if you need to extend the sign bit, we have sign_extendXX() helpers.

Ack, thanks. I will walk through the code and fix the casts in the driver.

> 

-- 
Best regards,
Bingbu Cao
