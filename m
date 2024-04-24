Return-Path: <linux-media+bounces-10068-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCD58B0FCA
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 18:29:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56092B28BBA
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 16:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E398B16ABC6;
	Wed, 24 Apr 2024 16:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="JL05vLpb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CDC16078B
	for <linux-media@vger.kernel.org>; Wed, 24 Apr 2024 16:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713976123; cv=none; b=PtIUGufujWyu4t9VnwN/MBcLb3GP6eqwlQKsI0o5Rd831V4eUbbywLvO5Ieq8LFVJUuI8e8OD/1KgyoHDOr7LkPw4nw/0cGIj5qvitir1N1Eu6RB9HLHCZ2a55hOZ68S4cHVvXs1DThohxi/cjtIf9yILqzZ2TVm4noKhnxvB8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713976123; c=relaxed/simple;
	bh=ZLhJChhy65WZ4UHa5OtTbsbMDLrgqRoh65LzI/BlnKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RSWZrIOdg5tA12WsEbNY7Ff7yL/gm5y9f7y+fR3wynI1p3wCaZPuUT2m194Yt7XVgNxrCvqc2BscSpakFu5BkkufghoAP3q4Bm3qZc0jMohmQk/nF8dSaSkg78wiJh6IMf7zbnHK5hXZc73hdpm5HTD55wKcNJC1l4Qg9qPW7KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=JL05vLpb; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3c70a55988dso70444b6e.0
        for <linux-media@vger.kernel.org>; Wed, 24 Apr 2024 09:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1713976120; x=1714580920; darn=vger.kernel.org;
        h=in-reply-to:autocrypt:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dxfRnZR5WUKQK5PyE/QeYqI3oZe0BnahzbSq9aRg9vM=;
        b=JL05vLpbZqR4m+49FNQXxPEY/GeWyXIG9Yjci3hzqjx+H1e7RYr5BWVvr1WM0NLg1K
         4gjD9NsDYJkPSqCtHgv6uiBsJ8pM8i9jbXBZYaADQLvFaqKvlV0UHF59HqBI7R0tfh+I
         WHODOCyv/YIv3qdJJ3kBlQ4l38onhmTm2pc0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713976120; x=1714580920;
        h=in-reply-to:autocrypt:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dxfRnZR5WUKQK5PyE/QeYqI3oZe0BnahzbSq9aRg9vM=;
        b=rzzpttjz+9+m5tq/6RaVp8agiRtntITqunWrY9x2ipsqlW8FhxDGnnb06p9KE5Hzfc
         Ahnh8JDS7Nw0GR79Ut9Vzlag0UvH5PEqo4ZzMg/yvFJH2Ix/PuwnlU5Y78TPgjewUamm
         HyxMRE4ljm45lGwzQLVsYlfXS4lVNcvf6EUjaqOI21riNpQBBGPEOD/yWlgdzKnEWAtN
         fQBE8owXoS7dOF+gHE/waeBRKGnwecpPUe/i5jR7WHLk0oh9qlLZW/faI4FLFchswcgP
         wlZpOFhbFt3walZbHrxLW3pPCUj9Tl6bBv19j+9ru00MT5mSUokLn7+88PwB0SZ0dI4p
         bCHg==
X-Forwarded-Encrypted: i=1; AJvYcCX8DV44aO/mnhaURXVDsqiPJHsVtL+Kclr/TcdNJuWY2uPGP7VnNd/ctp8dgb/HpcTuS54axe2096kP+JrE82qpF+KEFtmqN8RBYII=
X-Gm-Message-State: AOJu0YymWcxCBZlAdLeQZVaVkLyqVmq197+v78YBGnyH+07DO2Qe1uJ9
	dn4snPYJZ/EAMbj6JXpuuPHPafZMLVjR9uSQ/bLyNf/AHjAcl7eUoCGh9qD6+g==
X-Google-Smtp-Source: AGHT+IHVG0KBO73OfJrbTiK/ywT64vvvFwwvvupbWo0DHEIyDspEV/msPZBEB6jX6FCQt/GpmzVO5A==
X-Received: by 2002:a05:6808:278f:b0:3c8:42c9:3232 with SMTP id es15-20020a056808278f00b003c842c93232mr2784727oib.4.1713976119877;
        Wed, 24 Apr 2024 09:28:39 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id p7-20020a05620a056700b0078d3b9139edsm6288532qkp.97.2024.04.24.09.28.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Apr 2024 09:28:39 -0700 (PDT)
Message-ID: <396eaa7c-4e7b-43cf-aec4-c1611a405ef7@broadcom.com>
Date: Wed, 24 Apr 2024 09:28:36 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 0/5] media: Add driver for the Raspberry Pi <5 CSI-2
 receiver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Plowman <david.plowman@raspberrypi.com>,
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Naushir Patuck <naush@raspberrypi.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, kernel-list@raspberrypi.com,
 linux-rpi-kernel@lists.infradead.org, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
References: <20240424153542.32503-1-laurent.pinchart@ideasonboard.com>
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20240424153542.32503-1-laurent.pinchart@ideasonboard.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000ceb26f0616da2900"

--000000000000ceb26f0616da2900
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Laurent,

On 4/24/24 08:35, Laurent Pinchart wrote:
> Hello everybody,
> 
> This patch series adds a new driver for the BCM2835 (and derivative)
> CCP2/CSI2 camera interface named Unicam. This IP core is found in the
> VC4-based Raspberry Pi, namely the Pi Zero, Pi 3 and Pi 4.
> 
> Camera support for Raspberry Pi 4 currently relies on a downstream
> Unicam driver that lives in the Raspberry Pi kernel tree ([1]). The
> driver uses the V4L2 API, but works around the lack of features in V4L2
> to properly support sensor embedded data. Since the Unicam driver
> development by Raspberry Pi, some of those features have been merged in
> the kernel (namely the V4L2 streams API) or are being developed (namely
> generic metadata formats and subdev internal pads), with patches posted
> for review on the linux-media mailing list ([2], [3]).
> 
> This new upstream driver is based on the downstream code, extensively
> reworked to use the new V4L2 APIs.
> 
> The series is based on the generic metadata ([2]) and internal pads
> ([3], v9) APIs. It can be found in my tree in [4]. Testing it requires
> extra branches, which are also pushed to the same tree, and organized as
> follows:
> 
> - rpi/v6.9/base: The mainline tag that all the work is based on
>    (currently v6.9-rc2)
> - rpi/v6.9/backports: DT integration fixes for bcm238x, backported from
>    linux-next
> - rpi/v6.9/isp/v2: The ISP driver, which is getting upstreamed
>    separately
> - rpi/v6.9/metadata/v10/base: The V4L2 embedded data patches
> - rpi/v6.9/metadata/v10/sensors: The V4L2 internal pads patches
> - rpi/v6.9/unicam/next: The Unicam driver, based on the
>    rpi/v6.9/metadata/v10/base branch that it depends on
> - rpi/v6.9/imx219: Embedded data support for the imx219 driver, based on
>    the rpi/v6.9/metadata/v10/sensors branch that it depends on
> - rpi/v6.9/merge: A merge of the backports, isp/v2, unicam/next and
>    imx219 branches
> - rpi/v6.9/overlays: A sample overlay for the imx219 camera sensor
>    connected to a Raspberry Pi 4
> 
> The series starts with two patches that add new V4L2 pixel formats (1/5
> and 2/5), followed by the Unicam DT bindings (3/5) and driver (4/5).
> Finally, it ends with DT integration for the Unicam devices (5/5).
> 
> Compared to v10, I have rebased the patches on top of the latest version
> of the generic metadata series ([2]), to prepare for a merge in
> (hopefully) v6.10.
> 
> The patches have been tested on a Raspberry Pi 4 using an IMX219 camera
> module (the Raspberry Pi camera v2), with libcamera. Updates are needed
> to libcamera to use the new V4L2 APIs, patches have been posted to [5].
> For manual testing with media-ctl, corresponding API updates to
> v4l-utils have been posted to the linux-media mailing list ([6]) and
> pushed to [7].
> 
> With this version I believe we are ready to merge the driver upstream.
> Sensor driver changes, which require more work, with their corresponding
> V4L2 API extensions, have been split out. The Unicam driver now depends
> only on the core part of the embedded data API extensions, which I
> believe is ready. Corresponding updates for v4l-utils have been
> developed and submitted. This series, along with the libcamera support,
> helps validating the new kernel APIs.
> 
> Sakari, please feel free to apply this on top of your generic metadata
> branch and include it in your pull request for v6.10.

To miminize conflicts, I believe I should be taking patch #5 via the ARM 
SoC pull request since I already have merged patches there that are 
pre-requisites for patch #5 to apply. Let me know if that does not work.

> 
> Below you will find the mandatory v4l2-compliance reports. It requires
> the v4l-utils updates from [7]. There is a total of 4 warnings, all
> related to the imx219 driver. They will be addressed separately, as part
> of the effort to add embedded data support to the imx219 driver.
> 
> [1] https://github.com/raspberrypi/linux/tree/rpi-6.1.y/drivers/media/platform/bcm2835
> [3] https://lore.kernel.org/linux-media/20240424122237.875000-1-sakari.ailus@linux.intel.com/
> [4] https://lore.kernel.org/linux-media/20240416193319.778192-1-sakari.ailus@linux.intel.com/
> [4] https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git/log/?h=rpi/v6.9/unicam/next
> [5] https://lists.libcamera.org/pipermail/libcamera-devel/2024-March/040711.html
> [6] https://lore.kernel.org/linux-media/20240424152230.31923-1-laurent.pinchart@ideasonboard.com/
> [7] https://git.linuxtv.org/pinchartl/v4l-utils.git/log/?h=metadata
> 
> v4l2-compliance 1.27.0-5195, 64 bits, 64-bit time_t
> v4l2-compliance SHA: 9356d44374db 2024-04-24 11:58:36
> 
> Compliance test for unicam device /dev/media0:
> 
> Media Driver Info:
> 	Driver name      : unicam
> 	Model            : unicam
> 	Serial           :
> 	Bus info         : platform:fe801000.csi
> 	Media version    : 6.9.0
> 	Hardware revision: 0x00000000 (0)
> 	Driver version   : 6.9.0
> 
> Required ioctls:
> 	test MEDIA_IOC_DEVICE_INFO: OK
> 	test invalid ioctls: OK
> 
> Allow for multiple opens:
> 	test second /dev/media0 open: OK
> 	test MEDIA_IOC_DEVICE_INFO: OK
> 	test for unlimited opens: OK
> 
> Media Controller ioctls:
> 	test MEDIA_IOC_G_TOPOLOGY: OK
> 	Entities: 4 Interfaces: 4 Pads: 8 Links: 7
> 	test MEDIA_IOC_ENUM_ENTITIES/LINKS: OK
> 	test MEDIA_IOC_SETUP_LINK: OK
> 
> Total for unicam device /dev/media0: 8, Succeeded: 8, Failed: 0, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for unicam device /dev/video0:
> 
> Driver Info:
> 	Driver name      : unicam
> 	Card type        : unicam
> 	Bus info         : platform:fe801000.csi
> 	Driver version   : 6.9.0
> 	Capabilities     : 0xa4a00001
> 		Video Capture
> 		Metadata Capture
> 		I/O MC
> 		Streaming
> 		Extended Pix Format
> 		Device Capabilities
> 	Device Caps      : 0x24200001
> 		Video Capture
> 		I/O MC
> 		Streaming
> 		Extended Pix Format
> Media Driver Info:
> 	Driver name      : unicam
> 	Model            : unicam
> 	Serial           :
> 	Bus info         : platform:fe801000.csi
> 	Media version    : 6.9.0
> 	Hardware revision: 0x00000000 (0)
> 	Driver version   : 6.9.0
> Interface Info:
> 	ID               : 0x0300000d
> 	Type             : V4L Video
> Entity Info:
> 	ID               : 0x0000000b (11)
> 	Name             : unicam-image
> 	Function         : V4L2 I/O
> 	Flags            : default
> 	Pad 0x0100000c   : 0: Sink
> 	  Link 0x0200000f: from remote pad 0x1000003 of entity 'unicam' (Video Interface Bridge): Data, Enabled, Immutable
> 
> Required ioctls:
> 	test MC information (see 'Media Driver Info' above): OK
> 	test VIDIOC_QUERYCAP: OK
> 	test invalid ioctls: OK
> 
> Allow for multiple opens:
> 	test second /dev/video0 open: OK
> 	test VIDIOC_QUERYCAP: OK
> 	test VIDIOC_G/S_PRIORITY: OK
> 	test for unlimited opens: OK
> 
> Debug ioctls:
> 	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> 	test VIDIOC_LOG_STATUS: OK
> 
> Input ioctls:
> 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMINPUT: OK
> 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
> 	Inputs: 1 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
> 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> 	Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
> 	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> 	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> 	test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls (Input 0):
> 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
> 	test VIDIOC_QUERYCTRL: OK (Not Supported)
> 	test VIDIOC_G/S_CTRL: OK (Not Supported)
> 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
> 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
> 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> 	Standard Controls: 0 Private Controls: 0
> 
> Format ioctls (Input 0):
> 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> 	test VIDIOC_G/S_PARM: OK (Not Supported)
> 	test VIDIOC_G_FBUF: OK (Not Supported)
> 	test VIDIOC_G_FMT: OK
> 	test VIDIOC_TRY_FMT: OK
> 	test VIDIOC_S_FMT: OK
> 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> 	test Cropping: OK (Not Supported)
> 	test Composing: OK (Not Supported)
> 	test Scaling: OK
> 
> Codec ioctls (Input 0):
> 	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> 	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls (Input 0):
> 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> 	test CREATE_BUFS maximum buffers: OK
> 	test VIDIOC_REMOVE_BUFS: OK
> 	test VIDIOC_EXPBUF: OK
> 	test Requests: OK (Not Supported)
> 
> Total for unicam device /dev/video0: 48, Succeeded: 48, Failed: 0, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for unicam device /dev/video1:
> 
> Driver Info:
> 	Driver name      : unicam
> 	Card type        : unicam
> 	Bus info         : platform:fe801000.csi
> 	Driver version   : 6.9.0
> 	Capabilities     : 0xa4a00001
> 		Video Capture
> 		Metadata Capture
> 		I/O MC
> 		Streaming
> 		Extended Pix Format
> 		Device Capabilities
> 	Device Caps      : 0x24a00000
> 		Metadata Capture
> 		I/O MC
> 		Streaming
> 		Extended Pix Format
> Media Driver Info:
> 	Driver name      : unicam
> 	Model            : unicam
> 	Serial           :
> 	Bus info         : platform:fe801000.csi
> 	Media version    : 6.9.0
> 	Hardware revision: 0x00000000 (0)
> 	Driver version   : 6.9.0
> Interface Info:
> 	ID               : 0x03000013
> 	Type             : V4L Video
> Entity Info:
> 	ID               : 0x00000011 (17)
> 	Name             : unicam-embedded
> 	Function         : V4L2 I/O
> 	Pad 0x01000012   : 0: Sink
> 	  Link 0x02000015: from remote pad 0x1000004 of entity 'unicam' (Video Interface Bridge): Data, Enabled, Immutable
> 
> Required ioctls:
> 	test MC information (see 'Media Driver Info' above): OK
> 	test VIDIOC_QUERYCAP: OK
> 	test invalid ioctls: OK
> 
> Allow for multiple opens:
> 	test second /dev/video1 open: OK
> 	test VIDIOC_QUERYCAP: OK
> 	test VIDIOC_G/S_PRIORITY: OK
> 	test for unlimited opens: OK
> 
> Debug ioctls:
> 	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> 	test VIDIOC_LOG_STATUS: OK
> 
> Input ioctls:
> 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMINPUT: OK
> 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
> 	Inputs: 1 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
> 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> 	Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
> 	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> 	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> 	test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls (Input 0):
> 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
> 	test VIDIOC_QUERYCTRL: OK (Not Supported)
> 	test VIDIOC_G/S_CTRL: OK (Not Supported)
> 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
> 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
> 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> 	Standard Controls: 0 Private Controls: 0
> 
> Format ioctls (Input 0):
> 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> 	test VIDIOC_G/S_PARM: OK (Not Supported)
> 	test VIDIOC_G_FBUF: OK (Not Supported)
> 	test VIDIOC_G_FMT: OK
> 	test VIDIOC_TRY_FMT: OK
> 	test VIDIOC_S_FMT: OK
> 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> 	test Cropping: OK (Not Supported)
> 	test Composing: OK (Not Supported)
> 	test Scaling: OK (Not Supported)
> 
> Codec ioctls (Input 0):
> 	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> 	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls (Input 0):
> 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> 	test CREATE_BUFS maximum buffers: OK
> 	test VIDIOC_REMOVE_BUFS: OK
> 	test VIDIOC_EXPBUF: OK
> 	test Requests: OK (Not Supported)
> 
> Total for unicam device /dev/video1: 48, Succeeded: 48, Failed: 0, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for unicam device /dev/v4l-subdev0:
> 
> Driver Info:
> 	Driver version   : 6.9.0
> 	Capabilities     : 0x00000002
> 		Streams Support
> 	Client Capabilities: 0x0000000000000003
> streams interval-uses-which Media Driver Info:
> 	Driver name      : unicam
> 	Model            : unicam
> 	Serial           :
> 	Bus info         : platform:fe801000.csi
> 	Media version    : 6.9.0
> 	Hardware revision: 0x00000000 (0)
> 	Driver version   : 6.9.0
> Interface Info:
> 	ID               : 0x03000017
> 	Type             : V4L Sub-Device
> Entity Info:
> 	ID               : 0x00000001 (1)
> 	Name             : unicam
> 	Function         : Video Interface Bridge
> 	Pad 0x01000002   : 0: Sink
> 	  Link 0x02000009: from remote pad 0x1000006 of entity 'imx219 5-0010' (Camera Sensor): Data, Enabled, Immutable
> 	Pad 0x01000003   : 1: Source
> 	  Link 0x0200000f: to remote pad 0x100000c of entity 'unicam-image' (V4L2 I/O): Data, Enabled, Immutable
> 	Pad 0x01000004   : 2: Source
> 	  Link 0x02000015: to remote pad 0x1000012 of entity 'unicam-embedded' (V4L2 I/O): Data, Enabled, Immutable
> 
> Required ioctls:
> 	test MC information (see 'Media Driver Info' above): OK
> 	test VIDIOC_SUDBEV_QUERYCAP: OK
> 	test invalid ioctls: OK
> 
> Allow for multiple opens:
> 	test second /dev/v4l-subdev0 open: OK
> 	test VIDIOC_SUBDEV_QUERYCAP: OK
> 	test for unlimited opens: OK
> 
> Debug ioctls:
> 	test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
> 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
> 	Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
> 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> 	Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
> 	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> 	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> 	test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Sub-Device routing ioctls:
> 	test Try VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: OK
> 	test Active VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: OK
> 
> Sub-Device ioctls (Sink Pad 0):
> 	Try Stream 0
> 	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
> 	test Try VIDIOC_SUBDEV_G/S_FMT: OK
> 	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> 	Active Stream 0
> 	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
> 	test Active VIDIOC_SUBDEV_G/S_FMT: OK
> 	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> 	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
> 
> Sub-Device ioctls (Source Pad 1):
> 	Try Stream 0
> 	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
> 	test Try VIDIOC_SUBDEV_G/S_FMT: OK
> 	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> 	Active Stream 0
> 	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
> 	test Active VIDIOC_SUBDEV_G/S_FMT: OK
> 	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> 	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
> 
> Sub-Device ioctls (Source Pad 2):
> 
> Control ioctls:
> 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
> 	test VIDIOC_QUERYCTRL: OK (Not Supported)
> 	test VIDIOC_G/S_CTRL: OK (Not Supported)
> 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
> 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
> 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> 	Standard Controls: 0 Private Controls: 0
> 
> Format ioctls:
> 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
> 	test VIDIOC_G/S_PARM: OK (Not Supported)
> 	test VIDIOC_G_FBUF: OK (Not Supported)
> 	test VIDIOC_G_FMT: OK (Not Supported)
> 	test VIDIOC_TRY_FMT: OK (Not Supported)
> 	test VIDIOC_S_FMT: OK (Not Supported)
> 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> 	test Cropping: OK (Not Supported)
> 	test Composing: OK (Not Supported)
> 	test Scaling: OK (Not Supported)
> 
> Codec ioctls:
> 	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> 	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls:
> 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
> 	test CREATE_BUFS maximum buffers: OK
> 	test VIDIOC_REMOVE_BUFS: OK
> 	test VIDIOC_EXPBUF: OK (Not Supported)
> 	test Requests: OK (Not Supported)
> 
> Total for unicam device /dev/v4l-subdev0: 62, Succeeded: 62, Failed: 0, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for unicam device /dev/v4l-subdev1:
> 
> Driver Info:
> 	Driver version   : 6.9.0
> 	Capabilities     : 0x00000002
> 		Streams Support
> 	Client Capabilities: 0x0000000000000003
> streams interval-uses-which Media Driver Info:
> 	Driver name      : unicam
> 	Model            : unicam
> 	Serial           :
> 	Bus info         : platform:fe801000.csi
> 	Media version    : 6.9.0
> 	Hardware revision: 0x00000000 (0)
> 	Driver version   : 6.9.0
> Interface Info:
> 	ID               : 0x03000019
> 	Type             : V4L Sub-Device
> Entity Info:
> 	ID               : 0x00000005 (5)
> 	Name             : imx219 5-0010
> 	Function         : Camera Sensor
> 	Pad 0x01000006   : 0: Source
> 	  Link 0x02000009: to remote pad 0x1000002 of entity 'unicam' (Video Interface Bridge): Data, Enabled, Immutable
> 	Pad 0x01000007   : 1: Sink, 00000008
> 	Pad 0x01000008   : 2: Sink, 00000008
> 
> Required ioctls:
> 	test MC information (see 'Media Driver Info' above): OK
> 	test VIDIOC_SUDBEV_QUERYCAP: OK
> 	test invalid ioctls: OK
> 
> Allow for multiple opens:
> 	test second /dev/v4l-subdev1 open: OK
> 	test VIDIOC_SUBDEV_QUERYCAP: OK
> 	test for unlimited opens: OK
> 
> Debug ioctls:
> 	test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
> 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
> 	Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
> 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> 	Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
> 	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> 	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> 	test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Sub-Device routing ioctls:
> 	test Try VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: OK
> 	test Active VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: OK
> 
> Sub-Device ioctls (Source Pad 0):
> 	Try Stream 0
> 	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
> 	test Try VIDIOC_SUBDEV_G/S_FMT: OK
> 		warn: v4l2-test-subdevs.cpp(566): VIDIOC_SUBDEV_G_SELECTION is supported for target 0 but not VIDIOC_SUBDEV_S_SELECTION
> 	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
> 	Try Stream 1
> 	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
> 	test Try VIDIOC_SUBDEV_G/S_FMT: OK
> 	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> 	Active Stream 0
> 	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
> 	test Active VIDIOC_SUBDEV_G/S_FMT: OK
> 		warn: v4l2-test-subdevs.cpp(566): VIDIOC_SUBDEV_G_SELECTION is supported for target 0 but not VIDIOC_SUBDEV_S_SELECTION
> 	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
> 	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
> 	Active Stream 1
> 	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
> 	test Active VIDIOC_SUBDEV_G/S_FMT: OK
> 	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> 	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
> 
> Sub-Device ioctls (Sink Pad 1):
> 	Try Stream 0
> 	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
> 	test Try VIDIOC_SUBDEV_G/S_FMT: OK
> 		warn: v4l2-test-subdevs.cpp(566): VIDIOC_SUBDEV_G_SELECTION is supported for target 0 but not VIDIOC_SUBDEV_S_SELECTION
> 	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
> 	Active Stream 0
> 	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
> 	test Active VIDIOC_SUBDEV_G/S_FMT: OK
> 		warn: v4l2-test-subdevs.cpp(566): VIDIOC_SUBDEV_G_SELECTION is supported for target 0 but not VIDIOC_SUBDEV_S_SELECTION
> 	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
> 	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
> 
> Sub-Device ioctls (Sink Pad 2):
> 	Try Stream 0
> 	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
> 	test Try VIDIOC_SUBDEV_G/S_FMT: OK
> 	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> 	Active Stream 0
> 	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
> 	test Active VIDIOC_SUBDEV_G/S_FMT: OK
> 	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> 	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
> 
> Control ioctls:
> 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> 	test VIDIOC_QUERYCTRL: OK
> 	test VIDIOC_G/S_CTRL: OK
> 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
> 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
> 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> 	Standard Controls: 20 Private Controls: 0
> 
> Format ioctls:
> 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
> 	test VIDIOC_G/S_PARM: OK (Not Supported)
> 	test VIDIOC_G_FBUF: OK (Not Supported)
> 	test VIDIOC_G_FMT: OK (Not Supported)
> 	test VIDIOC_TRY_FMT: OK (Not Supported)
> 	test VIDIOC_S_FMT: OK (Not Supported)
> 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> 	test Cropping: OK (Not Supported)
> 	test Composing: OK (Not Supported)
> 	test Scaling: OK (Not Supported)
> 
> Codec ioctls:
> 	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> 	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls:
> 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
> 	test CREATE_BUFS maximum buffers: OK
> 	test VIDIOC_REMOVE_BUFS: OK
> 	test VIDIOC_EXPBUF: OK (Not Supported)
> 	test Requests: OK (Not Supported)
> 
> Total for unicam device /dev/v4l-subdev1: 76, Succeeded: 76, Failed: 0, Warnings: 4
> 
> Grand Total for unicam device /dev/media0: 242, Succeeded: 242, Failed: 0, Warnings: 4
> 
> 
> Dave Stevenson (2):
>    dt-bindings: media: Add bindings for bcm2835-unicam
>    media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface
> 
> Jean-Michel Hautbois (3):
>    media: v4l: Add V4L2-PIX-FMT-Y12P format
>    media: v4l: Add V4L2-PIX-FMT-Y14P format
>    ARM: dts: bcm2835: Add Unicam CSI nodes
> 
>   .../bindings/media/brcm,bcm2835-unicam.yaml   |  127 +
>   .../media/v4l/pixfmt-yuv-luma.rst             |   48 +
>   MAINTAINERS                                   |    7 +
>   arch/arm/boot/dts/broadcom/bcm2711.dtsi       |    8 +
>   arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi   |   14 +
>   arch/arm/boot/dts/broadcom/bcm283x.dtsi       |   24 +
>   drivers/media/platform/Kconfig                |    1 +
>   drivers/media/platform/Makefile               |    1 +
>   drivers/media/platform/broadcom/Kconfig       |   23 +
>   drivers/media/platform/broadcom/Makefile      |    3 +
>   .../platform/broadcom/bcm2835-unicam-regs.h   |  246 ++
>   .../media/platform/broadcom/bcm2835-unicam.c  | 2741 +++++++++++++++++
>   drivers/media/v4l2-core/v4l2-ioctl.c          |    2 +
>   include/uapi/linux/videodev2.h                |    2 +
>   14 files changed, 3247 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml
>   create mode 100644 drivers/media/platform/broadcom/Kconfig
>   create mode 100644 drivers/media/platform/broadcom/Makefile
>   create mode 100644 drivers/media/platform/broadcom/bcm2835-unicam-regs.h
>   create mode 100644 drivers/media/platform/broadcom/bcm2835-unicam.c
> 
> 
> base-commit: 47120f3da814440058a9823bf9ac3a660b2ce9c0

-- 
Florian


--000000000000ceb26f0616da2900
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
riBJ/K1AFUjRAjFhGV64l++td7dkmnq/X8ET75ti+w1s4FRpFqkD2m7pg5NxdsZphYIXAgMBAAGj
QjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBSP8Et/qC5FJK5N
UPpjmove4t0bvDANBgkqhkiG9w0BAQsFAAOCAQEAS0DbwFCq/sgM7/eWVEVJu5YACUGssxOGhigH
M8pr5nS5ugAtrqQK0/Xx8Q+Kv3NnSoPHRHt44K9ubG8DKY4zOUXDjuS5V2yq/BKW7FPGLeQkbLmU
Y/vcU2hnVj6DuM81IcPJaP7O2sJTqsyQiunwXUaMld16WCgaLx3ezQA3QY/tRG3XUyiXfvNnBB4V
14qWtNPeTCekTBtzc3b0F5nCH3oO4y0IrQocLP88q1UOD5F+NuvDV0m+4S4tfGCLw0FREyOdzvcy
a5QBqJnnLDMfOjsl0oZAzjsshnjJYS8Uuu7bVW/fhO4FCU29KNhyztNiUGUe65KXgzHZs7XKR1g/
XzCCBVgwggRAoAMCAQICDBP8P9hKRVySg3Qv5DANBgkqhkiG9w0BAQsFADBbMQswCQYDVQQGEwJC
RTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTExMC8GA1UEAxMoR2xvYmFsU2lnbiBHQ0MgUjMg
UGVyc29uYWxTaWduIDIgQ0EgMjAyMDAeFw0yMjA5MTAxMjE4MTFaFw0yNTA5MTAxMjE4MTFaMIGW
MQswCQYDVQQGEwJJTjESMBAGA1UECBMJS2FybmF0YWthMRIwEAYDVQQHEwlCYW5nYWxvcmUxFjAU
BgNVBAoTDUJyb2FkY29tIEluYy4xGTAXBgNVBAMTEEZsb3JpYW4gRmFpbmVsbGkxLDAqBgkqhkiG
9w0BCQEWHWZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tMIIBIjANBgkqhkiG9w0BAQEFAAOC
AQ8AMIIBCgKCAQEA+oi3jMmHltY4LMUy8Up5+1zjd1iSgUBXhwCJLj1GJQF+GwP8InemBbk5rjlC
UwbQDeIlOfb8xGqHoQFGSW8p9V1XUw+cthISLkycex0AJ09ufePshLZygRLREU0H4ecNPMejxCte
KdtB4COST4uhBkUCo9BSy1gkl8DJ8j/BQ1KNUx6oYe0CntRag+EnHv9TM9BeXBBLfmMRnWNhvOSk
nSmRX0J3d9/G2A3FIC6WY2XnLW7eAZCQPa1Tz3n2B5BGOxwqhwKLGLNu2SRCPHwOdD6e0drURF7/
Vax85/EqkVnFNlfxtZhS0ugx5gn2pta7bTdBm1IG4TX+A3B1G57rVwIDAQABo4IB3jCCAdowDgYD
VR0PAQH/BAQDAgWgMIGjBggrBgEFBQcBAQSBljCBkzBOBggrBgEFBQcwAoZCaHR0cDovL3NlY3Vy
ZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAuY3J0MEEG
CCsGAQUFBzABhjVodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWdu
MmNhMjAyMDBNBgNVHSAERjBEMEIGCisGAQQBoDIBKAowNDAyBggrBgEFBQcCARYmaHR0cHM6Ly93
d3cuZ2xvYmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIwADBJBgNVHR8EQjBAMD6gPKA6
hjhodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNy
bDAoBgNVHREEITAfgR1mbG9yaWFuLmZhaW5lbGxpQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggr
BgEFBQcDBDAfBgNVHSMEGDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQUUwwfJ6/F
KL0fRdVROal/Lp4lAF0wDQYJKoZIhvcNAQELBQADggEBAKBgfteDc1mChZjKBY4xAplC6uXGyBrZ
kNGap1mHJ+JngGzZCz+dDiHRQKGpXLxkHX0BvEDZLW6LGOJ83ImrW38YMOo3ZYnCYNHA9qDOakiw
2s1RH00JOkO5SkYdwCHj4DB9B7KEnLatJtD8MBorvt+QxTuSh4ze96Jz3kEIoHMvwGFkgObWblsc
3/YcLBmCgaWpZ3Ksev1vJPr5n8riG3/N4on8gO5qinmmr9Y7vGeuf5dmZrYMbnb+yCBalkUmZQwY
NxADYvcRBA0ySL6sZpj8BIIhWiXiuusuBmt2Mak2eEv0xDbovE6Z6hYyl/ZnRadbgK/ClgbY3w+O
AfUXEZ0xggJtMIICaQIBATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52
LXNhMTEwLwYDVQQDEyhHbG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgwT
/D/YSkVckoN0L+QwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIJ0cGStpI9U3o+k9
28Ow13pupD9cxIfn6OPcrK/MW4DrMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcN
AQkFMQ8XDTI0MDQyNDE2Mjg0MFowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZI
AWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEH
MAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQAHytS9LytyAxYF/pYCNOXT1gHynZGs21Kx
V8OWZAwXhEPMUfJsdg503LfOfWTLNu1uflWhzAKCLPzl/5QRQIbCUkLo1gQeQrM2iIdcCVZLvdP2
GOGYIYPnqQw8iIer93R3T4WsrC/Q1N6fCjBPow/LrCX6iQX2C54gscN/QggZDJep+vZrjX3y2Twc
zMO1zWBO4Kgz193VAj3FsN58yHgEKf9jVvm/9boVw4B//YqtfIiqZo5/rjlVr4gViQ7aOYY7TjmQ
AVC3EWOUNNHKcKsKSoOC/x+qsH22jx4olf4s2kdNbYUqGamS3uY/kCmxfjHZJZV6Ca5JNdmilHnK
I6Ie
--000000000000ceb26f0616da2900--

