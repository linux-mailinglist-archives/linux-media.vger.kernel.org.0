Return-Path: <linux-media+bounces-6334-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7699D86FADC
	for <lists+linux-media@lfdr.de>; Mon,  4 Mar 2024 08:31:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26F9B285D9C
	for <lists+linux-media@lfdr.de>; Mon,  4 Mar 2024 07:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 251C114AA1;
	Mon,  4 Mar 2024 07:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="znY31lQ6"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823EE14005
	for <linux-media@vger.kernel.org>; Mon,  4 Mar 2024 07:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709537450; cv=none; b=UoyVUGlrseRRXVru0ch94EgTST38DNWzbV4c8RJ4ERrIl3VBl0d65yzvSXDOR7Xx4ddM46lkwQkjNCGwgOPYjwgnqu69WWgmI/q1bqjaxVvUwvq0ryrfhTIWhJojpSR5e02rddtFJMvr4hFTcQkr4tRh+Y5jZQ1q3trWlq9fm/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709537450; c=relaxed/simple;
	bh=VMRdQUAhMLtQ3hyGbHrY69RL94i+UzosVMe6DPenXFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fg4yf4Iar5uLetjdSYljTwL5rCjsvLI64ymVTx+q9K5FHso5JNigw6AOFgPBKfwmRbF9Rv1ooKsEEys9QUbnyoQfT3opDC5jYLra0PRtZ8KBbDfAqPjXTXHfBrVdEPhhdn0GGHAbnV3vBKIVA4d9XTDf1Dz276HX+lTqVPVAkhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=znY31lQ6; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709537440;
	bh=VMRdQUAhMLtQ3hyGbHrY69RL94i+UzosVMe6DPenXFg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=znY31lQ6H5b8vfBvrFR32CgsAltp3+bydV2CVYIHf6X7QdNwLQH3LfVNcyUXHCfWp
	 VF+VbW3+XLZGPItZwaZWDH+5S9Ka7mgW6litGxO574ZBPo+IVwSL3/gIgWmQZAkOTD
	 cvqaJXu238Fj0uNhTWXT6KZ/75vwBrNcSaX0whmGscIxArX3Ip4l2ybmmT0AEmSm9t
	 yDt5qryS20eYaahynRJrIbmedX0zYc/l4wwSRoQfebDFTP1y3Lc5mPIN3VyvT4K/Y8
	 um16Z53eSI99N3uqgXCAfcpFDYBib9TtzN01CHOF1RB5iPizrFwLQoKAgMkeCYJYmQ
	 bfyGATmSKhEDA==
Received: from [100.95.196.182] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 255443780480;
	Mon,  4 Mar 2024 07:30:40 +0000 (UTC)
Message-ID: <4d24fc4c-5e55-48c7-874c-a5138b5d284f@collabora.com>
Date: Mon, 4 Mar 2024 08:30:38 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/13] staging: mmal-vchiq: Avoid use of bool in
 structures
Content-Language: en-US
To: Maarten Vanraes <maarten@rmail.be>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 linux-media@vger.kernel.org
Cc: Kieran Bingham <kbingham@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Umang Jain <umang.jain@ideasonboard.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.org>
References: <20240303152635.2762696-1-maarten@rmail.be>
 <20240303152635.2762696-2-maarten@rmail.be>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20240303152635.2762696-2-maarten@rmail.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Maarten,

W dniu 3.03.2024 o 16:09, Maarten Vanraes pisze:
> From: Dave Stevenson <dave.stevenson@raspberrypi.org>
> 
> Fixes up a checkpatch error "Avoid using bool structure members
> because of possible alignment issues".
> 

This commit message might be confusing, because...

> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
> Signed-off-by: Maarten Vanraes <maarten@rmail.be>
> ---
>   drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> index 890669f874d9..2e616604943d 100644
> --- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> +++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> @@ -1983,7 +1983,7 @@ int vchiq_mmal_component_enable(struct vchiq_mmal_instance *instance,
>   
>   	ret = enable_component(instance, component);
>   	if (ret == 0)
> -		component->enabled = true;
> +		component->enabled = 1;

... what the patch changes is not a structure member, it is the value assigned 
(with a potential implicit cast) to a structure member.

Regards,

Andrzej

>   
>   	mutex_unlock(&instance->vchiq_mutex);
>   


