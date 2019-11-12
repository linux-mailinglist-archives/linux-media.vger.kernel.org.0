Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54F41F9095
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2019 14:25:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726939AbfKLNZg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Nov 2019 08:25:36 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:41862 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725834AbfKLNZg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Nov 2019 08:25:36 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xACDP8lc072812;
        Tue, 12 Nov 2019 07:25:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573565108;
        bh=zZU6FW7byr7BXkaMzoSqw4WV8nBh8mnfAIX83I4hdHw=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=XPgEs+OXSdxxVNY7WulUfFF7Ui9KTNiCGtT0vSJ3TjIO4A635ynZsErzrMN1AtYwE
         WdVJ4feNO3z/hvvk+RInHCK9l6iOIor7fAOQkd//4j3tmIaf2X9BKlWOh0nzqpDGQx
         SiHF6hF0DvJX8fC19M5KTRHBvZFZ5rCrljpShKGQ=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xACDP8Ca056676
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 12 Nov 2019 07:25:08 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 12
 Nov 2019 07:24:51 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 12 Nov 2019 07:24:51 -0600
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with SMTP id xACDP8aB123688;
        Tue, 12 Nov 2019 07:25:08 -0600
Date:   Tue, 12 Nov 2019 07:28:11 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
CC:     Hans Verkuil <hverkuil@xs4all.nl>, <linux-media@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [Patch v2 12/20] media: ti-vpe: cal: Add DRA76x support
Message-ID: <20191112132811.p6xgmxp7co6ugkkn@ti.com>
References: <20191104193140.31145-1-bparrot@ti.com>
 <20191104193140.31145-13-bparrot@ti.com>
 <20191106085709.GB6253@valkosipuli.retiisi.org.uk>
 <20191106205839.3zxqdttlqmrzghla@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191106205839.3zxqdttlqmrzghla@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Benoit Parrot <bparrot@ti.com> wrote on Wed [2019-Nov-06 14:58:39 -0600]:
> Sakari Ailus <sakari.ailus@iki.fi> wrote on Wed [2019-Nov-06 10:57:09 +0200]:
> > Hi Benoit,
> > 
> > On Mon, Nov 04, 2019 at 01:31:32PM -0600, Benoit Parrot wrote:
> > 
> > ...
> > 
> > > +static struct cal_data dra76x_cal_data = {
> > 
> > const?
> 
> Hmm, most likely.

Well, it turns out they cannot be constified because we need to be able to
update the register offset fir the regmap used for the syscon object.
So I'll leave them as is.

Benoit

> 
> > 
> > > +	.csi2_phy_core = dra76x_cal_csi_phy,
> > > +	.num_csi2_phy = ARRAY_SIZE(dra76x_cal_csi_phy),
> > > +
> > 
> > This newline seems extra.
> > 
> > > +	.flags = 0,
> > 
> > And flags will be zero in any case, as one more struct members are assigned
> > to.
> 
> Is this guaranteed or compiler version dependent?
> 
> > 
> > > +};
> > 
> > -- 
> > Regards,
> > 
> > Sakari Ailus
