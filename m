Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1032636629
	for <lists+linux-media@lfdr.de>; Wed, 23 Nov 2022 17:50:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238106AbiKWQuH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Nov 2022 11:50:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235632AbiKWQuG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Nov 2022 11:50:06 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64D5097A95
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 08:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669222206; x=1700758206;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FVWJ52C08lQI5duJRdrh8VZWbRHWdly/1DOjlluqf9E=;
  b=XTRqESOu2o/5UgvwAV0Pa+8SJjjaeInu23v+VJkCZLvicUgAiYmtIIQd
   lY2YxpTHE3zRwmn9iA5Osuxp3lNQT5bPhOPfdaGfRAOV3mljUgy4sOOkf
   KoACJTTcoZEZQ3QgEbctv16FvZgGsMUAVBE3SCx2WjABksIGBVzh/Us6+
   iL2Mb+pFydKLxlcjLBsxbla/bhJE1ve+1rOBQUA7qvVFFbAvE7czsDoL8
   8CVLS951O3zdw3L006IvJWKLSn1dMBBwmr1oVBg7Z+FnFX9Hliz5oNSGR
   rXSuGJED1qX1UzREieOz66FFGdFYLqrE/HXlv6Qv6vXqKW+OVQdwIxJqQ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="314145119"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; 
   d="scan'208";a="314145119"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2022 08:50:06 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="592579214"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; 
   d="scan'208";a="592579214"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2022 08:50:04 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 06D2B20207;
        Wed, 23 Nov 2022 18:50:02 +0200 (EET)
Date:   Wed, 23 Nov 2022 16:50:01 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Add Hans de Goede as staging/atomisp
 maintainer
Message-ID: <Y35POV42NRUIUQe3@paasikivi.fi.intel.com>
References: <20221123161447.15834-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221123161447.15834-1-hdegoede@redhat.com>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 23, 2022 at 05:14:47PM +0100, Hans de Goede wrote:
> Add myself as maintainer for the drivers/staging/media/atomisp code.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
