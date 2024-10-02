Return-Path: <linux-media+bounces-18995-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DF998D762
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 15:48:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0ED91C20E01
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 13:48:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 770B91D0787;
	Wed,  2 Oct 2024 13:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DNva6oKL";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ieunu1fh"
X-Original-To: linux-media@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746A629CE7;
	Wed,  2 Oct 2024 13:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727876927; cv=none; b=SmdsP7po+TaVK7uv3o+3maP2CzVXTixT18Weq2QMe9KLAAnchRhnD9htVnaBhmtLTCmwse9Zjfya2lBfoBshkn0SOBg8mb7vQOpLNUBQz60GFmfDUbBPV1Vuq6uxnchMSp/tcAFPk6hf04G0mQL6JFQDzlnVWOn/t9GXXXRd1Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727876927; c=relaxed/simple;
	bh=k34yPse2Q/fm0+sX/kGcBXhPCydfn9qkdjSszJZObSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kap+z5FsCKkOVNVyc9d4D9CBfvByBozrOKZ46t+DjT33nZTu08Z2tcEiPTutGs9YeNezEv2PjyRhJ+vWYWnXCczcFKgza4j9Q0YIVZwE7K/wIVF9uyZIki2r/OA9/0WzpcFdVvefepSepqzlEtDymsKZVffMo+bWL7Tqmlm3rc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DNva6oKL; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ieunu1fh; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Wed, 2 Oct 2024 15:48:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1727876924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+/nvlUtzaavNbtC7Gs4lkP1stB+GQm+Qa3gFLY3YWuI=;
	b=DNva6oKLMXKGDcyHkyUn5cpLBMaAvUT3WS5eGE9eZ3ohKdymMAn9nhUK+Yfa31mDdquwi6
	JTbwAJtWIVeC4Ksb1svesPYfsZeR0PSfWll5IS3+hKvnyPY4spxcE0VHTQUdmxgWOWtSED
	XVG1q5wsBMyGl/jaVFHBFML1L+hUDPrQY8qfpoFDgE2iX0owWZBTd6qbR8rv73QfOmVQkR
	aW60m1NYpK4kxY/ZqI/LM8kCL7xEYhzxxwYYBHsurFxoPC2dR715himlaaaY+1aZjlHIvM
	IEuPIg+KwVGIg/ddv3zNB0PcHL/+zT2xQUotQ/ykNjBHzYhuBJ5RoCW2xdSzVg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1727876924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+/nvlUtzaavNbtC7Gs4lkP1stB+GQm+Qa3gFLY3YWuI=;
	b=ieunu1fhtZrHFbkBfuus1IM5U01kVDRt0wjidiMQQm+JgF933HcSICzrBGC1kMidJVJJuc
	osGQRN3E96qVN0Ag==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Sean Young <sean@mess.org>
Cc: linux-media@vger.kernel.org, linux-rt-users@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: gpio-ir-tx: Driver does not behave with PREEMPT_RT
Message-ID: <20241002134843.rFHJYxSI@linutronix.de>
References: <20240921190721.6082-1-sean@mess.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240921190721.6082-1-sean@mess.org>

On 2024-09-21 20:07:20 [+0100], Sean Young wrote:
> This driver bit-bangs a signal with interrupts disabled. The signal can
> last for up to half a second (IR_MAX_DURATION).
> 
> A much better way of transmitting IR is using the pwm-ir-tx driver,
> which does not disable interrupts.

If you have to spin to make the signal exact and there is no other way
then be may guest.

Acked-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

But RT or not, spinning for up to 0.5s is a lot. Is this 0.5s in total
or 0.5 * count?
Anyway, gpio_ir_tx_unmodulated() and gpio_ir_tx_modulated() have
local_irq_disable() in there which can be removed. It got introduced in
commit 1451b93223bbe ("media: gpio-ir-tx: spinlock is not needed to
disable interrupts") but the previous irq-save is enough.

> Signed-off-by: Sean Young <sean@mess.org>

Sebastian

