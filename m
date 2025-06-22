Return-Path: <linux-media+bounces-35543-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 022A1AE2F9B
	for <lists+linux-media@lfdr.de>; Sun, 22 Jun 2025 13:45:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 911DD16BFB4
	for <lists+linux-media@lfdr.de>; Sun, 22 Jun 2025 11:45:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A36961DE89A;
	Sun, 22 Jun 2025 11:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ljmAcqhm"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB512F2E;
	Sun, 22 Jun 2025 11:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750592732; cv=none; b=klJ/dvoHGIL8hLUwwLK9SwaZQVOrEzu9fxUFSMo+oKCela9PDM4VXUxd1PpxLZ/BVBeQ8QT+8XuYKhiNSENtRjOHiSuK8kx6S/oT9Ye8h5Lz8LPTzamgeAPnuHaCwGxAwJD/BI9PtnC9StQ3h+r+RaM81riktBbrWcoZ0JRK1yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750592732; c=relaxed/simple;
	bh=hL4i2a49eysUewPBBfst220vn9T5fdFeRpxF180ryqc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tF0wMv/R7n+SQwOxHw9T8iPydQoregTdXpcQjgoMMwFeGXkXuprqgtkFyj1hlwX7aw9TIuiL0ZrzrKtOaa1GwPkJh/rDZ8zKQId1n/pSeZ/dUiMj3m5J34kgd84LNPiMDnYbFmih0Ba0pUd6RWdwcV99WyxiZa1yOzxaNhPK/nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ljmAcqhm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA89BC4CEE3;
	Sun, 22 Jun 2025 11:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750592731;
	bh=hL4i2a49eysUewPBBfst220vn9T5fdFeRpxF180ryqc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ljmAcqhmT++DA+gT3KHa1PdRVkntFvYni1YO2l2yu2h6VOdQHrQIywrVdNAXrJ1SD
	 QsbuSdxA2MIFV6ZrDyQIGNRSHBLLJ7VkimRKNiafDemmQ16NxlHmofDtAU+CxIzxtJ
	 91AgZyxsfMdQisC3TajP9rpDlRJGMbjhZHJhTvVQY6yxpg+cP+VeRyOc7baSFGFD4N
	 Aii7LTjwUFGnjQRg6l0dS54j5qlBHsu7z3okcHV3nlskyYiyQb9xpQyX5CflrFvt/y
	 E2s/fJ3f5AajfH7/hgOGRumuW35SnsWqqgltMh+MaPPbLs86yPai3dGMP9SMtknQFO
	 Ch8lY/KRecoQQ==
Message-ID: <fa20fadb-529c-4796-beaf-ba8a1097d7aa@kernel.org>
Date: Sun, 22 Jun 2025 13:45:22 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 00/55] media: Add a helper for obtaining the clock
 producer
To: Michael Riesch <michael.riesch@collabora.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com
Cc: akinobu.mita@gmail.com, stanislaw.gruszka@linux.intel.com, arnd@arndb.de,
 alain.volmat@foss.st.com, andrzej.hajda@intel.com,
 benjamin.mugnier@foss.st.com, dave.stevenson@raspberrypi.com,
 hverkuil@xs4all.nl, jacopo.mondi@ideasonboard.com, jonas@kwiboo.se,
 kieran.bingham@ideasonboard.com, khalasa@piap.pl,
 prabhakar.csengg@gmail.com, mani@kernel.org, m.felsch@pengutronix.de,
 martink@posteo.de, mattwmajewski@gmail.com, matthias.fend@emfend.at,
 mchehab@kernel.org, naush@raspberrypi.com, nicholas@rothemail.net,
 nicolas.dufresne@collabora.com, paul.elder@ideasonboard.com,
 dan.scally@ideasonboard.com, pavel@kernel.org, petrcvekcz@gmail.com,
 rashanmu@gmail.com, ribalda@chromium.org, rmfrfs@gmail.com,
 zhengsq@rock-chips.com, slongerbeam@gmail.com, sylvain.petinot@foss.st.com,
 s.nawrocki@samsung.com, tomi.valkeinen@ideasonboard.com,
 umang.jain@ideasonboard.com, zhi.mao@mediatek.com,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <cover.1750352394.git.mehdi.djait@linux.intel.com>
 <f629be75-4019-4e5c-abcc-45dc8b7e1a8f@collabora.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <f629be75-4019-4e5c-abcc-45dc8b7e1a8f@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 21-Jun-25 4:28 PM, Michael Riesch wrote:
> Hi Mehdi,
> 
> Thanks for your work!
> 
> On 6/19/25 19:58, Mehdi Djait wrote:
>> Hello everyone,
>>
>> Here is my v1 for the new helper v4l2_devm_sensor_clk_get()
>>
>> Any testing of the patches is GREATLY APPRECIATED! Especially the two
>> drivers with the special ACPI case:
>> 1) OV8865
>> 2) OV2680
>>
>>
>> Background
>> ----------
>>
>> A reference to the clock producer is not available to the kernel
>> in ACPI-based platforms but the sensor drivers still need them.
>>
>> devm_clk_get() will return an error and the probe function will fail.
>>
>>
>> Solution
>> --------
>>
>> Introduce a generic helper for v4l2 sensor drivers on both DT- and ACPI-based
>> platforms.
> 
> Out of curiosity: How is this problem specific to V4L2? Does one need a
> similar helper in other subsystems?

Clocks on ACPI platforms are typically managed by ACPI through either
ACPI power-resources or through the _PS0 an _PS3 methods (power on/off)
on the ACPI fwnode for the device.

Camera sensors are special in that the sensor driver wants to know
the clock frequency to e.g. program its PLLs and that clk-freq is
specified through a device-property on ACPI since the clk is
otherwise typically not managed by Linux.

Most other drivers used on x86 don't really care about the clk-frequency,
they simply assume the clk-freq is what the hw needs / is the default
expected clk freq.

Regards,

Hans




