Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA01F45A1E9
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 12:50:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235509AbhKWLxt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Nov 2021 06:53:49 -0500
Received: from mga11.intel.com ([192.55.52.93]:13301 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234482AbhKWLxs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Nov 2021 06:53:48 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10176"; a="232498109"
X-IronPort-AV: E=Sophos;i="5.87,257,1631602800"; 
   d="scan'208";a="232498109"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2021 03:50:40 -0800
X-IronPort-AV: E=Sophos;i="5.87,257,1631602800"; 
   d="scan'208";a="474739003"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2021 03:50:38 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 1E415201E1;
        Tue, 23 Nov 2021 13:50:36 +0200 (EET)
Date:   Tue, 23 Nov 2021 13:50:36 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     Eugen Hristev <eugen.hristev@microchip.com>,
        leonl@leopardimaging.com, linux-media@vger.kernel.org,
        skomatineni@nvidia.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: i2c: imx274: simplify probe function by
 adding local variable dev
Message-ID: <YZzVjNVI3hySmC3o@paasikivi.fi.intel.com>
References: <20211123111521.593863-1-eugen.hristev@microchip.com>
 <YZzPj4ILWyp4Ouz9@paasikivi.fi.intel.com>
 <4be771a0-9e77-64fd-031c-242dd4598996@lucaceresoli.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4be771a0-9e77-64fd-031c-242dd4598996@lucaceresoli.net>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Luca,

On Tue, Nov 23, 2021 at 12:35:42PM +0100, Luca Ceresoli wrote:
> Hi,
> 
> On 23/11/21 12:25, Sakari Ailus wrote:
> > Hi Eugen,
> > 
> > On Tue, Nov 23, 2021 at 01:15:20PM +0200, Eugen Hristev wrote:
> >> Simplify probe function by adding a local variable dev instead of using
> >> &client->dev all the time.
> >>
> >> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> > 
> > It's not really wrong to do this, but is it useful?
> It is of course a matter of personal taste, but I also prefer a short
> name in cases such as this where the same member is accessed a lot of
> times. To me it makes code simpler to read and even to write.
> 
> > You can't even unwrap a single line, the lines are just made a little bit
> > shorter.
> 
> Let's be fair, he did unwrap 4. :)

Ah, yes, you're right.

But at least one could have been wrapped without the change. :-)

> 
> As said, it is a matter of taste so I'll be OK it this patch is dropped.
> But since I like it and it looks correct:
> 
> Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Sakari Ailus
