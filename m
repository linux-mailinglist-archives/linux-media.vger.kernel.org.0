Return-Path: <linux-media+bounces-26222-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E44A387EF
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 16:45:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0EB61175472
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 15:44:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2DEA225385;
	Mon, 17 Feb 2025 15:44:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61028224AFF;
	Mon, 17 Feb 2025 15:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739807064; cv=none; b=ECfnNO/CY2Ft5QoQVnHwmUiwEd8TP2zz2eX0ZMV/C49iYBXs4rCp9a+E3F0gCKMAcQG/+d3WrqxQQnXjItX1zDiQ/Q48QAS5vS5Ltg9rIVxeK4rQNI4NPo37rYMcRPnH9BcIi6qfdjIvSdLsFW6k63dV9cEOvPvoJOcgnAehBAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739807064; c=relaxed/simple;
	bh=iadKPwYhMT6m0BkbJmcOE34dgVzqbtXiyfGTt9wBGKc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P21ynsDUrtVbHKxC7i9+UQknDsTKfXMMWRGJSRha2vrTuh7mNKgBFkzKhIyT0+XyfDAIgNq2tiXKtakebfl4Jc+lA87oMMou0t0IW/8NNuHAXtDQQlkjH48uF07QFKp+TKVIc41azYjlWLBV5Z3JYL+Mxqrm4krtUrxN5gqzajU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E46EC4CED1;
	Mon, 17 Feb 2025 15:44:20 +0000 (UTC)
Message-ID: <23eacfe3-cf94-45d3-a405-43185ef32512@xs4all.nl>
Date: Mon, 17 Feb 2025 16:44:18 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] media: platform: synopsys: Add support for HDMI
 input driver
Content-Language: en-US
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
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <3d4b1c45-cc00-4714-8582-0848e38c2ec4@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/17/25 16:36, Dmitry Osipenko wrote:
> On 2/17/25 11:31, Hans Verkuil wrote:
>> On 15/02/2025 22:04, Dmitry Osipenko wrote:
>>> From: Shreeya Patel <shreeya.patel@collabora.com>
>>>
>>> Add initial support for the Synopsys DesignWare HDMI RX
>>> Controller Driver used by Rockchip RK3588. The driver
>>> supports:
>>>  - HDMI 1.4b and 2.0 modes (HDMI 4k@60Hz)
>>>  - RGB888, YUV422, YUV444 and YCC420 pixel formats
>>>  - CEC
>>>  - EDID configuration
>>>
>>> The hardware also has Audio and HDCP capabilities, but these are
>>> not yet supported by the driver.
>>>
>>> Co-developed-by: Dingxian Wen <shawn.wen@rock-chips.com>
>>> Signed-off-by: Dingxian Wen <shawn.wen@rock-chips.com>
>>> Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>
>>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>> ---
>>>  drivers/media/platform/Kconfig                |    1 +
>>>  drivers/media/platform/Makefile               |    1 +
>>>  drivers/media/platform/synopsys/Kconfig       |    3 +
>>>  drivers/media/platform/synopsys/Makefile      |    2 +
>>>  .../media/platform/synopsys/hdmirx/Kconfig    |   27 +
>>>  .../media/platform/synopsys/hdmirx/Makefile   |    4 +
>>>  .../platform/synopsys/hdmirx/snps_hdmirx.c    | 2715 +++++++++++++++++
>>>  .../platform/synopsys/hdmirx/snps_hdmirx.h    |  394 +++
>>>  .../synopsys/hdmirx/snps_hdmirx_cec.c         |  284 ++
>>>  .../synopsys/hdmirx/snps_hdmirx_cec.h         |   44 +
>>>  10 files changed, 3475 insertions(+)
>>>  create mode 100644 drivers/media/platform/synopsys/Kconfig
>>>  create mode 100644 drivers/media/platform/synopsys/Makefile
>>>  create mode 100644 drivers/media/platform/synopsys/hdmirx/Kconfig
>>>  create mode 100644 drivers/media/platform/synopsys/hdmirx/Makefile
>>>  create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
>>>  create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.h
>>>  create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx_cec.c
>>>  create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx_cec.h
>>>
>>
>> <snip>
>>
>>> +static ssize_t
>>> +hdmirx_debugfs_if_read(u32 type, void *priv, struct file *filp,
>>> +		       char __user *ubuf, size_t count, loff_t *ppos)
>>> +{
>>> +	struct snps_hdmirx_dev *hdmirx_dev = priv;
>>> +	u8 aviif[3 + 7 * 4];
>>> +	int len;
>>> +
>>> +	if (type != V4L2_DEBUGFS_IF_AVI)
>>> +		return 0;
>>> +
>>> +	hdmirx_read_avi_infoframe(hdmirx_dev, aviif);
>>> +
>>> +	len = simple_read_from_buffer(ubuf, count, ppos,
>>> +				      aviif, ARRAY_SIZE(aviif));
>>> +
>>> +	return len < 0 ? 0 : len;
>>> +}
>>
>> Have you tested this with 'edid-decode -c -I /path/to/avi'? Also test that it is
>> empty if there is no AVI InfoFrame (e.g. when there is no incoming video). I don't see
>> a test for that in the code.
>>
>> I also see no sanity check regarding the length of the InfoFrame, it just outputs
>> the full array, meaning you get padding as well since the AVI InfoFrame is smaller
>> than ARRAY_SIZE(aviif). In fact, edid-decode will fail about that if the -c option
>> is used.
>>
>> See tc358743_debugfs_if_read of how this is typically handled.
> 
> I've tested with 'edid-decode -I /path/to/avi', including the empty AVI
> InfoFrame. But without the '-c option'. I'd expect that debugfs should
> provide a full-sized raw InfoFrame data, rather than a parsed version.
> The parsed data isn't much useful for debugging purposes, IMO. I
> intentionally removed the size check that tc358743_debugfs_if_read does
> because it appeared wrong to me. Will re-check with '-c option', thanks!

The HDMI header contains the actual length that was received. So debugfs should
export the actual payload, not the maximum possible payload.

It is common for hardware to reserve room in the register map for the maximum
payload, but you only want to export what was actually received.

Regards,

	Hans

> 


