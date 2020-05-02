Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01E8B1C2720
	for <lists+linux-media@lfdr.de>; Sat,  2 May 2020 19:04:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728342AbgEBRE2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 May 2020 13:04:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728312AbgEBRE1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 2 May 2020 13:04:27 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8042C061A0C
        for <linux-media@vger.kernel.org>; Sat,  2 May 2020 10:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description;
        bh=Leun0h42fT0V6FNo36eDwM5s4wJk0ooxxqRhDg2BAo0=; b=N+Fo0ZAGCry9qenG3VA1Lfck/4
        aO9CP6evt+uJR3DArr88C3PATHv5XwXDuJMwXMYMfzPVBqvXqTcA/rd+GOLhLq5pFurXD1wze14hC
        uPtRvotYgnxhNQUIn5rQEa6uREQ+AhM9lkHpIV04mDx7bLUmJ8/ouF5fXUABephRXueyz0UjeCyPQ
        wOvhzszegWhiD6dfP3QpluGDp4MvT5td4XMogfUR5JYIQoLJM6iM60J60HCTv8enIK/NsXbZGLfeu
        LRXqGwx4K0gRd6SEvllYO0uX4tm4mBPK4INiZ306z/745qglArwFB3yBWh6mtg0tJImkCD65949JJ
        h4yRpG1Q==;
Received: from ip5f5ad5c5.dynamic.kabel-deutschland.de ([95.90.213.197] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jUvYs-00031E-OZ; Sat, 02 May 2020 17:04:22 +0000
Date:   Sat, 2 May 2020 19:04:14 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Patrik Gfeller <patrik.gfeller@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: atomisp kernel driver(s)
Message-ID: <20200502190414.7ede79b6@coco.lan>
In-Reply-To: <CAHp75Vf9M7=Gf=mCgdBgt0-aR+kBOjtE3pvJyEya2OGmqbr6XA@mail.gmail.com>
References: <f3348096-1fb3-5368-ba66-f42a300bde8e@gmail.com>
        <CAHp75Vf9M7=Gf=mCgdBgt0-aR+kBOjtE3pvJyEya2OGmqbr6XA@mail.gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy,

Em Sat, 2 May 2020 19:08:36 +0300
Andy Shevchenko <andy.shevchenko@gmail.com> escreveu:

> I follow your attempts to enable that driver (I, myself, spent a lot
> of time to an attempt of getting this driver in a shape). However, I
> guess you started from a wrong side. Even with access to internal tree
> for Android firmware we didn't manage to find a proper one to whatever
> has been published in drivers/staging. So, to get it done, one should
> first to find a *working* Android for the certain device. Without that
> it will be a journey of wasted time and big disappointment.

I found a driver that is probably working:
	https://github.com/intel-aero/meta-intel-aero.git

It is for an Intel Mobile Aero AUV platform. I suspect that his one
should likely work. 

> My achievements end with no getting IRQ from the driver (and I was
> experimenting on MRD-7 CRB).
> 
> P.S. I also have some (semi-) debug patches I can share. 
> Perhaps they will give some more ideas.

Anything you can share will be welcomed.

> Btw, based on this discussion I think that
> it can be power issues with sensors that possible affect IRQ
> generation inside SiliconHive vector processor.

Yeah, the current issue sounds simple to solve, but I need to understand
how an ACPI-based device would be calling regulator_register(). Using
regulators with ACPI is new to me. I suspect that this should be done
by ./arch/x86/platform/intel-mid, with of course doesn't have the needed
bits for this board. Also, there is a dummy regulator driver for atomisp
based boards (drivers/platform/x86/intel_atomisp2_pm.c). This one could
be causing some issues too.

The atomisp driver uses regulator_get() to turn on the sensors.

In order for regulator_get() to work, regulator_dev_lookup() should
be capable of finding a regulator either via DT or via the
regulator_map_list.

The contents of the regulator_map_list should visible on a configfs
node (/sys/kernel/debug/regulator/supply_map).

Yet, those aren't visible (probably because the ACPI data was written
for Windows). So, the atomisp code should very likely call 
regulator_register() for the regulators with the atomisp driver
need, in order to setup the regulator list.


> In IPU3 the dedicated
> PMIC is used for camera devices, and I have no idea of the design for
> old ones.

I have here a Dell notebook with IPU3 on it (marketed for MS windows):

	ipu3_imgu: module is from the staging directory, the quality is unknown, you have been warned.
	ipu3-imgu 0000:00:05.0: enabling device (0000 -> 0002)
	ipu3-imgu 0000:00:05.0: device 0x1919 (rev: 0x1)
	ipu3-imgu 0000:00:05.0: physical base address 0x00000000ec000000, 4194304 bytes
	ipu3-imgu 0000:00:05.0: loaded firmware version irci_irci_ecr-master_20161208_0213_20170112_1500, 17 binaries, 1212984 bytes
	ipu3-cio2 0000:00:14.3: enabling device (0000 -> 0002)
	ipu3-cio2 0000:00:14.3: device 0x9d32 (rev: 0x1)

This command:

	# cat /sys/kernel/debug/regulator/supply_map

Returns nothing. So, it seems that the very same issue may also be
happening on IPU3-based laptops that won't have BIOSes designed to
work on Linux.

Thanks,
Mauro
