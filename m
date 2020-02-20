Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75EE0165A32
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2020 10:29:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727025AbgBTJ3I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Feb 2020 04:29:08 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:42489 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726637AbgBTJ3I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Feb 2020 04:29:08 -0500
Received: from [IPv6:2001:420:44c1:2577:1c10:d9c8:263c:14df]
 ([IPv6:2001:420:44c1:2577:1c10:d9c8:263c:14df])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 4i8kjA0BWyIme4i8njitt1; Thu, 20 Feb 2020 10:29:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1582190946; bh=Qo6Jh/zpoxM7+tR2Ygxuq+giN9gvq12UfP8nl0zpj7U=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Ccstph9SYK7bKl0+qXR9LqJB3rB7iIcX8ER53EAZi4RKBjtJ1NGi7mlt70pMfpTm3
         gwLq/OcFYWhI334UKMBuK2eT3EffIeva+kUqqfOj2Rlx+URHFC88wqAkmbapQ7fI0u
         +gfnEZWvRa+0o6jJSZEfyLMwIaO666TOmZrbFRPF7CgbUR5Aqzi3YOKv8Y/Pv+nn5m
         Pr/Z//CEbMwHw+18mw9yAD4HKCSqosXEpwd0Fqg0aZUcw4eFeCm2yh+atXh24GsagJ
         3yzdCVcJxCVbZP4IAubBjyxLpti6PEYBmQCIM0Eih33yf6aWsmTeAQ1JUfjExZkuOz
         xHWtqBXSj13Vw==
Subject: Re: [RFC PATCH v3 4/6] media: tegra: Add Tegra210 Video input driver
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        helen.koike@collabora.com, sboyd@kernel.org
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1581704608-31219-1-git-send-email-skomatineni@nvidia.com>
 <1581704608-31219-5-git-send-email-skomatineni@nvidia.com>
 <30e417ba-84e1-63d2-de74-22cfe859bddb@xs4all.nl>
 <920b4276-b2ca-646c-a21b-ca0b9bacf471@nvidia.com>
 <6bb124db-681c-55c1-e328-6e1f766a8bb3@nvidia.com>
 <0f84d37c-105f-8de6-c922-186d2f9ea156@nvidia.com>
 <44fc39f4-8e9f-bcab-8642-fe1cb332016a@xs4all.nl>
 <fb5f1566-9347-8f34-ada0-15c831cbc394@nvidia.com>
 <87c1c97d-abd7-8ca5-0709-d7c64a7d7b39@nvidia.com>
 <32ebc124-cb2d-f545-a5a0-d71192af8219@nvidia.com>
 <d1505a3b-92e0-4f98-1882-c56bdab7e2f6@xs4all.nl>
 <fc7b975a-dffa-4826-7ae5-40abb1f16b3d@nvidia.com>
 <3adacc07-7e3a-2d06-8d18-003b004ede17@nvidia.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <dae3a6dd-f7ab-5e0f-08a9-2b0be4c68fe1@xs4all.nl>
Date:   Thu, 20 Feb 2020 10:29:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <3adacc07-7e3a-2d06-8d18-003b004ede17@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfKpnDRlyVAgVJ8cU1/lyw3XkRh89XFTSARDz31Fo42OwcBo2rT65KxcZ06sBsDNdclTnFnu4edsk2FmO3jrpkec83Cd+lqQb6+NXPZaRiligzZbh1Cg+
 tJ2tDCCGaDwTiPnBV1pVLp+yR3MMGMjCx+YsvvueAmsx1D2OlDrAExxXTgpHv5Qoro/9NOPoh2/VD7/1L7u6Vu/pmTpOPyp4vbT4O1o1RcPduafmdP7XtcPb
 ucm9QAWqoBS3Q5EoeL0gElGlJx3+mWHjloyg+I53sWhLeFFVtjrAh34LCSqtoZsiqSnOn8d6sLJRWKwsmVXoZOirkw4TcYj7Muhv1KuXyXgULQouGP9OQ+2p
 jpW9fx2izKhsaKIcvkM9Slpn203qQbl1WaCRDRnoCYbfSRtmtQxTabAINxxzb1hAi8DegHF4JTC5iWYfLLFBW2vMpq4m6J3bsj91yUJfDfEUPxIRk5vc3vJQ
 1sc51/IrGxGQ8+RiSJcJLqQa9KdvM0w/V+0H9WxXCNxUqdEQTqpFmurdhUI/c8nW4IUHh7PhZOwoUCIXjhFuWB+TmRhEpabXuP8pgO59Ahqcc18VHtz+n1c8
 aY5hkQPH9oPBymu02Q24/LDVYJ+qfF3R5QoyouVitSA6XurHaJl0yLhNofiHCTLiT/I=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2/20/20 1:09 AM, Sowjanya Komatineni wrote:
>> Thanks Hans. Probably dma address is not aligned properly. Will check.
> 
> 
> I see this time repro happened right on power up during 1st run of 
> compliance test and it shows kernel write to read-only error right 
> during vb2_core_qbuf -> buf_prepare.
> 
> it happened after buffers allocation and during pre-queuing of buffers 
> right before starting 1st stream on power up.
> 
> Hi Thierry,
> 
> Currently tegra vi driver don't use iommu. Could this be some issue with 
> contig allocation as iommu is not being used?

Nothing to do with that. The root cause is that struct tegra_channel_buffer
must start with struct vb2_v4l2_buffer since that's what vb2 assumes. Instead
it starts with 'chan'. The really surprising thing is that this didn't cause
more problems sooner.

The patch below fixes this KASAN error. Whether it also fixes the original
error you found is something you need to test, but I think that's very likely.

Regards,

	Hans

diff --git a/drivers/staging/media/tegra/tegra-common.h b/drivers/staging/media/tegra/tegra-common.h
index 79ec550c6f27..3980a8759e68 100644
--- a/drivers/staging/media/tegra/tegra-common.h
+++ b/drivers/staging/media/tegra/tegra-common.h
@@ -221,9 +221,9 @@ struct tegra_vi_channel {
  * @mw_ack_sp_thresh: MW_ACK_DONE syncpoint threshold
  */
 struct tegra_channel_buffer {
-	struct tegra_vi_channel *chan;
 	struct vb2_v4l2_buffer buf;
 	struct list_head queue;
+	struct tegra_vi_channel *chan;
 	dma_addr_t addr;
 	u32 mw_ack_sp_thresh;
 };


> 
> 
> [   54.041421]  tegra_channel_buffer_prepare+0x34/0x88
> [   54.047666]  __buf_prepare+0x1c4/0x230
> [   54.052094]  vb2_core_qbuf+0x454/0x508
> [   54.056434]  __vb2_init_fileio+0x1f8/0x2b8
> [   54.060519]  __vb2_perform_fileio+0x5a0/0x6b8
> [   54.064864]  vb2_read+0x10/0x18
> [   54.067996]  vb2_fop_read+0xb0/0xf8
> [   54.071475]  v4l2_read+0x74/0xb8
> [   54.074697]  __vfs_read+0x18/0x40
> [   54.078003]  vfs_read+0x98/0x168
> [   54.081222]  ksys_read+0x64/0xf0
> [   54.084439]  __arm64_sys_read+0x14/0x20
> [   54.088268]  el0_svc_common.constprop.2+0xb0/0x168
> [   54.093047]  do_el0_svc_compat+0x18/0x38
> [   54.096961]  el0_sync_compat_handler+0x13c/0x194
> [   54.101565]  el0_sync_compat+0x144/0x180
> [   54.105478] Code: b9407802 eb02007f 540001e8 b9007404 (f81f8001)
> [   54.111559] ---[ end trace 7fbb77a9700492f1 ]---
> 
>>>
>>>> [   41.222012] Mem abort info:
>>>> [   41.224807]   ESR = 0x9600004f
>>>> [   41.227852]   EC = 0x25: DABT (current EL), IL = 32 bits
>>>> [   41.233160]   SET = 0, FnV = 0
>>>> [   41.236204]   EA = 0, S1PTW = 0
>>>> [   41.239344] Data abort info:
>>>> [   41.242225]   ISV = 0, ISS = 0x0000004f
>>>> [   41.246058]   CM = 0, WnR = 1
>>>> [   41.249026] swapper pgtable: 4k pages, 48-bit VAs, 
>>>> pgdp=0000000081498000
>>>> [   41.255733] [ffff0000f5c3fff8] pgd=000000017f1f8003,
>>>> pud=000000017ec06003, pmd=000000017ea57003, pte=0060000175c3f793
>>>> [   41.266345] Internal error: Oops: 9600004f [#1] PREEMPT SMP
>>>> [   41.271905] Modules linked in: panel_simple tegra_drm
>>>> snd_hda_codec_hdmi snd_hda_tegra crct10dif_ce snd_hda_codec cec
>>>> drm_kms_helper snd_hda_core lp855x_bl drm pwm_tegra ip_tables x_tables
>>>> ipv6 nf_defrag_ipv6
>>>> [   41.290401] CPU: 3 PID: 532 Comm: v4l2-compliance Tainted: G
>>>> W         5.6.0-rc1-00035-g6a105c1c479a-dirty #1
>>>> [   41.300902] Hardware name: NVIDIA Jetson TX1 Developer Kit (DT)
>>>> [   41.306807] pstate: 60000005 (nZCv daif -PAN -UAO)
>>>> [   41.311593] pc : tegra_channel_buffer_prepare+0x34/0x88
>>>> [   41.316807] lr : __buf_prepare+0x1c4/0x230
>>>> [   41.320891] sp : ffff800011f5baa0
>>>> [   41.324195] x29: ffff800011f5baa0 x28: ffff0000f58cc100
>>>> [   41.329494] x27: ffff800011f5bc58 x26: ffff80001100b780
>>>> [   41.334792] x25: ffff0000f81f1608 x24: ffff0000f7be7c00
>>>> [   41.340091] x23: 00000000c058565d x22: 0000000000000000
>>>> [   41.345390] x21: ffff0000f81f16e8 x20: 0000000000000000
>>>> [   41.350688] x19: ffff0000f5c40000 x18: 0000000000000000
>>>> [   41.355986] x17: 0000000000000000 x16: 0000000000000000
>>>> [   41.361285] x15: ffff0000f8553800 x14: 0000000000000000
>>>> [   41.366583] x13: 003f480000000000 x12: 003f500000000000
>>>> [   41.371881] x11: 0000000100000000 x10: 0000000000000000
>>>> [   41.377180] x9 : 0000000000000000 x8 : ffff0000f5c40258
>>>> [   41.382478] x7 : 0000000000000030 x6 : 0000000000000001
>>>> [   41.387776] x5 : 0000000000000000 x4 : 00000000003f4800
>>>> [   41.393074] x3 : 00000000003f4800 x2 : 00000000003f4800
>>>> [   41.398373] x1 : ffff0000f81f1080 x0 : ffff0000f5c40000
>>>> [   41.403671] Call trace:
>>>> [   41.406109]  tegra_channel_buffer_prepare+0x34/0x88
>>>> [   41.410974]  __buf_prepare+0x1c4/0x230
>>>> [   41.414713]  vb2_core_prepare_buf+0x94/0x110
>>>> [   41.418971]  vb2_prepare_buf+0x74/0xa8
>>>> [   41.422710]  vb2_ioctl_prepare_buf+0x54/0x60
>>>> [   41.426970]  v4l_prepare_buf+0x44/0x58
>>>> [   41.430707]  __video_do_ioctl+0x228/0x3e8
>>>> [   41.434705]  video_usercopy+0x1cc/0x4d0
>>>> [   41.438531]  video_ioctl2+0x14/0x20
>>>> [   41.442010]  v4l2_ioctl+0x44/0x68
>>>> [   41.445316]  v4l2_compat_ioctl32+0x21c/0x1420
>>>> [   41.449665]  __arm64_compat_sys_ioctl+0xc8/0x108
>>>> [   41.454273]  el0_svc_common.constprop.2+0xb0/0x168
>>>> [   41.459051]  do_el0_svc_compat+0x18/0x38
>>>> [   41.462964]  el0_sync_compat_handler+0x13c/0x194
>>>> [   41.467570]  el0_sync_compat+0x144/0x180
>>>> [   41.471483] Code: b9407802 eb02007f 540001e8 b9007404 (f81f8001)
>>>> [   41.477563] ---[ end trace 051c84051f60870a ]---
>>>>
>>>>>>>>>> With using minimum 3 buffers, this issue doesnt happen at all 
>>>>>>>>>> from
>>>>>>>>>> almost 72 hours of testing.
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Will try with setting vb2 queue field min_buffers_needed as 3
>>>>>>>>>> instead
>>>>>>>>>> of adding check in queue setup.
>>>>>>>>>>
>>>>>>>>>>>> +
>>>>>>>>>>>> +     return 0;
>>>>>>>>>>>> +}

