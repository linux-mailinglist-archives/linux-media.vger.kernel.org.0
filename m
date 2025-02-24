Return-Path: <linux-media+bounces-26789-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10293A41A26
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 11:05:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BCB537A5280
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 10:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31184253B64;
	Mon, 24 Feb 2025 10:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="rBZ9r7+4"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048DD2566CD
	for <linux-media@vger.kernel.org>; Mon, 24 Feb 2025 10:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740391330; cv=pass; b=EVOgSOBoeoXFCRD9SyUl19CDCPNYjCKyLjAmbhhPDYSPJ2s9vMCSQrlml57/dDPELEOwu1NPCfcG5a7p5SvrF556b/n2qmu2ZZWgGq8WK3gz0w1JhCMF/dZfgHLXYUO1jSBi6fRJ0wGk+oS612oyccYsKTIwjV8X+V0N+ydkPGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740391330; c=relaxed/simple;
	bh=u5VG1brcxq+1R7H94gjqrI9hoDgqp9jtdb+SnCQpoLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RJwHfFrJzW6o8LOme/9rvyA+oh5kblBL6fDKkmrCq7vf6utyi+o0QKHYToySVwUsNZfG6MFLvDuc6w4naDkfZhNV2Tkl4zOgfM8tM1fdf5lJP6TcgkWxkI2dvbpvrYNwM49k2GFJWgy2Ebxg0JH+MeJWyI5vVKiRWBqxmEjfHw4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=rBZ9r7+4; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4Z1bqq0gFqzyTt;
	Mon, 24 Feb 2025 12:01:59 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1740391319;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WxE2Z9oCuITNw2S8QbVdX5WsoJyuvK4abPaV1iwotsg=;
	b=rBZ9r7+4F1EjfsU2YmxxAFi811O2plZkMpsfZlgWyMtSp+iD5ZGbEQfibo30BC+HiLqoU7
	7ci+yaWbhcJBkFx4cxfyn/U5kDZz0LtMJUke0SKOWPc2+HaOmUfBRXUG0bYw0RhUG+7DiC
	ylxafPp7C0306tIQ0J3p8ONdjZsJETM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1740391319;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WxE2Z9oCuITNw2S8QbVdX5WsoJyuvK4abPaV1iwotsg=;
	b=Xe1JTiFlKaRr04lgid7gOuXwY4f+fRpQ+84HEs8T4FUwbdWdaoNjjmWaiKvioYRv8oQSMP
	vnvXuuO6hINZW8pfvbmiQa+MbKkPcLfjvjFZzJiqDN1QIFoUDCNiHwX722HH9CExmgHDov
	Xwm38XpT3J+DjfXlqn15lNJswPizFZY=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1740391319; a=rsa-sha256; cv=none;
	b=kZU0CSccYSiWwbRz4e6TJxQ/NbcvdMW3OmrX/dya750UFhOzh404pQ2zyWE0rihScZpbvy
	CuGRZmg/0QxlpQm8LVSHQdvTDU9lJmG+uuvp4W/jbZDJlRKLPsfgL7NkGrG9mNWsyz6fEm
	ua8jJBrEDNtGS2ZuNoWW5dJ4TXCogog=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id D8AC9634C93;
	Mon, 24 Feb 2025 12:01:56 +0200 (EET)
Date: Mon, 24 Feb 2025 10:01:56 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH] MAINTAINERS: add 2nd media maintainer, fix patchwork link
Message-ID: <Z7xDlG-2c_3SPqVg@valkosipuli.retiisi.eu>
References: <e7a4c286-13ae-4025-b765-ee7055476cf1@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7a4c286-13ae-4025-b765-ee7055476cf1@xs4all.nl>

Hi Mauro,

On Wed, Nov 27, 2024 at 12:55:59PM +0100, Hans Verkuil wrote:
> Add Hans Verkuil as second media subsystem maintainer.
> 
> Fix the patchwork link: we use the patchwork instance at linuxtv.org.
> 
> Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>

This patch is not yet merged. Could you pick it?

Thanks.

> ---
> diff --git a/MAINTAINERS b/MAINTAINERS
> index aab0827938b6..c0491036448c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14353,10 +14353,11 @@ F:	drivers/media/platform/st/stm32/stm32-dcmipp/*
> 
>  MEDIA INPUT INFRASTRUCTURE (V4L/DVB)
>  M:	Mauro Carvalho Chehab <mchehab@kernel.org>
> +M:	Hans Verkuil <hverkuil@xs4all.nl>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  W:	https://linuxtv.org
> -Q:	http://patchwork.kernel.org/project/linux-media/list/
> +Q:	https://patchwork.linuxtv.org/project/linux-media/list/
>  T:	git git://linuxtv.org/media.git
>  F:	Documentation/admin-guide/media/
>  F:	Documentation/devicetree/bindings/media/
> 

-- 
Kind regards,

Sakari Ailus

