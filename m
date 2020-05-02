Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97DDC1C264A
	for <lists+linux-media@lfdr.de>; Sat,  2 May 2020 16:50:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728075AbgEBOuz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 May 2020 10:50:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728025AbgEBOuy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 2 May 2020 10:50:54 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D81FC061A0C
        for <linux-media@vger.kernel.org>; Sat,  2 May 2020 07:50:53 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id e16so10241368wra.7
        for <linux-media@vger.kernel.org>; Sat, 02 May 2020 07:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jks+D9lBnROSyinbY5eW/HlZnE6nItNFznpgFxdk9f8=;
        b=oCFfrt3txJbO/e7PYrHLZZSwiumGmIv7tb5MhdX52UxQ/Ml5ZNrt3RsbDyyn5x0PBh
         RUlTOfrgVGlfxNy0gFkqHioyBhTgBXxBIP5D2E70HSERdG3D9Q4O+SNHgGEPYpIIVbL6
         WPemEvnsIbWQ2qg9e4qPacV7GUQWebaCXCCImwLhpcBqS2ithy00VLKPFt7HFja8fAMa
         VOby7vsEoclOPV3naTZfou1Bt/HR9SHHHclLBuazxrt9FPUF8ZvOYIFID207VY9XXXsz
         6E4vZPaoqn5tZh3F1xW62x7e3g0UFJPwTzVNIqtg9V3YbL4HBzCr9+rnTKDqgPtxRMD1
         dHJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jks+D9lBnROSyinbY5eW/HlZnE6nItNFznpgFxdk9f8=;
        b=PjGeAkUnzoFnb+Josx67780UqFCfAaORpyJJ2/TWhGX04oxZB8W6WX5ff3GPPG/iYp
         4jcYizhU3FcAn3/USDFMhPD3HaHpM4AU1tZQjo0F/EeSey9yrz3wtNvI2Lo7Hbuj+CC4
         QKaDLkdmllSDW/hYA9SStc9r0EtAl7yhIktsySgrQ8dS/B5IAhaDTxcpSsKOFBgcYDFp
         lCwrjsaU++J6dvdbDCFWJ3pynY2jH9BqVX+oobTuEeHH0PGEo5YWYarAsZHFM/1Md7gQ
         2uO4NRPfvVFi9Zs4E4bncUmlz/9HhJ9kMDfk6UD2mr4wEPNmgmfwK9+pBtEyk2g1a7pp
         ofZQ==
X-Gm-Message-State: AGi0PuZMGVRP2pjBNQJLG4rnUh3OyQYcf/NKdgQqiiWgnrhBrLFI13Rc
        ZISQUFBlIX7gSW5vy+FzlxI=
X-Google-Smtp-Source: APiQypIxm3EQt+SGl975DR76EqFug2sWKlTtyduJLcrJCHTXSPtH183/EpU+v/uv7OVv2zU75gYVoA==
X-Received: by 2002:a5d:6b89:: with SMTP id n9mr9641683wrx.356.1588431051424;
        Sat, 02 May 2020 07:50:51 -0700 (PDT)
Received: from ASUS (77-56-155-30.dclient.hispeed.ch. [77.56.155.30])
        by smtp.gmail.com with ESMTPSA id h17sm4373282wmm.6.2020.05.02.07.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2020 07:50:51 -0700 (PDT)
Date:   Sat, 2 May 2020 16:50:48 +0200
From:   Patrik Gfeller <patrik.gfeller@gmail.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: atomisp kernel driver(s)
Message-ID: <20200502165048.7a1891e2@ASUS>
In-Reply-To: <20200502113414.618964a9@coco.lan>
References: <f3348096-1fb3-5368-ba66-f42a300bde8e@gmail.com>
        <23b3a078-2a9a-5f50-a35e-9f40f5aa8a6e@gmail.com>
        <86413836-e4b5-cb53-3ac0-1764c693ec7b@gmail.com>
        <682558b0-a2cf-9fe2-6e54-20462ecccb5d@gmail.com>
        <20200425132255.4bf872b2@coco.lan>
        <131a4247-cef3-d651-a0ea-defd32b8bf20@gmail.com>
        <20200426185007.1954885a@coco.lan>
        <45817a6a-dd2f-13a6-835b-fd2b04ded23f@gmail.com>
        <20200427235027.15cd4e03@coco.lan>
        <d9ec5067-142c-66c9-c412-51ddf38e44f7@gmail.com>
        <20200429011339.03af3c2a@coco.lan>
        <3b7366b9-463d-c49b-0f2d-51a1d5475a9d@gmail.com>
        <20200429201753.3b2d679b@coco.lan>
        <6fffdf73-a0eb-1b1c-d894-e4799b8ef944@gmail.com>
        <20200430125544.10a9830d@coco.lan>
        <403b799e-6ae9-d62b-1f3a-a1b6b874071b@gmail.com>
        <20200501002510.0ead955d@coco.lan>
        <1a17ffad-9792-a4ff-519e-a4306e7bf3e1@gmail.com>
        <20200501113812.7f16b7ca@coco.lan>
        <20200501192844.397efcaa@ASUS>
        <20200501213023.7fe29188@coco.lan>
        <20200502101542.2972010a@ASUS>
        <20200502113414.618964a9@coco.lan>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, 2 May 2020 11:34:14 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Em Sat, 2 May 2020 10:15:42 +0200
> Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:
> 
> > On Fri, 1 May 2020 21:30:23 +0200
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> >   
>  [...]  
> 
>  [...]  
> > 
> > Cool, the code might give additional information.  
> 
> Yes. And, as it was released from Intel for a specific device,
> it should very likely work for the model supported there (with
> the Yocto 4.4 Kernel). So, it could be valuable to help identifying
> if some of the cleanup patches would have broken something.
> 
> ON a quick look, it sounds that such build was is targeted for
> ISP2401:
> 
> 	+++ b/drivers/media/pci/atomisp/Makefile
> 	@@ -0,0 +1 @@
> 	+obj-$(CONFIG_VIDEO_ATOMISP) += css2401a0_v21_build/
> 
> > I've also send a
> > request regarding the firmware and HW documentation to the author and
> > the engineers that signed the patch. The firmware in the patch has a
> > different version string and the size is surprisingly a few MB bigger
> > than the one I used for the first experiment.   
> 
> There are some vendors that generate a firmware together with a source
> code. This could be the case here. That's my feeling when looking into
> a file like:
> 
> 	drivers/staging/media/atomisp/pci/css_2401_system/spmem_dump.c
> 
> Which contains lots of addresses that it is different betwen 2401 and
> 2400.
> 
> If so, using a different firmware version will likely cause at least
> some parts of the driver to fail.
> 
> 
> > I'll give that one a try as well.
> >   
>  [...]  
> > 
> > It looks a this firmware is for the 2400 variant; I could also not
> > extract the irci version string. Thus I'll not try them for the moment
> > to perform experiments.  
> 
> Ok.
> 
>  [...]  
> > 
> > It identifies itself as irci_stable_bw10p_0518_20150801_0537;   
> 
> Same year as what we had. Just a little older. Yeah, some things there
> could work.

I found another place where the irci_stable_bw10p_0518_20150801_0537
firmware is used together with patches for atomisp 2401. So I assume the
code there matches this firmware. Eventually some of the patches listed
there can be used as information source:

https://github.com/croutor/atomisp2401

> 
> > I'll give
> > that one a try first. As usual it will unfortunately take some time
> > until I get back to you with the results, as every experiment takes
> > many hours (building the kernel on what is essentially a tablet takes
> > time).  
> 
> I would suggest you to build on some other machine. Btw, you don't need
> to build everything every time. If you build atomisp as a module, you
> could do, instead:
> 
> 	$ make modules_prepare && make M=drivers/staging/media/atomisp
> 
> This will build just the new module(s).
> 
>  [...]  
> 
> Btw, the patch I send earlier today should fix this issue.
> 
> -
> 
> I need to understand a little bit more about how ACPI is supposed to
> detect and register regulators. While using regulators with DT is very
> common, not many places use it for ACPI. 
> 
> I'm suspecting that, before being able of calling regulator_get(),
> the code should use some match logic to get the regulators on this
> board and call regulator_register().
> 
> Please run this command on your tablet:
> 
> 	$ sudo cat /sys/kernel/debug/regulator/supply_map
> 
> If this returns nothing - as I suspect - then calling regulator_get()
> won't be doing anything. 
> 
> Thanks,
> Mauro

with kind regards,
Patrik
