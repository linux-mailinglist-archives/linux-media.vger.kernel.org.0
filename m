Return-Path: <linux-media+bounces-38130-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA6DB0BF8F
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 11:02:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA113189CD5E
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 09:03:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CB69288517;
	Mon, 21 Jul 2025 09:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="poxkJid2"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9B5287260
	for <linux-media@vger.kernel.org>; Mon, 21 Jul 2025 09:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753088559; cv=none; b=rMurO8fGJ+w6632YNT3u0uJzGCFfQW9fXGVdjK7DXBnltwmP4q2yJn+FRRjX4rqjtdJt2YBertR6tqXwdw3bQMDU0K/1+sPxe3zRuywHl+bB3zGwU6+bhQYHtrxG/c7q0NqH7EwcBNHeZyehu4apiIMroeVJDL+LAKKJgzk1Fd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753088559; c=relaxed/simple;
	bh=+kQWn4t6rOvIFcY0NRQfmNz83Fl41co35glfNC4i6AE=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=a4I5dwr8MfgNyNfJgT9yEX0L7I6E3OhQ7Une7xNpAs7Cg3Q5ffaZFpkpLIBfvaaVEdS0DHuqdymZdxDnHytv4ChJwfFBln5Rk8IzG1FoyuCReD9i+wjdtAbpKnAC/kwPUxQWfIZHBYyBavNrlWrMau/LYeVdN8NKIALgjIN1nNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=poxkJid2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87494C4CEED;
	Mon, 21 Jul 2025 09:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753088556;
	bh=+kQWn4t6rOvIFcY0NRQfmNz83Fl41co35glfNC4i6AE=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=poxkJid2O6Ak6rYSQZqtH6fSzl6SgZaPq+3ut1nSUJpl4m5N01h15l47kWoE8nhrY
	 U+S20s+hknrFA5EHXDtGAyoRD40nplGjp6RR9KRVlJ789jbLuY7PSQomsJaA3PrU30
	 y+l7bekS/ocpS6O5/vkBvYRjyNwuciWMGQDoNDh3xvCFt1zQTcgYavtL8e/ekShtSd
	 MDJatDkDt3E94OVJUsQ2Vo7PTjQofii2rCk1YBaTUxFDfF0kqrO9QYzF/0oDoeIjxH
	 iG9SJTnGEeWZ600seGzyMmUADLsEkPhtUUYCjYdyFCZDxtQR1s0SBelFTKqUBH882I
	 Ukq5KIbYAL6QQ==
Message-ID: <7ee683f59596a16f70f270e5c82c4702@kernel.org>
Date: Mon, 21 Jul 2025 09:02:34 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Hans Verkuil" <hverkuil@xs4all.nl>
Subject: Re: [PATCH] media: i2c: tc358743: add support for more infoframe
 types
In-Reply-To: <29d8a4e0-c7b2-4d48-bc2e-f22dc32cd7c6@xs4all.nl>
References: <29d8a4e0-c7b2-4d48-bc2e-f22dc32cd7c6@xs4all.nl>
Cc: "Dave Stevenson" <dave.stevenson@raspberrypi.com>, "Linux Media Mailing
 List" <linux-media@vger.kernel.org>, "Maxime Ripard" <mripard@kernel.org>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

On Thu, 17 Jul 2025 11:03:35 +0200, Hans Verkuil wrote:
> Add support for SPD, AUDIO and HDMI InfoFrames.
> 
> The tc358743 HDMI-to-CSI2 bridge is widely available, so it is useful
> if it has support for more InfoFrame types than just the AVI InfoFrame.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

