Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE1ACF1FFC
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2019 21:38:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730005AbfKFUiO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Nov 2019 15:38:14 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:47350 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727351AbfKFUiO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Nov 2019 15:38:14 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA6Kc4c0098604;
        Wed, 6 Nov 2019 14:38:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573072684;
        bh=PWVvvmgruW+Q7rIiIiDa8/l4/cE8ElighoMhox44KfY=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=LPaItP+Qtl71+elc37+HjIOLDu9CdDYiE/U3TfZt7a2fGaZm62rc0rNdqVU30MkxO
         d5Rw2VK1aVdDi6kyDt6wPJI0uL1Z64tXk9vberVnjW3lK8aIomhdnibie/wOecXDVT
         sKmv63ZbNSuI4/VxUz9aF4OiDwgWUPo0uBi9hjYc=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA6Kc47s013152
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 6 Nov 2019 14:38:04 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 6 Nov
 2019 14:37:48 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 6 Nov 2019 14:37:48 -0600
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with SMTP id xA6Kc3Cg067896;
        Wed, 6 Nov 2019 14:38:03 -0600
Date:   Wed, 6 Nov 2019 14:41:04 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
CC:     Hans Verkuil <hverkuil@xs4all.nl>, <linux-media@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Jyri Sarha <jsarha@ti.com>
Subject: Re: [Patch v2 07/20] media: ti-vpe: cal: add CSI2 PHY LDO errata
 support
Message-ID: <20191106204104.6m4uxj6nbfbs2fao@ti.com>
References: <20191104193140.31145-1-bparrot@ti.com>
 <20191104193140.31145-8-bparrot@ti.com>
 <20191106085501.GA6253@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191106085501.GA6253@valkosipuli.retiisi.org.uk>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sakari Ailus <sakari.ailus@iki.fi> wrote on Wed [2019-Nov-06 10:55:02 +0200]:
> Hi Benoit,
> 
> On Mon, Nov 04, 2019 at 01:31:27PM -0600, Benoit Parrot wrote:
> 
> ...
> 
> > @@ -458,6 +483,8 @@
> >  #define CAL_CSI2_PHY_REG1_CLOCK_MISS_DETECTOR_STATUS_SUCCESS		0
> >  #define CAL_CSI2_PHY_REG1_RESET_DONE_STATUS_MASK		GENMASK(29, 28)
> >  
> > +#define CAL_CSI2_PHY_REG10_I933_LDO_DISABLE_MASK		BIT_MASK(6)
> 
> BIT(6) ?
> 
> BIT_MASK() is intended for a different purpose.

Well actually here I don't see the differences?

> 
> -- 
> Regards,
> 
> Sakari Ailus
