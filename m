Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85C09223D89
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 16:00:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727002AbgGQOAD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 10:00:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726973AbgGQOAB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 10:00:01 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3452CC0619D4
        for <linux-media@vger.kernel.org>; Fri, 17 Jul 2020 07:00:01 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id k17so6111615lfg.3
        for <linux-media@vger.kernel.org>; Fri, 17 Jul 2020 07:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=cWXA3OpprCq+xCezxBdMdy6Tnf+jHgZvPeOAwnPfO9M=;
        b=Hydu1GpqB9ncMOBI5KsC1fWmyAoWPBr6toWw6i0SbUjHkDCBPSgknGoscJM2elMfMq
         xhgCK8J/kpYT34NBgnyF1+YlLSGSCE0w50HjKlX4Wj/V8tiHprfdXQ7n0MHcBmTQ8fU0
         yJiRvZQaoIj+sJVlYrr0yssPMwtxKU4CS/vQw6Vvs3aNeiIy+6oyhUFfsiWsZR+BB73+
         rBBIKLYJ9XsSUX3DqoxtjmMuY0XdrTvE0c8g2+imYidbxIhR1aSaJ6sltXUBTW1PWt5C
         9iZPMN1V/5TrO8lzCfhBSBeKFiQC+RhkXVlK7sZmunCtgTalh9YN57gw2D+VqVLChbD3
         NLDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=cWXA3OpprCq+xCezxBdMdy6Tnf+jHgZvPeOAwnPfO9M=;
        b=oC/DNgJos8YUp2ph3snC9V6Dlp1VL735lLsM2JpMGRa6YbKBGqH8YiLjNvcvYXRlQm
         t/rgO7gWYYjp93t6pFoyIgPS+8ANOU3PsWRHli2EaOBZDCB6RoEJA8YVvDi5DwJFp6ts
         z+qQUbf4XUMSz1tiGIh5yVOXaQgiXM9AWLvAsJA31k3C2gf6rncIUyk8mHDXiBrIqMZu
         tv9a0clxpXIbcMp1ftlK9sx5/zWouokeH7SFcyL9G+2BKb5i8HdAJMaCR/Vdmsxh4ZQ+
         Dln/SPDGwErszZKsA2kACpeGy4ae4bA2C4tycdaUkiRf8Px0X2nsvQcLG0eHp2PVanhZ
         QXVA==
X-Gm-Message-State: AOAM533or3aLnhydOxMnhtN6BWZVIwAVVfIVfJ6dBjXNMGLPaXU308aw
        v94ahSDFBy0Hrn04BJpJXB/nqQ==
X-Google-Smtp-Source: ABdhPJzDEZPZyIjYUrLGbXcsnL0iQOQ8r+1FPZduk5/3HlLLAFySzqC1Fm0Nk5H3JueE+kZUFIuO0Q==
X-Received: by 2002:ac2:5f0b:: with SMTP id 11mr4759048lfq.201.1594994399423;
        Fri, 17 Jul 2020 06:59:59 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id h18sm1659138lji.136.2020.07.17.06.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 06:59:58 -0700 (PDT)
Date:   Fri, 17 Jul 2020 15:59:57 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Michael Rodin <mrodin@de.adit-jv.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, michael@rodin.online,
        efriedrich@de.adit-jv.com, erosca@de.adit-jv.com,
        Steve Longerbeam <steve_longerbeam@mentor.com>
Subject: Re: [PATCH] media: rcar-vin: Move media_device_register to async
 completion
Message-ID: <20200717135957.GC177462@oden.dyn.berto.se>
References: <1592328696-84533-1-git-send-email-mrodin@de.adit-jv.com>
 <20200617105646.GB2850317@oden.dyn.berto.se>
 <20200617151537.GB88066@vmlxhi-121.adit-jv.com>
 <20200617152857.GA2936315@oden.dyn.berto.se>
 <427325ff-e21f-91fd-6236-6d1f6615ca41@xs4all.nl>
 <20200624145423.GA1595450@oden.dyn.berto.se>
 <e0e38519-bdce-9865-5420-904b41d7531a@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e0e38519-bdce-9865-5420-904b41d7531a@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thanks for taking an interest in this.

On 2020-07-16 11:18:29 +0200, Hans Verkuil wrote:
> What exactly are these warnings? I remember faintly seeing backtraces 
> of this before, but it is so long ago. It would be good to see what 
> happens with the latest kernel (i.e. media master branch).

Produced on latest media-tree 6f01dfb760c027d5 ("media: cros-ec-cec: do 
not bail on device_init_wakeup failure") on R-Car M3-N. That is the 
video devices are registered in complete() and unregistered in unbind().

To provoke the trace I unbind and re-bind one of the two CSI-2 receivers 
in the system. The CSI-2 receiver is subdevice V4L2 driver (rcar-csi2) 
that is register in the VIN (rcar-vin) async notifier.

# echo fea80000.csi2 > /sys/bus/platform/drivers/rcar-csi2/unbind
[   42.646841] rcar-vin e6ef0000.video: Removing video11
[   42.652521] rcar-vin e6ef1000.video: Removing video12
[   42.658967] rcar-vin e6ef2000.video: Removing video13
[   42.664574] rcar-vin e6ef3000.video: Removing video14
[   42.670185] rcar-vin e6ef4000.video: Removing video15
[   42.675740] rcar-vin e6ef5000.video: Removing video16
[   42.681403] rcar-vin e6ef6000.video: Removing video17
[   42.687030] rcar-vin e6ef7000.video: Removing video18

# echo fea80000.csi2 > /sys/bus/platform/drivers/rcar-csi2/bind
[   50.065343] kobject (000000001e7d7cf3): tried to init an initialized object, something is seriously wrong.
[   50.075324] CPU: 0 PID: 399 Comm: bash Not tainted 5.8.0-rc1-arm64-renesas-00122-g6f01dfb760c027d5 #1
[   50.084660] Hardware name: Renesas Salvator-X 2nd version board based on r8a77965 (DT)
[   50.092673] Call trace:
[   50.095160]  dump_backtrace+0x0/0x190
[   50.098869]  show_stack+0x14/0x20
[   50.102229]  dump_stack+0xe0/0x128
[   50.105675]  kobject_init+0x8c/0xa0
[   50.109210]  device_initialize+0x40/0x150
[   50.113269]  device_register+0x14/0x30
[   50.117068]  __video_register_device+0xcf4/0x1780
[   50.121830]  rvin_v4l2_register+0xe4/0x150
[   50.125976]  rvin_group_notify_complete+0x58/0x18c
[   50.130827]  v4l2_async_notifier_try_complete.part.0+0x50/0x60
[   50.136730]  v4l2_async_register_subdev+0xfc/0x1b0
[   50.141578]  rcsi2_probe+0x338/0x41c
[   50.145198]  platform_drv_probe+0x50/0xa0
[   50.149256]  really_probe+0xdc/0x430
[   50.152873]  driver_probe_device+0x54/0xb0
[   50.157019]  device_driver_attach+0xbc/0xc4
[   50.161253]  bind_store+0xb8/0x11c
[   50.164697]  drv_attr_store+0x20/0x30
[   50.168407]  sysfs_kf_write+0x48/0x70
[   50.172114]  kernfs_fop_write+0x120/0x230
[   50.176175]  __vfs_write+0x18/0x40
[   50.179619]  vfs_write+0xdc/0x1c4
[   50.182974]  ksys_write+0x68/0xf0
[   50.186329]  __arm64_sys_write+0x18/0x20
[   50.190303]  el0_svc_common.constprop.0+0x70/0x170
[   50.195151]  do_el0_svc+0x20/0x80
[   50.198507]  el0_sync_handler+0x94/0x1d0
[   50.202476]  el0_sync+0x140/0x180
[   50.206891] rcar-vin e6ef0000.video: Device registered as video11
[   50.214480] kobject (000000009d23aabd): tried to init an initialized object, something is seriously wrong.
[   50.225601] CPU: 0 PID: 399 Comm: bash Not tainted 5.8.0-rc1-arm64-renesas-00122-g6f01dfb760c027d5 #1
[   50.236162] Hardware name: Renesas Salvator-X 2nd version board based on r8a77965 (DT)
[   50.245406] Call trace:
[   50.249131]  dump_backtrace+0x0/0x190
[   50.254092]  show_stack+0x14/0x20
[   50.258718]  dump_stack+0xe0/0x128
[   50.263432]  kobject_init+0x8c/0xa0
[   50.268247]  device_initialize+0x40/0x150
[   50.273604]  device_register+0x14/0x30
[   50.278710]  __video_register_device+0xcf4/0x1780
[   50.284773]  rvin_v4l2_register+0xe4/0x150
[   50.290241]  rvin_group_notify_complete+0x58/0x18c
[   50.296427]  v4l2_async_notifier_try_complete.part.0+0x50/0x60
[   50.303692]  v4l2_async_register_subdev+0xfc/0x1b0
[   50.309867]  rcsi2_probe+0x338/0x41c
[   50.314779]  platform_drv_probe+0x50/0xa0
[   50.320087]  really_probe+0xdc/0x430
[   50.324928]  driver_probe_device+0x54/0xb0
[   50.330298]  device_driver_attach+0xbc/0xc4
[   50.335759]  bind_store+0xb8/0x11c
[   50.340444]  drv_attr_store+0x20/0x30
[   50.345395]  sysfs_kf_write+0x48/0x70
[   50.350337]  kernfs_fop_write+0x120/0x230
[   50.355637]  __vfs_write+0x18/0x40
[   50.360314]  vfs_write+0xdc/0x1c4
[   50.364894]  ksys_write+0x68/0xf0
[   50.369465]  __arm64_sys_write+0x18/0x20
[   50.374643]  el0_svc_common.constprop.0+0x70/0x170
[   50.380697]  do_el0_svc+0x20/0x80
[   50.385260]  el0_sync_handler+0x94/0x1d0
[   50.390437]  el0_sync+0x140/0x180
[   50.395627] rcar-vin e6ef1000.video: Device registered as video12
[   50.403212] kobject (000000003aa48aaf): tried to init an initialized object, something is seriously wrong.
[   50.419514] CPU: 0 PID: 399 Comm: bash Not tainted 5.8.0-rc1-arm64-renesas-00122-g6f01dfb760c027d5 #1
[   50.430193] Hardware name: Renesas Salvator-X 2nd version board based on r8a77965 (DT)
[   50.439576] Call trace:
[   50.443461]  dump_backtrace+0x0/0x190
[   50.448569]  show_stack+0x14/0x20
[   50.453325]  dump_stack+0xe0/0x128
[   50.458141]  kobject_init+0x8c/0xa0
[   50.463045]  device_initialize+0x40/0x150
[   50.468473]  device_register+0x14/0x30
[   50.473635]  __video_register_device+0xcf4/0x1780
[   50.479755]  rvin_v4l2_register+0xe4/0x150
[   50.485262]  rvin_group_notify_complete+0x58/0x18c
[   50.491479]  v4l2_async_notifier_try_complete.part.0+0x50/0x60
[   50.498745]  v4l2_async_register_subdev+0xfc/0x1b0
[   50.504921]  rcsi2_probe+0x338/0x41c
[   50.509834]  platform_drv_probe+0x50/0xa0
[   50.515142]  really_probe+0xdc/0x430
[   50.519983]  driver_probe_device+0x54/0xb0
[   50.525353]  device_driver_attach+0xbc/0xc4
[   50.530814]  bind_store+0xb8/0x11c
[   50.535497]  drv_attr_store+0x20/0x30
[   50.540449]  sysfs_kf_write+0x48/0x70
[   50.545392]  kernfs_fop_write+0x120/0x230
[   50.550693]  __vfs_write+0x18/0x40
[   50.555371]  vfs_write+0xdc/0x1c4
[   50.559950]  ksys_write+0x68/0xf0
[   50.564522]  __arm64_sys_write+0x18/0x20
[   50.569702]  el0_svc_common.constprop.0+0x70/0x170
[   50.575757]  do_el0_svc+0x20/0x80
[   50.580319]  el0_sync_handler+0x94/0x1d0
[   50.585494]  el0_sync+0x140/0x180
[   50.591035] rcar-vin e6ef2000.video: Device registered as video13
[   50.599329] kobject (0000000010e2c914): tried to init an initialized object, something is seriously wrong.
[   50.610935] CPU: 0 PID: 399 Comm: bash Not tainted 5.8.0-rc1-arm64-renesas-00122-g6f01dfb760c027d5 #1
[   50.621606] Hardware name: Renesas Salvator-X 2nd version board based on r8a77965 (DT)
[   50.630964] Call trace:
[   50.634831]  dump_backtrace+0x0/0x190
[   50.639919]  show_stack+0x14/0x20
[   50.644675]  dump_stack+0xe0/0x128
[   50.649492]  kobject_init+0x8c/0xa0
[   50.654401]  device_initialize+0x40/0x150
[   50.659828]  device_register+0x14/0x30
[   50.664984]  __video_register_device+0xcf4/0x1780
[   50.671102]  rvin_v4l2_register+0xe4/0x150
[   50.676612]  rvin_group_notify_complete+0x58/0x18c
[   50.682833]  v4l2_async_notifier_try_complete.part.0+0x50/0x60
[   50.690103]  v4l2_async_register_subdev+0xfc/0x1b0
[   50.696281]  rcsi2_probe+0x338/0x41c
[   50.701193]  platform_drv_probe+0x50/0xa0
[   50.706503]  really_probe+0xdc/0x430
[   50.711346]  driver_probe_device+0x54/0xb0
[   50.716716]  device_driver_attach+0xbc/0xc4
[   50.722178]  bind_store+0xb8/0x11c
[   50.726861]  drv_attr_store+0x20/0x30
[   50.731813]  sysfs_kf_write+0x48/0x70
[   50.736754]  kernfs_fop_write+0x120/0x230
[   50.742053]  __vfs_write+0x18/0x40
[   50.746731]  vfs_write+0xdc/0x1c4
[   50.751311]  ksys_write+0x68/0xf0
[   50.755884]  __arm64_sys_write+0x18/0x20
[   50.761063]  el0_svc_common.constprop.0+0x70/0x170
[   50.767120]  do_el0_svc+0x20/0x80
[   50.771682]  el0_sync_handler+0x94/0x1d0
[   50.776858]  el0_sync+0x140/0x180
[   50.782393] rcar-vin e6ef3000.video: Device registered as video14
[   50.795556] kobject (00000000cedb41f6): tried to init an initialized object, something is seriously wrong.
[   50.807583] CPU: 0 PID: 399 Comm: bash Not tainted 5.8.0-rc1-arm64-renesas-00122-g6f01dfb760c027d5 #1
[   50.818256] Hardware name: Renesas Salvator-X 2nd version board based on r8a77965 (DT)
[   50.827613] Call trace:
[   50.831481]  dump_backtrace+0x0/0x190
[   50.836566]  show_stack+0x14/0x20
[   50.841301]  dump_stack+0xe0/0x128
[   50.846112]  kobject_init+0x8c/0xa0
[   50.851015]  device_initialize+0x40/0x150
[   50.856443]  device_register+0x14/0x30
[   50.861600]  __video_register_device+0xcf4/0x1780
[   50.867718]  rvin_v4l2_register+0xe4/0x150
[   50.873225]  rvin_group_notify_complete+0x58/0x18c
[   50.879446]  v4l2_async_notifier_try_complete.part.0+0x50/0x60
[   50.886713]  v4l2_async_register_subdev+0xfc/0x1b0
[   50.892891]  rcsi2_probe+0x338/0x41c
[   50.897804]  platform_drv_probe+0x50/0xa0
[   50.903114]  really_probe+0xdc/0x430
[   50.907957]  driver_probe_device+0x54/0xb0
[   50.913327]  device_driver_attach+0xbc/0xc4
[   50.918789]  bind_store+0xb8/0x11c
[   50.923473]  drv_attr_store+0x20/0x30
[   50.928425]  sysfs_kf_write+0x48/0x70
[   50.933367]  kernfs_fop_write+0x120/0x230
[   50.938668]  __vfs_write+0x18/0x40
[   50.943345]  vfs_write+0xdc/0x1c4
[   50.947926]  ksys_write+0x68/0xf0
[   50.952500]  __arm64_sys_write+0x18/0x20
[   50.957681]  el0_svc_common.constprop.0+0x70/0x170
[   50.963738]  do_el0_svc+0x20/0x80
[   50.968304]  el0_sync_handler+0x94/0x1d0
[   50.973490]  el0_sync+0x140/0x180
[   50.980453] rcar-vin e6ef4000.video: Device registered as video15
[   50.989061] kobject (000000005db6c01f): tried to init an initialized object, something is seriously wrong.
[   51.003514] CPU: 0 PID: 399 Comm: bash Not tainted 5.8.0-rc1-arm64-renesas-00122-g6f01dfb760c027d5 #1
[   51.014192] Hardware name: Renesas Salvator-X 2nd version board based on r8a77965 (DT)
[   51.023553] Call trace:
[   51.027422]  dump_backtrace+0x0/0x190
[   51.032510]  show_stack+0x14/0x20
[   51.037246]  dump_stack+0xe0/0x128
[   51.042061]  kobject_init+0x8c/0xa0
[   51.046967]  device_initialize+0x40/0x150
[   51.052396]  device_register+0x14/0x30
[   51.057554]  __video_register_device+0xcf4/0x1780
[   51.063674]  rvin_v4l2_register+0xe4/0x150
[   51.069182]  rvin_group_notify_complete+0x58/0x18c
[   51.075408]  v4l2_async_notifier_try_complete.part.0+0x50/0x60
[   51.082676]  v4l2_async_register_subdev+0xfc/0x1b0
[   51.088857]  rcsi2_probe+0x338/0x41c
[   51.093772]  platform_drv_probe+0x50/0xa0
[   51.099084]  really_probe+0xdc/0x430
[   51.103928]  driver_probe_device+0x54/0xb0
[   51.109299]  device_driver_attach+0xbc/0xc4
[   51.114766]  bind_store+0xb8/0x11c
[   51.119453]  drv_attr_store+0x20/0x30
[   51.124408]  sysfs_kf_write+0x48/0x70
[   51.129353]  kernfs_fop_write+0x120/0x230
[   51.134656]  __vfs_write+0x18/0x40
[   51.139336]  vfs_write+0xdc/0x1c4
[   51.143921]  ksys_write+0x68/0xf0
[   51.148496]  __arm64_sys_write+0x18/0x20
[   51.153678]  el0_svc_common.constprop.0+0x70/0x170
[   51.159735]  do_el0_svc+0x20/0x80
[   51.164300]  el0_sync_handler+0x94/0x1d0
[   51.169479]  el0_sync+0x140/0x180
[   51.175178] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
[   51.185832] Mem abort info:
[   51.190414]   ESR = 0x96000044
[   51.195202]   EC = 0x25: DABT (current EL), IL = 32 bits
[   51.204679]   SET = 0, FnV = 0
[   51.209464]   EA = 0, S1PTW = 0
[   51.214841] Data abort info:
[   51.219542]   ISV = 0, ISS = 0x00000044
[   51.229557]   CM = 0, WnR = 1
[   51.235004] user pgtable: 4k pages, 48-bit VAs, pgdp=00000000a9422000
[   51.243309] [0000000000000000] pgd=0000000000000000, p4d=0000000000000000
[   51.252227] Internal error: Oops: 96000044 [#1] PREEMPT SMP
[   51.259230] CPU: 0 PID: 399 Comm: bash Not tainted 5.8.0-rc1-arm64-renesas-00122-g6f01dfb760c027d5 #1
[   51.269914] Hardware name: Renesas Salvator-X 2nd version board based on r8a77965 (DT)
[   51.279327] pstate: 60000005 (nZCv daif -PAN -UAO BTYPE=--)
[   51.286391] pc : media_create_intf_link+0x50/0xc0
[   51.292542] lr : media_create_intf_link+0x34/0xc0
[   51.298631] sp : ffff800012ecba10
[   51.303282] x29: ffff800012ecba10 x28: ffff0000735cd250 
[   51.309923] x27: ffff800011ea54c8 x26: ffff0000735cd098 
[   51.316557] x25: ffff800010f30a60 x24: 0000000000000010 
[   51.323192] x23: 0000000000000001 x22: 0000000000000000 
[   51.329831] x21: ffff0000735cd098 x20: 0000000000000003 
[   51.336468] x19: ffff00007cc5f600 x18: 0000005a215e8dc3 
[   51.343101] x17: 00016a37eb2cda4e x16: 0000000000000014 
[   51.349741] x15: ffff800010c06f60 x14: 0000000000000005 
[   51.356376] x13: 000000000000026a x12: ffff8000112c5c28 
[   51.363006] x11: 000000000000007e x10: 0000000000000001 
[   51.369628] x9 : 0000000000000000 x8 : ffff00007cc5f680 
[   51.376237] x7 : 0000000000000000 x6 : 000000000000003f 
[   51.382831] x5 : 0000000000000040 x4 : 0000000000000dc0 
[   51.389407] x3 : 0000000000000000 x2 : 0000000010000003 
[   51.395973] x1 : ffff00007cc5f620 x0 : ffff00007cc5f600 
[   51.402539] Call trace:
[   51.406223]  media_create_intf_link+0x50/0xc0
[   51.411843]  __video_register_device+0xffc/0x1780
[   51.417814]  rvin_v4l2_register+0xe4/0x150
[   51.423176]  rvin_group_notify_complete+0x58/0x18c
[   51.429252]  v4l2_async_notifier_try_complete.part.0+0x50/0x60
[   51.436390]  v4l2_async_register_subdev+0xfc/0x1b0
[   51.442479]  rcsi2_probe+0x338/0x41c
[   51.447356]  platform_drv_probe+0x50/0xa0
[   51.452672]  really_probe+0xdc/0x430
[   51.457550]  driver_probe_device+0x54/0xb0
[   51.462944]  device_driver_attach+0xbc/0xc4
[   51.468426]  bind_store+0xb8/0x11c
[   51.473116]  drv_attr_store+0x20/0x30
[   51.478077]  sysfs_kf_write+0x48/0x70
[   51.482993]  kernfs_fop_write+0x120/0x230
[   51.488229]  __vfs_write+0x18/0x40
[   51.492852]  vfs_write+0xdc/0x1c4
[   51.497375]  ksys_write+0x68/0xf0
[   51.501885]  __arm64_sys_write+0x18/0x20
[   51.507019]  el0_svc_common.constprop.0+0x70/0x170
[   51.513037]  do_el0_svc+0x20/0x80
[   51.517573]  el0_sync_handler+0x94/0x1d0
[   51.522722]  el0_sync+0x140/0x180
[   51.527237] Code: 91008262 a9020c02 32040282 f9001661 (f9000061) 
[   51.534555] ---[ end trace 94f72cbb1552c089 ]---

-- 
Regards,
Niklas Söderlund
