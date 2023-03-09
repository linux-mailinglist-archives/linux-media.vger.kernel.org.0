Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A0EF6B242D
	for <lists+linux-media@lfdr.de>; Thu,  9 Mar 2023 13:28:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229895AbjCIM2m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Mar 2023 07:28:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229806AbjCIM2l (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Mar 2023 07:28:41 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2931AEBF8A
        for <linux-media@vger.kernel.org>; Thu,  9 Mar 2023 04:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678364919; x=1709900919;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1g7fG44vHO7uCX4+MQBsTa6j7u9ix4/AIhoaG91Q+Qg=;
  b=C9hViUbupmh10FkbEoeO8KvIXUapLdtdDSwY6/MMhY18K72ig41wsttX
   UtgooiapWqDqWSuihJOI9PJECr/vk8d5gQrIKl1leuSr+WbK4Nd+RZaii
   iqc2QJ77jHAUZVrNU12jkdVx7Xa2BKh73zh9rG+9B3lPoa9FYQLISOOLX
   Awk55fPH9mHlno+xoed1Wx+9Rkn7TOLaMtdgGAccHqtvdbhHkNPLMSEvz
   F4btDQvmggx44Q4la5JvA+DUcfty5ZBSBtQdzpQSg5RltT99hwYCB06Jm
   AhGze4xddvX/XafAZ9rWefIzuXpxzNx5WY8zficM9iSPySfBZqbJolJkO
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="324753029"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="324753029"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 04:28:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="654733532"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="654733532"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 04:28:36 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id F08B4120C21;
        Thu,  9 Mar 2023 14:28:33 +0200 (EET)
Date:   Thu, 9 Mar 2023 14:28:33 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kate Hsuan <hpa@redhat.com>
Subject: Re: [PATCH 1/1] media: v4l: subdev: Make link validation safer
Message-ID: <ZAnQ8ftpqHjXnMlZ@kekkonen.localdomain>
References: <441f2951-402b-0f3c-5ea6-8d6df3f3e894@redhat.com>
 <20230302202219.846011-1-sakari.ailus@linux.intel.com>
 <ba09d1c2-ddca-ff1a-28ae-7c8355f75012@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba09d1c2-ddca-ff1a-28ae-7c8355f75012@redhat.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Mar 09, 2023 at 01:09:11PM +0100, Hans de Goede wrote:
> Hi Sakari,
> 
> On 3/2/23 21:22, Sakari Ailus wrote:
> > Link validation currently accesses invalid pointers if the link passed to it
> > is not between two sub-devices. This is of course a driver bug.
> > 
> > Ignore the error but print a debug message, as this is how it used to work
> > previously.
> > 
> > Fixes: a6b995ed03ff ("media: subdev: use streams in v4l2_subdev_link_validate()")
> > Reported-by: Hans de Goede <hdegoede@redhat.com>
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> > Hi Hans,
> > 
> > Could you test this?
> 
> Yes, thank you for the fix.
> 
> I can confirm that this fixes the oops on my Surface Go 1 and
> that it makes the IPU3 attached cameras work again:
> 
> Tested-by: Hans de Goede <hdegoede@redhat.com>
> 
> or better just replace the Reported-by with:
> 
> Reported-and-tested-by: Hans de Goede <hdegoede@redhat.com>

Thanks!

I'm putting this to my fixes PR I'm about to send soon.

-- 
Sakari Ailus
