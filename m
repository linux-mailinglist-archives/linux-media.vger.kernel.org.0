Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8B026407E9
	for <lists+linux-media@lfdr.de>; Fri,  2 Dec 2022 14:46:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233150AbiLBNqs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Dec 2022 08:46:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232307AbiLBNqr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Dec 2022 08:46:47 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5728D78DE;
        Fri,  2 Dec 2022 05:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669988806; x=1701524806;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uKkEP8hRkSwUno2HyOhdHYhMolEgp38p/cHU7W7Ooco=;
  b=nO9YUwQ9FkjYjOJPzy06M/sjqgNBvLN5XjOd7dqZojhwyxTG+nyl1/BW
   nYPdrxbZgYW6X5uKT7MbykoStwA9MbBScIg+VfK344RPTG+QGlcERewkP
   s+5wIKSSfJOe5WX5QB/JWBy5XN4WK6TP9PBCHeDvDZMhT/XFRM8Thzzpg
   QmIBczcMhfvBOBhLwc0odzhXmEIa9N/l38lPI56lfs4oEB0SF5WWnAO43
   Cic0lhNfy0zqJixoOg4L+e5nltYC2vMPOyGPFwJp+b4uoMj/Tt71iX0Ux
   uIA9C+rCSYN+inRt35MgfiDz8W2mkwHMXTrQT53fUe6Y4CHFtx4Rfp5xL
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="378108044"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; 
   d="scan'208";a="378108044"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2022 05:46:46 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="890151140"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; 
   d="scan'208";a="890151140"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2022 05:46:43 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 7180920363;
        Fri,  2 Dec 2022 15:46:41 +0200 (EET)
Date:   Fri, 2 Dec 2022 13:46:41 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        platform-driver-x86@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 1/6] media: ov5693: Add support for a privacy-led GPIO
Message-ID: <Y4oBwcmvt2Rry26c@paasikivi.fi.intel.com>
References: <20221129231149.697154-2-hdegoede@redhat.com>
 <Y4ddgnRbRyUDSPFI@paasikivi.fi.intel.com>
 <ad9d01b6-de08-b54c-d300-cf133df90536@redhat.com>
 <Y4duQpP/GrfFQkwS@paasikivi.fi.intel.com>
 <fef2a014-1ef9-049a-2516-539ea14abdac@redhat.com>
 <Y4nZUpGvtKMpxrDR@pendragon.ideasonboard.com>
 <29b30a50-0fc1-e185-c79b-10856a80bceb@redhat.com>
 <Y4nmZND8Mm89X0Y/@pendragon.ideasonboard.com>
 <CAHp75VeN_2TNQfSAji+QN_EpgtVrm2Lxw50mAQkdnLeQPmsp5A@mail.gmail.com>
 <Y4nsNp4RSVZwI98H@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y4nsNp4RSVZwI98H@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Dec 02, 2022 at 02:14:46PM +0200, Laurent Pinchart wrote:
> On Fri, Dec 02, 2022 at 01:53:55PM +0200, Andy Shevchenko wrote:
> > On Fri, Dec 2, 2022 at 1:50 PM Laurent Pinchart wrote:
> > > On Fri, Dec 02, 2022 at 12:21:12PM +0100, Hans de Goede wrote:
> > > > On 12/2/22 11:54, Laurent Pinchart wrote:
> > 
> > ...
> > 
> > > > Note the need for an index -> name map is standard for all GPIOs
> > > > on ACPI platforms.
> > >
> > > It's funny how ARM platforms were criticized for their need of board
> > > files, with x86/ACPI being revered as a saint. Now we have DT on ARM and
> > > x86 needs board files :-)
> > 
> > I believe it's a misunderstanding here due to missing words at Hans'
> > statement, i..e.
> > "..., which do not provide the descriptions in _DSD() method."
> > 
> > So, no, x86 does not need board files generally speaking. The problem
> > here is some departments of some big companies that didn't get ACPI
> > properly or at all.
> 
> When it comes to camera support, that seems to cover an overwhelming
> majority of systems, if not all of them.

Not those shipped with ChromeOS. In the future the BIOS folks would ideally
base this on MIPI DisCo for Imaging. The spec should be out soon:

<URL:https://www.mipi.org/specifications/mipi-disco-imaging>

-- 
Sakari Ailus
