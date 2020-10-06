Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 758B52852B1
	for <lists+linux-media@lfdr.de>; Tue,  6 Oct 2020 21:53:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727178AbgJFTxE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Oct 2020 15:53:04 -0400
Received: from mga02.intel.com ([134.134.136.20]:50610 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725943AbgJFTxD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 6 Oct 2020 15:53:03 -0400
IronPort-SDR: JpeDuQtLlJVBMI4XXmMTNGC9KTx+tah0wUCQSbNt+6UTZoE6aRkYdYoR1PugcfYjllpw5+UYKo
 oFm08ZBMzIYg==
X-IronPort-AV: E=McAfee;i="6000,8403,9766"; a="151587428"
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; 
   d="scan'208";a="151587428"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2020 12:53:00 -0700
IronPort-SDR: OVZz3EKBgZkksCYyWmBbPsA8oZg66pbBp5TjmiS/mTOScOoQhIPDLWazk+J2j0+ACUaoL6mGWI
 laWghEphi3LQ==
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; 
   d="scan'208";a="327714719"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2020 12:52:59 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id A1FAB204A8; Tue,  6 Oct 2020 22:52:56 +0300 (EEST)
Date:   Tue, 6 Oct 2020 22:52:56 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Rob Herring <robh@kernel.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [RESEND PATCH 020/100] dt-bindings: Add vendor prefix for MIPI
 Alliance
Message-ID: <20201006195256.GF26842@paasikivi.fi.intel.com>
References: <20200930201914.31377-1-sakari.ailus@linux.intel.com>
 <20200930201914.31377-2-sakari.ailus@linux.intel.com>
 <20201006195010.GA2718573@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201006195010.GA2718573@bogus>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 06, 2020 at 02:50:10PM -0500, Rob Herring wrote:
> On Wed, Sep 30, 2020 at 11:19:08PM +0300, Sakari Ailus wrote:
> > Add a vendor prefix for MIPI Alliance, Inc.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> 
> I guess based on the irc discussion, this is withdrawn.

Correct. I'll send v2 with compatible ids without vendor prefix plus other
fixes soonish. Please thus ignore this version.

-- 
Sakari Ailus
