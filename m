Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C266ABE055
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2019 16:35:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732535AbfIYOfv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Sep 2019 10:35:51 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:38298 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730669AbfIYOfv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Sep 2019 10:35:51 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8PEZXQh009127;
        Wed, 25 Sep 2019 09:35:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569422133;
        bh=Vr6ZNVx+133zoSre+n4gSJjThy4BgNGHqTs8gT9hzm8=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=w0GBSoOEYRYazebOWPlPnNxGrvB4waTQhLzKrVh4jnqwl2BaAm18t3ONj5I72ngX9
         2l3s1zhZuj0zW5kkraDQfyvgavj+5w6JrXj8+klm10a7dhaJnRzhoU6R3dZTf+r9yI
         r7gBKHj7Q7B1EbDn2whKawdJT5OC71FcWbUfz2KU=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8PEZW7g046462;
        Wed, 25 Sep 2019 09:35:33 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 25
 Sep 2019 09:35:32 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 25 Sep 2019 09:35:25 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8PEZWNs107138;
        Wed, 25 Sep 2019 09:35:32 -0500
Date:   Wed, 25 Sep 2019 09:37:41 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     Hans Verkuil <hverkuil@xs4all.nl>,
        Prabhakar Lad <prabhakar.csengg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [Patch v3 6/8] media: i2c: ov2659: Add powerdown/reset gpio
 handling
Message-ID: <20190925143741.25qn2wuyiwapsehr@ti.com>
References: <20190924164414.21897-1-bparrot@ti.com>
 <20190924164414.21897-7-bparrot@ti.com>
 <20190925095154.GL9467@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190925095154.GL9467@paasikivi.fi.intel.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sakari Ailus <sakari.ailus@linux.intel.com> wrote on Wed [2019-Sep-25 12:51:54 +0300]:
> Hi Benoit,
> 
> On Tue, Sep 24, 2019 at 11:44:12AM -0500, Benoit Parrot wrote:
> > On some board it is possible that the sensor 'powerdown' and or 'reset'
> > pin might be controlled by gpio instead of being tied.
> > 
> > To implement we add pm_runtime support which will handle the power
> > up/down sequence when it is available otherwise the sensor will be
> > powered on at module insertion/probe and powered off at module removal.
> > 
> > Now originally the driver assumed that the sensor would always stay
> > powered and keep its register setting. We cannot assume this anymore, so
> > every time we "power up" we need to re-program the initial registers
> > configuration first. This was previously done only at probe time.
> > 
> > Signed-off-by: Benoit Parrot <bparrot@ti.com>
> 
> Thanks for the update.
> 
> I missed the control interface is accessible also when the device is not
> streaming, and the driver doesn't appear to power on the sensor for that,
> leading to a failing I²C write.
> 
> Could you address that as well, either here or as a separate patch? E.g.
> the smiapp driver does this.

Yes, I missed that also.
I'll add a check in .s_ctrl().

Benoit

> 
> -- 
> Kind regards,
> 
> Sakari Ailus
> sakari.ailus@linux.intel.com
