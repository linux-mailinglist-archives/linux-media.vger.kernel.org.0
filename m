Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16D03FFC9
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2019 20:39:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726733AbfD3Siy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Apr 2019 14:38:54 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:56278 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726723AbfD3Six (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Apr 2019 14:38:53 -0400
Received: by mail-wm1-f65.google.com with SMTP id o25so4891976wmf.5
        for <linux-media@vger.kernel.org>; Tue, 30 Apr 2019 11:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=1HGBBCPlT2AoDn2CTEbFa4Em9ZM3pcnUJIESCh7qWK8=;
        b=Q7JhCDnr37fx4hAYzsJW51R6iUGirT+xX3qlC3s1CSwUndZ9nbCOinAuO9P/buaXyv
         erY+zC10ffqrUBvErkUSnk6zqAwWsbyJ2mBBE+kiaLLsOnE8JgI55sFTSaKsp51nnBv7
         /Rowc46+JFcc1fnVff7TWYocFWk10lAa8bi3QbhwF0XHdrKVZYDk46Fnuh0aKGQ6hAkj
         b3SxwNkG1kseVA/da5oU7HuoE0kaX6/afPQyZKE400CoH+t8qZNIniZmv7Y0dZ3KOnc1
         9hht2VvI9cWeQ1/GzLoUMVgUGjQtt425rz83nZXQe5HDC5jGkkpS5k3mmUcptrKOq/f1
         Ifyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=1HGBBCPlT2AoDn2CTEbFa4Em9ZM3pcnUJIESCh7qWK8=;
        b=Pzk07+B8v/7yXU6ZkUGo9M1buY5IfYkX9q+97J1L+xQWuSD4V+SEQ+u5iFYg4k5Hg8
         fj6eT6LcblcfPkNxssFuDqrQ7+QJEzW7bQfnkat0pCnF4VtKO+iudLITe0nb++zkTZyv
         9zERC1LfdcD6gGFgqlO7LjGUyReG7OnKcF+v9aijwqDwXHVVDGXPDUrShrfUUwFJCc7e
         GHLK8nP9fVEG5/EXQIz5IznlHorhQ6DHybITNAYof1l/ok8Jz+2FUwtyVFgqCW85nSzg
         ETVQXxRK0Wr9SkLHzcfioqTHIAIwYqk5StgaQ5z0wNiJ3XMKNPn+y9Gyiv8hxU+WzYZ4
         nkNw==
X-Gm-Message-State: APjAAAVadT65reBiBugzva/46ov3MaCBKiKAKwdf1gQ/FbWIDWazCGD5
        oNLkiUObZxupu9VKewEPoDX2lwCkthg=
X-Google-Smtp-Source: APXvYqxQXAv2Lno4WIU/SqqZ2V/UmX+8KmKjK5//TfZrwST+44gsmtTyyrAFWFNsstwHkkn5lu7wVQ==
X-Received: by 2002:a1c:9ac7:: with SMTP id c190mr4063698wme.149.1556649530573;
        Tue, 30 Apr 2019 11:38:50 -0700 (PDT)
Received: from arch-late (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id b184sm4355816wmh.17.2019.04.30.11.38.49
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Apr 2019 11:38:49 -0700 (PDT)
References: <20190428190916.26567-1-slongerbeam@gmail.com> <m3ef5jonnk.fsf@gmail.com>
User-agent: mu4e 1.2.0; emacs 27.0.50
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH v2 0/8] Switch to sync registration for IPU subdevs
In-reply-to: <m3ef5jonnk.fsf@gmail.com>
Date:   Tue, 30 Apr 2019 19:38:48 +0100
Message-ID: <m3bm0nnxs7.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve,
On Tue 30 Apr 2019 at 10:19, Rui Miguel Silva wrote:
> Hi Steve,
> On Sun 28 Apr 2019 at 20:09, Steve Longerbeam wrote:
>> Switch to sync registration for the IPU internal sub-devices, re-organize
>> modules, and a few other miscellaneous cleanups.
>
> FYI,
> Just got a run of this series on top of linux-media and got the
> bellow trace. I will take a better look this afternoon and let you
> know. 

Found the issue here, as it was intermittent, it is that mipi csis
is racy setting media entity pads. Need to set it in internal_ops.
I will send a patch for this later. but even with this fixed it
misses now the capturing of any frame. Need to debug it a little
more.

---
Cheers,
	Rui

>
> ---
> Cheers,
> 	Rui
>
>     7.968206] Unable to handle kernel NULL pointer dereference at virtual address 00000030
> [    7.976775] pgd = (ptrval)
> [    7.979510] [00000030] *pgd=992f8835, *pte=00000000, *ppte=00000000
> [    7.985876] Internal error: Oops: 17 [#1] SMP ARM
> [    7.990594] Modules linked in: brcmutil imx7_mipi_csis(C+) imx7_media_csi(C+) imx_media_common(C) ov2680 video_mux v4l2_fwnode mux_mmio mux_core evbug
> [    8.004114] CPU: 0 PID: 256 Comm: udevd Tainted: G         C        5.1.0-rc1-00222-g5e258c299364 #24
> [    8.013341] Hardware name: Freescale i.MX7 Dual (Device Tree)
> [    8.019111] PC is at media_entity_find_link+0x4/0x88
> [    8.024135] LR is at create_of_link+0x78/0xd4 [imx_media_common]
> [    8.030153] pc : [<c0941958>]    lr : [<bf03ebfc>]    psr: 20010013
> [    8.036430] sp : d92b5bdc  ip : 00000001  fp : 00000001
> [    8.041665] r10: bf065098  r9 : 0000001c  r8 : d92a2ce8
> [    8.046901] r7 : 00000001  r6 : d9387840  r5 : d9387840  r4 : 00000001
> [    8.053439] r3 : d929e4e0  r2 : 00000001  r1 : d929e4e0  r0 : 00000020
> [    8.059978] Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
> [    8.067125] Control: 10c5387d  Table: 9923006a  DAC: 00000051
> [    8.072882] Process udevd (pid: 256, stack limit = 0x(ptrval))
> [    8.078726] Stack: (0xd92b5bdc to 0xd92b6000)
> [    8.083095] 5bc0:                                                                00000001
> [    8.091290] 5be0: d9387840 bf03ebfc d92b5c14 db3a40c0 db3a09c4 db3a0c08 d9387840 d9352268
> [    8.099483] 5c00: d9352040 c1414948 0000001c bf03ecb0 00000000 db3a09c4 00000001 db3a40c0
> [    8.107677] 5c20: 00000001 3b0988f7 d9387840 d93523b0 d9352268 d9352040 d9352364 bf03e8ec
> [    8.115871] 5c40: d92a2ce8 d93775c0 c14ab278 d92a2d94 00000000 0000001c bf065098 c0958484
> [    8.124065] 5c60: d92a2ce8 d92b5cc0 d9397300 dadb7810 00000001 bf023164 00000001 bf065098
> [    8.132258] 5c80: dadb7810 d92a2ce8 d92a2ce8 d92a2c40 00000000 dadb7800 dadb7810 c1414948
> [    8.140451] 5ca0: d92a2ce8 00000001 bf0671a4 bf065b6c bf065098 dada61c0 d92a2c40 c3003f28
> [    8.148644] 5cc0: 00000000 3b0988f7 00000000 dadb7810 00000000 bf068014 00000000 00000000
> [    8.156838] 5ce0: bf068014 00000007 c1414948 c07ed148 dadb7810 c1c8c064 c1c8c068 00000000
> [    8.165032] 5d00: 00000000 c07eb070 dadb7810 bf068014 bf068014 c1414948 00000000 c14f0cd4
> [    8.173225] 5d20: c1c6bdec c07eb2bc c1414948 00000000 c14f0cd4 dadb7810 00000000 bf068014
> [    8.181418] 5d40: c1414948 00000000 c14f0cd4 c07eb568 00000000 bf068014 dadb7810 c07eb5c8
> [    8.189613] 5d60: dada0590 bf068014 c07eb570 c07e9414 d93a9300 dad4c0a4 dada0590 3b0988f7
> [    8.197806] 5d80: dad4c0d4 bf068014 d93a9300 c1495f38 00000000 c07ea470 bf0676cc c1414970
> [    8.206000] 5da0: c1414948 bf068014 c1414970 c1414948 bf06b000 c07ec248 c14f20e0 c1414970
> [    8.214194] 5dc0: c1414948 c0103078 c024f1b0 c018e6b0 00000000 3b0988f7 c1415078 d93cbd00
> [    8.222388] 5de0: 00000cc0 dac01e00 c1414970 000058da d93cbd40 c01ab5f4 c14f0eba c02a6e10
> [    8.230582] 5e00: c01e0b00 d93c1700 c01de6e4 0000000c 19fe0000 3b0988f7 bf068080 c14f2798
> [    8.238775] 5e20: d93cbd00 00000001 d93cbc70 bf068080 c1c6bdec c01de720 d93cbc70 bf068080
> [    8.246969] 5e40: c14f0dd6 c14f2798 c1414970 c01e0b4c bf06808c 00007fff bf068080 c01dd8dc
> [    8.255162] 5e60: 00000000 bf0680c8 c0e048d4 bf0681f0 bf068080 bf0681d4 c0e048b4 bf06829c
> [    8.263356] 5e80: bf000000 c10bc9bc 00000001 00000000 c11c139c c11aec30 00000000 00000000
> [    8.271548] 5ea0: 00000000 00000000 00000000 00000000 6e72656b 00006c65 00000000 00000000
> [    8.279740] 5ec0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> [    8.287933] 5ee0: 00000000 00000000 00000000 3b0988f7 7fffffff c1414948 00000000 00000009
> [    8.296126] 5f00: b6ede824 7fffffff 00000000 0000017b 00000000 c01e10d0 7fffffff 00000000
> [    8.304319] 5f20: 00000003 00000001 00000000 deb38000 000053b4 00000000 deb398c1 deb3ad00
> [    8.312512] 5f40: deb38000 000053b4 deb3cd9c deb3cbf4 deb3bb14 00004000 000044d0 00000000
> [    8.320705] 5f60: 00000000 00000000 000024d0 00000024 00000025 0000001e 0000001b 00000018
> [    8.328898] 5f80: 00000000 3b0988f7 0000002a 00000000 00000001 00000000 0000017b c01011c4
> [    8.337091] 5fa0: d92b4000 c0101000 00000000 00000001 00000009 b6ede824 00000000 00067098
> [    8.345284] 5fc0: 00000000 00000001 00000000 0000017b 00000000 00034708 0005cd80 00000000
> [    8.353477] 5fe0: becf78a8 becf7898 b6ed6e04 b6e70e52 60010030 00000009 00000000 00000000
> [    8.361696] [<c0941958>] (media_entity_find_link) from [<bf03ebfc>] (create_of_link+0x78/0xd4 [imx_media_common])
> [    8.372014] [<bf03ebfc>] (create_of_link [imx_media_common]) from [<bf03ecb0>] (imx_media_create_of_links+0x58/0xac [imx_media_common])
> [    8.384241] [<bf03ecb0>] (imx_media_create_of_links [imx_media_common]) from [<bf03e8ec>] (imx_media_probe_complete+0x58/0x1b8 [imx_media_common])
> [    8.397414] [<bf03e8ec>] (imx_media_probe_complete [imx_media_common]) from [<c0958484>] (v4l2_async_register_subdev+0xe8/0x1c4)
> [    8.409011] [<c0958484>] (v4l2_async_register_subdev) from [<bf023164>] (v4l2_async_register_fwnode_subdev+0x114/0xfb0 [v4l2_fwnode])
> [    8.421051] [<bf023164>] (v4l2_async_register_fwnode_subdev [v4l2_fwnode]) from [<bf065b6c>] (mipi_csis_probe+0x2e0/0x514 [imx7_mipi_csis])
> [    8.433604] [<bf065b6c>] (mipi_csis_probe [imx7_mipi_csis]) from [<c07ed148>] (platform_drv_probe+0x48/0x98)
> [    8.443451] [<c07ed148>] (platform_drv_probe) from [<c07eb070>] (really_probe+0x1dc/0x2cc)
> [    8.451734] [<c07eb070>] (really_probe) from [<c07eb2bc>] (driver_probe_device+0x5c/0x160)
> [    8.460016] [<c07eb2bc>] (driver_probe_device) from [<c07eb568>] (device_driver_attach+0x58/0x60)
> [    8.468906] [<c07eb568>] (device_driver_attach) from [<c07eb5c8>] (__driver_attach+0x58/0xd0)
> [    8.477449] [<c07eb5c8>] (__driver_attach) from [<c07e9414>] (bus_for_each_dev+0x70/0xb4)
> [    8.485644] [<c07e9414>] (bus_for_each_dev) from [<c07ea470>] (bus_add_driver+0x198/0x1d0)
> [    8.493926] [<c07ea470>] (bus_add_driver) from [<c07ec248>] (driver_register+0x74/0x108)
> [    8.502039] [<c07ec248>] (driver_register) from [<c0103078>] (do_one_initcall+0x80/0x31c)
> [    8.510237] [<c0103078>] (do_one_initcall) from [<c01de720>] (do_init_module+0x5c/0x1f4)
> [    8.518347] [<c01de720>] (do_init_module) from [<c01e0b4c>] (load_module+0x222c/0x255c)
> [    8.526368] [<c01e0b4c>] (load_module) from [<c01e10d0>] (sys_finit_module+0xbc/0xdc)
> [    8.534217] [<c01e10d0>] (sys_finit_module) from [<c0101000>] (ret_fast_syscall+0x0/0x28)
> [    8.542405] Exception stack(0xd92b5fa8 to 0xd92b5ff0)
> [    8.547471] 5fa0:                   00000000 00000001 00000009 b6ede824 00000000 00067098
> [    8.555664] 5fc0: 00000000 00000001 00000000 0000017b 00000000 00034708 0005cd80 00000000
> [    8.563854] 5fe0: becf78a8 becf7898 b6ed6e04 b6e70e52
> [    8.568922] Code: e3e04015 eaffffd1 fffffdfd e92d4030 (e5904010) 
> [    8.575093] ---[ end trace 04afa547993602ba ]---
>
>>
>> History:
>> v2:
>> - Added a patch that improves the pipeline upstream/downstream search
>>   functions, which no longer require the media device.
>> - Add a patch to remove getting media device from v4l2_dev driver data.
>>
>> Steve Longerbeam (8):
>>   media: staging/imx: Switch to sync registration for IPU subdevs
>>   media: staging/imx: Pass device to alloc/free_dma_buf
>>   media: staging/imx: Move add_video_device into capture_device_register
>>   Revert "media: imx: Set capture compose rectangle in
>>     capture_device_set_format"
>>   media: staging/imx: Remove capture_device_set_format
>>   media: staging/imx: Re-organize modules
>>   media: staging/imx: Improve pipeline searching
>>   media: staging/imx: Don't set driver data for v4l2_dev
>>
>>  drivers/staging/media/imx/Makefile            |  18 +-
>>  drivers/staging/media/imx/imx-ic-common.c     |  68 +--
>>  drivers/staging/media/imx/imx-ic-prp.c        |  36 +-
>>  drivers/staging/media/imx/imx-ic-prpencvf.c   |  88 ++--
>>  drivers/staging/media/imx/imx-ic.h            |   6 +-
>>  drivers/staging/media/imx/imx-media-capture.c |  75 ++-
>>  drivers/staging/media/imx/imx-media-csi.c     |  45 +-
>>  .../staging/media/imx/imx-media-dev-common.c  | 346 +++++++++++++-
>>  drivers/staging/media/imx/imx-media-dev.c     | 449 +-----------------
>>  drivers/staging/media/imx/imx-media-fim.c     |   9 -
>>  .../staging/media/imx/imx-media-internal-sd.c | 357 ++++++--------
>>  drivers/staging/media/imx/imx-media-of.c      |  41 +-
>>  drivers/staging/media/imx/imx-media-utils.c   | 170 +++----
>>  drivers/staging/media/imx/imx-media-vdic.c    |  84 +---
>>  drivers/staging/media/imx/imx-media.h         | 113 +++--
>>  drivers/staging/media/imx/imx7-media-csi.c    |  43 +-
>>  16 files changed, 848 insertions(+), 1100 deletions(-)

