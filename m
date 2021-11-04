Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0316F44510B
	for <lists+linux-media@lfdr.de>; Thu,  4 Nov 2021 10:24:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230492AbhKDJ0r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Nov 2021 05:26:47 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:53488 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230252AbhKDJ0q (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Nov 2021 05:26:46 -0400
Received: from [IPv6:2a0d:6fc0:11c8:f600:2430:3a4b:db98:84e5] (unknown [IPv6:2a0d:6fc0:11c8:f600:2430:3a4b:db98:84e5])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 6ADBC1F45EFD;
        Thu,  4 Nov 2021 09:24:03 +0000 (GMT)
Subject: =?UTF-8?B?UmU6IOetlOWkjTog562U5aSNOiBbUEFUQ0ggNC81XSBtZWRpYTogbXRr?=
 =?UTF-8?Q?-vcodec=3a_Add_two_error_cases_upon_vpu_irq_handling?=
To:     Irui Wang <irui.wang@mediatek.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Collabora Kernel ML <kernel@collabora.com>
References: <20210804142729.7231-1-dafna.hirschfeld@collabora.com>
 <20210804142729.7231-5-dafna.hirschfeld@collabora.com>
 <81524c608e9ef640e71d969aa83d1a383e687b0a.camel@mediatek.com>
 <f343f406-111b-326f-3671-094e699a3aa6@collabora.com>
 <HK0PR03MB302713CFF1F1E79AD99737679DF69@HK0PR03MB3027.apcprd03.prod.outlook.com>
 <18e477a2-60c7-3e18-730d-ab0cb5e5821a@collabora.com>
 <HK0PR03MB30274F4B532D52E775687E069DF69@HK0PR03MB3027.apcprd03.prod.outlook.com>
 <a282c849-3542-4881-7a56-b8a2bccdbcbe@collabora.com>
 <0c9a80957eaf5e5b99436fb3b478838538340da8.camel@mediatek.com>
 <2d251d3f-fe9b-9d09-dfd3-e229d335cf88@collabora.com>
 <b626c3655b611391c9aa63d4f2b0e334b17214f1.camel@mediatek.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <45407cdc-a0f6-336f-aa5c-3c85981af36c@collabora.com>
Date:   Thu, 4 Nov 2021 11:23:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <b626c3655b611391c9aa63d4f2b0e334b17214f1.camel@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 04.11.21 11:16, Irui Wang wrote:
> On Thu, 2021-11-04 at 08:50 +0200, Dafna Hirschfeld wrote:
>>
>> On 04.11.21 03:38, Irui Wang wrote:
>>> Hi,
>>>
>>> On Wed, 2021-11-03 at 22:50 +0200, Dafna Hirschfeld wrote:
>>>>
>>>> On 09.08.21 12:12, Irui Wang (王瑞) wrote:
>>>>> Hi Dafna,
>>>>>
>>>>>>> 2. Always happened  issue ?  timeout at the beginning
>>>>>>> or  in
>>>>>>> processing ?
>>>>>>
>>>>>> The commands that I run is:
>>>>>>> sudo --user=#1000 /usr/local/libexec/chrome-binary-
>>>>>>> tests/video_encode_accelerator_tests --gtest_filter=-
>>>>>>> *NV12Dmabuf*  -->>codec=vp8
>>>>>>>> /usr/local/share/tast/data/chromiumos/tast/local/bundles/
>>>>>>>> cros/
>>>>>>>
>>>>>>> video/data/tulip2-320x180.yuv --disable_validator
>>>>>>> The command sometime succeed but when I run it sequentially
>>>>>>> then at some point after few attempts I start to get those
>>>>>>> timeout errors.
>>>>>
>>>>> It seems mean VP8 encoding function OK, but failed sometimes,
>>>>> did
>>>>> you have check VENC clock info during encoding:
>>>>>
>>>>> cat /sys/kernel/debug/clk/clk_summary | grep venc:
>>>>>
>>>>> venc_sel   > it's H.264 clock
>>>>> venclt_sel  > it's VP8 clock
>>>>>
>>>>> the enable&prepare count is not 0 during encoding process.
>>>>>
>>>>> Thanks
>>>>> Best Regards
>>>>>
>>>>> -----邮件原件-----
>>>>> 发件人: Dafna Hirschfeld [mailto:dafna.hirschfeld@collabora.com]
>>>>> 发送时间: 2021年8月9日 16:27
>>>>> 收件人: Irui Wang (王瑞)
>>>>> 抄送: Linux Media Mailing List; moderated list:ARM/Mediatek SoC
>>>>> support; Enric Balletbo i Serra
>>>>> 主题: Re: 答复: [PATCH 4/5] media: mtk-vcodec: Add two error cases
>>>>> upon
>>>>> vpu irq handling
>>>>>
>>>>>
>>>>>
>>>>> On 09.08.21 09:37, Irui Wang (王瑞) wrote:
>>>>>> Hi Dafna,
>>>>>>
>>>>>>>> I am testing the vp8 encoder on chromeos and at some
>>>>>>>> point
>>>>>>>> the encoder interrupts stop arriving so I try to figure
>>>>>>>> out
>>>>>>>> why and report any possible error.
>>>>>>
>>>>>> 1. Log shows wait IRQ timeout ?
>>>>>
>>>>> Hi, yes, I get timeout when waiting to the encoder interrupt.
>>>>> The
>>>>> timeout is on vp8_enc_wait_venc_done
>>>>>
>>>>>
>>>>>> 2. Always happened  issue ?  timeout at the beginning or  in
>>>>>> processing ?
>>>>>
>>>>> The commands that I run is:
>>>>>
>>>>> sudo --user=#1000 /usr/local/libexec/chrome-binary-
>>>>> tests/video_encode_accelerator_tests --gtest_filter=-
>>>>> *NV12Dmabuf*  --codec=vp8
>>>>> /usr/local/share/tast/data/chromiumos/tast/local/bundles/cros/v
>>>>> ideo
>>>>> /data/tulip2-320x180.yuv --disable_validator
>>>>>
>>>>> The command sometime succeed but when I run it sequentially
>>>>> then at
>>>>> some point after few attempts I start to get those timeout
>>>>> errors.
>>>>>
>>>>>> 3. how about IRQ infos?
>>>>>> cat /proc/interrupts | grep vcodec
>>>>>> 18002000.vcodec   >> it's H.264 encoder
>>>>>> 19002000.vcodec  >> it's  VP8 encoder
>>>>>>
>>>>>> I was told you have  met another H.264 encoding failed
>>>>>> before,
>>>>>> did you find reasons about that ?
>>>>>
>>>>> No,
>>>>> But since I see that the google meetup uses the vp8 encoder I
>>>>> decided to test the vp8 first.
>>>>>
>>>>>>> [   81.918747] [MTK_V4L2][ERROR]
>>>>>>> mtk_vcodec_wait_for_done_ctx:32: [3] ctx->type=1, cmd=1,
>>>>>>> wait_event_interruptible_timeout time=1000ms out 0 0!
>>>>>>> [   81.931392] [MTK_VCODEC][ERROR][3]: h264_encode_frame()
>>>>>>> irq_status=0 failed
>>>>>>> [   81.938470] [MTK_V4L2][ERROR] mtk_venc_worker:1219:
>>>>>>> venc_if_encode failed=-5
>>>>
>>>> Hi,
>>>> I test the driver on debian now, I stream several instances of
>>>> vp8
>>>> and h264 in parallel.
>>>> I see that those errors always occur after an iommu page fault:
>>>>
>>>> [gst-master] root@debian:~/gst-build# [ 5743.206014] mtk-iommu
>>>> 10205000.iommu: fault type=0x5 iova=0xac2ff003 pa=0x0 larb=3
>>>> port=0
>>>> layer=1 write
>>>> [ 5744.204964] [MTK_V4L2][ERROR] mtk_vcodec_wait_for_done_ctx:32:
>>>> [2706] ctx->type=1, cmd=1, wait_event_interruptible_timeout
>>>> time=1000ms out 0 0!
>>>> [ 5744.217849] [MTK_VCODEC][ERROR][2706]: vp8_enc_encode_frame()
>>>> irq_status=0 failed
>>>> [ 5744.225359] [MTK_V4L2][ERROR] mtk_venc_worker:1243:
>>>> venc_if_encode
>>>> failed=-5
>>>>
>>>> I suspect that maybe this is because the iova of the
>>>> working_buffers
>>>> is handed to the vpu in the function vp8_enc_alloc_work_buf:
>>>> wb[i].iova = inst->work_bufs[i].dma_addr;
>>>>
>>>> Maybe the vpu keep writing to those addresses after they are
>>>> already
>>>> unmapped?
>>>>
>>>> Thanks,
>>>> Dafna
>>>
>>> failed larb=3, it's for h264 encoder,  vp8 encoder is larb5, is
>>> there
>>> any h264 encoding failed at that time? I have no ideas why these
>>> errors
>>> happened on your platform, but when we got the "iommu: fault", the
>>> possible reason is related to power or clock.
>>
>> Once the iommu fault fires, both encoders constantly fail and never
>> recover
>> (also not when starting new instance).
>>
>> With the falut:
>> mtk_iommu_isr: fault type=0x5 iova=0xebede003 pa=0x0 larb=3 port=0
>> layer=1 write
>>
>> I looked at the iommu tracing log:
>>
>>     gst-launch-1.0-606     [000] .....   714.634398: unmap: IOMMU:
>> iova=0x00000000ebede000 - 0x00000000ebedf000 size=4096
>> unmapped_size=4096
>>     gst-launch-1.0-606     [000] .....   714.634417: unmap: IOMMU:
>> iova=0x00000000ebed0000 - 0x00000000ebed5000 size=20480
>> unmapped_size=20480
>>     gst-launch-1.0-606     [000] .....   714.634435: unmap: IOMMU:
>> iova=0x00000000eb800000 - 0x00000000ebb0a000 size=3186688
>> unmapped_size=3186688
>>     gst-launch-1.0-606     [000] .N...   714.634891: unmap: IOMMU:
>> iova=0x00000000eb700000 - 0x00000000eb7ff000 size=1044480
>> unmapped_size=1044480
>>     gst-launch-1.0-606     [000] .N...   714.635481: unmap: IOMMU:
>> iova=0x00000000eb000000 - 0x00000000eb30a000 size=3186688
>> unmapped_size=3186688
>>     gst-launch-1.0-606     [000] .....   714.635934: unmap: IOMMU:
>> iova=0x00000000eaf00000 - 0x00000000eafff000 size=1044480
>> unmapped_size=1044480
>>     gst-launch-1.0-606     [000] .....   714.636041: unmap: IOMMU:
>> iova=0x00000000eaef0000 - 0x00000000eaf00000 size=65536
>> unmapped_size=65536
>>     gst-launch-1.0-606     [000] .....   714.636056: unmap: IOMMU:
>> iova=0x00000000eaee0000 - 0x00000000eaef0000 size=65536
>> unmapped_size=65536
>>     gst-launch-1.0-606     [000] .....   714.636069: unmap: IOMMU:
>> iova=0x00000000eaedf000 - 0x00000000eaee0000 size=4096
>> unmapped_size=4096
>>        kworker/0:0-537     [000] d.h..   714.636191: io_page_fault:
>> IOMMU:mtk-iommu 10205000.iommu iova=0x00000000ebede003 flags=0x0001
>>
>> (I changed the iommu map/unmap trace events to print the iova range)
>> you can see the first line unmapping 00000000ebede000 which is the
>> faulting iova.
>> So it seems that the problem is due to a device trying to access an
>> address that is already unmapped.
>> This might be either the encoder or the vpu.
>> Since the wb[i].iova is not reset when freeing the working buffers I
>> suspect it might be the vpu device, what do you think?
>>
>> Thanks,
>> Dafna
> 
> vpu device won't access the address, the fault logs:


Looking at the line:
wb[i].iova = wb[i].iova = inst->work_bufs[i].dma_addr;

in both vp8 and h264 it seems that the codec drivers give the vpu access to the allocated iova address.
If the vpu doesn't access those addresses then what is the purpose of this line?


> fault type=0x5 iova=0xebede003 pa=0x0 larb=3 port=0 layer=1 write
> 
> it's h264 encoder error when writing "RCPU" data address to encoder
> hardware through iommu, but why unmap happended at this time? it seems
> encoding process still going on....

Why is it seems so?

> 
>>
>>>
>>>>
>>>>
>>>>>
>>>>>
>>>>>>
>>>>>> MT8173 latest VPUD firmware:
>>>>>>
>>>
>>>
> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmwar
>>>>>> e.git/commit/?id=aaed4a8bf9a77ec68376e8d92fb218d5fdd88b59
>>>>>>
>>>>>
>>>>> I uses the latest firmware.
>>>>>
>>>>> Thanks,
>>>>> Dafna
>>>>>
>>>>>> Thanks
>>>>>> Best Regards
>>>>>>
>>>>>> -----邮件原件-----
>>>>>> 发件人: Dafna Hirschfeld [mailto:dafna.hirschfeld@collabora.com]
>>>>>> 发送时间: 2021年8月6日 15:49
>>>>>> 收件人: Irui Wang (王瑞); linux-kernel@vger.kernel.org;
>>>>>> linux-media@vger.kernel.org;
>>>>>> linux-mediatek@lists.infradead.org
>>>>>> 抄送: dafna3@gmail.com; tfiga@chromium.org; Tiffany Lin (林慧珊);
>>>>>> eizan@chromium.org; Maoguang Meng (孟毛广); kernel@collabora.com
>>>>>> ;
>>>>>> mchehab@kernel.org; hverkuil@xs4all.nl; Yunfei Dong (董云飞);
>>>>>> Yong
>>>>>> Wu
>>>>>> (吴勇); hsinyi@chromium.org; matthias.bgg@gmail.com; Andrew-CT
>>>>>> Chen
>>>>>> (陳智迪); acourbot@chromium.org
>>>>>> 主题: Re: [PATCH 4/5] media: mtk-vcodec: Add two error cases
>>>>>> upon
>>>>>> vpu
>>>>>> irq handling
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 06.08.21 08:58, Irui Wang (王瑞) wrote:
>>>>>>> On Wed, 2021-08-04 at 16:27 +0200, Dafna Hirschfeld wrote:
>>>>>>>> 1. Fail if the function mtk_vcodec_fw_map_dm_addr returns
>>>>>>>> ERR
>>>>>>>> pointer.
>>>>>>>> 2. Fail if the state from the vpu msg is either
>>>>>>>> VEN_IPI_MSG_ENC_STATE_ERROR or VEN_IPI_MSG_ENC_STATE_PART
>>>>>>>>
>>>>>>>> Signed-off-by: Dafna Hirschfeld <
>>>>>>>> dafna.hirschfeld@collabora.com>
>>>>>>>> ---
>>>>>>>>      drivers/media/platform/mtk-vcodec/venc_vpu_if.c | 8
>>>>>>>> ++++++++
>>>>>>>>      1 file changed, 8 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/drivers/media/platform/mtk-
>>>>>>>> vcodec/venc_vpu_if.c
>>>>>>>> b/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
>>>>>>>> index 32dc844d16f9..234705ba7cd6 100644
>>>>>>>> --- a/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
>>>>>>>> +++ b/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
>>>>>>>> @@ -17,6 +17,8 @@ static int handle_enc_init_msg(struct
>>>>>>>> venc_vpu_inst *vpu, const void *data)
>>>>>>>>      vpu->vsi = mtk_vcodec_fw_map_dm_addr(vpu->ctx->dev-
>>>>>>>>> fw_handler,
>>>>>>>>
>>>>>>>>           msg->vpu_inst_addr);
>>>>>>>>      
>>>>>>>> +if (IS_ERR(vpu->vsi))
>>>>>>>> +return PTR_ERR(vpu->vsi);
>>>>>>>>      /* Firmware version field value is unspecified on
>>>>>>>> MT8173.
>>>>>>>> */
>>>>>>>>      if (vpu->ctx->dev->venc_pdata->chip == MTK_MT8173)
>>>>>>>>      return 0;
>>>>>>>> @@ -42,6 +44,12 @@ static int
>>>>>>>> handle_enc_encode_msg(struct
>>>>>>>> venc_vpu_inst *vpu, const void *data)
>>>>>>>>      vpu->state = msg->state;
>>>>>>>>      vpu->bs_size = msg->bs_size;
>>>>>>>>      vpu->is_key_frm = msg->is_key_frm;
>>>>>>>> +if (vpu->state == VEN_IPI_MSG_ENC_STATE_ERROR ||
>>>>>>>> +    vpu->state == VEN_IPI_MSG_ENC_STATE_PART) {
>>>>>>>> mtk_vcodec_err(vpu,
>>>>>>>> +"bad ipi-enc-state: %s",
>>>>>>>> +       vpu->state ==
>>>>>>>> VEN_IPI_MSG_ENC_STATE_ERROR ? "ERR" : "PART");
>>>>>>>> +return -EINVAL;
>>>>>>>> +}
>>>>>>>
>>>>>>> Hi Dafna,
>>>>>>>
>>>>>>> This state check is useless, the enc result will check in
>>>>>>> "vpu_enc_ipi_handler".
>>>>>>>
>>>>>>
>>>>>> Hi, thanks for reviewing. I see that the vpu_enc_ipi_handler
>>>>>> only
>>>>>> test the msg->status and I see that the states are not tested
>>>>>> anywhere except of "skip" state in the h264 enc.
>>>>>>
>>>>>> Can't there be a scenario where msg->status is ok but the
>>>>>> state
>>>>>> is error?
>>>>>> I am testing the vp8 encoder on chromeos and at some point
>>>>>> the
>>>>>> encoder interrupts stop arriving so I try to figure out why
>>>>>> and
>>>>>> report any possible error.
>>>>>>
>>>>>> Thanks,
>>>>>> Dafna
>>>>>>
>>>>>>> Thanks
>>>>>>>
>>>>>>>>      return 0;
>>>>>>>>      }
>>>>>>>>      
>>>>>>
>>>>>> ************* MEDIATEK Confidentiality Notice
>>>>>> ******************** The
>>>>>> information contained in this e-mail message (including any
>>>>>> attachments) may be confidential, proprietary, privileged, or
>>>>>> otherwise exempt from disclosure under applicable laws. It is
>>>>>> intended
>>>>>> to be conveyed only to the designated recipient(s). Any use,
>>>>>> dissemination, distribution, printing, retaining or copying
>>>>>> of
>>>>>> this
>>>>>> e-mail (including its
>>>>>> attachments) by unintended recipient(s) is strictly
>>>>>> prohibited
>>>>>> and may
>>>>>> be unlawful. If you are not an intended recipient of this e-
>>>>>> mail,
>>>>>> or
>>>>>> believe that you have received this e-mail in error, please
>>>>>> notify the
>>>>>> sender immediately (by replying to this e-mail), delete any
>>>>>> and
>>>>>> all
>>>>>> copies of this e-mail (including any attachments) from your
>>>>>> system,
>>>>>> and do not disclose the content of this e-mail to any other
>>>>>> person. Thank you!
>>>>>>
>>>
>>> _______________________________________________
>>> Linux-mediatek mailing list
>>> Linux-mediatek@lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/linux-mediatek
>>>
