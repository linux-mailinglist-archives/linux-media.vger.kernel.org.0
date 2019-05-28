Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A38412CA6B
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 17:40:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726600AbfE1Pkh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 11:40:37 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:47931 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726362AbfE1Pkh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 11:40:37 -0400
Received: from [IPv6:2001:983:e9a7:1:352c:d076:e7aa:19ae] ([IPv6:2001:983:e9a7:1:352c:d076:e7aa:19ae])
        by smtp-cloud9.xs4all.net with ESMTPA
        id VeDJhjf8vsDWyVeDKheADd; Tue, 28 May 2019 17:40:34 +0200
Subject: Re: [PATCH v7 0/5] Add ZynqMP VCU/Allegro DVT H.264 encoder driver
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de, robh+dt@kernel.org, mchehab@kernel.org,
        tfiga@chromium.org, dshah@xilinx.com
References: <20190528130920.4450-1-m.tretter@pengutronix.de>
 <d0f49d4e-d060-1324-5348-eec0f4336601@xs4all.nl>
 <20190528170016.68252586@litschi.hi.pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <39768904-8e99-93b6-8fcc-1c6ef97e5852@xs4all.nl>
Date:   Tue, 28 May 2019 17:40:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190528170016.68252586@litschi.hi.pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfO1vqE5XyVil4Y92nUJQZMpZsqc0Hqddi1dAvCJEZy9jASMn/oZ44Gh/SJ/JA53U8ou0xHEAoSRJOwucfTXgYW02D3o71Xblq8SLYQm7oZfpI3/bvT2e
 vK4fXHnLCf431jhHgJQB7j0yFhLoWpCLDEQ3vkW1+AK8D0+2TfHGmF+aeLSqy7JJ8iznw+qeVkOc/k/BulgOtWB+kDBl2CtaHTuC5vd696C6kJ4AzMfoyJRb
 GVRGX7U30tFrQaFma73DpL0UWhM5X8JBzvuXCW1qmVgC5VK4Yn5urPrqay92Nsob3lwigoN0SdXSljNcbMfQe9ArrFwupZU55EK9mzSxgQMJnvG7lu4hAvRU
 ihoxwySg2aGPX9ysNwjZ3dh8Khlx3tjoYS3LWk0/yx2AHAgeCY/QderfxrRybqIYRK1TefJEP6+7WP3Rk50Qs8gVV/MEM77E3OWamDsfx5cur502YVopSeSC
 KbAth+sO72WvPQKhIurJpE7pRK0yYqYsBMQlyg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/28/19 5:00 PM, Michael Tretter wrote:
> On Tue, 28 May 2019 15:54:58 +0200, Hans Verkuil wrote:
>> Hi Michael,
>>
>> On 5/28/19 3:09 PM, Michael Tretter wrote:
>>> This is v7 of the Allegro DVT H.264 encoder driver found in the EV
>>> family of the Xilinx ZynqMP platform.
>>>
>>> I moved the driver back to staging, because the v4l2 stateful encoder spec is
>>> not finished, yet. Once the spec is finished, this driver shall be tested
>>> against the final v4l2-compliance and moved to mainline again.
>>>
>>> Further, I converted the allegro vendor prefix to the new json format in
>>> vendor-prefixes.yaml.
>>>
>>> The observed occasional failures in v4l2-compliance in v6 of this series
>>> turned out to be caused by a race condition with v4l2_m2m_poll(). I will send
>>> patches to fix this issue as a separate series.  
>>
>> I'm getting these smatch warnings:
>>
>> drivers/staging/media/allegro-dvt/allegro-core.c:1849:36: warning: constant 0xffffffff00000000 is so big it is unsigned long
> 
> The constant is used to calculate an offset, which is used by the
> hardware as offset for addresses in mailbox messages. The hardware
> expects a 64 bit value, but the driver calculates the value using a
> dma_addr_t, which is fine for 64 bit systems (e.g. ZynqMP), but is a
> problem on 32 bit systems.
> 
> I am currently working on improving the handling of frame addresses and
> make it fit for using the PL-RAM (in the FPGA) instead of the normal
> system RAM (PS-RAM). I would fix the warning with that patch set, if
> it is OK.

Sorry, no. I don't want new drivers creating new warnings. It's OK to
do a quick workaround and fix it properly later, though.

Regards,

	Hans

> 
>> drivers/staging/media/allegro-dvt/nal-h264.c:751: warning: Function parameter or member 'dev' not described in 'nal_h264_write_sps'
>> drivers/staging/media/allegro-dvt/nal-h264.c:792: warning: Function parameter or member 'dev' not described in 'nal_h264_read_sps'
>> drivers/staging/media/allegro-dvt/nal-h264.c:842: warning: Function parameter or member 'dev' not described in 'nal_h264_write_pps'
>> drivers/staging/media/allegro-dvt/nal-h264.c:884: warning: Function parameter or member 'dev' not described in 'nal_h264_read_pps'
>> drivers/staging/media/allegro-dvt/nal-h264.c:926: warning: Function parameter or member 'dev' not described in 'nal_h264_write_filler'
>> drivers/staging/media/allegro-dvt/nal-h264.c:969: warning: Function parameter or member 'dev' not described in 'nal_h264_read_filler'
> 
> I didn't describe the "struct device *dev" parameter, because it really
> doesn't add any value.
> 
> Michael
> 
>>
>> Can you take a look? The nal-h264.c warnings look trivial to fix, the
>> allegro-core.c warnings looks more interesting.
>>
>> Regards,
>>
>> 	Hans
>>

