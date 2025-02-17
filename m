Return-Path: <linux-media+bounces-26236-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AE5A38B76
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 19:46:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2AD0118858A8
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 18:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05738236457;
	Mon, 17 Feb 2025 18:45:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FEA235BFF;
	Mon, 17 Feb 2025 18:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739817942; cv=none; b=bo4r0SrOwrJih62KrbRWEEMIUbTPWjp/sGsI6ogz9u594Ud5K1zuswX8GsQQr6aWmq3c9f/3PEYjjHOFcm4GGQghf+SL08/WvRaTzj2d9al+2iWPnJ6AeNP161oG4/j+Oulm4W6rXzk/FFirVQzF/Wlth07XoUsRkWzUrG/XVUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739817942; c=relaxed/simple;
	bh=q/sWrNMswAMcrq+jomDIsw5Jj0KBZS9gH4J5t8/hVB0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LYcLSANIWAJUgRb42SyaOlT0Vy3mpNAC7uoQcpFk+/k5sckZjH80dg4TwZ8s44hgfJAh9quP7D5n6qW935Uj2eXWYIsL1TwMxJc552cedorCnpB1ioMpP4J1ekeAfnjaxzdK+JzZ02vfTQzaQJSUyDyKVRzQ5ywyQA6UmiepFZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F2CDC4CED1;
	Mon, 17 Feb 2025 18:45:38 +0000 (UTC)
Message-ID: <3e8a6fea-0ee9-4667-b8a9-8f2f02df3c91@xs4all.nl>
Date: Mon, 17 Feb 2025 19:45:36 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] media: platform: synopsys: Add support for HDMI
 input driver
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Shreeya Patel <shreeya.patel@collabora.com>, Heiko Stuebner
 <heiko@sntech.de>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, jose.abreu@synopsys.com,
 nelson.costa@synopsys.com, shawn.wen@rock-chips.com,
 nicolas.dufresne@collabora.com,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: kernel@collabora.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Tim Surber <me@timsurber.de>
References: <20250215210417.60074-1-dmitry.osipenko@collabora.com>
 <20250215210417.60074-5-dmitry.osipenko@collabora.com>
 <110db742-25a0-4f0c-9620-1af8885d6e1c@xs4all.nl>
 <3d4b1c45-cc00-4714-8582-0848e38c2ec4@collabora.com>
 <23eacfe3-cf94-45d3-a405-43185ef32512@xs4all.nl>
 <398cffa8-5463-47ff-bdeb-3f3167b72312@collabora.com>
 <cd40ca74-fe5b-4942-9da8-1117303dd0c4@collabora.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <cd40ca74-fe5b-4942-9da8-1117303dd0c4@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/02/2025 19:26, Dmitry Osipenko wrote:
> On 2/17/25 21:21, Dmitry Osipenko wrote:
>> On 2/17/25 18:44, Hans Verkuil wrote:
>>> On 2/17/25 16:36, Dmitry Osipenko wrote:
>>>> On 2/17/25 11:31, Hans Verkuil wrote:
>>>>> On 15/02/2025 22:04, Dmitry Osipenko wrote:
>>>>>> From: Shreeya Patel <shreeya.patel@collabora.com>
>>>>>>
>>>>>> Add initial support for the Synopsys DesignWare HDMI RX
>>>>>> Controller Driver used by Rockchip RK3588. The driver
>>>>>> supports:
>>>>>>  - HDMI 1.4b and 2.0 modes (HDMI 4k@60Hz)
>>>>>>  - RGB888, YUV422, YUV444 and YCC420 pixel formats
>>>>>>  - CEC
>>>>>>  - EDID configuration
>>>>>>
>>>>>> The hardware also has Audio and HDCP capabilities, but these are
>>>>>> not yet supported by the driver.
>>>>>>
>>>>>> Co-developed-by: Dingxian Wen <shawn.wen@rock-chips.com>
>>>>>> Signed-off-by: Dingxian Wen <shawn.wen@rock-chips.com>
>>>>>> Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>
>>>>>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>>>>> ---
>>>>>>  drivers/media/platform/Kconfig                |    1 +
>>>>>>  drivers/media/platform/Makefile               |    1 +
>>>>>>  drivers/media/platform/synopsys/Kconfig       |    3 +
>>>>>>  drivers/media/platform/synopsys/Makefile      |    2 +
>>>>>>  .../media/platform/synopsys/hdmirx/Kconfig    |   27 +
>>>>>>  .../media/platform/synopsys/hdmirx/Makefile   |    4 +
>>>>>>  .../platform/synopsys/hdmirx/snps_hdmirx.c    | 2715 +++++++++++++++++
>>>>>>  .../platform/synopsys/hdmirx/snps_hdmirx.h    |  394 +++
>>>>>>  .../synopsys/hdmirx/snps_hdmirx_cec.c         |  284 ++
>>>>>>  .../synopsys/hdmirx/snps_hdmirx_cec.h         |   44 +
>>>>>>  10 files changed, 3475 insertions(+)
>>>>>>  create mode 100644 drivers/media/platform/synopsys/Kconfig
>>>>>>  create mode 100644 drivers/media/platform/synopsys/Makefile
>>>>>>  create mode 100644 drivers/media/platform/synopsys/hdmirx/Kconfig
>>>>>>  create mode 100644 drivers/media/platform/synopsys/hdmirx/Makefile
>>>>>>  create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
>>>>>>  create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.h
>>>>>>  create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx_cec.c
>>>>>>  create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx_cec.h
>>>>>>
>>>>>
>>>>> <snip>
>>>>>
>>>>>> +static ssize_t
>>>>>> +hdmirx_debugfs_if_read(u32 type, void *priv, struct file *filp,
>>>>>> +		       char __user *ubuf, size_t count, loff_t *ppos)
>>>>>> +{
>>>>>> +	struct snps_hdmirx_dev *hdmirx_dev = priv;
>>>>>> +	u8 aviif[3 + 7 * 4];
>>>>>> +	int len;
>>>>>> +
>>>>>> +	if (type != V4L2_DEBUGFS_IF_AVI)
>>>>>> +		return 0;
>>>>>> +
>>>>>> +	hdmirx_read_avi_infoframe(hdmirx_dev, aviif);
>>>>>> +
>>>>>> +	len = simple_read_from_buffer(ubuf, count, ppos,
>>>>>> +				      aviif, ARRAY_SIZE(aviif));
>>>>>> +
>>>>>> +	return len < 0 ? 0 : len;
>>>>>> +}
>>>>>
>>>>> Have you tested this with 'edid-decode -c -I /path/to/avi'? Also test that it is
>>>>> empty if there is no AVI InfoFrame (e.g. when there is no incoming video). I don't see
>>>>> a test for that in the code.
>>>>>
>>>>> I also see no sanity check regarding the length of the InfoFrame, it just outputs
>>>>> the full array, meaning you get padding as well since the AVI InfoFrame is smaller
>>>>> than ARRAY_SIZE(aviif). In fact, edid-decode will fail about that if the -c option
>>>>> is used.
>>>>>
>>>>> See tc358743_debugfs_if_read of how this is typically handled.
>>>>
>>>> I've tested with 'edid-decode -I /path/to/avi', including the empty AVI
>>>> InfoFrame. But without the '-c option'. I'd expect that debugfs should
>>>> provide a full-sized raw InfoFrame data, rather than a parsed version.
>>>> The parsed data isn't much useful for debugging purposes, IMO. I
>>>> intentionally removed the size check that tc358743_debugfs_if_read does
>>>> because it appeared wrong to me. Will re-check with '-c option', thanks!
>>>
>>> The HDMI header contains the actual length that was received. So debugfs should
>>> export the actual payload, not the maximum possible payload.
>>>
>>> It is common for hardware to reserve room in the register map for the maximum
>>> payload, but you only want to export what was actually received.
>>
>> If payload is corrupted, it should be handy to see a full payload.
>> Otherwise you won't be able to debug anything because driver returns
>> zero payload to userspace since it can't parse the header :)
> 
> Note those tc358743 and other drivers are parsing the IF header data.
> I'm pretty sure this is not what InfoFrame debugfs is intended to do,

It's exactly what it is intended to do (I know, I wrote it :-) ).

The HDMI interface transmits the InfoFrame data with that HDMI header, the
receiver captures that and stores the InfoFrame data. You have no control
over that, it is all implemented in hardware since it is transmitted over
the high-speed video lanes. If the header is corrupt, then the video is
almost certainly also corrupt.

The reason for storing the InfoFrame in debugfs is to see what the transmitter
is sending us in the InfoFrame: does the InfoFrame contents make sense? Is it
consistent with the EDID?

If for example the transmitter is sending us a video format that isn't supported
in the EDID, then it is helpful to see what the AVI InfoFrame says.

Regards,

	Hans

> Will revisit it all again in a more details for v7.
> 


