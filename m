Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 429623E8B19
	for <lists+linux-media@lfdr.de>; Wed, 11 Aug 2021 09:32:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235359AbhHKHcp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Aug 2021 03:32:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233182AbhHKHcp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Aug 2021 03:32:45 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7990C061765
        for <linux-media@vger.kernel.org>; Wed, 11 Aug 2021 00:32:21 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id m24-20020a17090a7f98b0290178b1a81700so3268839pjl.4
        for <linux-media@vger.kernel.org>; Wed, 11 Aug 2021 00:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wcD/JNTEx81hT6hEHrkw+9ZwSdksENZDQ4kxkWN0qsg=;
        b=hadeHsvkdSdW3mjdvkCVqKcazLNvhqaVGag0+BUfnhoLI84mAKmdewf3CasNSu27bP
         663s/Ctr/5Rc5Inl0pttRsHMDxKqOduuDwOjCBpYmsoeS8dKK2Kw4NTK91JaWvgoAoBI
         PPMmU+2a1vkw42ojU0SxCOLTYnI6qg7WLXT3qQb7SDQbzCc3PG0PYy+p3gTLva9SL/IN
         qO5DanDSUR42uEqrV3ZEtIRhp3z8wRAPfjQkpGtGZ/6FR0e5h5Lkz2Ujbp6V2Z4u7/3E
         czXLVXVb8YB4RFDB8Xx13qpWo0W2KJaKHsK3o5ZjsYL66QYGAbXb3z6lrgxtJ9DLYNQb
         weyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wcD/JNTEx81hT6hEHrkw+9ZwSdksENZDQ4kxkWN0qsg=;
        b=FTODkpTcY1sJ/Z1dzwy8KrU6Bndss886qhIEKJ7R3V06NUlHGzHJEHO/IqVceeSaKE
         hmTQNk1yRv4jCNvSQqOdSZttlgrQeqHoG7LD60kCcTs8i2Dk6FwRa34bwWhFM8hW5s2L
         oXur0UecG0am8mi2N+tw6DcPYH8OTFTwtgQW0+m0fe7EChRN0a4Qic6PcS3cu4JyckUB
         jpMiv7b5F9D2jdK7If+hTrfrDhXAePYKufCJMeMi64ej/a4jJ6aDe10XO/SVWA0Z5hrY
         ovsAg0KhQxwj+kYSaqGQZ7noMy430VEfnczpCRQ9oE1+qLJeOmpZeDZmIb19gWmsKbvK
         zmHA==
X-Gm-Message-State: AOAM530nhevcmu8swe5grV4h7Eab5u952nsnPLInl4nJgSwlTuHgOBFO
        vQf5Yi62AUT0Ojetpo6wt8eFgE3WZo/ncI2eFQ3Wxg==
X-Google-Smtp-Source: ABdhPJy2t8leznlaC8TIy/KxCH+9ARTl3UVlt7gvYOC7pdip0katvMheH+4sR+MoN755Pxs0C6dohnIhsKsoKuin+gU=
X-Received: by 2002:a63:f754:: with SMTP id f20mr17246pgk.385.1628667141334;
 Wed, 11 Aug 2021 00:32:21 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20210810214617eucas1p1e007c68c34792a844b6c72dd11d05887@eucas1p1.samsung.com>
 <20210726080113.8378-1-robert.foss@linaro.org> <cea446e5-f377-d565-2701-94194d565d99@samsung.com>
In-Reply-To: <cea446e5-f377-d565-2701-94194d565d99@samsung.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Wed, 11 Aug 2021 09:32:11 +0200
Message-ID: <CAG3jFyvwpU6BGLQTn8x8MuvTqhy5XAE+HeYVFWN5vZdGows5SA@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] media: camss: vfe: Don't read hardware version needlessly
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Todor Tomov <todor.too@gmail.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Marek,



On Tue, 10 Aug 2021 at 23:46, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> Hi,
>
> On 26.07.2021 10:01, Robert Foss wrote:
> > vfe_set_power() is invoced a few times, which causes a lot of
> > VFE HW version prints.
> >
> > Secondly there is no real reason for calling hw_version_read() from
> > this location specifically, since it does nothing more than print
> > the VFE HW version.
> >
> > A better location for the hw_version_read() call would be somewhere
> > which is only executed once per VFE unit.
> >
> > Signed-off-by: Robert Foss <robert.foss@linaro.org>
>
> This patch landed recently in linux-next as commit b10b5334528a ("media:
> camss: vfe: Don't read hardware version needlessly"). Sadly it causes a
> following regression on DragonBoard410c
> (arch/arm64/boot/dts/qcom/apq8016-sbc.dts):
>
> Unable to handle kernel NULL pointer dereference at virtual address
> 0000000000000000
> Mem abort info:
>    ESR = 0x96000006
>    EC = 0x25: DABT (current EL), IL = 32 bits
>    SET = 0, FnV = 0
>    EA = 0, S1PTW = 0
>    FSC = 0x06: level 2 translation fault
> input: pm8941_resin as
> /devices/platform/soc/200f000.spmi/spmi-0/0-00/200f000.spmi:pmic@0:pon@800/200f000.spmi:pmic@0:pon@800:resin/input/input2
> Data abort info:
>    ISV = 0, ISS = 0x00000006
>    CM = 0, WnR = 0
> user pgtable: 4k pages, 48-bit VAs, pgdp=0000000087ca0000
> [0000000000000000] pgd=0800000084c4c003, p4d=0800000084c4c003,
> pud=08000000859c2003, pmd=0000000000000000
> Internal error: Oops: 96000006 [#1] PREEMPT SMP
> Modules linked in: msm(+) qcom_pon rtc_pm8xxx qcom_spmi_vadc
> qcom_vadc_common qcom_camss(+) snd_soc_msm8916_analog
> qcom_spmi_temp_alarm venus_core(+) videobuf2_dma_sg v4l2_fwnode
> snd_soc_lpass_apq8016 v4l2_async videobuf2_memops snd_soc_lpass_cpu
> v4l2_mem2mem snd_soc_apq8016_sbc snd_soc_lpass_platform
> snd_soc_msm8916_digital videobuf2_v4l2 snd_soc_qcom_common
> videobuf2_common qnoc_msm8916 qcom_rng videodev i2c_qcom_cci mdt_loader
> mc icc_smd_rpm crct10dif_ce socinfo rmtfs_mem display_connector
> adreno 1c00000.gpu: Adding to iommu group 2
> CPU: 1 PID: 286 Comm: systemd-udevd Not tainted 5.14.0-rc4+ #3778
> Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
> pstate: 80000005 (Nzcv daif -PAN -UAO -TCO BTYPE=--)
> pc : vfe_hw_version_read+0x4/0x10 [qcom_camss]
> platform 1a98000.dsi: Fixing up cyclic dependency with 3-0039
> lr : msm_vfe_subdev_init+0x84/0x558 [qcom_camss]
> platform 1a98000.dsi: Fixing up cyclic dependency with 1a01000.mdp
> sp : ffff8000148337f0
> x29: ffff8000148337f0 x28: ffff000006c1d800 x27: 0000000000000001
> x26: 0000000000000002 x25: ffff8000091976d0 x24: ffff000006a98080
> x23: 0000000000000000 x22: ffff000006c1d800 x21: ffff000000298010
> x20: ffff800009197028 x19: ffff000000298000 x18: 0000000000000000
> x17: 2e726f74616c7567 x16: 0000000000000028 x15: 0000b5f01da86af8
> x14: 0000000000000001 x13: 000000000000001f x12: 0000000000000001
> x11: 0000000000000010 x10: 0101010101010101 x9 : ffff8000091922f0
> x8 : ffff8000091949f0 x7 : ffff800009194a08 x6 : ffff8000091925c8
> x5 : ffff800009191f00 x4 : ffff000006a9ca00 x3 : ffff000006a9c080
> x2 : ffff80000918d3a0 x1 : ffff000000298010 x0 : 0000000000000000
> msm_mdp 1a01000.mdp: Adding to iommu group 3
> Call trace:
>   vfe_hw_version_read+0x4/0x10 [qcom_camss]
>   camss_probe+0x370/0xdd0 [qcom_camss]
>   platform_probe+0x90/0xd8
>   really_probe+0x138/0x2d0
>   __driver_probe_device+0x78/0xd8
>   driver_probe_device+0x40/0x110
>   __driver_attach+0xcc/0x118
>   bus_for_each_dev+0x68/0xc8
>   driver_attach+0x20/0x28
>   bus_add_driver+0x168/0x1f8
>   driver_register+0x60/0x110
>   __platform_driver_register+0x24/0x30
>   qcom_camss_driver_init+0x1c/0x1000 [qcom_camss]
>   do_one_initcall+0x84/0x450
>   do_init_module+0x58/0x200
>   load_module+0x1f54/0x26a0
>   __do_sys_finit_module+0xe4/0x100
>   __arm64_sys_finit_module+0x18/0x20
>   invoke_syscall+0x40/0xf8
>   el0_svc_common+0x60/0x100
>   do_el0_svc_compat+0x1c/0x48
>   el0_svc_compat+0x20/0x30
>   el0t_32_sync_handler+0xec/0x140
>   el0t_32_sync+0x168/0x16c
> Code: 88dffc63 88dffc63 00000000 f9400800 (b9400000)
> ---[ end trace e1e3b303eae40654 ]---
>
> Let me know if I can help somehow to fix this issue.
>
> > ---
> >   drivers/media/platform/qcom/camss/camss-vfe.c | 3 +--
> >   1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> > index e0f3a36f3f3f..f6e889c1598e 100644
> > --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> > +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> > @@ -713,8 +713,6 @@ static int vfe_set_power(struct v4l2_subdev *sd, int on)
> >               ret = vfe_get(vfe);
> >               if (ret < 0)
> >                       return ret;
> > -
> > -             vfe->ops->hw_version_read(vfe, vfe->camss->dev);
> >       } else {
> >               vfe_put(vfe);
> >       }
> > @@ -1301,6 +1299,7 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
> >               return -EINVAL;
> >       }
> >       vfe->ops->subdev_init(dev, vfe);
> > +     vfe->ops->hw_version_read(vfe, dev);
> >
> >       /* Memory */
> >
>

Thanks for reporting this.

I submitted a patch[1] for this yesterday, if you have time to test it
and supply a Tested-by/Reviewed-by, that would be really helpful.

[1] https://lore.kernel.org/linux-arm-msm/20210810103336.114077-1-robert.foss@linaro.org/
