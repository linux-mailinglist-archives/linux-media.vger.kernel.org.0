Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBC0B45DDD2
	for <lists+linux-media@lfdr.de>; Thu, 25 Nov 2021 16:45:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356164AbhKYPsm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Nov 2021 10:48:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234528AbhKYPqk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Nov 2021 10:46:40 -0500
Received: from lb1-smtp-cloud9.xs4all.net (lb1-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB1F4C0613FE;
        Thu, 25 Nov 2021 07:35:29 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id qGmPm80Yt1HGJqGmSm3a9t; Thu, 25 Nov 2021 16:35:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1637854525; bh=TXJ7Ctbmiee3cETV+NOpkmOKP2PLfrWx5HhL/ioidbc=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=jerUqfk4CHl2L5NvhjeJ5N6qI6wRUrz0EXCZPk5gUzRPp9Rk3b8JPkqS/fqTjeqRS
         EGuH+7jF/OSHZF0bxiySnpLHNWLLKGsY5kahbFKKI8mHI+S121tNNDD1LJJb5IPFq1
         bo/V4Di3+lRE9xvxrCsF4mCCsyDWll4sESm/CH5QwzMf7BgfaGPkKEJTmUZtPxIjBK
         AE4SEyZShF7mHpL7HBHpk3mPf2UxuINr/aPpCMwu3BD9X1T1RY4xVgC55HbEsWp4in
         2xkP/nCOWm6lPIFVSlZBYuHzgXmOzEnSdqnP6MdvXjFvzq05mabBjtdn0WQEOmtmU+
         E+rarb32CbVyg==
Subject: Re: [RFC 1/5] media: hantro: Add support for i.MX8M Mini
To:     Adam Ford <aford173@gmail.com>,
        linux-media <linux-media@vger.kernel.org>
Cc:     Tim Harvey <tharvey@gateworks.com>,
        Schrempf Frieder <frieder.schrempf@kontron.de>,
        Marek Vasut <marek.vasut@gmail.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Adam Ford-BE <aford@beaconembedded.com>,
        cstevens@beaconembedded.com,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Lucas Stach <l.stach@pengutronix.de>,
        Joakim Zhang <qiangqing.zhang@nxp.com>,
        Alice Guo <alice.guo@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        "open list:HANTRO VPU CODEC DRIVER" 
        <linux-rockchip@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
References: <20211106183802.893285-1-aford173@gmail.com>
 <20211106183802.893285-2-aford173@gmail.com>
 <CAHCN7x+G6K3BTEGwuYMRO_+SFHjrvAU2FWfXGawXchX8NmovWA@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <f4e143fc-181a-a49a-377f-baec19ac048f@xs4all.nl>
Date:   Thu, 25 Nov 2021 16:35:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAHCN7x+G6K3BTEGwuYMRO_+SFHjrvAU2FWfXGawXchX8NmovWA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfOg0R8IxyT7lY2IJYmlCgRHGaHVChQvNTvfXXRZqUWUtQlCoadjxwN7BEYoGrUw7xZHhcisR0pZB+awL6fX4ha5IqwGduZYLEncY836mKk9TuGZesP7M
 n+WFtaf23qExKwrsvAEEzm0RIc8kVWky//Yn3fQNgI7HphKeTBLm6aCOTzuWi/x2AAq7xl3A+XWMis/vNytsKnNzUqPP6IA1KidsLVJb8hJZjOuYpHE2MtsB
 pj3XrS7ituIgg15UZnovz+NZMMOj3M9rJj3q4RZt/Hj+3uTbd4zbQw+aqLeLvEO3tPMauK/QCYsmaZC3hT4ygKoAqleX9KsPC2MoW4HhxSZqFSLueBld93vi
 whSv4qFgq3XP4LW3lcqxMi3n8fzTgaBdNzl1Pwt4yB/oErUpc/SFHh7vOwazbgwUSm4v6fjM6X4vi65woPARbFBs4jK/mVNcv8GBHycKoWKq61qTBCYnsyTQ
 B/zzAJV4DNFVFniOO12VQjjbbcMthgXMLynb4g4wBhslIyctxGAM799OrK/O40eciNvpZr1xBj6JP9xkQF8HoHedJ/VRCAz3wrw/QC23V+iVi7WcOpfRFJd0
 MtkDxUQdNGsrbfNO0ypnvvCjPTMYwIVe4OmOHv2DJGJHLd6EsEQryhcsNic2lQd4sE9eCpAec0dDujMBA3D8SE/Ncpq6LOtAUKT5ZnZKXR3M1xyoodXzKaGK
 FoaIHT2rB/Gu5cHXNc9sPYGxkhxGQyRvOCbX+pfZvGECDlU9Er86dK4aeZaBB/rUkM64DTFnbjbqhQJjwwsqiEY+LyCEGl1BLL7zZ1h92sAoQ7SNdCtAlDQw
 2j8YfdlcroJNFLd76NT9Kue3mj1595m8rg2WPoNcGzjyxlG6rsFZyrqc8r9wXZ8rloZPlHF0tL+R7X8aMgDqHFbn2P+bjdvnX91qdbSZxloMycbUYGMZigFk
 +MSWCRJ2HI7Fic7btkncIEBn2//jeY0izZ4pJc66sC6HeuiO4EOLHpArWlU6L3pV6wsN9sIPz+V4Os5HVyG5G2G3hm3CEB4XQg6BmmaK7JrIye/K7ixFPHSZ
 hnNQH6ey9EWDm9/DRb8wv0+tabWa7s97ZZuX433Vmk++eiG3rM10GMqPaaSsD/IhLP/4FaX8nl2WZBDwBvMS+eYyB3TrrWez/bQSL9zIWxIkTsJECdBVaklG
 qqn0sASywkevygXS8pwziw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 20/11/2021 17:03, Adam Ford wrote:
> On Sat, Nov 6, 2021 at 1:38 PM Adam Ford <aford173@gmail.com> wrote:
>>
>> The i.MX8M Mini has a similar implementation of the Hantro G1 and
>> G2 decoders, but the Mini uses the vpu-blk-ctrl for handling the
>> VPU resets through the power domain system.  As such, there are
>> functions present in the 8MQ that are not applicable to the Mini
>> which requires the driver to have a different compatible flags.
>>
> + Nicolas Dufresne
> 
> From what I can tell, the implementation between 8MQ and 8MM for the
> G2 is basically the same with the only be difference being the
> power-domain controller handling the vpu-blk-ctrl stuff in the Mini.
> It doesn't hang, so I don't think the power-domain is a problem, but
> the G2 throws some splat when v4l2-compliance is invoked.
> 
> # v4l2-compliance -d1
> v4l2-compliance SHA: not available

That indicates that you did not compile v4l2-compliance from the git repo.

Please do that, that way I know you are using the latest compliance test.

git clone git://linuxtv.org/v4l-utils.git
cd v4l-utils
./bootstrap.sh
./configure
make
sudo make install



> , 64 bits, 64-bit time_t
> 
> Compliance test for hantro-vpu device /dev/video1:
> 
> Driver Info:
> Driver name      : hantro-vpu
> Card type        : nxp,imx8mm-vpu-g2-dec
> Bus info         : platform: hantro-vpu
> 
> Driver v[   30.136983] ------------[ cut here ]------------
> [   30.142038] WARNING: CPU: 3 PID: 534 at mm/page_alloc.c:5344
> __alloc_pages+0x5b4/0xbe0

Hmm:

        if (unlikely(order >= MAX_ORDER)) {
                WARN_ON_ONCE(!(gfp & __GFP_NOWARN));
                return NULL;
        }

video needs loads of memory, so if MAX_ORDER is too low it might hit this.

It's tied to kernel config option FORCE_MAX_ZONEORDER.

The hantro driver uses vb2_dma_contig_memops, so the memory has to be physically
contiguous. That does indeed typically require larger MAX_ORDER values.

Regards,

	Hans


> [   30.149971] Modules linked in: 8021q garp mrp stp llc af_alg
> caam_jr caamhash_desc caamalg_desc crypto_engine rng_core authenc
> libdes crct10dif_ce snd_soc_fsl_asoc_card snd_soc_imx_audmux
> snd_soc_simple_card_utils fsl_imx8_ddr_perf imx8m_ddrc hantro_vpu(C)
> v4l2_h264 brcmfmac v4l2_mem2mem videobuf2_vmalloc brcmutil
> videobuf2_dma_contig cfg80211 videobuf2_memops videobuf2_v4l2
> videobuf2_common snd_soc_wm8962 videodev hci_uart mc etnaviv gpu_sched
> btqca btbcm caam rtc_pcf85363 clk_bd718x7 at24 spi_imx spi_bitbang
> rtc_snvs error snvs_pwrkey snd_soc_fsl_sai imx_pcm_dma imx8mm_thermal
> imx_cpufreq_dt bluetooth ecdh_generic ecc rfkill fuse drm ipv6
> [   30.206845] CPU: 3 PID: 534 Comm: v4l2-compliance Tainted: G
>  C        5.16.0-rc1-00292-gb166e5dc4755-dirty #19
> [   30.217544] Hardware name: Beacon EmbeddedWorks i.MX8M Mini
> Development Kit (DT)
> [   30.224940] pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [   30.231904] pc : __alloc_pages+0x5b4/0xbe0
> [   30.236007] lr : __dma_direct_alloc_pages+0x17c/0x1e0
> [   30.241065] sp : ffff80001265b810
> [   30.244379] x29: ffff80001265b810 x28: 0000000000000034 x27: ffff00000b9ec220
> [   30.251523] x26: ffff00000038d810 x25: 0000000000000000 x24: ffff00000038d810
> [   30.258668] x23: ffff80001010c52c x22: ffff00000038d810 x21: 00000000ffffffff
> [   30.265813] x20: 0000000000000cc1 x19: 0000000000000000 x18: 0000000000000000
> [   30.272960] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
> [   30.280101] x14: 0000000000000001 x13: 0000000000000000 x12: 0000000000000000
> ersion   : 5.16.0
> Capabilities [   30.287247] x11: ffff80001231d000 x10:
> ffff00000b9ec33a x9 : ffff00000b9ec32a
> [   30.297242] x8 : 0000000000000000 x7 : 0000000000000000 x6 : 0000000000000cc0
> [   30.304385] x5 : 00000000bfffffff x4 : ffff00000a72f000 x3 : 0000000000000000
> [   30.311529] x2 : 0000000000000000 x1 : 0000000000000001 x0 : 0000000000000cc1
> [   30.318676] Call trace:
> [   30.321124]  __alloc_pages+0x5b4/0xbe0
> [   30.324880]  __dma_direct_alloc_pages+0x17c/0x1e0
> [   30.329588]  dma_direct_alloc+0x70/0x310
> [   30.333514]  dma_alloc_attrs+0x7c/0xe4
> [   30.337266]  hantro_hevc_get_ref_buf+0x15c/0x184 [hantro_vpu]
> [   30.343038]  hantro_g2_hevc_dec_run+0x3b8/0x1910 [hantro_vpu]
> [   30.348805]  device_run+0xac/0x110 [hantro_vpu]
> [   30.353354]  v4l2_m2m_try_run+0x84/0x134 [v4l2_mem2mem]
> [   30.358603]  v4l2_m2m_ioctl_streamon+0x84/0xa0 [v4l2_mem2mem]
> [   30.364368]  v4l_streamon+0x28/0x34 [videodev]
> [   30.368874]  __video_do_ioctl+0x178/0x3dc [videodev]
> [   30.373889]  video_usercopy+0x368/0x6dc [videodev]
> [   30.378734]  video_ioctl2+0x1c/0x30 [videodev]
> [   30.383230]  v4l2_ioctl+0x44/0x64 [videodev]
> [   30.387554]  __arm64_sys_ioctl+0xac/0xf0
> [   30.391482]  invoke_syscall+0x48/0x114
> [   30.395238]  el0_svc_common.constprop.0+0xd4/0xfc
> [   30.399947]  do_el0_svc+0x2c/0x94
> [   30.403264]  el0_svc+0x28/0x80
> [   30.406327]  el0t_64_sync_handler+0xa8/0x130
> [   30.410603]  el0t_64_sync+0x1a0/0x1a4
> [   30.414272] ---[ end trace 878112336a378214 ]---
> 
> I was hoping someone might have some suggestions on something to try..
> 
> thanks,
> 
> adam
>> Signed-off-by: Adam Ford <aford173@gmail.com>
>> ---
>>  drivers/staging/media/hantro/hantro_drv.c   |  2 +
>>  drivers/staging/media/hantro/hantro_hw.h    |  2 +
>>  drivers/staging/media/hantro/imx8m_vpu_hw.c | 60 +++++++++++++++++++++
>>  3 files changed, 64 insertions(+)
>>
>> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
>> index fb82b9297a2b..2aa1c520be50 100644
>> --- a/drivers/staging/media/hantro/hantro_drv.c
>> +++ b/drivers/staging/media/hantro/hantro_drv.c
>> @@ -592,6 +592,8 @@ static const struct of_device_id of_hantro_match[] = {
>>         { .compatible = "rockchip,rk3399-vpu", .data = &rk3399_vpu_variant, },
>>  #endif
>>  #ifdef CONFIG_VIDEO_HANTRO_IMX8M
>> +       { .compatible = "nxp,imx8mm-vpu", .data = &imx8mm_vpu_variant, },
>> +       { .compatible = "nxp,imx8mm-vpu-g2", .data = &imx8mm_vpu_g2_variant },
>>         { .compatible = "nxp,imx8mq-vpu", .data = &imx8mq_vpu_variant, },
>>         { .compatible = "nxp,imx8mq-vpu-g2", .data = &imx8mq_vpu_g2_variant },
>>  #endif
>> diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
>> index 267a6d33a47b..ae7c3fff760c 100644
>> --- a/drivers/staging/media/hantro/hantro_hw.h
>> +++ b/drivers/staging/media/hantro/hantro_hw.h
>> @@ -211,6 +211,8 @@ enum hantro_enc_fmt {
>>         ROCKCHIP_VPU_ENC_FMT_UYVY422 = 3,
>>  };
>>
>> +extern const struct hantro_variant imx8mm_vpu_g2_variant;
>> +extern const struct hantro_variant imx8mm_vpu_variant;
>>  extern const struct hantro_variant imx8mq_vpu_g2_variant;
>>  extern const struct hantro_variant imx8mq_vpu_variant;
>>  extern const struct hantro_variant px30_vpu_variant;
>> diff --git a/drivers/staging/media/hantro/imx8m_vpu_hw.c b/drivers/staging/media/hantro/imx8m_vpu_hw.c
>> index ea919bfb9891..c819609d14d1 100644
>> --- a/drivers/staging/media/hantro/imx8m_vpu_hw.c
>> +++ b/drivers/staging/media/hantro/imx8m_vpu_hw.c
>> @@ -242,6 +242,32 @@ static const struct hantro_codec_ops imx8mq_vpu_g2_codec_ops[] = {
>>         },
>>  };
>>
>> +static const struct hantro_codec_ops imx8mm_vpu_codec_ops[] = {
>> +       [HANTRO_MODE_MPEG2_DEC] = {
>> +               .run = hantro_g1_mpeg2_dec_run,
>> +               .init = hantro_mpeg2_dec_init,
>> +               .exit = hantro_mpeg2_dec_exit,
>> +       },
>> +       [HANTRO_MODE_VP8_DEC] = {
>> +               .run = hantro_g1_vp8_dec_run,
>> +               .init = hantro_vp8_dec_init,
>> +               .exit = hantro_vp8_dec_exit,
>> +       },
>> +       [HANTRO_MODE_H264_DEC] = {
>> +               .run = hantro_g1_h264_dec_run,
>> +               .init = hantro_h264_dec_init,
>> +               .exit = hantro_h264_dec_exit,
>> +       },
>> +};
>> +
>> +static const struct hantro_codec_ops imx8mm_vpu_g2_codec_ops[] = {
>> +       [HANTRO_MODE_HEVC_DEC] = {
>> +               .run = hantro_g2_hevc_dec_run,
>> +               .init = hantro_hevc_dec_init,
>> +               .exit = hantro_hevc_dec_exit,
>> +       },
>> +};
>> +
>>  /*
>>   * VPU variants.
>>   */
>> @@ -257,6 +283,11 @@ static const struct hantro_irq imx8mq_g2_irqs[] = {
>>  static const char * const imx8mq_clk_names[] = { "g1", "g2", "bus" };
>>  static const char * const imx8mq_reg_names[] = { "g1", "g2", "ctrl" };
>>
>> +static const char * const imx8mm_g1_clk_names[] = { "g1", "bus" };
>> +static const char * const imx8mm_g1_reg_names[] = { "g1" };
>> +static const char * const imx8mm_g2_clk_names[] = { "g2", "bus" };
>> +static const char * const imx8mm_g2_reg_names[] = { "g2" };
>> +
>>  const struct hantro_variant imx8mq_vpu_variant = {
>>         .dec_fmts = imx8m_vpu_dec_fmts,
>>         .num_dec_fmts = ARRAY_SIZE(imx8m_vpu_dec_fmts),
>> @@ -289,3 +320,32 @@ const struct hantro_variant imx8mq_vpu_g2_variant = {
>>         .clk_names = imx8mq_clk_names,
>>         .num_clocks = ARRAY_SIZE(imx8mq_clk_names),
>>  };
>> +
>> +const struct hantro_variant imx8mm_vpu_variant = {
>> +       .dec_fmts = imx8m_vpu_dec_fmts,
>> +       .num_dec_fmts = ARRAY_SIZE(imx8m_vpu_dec_fmts),
>> +       .postproc_fmts = imx8m_vpu_postproc_fmts,
>> +       .num_postproc_fmts = ARRAY_SIZE(imx8m_vpu_postproc_fmts),
>> +       .postproc_regs = &hantro_g1_postproc_regs,
>> +       .codec = HANTRO_MPEG2_DECODER | HANTRO_VP8_DECODER |
>> +                HANTRO_H264_DECODER,
>> +       .codec_ops = imx8mm_vpu_codec_ops,
>> +       .irqs = imx8mq_irqs,
>> +       .num_irqs = ARRAY_SIZE(imx8mq_irqs),
>> +       .clk_names = imx8mm_g1_clk_names,
>> +       .num_clocks = ARRAY_SIZE(imx8mm_g1_clk_names),
>> +       .reg_names = imx8mm_g1_reg_names,
>> +       .num_regs = ARRAY_SIZE(imx8mm_g1_reg_names)
>> +};
>> +
>> +const struct hantro_variant imx8mm_vpu_g2_variant = {
>> +       .dec_offset = 0x0,
>> +       .dec_fmts = imx8m_vpu_g2_dec_fmts,
>> +       .num_dec_fmts = ARRAY_SIZE(imx8m_vpu_g2_dec_fmts),
>> +       .codec = HANTRO_HEVC_DECODER,
>> +       .codec_ops = imx8mm_vpu_g2_codec_ops,
>> +       .irqs = imx8mq_g2_irqs,
>> +       .num_irqs = ARRAY_SIZE(imx8mq_g2_irqs),
>> +       .clk_names = imx8mm_g2_clk_names,
>> +       .num_clocks = ARRAY_SIZE(imx8mm_g2_reg_names),
>> +};
>> --
>> 2.32.0
>>

