Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D62945B590D
	for <lists+linux-media@lfdr.de>; Mon, 12 Sep 2022 13:12:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230222AbiILLMJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Sep 2022 07:12:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230186AbiILLMI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Sep 2022 07:12:08 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFB3E25EB8
        for <linux-media@vger.kernel.org>; Mon, 12 Sep 2022 04:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662981125; x=1694517125;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=V0MvIQM7UUUrtqPLAtd6ppjVH1qbfAZVSmHo17lME3k=;
  b=IHvwjW31VMQqkTyxm3t6mN3fN3vJngwEXZjuH85Lo0NG/D28Kmycaceu
   Y3Mly2hDGOb2IzYH22+ZlBmVmCQRqdf4PVy+qmil0xmi1OfekT9oH0s5b
   /r/om4cDVKspMqeZSo0E3QQMrCsgp0dsZ0gHsZaC23IQs1pFphhQ28BDH
   9SHCNI/PW289G0151TRXgG30gdHDsmJ69IZXLiU/l76yogROGnOW8B0GL
   62uvD4rbaDLKch/gJ4TNMJQFJJEGK7GoIkXvQ0i7v9hw5E844HCS5Zi8c
   yhMPIWt+crJrPV4eQzZrPFVdajlXGRgEm17USt+Ysi9qTs/FQL12oakf8
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10467"; a="278231007"
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; 
   d="scan'208";a="278231007"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2022 04:12:05 -0700
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; 
   d="scan'208";a="593450970"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2022 04:12:02 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1oXhM7-001JgB-0l;
        Mon, 12 Sep 2022 14:11:59 +0300
Date:   Mon, 12 Sep 2022 14:11:58 +0300
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 01/17] media: atomisp: Use a normal mutex for the main
 lock
Message-ID: <Yx8T/uEKvVDoCvsT@smile.fi.intel.com>
References: <20220911171653.568932-1-hdegoede@redhat.com>
 <20220911171653.568932-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220911171653.568932-2-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Sep 11, 2022 at 07:16:37PM +0200, Hans de Goede wrote:
> There is no reason for atomisp to use a rt_mutex instead of a normal
> mutex, so switch over to a normal mutex.
> 
> All the changes in this patch are just s/rt_mutex/mutex/.
> 
> This is a preparation patch for switching the ioctl locking over
> to using the video_dev.lock member so that the v4l2-core takes
> care of the locking.

So the idea behind rt_mutex here is to inherit the priority on the task.
I'm wondering what could be possible the bottle neck this is trying to
solve. If there is no other V4L2 driver that does the same, any specific
run flow of AtomISP v2 code that may suffer of this?

-- 
With Best Regards,
Andy Shevchenko


