Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C13CF1FE7
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2019 21:33:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731934AbfKFUdJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Nov 2019 15:33:09 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:46252 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727646AbfKFUdI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Nov 2019 15:33:08 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA6KWfoh096274;
        Wed, 6 Nov 2019 14:32:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573072361;
        bh=4KPGIKWmTjDsaXDJhbPERAOcnx56q00US+atK5Qvn/w=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=oyYbSxID0NOqhjsyNfcHdwfmfFyNWrQVo4Ctz2uaFW46Ct2BBiCsN7yuVj6i/7hGe
         3x96IxZO+YCHanFnYfXY+lLSAOBp8Ui6yEptLhkIupuiJ0xun+qRw4HP8U/7yQ+6aB
         v/0x2kR4fPKXwZ8ys6rKLjj394ttWnrw9isbQP44=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA6KWfQc063526
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 6 Nov 2019 14:32:41 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 6 Nov
 2019 14:32:41 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 6 Nov 2019 14:32:41 -0600
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with SMTP id xA6KWfe7059453;
        Wed, 6 Nov 2019 14:32:41 -0600
Date:   Wed, 6 Nov 2019 14:35:42 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
CC:     Hans Verkuil <hverkuil@xs4all.nl>, <linux-media@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Jyri Sarha <jsarha@ti.com>
Subject: Re: [Patch v2 07/20] media: ti-vpe: cal: add CSI2 PHY LDO errata
 support
Message-ID: <20191106203542.uab6bwgdrkb627q4@ti.com>
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

Wow, good catch, I have never realized that.

Benoit

> 
> -- 
> Regards,
> 
> Sakari Ailus
