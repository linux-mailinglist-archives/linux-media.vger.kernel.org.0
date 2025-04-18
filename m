Return-Path: <linux-media+bounces-30557-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99144A93A12
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 17:47:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B02ED4616BF
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 15:47:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDA18214227;
	Fri, 18 Apr 2025 15:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="NvHUlHsw"
X-Original-To: linux-media@vger.kernel.org
Received: from ixit.cz (ip-89-177-23-149.bb.vodafone.cz [89.177.23.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E162F433C4;
	Fri, 18 Apr 2025 15:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.177.23.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744991237; cv=none; b=KbUnGpbaronpVdRqCo+Ac1GBiipblt+9J/SB7zBqS01X8ZmnGmlSdWNVbboLF+xzCfamXMUrCCB+0VOhlodfPyRMWM44GFdDlaTiF/bxJXeGNKebmWNi90JIsmW5MVhlH3xtAqKqEWhLpyj+jEpVokJQ8A6ldU9o7V90Vzz7mdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744991237; c=relaxed/simple;
	bh=ljtZdhVx1NWC3HJMyyyutP+jGnQR0uETb3O+HtvTPj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ks3gCd4ZcHkNdXhrGHMU/SELWpbX9mnvC8HYFmgqev7TaIBTLSTDKtwDBRlxnFb6h9W1X5A06NCWTjTWMNMexJawkcJQLXPfcshvLB7UIe7Qd8T7zUaqv2vaZQNRJBu2QZi1+ushzhF6lUD3uACiHskRQo86mKQgYPBCTNKkKJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=NvHUlHsw; arc=none smtp.client-ip=89.177.23.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Received: from [10.0.0.185] (unknown [10.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id CBCA2166DE1;
	Fri, 18 Apr 2025 17:47:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1744991229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Bo6UctOCByawq/NUEF4WT0SFikMlGprjPQI+knN6Nhc=;
	b=NvHUlHswA1YUpiAW4VANqoxbrkNOXcBH7voyLT8/P4+45V7V4b1szQgJ5BK9h6g80v+/+I
	f+npHFBwbhlSnTD5VEvKEGQIVoZP21PGIynOEZN+5U4sQsRwV+CbiQ4KVq2nbfxWi2Otpq
	AOTUbqbanHBUCjl1zg5vxSM7LTFDo1c=
Message-ID: <3947c142-2b6f-4e12-9424-7593865af7fe@ixit.cz>
Date: Fri, 18 Apr 2025 17:47:09 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/9] platform/x86: int3472: Add handshake pin support
To: Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>
Cc: Dan Scally <djrscally@gmail.com>, Alan Stern <stern@rowland.harvard.edu>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Hao Yao <hao.yao@intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, Duane <duanek@chorus.net>,
 platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
References: <20250417111337.38142-1-hdegoede@redhat.com>
Content-Language: en-US
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 xsFNBF5v1x4BEADS3EddwsNsvVAI1XF8uQKbdYPY/GhjaSLziwVnbwv5BGwqB1tfXoHnccoA
 9kTgKAbiXG/CiZFhD6l4WCIskQDKzyQN3JhCUIxh16Xyw0lECI7iqoW9LmMoN1dNKcUmCO9g
 lZxQaOl+1bY/7ttd7DapLh9rmBXJ2lKiMEaIpUwb/Nw0d7Enp4Jy2TpkhPywIpUn8CoJCv3/
 61qbvI9y5utB/UhfMAUXsaAgwEJyGPAqHlC0YZjaTwOu+YQUE3AFzhCbksq95CwDz4U4gdls
 dmv9tkATfu2OmzERZQ6vJTehK0Pu4l5KmCAzYg42I9Dy4E6b17x6NncKbcByQFOXMtG0qVUk
 F1yeeOQUHwu+8t3ZDMBUhCkRL/juuoqLmyDWKMc0hKNNeZ9BNXgB8fXkRLWEUfgDXsFyEkKp
 NxUy5bDRlivf6XfExnikk5kj9l2gGlNQwqROti/46bfbmlmc/a2GM4k8ZyalHNEAdwtXYSpP
 8JJmlbQ7hNTLkc3HQLRsIocN5th/ur7pPMz1Beyp0gbE9GcOceqmdZQB80vJ01XDyCAihf6l
 AMnzwpXZsjqIqH9r7T7tM6tVEVbPSwPt4eZYXSoJijEBC/43TBbmxDX+5+3txRaSCRQrG9dY
 k3mMGM3xJLCps2KnaqMcgUnvb1KdTgEFUZQaItw7HyRd6RppewARAQABzSBEYXZpZCBIZWlk
 ZWxiZXJnIDxkYXZpZEBpeGl0LmN6PsLBlAQTAQgAPgIbAwULCQgHAgYVCgkICwIEFgIDAQIe
 AQIXgBYhBNd6Cc/u3Cu9U6cEdGACP8TTSSByBQJl+KksBQkPDaAOAAoJEGACP8TTSSBy6IAQ
 AMqFqVi9LLxCEcUWBn82ssQGiVSDniKpFE/tp7lMXflwhjD5xoftoWOmMYkiWE86t5x5Fsp7
 afALx7SEDz599F1K1bLnaga+budu55JEAYGudD2WwpLJ0kPzRhqBwGFIx8k6F+goZJzxPDsf
 loAtXQE62UvEKa4KRRcZmF0GGoRsgA7vE7OnV8LMeocdD3eb2CuXLzauHAfdvqF50IfPH/sE
 jbzROiAZU+WgrwU946aOzrN8jVU+Cy8XAccGAZxsmPBfhTY5f2VN1IqvfaRdkKKlmWVJWGw+
 ycFpAEJKFRdfcc5PSjUJcALn5C+hxzL2hBpIZJdfdfStn+DWHXNgBeRDiZj1x6vvyaC43RAb
 VXvRzOQfG4EaMVMIOvBjBA/FtIpb1gtXA42ewhvPnd5RVCqD9YYUxsVpJ9d+XsAy7uib3BsV
 W2idAEsPtoqhVhq8bCUs/G4sC2DdyGZK8MRFDJqciJSUbqA+5z1ZCuE8UOPDpZKiW6H/OuOM
 zDcjh0lOzr4p+/1TSg1PbUh7fQ+nbMuiT044sC1lLtJK0+Zyn0GwhR82oNM4fldNsaHRW42w
 QGD35+eNo5Pvb3We5XRMlBdhFnj7Siggp4J8/PJ6MJvRyC+RIJPGtbdMB2/RxWunFLn87e5w
 UgwR9jPMHAstuTR1yR23c4SIYoQ2fzkrRzuazsFNBF5v1x4BEADnlrbta2WL87BlEOotZUh0
 zXANMrNV15WxexsirLetfqbs0AGCaTRNj+uWlTUDJRXOVIwzmF76Us3I2796+Od2ocNpLheZ
 7EIkq8budtLVd1c06qJ+GMraz51zfgSIazVInNMPk9T6fz0lembji5yEcNPNNBA4sHiFmXfo
 IhepHFOBApjS0CiOPqowYxSTPe/DLcJ/LDwWpTi37doKPhBwlHev1BwVCbrLEIFjY0MLM0aT
 jiBBlyLJaTqvE48gblonu2SGaNmGtkC3VoQUQFcVYDXtlL9CVbNo7BAt5gwPcNqEqkUL60Jh
 FtvVSKyQh6gn7HHsyMtgltjZ3NKjv8S3yQd7zxvCn79tCKwoeNevsvoMq/bzlKxc9QiKaRPO
 aDj3FtW7R/3XoKJBY8Hckyug6uc2qYWRpnuXc0as6S0wfek6gauExUttBKrtSbPPHiuTeNHt
 NsT4+dyvaJtQKPBTbPHkXpTO8e1+YAg7kPj3aKFToE/dakIh8iqUHLNxywDAamRVn8Ha67WO
 AEAA3iklJ49QQk2ZyS1RJ2Ul28ePFDZ3QSr9LoJiOBZv9XkbhXS164iRB7rBZk6ZRVgCz3V6
 hhhjkipYvpJ/fpjXNsVL8jvel1mYNf0a46T4QQDQx4KQj0zXJbC2fFikAtu1AULktF4iEXEI
 rSjFoqhd4euZ+QARAQABwsF8BBgBCAAmAhsMFiEE13oJz+7cK71TpwR0YAI/xNNJIHIFAmX4
 qVAFCQ8NoDIACgkQYAI/xNNJIHKN4A/+Ine2Ii7JiuGITjJkcV6pgKlfwYdEs4eFD1pTRb/K
 5dprUz3QSLP41u9OJQ23HnESMvn31UENk9ffebNoW7WxZ/8cTQY0JY/cgTTrlNXtyAlGbR3/
 3Q/VBJptf04Er7I6TaKAmqWzdVeKTw33LljpkHp02vrbOdylb4JQG/SginLV9purGAFptYRO
 8JNa2J4FAQtQTrfOUjulOWMxy7XRkqK3QqLcPW79/CFn7q1yxamPkpoXUJq9/fVjlhk7P+da
 NYQpe4WQQnktBY29SkFnvfIAwqIVU8ix5Oz8rghuCcAdR7lEJ7hCX9bR0EE05FOXdZy5FWL9
 GHvFa/Opkq3DPmFl/0nt4HJqq1Nwrr+WR6d0414oo1n2hPEllge/6iD3ZYwptTvOFKEw/v0A
 yqOoYSiKX9F7Ko7QO+VnYeVDsDDevKic2T/4GDpcSVd9ipiKxCQvUAzKUH7RUpqDTa+rYurm
 zRKcgRumz2Tc1ouHj6qINlzEe3a5ldctIn/dvR1l2Ko7GBTG+VGp9U5NOAEkGpxHG9yg6eeY
 fFYnMme51H/HKiyUlFiE3yd5LSmv8Dhbf+vsI4x6BOOOq4Iyop/Exavj1owGxW0hpdUGcCl1
 ovlwVPO/6l/XLAmSGwdnGqok5eGZQzSst0tj9RC9O0dXO1TZocOsf0tJ8dR2egX4kxM=
In-Reply-To: <20250417111337.38142-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

For the series,

Tested-by: David Heidelberg <david@ixit.cz>  # Dell Latitude 9440

Thank you!
David

On 17/04/2025 13:13, Hans de Goede wrote:
> Hi All,
> 
> New Intel Meteor Lake based laptops with IPU6 cameras have a new type 0x12
> pin defined in the INT3472 sensor companion device which describes
> the sensor's GPIOs.
> 
> This pin is primarily used on designs with a Lattice FPGA chip which is
> capable of running the sensor independently of the main CPU for features
> like presence detection. This pin needs to be driven high to make the FPGA
> run the power-on sequence of the sensor. After driving the pin high
> the FPGA "firmware" needs 25ms to comlpete the power-on sequence.
> 
> This series implements support for this by modelling the handshake GPIO
> as a GPIO driven 'dvdd' regulator with an enable-time of 25 ms, also see:
> 
> https://lore.kernel.org/platform-driver-x86/59f672c3-6d87-4ec7-9b7f-f44fe2cce934@redhat.com/
> 
> Patch   1   Is an unrelated cleanup which I had lying around
> Patches 2-8 Prepare + Implement the handshake GPIO
> Patch   9   Is a small patch adding some extra debugging to GPIO remapping
> 
> Changes in v4:
> - Add Andy's Reviewed-by to a few more patches
> - At static_assert(GPIO_REGULATOR_SUPPLY_MAP_COUNT == 2) since the code
>    assumes that
> - Use unique error messages for power-enable vs handshake
>    skl_int3472_register_regulator() failures
> - Drop setting of constraints.enable_time. enable_time already gets set
>    in struct regulator_desc (missed left-over from an older patch version)
> 
> Changes in v3:
> - Add Andy's Reviewed-by to a few more patches
> - Some comment & commit-message tweaks
> - Add comment explaining value of 12 in GPIO_REGULATOR_NAME_LENGTH
> - Add a comment to int3472/common.h explaining where the 2 ms comes from
> - s/n_regulators/n_regulator_gpios/
> 
> Changes in v2:
> - Add Andy's Reviewed-by to patches 1-3
> - Address Andy's review remarks on patch 5
> - Add 2 Tested-by tags to patch 8/9
> 
> This series applies on top of Torvald's latest master, for testing with
> 6.14 this patch needs to be cherry-picked first:
> https://web.git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/commit/?id=81b251c66bdfe263fb5e7a16838512ddaeed77df
> 
> Regards,
> 
> Hans
> 
> 
> Hans de Goede (9):
>    platform/x86: int3472: Add skl_int3472_register_clock() helper
>    platform/x86: int3472: Stop setting a supply-name for GPIO regulators
>    platform/x86: int3472: Drop unused gpio field from struct
>      int3472_gpio_regulator
>    platform/x86: int3472: Rework AVDD second sensor quirk handling
>    platform/x86: int3472: Make regulator supply name configurable
>    platform/x86: int3472: Avoid GPIO regulator spikes
>    platform/x86: int3472: Prepare for registering more than 1 GPIO
>      regulator
>    platform/x86: int3472: Add handshake pin support
>    platform/x86: int3472: Debug log when remapping pins
> 
>   drivers/platform/x86/intel/int3472/Makefile   |   3 +-
>   .../x86/intel/int3472/clk_and_regulator.c     | 167 ++++++------------
>   drivers/platform/x86/intel/int3472/common.h   |  57 ++++--
>   drivers/platform/x86/intel/int3472/discrete.c |  41 ++++-
>   .../x86/intel/int3472/discrete_quirks.c       |  22 +++
>   5 files changed, 158 insertions(+), 132 deletions(-)
>   create mode 100644 drivers/platform/x86/intel/int3472/discrete_quirks.c
> 

-- 
David Heidelberg


