Return-Path: <linux-media+bounces-7622-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D42886B45
	for <lists+linux-media@lfdr.de>; Fri, 22 Mar 2024 12:28:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBB8F1F21851
	for <lists+linux-media@lfdr.de>; Fri, 22 Mar 2024 11:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C10A63F8EA;
	Fri, 22 Mar 2024 11:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="IIB1jlFb"
X-Original-To: linux-media@vger.kernel.org
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D403EA8E
	for <linux-media@vger.kernel.org>; Fri, 22 Mar 2024 11:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711106909; cv=none; b=r2oQTSWyKMUuwAiT9AtV9LxLFlFC2Vbx0Na7DFin8ANPcxudwVRkwHV+qQVKBYZqxPwZKtnIRmEB1w5hjfXJ/G2pacJCsBOsl8RLe3B2CNOGOV0CEb1xbjQ2in2MdxawAF8BPUBFlUVRBsQirmlwBccVOJy7+3WZmTiP78VcDEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711106909; c=relaxed/simple;
	bh=CknH/9xSPoJ1WEhhL4MAsXBaxhXJfc/14SdBokj/AFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ubB+El+VuEQLtWR+WVCcZrAJEtvAIEQ85dz1hkXcfJk6FZS1ZnbZQn/GimZbSPWDMhlqfvRMybNkhEYr7/29EpaeDDrdS1IB2Oc3AsEVKtI5/7F+yxo1+Z0naxprcjFINcmNz3MukHDMpp/pEAFO31bw/jVMj1DqYv8hKvruKFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=IIB1jlFb; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <6ea523f5-2628-4269-9194-dfb6bf07f4db@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1711106904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uNC0CCmpYhCcH8TuokVlW8ASQZ45O/eH5PrkVa66tCA=;
	b=IIB1jlFbZEqqghgVkJSf3iJOkGODQW2yz0EtVMKFmrmwi5YI2/k1T2ZNs9yLzICh1yGzfQ
	b1OTU/sKMALlLoLwIIS9N1aYn9LrVET8//z8YRlHr6aB6o3zKvgaSyCkjkTc47+pKf+/tF
	FzT2awU6tMmBerhJCJI7vciw4oeFL34=
Date: Fri, 22 Mar 2024 19:28:08 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [v10,20/27] drm/connector: hdmi: Add Infoframes generation
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <20240321-kms-hdmi-connector-state-v10-20-e6c178361898@kernel.org>
 <07125064-2a78-4515-bb48-655f2aec140f@linux.dev> <87sf0iliyh.fsf@intel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <87sf0iliyh.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hi,


On 2024/3/22 17:22, Jani Nikula wrote:
> On Fri, 22 Mar 2024, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
>> Hi,
>>
>>
>> On 2024/3/21 23:29, Maxime Ripard wrote:
>>> Infoframes in KMS is usually handled by a bunch of low-level helpers
>>> that require quite some boilerplate for drivers. This leads to
>>> discrepancies with how drivers generate them, and which are actually
>>> sent.
>>>
>>> Now that we have everything needed to generate them in the HDMI
>>> connector state, we can generate them in our common logic so that
>>> drivers can simply reuse what we precomputed.
>>>
>>> Signed-off-by: Maxime Ripard <mripard@kernel.org>
>>> ---
>>>    drivers/gpu/drm/Kconfig                            |   1 +
>>>    drivers/gpu/drm/drm_atomic_state_helper.c          | 338 +++++++++++++++++++++
>>>    drivers/gpu/drm/drm_connector.c                    |  14 +
>>>    .../gpu/drm/tests/drm_atomic_state_helper_test.c   |   1 +
>>>    drivers/gpu/drm/tests/drm_connector_test.c         |  12 +
>>>    include/drm/drm_atomic_state_helper.h              |   8 +
>>>    include/drm/drm_connector.h                        | 109 +++++++
>>>    7 files changed, 483 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>>> index 16029435b750..3d3193c7aa5f 100644
>>> --- a/drivers/gpu/drm/Kconfig
>>> +++ b/drivers/gpu/drm/Kconfig
>>> @@ -97,10 +97,11 @@ config DRM_KUNIT_TEST
>>>    	  If in doubt, say "N".
>>>    
>>>    config DRM_KMS_HELPER
>>>    	tristate
>>>    	depends on DRM
>>> +	select DRM_DISPLAY_HDMI_HELPER
>> Should we select DRM_DISPLAY_HELPER here? Otherwise there will have some compile error
>> emerged with default config.
> Can we stop abusing select instead of adding more selects to paper over
> the issues?
>
> Use select only for non-visible symbols (no prompts anywhere) and for
> symbols with no dependencies.


OK, fine.

You probably want to tell us a concrete method, then we will follow.
But I guess that is up to Maxime will adopt it or not. Probably need
some discussion then.


>
> BR,
> Jani.
>


-- 
Best regards,
Sui


