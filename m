Return-Path: <linux-media+bounces-2827-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4B281A7D0
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 21:56:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56BE128306C
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 20:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9737F224D3;
	Wed, 20 Dec 2023 20:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m7p4D35i"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CF94A984
	for <linux-media@vger.kernel.org>; Wed, 20 Dec 2023 20:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5e54d40cca2so1261327b3.3
        for <linux-media@vger.kernel.org>; Wed, 20 Dec 2023 12:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703105779; x=1703710579; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8jXQk5/+5VR9LwkCDgoQyqvEwWXVFhzaMaqAmQ3ILCk=;
        b=m7p4D35ieBFjFbR/roZXr6FbNPp89ctTkZM6CeMdbbIQVlXNlLPkVsrYwXWJJOO1p5
         qTmUpENrtWxMGWMcw5gCY4Rhl3nIt5NZZftXIPFdkwdeHaHMkIGUAgQhZb4itSy49ByX
         KYS44L7eHcPNVTZgkdDj564x+O99fHWlTK8AXpcOB6AIAaRIwSgB6MwoeccPO0K9kPe/
         N/TnhtVTgODZU2EesrfyjuNdvUVYSlYNgFn0dHPObG/F6kJSWmfOMnIUASpWmecyO6lk
         laGrq2XThCWiF4Zsg6dyW4NkaYlr5kPElSMmADqMFsX4M/CW+MKk06+EM/vWo9ygkNJG
         4mQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703105779; x=1703710579;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8jXQk5/+5VR9LwkCDgoQyqvEwWXVFhzaMaqAmQ3ILCk=;
        b=s4tvdst2JGLP7nAaNMV+9cq5JozN1WEFuF7GAOnDBUYNgZJ4+f4rp6G76I9HRk7AH+
         XWmTnMvvVIeIm1op4GUn1iIeV3orOwKZ9feqhBbMXSoDyA7XVOk+OdeRIRP45ezmX3p6
         bOK6g+COOieJ5LeD7vLVKl6fBPtspGWP1EUPRrmsPE8Y/dvfIbk2lmL4JH9yu6WOKgaM
         ceB1jCe5xGc27EhqPm4EFUu3YBffx+awBGdkRTdrf12oFH/Ah7NuJwQ1nDSVBr3mMvMA
         e9v9tUn2wEkHQ6vAkS0cuQpJETufuScOu85hFwMl1FLnsuqKpTYmPfZ4TclVS3tMu5oT
         699Q==
X-Gm-Message-State: AOJu0Yxwhh6tu9MDoyNk9pJKogDSUVkMh/TbrBzxn5JnXndPcSm4OESm
	eReOHj3xx6ENaqwj0Qjb+cnQEjoCaHOjXvtCq0i8JA==
X-Google-Smtp-Source: AGHT+IFpF2wT6V8BM4ESzKpyhwbqOnyXXesXQmx04RJM7bl9iDGGd3LSqWALdoJTjBomALSZtOyyxXRj4W6gSxNRTbM=
X-Received: by 2002:a81:84d2:0:b0:5e5:39aa:2b4e with SMTP id
 u201-20020a8184d2000000b005e539aa2b4emr317464ywf.26.1703105778880; Wed, 20
 Dec 2023 12:56:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1702899149-21321-1-git-send-email-quic_dikshita@quicinc.com>
 <1702899149-21321-2-git-send-email-quic_dikshita@quicinc.com>
 <f0682d53-a2f1-4b68-abe1-90a35c9a0641@linaro.org> <87fea0ec-b0c4-1c68-d5b0-86deac8a25d8@quicinc.com>
 <CAA8EJpqFAEHRa+=ohSC-ucgSkg5CRUpWgGzG4BLbRFnZvqgmtg@mail.gmail.com> <5ea6f599-cdeb-46e7-14a8-5fceb331cdb3@quicinc.com>
In-Reply-To: <5ea6f599-cdeb-46e7-14a8-5fceb331cdb3@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 20 Dec 2023 22:56:06 +0200
Message-ID: <CAA8EJpqO62HVzZnnu_f3OKsy939N_ckNk_KfR6EuaTxDkhwCjg@mail.gmail.com>
Subject: Re: [PATCH v2 01/34] media: introduce common helpers for video
 firmware handling
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stanimir.k.varbanov@gmail.com, 
	quic_vgarodia@quicinc.com, agross@kernel.org, andersson@kernel.org, 
	konrad.dybcio@linaro.org, mchehab@kernel.org, bryan.odonoghue@linaro.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Abhinav,

On Wed, 20 Dec 2023 at 19:10, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Hi Dmitry
>
> On 12/20/2023 12:12 AM, Dmitry Baryshkov wrote:
> > On Wed, 20 Dec 2023 at 10:01, Dikshita Agarwal
> > <quic_dikshita@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 12/18/2023 11:54 PM, Dmitry Baryshkov wrote:
> >>> On 18/12/2023 13:31, Dikshita Agarwal wrote:
> >>>> Re-organize the video driver code by introducing a new folder
> >>>> 'vcodec' and placing 'venus' driver code inside that.
> >>>>
> >>>> Introduce common helpers for trustzone based firmware
> >>>> load/unload etc. which are placed in common folder
> >>>> i.e. 'vcodec'.
> >>>> Use these helpers in 'venus' driver. These helpers will be
> >>>> used by 'iris' driver as well which is introduced later
> >>>> in this patch series.
> >>>
> >>> But why do you need to move the venus driver to subdir?
> >>
> >> Currently venus driver is present in drivers/media/platform/qcom folder
> >> which also has camss folder. We introduced vcodec to keep common code and
> >> moved venus inside that, to indicate that the common code is for vcodec
> >> drivers i.e venus and iris. Keeping this in qcom folder would mean, common
> >> code will be used for camss only which is not the case here.
> >
> > you can have .../platform/qcom/camss, .../platform/qcom/vcodec-common,
> > .../platform/qcom/venus and .../platform/qcom/iris.
> >
> > If you were to use build helpers in a proper kernel module, this would
> > be more obvious.
> >
>
> Although your suggestion is good in terms of avoiding moving venus, I
> think the location of venus was wrong to begin with. There should have
> always been a vcodec (or similar) folder for venus/iris as that will
> establish the boundaries of camss and video sub-system in a cleaner way
>
> I like the mediatek separation that way as it makes the boundaries clear:
>
> drivers/media/platform/mediatek$ ls
> jpeg  Kconfig  Makefile  mdp  mdp3  vcodec  vpu
>
> So I think that this re-org of venus into a vcodec had to happen at some
> point. Its just that it aligned with iris addition.

Then it should be a clean separate step with its own justification.

>
> >>>
> >>>>
> >>>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> >>>> ---
> >>>>    drivers/media/platform/qcom/Kconfig                |   2 +-
> >>>>    drivers/media/platform/qcom/Makefile               |   2 +-
> >>>>    drivers/media/platform/qcom/vcodec/firmware.c      | 147 +++++++++
> >>>>    drivers/media/platform/qcom/vcodec/firmware.h      |  21 ++
> >>>>    .../media/platform/qcom/{ => vcodec}/venus/Kconfig |   0
> >>>>    .../platform/qcom/{ => vcodec}/venus/Makefile      |   4 +-
> >>>>    .../media/platform/qcom/{ => vcodec}/venus/core.c  | 102 +++++-
> >>>>    .../media/platform/qcom/{ => vcodec}/venus/core.h  |   0
> >>>>    .../media/platform/qcom/{ => vcodec}/venus/dbgfs.c |   0
> >>>>    .../media/platform/qcom/{ => vcodec}/venus/dbgfs.h |   0
> >>>>    .../platform/qcom/vcodec/venus/firmware_no_tz.c    | 194 +++++++++++
> >>>>    .../platform/qcom/vcodec/venus/firmware_no_tz.h    |  19 ++
> >>>>    .../platform/qcom/{ => vcodec}/venus/helpers.c     |   0
> >>>>    .../platform/qcom/{ => vcodec}/venus/helpers.h     |   0
> >>>>    .../media/platform/qcom/{ => vcodec}/venus/hfi.c   |   0
> >>>>    .../media/platform/qcom/{ => vcodec}/venus/hfi.h   |   0
> >>>>    .../platform/qcom/{ => vcodec}/venus/hfi_cmds.c    |   0
> >>>>    .../platform/qcom/{ => vcodec}/venus/hfi_cmds.h    |   0
> >>>>    .../platform/qcom/{ => vcodec}/venus/hfi_helper.h  |   0
> >>>>    .../platform/qcom/{ => vcodec}/venus/hfi_msgs.c    |   0
> >>>>    .../platform/qcom/{ => vcodec}/venus/hfi_msgs.h    |   0
> >>>>    .../platform/qcom/{ => vcodec}/venus/hfi_parser.c  |   0
> >>>>    .../platform/qcom/{ => vcodec}/venus/hfi_parser.h  |   0
> >>>>    .../qcom/{ => vcodec}/venus/hfi_plat_bufs.h        |   0
> >>>>    .../qcom/{ => vcodec}/venus/hfi_plat_bufs_v6.c     |   0
> >>>>    .../qcom/{ => vcodec}/venus/hfi_platform.c         |   0
> >>>>    .../qcom/{ => vcodec}/venus/hfi_platform.h         |   0
> >>>>    .../qcom/{ => vcodec}/venus/hfi_platform_v4.c      |   0
> >>>>    .../qcom/{ => vcodec}/venus/hfi_platform_v6.c      |   0
> >>>>    .../platform/qcom/{ => vcodec}/venus/hfi_venus.c   |  21 +-
> >>>>    .../platform/qcom/{ => vcodec}/venus/hfi_venus.h   |   0
> >>>>    .../qcom/{ => vcodec}/venus/hfi_venus_io.h         |   0
> >>>>    .../platform/qcom/{ => vcodec}/venus/pm_helpers.c  |   0
> >>>>    .../platform/qcom/{ => vcodec}/venus/pm_helpers.h  |   0
> >>>>    .../media/platform/qcom/{ => vcodec}/venus/vdec.c  |   0
> >>>>    .../media/platform/qcom/{ => vcodec}/venus/vdec.h  |   0
> >>>>    .../platform/qcom/{ => vcodec}/venus/vdec_ctrls.c  |   0
> >>>>    .../media/platform/qcom/{ => vcodec}/venus/venc.c  |   0
> >>>>    .../media/platform/qcom/{ => vcodec}/venus/venc.h  |   0
> >>>>    .../platform/qcom/{ => vcodec}/venus/venc_ctrls.c  |   0
> >>>>    drivers/media/platform/qcom/venus/firmware.c       | 363
> >>>> ---------------------
> >>>>    drivers/media/platform/qcom/venus/firmware.h       |  26 --
> >>>>    42 files changed, 492 insertions(+), 409 deletions(-)
> >>>>    create mode 100644 drivers/media/platform/qcom/vcodec/firmware.c
> >>>>    create mode 100644 drivers/media/platform/qcom/vcodec/firmware.h
> >>>>    rename drivers/media/platform/qcom/{ => vcodec}/venus/Kconfig (100%)
> >>>>    rename drivers/media/platform/qcom/{ => vcodec}/venus/Makefile (83%)
> >>>>    rename drivers/media/platform/qcom/{ => vcodec}/venus/core.c (91%)
> >>>>    rename drivers/media/platform/qcom/{ => vcodec}/venus/core.h (100%)
> >>>>    rename drivers/media/platform/qcom/{ => vcodec}/venus/dbgfs.c (100%)
> >>>>    rename drivers/media/platform/qcom/{ => vcodec}/venus/dbgfs.h (100%)
> >>>>    create mode 100644
> >>>> drivers/media/platform/qcom/vcodec/venus/firmware_no_tz.c
> >>>>    create mode 100644
> >>>> drivers/media/platform/qcom/vcodec/venus/firmware_no_tz.h
> >>>>    rename drivers/media/platform/qcom/{ => vcodec}/venus/helpers.c (100%)
> >>>>    rename drivers/media/platform/qcom/{ => vcodec}/venus/helpers.h (100%)
> >>>>    rename drivers/media/platform/qcom/{ => vcodec}/venus/hfi.c (100%)
> >>>>    rename drivers/media/platform/qcom/{ => vcodec}/venus/hfi.h (100%)
> >>>>    rename drivers/media/platform/qcom/{ => vcodec}/venus/hfi_cmds.c (100%)
> >>>>    rename drivers/media/platform/qcom/{ => vcodec}/venus/hfi_cmds.h (100%)
> >>>>    rename drivers/media/platform/qcom/{ => vcodec}/venus/hfi_helper.h (100%)
> >>>>    rename drivers/media/platform/qcom/{ => vcodec}/venus/hfi_msgs.c (100%)
> >>>>    rename drivers/media/platform/qcom/{ => vcodec}/venus/hfi_msgs.h (100%)
> >>>>    rename drivers/media/platform/qcom/{ => vcodec}/venus/hfi_parser.c (100%)
> >>>>    rename drivers/media/platform/qcom/{ => vcodec}/venus/hfi_parser.h (100%)
> >>>>    rename drivers/media/platform/qcom/{ => vcodec}/venus/hfi_plat_bufs.h
> >>>> (100%)
> >>>>    rename drivers/media/platform/qcom/{ =>
> >>>> vcodec}/venus/hfi_plat_bufs_v6.c (100%)
> >>>>    rename drivers/media/platform/qcom/{ => vcodec}/venus/hfi_platform.c
> >>>> (100%)
> >>>>    rename drivers/media/platform/qcom/{ => vcodec}/venus/hfi_platform.h
> >>>> (100%)
> >>>>    rename drivers/media/platform/qcom/{ => vcodec}/venus/hfi_platform_v4.c
> >>>> (100%)
> >>>>    rename drivers/media/platform/qcom/{ => vcodec}/venus/hfi_platform_v6.c
> >>>> (100%)
> >>>>    rename drivers/media/platform/qcom/{ => vcodec}/venus/hfi_venus.c (99%)
> >>>>    rename drivers/media/platform/qcom/{ => vcodec}/venus/hfi_venus.h (100%)
> >>>>    rename drivers/media/platform/qcom/{ => vcodec}/venus/hfi_venus_io.h
> >>>> (100%)
> >>>>    rename drivers/media/platform/qcom/{ => vcodec}/venus/pm_helpers.c (100%)
> >>>>    rename drivers/media/platform/qcom/{ => vcodec}/venus/pm_helpers.h (100%)
> >>>>    rename drivers/media/platform/qcom/{ => vcodec}/venus/vdec.c (100%)
> >>>>    rename drivers/media/platform/qcom/{ => vcodec}/venus/vdec.h (100%)
> >>>>    rename drivers/media/platform/qcom/{ => vcodec}/venus/vdec_ctrls.c (100%)
> >>>>    rename drivers/media/platform/qcom/{ => vcodec}/venus/venc.c (100%)
> >>>>    rename drivers/media/platform/qcom/{ => vcodec}/venus/venc.h (100%)
> >>>>    rename drivers/media/platform/qcom/{ => vcodec}/venus/venc_ctrls.c (100%)
> >>>>    delete mode 100644 drivers/media/platform/qcom/venus/firmware.c
> >>>>    delete mode 100644 drivers/media/platform/qcom/venus/firmware.h
> >>>>
> >>>> diff --git a/drivers/media/platform/qcom/Kconfig
> >>>> b/drivers/media/platform/qcom/Kconfig
> >>>> index cc5799b..e94142f 100644
> >>>> --- a/drivers/media/platform/qcom/Kconfig
> >>>> +++ b/drivers/media/platform/qcom/Kconfig
> >>>> @@ -3,4 +3,4 @@
> >>>>    comment "Qualcomm media platform drivers"
> >>>>      source "drivers/media/platform/qcom/camss/Kconfig"
> >>>> -source "drivers/media/platform/qcom/venus/Kconfig"
> >>>> +source "drivers/media/platform/qcom/vcodec/venus/Kconfig"
> >>>> diff --git a/drivers/media/platform/qcom/Makefile
> >>>> b/drivers/media/platform/qcom/Makefile
> >>>> index 4f055c3..3d2d82b 100644
> >>>> --- a/drivers/media/platform/qcom/Makefile
> >>>> +++ b/drivers/media/platform/qcom/Makefile
> >>>> @@ -1,3 +1,3 @@
> >>>>    # SPDX-License-Identifier: GPL-2.0-only
> >>>>    obj-y += camss/
> >>>> -obj-y += venus/
> >>>> +obj-y += vcodec/venus/
> >>>> diff --git a/drivers/media/platform/qcom/vcodec/firmware.c
> >>>> b/drivers/media/platform/qcom/vcodec/firmware.c
> >>>> new file mode 100644
> >>>> index 0000000..dbc220a
> >>>> --- /dev/null
> >>>> +++ b/drivers/media/platform/qcom/vcodec/firmware.c
> >>>> @@ -0,0 +1,147 @@
> >>>> +// SPDX-License-Identifier: GPL-2.0-only
> >>>> +/*
> >>>> + * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights
> >>>> reserved.
> >>>> + */
> >>>> +
> >>>> +#include <linux/device.h>
> >>>> +#include <linux/dma-mapping.h>
> >>>> +#include <linux/firmware.h>
> >>>> +#include <linux/kernel.h>
> >>>> +#include <linux/iommu.h>
> >>>> +#include <linux/of_device.h>
> >>>> +#include <linux/firmware/qcom/qcom_scm.h>
> >>>> +#include <linux/of_reserved_mem.h>
> >>>> +#include <linux/platform_device.h>
> >>>> +#include <linux/soc/qcom/mdt_loader.h>
> >>>> +
> >>>> +#include "firmware.h"
> >>>> +
> >>>> +bool use_tz(struct device *core_dev)
> >>>
> >>> All these functions must get some sane prefix. Otherwise a generic 'use_tz'
> >>> function is too polluting for the global namespace.
> >>>
> >> I understand, will check and do the needful.
> >>>> +{
> >>>> +    struct device_node *np;
> >>>> +
> >>>> +    np = of_get_child_by_name(core_dev->of_node, "video-firmware");
> >>>> +    if (!np)
> >>>> +        return true;
> >>>> +
> >>>> +    return false;
> >>>> +}
> >>>> +
> >>>> +int protect_secure_region(u32 cp_start, u32 cp_size, u32 cp_nonpixel_start,
> >>>> +              u32 cp_nonpixel_size, u32 pas_id)
> >>>> +{
> >>>> +    int ret;
> >>>> +    /*
> >>>> +     * Clues for porting using downstream data:
> >>>> +     * cp_start = 0
> >>>> +     * cp_size = venus_ns/virtual-addr-pool[0] - yes, address and not size!
> >>>> +     *   This works, as the non-secure context bank is placed
> >>>> +     *   contiguously right after the Content Protection region.
> >>>> +     *
> >>>> +     * cp_nonpixel_start = venus_sec_non_pixel/virtual-addr-pool[0]
> >>>> +     * cp_nonpixel_size = venus_sec_non_pixel/virtual-addr-pool[1]
> >>>> +     */
> >>>> +    ret = qcom_scm_mem_protect_video_var(cp_start,
> >>>> +                         cp_size,
> >>>> +                         cp_nonpixel_start,
> >>>> +                         cp_nonpixel_size);
> >>>> +    if (ret)
> >>>> +        qcom_scm_pas_shutdown(pas_id);
> >>>> +
> >>>> +    return ret;
> >>>> +}
> >>>> +
> >>>> +int load_fw(struct device *dev, const char *fw_name, phys_addr_t *mem_phys,
> >>>> +        size_t *mem_size, u32 pas_id, bool use_tz)
> >>>> +{
> >>>> +    const struct firmware *firmware = NULL;
> >>>> +    struct reserved_mem *rmem;
> >>>> +    struct device_node *node;
> >>>> +    void *mem_virt = NULL;
> >>>> +    ssize_t fw_size = 0;
> >>>> +    int ret;
> >>>> +
> >>>> +    if (!IS_ENABLED(CONFIG_QCOM_MDT_LOADER) ||
> >>>
> >>> Why? Can you just depend on it?
> >>>
> >> Sure, Will check this and get back.
> >>>> +        (use_tz && !qcom_scm_is_available()))
> >>>> +        return -EPROBE_DEFER;
> >>>> +
> >>>> +    if (!fw_name || !(*fw_name))
> >>>> +        return -EINVAL;
> >>>> +
> >>>> +    *mem_phys = 0;
> >>>> +    *mem_size = 0;
> >>>> +
> >>>> +    node = of_parse_phandle(dev->of_node, "memory-region", 0);
> >>>> +    if (!node) {
> >>>> +        dev_err(dev, "no memory-region specified\n");
> >>>> +        return -EINVAL;
> >>>> +    }
> >>>> +
> >>>> +    rmem = of_reserved_mem_lookup(node);
> >>>> +    of_node_put(node);
> >>>> +    if (!rmem) {
> >>>> +        dev_err(dev, "failed to lookup reserved memory-region\n");
> >>>> +        return -EINVAL;
> >>>> +    }
> >>>> +
> >>>> +    ret = request_firmware(&firmware, fw_name, dev);
> >>>> +    if (ret) {
> >>>> +        dev_err(dev, "%s: failed to request fw \"%s\", error %d\n",
> >>>> +            __func__, fw_name, ret);
> >>>> +        return ret;
> >>>> +    }
> >>>> +
> >>>> +    fw_size = qcom_mdt_get_size(firmware);
> >>>> +    if (fw_size < 0) {
> >>>> +        ret = fw_size;
> >>>> +        dev_err(dev, "%s: out of bound fw image fw size: %ld\n",
> >>>> +            __func__, fw_size);
> >>>> +        goto err_release_fw;
> >>>> +    }
> >>>> +
> >>>> +    *mem_phys = rmem->base;
> >>>> +    *mem_size = rmem->size;
> >>>> +
> >>>> +    if (*mem_size < fw_size) {
> >>>> +        ret = -EINVAL;
> >>>> +        goto err_release_fw;
> >>>> +    }
> >>>> +
> >>>> +    mem_virt = memremap(*mem_phys, *mem_size, MEMREMAP_WC);
> >>>> +    if (!mem_virt) {
> >>>> +        dev_err(dev, "unable to remap fw memory region %pa size %#zx\n",
> >>>> +            mem_phys, *mem_size);
> >>>> +        goto err_release_fw;
> >>>> +    }
> >>>> +
> >>>> +    if (use_tz)
> >>>> +        ret = qcom_mdt_load(dev, firmware, fw_name, pas_id, mem_virt,
> >>>> +                    *mem_phys, *mem_size, NULL);
> >>>> +    else
> >>>> +        ret = qcom_mdt_load_no_init(dev, firmware, fw_name, pas_id,
> >>>> mem_virt,
> >>>> +                        *mem_phys, *mem_size, NULL);
> >>>> +    if (ret) {
> >>>> +        dev_err(dev, "%s: error %d loading fw \"%s\"\n",
> >>>> +            __func__, ret, fw_name);
> >>>> +    }
> >>>> +
> >>>> +    memunmap(mem_virt);
> >>>> +err_release_fw:
> >>>> +    release_firmware(firmware);
> >>>> +    return ret;
> >>>> +}
> >>>> +
> >>>> +int auth_reset_fw(u32 pas_id)
> >>>> +{
> >>>> +    return qcom_scm_pas_auth_and_reset(pas_id);
> >>>> +}
> >>>> +
> >>>> +void unload_fw(u32 pas_id)
> >>>> +{
> >>>> +    qcom_scm_pas_shutdown(pas_id);
> >>>> +}
> >>>> +
> >>>> +int set_hw_state(bool resume)
> >>>> +{
> >>>> +    return qcom_scm_set_remote_state(resume, 0);
> >>>> +}
> >>>> diff --git a/drivers/media/platform/qcom/vcodec/firmware.h
> >>>> b/drivers/media/platform/qcom/vcodec/firmware.h
> >>>> new file mode 100644
> >>>> index 0000000..7d410a8
> >>>> --- /dev/null
> >>>> +++ b/drivers/media/platform/qcom/vcodec/firmware.h
> >>>> @@ -0,0 +1,21 @@
> >>>> +/* SPDX-License-Identifier: GPL-2.0-only */
> >>>> +/*
> >>>> + * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights
> >>>> reserved.
> >>>> + */
> >>>> +
> >>>> +#ifndef _FIRMWARE_H_
> >>>> +#define _FIRMWARE_H_
> >>>> +
> >>>> +#include <linux/device.h>
> >>>> +#include <linux/types.h>
> >>>> +
> >>>> +bool use_tz(struct device *core_dev);
> >>>> +int load_fw(struct device *dev, const char *fw_name, phys_addr_t *mem_phys,
> >>>> +        size_t *mem_size, u32 pas_id, bool use_tz);
> >>>> +int auth_reset_fw(u32 pas_id);
> >>>> +int protect_secure_region(u32 cp_start, u32 cp_size, u32 cp_nonpixel_start,
> >>>> +              u32 cp_nonpixel_size, u32 pas_id);
> >>>> +void unload_fw(u32 pas_id);
> >>>> +int set_hw_state(bool resume);
> >>>> +
> >>>> +#endif
> >>>> diff --git a/drivers/media/platform/qcom/venus/Kconfig
> >>>> b/drivers/media/platform/qcom/vcodec/venus/Kconfig
> >>>> similarity index 100%
> >>>> rename from drivers/media/platform/qcom/venus/Kconfig
> >>>> rename to drivers/media/platform/qcom/vcodec/venus/Kconfig
> >>>> diff --git a/drivers/media/platform/qcom/venus/Makefile
> >>>> b/drivers/media/platform/qcom/vcodec/venus/Makefile
> >>>> similarity index 83%
> >>>> rename from drivers/media/platform/qcom/venus/Makefile
> >>>> rename to drivers/media/platform/qcom/vcodec/venus/Makefile
> >>>> index 91ee6be..f6f3a88 100644
> >>>> --- a/drivers/media/platform/qcom/venus/Makefile
> >>>> +++ b/drivers/media/platform/qcom/vcodec/venus/Makefile
> >>>> @@ -1,7 +1,9 @@
> >>>>    # SPDX-License-Identifier: GPL-2.0
> >>>>    # Makefile for Qualcomm Venus driver
> >>>>    -venus-core-objs += core.o helpers.o firmware.o \
> >>>> +venus-core-objs += ../firmware.o
> >>>> +
> >>>> +venus-core-objs += core.o helpers.o firmware_no_tz.o \
> >>>>               hfi_venus.o hfi_msgs.o hfi_cmds.o hfi.o \
> >>>>               hfi_parser.o pm_helpers.o dbgfs.o \
> >>>>               hfi_platform.o hfi_platform_v4.o \
> >>>> diff --git a/drivers/media/platform/qcom/venus/core.c
> >>>> b/drivers/media/platform/qcom/vcodec/venus/core.c
> >>>> similarity index 91%
> >>>> rename from drivers/media/platform/qcom/venus/core.c
> >>>> rename to drivers/media/platform/qcom/vcodec/venus/core.c
> >>>> index 9cffe97..56d9a53 100644
> >>>> --- a/drivers/media/platform/qcom/venus/core.c
> >>>> +++ b/drivers/media/platform/qcom/vcodec/venus/core.c
> >>>> @@ -22,7 +22,8 @@
> >>>>    #include <media/v4l2-ioctl.h>
> >>>>      #include "core.h"
> >>>> -#include "firmware.h"
> >>>> +#include "../firmware.h"
> >>>> +#include "firmware_no_tz.h"
> >>>>    #include "pm_helpers.h"
> >>>>    #include "hfi_venus_io.h"
> >>>>    @@ -86,6 +87,8 @@ static void venus_sys_error_handler(struct
> >>>> work_struct *work)
> >>>>        struct venus_core *core =
> >>>>                container_of(work, struct venus_core, work.work);
> >>>>        int ret, i, max_attempts = RPM_WAIT_FOR_IDLE_MAX_ATTEMPTS;
> >>>> +    const struct venus_resources *res = core->res;
> >>>> +    const char *fwpath = NULL;
> >>>>        const char *err_msg = "";
> >>>>        bool failed = false;
> >>>>    @@ -107,7 +110,10 @@ static void venus_sys_error_handler(struct
> >>>> work_struct *work)
> >>>>          mutex_lock(&core->lock);
> >>>>    -    venus_shutdown(core);
> >>>> +    if (core->use_tz)
> >>>> +        unload_fw(VENUS_PAS_ID);
> >>>> +    else
> >>>> +        unload_fw_no_tz(core);
> >>>
> >>> This is more than introducing helpers.
> >>>
> >> The new helpers are written to make the code generic for video drivers.
> >> which requires changes in the calling function also.
> >>>>          venus_coredump(core);
> >>>>    @@ -127,12 +133,39 @@ static void venus_sys_error_handler(struct
> >>>> work_struct *work)
> >>>>            failed = true;
> >>>>        }
> >>>>    -    ret = venus_boot(core);
> >>>> +    ret = of_property_read_string_index(core->dev->of_node,
> >>>> "firmware-name", 0,
> >>>> +                        &fwpath);
> >>>> +    if (ret)
> >>>> +        fwpath = core->res->fwname;
> >>>> +
> >>>> +    ret = load_fw(core->dev, fwpath, &core->fw.mem_phys,
> >>>> &core->fw.mem_size,
> >>>> +              VENUS_PAS_ID, core->use_tz);
> >>>
> >>> So, we had a nice local 'venus_boot'. Instead we now have a pile of code
> >>> with non-generic prefixes, etc. If you are introducing helpers, please
> >>> refrain from inlining of calling functions, etc. Just move the code to your
> >>> helpers.
> >>>
> >> As mentioned in above comment, the common helpers are written to make the
> >> code generic. I Will try to make it more clear, working on the same.
> >
> > First, you move the code, then you make it generic. Or vice versa.
> > First you split the code, then you move it. Don't do both in the same
> > patch.
> >
> >>> NAK for the rest of the patch.
> >
> >



-- 
With best wishes
Dmitry

