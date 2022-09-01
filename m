Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3D3B5AA08D
	for <lists+linux-media@lfdr.de>; Thu,  1 Sep 2022 21:59:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233346AbiIAT7g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Sep 2022 15:59:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232879AbiIAT7f (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Sep 2022 15:59:35 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D901883D6
        for <linux-media@vger.kernel.org>; Thu,  1 Sep 2022 12:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662062374; x=1693598374;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IxX0c/uDFyBM0ioa05lwfp0rWLGexYJhYM4gYbbZmA8=;
  b=SeK4NvHDZut3xBHj/u8icL9NMe+CaaY1vGLWHe0Lt8EuyU07TQCWSjO6
   WbxQRXj9MQFz7woymDpuAFXnhM1xuIwiKFWXoU1baBrfGGbDZSV8gtuTU
   drwEuzNkqTNMphQST6t1z40wXqMK+geEUfcHK+krTacJvhc4HD2vO3xps
   4FkUBvhTM0WAWJjJS8cHgNCQZ4Yo1BuKrZHIDEEgweMtuQeuEfcSYNv45
   rX5c1egW4RinXFr3OeNlKeE3Ywg/kHqCIGSpBUpSVuZnDPxg0+Nwty+Ub
   GHBJai2a7fnswKxXEJBKZMqoWS7zV8S9J4ZJ0LbTN1QyVJXUtyFi+DbZc
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="382113835"
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; 
   d="scan'208";a="382113835"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2022 12:59:34 -0700
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; 
   d="scan'208";a="612639640"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2022 12:59:31 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1oTqLY-0071cw-0s;
        Thu, 01 Sep 2022 22:59:28 +0300
Date:   Thu, 1 Sep 2022 22:59:28 +0300
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
Subject: Re: [PATCH 00/14] media: atomisp: More cleanups / code removal
Message-ID: <YxEPIAv2oNO3VV3p@smile.fi.intel.com>
References: <20220901094626.11513-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220901094626.11513-1-hdegoede@redhat.com>
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

On Thu, Sep 01, 2022 at 11:46:12AM +0200, Hans de Goede wrote:
> Hi Mauro,
> 
> Here is a second set of atomisp cleanups / code removal.
> This applies on top of my previous v2 series from here:
> https://lore.kernel.org/linux-media/20220822150610.45186-1-hdegoede@redhat.com/

I looked into the code (mostly commit message and patches that not only delete
the stuff) and it LGTM, hence
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

> I plan to do more atomisp work the coming few weeks. So I'm thinking
> it might be better / easier for you if I just send you a pull-req based
> on 6.0-rc1 with all atomisp patches bundled around rc5/rc6 time.
> 
> Would that work for you ?
> 
> I do plan to keep sending out (incremental) patch-sets with my work
> (like this one) for review / comments.

Perhaps it's a time you add yourself as AtomISP2 (co-?)maintainer?

-- 
With Best Regards,
Andy Shevchenko


