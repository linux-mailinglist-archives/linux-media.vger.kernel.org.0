Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0526F91A03
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2019 00:43:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726120AbfHRWlE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Aug 2019 18:41:04 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:46849 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726107AbfHRWlE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Aug 2019 18:41:04 -0400
Received: by mail-pg1-f195.google.com with SMTP id m3so5167821pgv.13;
        Sun, 18 Aug 2019 15:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=fWYYRNOoBOYDq4LbQtRg/f2l0aWrGmocM0PfWqGUAY4=;
        b=XSlO3H82pGj99uAaz3Mh0ZBRkFrf+IMtqzUPQFc/a7UO3Ln9+urIfvEEkmKIZRUKJ6
         0kFOKtvF2xwwD/su4EbhPm72fmxKzs8hHgoDhWlWoz1tkzJJaXN8C47NkFnIHhh7p+he
         JDnl9ZxP3eIVdRROqK2EKDlg8lKoIEckfc/edVGRo82kmAxDrcWrZMPTPGiC/ilvZO4A
         cstlodeNt4bsoPJsADx6jHcaz6r2/DAz5EK9fkr8lxSnrk0CEQABnsFGOZLg3bvyUBHz
         RHTMFGgpZPJIRPsVdQOC68ByB3GRfvGxY7aCcGeSmG51H3gujMvLclGDArNJuJgHTTpk
         TnmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=fWYYRNOoBOYDq4LbQtRg/f2l0aWrGmocM0PfWqGUAY4=;
        b=lPdHN/5T2Oeigpk/8Qh2LzeJDJgwOiAeh7/U4BeRVNLCIdxnsuWEKF5Gl4FUqKIeco
         g7BDQ22TBQpsnyWiXmYG/2VIPcdl+8yP6i5lb8+1kcThFc4k29Mtd9RW3aOZ/0e7EB+F
         dpZRsCo2hN04qFu0mSTBCS3f4CcUoB5gk8Pb0YLnCsxeOcFXOK6CdWEJPAqY70RUNa74
         x6n89/piJbTgUShSw/UKxC4b7i64B3RjC6KyfXMi3NGrZZFI+AXoeZXnRmQwcZc2zO8i
         YVUIJzSgOCsuYJuq/ILjQZFyJzxXwVwdTbSXJbnKHCMyDnXET/uELTF4gwdAcJzLuKXo
         uqrg==
X-Gm-Message-State: APjAAAUTEi92RxDmESzXRmpMrsBtTA4og4nQPVD98kuJQUhPniUGGexU
        J5wsZkxuOn2JPeMWUPZB/ss=
X-Google-Smtp-Source: APXvYqx4ZhZFely0TYocR/6P0NAEseE/xiYmUzuTAY4QBwJ/Drq2ZsSfryG7zMTHBeWoGsWS4BPXTQ==
X-Received: by 2002:a63:e62:: with SMTP id 34mr17079396pgo.331.1566168063111;
        Sun, 18 Aug 2019 15:41:03 -0700 (PDT)
Received: from [192.168.1.54] (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.gmail.com with ESMTPSA id m9sm24735010pgr.24.2019.08.18.15.41.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 18 Aug 2019 15:41:02 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
Subject: Re: [BUG] removing and reinserting imx-media causes kernel to explode
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     linux-media@vger.kernel.org,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        open list <linux-kernel@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        NXP Linux Team <linux-imx@nxp.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
References: <20190814092506.GH13294@shell.armlinux.org.uk>
Message-ID: <09dd63bd-2605-dfd5-ad6f-4083f3f52705@gmail.com>
Date:   Sun, 18 Aug 2019 15:41:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190814092506.GH13294@shell.armlinux.org.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 8/14/19 2:25 AM, Russell King - ARM Linux admin wrote:
> I just did this:
>
> rmmod imx-media
> modprobe imx-media
>
> and was greeted by the below kernel messages.

Yes this needs fixing, the CSI needs to check first that it is already 
registered before going through the ->registered() steps. Posting a patch.

>    I don't think this has
> been the first issue I found with the iMX media stuff involving a module
> unload/reload cycle - may I suggest that this is added to the testing
> regime for this code?  Thanks.

I do test module unload/reload cycles, but v4l2-async does not support 
re-registering subdevices unless the subdevice is basically completely 
removed and re-probed, so there won't be a working media device if only 
imx-media is reloaded. So I have always unloaded/reloaded all modules 
for every entity in the graph, i.e.:

rmmod imx6_media imx6_media_csi imx6_mipi_csi2 ov5640 video_mux 
imx_media_common

(replace ov5640 with your imx219 sensor).

But I'll make sure to test single module unload/reload cycles in the future.

But note after applying the patch mentioned above to CSI ->registered() 
callback, there are list corruption backtraces, see [1]. The root cause 
is that both media_device_register_entity() and media_entity_pads_init() 
add the same graph objects for the entity's pads, so duplicate pad 
objects are added to the media device pads list. Removing the pad object 
creation in media_device_register_entity() fixes the list corruption. 
Sending a patch for that also.

This is a problem for any entity that sets its ->num_pads to a non-zero 
value before media_device_register_entity() is called. For example, the 
following will produce the same list corruption backtrace:

rmmod video-mux
modprobe video-mux
rmmod video-mux

Steve

[1]
rmmod imx6-media
modprobe imx6-media
rmmod imx6-media

[  249.387953] WARNING: CPU: 2 PID: 843 at lib/list_debug.c:53 
__list_del_entry_valid+0xa0/0xdc
[  249.396442] list_del corruption. prev->next should be e8fb0510, but 
was e93b5914
[  249.404076] Modules linked in: imx6_media_csi(C) imx6_media(C-) 
imx6_mipi_csi2(C) bnep dw_hdmi_ahb_audio dw_hdmi_cec ov5640 mux_mmio 
video_mux mux_core dw_hdmi_imx dw_hdmi coda_vpu cec imx_vdoa 
videobuf2_vmalloc imx_media_common(C) v4l2_fwnode imx_ldb imxdrm 
imx_ipu_v3 [last unloaded: imx6_media_csi]
[  249.430956] CPU: 2 PID: 843 Comm: rmmod Tainted: G C        
5.3.0-rc4-01115-g62119fd20fda #5
[  249.440115] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
[  249.446689] [<c0113a58>] (unwind_backtrace) from [<c010de5c>] 
(show_stack+0x10/0x14)
[  249.454462] [<c010de5c>] (show_stack) from [<c0bdfdcc>] 
(dump_stack+0xd8/0x110)
[  249.461804] [<c0bdfdcc>] (dump_stack) from [<c0128c28>] 
(__warn+0xe0/0x10c)
[  249.468789] [<c0128c28>] (__warn) from [<c0128c98>] 
(warn_slowpath_fmt+0x44/0x6c)
[  249.476301] [<c0128c98>] (warn_slowpath_fmt) from [<c04e8e00>] 
(__list_del_entry_valid+0xa0/0xdc)
[  249.485207] [<c04e8e00>] (__list_del_entry_valid) from [<c07e2b8c>] 
(media_gobj_destroy.part.4+0x30/0x64)
[  249.494802] [<c07e2b8c>] (media_gobj_destroy.part.4) from 
[<c07e01d4>] (__media_device_unregister_entity+0xa8/0xcc)
[  249.505259] [<c07e01d4>] (__media_device_unregister_entity) from 
[<c07e0224>] (media_device_unregister_entity+0x2c/0x38)
[  249.516157] [<c07e0224>] (media_device_unregister_entity) from 
[<c07ece34>] (v4l2_device_unregister_subdev+0x90/0xb4)
[  249.526793] [<c07ece34>] (v4l2_device_unregister_subdev) from 
[<c07f9668>] (v4l2_async_cleanup+0x10/0x3c)
[  249.536382] [<c07f9668>] (v4l2_async_cleanup) from [<c07f9730>] 
(v4l2_async_notifier_unbind_all_subdevs+0x9c/0x10c)
[  249.546840] [<c07f9730>] (v4l2_async_notifier_unbind_all_subdevs) 
from [<c07f9700>] (v4l2_async_notifier_unbind_all_subdevs+0x6c/0x10c)
[  249.559035] [<c07f9700>] (v4l2_async_notifier_unbind_all_subdevs) 
from [<c07fa3a0>] (__v4l2_async_notifier_unregister.part.4+0xc/0x44)
[  249.571140] [<c07fa3a0>] (__v4l2_async_notifier_unregister.part.4) 
from [<c07fa408>] (v4l2_async_notifier_unregister+0x30/0x50)
[  249.582665] [<c07fa408>] (v4l2_async_notifier_unregister) from 
[<bf03e020>] (imx_media_remove+0x20/0x54 [imx6_media])
[  249.593389] [<bf03e020>] (imx_media_remove [imx6_media]) from 
[<c064a684>] (platform_drv_remove+0x20/0x40)
[  249.603068] [<c064a684>] (platform_drv_remove) from [<c0648b50>] 
(device_release_driver_internal+0xdc/0x1ac)
[  249.612917] [<c0648b50>] (device_release_driver_internal) from 
[<c0648c7c>] (driver_detach+0x44/0x80)
[  249.622164] [<c0648c7c>] (driver_detach) from [<c0647404>] 
(bus_remove_driver+0x5c/0xd8)
[  249.630287] [<c0647404>] (bus_remove_driver) from [<c01d305c>] 
(sys_delete_module+0x17c/0x20c)
[  249.638926] [<c01d305c>] (sys_delete_module) from [<c0101000>] 
(ret_fast_syscall+0x0/0x28)
[  249.647205] Exception stack(0xe90d5fa8 to 0xe90d5ff0)
[  249.652278] 5fa0:                   beed5d6c 00000003 01401134 
00000800 4f13b6f4 00002002
[  249.660475] 5fc0: beed5d6c 00000003 beed5b80 00000081 beed5e78 
00000001 00000000 014010f8
[  249.668669] 5fe0: 0003b2c4 beed5b4c 0001f248 4f1012dc
[  249.673859] irq event stamp: 4113
[  249.677267] hardirqs last  enabled at (4131): [<c018d810>] 
console_unlock+0x408/0x5f8
[  249.685125] hardirqs last disabled at (4138): [<c018d490>] 
console_unlock+0x88/0x5f8
[  249.692970] softirqs last  enabled at (4154): [<c0102580>] 
__do_softirq+0x360/0x524
[  249.700735] softirqs last disabled at (4165): [<c01306ec>] 
irq_exit+0x12c/0x17c
[  249.708134] ---[ end trace 6fde63f19c7b10b8 ]---


Steve

