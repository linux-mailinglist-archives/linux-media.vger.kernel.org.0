Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFA473E859B
	for <lists+linux-media@lfdr.de>; Tue, 10 Aug 2021 23:46:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234877AbhHJVqq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Aug 2021 17:46:46 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:38729 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234852AbhHJVqm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Aug 2021 17:46:42 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20210810214618euoutp02122c03394aaf89d8235b318c77440a70~aECfJpi-S2841728417euoutp02H
        for <linux-media@vger.kernel.org>; Tue, 10 Aug 2021 21:46:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20210810214618euoutp02122c03394aaf89d8235b318c77440a70~aECfJpi-S2841728417euoutp02H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1628631978;
        bh=S25XaAe0ngNqrCVdTPrPS4i86nKmo+AzEvVivVRY+cE=;
        h=Subject:To:From:Date:In-Reply-To:References:From;
        b=Sq4yomnnc9Kh84itcjf2wiF1zRrWroeBzaod/BM9DR5cCc3IwcnMbmOG5eWIBMC3f
         09+hFmm7q5I+3MS1byydXEhyXk+szvPLBsA6P/xfm9e7337AM4WuLpTcch1vZ5vVND
         lpOpJ4gUAzpniRyGUtEkM0AWt/R8HVGDFqTiBpoc=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20210810214617eucas1p14da6ebc5f1fb9ad276590938b3023f20~aECetelZu0812208122eucas1p1A;
        Tue, 10 Aug 2021 21:46:17 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 1F.5F.56448.9A3F2116; Tue, 10
        Aug 2021 22:46:17 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20210810214617eucas1p1e007c68c34792a844b6c72dd11d05887~aECeTllFG0812208122eucas1p1-;
        Tue, 10 Aug 2021 21:46:17 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210810214617eusmtrp192a2aef195af6ec0addc791fa1894025~aECeS4r_v0902309023eusmtrp1M;
        Tue, 10 Aug 2021 21:46:17 +0000 (GMT)
X-AuditID: cbfec7f5-d3bff7000002dc80-a0-6112f3a987b6
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 75.64.20981.9A3F2116; Tue, 10
        Aug 2021 22:46:17 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20210810214616eusmtip2b510259d70584686d121513db11c33ed~aECdqZGqO0254702547eusmtip2o;
        Tue, 10 Aug 2021 21:46:16 +0000 (GMT)
Subject: Re: [PATCH v1 1/4] media: camss: vfe: Don't read hardware version
 needlessly
To:     Robert Foss <robert.foss@linaro.org>, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <cea446e5-f377-d565-2701-94194d565d99@samsung.com>
Date:   Tue, 10 Aug 2021 23:46:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210726080113.8378-1-robert.foss@linaro.org>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBKsWRmVeSWpSXmKPExsWy7djPc7orPwslGkz5Y2Rx7vFvFotXp9rZ
        LU7vf8disfv1KiaLifvPsltc3jWHzaJnw1ZWi2Wb/jBZfJr1kNni0JRpbA5cHjtn3WX32LSq
        k83jzrU9bB6fN8kFsERx2aSk5mSWpRbp2yVwZXx8spS9YK96RVPTadYGxpOKXYycHBICJhIf
        W/8wdzFycQgJrGCUWHrrIQuE84VR4vHEHewgVUICnxklpm+phel4vuEKVMdyRomTvx6wQzgf
        GSXWHzzJDFIlLBAuceX7V7BRIgJHmCSmH5oJlmATMJToetvFBmLzCthJXOh+wQhiswioSqx9
        cYUVxBYVSJa4c/o9VI2gxMmZT1hAbE4Ba4k7O38zgdjMAvISzVtnM0PY4hK3nsxnAlkmIXCH
        Q+LnzJcsELe6SKy6e4gNwhaWeHV8CzuELSNxenIPC0RDM6PEw3Nr2SGcHkaJy00zGCGqgNad
        +wXUzQG0QlNi/S59iLCjxKcXy9lBwhICfBI33gpCHMEnMWnbdGaIMK9ER5sQRLWaxKzj6+DW
        HrxwCarEQ2LaUt4JjIqzkHw5C8lns5B8NgvhhAWMLKsYxVNLi3PTU4uN81LL9YoTc4tL89L1
        kvNzNzECE9Ppf8e/7mBc8eqj3iFGJg7GQ4wSHMxKIrw75YQShXhTEiurUovy44tKc1KLDzFK
        c7AoifPu2romXkggPbEkNTs1tSC1CCbLxMEp1cAUvXnimmrltP6dyVFlQpM9dWQUOUv/qnAp
        bzqielo1dWay8VTm+H35+rffzlI99E0sV+H/jnue1664CBtuv/VX0atpv3JQx8O+fC9nhbXv
        H+Xsu5m0VWLdkuyb79j80+Rfz/Dm1L4Ytz9N0WrZyal/smY1dNn8a3qvcPPUvDdBWnbO4ixa
        t5huhXhqpCg+PPPQ6yqLYOqeeUsZChY3zz7qODfMKfzNpE9eW8p+tzus79BTW/GTZ8b/LQJt
        zB2d7x2CE5UXLVl3JL9s7lnxyOru7xKJ5Q8bObg2P/4haFH1vM7rRvneTo1lMxmctmX+vrt9
        y8lIoa0T2OceUisT2z3rRZ7GlH93t/reKap7XK2oxFKckWioxVxUnAgAVZ+jz7sDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRmVeSWpSXmKPExsVy+t/xe7orPwslGrxsFrc49/g3i8WrU+3s
        Fqf3v2Ox2P16FZPFxP1n2S0u75rDZtGzYSurxbJNf5gsPs16yGxxaMo0Ngcuj52z7rJ7bFrV
        yeZx59oeNo/Pm+QCWKL0bIryS0tSFTLyi0tslaINLYz0DC0t9IxMLPUMjc1jrYxMlfTtbFJS
        czLLUov07RL0Mj4+WcpesFe9oqnpNGsD40nFLkZODgkBE4nnG64wg9hCAksZJT7NC4eIy0ic
        nNbACmELS/y51sXWxcgFVPOeUWLrxfWMIAlhgXCJK9+/soAkRAQOMUnc+zuNCWKSlcTvgyAd
        nBxsAoYSXW8hbF4BO4kL3S/AmlkEVCXWvrgCtkFUIFmi78sERogaQYmTM5+wgNicAtYSd3b+
        BpvJLGAmMW/zQ2YIW16ieetsKFtc4taT+UwTGAVnIWmfhaRlFpKWWUhaFjCyrGIUSS0tzk3P
        LTbSK07MLS7NS9dLzs/dxAiMuG3Hfm7Zwbjy1Ue9Q4xMHIyHGCU4mJVEeHfKCSUK8aYkVlal
        FuXHF5XmpBYfYjQF+mcis5Rocj4w5vNK4g3NDEwNTcwsDUwtzYyVxHlNjqyJFxJITyxJzU5N
        LUgtgulj4uCUamCK4Wnz7+wPzH3bEWj458GNjTw3omPvl7o2Om9eoH/1/jJtB1fR1a/qdrc+
        ccvqjL5eI/dIz3i6vDBzYch0g+VWezucTBbaBnt6upif+3NzScNPV7Hlpvu8Dvx3K/6yRyLE
        RTr9mVrbgTa/YDGd+kgvpTvTHjPxHpX5WbjnU+6ezH0u37cui7tc4lI9ZYNYQZ2m7rXpO8uC
        H788OF/gpgL3Fu2Qm9Kn6xtu83ls+fRkpQHbkulFK5jtbj9rTjH796zRUey6y2Yj0bKGnPtB
        BosZtulJhW41a2x6tT2P7/LxY7lyz4Tt4xJWWdRt9nq1fp32hWub3nZtOfCnudtbdPe+ZtnT
        WbMe/HYW63V7E63EUpyRaKjFXFScCAB3PfGPQQMAAA==
X-CMS-MailID: 20210810214617eucas1p1e007c68c34792a844b6c72dd11d05887
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210810214617eucas1p1e007c68c34792a844b6c72dd11d05887
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210810214617eucas1p1e007c68c34792a844b6c72dd11d05887
References: <20210726080113.8378-1-robert.foss@linaro.org>
        <CGME20210810214617eucas1p1e007c68c34792a844b6c72dd11d05887@eucas1p1.samsung.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 26.07.2021 10:01, Robert Foss wrote:
> vfe_set_power() is invoced a few times, which causes a lot of
> VFE HW version prints.
>
> Secondly there is no real reason for calling hw_version_read() from
> this location specifically, since it does nothing more than print
> the VFE HW version.
>
> A better location for the hw_version_read() call would be somewhere
> which is only executed once per VFE unit.
>
> Signed-off-by: Robert Foss <robert.foss@linaro.org>

This patch landed recently in linux-next as commit b10b5334528a ("media: 
camss: vfe: Don't read hardware version needlessly"). Sadly it causes a 
following regression on DragonBoard410c 
(arch/arm64/boot/dts/qcom/apq8016-sbc.dts):

Unable to handle kernel NULL pointer dereference at virtual address 
0000000000000000
Mem abort info:
   ESR = 0x96000006
   EC = 0x25: DABT (current EL), IL = 32 bits
   SET = 0, FnV = 0
   EA = 0, S1PTW = 0
   FSC = 0x06: level 2 translation fault
input: pm8941_resin as 
/devices/platform/soc/200f000.spmi/spmi-0/0-00/200f000.spmi:pmic@0:pon@800/200f000.spmi:pmic@0:pon@800:resin/input/input2
Data abort info:
   ISV = 0, ISS = 0x00000006
   CM = 0, WnR = 0
user pgtable: 4k pages, 48-bit VAs, pgdp=0000000087ca0000
[0000000000000000] pgd=0800000084c4c003, p4d=0800000084c4c003, 
pud=08000000859c2003, pmd=0000000000000000
Internal error: Oops: 96000006 [#1] PREEMPT SMP
Modules linked in: msm(+) qcom_pon rtc_pm8xxx qcom_spmi_vadc 
qcom_vadc_common qcom_camss(+) snd_soc_msm8916_analog 
qcom_spmi_temp_alarm venus_core(+) videobuf2_dma_sg v4l2_fwnode 
snd_soc_lpass_apq8016 v4l2_async videobuf2_memops snd_soc_lpass_cpu 
v4l2_mem2mem snd_soc_apq8016_sbc snd_soc_lpass_platform 
snd_soc_msm8916_digital videobuf2_v4l2 snd_soc_qcom_common 
videobuf2_common qnoc_msm8916 qcom_rng videodev i2c_qcom_cci mdt_loader 
mc icc_smd_rpm crct10dif_ce socinfo rmtfs_mem display_connector
adreno 1c00000.gpu: Adding to iommu group 2
CPU: 1 PID: 286 Comm: systemd-udevd Not tainted 5.14.0-rc4+ #3778
Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
pstate: 80000005 (Nzcv daif -PAN -UAO -TCO BTYPE=--)
pc : vfe_hw_version_read+0x4/0x10 [qcom_camss]
platform 1a98000.dsi: Fixing up cyclic dependency with 3-0039
lr : msm_vfe_subdev_init+0x84/0x558 [qcom_camss]
platform 1a98000.dsi: Fixing up cyclic dependency with 1a01000.mdp
sp : ffff8000148337f0
x29: ffff8000148337f0 x28: ffff000006c1d800 x27: 0000000000000001
x26: 0000000000000002 x25: ffff8000091976d0 x24: ffff000006a98080
x23: 0000000000000000 x22: ffff000006c1d800 x21: ffff000000298010
x20: ffff800009197028 x19: ffff000000298000 x18: 0000000000000000
x17: 2e726f74616c7567 x16: 0000000000000028 x15: 0000b5f01da86af8
x14: 0000000000000001 x13: 000000000000001f x12: 0000000000000001
x11: 0000000000000010 x10: 0101010101010101 x9 : ffff8000091922f0
x8 : ffff8000091949f0 x7 : ffff800009194a08 x6 : ffff8000091925c8
x5 : ffff800009191f00 x4 : ffff000006a9ca00 x3 : ffff000006a9c080
x2 : ffff80000918d3a0 x1 : ffff000000298010 x0 : 0000000000000000
msm_mdp 1a01000.mdp: Adding to iommu group 3
Call trace:
  vfe_hw_version_read+0x4/0x10 [qcom_camss]
  camss_probe+0x370/0xdd0 [qcom_camss]
  platform_probe+0x90/0xd8
  really_probe+0x138/0x2d0
  __driver_probe_device+0x78/0xd8
  driver_probe_device+0x40/0x110
  __driver_attach+0xcc/0x118
  bus_for_each_dev+0x68/0xc8
  driver_attach+0x20/0x28
  bus_add_driver+0x168/0x1f8
  driver_register+0x60/0x110
  __platform_driver_register+0x24/0x30
  qcom_camss_driver_init+0x1c/0x1000 [qcom_camss]
  do_one_initcall+0x84/0x450
  do_init_module+0x58/0x200
  load_module+0x1f54/0x26a0
  __do_sys_finit_module+0xe4/0x100
  __arm64_sys_finit_module+0x18/0x20
  invoke_syscall+0x40/0xf8
  el0_svc_common+0x60/0x100
  do_el0_svc_compat+0x1c/0x48
  el0_svc_compat+0x20/0x30
  el0t_32_sync_handler+0xec/0x140
  el0t_32_sync+0x168/0x16c
Code: 88dffc63 88dffc63 00000000 f9400800 (b9400000)
---[ end trace e1e3b303eae40654 ]---

Let me know if I can help somehow to fix this issue.

> ---
>   drivers/media/platform/qcom/camss/camss-vfe.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index e0f3a36f3f3f..f6e889c1598e 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -713,8 +713,6 @@ static int vfe_set_power(struct v4l2_subdev *sd, int on)
>   		ret = vfe_get(vfe);
>   		if (ret < 0)
>   			return ret;
> -
> -		vfe->ops->hw_version_read(vfe, vfe->camss->dev);
>   	} else {
>   		vfe_put(vfe);
>   	}
> @@ -1301,6 +1299,7 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
>   		return -EINVAL;
>   	}
>   	vfe->ops->subdev_init(dev, vfe);
> +	vfe->ops->hw_version_read(vfe, dev);
>   
>   	/* Memory */
>   

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

