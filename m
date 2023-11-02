Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3E897DF3EE
	for <lists+linux-media@lfdr.de>; Thu,  2 Nov 2023 14:36:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbjKBNgF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Nov 2023 09:36:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbjKBNgE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Nov 2023 09:36:04 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 452B6A6
        for <linux-media@vger.kernel.org>; Thu,  2 Nov 2023 06:36:02 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="368919136"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="368919136"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 06:36:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="737749253"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="737749253"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 06:35:59 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC3)
        (envelope-from <andy@kernel.org>)
        id 1qyXrY-0000000AhOP-0uNt;
        Thu, 02 Nov 2023 15:35:56 +0200
Date:   Thu, 2 Nov 2023 15:35:55 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     "Cao, Bingbu" <bingbu.cao@intel.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Bingbu Cao <bingbu.cao@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [PATCH 11/12] media: intel-cio2-bridge: Add a runtime-pm
 device-link between VCM and sensor
Message-ID: <ZUOluxSV0eqZi9v9@smile.fi.intel.com>
References: <20230627175643.114778-1-hdegoede@redhat.com>
 <20230627175643.114778-12-hdegoede@redhat.com>
 <d1736dfb-e66c-2497-a71b-97f2e28f435f@linux.intel.com>
 <ZT9vfSpEyVk_pO0H@kekkonen.localdomain>
 <8ec5d2b6-8f35-48dd-bb09-4e214415d643@redhat.com>
 <ZT92LDE9z46kxX-h@kekkonen.localdomain>
 <DM8PR11MB565366E1CEB9BB5F8F1074CE99A7A@DM8PR11MB5653.namprd11.prod.outlook.com>
 <ZUH6RYayRSb-hykQ@kekkonen.localdomain>
 <DM8PR11MB56533C342B834265A3F64D1499A7A@DM8PR11MB5653.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM8PR11MB56533C342B834265A3F64D1499A7A@DM8PR11MB5653.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 01, 2023 at 07:38:24AM +0000, Cao, Bingbu wrote:

Side note: Can you please Cc me in your v2, I believe I have some comments,
but let's see a new version for them?

-- 
With Best Regards,
Andy Shevchenko


