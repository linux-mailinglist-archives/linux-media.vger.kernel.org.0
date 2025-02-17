Return-Path: <linux-media+bounces-26232-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6923A38B33
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 19:22:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B7EB171834
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 18:22:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE61D235BF5;
	Mon, 17 Feb 2025 18:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="hUUIdwp3"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABE622F3BA;
	Mon, 17 Feb 2025 18:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739816538; cv=pass; b=pzWvtY6f1TXY4Cfrsc7swab9TjKXJaRTl8yly3ZAFFTnTyXZK7+N/W2TdVju2tcqYnrBfXCx4VryuV1YwRWK0HnMZiFUQMnBDDekCDTIW00TKwfsZ2I7998PDFfFnVh3J6sJZ168HkhBPlYu1i93IqEqNEF2Q+szeU5IPrACeT0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739816538; c=relaxed/simple;
	bh=j4LI1IWXqRpV1w/6NbQE5p5kYPblT4w+CTNi8ISSl44=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fZRjLCKAW3Px6Wanzi858NelvXaeiVjyT2JoAp417YR/ProX7N7r2v2Q6VhUzF9pflMj3P6+Q5vXYTp9vAV8PQLomihuSUlMgmydh1kUNTVWwnz1clBk7Tt+ysFAzhoq5Ulr3aK8lQZQarmrc+PHXUsE6c1h5Fy/KaHVwohEjmA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=hUUIdwp3; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1739816483; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FSDI6hvzppjHNfMqf1bT2xk8SDepDX6IlhW1DlUnW+L4T120jQc2hxnAcGk9fmBtj/cqvOW5wzeHuL9dWN1o9PjFGK2pTWnVnRE/NihBgclGYJ1lMrlZuzPBraxUvmxYK+ouYnirdRegEbpiMvj4WgYqZuHZXjfHr88CtnUydHk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1739816483; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=I4gPtRebb+yuMWszCxvF8QdrCp+aDjd19oW25HRljLU=; 
	b=QvDl393MFB0XSQnZisbMFl2vSE/PM+NI1ufAQi+ZRhABgJDY/9R7lQ4RLryknIjHfWW/90k49PS54cMti9svHV0iwmV/KhYoNi4HK1tu2noDHJ2Kb48pff7XIOyXnxv3YevMfSi82bs/Ci37sPV938GnDREMXFQT+2k/ZT0lEeQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739816483;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=I4gPtRebb+yuMWszCxvF8QdrCp+aDjd19oW25HRljLU=;
	b=hUUIdwp3y/ZuPBUCyoodXLwxupQoyW0nbKs1vaVl6D8xA65ZRQ4oJbly2oQnOtL+
	7TyIvhi99nyGGgUtWPmbi6JvVk2rNsEix8U6/nK9wVZK3gl2qSx7MyAo38afKgsOf8S
	apP+nZkViFrgoiT8W6WR9bTqtlKT6fFo5QverGoQ=
Received: by mx.zohomail.com with SMTPS id 1739816481776736.929364556648;
	Mon, 17 Feb 2025 10:21:21 -0800 (PST)
Message-ID: <398cffa8-5463-47ff-bdeb-3f3167b72312@collabora.com>
Date: Mon, 17 Feb 2025 21:21:16 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] media: platform: synopsys: Add support for HDMI
 input driver
To: Hans Verkuil <hverkuil@xs4all.nl>,
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
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <23eacfe3-cf94-45d3-a405-43185ef32512@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 2/17/25 18:44, Hans Verkuil wrote:
> On 2/17/25 16:36, Dmitry Osipenko wrote:
>> On 2/17/25 11:31, Hans Verkuil wrote:
>>> On 15/02/2025 22:04, Dmitry Osipenko wrote:
>>>> From: Shreeya Patel <shreeya.patel@collabora.com>
>>>>
>>>> Add initial support for the Synopsys DesignWare HDMI RX
>>>> Controller Driver used by Rockchip RK3588. The driver
>>>> supports:
>>>>  - HDMI 1.4b and 2.0 modes (HDMI 4k@60Hz)
>>>>  - RGB888, YUV422, YUV444 and YCC420 pixel formats
>>>>  - CEC
>>>>  - EDID configuration
>>>>
>>>> The hardware also has Audio and HDCP capabilities, but these are
>>>> not yet supported by the driver.
>>>>
>>>> Co-developed-by: Dingxian Wen <shawn.wen@rock-chips.com>
>>>> Signed-off-by: Dingxian Wen <shawn.wen@rock-chips.com>
>>>> Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>
>>>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>>> ---
>>>>  drivers/media/platform/Kconfig                |    1 +
>>>>  drivers/media/platform/Makefile               |    1 +
>>>>  drivers/media/platform/synopsys/Kconfig       |    3 +
>>>>  drivers/media/platform/synopsys/Makefile      |    2 +
>>>>  .../media/platform/synopsys/hdmirx/Kconfig    |   27 +
>>>>  .../media/platform/synopsys/hdmirx/Makefile   |    4 +
>>>>  .../platform/synopsys/hdmirx/snps_hdmirx.c    | 2715 +++++++++++++++++
>>>>  .../platform/synopsys/hdmirx/snps_hdmirx.h    |  394 +++
>>>>  .../synopsys/hdmirx/snps_hdmirx_cec.c         |  284 ++
>>>>  .../synopsys/hdmirx/snps_hdmirx_cec.h         |   44 +
>>>>  10 files changed, 3475 insertions(+)
>>>>  create mode 100644 drivers/media/platform/synopsys/Kconfig
>>>>  create mode 100644 drivers/media/platform/synopsys/Makefile
>>>>  create mode 100644 drivers/media/platform/synopsys/hdmirx/Kconfig
>>>>  create mode 100644 drivers/media/platform/synopsys/hdmirx/Makefile
>>>>  create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
>>>>  create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.h
>>>>  create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx_cec.c
>>>>  create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx_cec.h
>>>>
>>>
>>> <snip>
>>>
>>>> +static ssize_t
>>>> +hdmirx_debugfs_if_read(u32 type, void *priv, struct file *filp,
>>>> +		       char __user *ubuf, size_t count, loff_t *ppos)
>>>> +{
>>>> +	struct snps_hdmirx_dev *hdmirx_dev = priv;
>>>> +	u8 aviif[3 + 7 * 4];
>>>> +	int len;
>>>> +
>>>> +	if (type != V4L2_DEBUGFS_IF_AVI)
>>>> +		return 0;
>>>> +
>>>> +	hdmirx_read_avi_infoframe(hdmirx_dev, aviif);
>>>> +
>>>> +	len = simple_read_from_buffer(ubuf, count, ppos,
>>>> +				      aviif, ARRAY_SIZE(aviif));
>>>> +
>>>> +	return len < 0 ? 0 : len;
>>>> +}
>>>
>>> Have you tested this with 'edid-decode -c -I /path/to/avi'? Also test that it is
>>> empty if there is no AVI InfoFrame (e.g. when there is no incoming video). I don't see
>>> a test for that in the code.
>>>
>>> I also see no sanity check regarding the length of the InfoFrame, it just outputs
>>> the full array, meaning you get padding as well since the AVI InfoFrame is smaller
>>> than ARRAY_SIZE(aviif). In fact, edid-decode will fail about that if the -c option
>>> is used.
>>>
>>> See tc358743_debugfs_if_read of how this is typically handled.
>>
>> I've tested with 'edid-decode -I /path/to/avi', including the empty AVI
>> InfoFrame. But without the '-c option'. I'd expect that debugfs should
>> provide a full-sized raw InfoFrame data, rather than a parsed version.
>> The parsed data isn't much useful for debugging purposes, IMO. I
>> intentionally removed the size check that tc358743_debugfs_if_read does
>> because it appeared wrong to me. Will re-check with '-c option', thanks!
> 
> The HDMI header contains the actual length that was received. So debugfs should
> export the actual payload, not the maximum possible payload.
> 
> It is common for hardware to reserve room in the register map for the maximum
> payload, but you only want to export what was actually received.

If payload is corrupted, it should be handy to see a full payload.
Otherwise you won't be able to debug anything because driver returns
zero payload to userspace since it can't parse the header :)

-- 
Best regards,
Dmitry

