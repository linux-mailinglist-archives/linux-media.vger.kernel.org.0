Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DA311BFFBB
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2020 17:09:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726814AbgD3PJx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Apr 2020 11:09:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726350AbgD3PJx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Apr 2020 11:09:53 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2F45C035494
        for <linux-media@vger.kernel.org>; Thu, 30 Apr 2020 08:09:52 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id y24so2329456wma.4
        for <linux-media@vger.kernel.org>; Thu, 30 Apr 2020 08:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=Df5VZnfWpNvKEF4XKPYINw2mdxMEPyt1qBvqYSHwZTg=;
        b=UPYsO41GVQ72aF0Tp/QyWSL3XDZHlQ5+ZSMEniWyFZZ7+jzDRrkPGYK4G1+/QvNRmQ
         yLu5At5F4oFa0cV6HD189iYNPFYc9FKa+oZ2aFOV6p945GkZx3bcCqRhwKwxV72XEwUt
         yf5N/kUYAqT5yhvfYw6EH/x/7CgCy0e7I0f7Ycm91y5yz1PNK19HIpRCxAZJOItkHJZT
         rSzDora32yRgy3Xs2CLAHeKrrfNO3maoEyP5/NoaIQmTDlcW5qhCOtXtxmZ10bk9bAJu
         kZNSm+sDwQ7FBby1/6j5zIxrojeVRkfUMdR/qcV7cBvJJxp77zK9vf9iDwxmBDnfiRLC
         E7/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=Df5VZnfWpNvKEF4XKPYINw2mdxMEPyt1qBvqYSHwZTg=;
        b=QeYsqddFBGTIDFpw90v7Hx+2ikQiqwsCI9qbnRujsMaBbDT7g0CM5mm41v4ktMw1yP
         CNkiXJ85KJh+GCKoQ1GpkFeT2QtRh5ubbLaW4HbfkNLiTT0GpzSJDMnZl1eFEJXDIXMB
         VljhlMlKQNNto40qffpU/FIYA8oJxQX/LIJrGwa5kUnydJQh/6BbKLiG9NqPtbZmrApV
         SIVqF7JJk7n6zA1hGkfxcbSC/1Eg5qB5wepaJnTcxoizpQJR0UguMj0B7Vzu2fq8vKDC
         SPTW4Q9Ae1XivMzDDdNJ0FshQjWqcVOmm4CpaA23qtTTEHmbnhBlUtS+Uaf9S0TAS9kK
         25FA==
X-Gm-Message-State: AGi0PuYFKBb4wUjH9xW9KhDiQsuGL3TW6UPOQLyhexjSMC2A0Cle4Pyt
        h9p5ef33otDk0Rs0CgSS98+5QkccJH4=
X-Google-Smtp-Source: APiQypJNK+q8+KVrlWjXRt7hmZodOrhtK1XRS3owSxQtAVyDuoPDx5rQVX802D8ujRim7G6N3odUdg==
X-Received: by 2002:a1c:a90a:: with SMTP id s10mr3268200wme.99.1588259390785;
        Thu, 30 Apr 2020 08:09:50 -0700 (PDT)
Received: from [192.168.0.104] (77-56-155-30.dclient.hispeed.ch. [77.56.155.30])
        by smtp.gmail.com with ESMTPSA id d133sm14276263wmc.27.2020.04.30.08.09.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2020 08:09:49 -0700 (PDT)
From:   Patrik Gfeller <patrik.gfeller@gmail.com>
Subject: Re: atomisp kernel driver(s)
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-media@vger.kernel.org
References: <f3348096-1fb3-5368-ba66-f42a300bde8e@gmail.com>
 <20200418172654.74a1eeea@coco.lan>
 <1d529105-3b7d-38d0-b7a2-d385b2221ff7@gmail.com>
 <20200420013109.65babb54@coco.lan>
 <e45de3ea-4b5c-f2d0-0844-1233ca15a939@gmail.com>
 <eb83f789-9595-55f0-d922-bab00ae85cff@gmail.com>
 <20200420224750.28c0181d@coco.lan>
 <dd8ab5df-31c7-f009-36e4-ca4fd0605e97@gmail.com>
 <20200422211344.2ec3d93e@coco.lan>
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
Message-ID: <403b799e-6ae9-d62b-1f3a-a1b6b874071b@gmail.com>
Date:   Thu, 30 Apr 2020 17:09:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430125544.10a9830d@coco.lan>
Content-Type: multipart/mixed;
 boundary="------------04DF05017D92AAC7545CB970"
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a multi-part message in MIME format.
--------------04DF05017D92AAC7545CB970
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


Am 4/30/2020 um 12:55 PM schrieb Mauro Carvalho Chehab:
> Em Thu, 30 Apr 2020 09:56:53 +0200
> Patrik Gfeller<patrik.gfeller@gmail.com>  escreveu:
>
>> For my first test tried to re-compile to module, without the whole
>> kernel. That was a mistake, as I mixed something up, probably it loaded
>> an old version of the module ... to be on the save side the steps I used
>> this time (in case we see something unexpected and for my later reference):
>>
>> $ git log --oneline
>> 4c922df10252 (HEAD -> atomisp, origin/atomisp) media: atomisp2: get rid
>> of ia_css_sc_param.h version dependency
>> ...
>>
>> $ make -j4 clean
>> $ make -j4
>> $ sudo make modules_install INSTALL_MOD_STRIP=1
>> $ sudo make install
> Please try to build from this branch:
>
> 	https://git.linuxtv.org/mchehab/experimental.git/log/?h=atomisp_v2
>
> You'll need to setup a new config var there. So, please run this before
> make clean. So, for building it, you will do:
>
> 	$ ./scripts/config -e CONFIG_VIDEO_ATOMISP_ISP2401 && make -j modules_prepare
> 	$ make -j4 clean && make -j4
> 	$ sudo make modules_install INSTALL_MOD_STRIP=1 && sudo make install
>
> This won't change the regulator detection, but it should hopefully use
> the ISP2401-specific code, with seems to be needed for your device.

I've updated to the latest source (git checkout atomisp_v2 && git pull) 
and compiled using the instructions above. Compilation worked well, but 
the linker had some problems (full log attached):

...
ld: 
drivers/staging/media/atomisp/pci/css_2401_system/hive_isp_css_2401_system_generated/ia_css_isp_states.o:(.data+0x0): 
multiple definition of `ia_css_kernel_init_state'; 
drivers/staging/media/atomisp/pci/css_2401_csi2p_system/hive_isp_css_2401_system_csi2p_generated/ia_css_isp_states.o:(.data+0x0): 
first defined here
...

Not sure if I can help with that. Sounds like we have to remove 
definitions - which I might be able to do. But I would need to know 
where the right place is to keep the definitions. If a code generator is 
involved (one of the paths looks like it) it will be more difficult for 
me. But with some hints I'm of course willing to give it a shot. Please 
give me an example of a definition) and a hint in case we deal with 
generated code.

> Ah, when replying, could you please use an emailer that won't be breaking
> long lines? Your emailer is currently breaking lines longer than 80 columns,
> with is quite annoying when checking log results ;-)
I changed the configuration of my mail client; a test message looked ok. 
Let me know if the problem persists.
>
> Thanks,
> Mauro

with kind regards
Patrik


--------------04DF05017D92AAC7545CB970
Content-Type: application/gzip;
 name="linker.txt.tar.gz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="linker.txt.tar.gz"

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
BQUFBQUFBQUFBQUFBQXFa4z/AGuLS28AoAAA
--------------04DF05017D92AAC7545CB970--
