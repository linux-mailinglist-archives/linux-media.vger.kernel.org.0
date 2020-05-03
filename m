Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D747E1C2DD2
	for <lists+linux-media@lfdr.de>; Sun,  3 May 2020 18:07:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728789AbgECQH4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 3 May 2020 12:07:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728665AbgECQH4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 3 May 2020 12:07:56 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D891EC061A0E
        for <linux-media@vger.kernel.org>; Sun,  3 May 2020 09:07:55 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id h9so7618198wrt.0
        for <linux-media@vger.kernel.org>; Sun, 03 May 2020 09:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PqwVuS1U29CR/uUUQFEcSWJCDb1Hwhaa/K4D7TXclVw=;
        b=XCkwLrQ2Zol4excb9E4vCLmRPeV0i5YjZbdV7aShnJApGcRWBS4cVXpbux6K6Ch5yU
         kuKLxEVgR2idZENChMxYGV2+JzMUSUT/JQy6rtPxBH7kAEioo5Nxdy2bjFM8lAnHu0fz
         nRdocd6MXvCr9UcJL1LsW5cniOM12Rpgvn9/aBOMM7cTzpqu0wviPwGjMxcmxA3GJ5If
         jtvc/pQzn+KxIk+l61K9mhN1ZK5WBE3bUhjht8xZBaYloEZePfrOSyghqjYXxyO4pYjv
         U/hwi6CbYwgOnZMgFeXNt7vCXtYx9WOVPOonhzzzfFrxfhhP/H9MJdCY/J21iG02lmAy
         X4ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PqwVuS1U29CR/uUUQFEcSWJCDb1Hwhaa/K4D7TXclVw=;
        b=aWPtrG23pVpdusAieOWe/eKc5jxtR45cGVQYf308jStzwPvJNLlHXklw0aiY2CGc3f
         3DKIRRL1NPhIYdeO2G+Tqgvs4gOXTTumQZhGwLs3v93NtUb16ZHg+f3sutkgfx2wWbZB
         VgojXsttVU2BdwNdZU2NohXQ7jIHHdCDWP2xNmDDjZ7tfZ5I+Eol0HuJDCfoc4XFaAZ6
         iiw4+PRtGgmaNuu7dnpgnjAhI+DmWlVuSgqA5/ree6E78T3tTPGoUnA8GOmayu+c+XWK
         RrHpjfjJ8S+AWM2OIo7AMPZ3Mqn/ON97TL9hVUCuL95G+BHr1TeQaYUAIa1ORiLkIFpM
         iSkw==
X-Gm-Message-State: AGi0PuaY1jnp0N0OiCajUNpONSQG9gmwn982PaEX1S7H7O/WjjJpey1e
        P2B5AJD41tsoFZmbCfe5EYJEAukdtRo=
X-Google-Smtp-Source: APiQypKCyI97+9OzY9EhIwwx7kL/Aihh2gAD3pYEvONlHAy/Z0tRajp4LOi/otL8xjLxS8KDka9uMQ==
X-Received: by 2002:a5d:5651:: with SMTP id j17mr14204904wrw.406.1588522074442;
        Sun, 03 May 2020 09:07:54 -0700 (PDT)
Received: from ASUS (77-56-155-30.dclient.hispeed.ch. [77.56.155.30])
        by smtp.gmail.com with ESMTPSA id b191sm10072650wmd.39.2020.05.03.09.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2020 09:07:54 -0700 (PDT)
Date:   Sun, 3 May 2020 18:07:51 +0200
From:   Patrik Gfeller <patrik.gfeller@gmail.com>
To:     Francescodario Cuzzocrea <francescodario.cuzzocrea@mail.polimi.it>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "mchehab+huawei@kernel.org" <mchehab+huawei@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [GIT PULL] Ressurect the atomisp staging driver
Message-ID: <20200503180751.0b1e29c4@ASUS>
In-Reply-To: <CADnVkj96W0QfthukTKQ0a-i2fH1buooH3BEgfy22J9H9=_PcKA@mail.gmail.com>
References: <20200501215741.3be05695@coco.lan>
        <3f551a8f87808ee7828dc03d41c7a23faac89f3c.camel@mail.polimi.it>
        <20200503173213.78ae6aaa@coco.lan>
        <CADnVkj96W0QfthukTKQ0a-i2fH1buooH3BEgfy22J9H9=_PcKA@mail.gmail.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, 3 May 2020 18:03:54 +0200
Francescodario Cuzzocrea <francescodario.cuzzocrea@mail.polimi.it> wrote:

> Il giorno dom 3 mag 2020 alle ore 17:32 Mauro Carvalho Chehab <
> mchehab@kernel.org> ha scritto:  
> 
> > Em Sun, 3 May 2020 09:19:55 +0000
> > Francescodario Cuzzocrea <francescodario.cuzzocrea@mail.polimi.it>
> > escreveu:
> >  
>  [...]  
> > https://gitlab.com/lineageos-x86/android_kernel_common/-/commits/5.7-media  
>  [...]  
> >
> > Fixed. you need to run:
> >
> >         $ git remote update && git reset --hard atomisp_v2
> >
> > in order to get the latest patch.
> >  
> 
> Thanks a lot !!
> 
> 
> >
> > Btw, I added another branch on my experimental tree:
> >
> >
> > https://git.linuxtv.org/mchehab/experimental.git/log/?h=yocto_intel_atom
> >
> > It is based on Kernel 4.4, and it has only those patches from
> > the https://github.com/intel-aero/meta-intel-aero.git tree for ISP2401,
> > as available at changeset 4ebb7cc829f5
> > (Merge pull request #70 from zehortigoza/jam):
> >
> >         $ git grep -l atomisp
> >         recipes-kernel/linux/linux-yocto/0013-temp-atomisp-support.patch
> >
> > recipes-kernel/linux/linux-yocto/0014-OV8858-add-sensor-sources-to-cloudsrest-platform.patch
> >
> > recipes-kernel/linux/linux-yocto/0015-kernel-Adding-support-for-HW-flip-using-AtomISP.patch
> >
> > recipes-kernel/linux/linux-yocto/0016-kernel-bug-fix-for-intermittent-green-patches.patch
> >
> > recipes-kernel/linux/linux-yocto/0022-ov8858-fix-regulator-management-on-ov8858_s_ctrl.patch
> >
> > recipes-kernel/linux/linux-yocto/0023-ov7251-remove-early-return-statement.patch
> >
> > It would be cool to have it tested on boards with ISP2401. If this works,
> > then we'll have a reference implementation to check against our tree.
> >
> >  
> According to my understarding mine which is baytrail should be  ISP2400

I have ISP2401 (rev B) ... I'll give it a try :-) - thanks Mauro!

> 
> https://github.com/intel-aero/meta-intel-aero/blob/4ebb7cc829f57306b9895f20af8fd17987089392/recipes-kernel/linux/linux-yocto/shisp_2401a0_v21.bin
> >
> > That said, there are some *.cfg files with stuff that should be at the
> > Kernel's .config, like this one:
> >
> >
> > https://github.com/intel-aero/meta-intel-aero/blob/4ebb7cc829f57306b9895f20af8fd17987089392/recipes-kernel/linux/linux-yocto/regulator.cfg
> >
> > Thanks,
> > Mauro
> >  
> 
> Dario

