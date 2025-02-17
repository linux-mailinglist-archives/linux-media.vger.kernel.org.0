Return-Path: <linux-media+bounces-26221-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F81DA387C3
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 16:38:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA7293B3FD8
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 15:38:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D310C224B05;
	Mon, 17 Feb 2025 15:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="fSWAuBxn"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F2E148FE6;
	Mon, 17 Feb 2025 15:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739806712; cv=pass; b=UPZ8NecVXybQZTHgzosbm9KHofHynEjnXrJbw9ektbc285/yvk4gPLwU/HYhZRyJORvCA+q63BTBj6htCdVl1vIa+V1P7s2f26lyeGCyPw7dDH8r7m0ugGz5epN4Oj6ziPq0/RCxNSmW4DxAQl4phDljezISeYmlQJXt3m4Hy+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739806712; c=relaxed/simple;
	bh=FxP2NJGW8IKb8On5/Rt5ho1+D6LTtLfpxLtWMQyluac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rZetrQpjegsLrB2RMCRsBODXx5MVoe1oFn2Mni6DZ0NaPjaqMUNvN1RIJOJ78x5kw2id6BbJaPvFA3B+ty20AxAfcMMpcsPotj9HfHKIvSMmOQSEb/c1JgPw4KXAEcEXJc40pbhfZPZw7QVP3ytXT6uHPsFP3QM8N66W5Mifi0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=fSWAuBxn; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1739806625; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=U5dOO/B20cbaS6mc5vlDkgll/xMS9rbnN1ODcBfyAvrw1Jb4sFsNwAVheem87ob3aTly3IH7xB/BnCY/LbZWN1jFXWoWtzjyNRb+O1PU90w9PNqlSg03Yuiuk34pFU7E3HMzlV19xXYGlrXfktVWHucO2IWKe1j5AUQ9VFUZUUM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1739806625; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=oyaLc7ouQgrclKFXXRsc/O0tx1PN1BYemSd7LjEmjmk=; 
	b=BJMfU8wLusVoJqMqSRaUpUvR/ystx6kc+bLiEevs/AbYOlsSC3eLR0MqhOSrHEOXkYOD5Z6LCkyjLj4QfOX5toVP0hdgp1aSXjYfGIeO6/EVL2Wx7t/JNjLl+YsRdDOrn/OP/GKVRVdt4T95Ci7d8Q9/Ru2V3V6AAQRIHELE9Ok=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739806625;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=oyaLc7ouQgrclKFXXRsc/O0tx1PN1BYemSd7LjEmjmk=;
	b=fSWAuBxnkdi+Ek3h2Bvc2L9HvjKgG/Fbhdhh6BuZPGOu8zmTyeddLjYZ8LOnyMyz
	ucTtiWmgVm7WLZtPzahICPHDgxqF8yM7q8oN2GY5sw/dkAOd+VTEcA1ltN5au38ECDw
	Cr1Fn+UAYYn+tmIYUpi6WN4EEcDsdmFs17bH8cwk=
Received: by mx.zohomail.com with SMTPS id 1739806622732599.8439504742172;
	Mon, 17 Feb 2025 07:37:02 -0800 (PST)
Message-ID: <3d4b1c45-cc00-4714-8582-0848e38c2ec4@collabora.com>
Date: Mon, 17 Feb 2025 18:36:56 +0300
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
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <110db742-25a0-4f0c-9620-1af8885d6e1c@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 2/17/25 11:31, Hans Verkuil wrote:
> On 15/02/2025 22:04, Dmitry Osipenko wrote:
>> From: Shreeya Patel <shreeya.patel@collabora.com>
>>
>> Add initial support for the Synopsys DesignWare HDMI RX
>> Controller Driver used by Rockchip RK3588. The driver
>> supports:
>>  - HDMI 1.4b and 2.0 modes (HDMI 4k@60Hz)
>>  - RGB888, YUV422, YUV444 and YCC420 pixel formats
>>  - CEC
>>  - EDID configuration
>>
>> The hardware also has Audio and HDCP capabilities, but these are
>> not yet supported by the driver.
>>
>> Co-developed-by: Dingxian Wen <shawn.wen@rock-chips.com>
>> Signed-off-by: Dingxian Wen <shawn.wen@rock-chips.com>
>> Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>
>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>> ---
>>  drivers/media/platform/Kconfig                |    1 +
>>  drivers/media/platform/Makefile               |    1 +
>>  drivers/media/platform/synopsys/Kconfig       |    3 +
>>  drivers/media/platform/synopsys/Makefile      |    2 +
>>  .../media/platform/synopsys/hdmirx/Kconfig    |   27 +
>>  .../media/platform/synopsys/hdmirx/Makefile   |    4 +
>>  .../platform/synopsys/hdmirx/snps_hdmirx.c    | 2715 +++++++++++++++++
>>  .../platform/synopsys/hdmirx/snps_hdmirx.h    |  394 +++
>>  .../synopsys/hdmirx/snps_hdmirx_cec.c         |  284 ++
>>  .../synopsys/hdmirx/snps_hdmirx_cec.h         |   44 +
>>  10 files changed, 3475 insertions(+)
>>  create mode 100644 drivers/media/platform/synopsys/Kconfig
>>  create mode 100644 drivers/media/platform/synopsys/Makefile
>>  create mode 100644 drivers/media/platform/synopsys/hdmirx/Kconfig
>>  create mode 100644 drivers/media/platform/synopsys/hdmirx/Makefile
>>  create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
>>  create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.h
>>  create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx_cec.c
>>  create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx_cec.h
>>
> 
> <snip>
> 
>> +static ssize_t
>> +hdmirx_debugfs_if_read(u32 type, void *priv, struct file *filp,
>> +		       char __user *ubuf, size_t count, loff_t *ppos)
>> +{
>> +	struct snps_hdmirx_dev *hdmirx_dev = priv;
>> +	u8 aviif[3 + 7 * 4];
>> +	int len;
>> +
>> +	if (type != V4L2_DEBUGFS_IF_AVI)
>> +		return 0;
>> +
>> +	hdmirx_read_avi_infoframe(hdmirx_dev, aviif);
>> +
>> +	len = simple_read_from_buffer(ubuf, count, ppos,
>> +				      aviif, ARRAY_SIZE(aviif));
>> +
>> +	return len < 0 ? 0 : len;
>> +}
> 
> Have you tested this with 'edid-decode -c -I /path/to/avi'? Also test that it is
> empty if there is no AVI InfoFrame (e.g. when there is no incoming video). I don't see
> a test for that in the code.
> 
> I also see no sanity check regarding the length of the InfoFrame, it just outputs
> the full array, meaning you get padding as well since the AVI InfoFrame is smaller
> than ARRAY_SIZE(aviif). In fact, edid-decode will fail about that if the -c option
> is used.
> 
> See tc358743_debugfs_if_read of how this is typically handled.

I've tested with 'edid-decode -I /path/to/avi', including the empty AVI
InfoFrame. But without the '-c option'. I'd expect that debugfs should
provide a full-sized raw InfoFrame data, rather than a parsed version.
The parsed data isn't much useful for debugging purposes, IMO. I
intentionally removed the size check that tc358743_debugfs_if_read does
because it appeared wrong to me. Will re-check with '-c option', thanks!

-- 
Best regards,
Dmitry

