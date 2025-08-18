Return-Path: <linux-media+bounces-40167-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 81298B2AAF0
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 16:39:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6D3A47B5CDA
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 14:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3B8A221F1C;
	Mon, 18 Aug 2025 14:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="NBuythzZ"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73B41E8836
	for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 14:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755527676; cv=pass; b=YS1ZCHYXCrb4Uw6lQ516DoDNv1tp8EvnBGQ4AUFjcOrITMs2jIxC/JfAVoaADTzemozEL9p0Y3YYbV9EyiGI/zTQWtcQce0V3cd9nlOhKqW4K+cK+hsa5cD5T+KjDZtVD8+iXXWkEbZYoS8DYYR6MM3BBHREk5F5VGIWd/6iV5E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755527676; c=relaxed/simple;
	bh=2ZS6+e8szJZRX4lZfSK3mtcAO7MfvHmoAT9MaFUjAvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wd3MAKHtp68wtnHcDw8twR5wNiK2ZIhyi+/tz32n2u4sWDg2/Rt7HOZfGBjZHwsygKExD6cZz8A1DhlokpBddd7dgI4iHThd+c+K5gAcq6HmUtB01jWL+e3l0aiDydIqdLKnfEixjkkjCxI8AdBN0rX8fcLs3yjc8okM3aBy6Xs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=NBuythzZ; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4c5FbK4Tgqz49Pwk;
	Mon, 18 Aug 2025 17:34:21 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1755527661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NcGcyZYCkjqYGPSYe+EydxGkLD7ilX0cQueuJbh/ejg=;
	b=NBuythzZuOX7LFHAnCyhUqDNHQ9YQOI1g+CRcELy0QheosnkN5KI6Wrzkf1eF/YlnCpGss
	946CUhA2gPik6Qpj6sY0eheQrB/ppRaIgq2Rh9kLS6P8gXTiko4lru9HouPHAtEtlt1glI
	Kq4cO56DvSWUXkZI8gcERxdMU1Db2K0S0TaV4NWgDkpQAgru72JswxacvMUfBmqj25yuMO
	dLpVCiwuvxEGoGpQk2TDKJg7ntgqmxh7XCfO92c3Fq3/0w+4F6oVX0l7KSu08lRPXeXAQQ
	19mvYwbal/azlBCYYGVK/9fkRyQQa0ncRKhEKiiZGZ3sFGIKXdZaRz3o4+0qWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1755527661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NcGcyZYCkjqYGPSYe+EydxGkLD7ilX0cQueuJbh/ejg=;
	b=kajKJ5fE85EFvMJtkqRgCChvXclpLkpzchBwjPiQfAA8i/mN9Q65fxsx0+HS6y9sPxWJ2D
	slskRv6ag10H2fd0iTOL1r8Ngn+6Kw4iMKywheaoOnfA9oxdU53rzcygPw3x9bNqHm5nYv
	AH4C4a9Ak5tJ0Q60RVRcFtjtEOv9aAZFxID045ERfxHwzNxxmRgb9b8iRRGa+1CU3edu8o
	RuzkRzz6ZK6Et15v1V6t2oUA+Q8MUIMyvQStvJ6hO64x18yOj0C6AOQIwBaGKyMPIZ3/Ye
	/jaJU39BVXG5V1I7BkfzoDXhvHmKCHFZXkXcc/SYr2AQMNpG00fNNjMVQIqC3g==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1755527661; a=rsa-sha256;
	cv=none;
	b=ahPbciMMAFx4pX7LFH8sz4uqRsSPXINkBOZ15rGZOOew+UeGUe/hHIF3l/Y40Im3tbYMs1
	uJIOygSCVg03FiiQ2m/TLiHioJRv0Bq+ixBUxS5J0CFkzhDyWv8G4amVcePewIBtHnftlg
	2PbOdkrdFBd0cdUpk3ehHzQa78e14287zSGInizERrsXUywAAV3uADgFNTkV8zWKRzhdcu
	RIFxuTz3GrJxCzhxyuhRk52b/vZJHdwzt6FMeeLtho1A9Z3T+mn+zkICEkVIx9DOZxztAk
	IXsURCWzh4c+d7EmKW7PvDHX6vbupApsB9lRGvqIHuAf3ynYAo79rFiMY4no8A==
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 21A92634C96;
	Mon, 18 Aug 2025 17:33:10 +0300 (EEST)
Date: Mon, 18 Aug 2025 14:33:10 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Keke Li <keke.li@amlogic.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH 1/2] media: amlogic: c3-mipi-csi2: Call
 v4l2_get_link_freq() on source pad
Message-ID: <aKM5poZW0JMAS_xH@valkosipuli.retiisi.eu>
References: <20250818141444.1160565-1-sakari.ailus@linux.intel.com>
 <20250818141444.1160565-2-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818141444.1160565-2-sakari.ailus@linux.intel.com>

On Mon, Aug 18, 2025 at 05:14:43PM +0300, Sakari Ailus wrote:
> Call v4l2_get_link_freq() on the source pad so we can remove the
> workaround allowing doing that.

This was supposed to read:

Call v4l2_get_link_freq() on the source pad so we can remove the workaround
that allows calling it on a control handler.

-- 
Sakari Ailus

