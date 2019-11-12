Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A76C0F90B8
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2019 14:33:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726939AbfKLNdR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Nov 2019 08:33:17 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:33358 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725865AbfKLNdR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Nov 2019 08:33:17 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xACDWqEC028139;
        Tue, 12 Nov 2019 07:32:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573565572;
        bh=5Z4gxvkjzCKXoR2E/PLowayTQFLHdnvuiFx2gsQMpOw=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=u7uD8Ksb6+SkNTw/B+CguxskxxpzqJhuWCzD1BViIVLYjjyl6h5IkXu4sceepscOt
         dw2KPu100PEy9jPMXyfIsQ6VvHaJpPwNv0UTysey8ik3vfarPd3g4OqL3XIEY0n6f/
         63b+XNLUiCKXDHX+xGxKrLy+Mb9P7pwhuBDao1Q0=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xACDWppt074078;
        Tue, 12 Nov 2019 07:32:52 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 12
 Nov 2019 07:32:51 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 12 Nov 2019 07:32:34 -0600
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with SMTP id xACDWpgg005332;
        Tue, 12 Nov 2019 07:32:51 -0600
Date:   Tue, 12 Nov 2019 07:35:54 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
CC:     Hans Verkuil <hverkuil@xs4all.nl>, <linux-media@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [Patch v2 12/20] media: ti-vpe: cal: Add DRA76x support
Message-ID: <20191112133554.u7mbv6h2bzecvakl@ti.com>
References: <20191104193140.31145-1-bparrot@ti.com>
 <20191104193140.31145-13-bparrot@ti.com>
 <20191106085709.GB6253@valkosipuli.retiisi.org.uk>
 <20191106205839.3zxqdttlqmrzghla@ti.com>
 <20191112132811.p6xgmxp7co6ugkkn@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191112132811.p6xgmxp7co6ugkkn@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Benoit Parrot <bparrot@ti.com> wrote on Tue [2019-Nov-12 07:28:11 -0600]:
> Benoit Parrot <bparrot@ti.com> wrote on Wed [2019-Nov-06 14:58:39 -0600]:
> > Sakari Ailus <sakari.ailus@iki.fi> wrote on Wed [2019-Nov-06 10:57:09 +0200]:
> > > Hi Benoit,
> > > 
> > > On Mon, Nov 04, 2019 at 01:31:32PM -0600, Benoit Parrot wrote:
> > > 
> > > ...
> > > 
> > > > +static struct cal_data dra76x_cal_data = {
> > > 
> > > const?
> > 
> > Hmm, most likely.
> 
> Well, it turns out they cannot be constified because we need to be able to
> update the register offset fir the regmap used for the syscon object.
> So I'll leave them as is.

Oh I guess you meant just the "static struct cal_data" ones?
I tried making the other one into const but obviously that didn't work.

But just constifying "static struct cal_data" appears to compiled just
fine.

> 
> Benoit
> 
> > 
> > > 
> > > > +	.csi2_phy_core = dra76x_cal_csi_phy,
> > > > +	.num_csi2_phy = ARRAY_SIZE(dra76x_cal_csi_phy),
> > > > +
> > > 
> > > This newline seems extra.
> > > 
> > > > +	.flags = 0,
> > > 
> > > And flags will be zero in any case, as one more struct members are assigned
> > > to.
> > 
> > Is this guaranteed or compiler version dependent?
> > 
> > > 
> > > > +};
> > > 
> > > -- 
> > > Regards,
> > > 
> > > Sakari Ailus
