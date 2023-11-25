Return-Path: <linux-media+bounces-1005-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D8D7F8930
	for <lists+linux-media@lfdr.de>; Sat, 25 Nov 2023 09:22:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56F89B2128D
	for <lists+linux-media@lfdr.de>; Sat, 25 Nov 2023 08:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F3AD4435;
	Sat, 25 Nov 2023 08:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5C08F6B
	for <linux-media@vger.kernel.org>; Sat, 25 Nov 2023 08:22:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5398C433C8;
	Sat, 25 Nov 2023 08:22:44 +0000 (UTC)
Message-ID: <1e9ec452-7870-4f60-a9b4-9fe022707264@xs4all.nl>
Date: Sat, 25 Nov 2023 09:22:42 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/13] media: rockchip: rga: add support for
 multi-planar formats
To: Michael Tretter <m.tretter@pengutronix.de>,
 Jacob Chen <jacob-chen@iotwrt.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Shengyu Qu <wiagn233@outlook.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, Diederik de Haas
 <didi.debian@cknow.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
References: <20230914-rockchip-rga-multiplanar-v2-0-bbfa6abf8bbf@pengutronix.de>
 <b851e2e8-ebcb-40a9-934b-dddcb28a45c9@xs4all.nl>
 <20231124153121.GL592330@pengutronix.de>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20231124153121.GL592330@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/11/2023 16:31, Michael Tretter wrote:
> Hi Hans,
> 
> On Fri, 24 Nov 2023 14:39:37 +0100, Hans Verkuil wrote:
>> On 13/10/2023 13:00, Michael Tretter wrote:
>>> This is v2 of the series that adds support for the V4L2 multi-planar API
>>> to the Rockchip RGA driver. Once the RGA driver supports the
>>> multi-planar API, it is easier to share buffers with other V4L2 drivers
>>> that also support the multi-planar API and may not expose planar formats
>>> with contiguous planes.
>>>
>>> v2 fixes the smatch warnings and compile errors of v1. Furthermore, now
>>> the DMA mask is set to 32 bits for coherent, too, and the gfp_flags are
>>> configured to ensure that buffers are allocated in the lower 4GB area.
>>>
>>> With non-contiguous planes, the U and V planes may not start at the same
>>> offset as with the continuous planes. Therefore, the RGA driver cannot
>>> rely on its calculation of the plane offsets based on the format and
>>> frame size anymore, but must remember the offsets when it created the
>>> mapping. Therefore, I also reworked how the DMA mapping is handled.
>>>
>>> As a bonus, the RGA driver should now work correctly on devices with
>>> more than 4 GB of memory. Video buffers should now be allocated within
>>> the 4 GB boundary and an import of buffers that have higher addresses
>>> into the driver should fail.
>>>
>>> Patch 1 fixes the swizzling of RGA formats. While testing all formats of
>>> the driver on rk3568, I discovered that the color channels of the RGB
>>> formats are wrong when converting to NV12. I didn't test this on other
>>> SoCs with an RGA and I am not sure, if they behave differently regarding
>>> the color channels. Please report, if this breaks the color conversion
>>> on other SoCs, and I will make this SoC-specific.
>>>
>>> Patches 2 to 6 are the rework the DMA descriptor handling for the RGA
>>> MMU. The patches clean up, how the driver uses the DMA API, and make the
>>> creation of the descriptor list more explicit. Furthermore, the driver
>>> is changed to keep the mapping per video buffer instead of using a
>>> single mapping that is updated with every buffer.
>>>
>>> Patches 7 to 11 prepare the driver for the multi-planar API including a
>>> cleanup of the format handling in the buffer, and finally switch to the
>>> multi-planar API.
>>
>> Switching over to the multi-planar API is always a bit scary. How did you
>> test this? Using gstreamer? Other apps?
> 
> I tested with GStreamer. My use case is using the RGA to convert RGB Buffers
> to NV12 to feed them to a Hantro JPEG encoder. I also tried to separate the
> preparatory work, the switch to the multi-planar API, and the addition of
> actually multi-planar formats into separate patches.
> 
> Is there anything that I should take special care of or explicitly test, when
> switching the driver to the multi-planar API?

No, I just wanted to have a better overview of how this driver is used and
how you tested it.

Regards,

	Hans

> 
> Michael
> 
>>
>> Regards,
>>
>> 	Hans
>>
>>>
>>> Patch 12 updates the code that creates the DMA-descriptor mapping to
>>> correctly handle buffers with multiple planes. The driver has to iterate
>>> all planes and make them the continuous for the RGA.
>>>
>>> Patch 13 enables the NV12M format, which is the multi-planar variant of
>>> the NV12 format.
>>>
>>> Michael
>>>
>>> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
>>> ---
>>> Changes in v2:
>>> - Fix smatch warnings
>>> - Fix cast to dst_mmu_pages/src_mmu_pages to fix compile error in Patch 2
>>> - Remove check for upper_32_bits when filling the DMA descriptor table
>>> - Remove useless dma_sync_single_for_device()
>>> - Set DMA mask for DMA coherent
>>> - Set gfp_flags to __GFP_DMA32
>>> - Link to v1: https://lore.kernel.org/r/20230914-rockchip-rga-multiplanar-v1-0-abfd77260ae3@pengutronix.de
>>>
>>> ---
>>> Michael Tretter (13):
>>>       media: rockchip: rga: fix swizzling for RGB formats
>>>       media: rockchip: rga: extract helper to fill descriptors
>>>       media: rockchip: rga: allocate DMA descriptors per buffer
>>>       media: rockchip: rga: split src and dst buffer setup
>>>       media: rockchip: rga: pre-calculate plane offsets
>>>       media: rockchip: rga: set dma mask to 32 bits
>>>       media: rockchip: rga: use clamp() to clamp size to limits
>>>       media: rockchip: rga: use pixelformat to find format
>>>       media: rockchip: rga: add local variable for pix_format
>>>       media: rockchip: rga: use macros for testing buffer type
>>>       media: rockchip: rga: switch to multi-planar API
>>>       media: rockchip: rga: rework buffer handling for multi-planar formats
>>>       media: rockchip: rga: add NV12M support
>>>
>>>  drivers/media/platform/rockchip/rga/rga-buf.c | 162 ++++++++++++++++------
>>>  drivers/media/platform/rockchip/rga/rga-hw.c  | 146 ++++++++++++--------
>>>  drivers/media/platform/rockchip/rga/rga.c     | 189 ++++++++++++--------------
>>>  drivers/media/platform/rockchip/rga/rga.h     |  35 ++++-
>>>  4 files changed, 328 insertions(+), 204 deletions(-)
>>> ---
>>> base-commit: 2c1bae27df787c9535e48cc27bbd11c3c3e0a235
>>> change-id: 20230914-rockchip-rga-multiplanar-0d7c79b1ba93
>>>
>>> Best regards,
>>
>>


