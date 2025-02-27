Return-Path: <linux-media+bounces-27112-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 798B3A47537
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 06:29:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 686857A2C06
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 05:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD07D2036E4;
	Thu, 27 Feb 2025 05:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="OoBSQrhW"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE131F5857;
	Thu, 27 Feb 2025 05:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740634162; cv=pass; b=UPNOyuAEYMv0Kp6q0VRVmJX55rMfhHBSj2RIQvMnoV2iY2Ys09j/ng0NqIR8VGK1C7hIX5qSbNFHmqPWsudLKJe1A5D31Nq5/WLBzqLqABB0o7qUlu9wUfTWMG/KgHu/nfTkjQuuR+VsidlEWbHi6RoSKwdAwmQv6Uxty7pHgr8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740634162; c=relaxed/simple;
	bh=u6WUzNVe+oGI9QR6zph5HdrXz/+gNvJJi3KrmDx0j4c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SMaSHd1Qxva6Usk6XFp2ziIyK8YJ/mIWuIIHhiTVKuf21iHtEXqTgMcff8exT5EGkY9icpAhGXTuux2NvLJLzP+26tgyrnYAeNiGm8EeesRtqEAjosHxym6SOKqBTK6gKFZcA4kkahZUMnrWXLhapg+XUED+4lOv1QUEHlb4Sgs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=OoBSQrhW; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1740634121; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kGB5TYdGQHvNLua0/kmWtDME+WQqoe1SIhhD1BLc+g7QJGnfq6oxCqXKbzkZSB9u7unEbKEBp5TjEwQdwuvufo2F6vlyZ+2NNgvd37+L/V539zVaD8qwDC8VX8iqx/HYOfB8YiYLOOFb7p7WqjL2U3XENktPH+9l//vEtYnqCOQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740634121; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Sv5NOsfY30eBqvAAr70WQss2GxI0o1NVlCRr5lXEPb0=; 
	b=aA+xuVGDj1Pc5f4LEyN7NXsxtU4iPurKYzK79L0uKcXYaBXETcmfg43UDqzAIuATAXQyZifmjl+Ebh/lCzgne7PDUoydsD6vKjEE6B2yFekL5mcPklKow3zk8pJuQYVSxvNDszIYXZj593P7iikr0ho80OEjJ/0CHoUUEOohQ28=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740634121;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Sv5NOsfY30eBqvAAr70WQss2GxI0o1NVlCRr5lXEPb0=;
	b=OoBSQrhWdMjD4flBgsQDpGxHoyTxzyO1EP1O06t6ewmNWyNnYI9aJw0/6oS8ufb3
	0jOjy93lOfHvPeSUdL7+VPbRd/I1ET8TGmAim19BKDomEOfoR2eeqwEdjiR4ikkY9oY
	4T137HZffA7B6YgGMFhkMkXwNMThHX/p4FgG/KAY=
Received: by mx.zohomail.com with SMTPS id 1740634119692458.0582223925678;
	Wed, 26 Feb 2025 21:28:39 -0800 (PST)
Message-ID: <f0c3a16e-c4a2-4cd9-9afa-a21a975a45c9@collabora.com>
Date: Thu, 27 Feb 2025 08:28:31 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/6] media: platform: synopsys: Add support for HDMI
 input driver
To: Diederik de Haas <didi.debian@cknow.org>,
 Shreeya Patel <shreeya.patel@collabora.com>, Heiko Stuebner
 <heiko@sntech.de>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, jose.abreu@synopsys.com, nelson.costa@synopsys.com,
 shawn.wen@rock-chips.com, nicolas.dufresne@collabora.com,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: kernel@collabora.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Tim Surber <me@timsurber.de>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
References: <20250225183058.607047-1-dmitry.osipenko@collabora.com>
 <20250225183058.607047-4-dmitry.osipenko@collabora.com>
 <D82H4F6J4V4V.2BLHVUVD3BVX9@cknow.org>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <D82H4F6J4V4V.2BLHVUVD3BVX9@cknow.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 2/26/25 18:14, Diederik de Haas wrote:
>> +config VIDEO_SYNOPSYS_HDMIRX_LOAD_DEFAULT_EDID
>> +	bool "Load default EDID"
>> +	depends on VIDEO_SYNOPSYS_HDMIRX
>> +	help
>> +	  Preload default EDID (Extended Display Identification Data).
> I see some value in making explicit what you mean by EDID ...
> 
>> +	  EDID contains information about the capabilities of the display,
>> +	  such as supported resolutions, refresh rates, and audio formats.
> ... I do not think a/this Kconfig needs to explain it.
> 
>> +
>> +	  Enabling this option is recommended for a non-production use-cases.
> My guess is that it could be useful for development/debugging/CI work
> which possibly do not have an actual device (monitor) which provides
> actual EDID data? Is CI work the reason why you (initially) enabled it
> in the defconfig?
> But when you have an actual monitor (=production use-case?), you
> (really) do not want it? Would it be harmless if 'still' enabled?

Disabling this option is only relevant if you're making a commercial
product using this driver. It's a quite widespread issue that HDMI
projectors utilize default EDID that comes from BSP driver they use,
while a rebrand EDID should be used. Keeping this option enabled is
harmless, but you don't want to do it in a product.

For all other use-cases you would want to enable this option, otherwise
driver won't be usable until you will load EDID from userspace.

Hans has strong opinion RE this option and wants to have it disabled by
default.

> Thus a more extensive description what this Kconfig item does and why
> and when I want to enable it or not, seems more useful to me.

Will update and expand the description with more clarification. Thanks
for suggestion.

-- 
Best regards,
Dmitry

