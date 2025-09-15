Return-Path: <linux-media+bounces-42492-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A7FB56D0B
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 02:01:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6EFA93B8313
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 00:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27FA9136E37;
	Mon, 15 Sep 2025 00:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pKLF6LNB"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EB61C27;
	Mon, 15 Sep 2025 00:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757894484; cv=none; b=neJnZimNJCAuCesvsiFErZmlaA45HeMjfoYlImocL2EtLPwigkSudkg3Zns2NUjMzJ90Da3Omzgeg24PSnWbjZUOQajE4iBMJsUhddXyzkOzFCp8Qg9pDwsXlag1QetCe/EzJIOzjfnmii7mZIQNbPmoibaGBo2E3056Tb5QB30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757894484; c=relaxed/simple;
	bh=25c4vqp6oKm/TO4MjO51ZowS30kDKMGfPS6LktFlvdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EzYInNPeFhogqD5n27hMj1HrpFZCwGL6NIGUzNnu1Mi8prvZ6gKUG2Ae6c7gcjAKptA5S7RMpHJ7S0pBn38ESqOsReBAKU4ykwRJ9koJ7UF5GrqKyZx/2wg+r7cpw+vsCKL8vMFwfX98EJCttfZzGLsDoBDu02Nw10X7+U6hImE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pKLF6LNB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBD3DC4CEF0;
	Mon, 15 Sep 2025 00:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757894483;
	bh=25c4vqp6oKm/TO4MjO51ZowS30kDKMGfPS6LktFlvdc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pKLF6LNBjBe9/5mqPSMyd3gJxRNQNfWcK9YXlbYztVOzLRmASl1132gNPGgOSZJLL
	 ls0sUhHhIjdIZwVq8mMpt2AmAeh3mZUPulArNv4cYK7t2abZ4hsiZkO0W4x5dX96Ul
	 tLYYeEyzaiuIhqcN5xS2K6QL+OvnNpmh3L4O5FvsJF5lBjRQ6IGIHSqSGLuiThcnt0
	 xWjsSwCoEbU7aCaYR2N/g4WzxT+1yZSWFah+12id6VORVaYFjOPb/XwC6RuY9z0IBS
	 YQohl4J84mgzycsZ/FuqZOo6/0+4GNxZ2vlRlsJLBMnFYuqzVDlfKNAmQNYNPSft2x
	 0jWjia0mr55Ug==
Date: Sun, 14 Sep 2025 19:01:22 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	devicetree@vger.kernel.org,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
	linux-media@vger.kernel.org, Daniel Thompson <danielt@kernel.org>,
	linux-leds@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
	Hans de Goede <hansg@kernel.org>, Pavel Machek <pavel@kernel.org>,
	threeway@gmail.com, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH v5 1/4] dt-bindings: leds: add generic LED consumer
 documentation
Message-ID: <175789448207.2281753.18020125976595732486.robh@kernel.org>
References: <20250910-leds-v5-0-bb90a0f897d5@vinarskis.com>
 <20250910-leds-v5-1-bb90a0f897d5@vinarskis.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910-leds-v5-1-bb90a0f897d5@vinarskis.com>


On Wed, 10 Sep 2025 14:01:08 +0200, Aleksandrs Vinarskis wrote:
> Introduce common generic led consumer binding, where consumer defines
> led(s) by phandle, as opposed to trigger-source binding where the
> trigger source is defined in led itself.
> 
> Add already used in some schemas 'leds' parameter which expects
> phandle-array. Additionally, introduce 'led-names' which could be used
> by consumers to map LED devices to their respective functions.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---
>  .../devicetree/bindings/leds/leds-consumer.yaml    | 67 ++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


