Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 324566A9D00
	for <lists+linux-media@lfdr.de>; Fri,  3 Mar 2023 18:18:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231397AbjCCRSV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Mar 2023 12:18:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231549AbjCCRSI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Mar 2023 12:18:08 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 460D026BC
        for <linux-media@vger.kernel.org>; Fri,  3 Mar 2023 09:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677863886; x=1709399886;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J1I5CKDV+SZQ91g+j2ifXe8hMJKLIy7RRMluUxv+DAI=;
  b=aXJNixdK3Yo8zkrt7hksnbE1xWFx8xoBOiQ2uApERe+7swKZfYBm/eGB
   paRoxKDYrWKry8CHx4g+cmZadb7EHn/FU+0E+Cw16Su3qb9jgm2WziQhY
   jMrMJiIQibCDFeCaN/j6F50Ut6fvqXLSJ2+sSAb840UJcgmeJI4wpw/80
   ft8lNTOzaktWsZs2HI6i35cguaSQWMbWpiopQz+2ZpLbN1ZVz7x9mZ5WF
   jDzvszdLY6JXdp7bAy+YiIwwctAXN3LoEKLWuJ5lO/jejr9I1gNenszcO
   /QBx3Cfe+AhLrPgKR7rttlDXYhAbFh6MzPdOwHGzm1R7KNNmhG/bMSF1m
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="399909666"
X-IronPort-AV: E=Sophos;i="5.98,231,1673942400"; 
   d="scan'208";a="399909666"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2023 09:18:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="739569650"
X-IronPort-AV: E=Sophos;i="5.98,231,1673942400"; 
   d="scan'208";a="739569650"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2023 09:18:03 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id C12EB121389;
        Fri,  3 Mar 2023 19:18:00 +0200 (EET)
Date:   Fri, 3 Mar 2023 19:18:00 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kate Hsuan <hpa@redhat.com>
Subject: Re: [PATCH 1/1] media: v4l: subdev: Make link validation safer
Message-ID: <ZAIryJV7XNpW8lbY@kekkonen.localdomain>
References: <441f2951-402b-0f3c-5ea6-8d6df3f3e894@redhat.com>
 <20230302202219.846011-1-sakari.ailus@linux.intel.com>
 <12e3fcc5-1a54-1313-8d52-5618b87f09d1@ideasonboard.com>
 <ZAHaOY6m864mEL0e@kekkonen.localdomain>
 <311809d5-8fd1-1514-dd7c-670cfda0c5b4@ideasonboard.com>
 <49f77774-b34b-130d-a761-9a087c1d4ea8@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <49f77774-b34b-130d-a761-9a087c1d4ea8@redhat.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Fri, Mar 03, 2023 at 04:06:11PM +0100, Hans de Goede wrote:
> Hi,
> 
> On 3/3/23 12:36, Tomi Valkeinen wrote:
> > On 03/03/2023 13:30, Sakari Ailus wrote:
> >> Hi Tomi,
> >>
> >> On Fri, Mar 03, 2023 at 10:41:27AM +0200, Tomi Valkeinen wrote:
> >>> On 02/03/2023 22:22, Sakari Ailus wrote:
> >>>> Link validation currently accesses invalid pointers if the link passed to it
> >>>> is not between two sub-devices. This is of course a driver bug.
> >>>>
> >>>> Ignore the error but print a debug message, as this is how it used to work
> >>>> previously.
> >>>>
> >>>> Fixes: a6b995ed03ff ("media: subdev: use streams in v4l2_subdev_link_validate()")
> >>>> Reported-by: Hans de Goede <hdegoede@redhat.com>
> >>>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> >>>> ---
> >>>> Hi Hans,
> >>>>
> >>>> Could you test this?
> >>>>
> >>>> The bug is of course in the ImgU driver and this reverts to the old
> >>>> pre-streams behaviour. It silently fails instead of oopsing. The ImgU driver
> >>>> needs to be fixed and I think we could make this return an error at the same
> >>>> time. Right now I can't be sure the ImgU driver is the only one suffering
> >>>> from this, but if so, it's likely to be broken anyway.
> >>>
> >>> Maybe it should be at least a warn? How do we catch other broken drivers
> >>> otherwise?
> >>
> >> The purpose of this patch is just to restore the old behaviour, and merge
> >> it as a fix to v6.3 (via Cc'ing stable). I agree this should be made an
> >> error but I'd like that change to be present in the media tree for some
> >> time first.
> > 
> > I meant that keep it returning 0 (no error), but instead of a debug print, use pr_warn. Or maybe pr_warn_once for now.
> 
> Switching to pr_warn_once() sounds reasonable to me.

I'll send v2 with that.

-- 
Sakari Ailus
