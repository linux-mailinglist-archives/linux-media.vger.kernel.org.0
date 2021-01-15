Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F8222F772A
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 12:07:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726226AbhAOLGe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 06:06:34 -0500
Received: from mga12.intel.com ([192.55.52.136]:56015 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725950AbhAOLGc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 06:06:32 -0500
IronPort-SDR: ZmRmPsAt/85EGKi8xE2jwVHXwHIM+urgZ4X6Z5ag/D9sGkQhTbzs/SUrPTOnvM8RbaXKG0uWjF
 tZJ6mSzewhxQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9864"; a="157712970"
X-IronPort-AV: E=Sophos;i="5.79,349,1602572400"; 
   d="scan'208";a="157712970"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2021 03:04:46 -0800
IronPort-SDR: 1ml0ww6LX+WAWMZwK7lqiI4Vl+AdkVvj/3mNani0naNfJU4MIXRzCcX8O7cl5guNB+Ixyvd4BW
 rFWkqe2Umatg==
X-IronPort-AV: E=Sophos;i="5.79,349,1602572400"; 
   d="scan'208";a="398344180"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2021 03:04:41 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 0C23C206A9; Fri, 15 Jan 2021 13:04:40 +0200 (EET)
Date:   Fri, 15 Jan 2021 13:04:40 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: media: ov5647: Fix filename
Message-ID: <20210115110439.GR11878@paasikivi.fi.intel.com>
References: <20210115101652.9275-1-jacopo@jmondi.org>
 <c77755a4-4386-f5b0-cb47-64227d022b4b@ideasonboard.com>
 <20210115110146.yu635kh4emdvbidy@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210115110146.yu635kh4emdvbidy@uno.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jan 15, 2021 at 12:01:46PM +0100, Jacopo Mondi wrote:
> Hi Kieran
> 
> On Fri, Jan 15, 2021 at 10:20:20AM +0000, Kieran Bingham wrote:
> > Hi Jacopo,
> >
> > On 15/01/2021 10:16, Jacopo Mondi wrote:
> > > Commit 1b5071af8240 ("media: dt-bindings: media: i2c: Rename
> > > ov5647.yaml") renamed the bindings file but did not update the
> > > Id: field there.
> > >
> > > Fix it by using the new filename.
> > >
> > > Fixes: 1b5071af8240 ("media: dt-bindings: media: i2c: Rename ov5647.yaml")
> > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> >
> > I wonder if this could be automatically validated by one of the checkers
> > at some point. (I assume it isn't already).
> >
> 
> The dt validation process complains
> 
> ../Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml: $id: relative path/filename doesn't match actual path or filename
> 
> I can't tell if it's a newly introduced validation or it was there
> already when I renamed that file ~6 months ago and I failed to run
> validation :/

I do run checkpatch before merging but I haven't done DT validation
regularly.

-- 
Sakari Ailus
