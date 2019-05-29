Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAD652D866
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 11:00:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726057AbfE2JAW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 05:00:22 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:36697 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725957AbfE2JAV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 05:00:21 -0400
Received: from [IPv6:2001:983:e9a7:1:352c:d076:e7aa:19ae] ([IPv6:2001:983:e9a7:1:352c:d076:e7aa:19ae])
        by smtp-cloud7.xs4all.net with ESMTPA
        id VuRWh4YLD3qlsVuRXhsQmm; Wed, 29 May 2019 11:00:19 +0200
Subject: Re: [PATCH v6 16/16] rockchip/vpu: Add support for MPEG-2 decoding on
 RK3328
To:     Jonas Karlman <jonas@kwiboo.se>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>
Cc:     "kernel@collabora.com" <kernel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        "linux-rockchip@lists.infradead.org" 
        <linux-rockchip@lists.infradead.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>
References: <20190528170232.2091-1-ezequiel@collabora.com>
 <20190528170232.2091-17-ezequiel@collabora.com>
 <2ef056a2-e9dc-52b1-855b-2bef759af9b6@xs4all.nl>
 <VI1PR03MB42066B8C9F364ACF7CFFF241AC1F0@VI1PR03MB4206.eurprd03.prod.outlook.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <e5e06b74-95b6-fcfb-dd75-b9c5b5e5278b@xs4all.nl>
Date:   Wed, 29 May 2019 11:00:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <VI1PR03MB42066B8C9F364ACF7CFFF241AC1F0@VI1PR03MB4206.eurprd03.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfHWDkFCXUX/1g0+x44NJ1VtDSBod6t4DT7r0ZAg7QLWVK0QNwwxW/6sYtoPRlSqCAiHRpmFwB+ZVI74//qu9txwodFI5BGRs2Baa/N1/OfyCTQcuSWQk
 bDg8W1snC9iFalW4xdyV4xFrB+obyWLOUQf9J6cLTgKetwOa/JAFIgbSq+I9NkrF3qL3S8tQfZAGbuHwG3SawXYQIY2J1Sm3btXePd1MDwC9YBoIqbzayEnJ
 n3UCZlvpooslaMrFPiF8jUZJPc7qNHZZwMwFrMgpr6P7EOThhkL7zroReWe6CJP+UQumn1hfl+903XOEOlrgK9leUnlinUMYUOqXIDVLKb8p21Eo8p7oTCBx
 wZxlRPKvqBf89UmmDpUSE5CILGdRTSQ+lMwg2kyWzSS6w1/VLs02IZbTpNFg+n1uyNmnCu6BuRaffqcwGEBObsSdVohwcGVZK35FF4Y41AAlXa+NsgPkiWS2
 K1lzYxFfW25jKAloo2inlPiK9QCFlj0QHCevakrw9WUEekuPB2MSCq8Hl3OgrqEz5xe83Kkg1tO1dQJbQ59Gg1IKCsMCadvIjH11guKMCRpv/88B3kFs9CjQ
 79x3B0uFKy43vUl2zODv/oryS+1u3PxTM4CvhHrYj0KzOg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/29/19 10:50 AM, Jonas Karlman wrote:
> On 2019-05-29 10:11, Hans Verkuil wrote:
>> On 5/28/19 7:02 PM, Ezequiel Garcia wrote:
>>> From: Jonas Karlman <jonas@kwiboo.se>
>>>
>>> Add necessary bits to support MPEG2 decoding on RK3328.
>>>
>>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
>>> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
>>> --
>>> Changes from v5:
>>> * New patch.
>>>
>>>  drivers/staging/media/rockchip/vpu/rk3399_vpu_hw.c   | 12 ++++++++++++
>>>  .../staging/media/rockchip/vpu/rockchip_vpu_drv.c    |  1 +
>>>  drivers/staging/media/rockchip/vpu/rockchip_vpu_hw.h |  1 +
>>>  3 files changed, 14 insertions(+)
>>>
>>> diff --git a/drivers/staging/media/rockchip/vpu/rk3399_vpu_hw.c b/drivers/staging/media/rockchip/vpu/rk3399_vpu_hw.c
>>> index 2b3689968ef4..341f8d69c33d 100644
>>> --- a/drivers/staging/media/rockchip/vpu/rk3399_vpu_hw.c
>>> +++ b/drivers/staging/media/rockchip/vpu/rk3399_vpu_hw.c
>>> @@ -175,3 +175,15 @@ const struct rockchip_vpu_variant rk3399_vpu_variant = {
>>>  	.clk_names = {"aclk", "hclk"},
>>>  	.num_clocks = 2
>>>  };
>>> +
>>> +const struct rockchip_vpu_variant rk3328_vpu_variant = {
>>> +	.dec_offset = 0x400,
>>> +	.dec_fmts = rk3399_vpu_dec_fmts,
>>> +	.num_dec_fmts = ARRAY_SIZE(rk3399_vpu_dec_fmts),
>>> +	.codec = RK_VPU_MPEG2_DECODER,
>>> +	.codec_ops = rk3399_vpu_codec_ops,
>>> +	.vdpu_irq = rk3399_vdpu_irq,
>>> +	.init = rk3399_vpu_hw_init,
>>> +	.clk_names = {"aclk", "hclk"},
>>> +	.num_clocks = 2
>>> +};
>>> diff --git a/drivers/staging/media/rockchip/vpu/rockchip_vpu_drv.c b/drivers/staging/media/rockchip/vpu/rockchip_vpu_drv.c
>>> index b94ff97451db..2e22009b6583 100644
>>> --- a/drivers/staging/media/rockchip/vpu/rockchip_vpu_drv.c
>>> +++ b/drivers/staging/media/rockchip/vpu/rockchip_vpu_drv.c
>>> @@ -419,6 +419,7 @@ static const struct v4l2_file_operations rockchip_vpu_fops = {
>>>  
>>>  static const struct of_device_id of_rockchip_vpu_match[] = {
>>>  	{ .compatible = "rockchip,rk3399-vpu", .data = &rk3399_vpu_variant, },
>>> +	{ .compatible = "rockchip,rk3328-vpu", .data = &rk3328_vpu_variant, },
>> This new compatible string should be documented in
>> Documentation/devicetree/bindings/media/rockchip-vpu.txt as well.
>>
>> I'll take patches 1-15 and drop this one. This patch can be merged once
>> the bindings file is updated as well.
> 
> Looks like the bindings patch did not get picked for v6 :-)
> 
> I am a bit unclear on how to handle patch submission that covers multiple subtrees.
> Should I send a single series including three patches: bindings update, this patch and device tree update?
> Or is a series with only bindings update and this patch preferred?

In this case just post a patch updating rockchip-vpu.txt, CC-ing devicetree@vger.kernel.org and
Rob Herring <robh+dt@kernel.org>.

Rob will Ack it, and then I can make a pull request for that bindings patch and this
16/16 patch. There is nothing wrong with this patch, so no need to repost. I just
need to have an updated rockchip-vpu.txt patch as well.

Regards,

	Hans

> 
> Regards,
> Jonas
> 
>>
>> Regards,
>>
>> 	Hans
>>
>>>  	{ .compatible = "rockchip,rk3288-vpu", .data = &rk3288_vpu_variant, },
>>>  	{ /* sentinel */ }
>>>  };
>>> diff --git a/drivers/staging/media/rockchip/vpu/rockchip_vpu_hw.h b/drivers/staging/media/rockchip/vpu/rockchip_vpu_hw.h
>>> index 6cecb528f994..3d6b97af90fb 100644
>>> --- a/drivers/staging/media/rockchip/vpu/rockchip_vpu_hw.h
>>> +++ b/drivers/staging/media/rockchip/vpu/rockchip_vpu_hw.h
>>> @@ -79,6 +79,7 @@ enum rockchip_vpu_enc_fmt {
>>>  };
>>>  
>>>  extern const struct rockchip_vpu_variant rk3399_vpu_variant;
>>> +extern const struct rockchip_vpu_variant rk3328_vpu_variant;
>>>  extern const struct rockchip_vpu_variant rk3288_vpu_variant;
>>>  
>>>  void rockchip_vpu_watchdog(struct work_struct *work);
>>>
> 

