Return-Path: <linux-media+bounces-7620-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BC0886B1D
	for <lists+linux-media@lfdr.de>; Fri, 22 Mar 2024 12:14:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E3FD1F23C18
	for <lists+linux-media@lfdr.de>; Fri, 22 Mar 2024 11:14:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28D0C3E487;
	Fri, 22 Mar 2024 11:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="PtMU3Q0c"
X-Original-To: linux-media@vger.kernel.org
Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287CD3E47F
	for <linux-media@vger.kernel.org>; Fri, 22 Mar 2024 11:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711106054; cv=none; b=R4CHB5Gd+Xcew2twhAWJBRekmzAIz1DWeOnVnXMjj5yYc7RtLc0uidX2zQ4zX9J8NeTfS++RUExmgpS6nADUoJVy4CqnmluUANYGhlaMP23O8+8yykT/hyLAx6jkvP5GyuAnh76zzf8luMJH3wx9V0+9BOZPzc3YXtgMbjDd4gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711106054; c=relaxed/simple;
	bh=tkJLb78IpSWKlzmyY6iLRqU/Rj0xLSo5bXptuiYm8e8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MqGzpDcKpsLoPSw49giKLv9TNub2ekSRuZfPtwHrbDIVc+ujfjNcII2V3Q+ekXqalXkGCrTZXpwYsQBDr74d+I4HxISpV4m2KRUCcdcIIZou6F2caByPMmwYJorKQ0ezZpSJZNJFZd3tM3v+l9m5Hx8b239w6zZGepwR6vjNWBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=PtMU3Q0c; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <7835e928-7d09-446e-91dd-13a0fa549bc2@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1711106049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KVrZlsfAwR9SjnoRF84YRfe9+qscAKx0nrI06ciuH9c=;
	b=PtMU3Q0cvYRQSQ6fk18jXYKy3ve8Mbjtd9mf2dz9UKl4mud33fmF/ENJr/CzbKp7d26ZdJ
	qnW8UuW8jmd28bzqyVNqHsB/S1TGAzHgUsi87OOXbPjUVf47Fmw3yuw3Hz7U2xntYvHIe/
	rbWZnZjx0V3TfxXvN0Eekge4UzQtCP4=
Date: Fri, 22 Mar 2024 19:13:54 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [v10,20/27] drm/connector: hdmi: Add Infoframes generation
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <20240321-kms-hdmi-connector-state-v10-20-e6c178361898@kernel.org>
 <07125064-2a78-4515-bb48-655f2aec140f@linux.dev>
 <20240322-loose-resourceful-bullmastiff-92cfaf@houat>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240322-loose-resourceful-bullmastiff-92cfaf@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hi,


On 2024/3/22 18:31, Maxime Ripard wrote:
> Which default config are you talking about? This compiles fine with all
> drm-misc defconfig, x86 defconfig and allmodconfig.

The drm_hdmi_avi_infoframe_colorimetry() function is belong to the drm_display_helper.ko
kernel module, it get called from hdmi_generate_avi_infoframe() in drm_atomic_state_helper.c.
While drm_atomic_state_helper.c belongs to drm_kms_helper.ko. Therefore drm_kms_helper.ko
is dependent on drm_display_helper.ko implicitly. So we probably should select it.



-- 
Best regards,
Sui


