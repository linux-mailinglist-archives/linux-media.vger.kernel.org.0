Return-Path: <linux-media+bounces-36897-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BA45FAFA43A
	for <lists+linux-media@lfdr.de>; Sun,  6 Jul 2025 11:59:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2929F17D91B
	for <lists+linux-media@lfdr.de>; Sun,  6 Jul 2025 09:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A55711FF7C8;
	Sun,  6 Jul 2025 09:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qS+vZ2Cm"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12ED81FF7BC;
	Sun,  6 Jul 2025 09:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751795935; cv=none; b=GgTlY/lUb7+CCYh3ePv1fLol6Jy/Nlprw+XTWfYjRpUZZh9nQyok0UQYDoE6fgx5UnUm6w9msN1GRAZlF9eowWlyzAnZ6G6Dp1SAhQhKR/ev6S9CApaogWCQc81/xqaUdX3cAeELyK6qNmEo1a0mj2WOIpf2MJdB3gA0O8P8IZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751795935; c=relaxed/simple;
	bh=sFq2D70TtLqED4H2fXdaTrrvqq+ts9ySPJxShkZRK6Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ovU6tw36/aro5KlsKbL5BuC2p/DYlgk/ytqpxEoiJMkWBPAWuDEz23Z0rN2i4p8ZktdkIVotrc2uT5L0UC29wndPV12HIoS/0k5toh9E3ivJfy2IJSBpfVLqu+aFfZVbX+nYd0iq6OXFbeQtTKmX8fT1R0R4L0Z0b0ZxzWwC3d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qS+vZ2Cm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C67BC4CEED;
	Sun,  6 Jul 2025 09:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751795934;
	bh=sFq2D70TtLqED4H2fXdaTrrvqq+ts9ySPJxShkZRK6Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qS+vZ2Cm9UGGQ+V6wtxonhp1YpfG6UCT3QnGtlhy+PzaYSfUCuos0Nh7ptveynZ11
	 uSHZVi7yIqk5OhmMVMuWbe/nq8mSJxkxAdtkyEu0nlNOqcq6wwImy/kAsZMpc7UykW
	 IkUEBDJ7LnQgjP3yQ7cBC5DNm7kc5/n4Q/hjir/bLdqVO3UfU0Y4ezX2684EN/xmVQ
	 1gqElWfVptd9nPooy/4uCUlgf6TlkPrw4rA4E6B2SQi5fhoxNoIbc+blpwAlq9wrbi
	 i2Gjg2btIOXmqubPRORJ6LGkHOXg/6lxF1Gjdn0ht23jmeoYlZ7ttMLqnRc+tacVrN
	 a7IOdlEv5fwgg==
Message-ID: <3ea3d1c7-b6e1-48f2-8d2f-ce62b0471e2f@kernel.org>
Date: Sun, 6 Jul 2025 11:58:34 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/23] media: atomisp: gc0310: Add check_hwcfg() function
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20250517114106.43494-1-hdegoede@redhat.com>
 <20250517114106.43494-12-hdegoede@redhat.com>
 <aCsXg_gj2VOoFPeO@smile.fi.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <aCsXg_gj2VOoFPeO@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 19-May-25 1:35 PM, Andy Shevchenko wrote:
> On Sat, May 17, 2025 at 01:40:54PM +0200, Hans de Goede wrote:
>> Add a check_hwcfg() function to check if the external clk-freq, CSI
>> link-freq and lane-count match the driver's expectations.
> 
> ...
> 
>> +	struct v4l2_fwnode_endpoint bus_cfg = {
>> +		.bus_type = V4L2_MBUS_CSI2_DPHY
> 
> Leave trailing comma, it might help in case we add anything later on.

Ack I've fixed this while merging this series
for the atomisp pull-request for 6.17 which I'm preparing.

> 
>> +	};
> 
> ...
> 
>> +	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
>> +				       &mclk);
>> +	if (ret) {
>> +		fwnode_handle_put(ep_fwnode);
> 
> Hmm... Can we switch driver to use __free() instead?

None of the other sensor drivers do that and IIRC it is
also put a few lines below when we're done with it,
well before the end of the function making __free not
suitable.

Regards,

Hans




> 
>> +		return dev_err_probe(dev, ret,
>> +				     "reading clock-frequency property\n");
>> +	}
> 


