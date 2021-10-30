Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3310440849
	for <lists+linux-media@lfdr.de>; Sat, 30 Oct 2021 11:50:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231726AbhJ3Jwv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 Oct 2021 05:52:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230427AbhJ3Jwv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 Oct 2021 05:52:51 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63DDBC061570;
        Sat, 30 Oct 2021 02:50:19 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id iq11so1947954pjb.3;
        Sat, 30 Oct 2021 02:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=QR49tsHTkUyyQq199dvFub85jiGbHgS2uVvULKd7YCI=;
        b=iSZ9jhIlksHfkkVSEw8XzTCeqfMWlpdN6+pAOCTgpnO2pc4BTiC7bIPdcvWk+LCJR1
         H7urdezKLbNwYjNClde0K8rmwKs8Ru0I99ANDIARy0Ltcmfwts7e07RPCkRyh2Ob/1VO
         2uZGm6EoHPXjP+HclPwtKri8xOrM6B9HBiZT4QRDAkS9prZzV+D0yck3JuXtdc/SVjnv
         /4rBAp8vpPITPQaUD2IlLNWofeKPr+wifb/Ec75r1Dkojh7EtwU7ZibW785ltkopOyv7
         dY+lFS6FCm9oxolAc9dtIRzl+tYj3pdQZYrLGyoPuak9Kb2eLbB+hRShHTwiC30Wyw7g
         mPHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=QR49tsHTkUyyQq199dvFub85jiGbHgS2uVvULKd7YCI=;
        b=j+8kwkAExISRLr6sver/Bgn4x93z8PmFi4PPlPCDSVMBG+uHmI8Lkmm1BwvF3OjUUt
         bjXG6qKt3VH5AhVHEfvtqIwmeH8yruF8udHH6KEJOwSgBEW+nd3Cx+8JQRZ8M3u2EY01
         eFxt3LowAcnzexOOKb7TeZjXwXIMhfWXpxYANZPWhZqK5/ExL/oJMlMnRjXpisrDiACj
         o7NyGrWS2fvU5yx6vsYGFq41I2iI3jLCYAU2MVhPpumwhw1zlRDvxckVJZ9bVU5Cm3R2
         O5MRIfvK6BxSqkfX7DkxoFu6kU/F5Hucfne8rG9WMDJWL71yYdmYFRz+UDgGh0VZW4XB
         WFzA==
X-Gm-Message-State: AOAM533C2zupWmgaugN/QD6UrquAAkJhsu2kqFDcnK5Juo5xgR3IIt0Z
        sWXu42+2CuYPmo79qMwm/rg=
X-Google-Smtp-Source: ABdhPJxkfv6TYT7etIr1qbadZkDfE8SgPxEOvDt6bU/jdK/b1ZvFqWl9D7Of4CLFRNbH469PES315A==
X-Received: by 2002:a17:902:8bcc:b0:13f:ea68:a135 with SMTP id r12-20020a1709028bcc00b0013fea68a135mr14480067plo.41.1635587418651;
        Sat, 30 Oct 2021 02:50:18 -0700 (PDT)
Received: from ?IPv6:2400:4052:6980:3800:dba7:2b1f:3f26:a5ec? ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id y14sm8912178pfn.80.2021.10.30.02.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Oct 2021 02:50:18 -0700 (PDT)
Message-ID: <1a1da60c4464bd163e9c401e04db3b58172ae7fc.camel@gmail.com>
Subject: Re: [PATCH 00/17] various fixes for atomisp to make it work
From:   Tsuchiya Yuto <kitakar@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Nable <nable.maininbox@googlemail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Fabio Aiuto <fabioaiuto83@gmail.com>,
        "andrey.i.trufanov" <andrey.i.trufanov@gmail.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>
Date:   Sat, 30 Oct 2021 18:50:14 +0900
In-Reply-To: <20211028115802.49258990@sal.lan>
References: <20211017161958.44351-1-kitakar@gmail.com>
         <00dd9a0286e194696f6cc083a98de47d709b1d9e.camel@gmail.com>
         <20211028115802.49258990@sal.lan>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2021-10-28 at 11:58 +0100, Mauro Carvalho Chehab wrote:
> Em Thu, 28 Oct 2021 13:32:29 +0900
> Tsuchiya Yuto <kitakar@gmail.com> escreveu:
> 
> > <Fixed Cc list>
> > 
> > On Mon, 2021-10-18 at 01:19 +0900, Tsuchiya Yuto wrote:
> > > [...]
> > >   ## taking a picture with atomisp
> > > 
> > > Note that to try to take a picture, please also apply at least the
> > > this RFC patch ("[BUG][RFC] media: atomisp: pci: assume run_mode is
> > > PREVIEW") I'll send as almost a BUG report later.
> > > 
> > > You need to use firmware version irci_stable_candrpv_0415_20150521_0458,
> > > which is available from the intel-aero [1]  
> > 
> > Just in case, the hash (as well as version) of firmware which I
> > downloaded from intel-aero and I use to capture is the following:
> > 
> >         $ sha256sum /lib/firmware/shisp_2401a0_v21.bin
> >         e89359f4e4934c410c83d525e283f34c5fcce9cb5caa75ad8a32d66d3842d95c  /lib/firmware/shisp_2401a0_v21.bin
> > 
> >         $ strings /lib/firmware/shisp_2401a0_v21.bin | grep 2015
> >         irci_stable_candrpv_0415_20150521_0458

Also note that the firmware file from the intel-aero only supports
hw_revision 2401a0_v21 as the filename implies. So, if someone have
Bay Trail (ISP2400) device to test, you need to get a firmware file (from
somewhere like Android installation/image as the initial commit of atomisp
mentions) made for version irci_stable_candrpv_0415_20150521_0458 and
hw_revision 2400b0_v21 then place it under /lib/firmware

> > > The atomisp (ipu2), like the ipu3, needs userspace support. The libcamera
> > > has now decent ipu3 support but does not have atomisp support yet.
> > > 
> > > I found some userspace tools for atomisp that run on Linux:
> > > 
> > >   - capturev4l2 from intel-aero/sample-apps
> > >     (https://github.com/intel-aero/sample-apps/tree/master/capturev4l2)
> > >   - hd-camera from intel-aero/sample-apps
> > >     (https://github.com/intel-aero/sample-apps/tree/master/hd-camera)
> > >   - intel/nvt
> > >     (https://github.com/intel/nvt)
> > > 
> > > It looks like the nvt is the most feature-rich, like exposure and white
> > > balance. Note that current upstreamed atomisp dropped 32-bit support.
> > > So, you need to build it with `-m64` (change it in Makefile). Here is
> > > the example of usage I use on mipad2:
> > > 
> > >         $ ./v4l2n -o testimage_@.raw \
> > >                 --device /dev/video2 \
> > >                 --input 0 \
> > >                 --exposure=30000,30000,30000,30000 \
> > >                 --parm type=1,capturemode=CI_MODE_PREVIEW \
> > >                 --fmt type=1,width=1920,height=1080,pixelformat=NV12 \
> > >                 --reqbufs count=2,memory=USERPTR \
> > >                 --parameters=wb_config.r=32768,wb_config.gr=21043,wb_config.gb=21043,wb_config.b=30863 \
> > >                 --capture=2 \
> > > 
> > >         ./raw2pnm -x1920 -y1080 -fNV12 testimage_001.raw testimage_001.pnm
> > >         feh *.pnm # open the converted image
> > >         rm testimage*
> 
> Great! that worked for me too on Asus T101HA (CHT). I had to tweak the
> resolution, as ov2680 sensor has a max of 1616x1216 30fps. I had
> to use a number smaller than that, though (1600x1200).

Ah, glad to hear that!

> I guess the next step is to make a generic app to also work on it. 

It's great if we can eventually add atomisp support to the libcamera.
I think this is the easiest way to support generic apps (I mean, like
cheese). Some ipu3 cameras already work on cheese with libcamera.
I don't have any knowledge about userspace support though.

> > > 
> > > Note that I see the following warn/err after capture:
> > > 
> > >         kern  :warn  : [72660.793335] atomisp-isp2 0000:00:03.0: stop stream timeout.
> > >         kern  :err   : [72660.973629] atomisp-isp2 0000:00:03.0: atomisp_reset
> > > 
> > > but I see the same message on the Android kernel, too. So, I think this
> > > is not a real issue (I hope).
> 
> Same here.
> 
> > > 
> > > [1] https://github.com/intel-aero/meta-intel-aero-base/tree/master/recipes-kernel/linux/linux-yocto
> > >     filename shisp_2401a0_v21.bin  
> > 
> > 


