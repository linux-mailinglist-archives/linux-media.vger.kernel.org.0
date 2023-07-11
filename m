Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91AF474F84B
	for <lists+linux-media@lfdr.de>; Tue, 11 Jul 2023 21:15:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231414AbjGKTPs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jul 2023 15:15:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230257AbjGKTPr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jul 2023 15:15:47 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9885EA;
        Tue, 11 Jul 2023 12:15:45 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (unknown [IPv6:2606:6d00:10:88d9::7a9])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: nicolas)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id E7EE46606FCB;
        Tue, 11 Jul 2023 20:15:41 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1689102943;
        bh=06mY5wECyVGjXhMOl4C19cnRZAbv0lU65v32J/N9HxQ=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=DFP0S7czS0bZZpQzii3CnhUcUkZ3sHbwzJFwE+/IlpwkdP5H2Dk0513kjxZWZ4dOI
         4RHj4uZ7rjyP9bgemCVDtVu8DH+hbdTG3dqyCmzfqDUckOnEWMeR/wXgdxqFKgeyNK
         Eg2uino5RHbwMTe/8y0F447E649yzGdWbuPfZzJMwB2jXCfsiqPZZjeOcqtclyK5Nw
         G6OH1lIQ21HZqBx7GEVaUdQTGyJsO2fwfnDCVtiiaANrxYxeI0d9Dj4dd+rMNpgg5b
         EzIq52VMid/DkhdqNWHyswHqA6RvcATPNYURYarENsKrmpkF0ZGABlR0m4Jid/+D+j
         5C8y3iIj5KaRQ==
Message-ID: <af101e6831affc2e7152455ded1d779d38f1cb35.camel@collabora.com>
Subject: Re: [PATCH 0/3] media: mediatek: vcodec: Add driver to support 10bit
From:   Nicolas Dufresne <nicolas.dufresne@collabora.com>
To:     Yunfei Dong <yunfei.dong@mediatek.com>,
        =?ISO-8859-1?Q?N=EDcolas?= "F . R . A . Prado" 
        <nfraprado@collabora.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Nathan Hebert <nhebert@chromium.org>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Steve Cho <stevecho@chromium.org>,
        Mingjia Zhang <mingjia.zhang@mediatek.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Date:   Tue, 11 Jul 2023 15:15:33 -0400
In-Reply-To: <20230711125749.15555-1-yunfei.dong@mediatek.com>
References: <20230711125749.15555-1-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

phew things missing in this cover letter,

Le mardi 11 juillet 2023 =C3=A0 20:57 +0800, Yunfei Dong a =C3=A9crit=C2=A0=
:
> Define two capture formats V4L2_PIX_FMT_MT2110R and
> V4L2_PIX_FMT_MT2110T to support 10bit in mt8195, mt8199 and more.
> Getting the size of each plane again when userspace set 10bit
> syntax to driver.
>=20
> V4L2_PIX_FMT_MT2110R is used for H264, and V4L2_PIX_FMT_MT2110T
> is used for AV1/VP9/HEVC.
>=20
> patch 1 Add driver to support 10bit
> patch 2 Add capture format V4L2_PIX_FMT_MT2110T to support 10bit tile mod=
e
> patch 3 Add capture format V4L2_PIX_FMT_MT2110R to support 10bit raster m=
ode
> ---
> - send the first version v1:
> - Run 10bit VP9/AV1 fluster test pass.

Please at least provide the score before and after these changes. Full repo=
rt is
also nice. You didn't explain why H.264 is not tested.

> - Will return error when the 10bit parameter no correctly in function mtk=
_vdec_s_ctrl.
> ---

This cover letter is missing v4l2-compliance report. This is needed wheneve=
r
format mechanism is modified in a driver (not just for new drivers). Please=
 add
and make sure there is not regression too.

>=20
> Reference series:
> [1]: this series depends on v6 which is send by Yunfei Dong.
>      message-id: 20230704131349.8354-1-yunfei.dong@mediatek.com

Its seems like 6.5.0-rc1 with the depedency and this patchset does not boot=
 on
MT8195 Chromebooks. Which paltform has this been validated on ?


For the record:


[   13.286252] platform 1c015000.dp-intf: deferred probe pending
[   13.292007] platform 1c113000.dp-intf: deferred probe pending
[   28.523484] rcu: INFO: rcu_preempt self-detected stall on CPU
[   28.529231] rcu: 	5-....: (5250 ticks this GP)
idle=3D51c4/1/0x4000000000000000 softirq=3D1434/1447 fqs=3D2471
[   28.538706] rcu: 	(t=3D5254 jiffies g=3D-119 q=3D13320 ncpus=3D8)
[   28.544095] Task dump for CPU 0:
[   28.547313] task:cpuhp/0         state:R  running task     stack:0     p=
id:17
ppid:2      flags:0x0000000a
[   28.557221] Call trace:
[   28.559658]  __switch_to+0xe4/0x15c
[   28.563147]  0xffff776000196740
[   28.566282] CPU: 5 PID: 1 Comm: systemd Not tainted 6.5.0-rc1+ #36
[   28.572453] Hardware name: Acer Tomato (rev3 - 4) board (DT)
[   28.578101] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=
=3D--)
[   28.585053] pc : smp_call_function_single+0x1a4/0x1bc
[   28.590098] lr : smp_call_function_single+0x178/0x1bc
[   28.595140] sp : ffff80008008b9c0
[   28.598444] x29: ffff80008008b9c0 x28: ffff80008008bb90 x27: ffff7760051=
5c858
[   28.605572] x26: ffff80008008bbb0 x25: 00000000ffffffff x24: 00000000000=
00000
[   28.612699] x23: 00000000fffffff5 x22: ffffd0fcb8de9b50 x21: ffff8000800=
8bbb0
[   28.619825] x20: ffffd0fcb8de2af4 x19: ffff80008008ba00 x18: 00000000000=
00000
[   28.626952] x17: ffffa66484655000 x16: ffff800080028000 x15: 000000079c8=
b8c8b
[   28.634078] x14: 00000000000001c1 x13: 00000000000001c1 x12: 00000000000=
00000
[   28.641204] x11: 0000000000000031 x10: ffff77613ef540c0 x9 : 00000000000=
00000
[   28.648331] x8 : ffff77613ef54140 x7 : 0000000000000005 x6 : ffffd0fcb8d=
e2af4
[   28.655458] x5 : 0000000000000001 x4 : 0000000000000040 x3 : ffff8000800=
8ba08
[   28.662585] x2 : 0000000000000000 x1 : 0000000000000011 x0 : 00000000000=
00000
[   28.669711] Call trace:
[   28.672148]  smp_call_function_single+0x1a4/0x1bc
[   28.676843]  perf_cgroup_attach+0x74/0xd8
[   28.680847]  cgroup_migrate_execute+0x374/0x444
[   28.685368]  cgroup_migrate+0x74/0x8c
[   28.689021]  cgroup_attach_task+0x114/0x120
[   28.693195]  __cgroup_procs_write+0x108/0x230
[   28.697543]  cgroup_procs_write+0x1c/0x34
[   28.701543]  cgroup_file_write+0xa0/0x1a4
[   28.705545]  kernfs_fop_write_iter+0x118/0x1a8
[   28.709983]  vfs_write+0x2d0/0x39c
[   28.713376]  ksys_write+0x68/0xf4
[   28.716682]  __arm64_sys_write+0x1c/0x28
[   28.720594]  invoke_syscall+0x48/0x114
[   28.724337]  el0_svc_common.constprop.0+0x44/0xe4
[   28.729034]  do_el0_svc+0x38/0xa4
[   28.732341]  el0_svc+0x2c/0x84
[   28.735386]  el0t_64_sync_handler+0xc0/0xc4
[   28.739561]  el0t_64_sync+0x190/0x194
[   33.759553] vproc2: disabling
[   33.762551] vproc1: disabling
[   33.765548] vaud18: disabling
[   33.768760] va09: disabling
[   33.771599] vsram_md: disabling
[   91.755483] rcu: INFO: rcu_preempt self-detected stall on CPU
[   91.761220] rcu: 	5-....: (21005 ticks this GP)
idle=3D51c4/1/0x4000000000000000 softirq=3D1434/1447 fqs=3D8569
[   91.770778] rcu: 	(t=3D21062 jiffies g=3D-119 q=3D13628 ncpus=3D8)
[   91.776253] Task dump for CPU 0:
[   91.779471] task:cpuhp/0         state:R  running task     stack:0     p=
id:17
ppid:2      flags:0x0000000a
[   91.789376] Call trace:
[   91.791812]  __switch_to+0xe4/0x15c
[   91.795294]  0xffff776000196740
[   91.798426] CPU: 5 PID: 1 Comm: systemd Not tainted 6.5.0-rc1+ #36
[   91.804597] Hardware name: Acer Tomato (rev3 - 4) board (DT)
[   91.810244] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=
=3D--)
[   91.817195] pc : smp_call_function_single+0x1a4/0x1bc
[   91.822237] lr : smp_call_function_single+0x178/0x1bc
[   91.827278] sp : ffff80008008b9c0
[   91.830582] x29: ffff80008008b9c0 x28: ffff80008008bb90 x27: ffff7760051=
5c858
[   91.837709] x26: ffff80008008bbb0 x25: 00000000ffffffff x24: 00000000000=
00000
[   91.844835] x23: 00000000fffffff5 x22: ffffd0fcb8de9b50 x21: ffff8000800=
8bbb0
[   91.851962] x20: ffffd0fcb8de2af4 x19: ffff80008008ba00 x18: 00000000000=
00000
[   91.859089] x17: ffffa66484655000 x16: ffff800080028000 x15: 000000079c8=
b8c8b
[   91.866215] x14: 00000000000001c1 x13: 00000000000001c1 x12: 00000000000=
00000
[   91.873342] x11: 0000000000000031 x10: ffff77613ef540c0 x9 : 00000000000=
00000
[   91.880468] x8 : ffff77613ef54140 x7 : 0000000000000005 x6 : ffffd0fcb8d=
e2af4
[   91.887595] x5 : 0000000000000001 x4 : 0000000000000040 x3 : ffff8000800=
8ba08
[   91.894721] x2 : 0000000000000000 x1 : 0000000000000011 x0 : 00000000000=
00000
[   91.901848] Call trace:
[   91.904284]  smp_call_function_single+0x1a4/0x1bc
[   91.908979]  perf_cgroup_attach+0x74/0xd8
[   91.912981]  cgroup_migrate_execute+0x374/0x444
[   91.917502]  cgroup_migrate+0x74/0x8c
[   91.921155]  cgroup_attach_task+0x114/0x120
[   91.925329]  __cgroup_procs_write+0x108/0x230
[   91.929677]  cgroup_procs_write+0x1c/0x34
[   91.933677]  cgroup_file_write+0xa0/0x1a4
[   91.937679]  kernfs_fop_write_iter+0x118/0x1a8
[   91.942117]  vfs_write+0x2d0/0x39c
[   91.945509]  ksys_write+0x68/0xf4
[   91.948814]  __arm64_sys_write+0x1c/0x28
[   91.952726]  invoke_syscall+0x48/0x114
[   91.956467]  el0_svc_common.constprop.0+0x44/0xe4
[   91.961164]  do_el0_svc+0x38/0xa4
[   91.964472]  el0_svc+0x2c/0x84
[   91.967517]  el0t_64_sync_handler+0xc0/0xc4
[   91.971691]  el0t_64_sync+0x190/0x194
[  154.987483] rcu: INFO: rcu_preempt self-detected stall on CPU
[  154.993218] rcu: 	5-....: (36760 ticks this GP)
idle=3D51c4/1/0x4000000000000000 softirq=3D1434/1447 fqs=3D14547
[  155.002862] rcu: 	(t=3D36870 jiffies g=3D-119 q=3D13628 ncpus=3D8)
[  155.008337] Task dump for CPU 0:
[  155.011554] task:cpuhp/0         state:R  running task     stack:0     p=
id:17
ppid:2      flags:0x0000000a
[  155.021458] Call trace:
[  155.023894]  __switch_to+0xe4/0x15c
[  155.027376]  0xffff776000196740
[  155.030507] CPU: 5 PID: 1 Comm: systemd Not tainted 6.5.0-rc1+ #36
[  155.036676] Hardware name: Acer Tomato (rev3 - 4) board (DT)
[  155.042323] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=
=3D--)
[  155.049274] pc : smp_call_function_single+0x1a4/0x1bc
[  155.054316] lr : smp_call_function_single+0x178/0x1bc
[  155.059358] sp : ffff80008008b9c0
[  155.062662] x29: ffff80008008b9c0 x28: ffff80008008bb90 x27: ffff7760051=
5c858
[  155.069788] x26: ffff80008008bbb0 x25: 00000000ffffffff x24: 00000000000=
00000
[  155.076914] x23: 00000000fffffff5 x22: ffffd0fcb8de9b50 x21: ffff8000800=
8bbb0
[  155.084041] x20: ffffd0fcb8de2af4 x19: ffff80008008ba00 x18: 00000000000=
00000
[  155.091168] x17: ffffa66484655000 x16: ffff800080028000 x15: 000000079c8=
b8c8b
[  155.098294] x14: 00000000000001c1 x13: 00000000000001c1 x12: 00000000000=
00000
[  155.105421] x11: 0000000000000031 x10: ffff77613ef540c0 x9 : 00000000000=
00000
[  155.112548] x8 : ffff77613ef54140 x7 : 0000000000000005 x6 : ffffd0fcb8d=
e2af4
[  155.119675] x5 : 0000000000000001 x4 : 0000000000000040 x3 : ffff8000800=
8ba08
[  155.126801] x2 : 0000000000000000 x1 : 0000000000000011 x0 : 00000000000=
00000
[  155.133928] Call trace:
[  155.136363]  smp_call_function_single+0x1a4/0x1bc
[  155.141059]  perf_cgroup_attach+0x74/0xd8
[  155.145060]  cgroup_migrate_execute+0x374/0x444
[  155.149581]  cgroup_migrate+0x74/0x8c
[  155.153234]  cgroup_attach_task+0x114/0x120
[  155.157408]  __cgroup_procs_write+0x108/0x230
[  155.161755]  cgroup_procs_write+0x1c/0x34
[  155.165756]  cgroup_file_write+0xa0/0x1a4
[  155.169757]  kernfs_fop_write_iter+0x118/0x1a8
[  155.174195]  vfs_write+0x2d0/0x39c
[  155.177587]  ksys_write+0x68/0xf4
[  155.180893]  __arm64_sys_write+0x1c/0x28
[  155.184805]  invoke_syscall+0x48/0x114
[  155.188547]  el0_svc_common.constprop.0+0x44/0xe4
[  155.193243]  do_el0_svc+0x38/0xa4
[  155.196551]  el0_svc+0x2c/0x84
[  155.199595]  el0t_64_sync_handler+0xc0/0xc4
[  155.203769]  el0t_64_sync+0x190/0x194


>=20
> Mingjia Zhang (3):
>   media: mediatek: vcodec: Add capture format to support 10bit tile mode
>   media: mediatek: vcodec: Add capture format to support 10bit raster
>     mode
>   media: mediatek: vcodec: Add driver to support 10bit
>=20
>  .../media/v4l/pixfmt-reserved.rst             |  15 ++
>  .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  |  22 ++-
>  .../vcodec/decoder/mtk_vcodec_dec_drv.h       |   5 +
>  .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 140 +++++++++++++++++-
>  drivers/media/v4l2-core/v4l2-common.c         |   4 +
>  drivers/media/v4l2-core/v4l2-ioctl.c          |   2 +
>  include/uapi/linux/videodev2.h                |   2 +
>  7 files changed, 186 insertions(+), 4 deletions(-)
>=20

