Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22C2A3E267B
	for <lists+linux-media@lfdr.de>; Fri,  6 Aug 2021 10:54:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243487AbhHFIyV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Aug 2021 04:54:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230119AbhHFIyV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Aug 2021 04:54:21 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD95DC061798
        for <linux-media@vger.kernel.org>; Fri,  6 Aug 2021 01:54:05 -0700 (PDT)
Received: from [IPv6:2a02:810a:880:f54:ec56:4a95:44cf:a8a] (unknown [IPv6:2a02:810a:880:f54:ec56:4a95:44cf:a8a])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 4C95B1F4443E;
        Fri,  6 Aug 2021 09:54:03 +0100 (BST)
Subject: Re: [EXT] Re: media: platform/rockchip/rkisp1 - v4l-compliance
 reports errors
To:     Jens Korinth <jens.korinth@trinamix.de>
Cc:     Collabora Kernel ML <kernel@collabora.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <AM0PR04MB5825DA3C650C569F69B99EF898EB9@AM0PR04MB5825.eurprd04.prod.outlook.com>
 <CAAEAJfDjGBBO4gL3gnn7qsmMHb+2MT2LNJ_Ctt7EqRoycj934A@mail.gmail.com>
 <3a1c6ef4-603c-5d23-c999-6cdef90ffd62@collabora.com>
 <AM0PR04MB58250C5C17446561D4A18EDA98EC9@AM0PR04MB5825.eurprd04.prod.outlook.com>
 <1e53b06a-bc75-87e3-04b4-b808dc0eb3de@collabora.com>
 <AM0PR04MB582556DE304687EA2CCA558198F39@AM0PR04MB5825.eurprd04.prod.outlook.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <d9e3c9b4-4e2f-05fd-6995-85d0418f5178@collabora.com>
Date:   Fri, 6 Aug 2021 10:54:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <AM0PR04MB582556DE304687EA2CCA558198F39@AM0PR04MB5825.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 06.08.21 10:07, Jens Korinth wrote:
> Hi Dafna!
> 
>> I think it is possible to just add Y10 format to the list of supported formats in rkisp1-isp1.c with identical data as SRGGB10_1x10:
> 
> I tested the patch, and it seems to work on the rkisp1_isp side, so I tried to add Y10 to the mainpath capture node:
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> index 5f6c9d1623e4..4c3079ace9eb 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> @@ -176,6 +176,10 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_mp_fmts[] = {
>                  .fourcc = V4L2_PIX_FMT_SRGGB10,
>                  .write_format = RKISP1_MI_CTRL_MP_WRITE_RAW12,
>                  .mbus = MEDIA_BUS_FMT_SRGGB10_1X10,
> +       }, {
> +               .fourcc = V4L2_PIX_FMT_Y10,
> +               .write_format = RKISP1_MI_CTRL_MP_WRITE_RAW12,
> +               .mbus = MEDIA_BUS_FMT_Y10_1X10,
>          }, {
>                  .fourcc = V4L2_PIX_FMT_SGRBG10,
>                  .write_format = RKISP1_MI_CTRL_MP_WRITE_RAW12,
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> index 2e5b57e3aedc..8e9c2abfe0d2 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> @@ -66,6 +66,13 @@ static const struct rkisp1_isp_mbus_info rkisp1_isp_formats[] = {
>                  .bayer_pat      = RKISP1_RAW_RGGB,
>                  .bus_width      = 10,
>                  .direction      = RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
> +       }, {
> +               .mbus_code      = MEDIA_BUS_FMT_Y10_1X10,
> +               .pixel_enc      = V4L2_PIXEL_ENC_BAYER,
> +               .mipi_dt        = RKISP1_CIF_CSI2_DT_RAW10,
> +               .bayer_pat      = RKISP1_RAW_RGGB,
> +               .bus_width      = 10,
> +               .direction      = RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
>          }, {
>                  .mbus_code      = MEDIA_BUS_FMT_SBGGR10_1X10,
>                  .pixel_enc      = V4L2_PIXEL_ENC_BAYER,
> 
> But when I tried to set the format via `v4l2-ctl -v width=1280,height=720,pixelformat="Y10 "` I get a kernel oops:
> 
> [  201.868529] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000005
> [  201.869382] Mem abort info:
> [  201.869654]   ESR = 0x96000004
> [  201.869952]   EC = 0x25: DABT (current EL), IL = 32 bits
> [  201.870585]   SET = 0, FnV = 0
> [  201.870895]   EA = 0, S1PTW = 0
> [  201.871202] Data abort info:
> [  201.871682]   ISV = 0, ISS = 0x00000004
> [  201.872057]   CM = 0, WnR = 0
> [  201.872347] user pgtable: 4k pages, 48-bit VAs, pgdp=00000000058c8000
> [  201.872951] [0000000000000005] pgd=0000000000000000, p4d=0000000000000000
> [  201.873605] Internal error: Oops: 96000004 [#1] PREEMPT SMP
> [  201.874135] Modules linked in: trinamix_ov9282(E) rockchip_isp1(E) rfkill governor_performance snd_soc_hdmi_codec videobuf2_dma_contig videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 videobuf2_common snd_soc_simple_card dw_hdmi_i2s_audio panfrost dw_hdmi_cec snd_soc_rockchip_i2s snd_soc_simple_card_utils gpu_sched snd_soc_rockchip_pcm snd_soc_core snd_pcm_dmaengine snd_pcm snd_timer snd soundcore fusb302 tcpm typec cpufreq_dt zram sch_fq_codel v4l2_fwnode videodev mc sunrpc ip_tables x_tables autofs4 realtek phy_rockchip_dphy_rx0 rockchipdrm analogix_dp dw_hdmi dw_mipi_dsi mp8859 drm_kms_helper cec rc_core dwmac_rk stmmac_platform drm stmmac pcs_xpcs drm_panel_orientation_quirks pwm_bl adc_keys [last unloaded: rockchip_isp1]
> [  201.880487] CPU: 0 PID: 1998 Comm: v4l2-ctl Tainted: G            E     5.12.12-rockchip64 #trunk
> [  201.881316] Hardware name: trinamiX Kiwi (DT)
> [  201.881729] pstate: 60000005 (nZCv daif -PAN -UAO -TCO BTYPE=--)
> [  201.882298] pc : rkisp1_try_fmt.isra.0+0x124/0x260 [rockchip_isp1]
> [  201.882928] lr : rkisp1_try_fmt.isra.0+0x124/0x260 [rockchip_isp1]
> [  201.883543] sp : ffff8000127cbb20
> [  201.883862] x29: ffff8000127cbb20 x28: 0000000000000000
> 
> Message from syslogd@trinamix-kiwi at Aug  6 07:42:02 ...
>   kernel:[  201.873605] Internal error: Oops: 96000004 [#1] PREEMPT SMP
> [  201.884380] x27: ffff000001088700 x26: ffff000004c1c000
> [  201.884897] x25: 0000000000000000 x24: ffff000004f395e0
> [  201.885413] x23: ffff000004f395e8 x22: ffff000010495700
> [  201.885931] x21: ffff8000092c87bc x20: ffff0000054e0d1c
> [  201.886449] x19: ffff0000054e0d08 x18: 0000000000000000
> [  201.886965] x17: 0000000000000000 x16: 0000000000000000
> [  201.887481] x15: 0000000000000000 x14: 0000000000000000
> [  201.887996] x13: 0000000100000000 x12: 0000000000000000
> [  201.888512] x11: 0000000000000000 x10: 0000000000000000
> [  201.889027] x9 : 0000000000000000 x8 : 0000000000000000
> [  201.889543] x7 : 0000000000000000 x6 : 0000000000000010
> [  201.890059] x5 : 0000000000000001 x4 : ffff800009182a50
> [  201.890575] x3 : 0000000032314752 x2 : ffff800009183050
> [  201.891092] x1 : 0000000000000040 x0 : 0000000000000000
> [  201.891609] Call trace:
> [  201.891851]  rkisp1_try_fmt.isra.0+0x124/0x260 [rockchip_isp1]
> [  201.892439]  rkisp1_set_fmt+0x30/0x70 [rockchip_isp1]
> [  201.892955]  rkisp1_s_fmt_vid_cap_mplane+0x2c/0x48 [rockchip_isp1]
> [  201.893571]  v4l_s_fmt+0x478/0x548 [videodev]
> [  201.894190]  __video_do_ioctl+0x184/0x3d8 [videodev]
> [  201.894844]  video_usercopy+0x160/0x6e0 [videodev]
> [  201.895486]  video_ioctl2+0x18/0x30 [videodev]
> 
> Message from syslogd@trinamix-kiwi at Aug  6 07:42:02 ...
>   kernel:[  201.898923] Code: a9087e9f a9097e9f b9400a60 97faea1a (39401402)
> [  201.896100]  v4l2_ioctl+0x40/0x60 [videodev]
> [  201.896692]  __arm64_sys_ioctl+0xa8/0xe8
> [  201.897085]  el0_svc_common.constprop.2+0x8c/0x128
> [  201.897556]  do_el0_svc+0x24/0x90
> [  201.897892]  el0_svc+0x24/0x38
> [  201.898202]  el0_sync_handler+0x90/0xb8
> [  201.898580]  el0_sync+0x160/0x180
> [  201.898923] Code: a9087e9f a9097e9f b9400a60 97faea1a (39401402)
> [  201.899497] ---[ end trace 4eecb08abf2063c0 ]---
> 
> Thanks a lot for your help!
> -Jens
> 

Hi, this is because the code calls v4l2_format_info to get information about the format.
The problem is that the function v4l2_format_info in v4l2-common.c does not have an entry for that Y10 format
so it returns null. You can add an entry for it in that function by:

{ .format = V4L2_PIX_FMT_Y10,       .pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },

Thanks,
Dafna

> ________________________________________
> From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> Sent: Monday, August 2, 2021 11:48 AM
> To: Jens Korinth
> Cc: Collabora Kernel ML; Linux Media Mailing List
> Subject: Re: [EXT] Re: media: platform/rockchip/rkisp1 - v4l-compliance reports errors
> 
> 
> 
> On 30.07.21 17:33, Jens Korinth wrote:
>> Hi Dafna,
>>
>> Thanks for your quick answer!
>>
>>> Therefore you should clone the repo and compile those tools in order to use them for the driver:
>>
>> Thought I did that, but it turns out I didn't pay attention to the PATH order and the system version was used, thanks!
>>
>> The camera I need to support is the OV9282, which is Y10 monochrome sensor. I've had some success passing it through the ISP as SRGGB10_1x10, but it does not feel like the right way(tm). 😊 I need the raw data with as little processing as possible (though 16b extension would be nice) - any advice?
> 
> Hi,
> Currently the driver does not support Y10 format. But I think that configuring the isp subdevice with SRGGB10_1x10 should work.
> I think it is possible to just add Y10 format to the list of supported formats in rkisp1-isp1.c with identical data as SRGGB10_1x10:
> 
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> index d596bc040005..051f8d45e3cc 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> @@ -59,6 +59,13 @@ static const struct rkisp1_isp_mbus_info rkisp1_isp_formats[] = {
>                   .mbus_code      = MEDIA_BUS_FMT_YUYV8_2X8,
>                   .pixel_enc      = V4L2_PIXEL_ENC_YUV,
>                   .direction      = RKISP1_ISP_SD_SRC,
> +       }, {
> +               .mbus_code      = MEDIA_BUS_FMT_Y10_1X10,
> +               .pixel_enc      = V4L2_PIXEL_ENC_BAYER,
> +               .mipi_dt        = RKISP1_CIF_CSI2_DT_RAW10,
> +               .bayer_pat      = RKISP1_RAW_RGGB,
> +               .bus_width      = 10,
> +               .direction      = RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
>           }, {
>                   .mbus_code      = MEDIA_BUS_FMT_SRGGB10_1X10,
>                   .pixel_enc      = V4L2_PIXEL_ENC_BAYER,
> 
> 
> But I don't have a monochrome camera to test it.
> 
> Thanks,
> Dafna
> 
>>
>> Thanks a lot!
>> Jens
>>
>> -----Original Message-----
>> From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>> Sent: Friday, July 30, 2021 12:21 PM
>> To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>; Jens Korinth <jens.korinth@trinamix.de>
>> Cc: linux-media@vger.kernel.org; Helen Koike <helen.koike@collabora.com>
>> Subject: [EXT] Re: media: platform/rockchip/rkisp1 - v4l-compliance reports errors
>>
>> Hi,
>>
>>
>> On 30.07.21 00:38, Ezequiel Garcia wrote:
>>> (Adding Dafna and Helen)
>>>
>>> On Thu, 29 Jul 2021 at 09:36, Jens Korinth <jens.korinth@trinamix.de> wrote:
>>>>
>>>> Hi *,
>>>>
>>>> I am working on a camera system on Rockchip RK3399 board (Firefly ROC-RK3399-PC-Plus). Tried to use the rkisp1 driver, but was unable to connect to the rkisp1_mainpath output node, because format negotiation failed; so I ran v4l-compliance next and found that it reports several errors (see attached report).
>>
>> Hi, thanks for testing and reporting. We added some new features in order to supported the driver that also needed new code in v4l-utils in order to use v4l2-ctl and to pass compliance. Therefore you should clone the repo and compile those tools in order to use them for the driver:
>>
>> git://linuxtv.org/v4l-utils.git
>>
>>
>>>>
>>>> Upon closer inspection I noticed in the VIDIOC_ENUM_FMT handler in
>>>> drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c:1169+ that
>>
>> The file rkisp1-dev.c does only the probe/remove function. The callbacks are implemented in other files.
>>
>>>>
>>>> 1) the "reserved" member is not zeroed,
>>>> 2) the userspace pointer to the v4l2_fmtdesc f is not checked via
>>>> access_ok, and
>>>> 3) it isn't copied from/to userspace using copy_from_user/copy_to_user.
>>
>> Those things seems to me like something that should be in the v4l2-core.
>>
>> Thanks,
>> Dafna
>>
>>>>
>>>> I'm not sure if this is necessary in general, but at least on my platform the zeroing of the reserved member only worked correctly when I added the userspace copies. But even after these fixes, v4l-compliance reports further issues in format enumeration and negotiation. Is this a known issue?
>>>>
>>>> Thanks!
>>>> -Jens
