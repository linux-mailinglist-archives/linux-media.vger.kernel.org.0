Return-Path: <linux-media+bounces-40243-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CA0B2BDB8
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 11:43:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 557A93ADF7C
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 09:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A951315774;
	Tue, 19 Aug 2025 09:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="EYEe6G19"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E332773CB
	for <linux-media@vger.kernel.org>; Tue, 19 Aug 2025 09:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755596595; cv=pass; b=OEChZiivzx3rzjZjeBeD7ZwcKC8uoLi3N0oZnE2VSFWi9hGvPCgsPo3ZVgHHXy2O8GWZlQ3NAqMmSPAxPWS0sNY2jL9l0qU/P0rB4MmjCGX0LzvuQQwzhzr4UZRdJdGTHsUyqLFBmvFxOFRVYmLDxHaBpRhuSnACBuYeDE+K6zw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755596595; c=relaxed/simple;
	bh=d6TXVPNvs6Qz8oa9iM3dJQNDUb4dcwnvV3u1liq7iuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LLz8VFlB8+/oACnuTHSrvAobmpwKz0m8CtKLqtKMm+g4mFgxUUI0CEGwpTlcFH+N0B+PHZs2OtheE9Wtayy6eMhQ2k6PTlhZcHmL4Qtn5CHzzFAZsDsEN3HUiaZcvLbOePXYvuU8wLbsPWelTpoH9W/5dFMv2nkNhpjKrAVTxhM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=EYEe6G19; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4c5l4p2fpKz49PyD;
	Tue, 19 Aug 2025 12:43:06 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1755596587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ELDE9VgCMQrMa5lumt+VQWhKaeGXjnYcBY8Gb8lDtRA=;
	b=EYEe6G191V7FPAfodmovJuA2jFowisy0hxciM2MIOqpkdgAdJV05ldVfHPahgzVGKYAKzC
	DI/vv6Z+okwaTWOrt0DB7igHlHsAviIP4r0Dwkyt+Zwuv02JRq+DYnipBQejqK1CEvZp/X
	cGPOT9ASrRaHNs/hIZEjFXfI5VsDilV/E83fZ8cb8reYe/luOnnU4uZTz3Q1UbN8KcmGl3
	7zvFhId9XJ7+mfHjhR7QjKV3o0jM59H0Gv/DQ6V0wQsNIeSYO3ffS4Tx6kERGoxYI51z3n
	v/lZrr6Cmrbta3rZ7W2sqD4z81BnYVqXdHSX/ZplGVMkEJhMAGA18Br0HZ26bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1755596587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ELDE9VgCMQrMa5lumt+VQWhKaeGXjnYcBY8Gb8lDtRA=;
	b=E/w67RI6xUVixixq7Lik65oWlxvGENv1ngM8OPsJJ+eBoiMU+LJX4nhBbJbUjFsswjIhxY
	WYvCHSvv7PqgGf7AD7T4RZC8ezXytgT/v7LeY0r6ExIldpXRPxQD/9naYmCUDw7nWOUBGX
	kOseI0flUAHf666X2J6+ezHOq/H2MYXT2EjOTu+Yo9PEwaINXW9/LePgMMwjM7aFsUdO5H
	LMQutONj4f9lZQA/aDTJhDc+FSCoV2iqr48yzXsp73k75aaUdsAqufaC489dR4OFJmX0lB
	2poGiYTWoCH8e9FusGcKPbnTqJ3qE9U5o5T8kvYuw1URlziXIVWOqpRi089jhg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1755596587; a=rsa-sha256;
	cv=none;
	b=Ico+og8clpbGivIcJyXP0tmDNP1u+OfcDvRAn/yqxqrZWYi/fTkypULEQ1iXCokb9apPhR
	3lLO6JY9jxjbOGtGK8NnSvz8AdzFT/bARmgl67SscDD70ejGSeF7HZJ0xYqEn5GMYdmT76
	uG0aAA5aMF5GzRgGfmVMtyCNPWRTKZ//r4WOFQPpxnyqF2X2qx5/jPDR0tUmYCOV82lVLz
	mYm95QP5/AGHdW3jTcCxtx3RYdVoSdwCyU3vwLcEdgOgT8Jb+YnlHZ8CpQHl8WPUHdv/9E
	WQCxTtzzWrGprpvAq3FOtmNSWnKodtJT+dLDUzS8V6/qdSn3UqGy89aObVUvoQ==
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 3782B634C96;
	Tue, 19 Aug 2025 12:41:51 +0300 (EEST)
Date: Tue, 19 Aug 2025 09:41:51 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, Keke Li <keke.li@amlogic.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>
Subject: Re: [PATCH 2/2] media: v4l2-common: Drop the workaround from
 v4l2_get_link_freq()
Message-ID: <aKRG3-ZUIP_pCq8-@valkosipuli.retiisi.eu>
References: <20250818141444.1160565-1-sakari.ailus@linux.intel.com>
 <20250818141444.1160565-3-sakari.ailus@linux.intel.com>
 <20250819054804.GC2197757@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250819054804.GC2197757@ragnatech.se>

Hejssan, Niklas!

On Tue, Aug 19, 2025 at 07:48:04AM +0200, Niklas Söderlund wrote:
> Hej Sakair,
> 
> Tack för ditt arbete.
> 
> On 2025-08-18 17:14:44 +0300, Sakari Ailus wrote:
> > Remove the workaround and don't allow v4l2_get_link_freq() to be called on
> > the control handler anymore.
> 
> nit: Maybe set out what the workaround was in the commit message?

I'll use this, it's shorter, too:

Remove the workaround that allowed calling v4l2_get_link_freq() on the
control handler.

> 
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> It is exciting to see things moving along! With, or without, the nit 
> addressed,
> 
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Thanks!

-- 
Med trevliga hälsningar,

Sakari Ailus

