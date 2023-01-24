Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B728A67989F
	for <lists+linux-media@lfdr.de>; Tue, 24 Jan 2023 13:53:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234047AbjAXMxO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Jan 2023 07:53:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234146AbjAXMxC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Jan 2023 07:53:02 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05809460A6
        for <linux-media@vger.kernel.org>; Tue, 24 Jan 2023 04:52:23 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="412517350"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="412517350"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 04:50:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="612035726"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="612035726"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 24 Jan 2023 04:50:43 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1pKIl6-00ELPr-33;
        Tue, 24 Jan 2023 14:50:40 +0200
Date:   Tue, 24 Jan 2023 14:50:40 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 33/57] media: atomisp: ov2680: Add test pattern control
Message-ID: <Y8/UIGo3dVA5hysn@smile.fi.intel.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-34-hdegoede@redhat.com>
 <Y87WBHnxz7atGdge@smile.fi.intel.com>
 <ed0aa535-d4c5-5d5a-1964-991cbd1d8d45@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed0aa535-d4c5-5d5a-1964-991cbd1d8d45@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_SOFTFAIL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jan 24, 2023 at 12:27:55PM +0100, Hans de Goede wrote:
> On 1/23/23 19:46, Andy Shevchenko wrote:
> > On Mon, Jan 23, 2023 at 01:51:41PM +0100, Hans de Goede wrote:
> >> Add a test pattern control. This is a 1:1 copy of the test pattern
> >> control in the main drivers/media/i2c/ov2680.c driver.
> > 
> > Hmm... I'm not sure I understand the trend of the changes.
> > We have two drivers of the same sensor, correct?
> > So, the idea is to move the AtomISP-specific one to be like
> > the generic and then kill it eventually?
> 
> The goal is to kill one eventually yes. I'm not sure which
> one to kill yet though. I have actually found a whole bunch
> of bugs in the main drivers/media/i2c/ov2680.c code and
> given its buggy-ness I wonder if anyone is actually using it.
> 
> I need to start an email thread about this (and a couple of
> other open questions which I have), I have a bunch of notes
> which I need to turn into emails for this.
> 
> > If so, why do we add something here?
> 
> Because I suspect that the atomisp version might eventually
> be the one we want to keep (and move to drivers/media/i2c).

Fine, just add a few words into cover letter.

Btw, do you use `b4` tool to handle patch(es) series?
It has a nice feature to handle a series as a PR. In
that case the cover letter becomes a merge-commit message
which is cool feature in my opinion.

-- 
With Best Regards,
Andy Shevchenko


