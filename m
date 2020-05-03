Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F36E1C2B1A
	for <lists+linux-media@lfdr.de>; Sun,  3 May 2020 12:07:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728110AbgECKHa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 3 May 2020 06:07:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728095AbgECKH3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 3 May 2020 06:07:29 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EE60C061A0C;
        Sun,  3 May 2020 03:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description;
        bh=11eMvbjGeR29h1DUas3zdmi7upTWauQvUqLXTyueNJg=; b=tfXwO/vsnGFWRrrWcdQPqqP20R
        YrnQ7Dex9YBnC7SjIj/RxLh8ojnSzWAfuNB6v0HzGMxNtfZSvu7vziVQthR4jdn5LhMi81IGxnYC2
        Rf9PknX6ObDBjZtDuzpjdImQyZf5Facvi7KA6WJRjp0A+XogHyPJi+pjbRTqTP6SQ3dhTgKgZd1/x
        CKTjKF2kux7seQ+NAETEUyl8O5mSNG5okp2Sf4RoSyJyMM6v3ya+TgaaifbTNutx6lIoYNfiM2h1O
        uHAWBC9C7RpLCefjrMejLRZgr2Xp/BiaPh48jIZdsNjUaXjlWfUYiUnbj2mbY49ukkJsZsQtn323j
        atgU1XSg==;
Received: from [95.90.213.197] (helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jVBWs-0000so-KN; Sun, 03 May 2020 10:07:22 +0000
Date:   Sun, 3 May 2020 12:07:14 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Francescodario Cuzzocrea <francescodario.cuzzocrea@mail.polimi.it>
Cc:     "mchehab+huawei@kernel.org" <mchehab+huawei@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "gnomes@lxorguk.ukuu.org.uk" <gnomes@lxorguk.ukuu.org.uk>,
        "alan@linux.intel.com" <alan@linux.intel.com>
Subject: Re: [GIT PULL] Ressurect the atomisp staging driver
Message-ID: <20200503120714.28f62360@coco.lan>
In-Reply-To: <3f551a8f87808ee7828dc03d41c7a23faac89f3c.camel@mail.polimi.it>
References: <20200501215741.3be05695@coco.lan>
        <3f551a8f87808ee7828dc03d41c7a23faac89f3c.camel@mail.polimi.it>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Francescodario,

Em Sun, 3 May 2020 09:19:55 +0000
Francescodario Cuzzocrea <francescodario.cuzzocrea@mail.polimi.it> escreveu:

> Hi ! 
> 
> Thanks for this, it is very appreciated !! 
> 
> I have a bay trail 2in1 (namely, the acer aspire swtich 10 sw5-012,
> with an OV2722 module, so supported by the driver) on top of which I
> run android-x86-q so I would be able to help a bit with testing the
> driver.
> 
> I tried to pull in your changes on top of my 5.7-rc2 here : 
> https://gitlab.com/lineageos-x86/android_kernel_common/-/commits/5.7-media
> 
> but I did not understood how to correctly enable the driver.
> According
> to Kconfig help, there is still the hardcoded switch between ISP2401
> and ISP2400, so for my Bay Trail tablet I should set :
> 
> #
> CONFIG_VIDEO_ATOMISP_ISP2401 is not set
> 
> but settings this breaks compilation with : 
> 
> ERROR: modpost:
> "ia_css_configure_sc"[drivers/staging/media/atomisp/atomisp.ko]
> undefined!

I'll double check and address this issue. 

> 
> Looking at commit history, I noticed that the driver should be able to
> recognize at runtime the ISP version,

Not yet. There are simply too many places there with checks for ISP2400
or ISP2401. I got rid of most of them, but there are 4 header files
that contain ISP-version specific information, whose are used by several
parts of the driver. Getting rid of it would require more work.

> so what I tried next was to set
> CONFIG_VIDEO_ATOMISP_ISP2401=y, and the compilation went fine.
> I was able to boot the kernel (and I also added both
> shisp_2400b0_v21.bin and shisp_2401a0_v21.bin from an android tablet
> dump).
> 
> The kernel booted fine, the ov2722 module is loaded, but according to
> dmesg it is not able to initialize the hardware : 
> https://pastebin.com/VBMD1bau

(transcribing the relevant messages from pastebin below)

> ov2722 i2c-INT33FB: 00: gmin: initializing atomisp module subdev data.PMIC ID 1
> ov2722 i2c-INT33FB: 00: supply V1P2A not found, using dummy regulator
> ov2722 i2c-INT33FB: 00: supply VPROG4B not found, using dummy regulator
> ov2722 i2c-INT33FB: 00: supply Regulator1p8v not found, using dummy regulator
> ov2722 i2c-INT33FB: 00: supply Regulator2p8v not found, using dummy regulator
> ov2722 i2c-INT33FB: 00: unable to set PMC rate 1
> ov2722 i2c-INT33FB: 00: camera pdata: port: 0 lanes: 1 order: 00000000
> ov2722 i2c-INT33FB: 00: read from offset 0x300a error -121
> ov2722 i2c-INT33FB: 00: sensor_id_high = 0xffff
> ov2722 i2c-INT33FB: 00: ov2722_detect err s_config.
> ov2722 i2c-INT33FB: 00: sensor power-gating failed

That's the same that happened with the tests we've done so far:
it is not finding the regulators. I'm currently seeking for a solution
to that.

Usually, regulator data comes via OpenFirmware/Device Tree.

However, ACPI BIOS store this on a different way. Some (missing) code
would need to get the relevant parameters from the BIOS and setup
the regulators.

Btw, could you please send me a tarball with the output of your
BIOS ACPI tables?

You can get it with:

	$ sudo acpidump |bzip2 > acpi.log.bz2

Thanks,
Mauro
