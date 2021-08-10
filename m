Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 196B53E5825
	for <lists+linux-media@lfdr.de>; Tue, 10 Aug 2021 12:20:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239457AbhHJKUe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Aug 2021 06:20:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238878AbhHJKUe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Aug 2021 06:20:34 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C10AC0613D3
        for <linux-media@vger.kernel.org>; Tue, 10 Aug 2021 03:20:12 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id j1so32349906pjv.3
        for <linux-media@vger.kernel.org>; Tue, 10 Aug 2021 03:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ctqTRsxltCv0P8JSjNQ26LLCIiMofbgu2/56HaUjrps=;
        b=WxhA7cVuSGmmGXYNiJw8SAClXI0RUO+Dz1DMimgA9IN2Vs8wrFl6gVCEVA2Lc+gguD
         6nV6zkKpNhu4mfVP6YB3l2DBpPvkcLXOGWpxZzl4RsHHXwVRLLcJKf6+ezk96qzx1i4T
         Mvh56m3FFshcZ51MHRjX9AFyi447Ko5qDrku7gDmkoAOw81tpcOq3q3QhYOa+r9CuXrd
         Xm5DS9sgpGFHSIsZrkvSLWuwBf3GziJG3oPc8fedleAaK/twthv08VMSDDowtWaSsHoj
         VrL3i/UXgfLoGzSo1kUI+PazQh+tLiPh6zYbHlJk/EY68tk/2BZ3vJLUG8U8ZTd1RtTC
         UJ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ctqTRsxltCv0P8JSjNQ26LLCIiMofbgu2/56HaUjrps=;
        b=NDIuQSLplx7cnetYcTSa9JIhZYXjeS//dDHGhScS61QmKSDp8zQl0py22bzWNKK7WJ
         JLjzxXk2rM/VB2lob6PVDcn6nvkvb18XzwjDqd+Jy/w5ti75JBqeqLvxIo72nejA+9xD
         jfHdaON5Fm9YiVv/mpWYoHphT35p1YhKqmz7hBDsrBOKW9RglOak4bWL+jvOOeAoUEzC
         s6J3Yc4X5WutEeERPRAIkShzGTX8VRpfVcJWsiJLmtuDBljaa9JxY5SKiD0vqepg0NAC
         SP2FYwGbF4pAILmvxwaBk1Zx0ActtJMYKYi6+WEnFJpPre2ltQ2J/NaiGWKmiV/+8ViK
         el/g==
X-Gm-Message-State: AOAM533beJOftEDEv44NLUhOebra9Cc6MN7nhEochcslztCmzNkoEygP
        iMtcxItcJJOmZUNpeNtt5pAEa526HZLWRFp9SQdkvQ==
X-Google-Smtp-Source: ABdhPJzd9Tk7xMXMzigDZgM/5t1Tr+yjPkJdWS3dUK1Q8fd8nKLOnqc1aF2x8XbSwZeDi1SkRGFXS5Hima2z6HD1PTk=
X-Received: by 2002:a17:90b:90f:: with SMTP id bo15mr4084745pjb.220.1628590811833;
 Tue, 10 Aug 2021 03:20:11 -0700 (PDT)
MIME-Version: 1.0
References: <71026122-e9bc-a481-70ab-fde4e89af571@xs4all.nl> <CA+G9fYtzp5zE=NEQYcO0fZkwwQSrh9am=HMXmqnSs1OQKaivCg@mail.gmail.com>
In-Reply-To: <CA+G9fYtzp5zE=NEQYcO0fZkwwQSrh9am=HMXmqnSs1OQKaivCg@mail.gmail.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Tue, 10 Aug 2021 12:20:00 +0200
Message-ID: <CAG3jFyus8771tMOcr2CouaOmzN8ceooRruZFQy1ijRnTNj_0Aw@mail.gmail.com>
Subject: Re: [GIT PULL FOR v5.15] v2: Various fixes and enhancements
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Irui Wang <irui.wang@mediatek.com>,
        =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Naresh,

Thanks for reporting this.

On Tue, 10 Aug 2021 at 11:45, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> [Please ignore this if it is already reported]
> The following kernel crash "Internal error: Oops:" found while booting the arm64
> Dragonboard 845c device.
>
> Our bisect scripts are still running to bisect the first bad commit.
> However, I would like to report on suspecting sub-systems patch set
>
> On Thu, 5 Aug 2021 at 15:48, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> > Robert Foss (4):
> >       media: camss: vfe: Don't read hardware version needlessly
> >       media: camss: vfe: Decrease priority of of VFE HW version to 'dbg'
> >       media: camss: vfe: Remove vfe_hw_version_read() argument
> >       media: camss: vfe: Rework vfe_hw_version_read() function definition
>
> [    8.296907] Unable to handle kernel NULL pointer dereference at
> virtual address 0000000000000000
> [    8.305943] Mem abort info:
> [    8.307150] Bluetooth: Core ver 2.22
> [    8.308784]   ESR = 0x96000004
> [    8.308787]   EC = 0x25: DABT (current EL), IL = 32 bits
> [    8.308790]   SET = 0, FnV = 0
> [    8.308792]   EA = 0, S1PTW = 0
> [    8.308794]   FSC = 0x04: level 0 translation fault
> [    8.308796] Data abort info:
> [    8.308798]   ISV = 0, ISS = 0x00000004
> [    8.313982] NET: Registered PF_BLUETOOTH protocol family
> [    8.315502]   CM = 0, WnR = 0
> [    8.320889] Bluetooth: HCI device and connection manager initialized
> [    8.323948] user pgtable: 4k pages, 48-bit VAs, pgdp=0000000107162000
> [    8.323952] [0000000000000000] pgd=0000000000000000, p4d=0000000000000000
> [    8.323959] Internal error: Oops: 96000004 [#1] PREEMPT SMP
> [    8.323963] Modules linked in: gpu_sched(+) bluetooth(+)
> reset_qcom_pdc drm_kms_helper i2c_qcom_geni(+) qcom_camss
> spi_geni_qcom videobuf2_dma_sg venus_core v4l2_fwnode v4l2_async
> v4l2_mem2mem
> [    8.327174] Bluetooth: HCI socket layer initialized
> [    8.332068]  videobuf2_memops videobuf2_v4l2 camcc_sdm845
> videobuf2_common qcom_rng i2c_qcom_cci ath10k_snoc ath10k_core
> xhci_pci ath qcom_q6v5_mss qrtr xhci_pci_renesas mac80211
> qcom_q6v5_pas ns qcom_pil_info qcom_q6v5 slim_qcom_ngd_ctrl
> pdr_interface qcom_sysmon cfg80211 qcom_common display_connector
> qcom_glink_smem icc_osm_l3 rfkill slimbus qcom_wdt qmi_helpers
> mdt_loader socinfo drm rmtfs_mem fuse
> [    8.332103] CPU: 6 PID: 9 Comm: kworker/u16:1 Not tainted
> 5.14.0-rc5-next-20210809 #1
> [    8.332107] Hardware name: Thundercomm Dragonboard 845c (DT)
> [    8.332109] Workqueue: events_unbound deferred_probe_work_func
> [    8.332120] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    8.335040] Bluetooth: L2CAP socket layer initialized
> [    8.337046] i2c 10-003b: Fixing up cyclic dependency with hdmi-out
> [    8.342391] pc : vfe_hw_version+0x20/0x80 [qcom_camss]
> [    8.342405] lr : msm_vfe_subdev_init+0x8c/0x4d0 [qcom_camss]
> [    8.342415] sp : ffff80001009ba20
> [    8.342416] x29: ffff80001009ba20 x28: ffff330f84ea6000 x27: 0000000000000004
> [    8.347824] Bluetooth: SCO socket layer initialized
> [    8.350763]
> [    8.350764] x26: 0000000000000003 x25: ffff330f8ea00080 x24: 0000000000000000
> [    8.350767] x23: ffff330f84ea6000 x22: ffff330f80f5b010 x21: ffffd62954d86828
> [    8.350770] x20: ffff330f80f5b000 x19: 0000000000000000 x18: 0000000000000000
> [    8.350773] x17: 0000000000000000 x16: ffffd6298befc0e0 x15: 0000000000000000
> [    8.350776] x14: 0000000000000000 x13: 7367616c665f746e x12: 69617274736e6f63
> [    8.350779] x11: ffff330f80400000 x10: 0000000000000000 x9 : ffffd62954d811b0
> [    8.350782] x8 : 0101010101010101 x7 : ffffd62954d7d814 x6 : ffffd62954d80f80
> [    8.350785] x5 : ffff330f8ea03080 x4 : ffff330f8ea03640 x3 : ffffd62954d7d720
> [    8.557091] x2 : 0000000000000003 x1 : ffffd62954d7dae0 x0 : ffff330f8ea00080
> [    8.564282] Call trace:
> [    8.566749]  vfe_hw_version+0x20/0x80 [qcom_camss]
> [    8.571599]  msm_vfe_subdev_init+0x8c/0x4d0 [qcom_camss]
> [    8.576956]  camss_probe+0x358/0xd60 [qcom_camss]
> [    8.581710]  platform_probe+0x74/0xf0
> [    8.585400]  really_probe+0xc4/0x470
> [    8.589003]  __driver_probe_device+0x11c/0x190
> [    8.593477]  driver_probe_device+0x48/0x110
> [    8.597694]  __device_attach_driver+0xa4/0x140
> [    8.602173]  bus_for_each_drv+0x84/0xe0
> [    8.606038]  __device_attach+0xe4/0x1c0
> [    8.609904]  device_initial_probe+0x20/0x30
> [    8.614118]  bus_probe_device+0xa4/0xb0
> [    8.617979]  deferred_probe_work_func+0xa8/0xfc
> [    8.622543]  process_one_work+0x1dc/0x4a0
> [    8.626587]  worker_thread+0x144/0x470
> [    8.630364]  kthread+0x144/0x160
> [    8.633617]  ret_from_fork+0x10/0x20
> [    8.637227] Code: a9be7bfd 910003fd f9000bf3 f9400813 (b9400273)
> [    8.643362] ---[ end trace 37b6accc93773476 ]---
>
> full test log:
> https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20210809/testrun/5410288/suite/ltp-crypto-tests/test/af_alg07/log
>
> Reported-by:  Linux Kernel Functional Testing <lkft@linaro.org>
>
> steps to reproduce:
>  # It is always reproducible
>  # Boot arm64 Dragonboard 845c board with built kernel Image
>  # While booting the device you will notice this crash log
>
> metadata:
>   git branch: master
>   git repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
>   git commit: da454ebf578f6c542ba9f5b3ddb98db3ede109c1
>   git describe: next-20210809
>   make_kernelversion: 5.14.0-rc5
>   kernel-config: https://builds.tuxbuild.com/1wURGIfgNW0xkrl16wDktoeATBp/config
>   vmlinux: https://builds.tuxbuild.com/1wURGIfgNW0xkrl16wDktoeATBp/vmlinux.xz
>   System.map: https://builds.tuxbuild.com/1wURGIfgNW0xkrl16wDktoeATBp/System.map
>   Image: https://builds.tuxbuild.com/1wURGIfgNW0xkrl16wDktoeATBp/Image.gz
>   gcc: gcc-11
>

Having a look at this issue, I've traced the issue to the
vfe->ops->hw_version(vfe) call happening before vfe->base is assigned.

I'll submit a patch fixing this issue shortly.


Rob.
