Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 687FB3E919D
	for <lists+linux-media@lfdr.de>; Wed, 11 Aug 2021 14:37:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230200AbhHKMhg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Aug 2021 08:37:36 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49398 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230101AbhHKMhe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Aug 2021 08:37:34 -0400
Received: from [IPv6:2a02:810a:880:f54:2882:6431:6b83:8ffa] (unknown [IPv6:2a02:810a:880:f54:2882:6431:6b83:8ffa])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 988841F433DA;
        Wed, 11 Aug 2021 13:37:08 +0100 (BST)
Subject: =?UTF-8?B?UmU6IOetlOWkjTogW1BBVENIIDQvNV0gbWVkaWE6IG10ay12Y29kZWM6?=
 =?UTF-8?Q?_Add_two_error_cases_upon_vpu_irq_handling?=
To:     =?UTF-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>
References: <HK0PR03MB3027E281B94EB6123FBF03FB9DF89@HK0PR03MB3027.apcprd03.prod.outlook.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <09711df2-27dd-301c-0ba1-f077c066ee09@collabora.com>
Date:   Wed, 11 Aug 2021 14:37:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <HK0PR03MB3027E281B94EB6123FBF03FB9DF89@HK0PR03MB3027.apcprd03.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 11.08.21 13:43, Irui Wang (王瑞) wrote:
> Hi Dafna,
> 
> I suspect this issue happened because of power/clk  not working, Could you print some debug logs when call  pm_get_xxx/cll_prepare...

Hi, I noticed that the pm handling might be bugy. In the start_streaming cb , the pm_runtime_resume_and_get is called if both queues stream:
https://elixir.bootlin.com/linux/latest/source/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c#L803

Then in 'stop_streaming' "pm_runtime_put" is called if both queues are not streaming
https://elixir.bootlin.com/linux/latest/source/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c#L893

that means that the 'pm_runtime_put' might be called even if "pm_runtime_resume_and_get" was not called (in case of start+stop only on one queue).
I thought that might be the bug, so I fixed it, but I still get the timeout errors.

> 
> 
> If the timeout issue also occurs with H.264 encoder,  you can confirm the H.264 timeout case, because:
> 1.  H.264 will encode Sequence header before encode Frame:
> https://elixir.bootlin.com/linux/latest/source/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c#L411
> 
> it also will do " h264_enc_wait_venc_done " when encoding sps/pps,  and get timeout,  the error log has a little different with frams:. https://elixir.bootlin.com/linux/latest/source/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c#L371 :" expect irq status ..."
> 
> if encode frame wait IRQ timeout, the error log will be:
> https://elixir.bootlin.com/linux/latest/source/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c#L471 : " irq_status=%d failed "
> 
> 2. you can check the timeout issue timing:
> header encode done, but encode frame get timeout, if so, maybe you need check the thing:
> https://elixir.bootlin.com/linux/latest/source/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c#L297
> memcpy(inst->work_bufs[i].va, tmp_va, wb[i].size)
> 
> you could save the content in the "va",  encoder hardware need load the data to encode frame, same as VP8:
> https://elixir.bootlin.com/linux/latest/source/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c#L198
>   
> if the content is null, maybe something wrong happened about shared memory.

I tested only vp8 till now. What do you mean that the content is null? Do you mean that the shared mem buffer contains only zeros?

Thanks,
Dafna

> 
> Thanks
> Best Regards
> 
> -----邮件原件-----
> 发件人: Dafna Hirschfeld [mailto:dafna.hirschfeld@collabora.com]
> 发送时间: 2021年8月11日 18:14
> 收件人: Irui Wang (王瑞)
> 抄送: Linux Media Mailing List; moderated list:ARM/Mediatek SoC support; Enric Balletbo i Serra
> 主题: Re: 答复: 答复: [PATCH 4/5] media: mtk-vcodec: Add two error cases upon vpu irq handling
> 
> 
> 
> On 09.08.21 11:12, Irui Wang (王瑞) wrote:
>> Hi Dafna,
>>
>>>> 2. Always happened  issue ?  timeout at the beginning or  in processing ?
>>
>>> The commands that I run is:
>>
>>>> sudo --user=#1000
>>>> /usr/local/libexec/chrome-binary-tests/video_encode_accelerator_test
>>>> s --gtest_filter=-*NV12Dmabuf*  -->>codec=vp8
>>>>> /usr/local/share/tast/data/chromiumos/tast/local/bundles/cros/video
>>>> /data/tulip2-320x180.yuv --disable_validator
>>
>>>> The command sometime succeed but when I run it sequentially then at some point after few attempts I start to get those timeout errors.
>>
>> It seems mean VP8 encoding function OK, but failed sometimes, did you have check VENC clock info during encoding:
>>
>> cat /sys/kernel/debug/clk/clk_summary | grep venc:
>>
>> venc_sel   > it's H.264 clock
>> venclt_sel  > it's VP8 clock
>>
>> the enable&prepare count is not 0 during encoding process.
> 
> I see that the values are indeed incremented while streaming.
> When timeout occurs it is always in the beginning of the encoding. So upon the first call to vp8_enc_wait_venc_done.
> 
> Thanks,
> Dafna
> 
> 
>>
>> Thanks
>> Best Regards
>>
>> -----邮件原件-----
>> 发件人: Dafna Hirschfeld [mailto:dafna.hirschfeld@collabora.com]
>> 发送时间: 2021年8月9日 16:27
>> 收件人: Irui Wang (王瑞)
>> 抄送: Linux Media Mailing List; moderated list:ARM/Mediatek SoC support;
>> Enric Balletbo i Serra
>> 主题: Re: 答复: [PATCH 4/5] media: mtk-vcodec: Add two error cases upon
>> vpu irq handling
>>
>>
>>
>> On 09.08.21 09:37, Irui Wang (王瑞) wrote:
>>> Hi Dafna,
>>>
>>>>> I am testing the vp8 encoder on chromeos and at some point the encoder interrupts stop arriving so I try to figure out why and report any possible error.
>>> 1. Log shows wait IRQ timeout ?
>>
>> Hi, yes, I get timeout when waiting to the encoder interrupt. The
>> timeout is on vp8_enc_wait_venc_done
>>
>>
>>> 2. Always happened  issue ?  timeout at the beginning or  in processing ?
>>
>> The commands that I run is:
>>
>> sudo --user=#1000
>> /usr/local/libexec/chrome-binary-tests/video_encode_accelerator_tests
>> --gtest_filter=-*NV12Dmabuf*  --codec=vp8
>> /usr/local/share/tast/data/chromiumos/tast/local/bundles/cros/video/da
>> ta/tulip2-320x180.yuv --disable_validator
>>
>> The command sometime succeed but when I run it sequentially then at some point after few attempts I start to get those timeout errors.
>>
>>> 3. how about IRQ infos?
>>> cat /proc/interrupts | grep vcodec
>>> 18002000.vcodec   >> it's H.264 encoder
>>> 19002000.vcodec  >> it's  VP8 encoder
>>>
>>> I was told you have  met another H.264 encoding failed before, did you find reasons about that ?
>>
>> No,
>> But since I see that the google meetup uses the vp8 encoder I decided to test the vp8 first.
>>
>>>> [   81.918747] [MTK_V4L2][ERROR] mtk_vcodec_wait_for_done_ctx:32: [3] ctx->type=1, cmd=1, wait_event_interruptible_timeout time=1000ms out 0 0!
>>>> [   81.931392] [MTK_VCODEC][ERROR][3]: h264_encode_frame() irq_status=0 failed
>>>> [   81.938470] [MTK_V4L2][ERROR] mtk_venc_worker:1219: venc_if_encode failed=-5
>>
>>
>>>
>>> MT8173 latest VPUD firmware:
>>> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmwa
>>> r
>>> e.git/commit/?id=aaed4a8bf9a77ec68376e8d92fb218d5fdd88b59
>>>
>>
>> I uses the latest firmware.
>>
>> Thanks,
>> Dafna
>>
>>> Thanks
>>> Best Regards
>>>
>>> -----邮件原件-----
>>> 发件人: Dafna Hirschfeld [mailto:dafna.hirschfeld@collabora.com]
>>> 发送时间: 2021年8月6日 15:49
>>> 收件人: Irui Wang (王瑞); linux-kernel@vger.kernel.org;
>>> linux-media@vger.kernel.org; linux-mediatek@lists.infradead.org
>>> 抄送: dafna3@gmail.com; tfiga@chromium.org; Tiffany Lin (林慧珊);
>>> eizan@chromium.org; Maoguang Meng (孟毛广); kernel@collabora.com;
>>> mchehab@kernel.org; hverkuil@xs4all.nl; Yunfei Dong (董云飞); Yong Wu
>>> (吴勇); hsinyi@chromium.org; matthias.bgg@gmail.com; Andrew-CT Chen
>>> (陳智迪); acourbot@chromium.org
>>> 主题: Re: [PATCH 4/5] media: mtk-vcodec: Add two error cases upon vpu
>>> irq handling
>>>
>>>
>>>
>>> On 06.08.21 08:58, Irui Wang (王瑞) wrote:
>>>> On Wed, 2021-08-04 at 16:27 +0200, Dafna Hirschfeld wrote:
>>>>> 1. Fail if the function mtk_vcodec_fw_map_dm_addr returns ERR
>>>>> pointer.
>>>>> 2. Fail if the state from the vpu msg is either
>>>>> VEN_IPI_MSG_ENC_STATE_ERROR or VEN_IPI_MSG_ENC_STATE_PART
>>>>>
>>>>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>>>>> ---
>>>>>     drivers/media/platform/mtk-vcodec/venc_vpu_if.c | 8 ++++++++
>>>>>     1 file changed, 8 insertions(+)
>>>>>
>>>>> diff --git a/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
>>>>> b/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
>>>>> index 32dc844d16f9..234705ba7cd6 100644
>>>>> --- a/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
>>>>> +++ b/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
>>>>> @@ -17,6 +17,8 @@ static int handle_enc_init_msg(struct
>>>>> venc_vpu_inst *vpu, const void *data)
>>>>>     vpu->vsi = mtk_vcodec_fw_map_dm_addr(vpu->ctx->dev->fw_handler,
>>>>>          msg->vpu_inst_addr);
>>>>>     
>>>>> +if (IS_ERR(vpu->vsi))
>>>>> +return PTR_ERR(vpu->vsi);
>>>>>     /* Firmware version field value is unspecified on MT8173. */
>>>>>     if (vpu->ctx->dev->venc_pdata->chip == MTK_MT8173)
>>>>>     return 0;
>>>>> @@ -42,6 +44,12 @@ static int handle_enc_encode_msg(struct
>>>>> venc_vpu_inst *vpu, const void *data)
>>>>>     vpu->state = msg->state;
>>>>>     vpu->bs_size = msg->bs_size;
>>>>>     vpu->is_key_frm = msg->is_key_frm;
>>>>> +if (vpu->state == VEN_IPI_MSG_ENC_STATE_ERROR ||
>>>>> +    vpu->state == VEN_IPI_MSG_ENC_STATE_PART) {
>>>>> +mtk_vcodec_err(vpu, "bad ipi-enc-state: %s",
>>>>> +       vpu->state ==
>>>>> VEN_IPI_MSG_ENC_STATE_ERROR ? "ERR" : "PART");
>>>>> +return -EINVAL;
>>>>> +}
>>>>
>>>> Hi Dafna,
>>>>
>>>> This state check is useless, the enc result will check in
>>>> "vpu_enc_ipi_handler".
>>>>
>>>
>>> Hi, thanks for reviewing. I see that the vpu_enc_ipi_handler only test the msg->status and I see that the states are not tested anywhere except of "skip" state in the h264 enc.
>>>
>>> Can't there be a scenario where msg->status is ok but the state is error?
>>> I am testing the vp8 encoder on chromeos and at some point the encoder interrupts stop arriving so I try to figure out why and report any possible error.
>>>
>>> Thanks,
>>> Dafna
>>>
>>>> Thanks
>>>>
>>>>>     return 0;
>>>>>     }
>>>>>     
>>>
>>> ************* MEDIATEK Confidentiality Notice ********************
>>> The information contained in this e-mail message (including any
>>> attachments) may be confidential, proprietary, privileged, or
>>> otherwise exempt from disclosure under applicable laws. It is
>>> intended to be conveyed only to the designated recipient(s). Any use,
>>> dissemination, distribution, printing, retaining or copying of this
>>> e-mail (including its
>>> attachments) by unintended recipient(s) is strictly prohibited and
>>> may be unlawful. If you are not an intended recipient of this e-mail,
>>> or believe that you have received this e-mail in error, please notify
>>> the sender immediately (by replying to this e-mail), delete any and
>>> all copies of this e-mail (including any attachments) from your
>>> system, and do not disclose the content of this e-mail to any other person. Thank you!
>>>
