Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1FD34249EB
	for <lists+linux-media@lfdr.de>; Thu,  7 Oct 2021 00:38:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239847AbhJFWkL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Oct 2021 18:40:11 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:48012 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239912AbhJFWj4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Oct 2021 18:39:56 -0400
X-Greylist: delayed 5755 seconds by postgrey-1.27 at vger.kernel.org; Wed, 06 Oct 2021 18:39:54 EDT
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 196L1xSo095749;
        Wed, 6 Oct 2021 16:01:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1633554119;
        bh=5GQkMzCzRXHqDDBT/bRBMLgEAfL2pt0t8U1wYbm8oDE=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=NET/pdSy1xXpoizghZ6rEKPBbwja1s7RS1GQQNJNAnaFv66wnOrt9noLRvfUo17Rq
         MIEMlNTSmEDuaPxkyq7Osj2nBdxBtqLmi1seiHsPZlVxgpGl+6zaYYSlqjBfWDEDdV
         3igehkjpy0JiqQu3NEmamFdGeDMtEdtKDKvDjFW0=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 196L1xdG044307
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 6 Oct 2021 16:01:59 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 6
 Oct 2021 16:01:59 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 6 Oct 2021 16:01:59 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 196L1wxu070269;
        Wed, 6 Oct 2021 16:01:58 -0500
Date:   Thu, 7 Oct 2021 02:31:57 +0530
From:   Pratyush Yadav <p.yadav@ti.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Benoit Parrot <bparrot@ti.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v4 02/11] media: cadence: csi2rx: Add external DPHY
 support
Message-ID: <20211006210155.ukfmh24kdipqprcn@ti.com>
References: <20210915120240.21572-1-p.yadav@ti.com>
 <20210915120240.21572-3-p.yadav@ti.com>
 <YV4EuD2KSIXIYzY4@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YV4EuD2KSIXIYzY4@paasikivi.fi.intel.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 06/10/21 11:19PM, Sakari Ailus wrote:
> Hi Pratyush,
> 
> On Wed, Sep 15, 2021 at 05:32:31PM +0530, Pratyush Yadav wrote:
> > +	ret = phy_pm_runtime_get_sync(csi2rx->dphy);
> 
> Note that this will return 1 if the device was already resumed. That is not
> an error.

Thanks. Will fix.

> 
> > +	if (ret == -ENOTSUPP)
> > +		got_pm = false;
> > +	else if (ret)
> > +		return ret;
> 
> -- 
> Sakari Ailus

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.
