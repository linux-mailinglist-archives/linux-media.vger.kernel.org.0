Return-Path: <linux-media+bounces-37751-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF201B054D3
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 10:26:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 271E93BC97B
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 08:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A41C5275B1C;
	Tue, 15 Jul 2025 08:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LFsEITw8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABBB226CF3;
	Tue, 15 Jul 2025 08:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752567945; cv=none; b=hGsC4t8rU02IkIZ0zm/OKyhNOuaSYVVoeE3e8d8toXBGCLYW3OWF6EJK/x5yMIWqoFh1k60wgeWuvH2qU8clyW+lrZeaNO6x4DsWV/R32iQ0NS0+c1Hb3pKFowGp3GzBd3oUXYfkq9gvXCij3GeU9KHkCnVC8YZyH6cGq0yTpgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752567945; c=relaxed/simple;
	bh=CT/ySEHmoi7t5ttFqMkPrQJrOpjCy+zqLCrrkqiKek4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D9CoD231qPTP+KtOypZTObbaKFPVWA45jynW2kNWLZMARnAnuLcPjF85VfcTWwF8CniQGgi0jDaNKLwf9+0yHFxwip4IyO9k8ws02XZzCeq97Ny5Buhm4mGYe7E0OOMfQXvhRX3bziB4zzjDwoJDAzaNzB8YX4Llr4p30Y71Pxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LFsEITw8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA1F3C4CEF5;
	Tue, 15 Jul 2025 08:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752567944;
	bh=CT/ySEHmoi7t5ttFqMkPrQJrOpjCy+zqLCrrkqiKek4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LFsEITw8fzmoDsqqRTqB58xZBl4jCq34CiNcEY5vW8wJ6IDfxEF37EzrNzZ5++4Ke
	 T6ChFXZ4u9n/vfNWVfRY+YRYHYWmUlVDXN05N7mrnPEJCImkaE7kNLVzEYxFDt6F2D
	 2BbDSldlgYEb2b/tTd1kvGJs66HIGSJKhakks5YfqRLPovJYDy0RSHefd41WJ3xMIs
	 PNw5z1LsIeHZKttaj2vyCOlIC1ABMICqEjJJcz8L+i0S6otpxeUhLJXD5FaSnAFwJA
	 lUSZyDKrk4QhD5JbX6UssQeHIMr9ZRLYGshm/TN55NB9vaF/jQJ0iKyrsLWbAPZz1u
	 Nr0CqX72zTR1w==
Date: Tue, 15 Jul 2025 10:25:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Robert Mader <robert.mader@collabora.com>
Subject: Re: [PATCH v2 0/4] media: i2c: IMX355 for the Pixel 3a
Message-ID: <20250715-fine-adamant-myna-bf6e6e@krzk-bin>
References: <20250714210227.714841-6-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250714210227.714841-6-mailingradian@gmail.com>

On Mon, Jul 14, 2025 at 05:02:28PM -0400, Richard Acayan wrote:
> This adds support for the IMX355 in devicetree and adds support for the
> Pixel 3a front camera.
> 
> This depends on https://lore.kernel.org/r/20250630224158.249726-2-mailingradian@gmail.com
> because the GPIOs would go right next to the charging, if sorted
> alphabetically.
> 
> Changes since v1 (20250630225944.320755-7-mailingradian@gmail.com):

If doing this, please use lore links. It's one click for me. Above is
not, needs multiple steps to recover the discussion.

Or just use b4...

Best regards,
Krzysztof


