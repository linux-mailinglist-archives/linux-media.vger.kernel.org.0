Return-Path: <linux-media+bounces-28347-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE00A64A64
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 11:40:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8EC0F7A230F
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 10:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ACAB2356D5;
	Mon, 17 Mar 2025 10:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HDAifHEP"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC34226863;
	Mon, 17 Mar 2025 10:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742207836; cv=none; b=P6b23MHA1MiEwZ/kG6/xGLj22Wymnag6oY4DDCm77BCvwXRufFiCVds/YIbjrIumDib7e9VqZBDcrBD/+10sog9JFNehuEGfOslpKDp7bHoU44K5HKX3z1UYDMicPMcwyNtCzDyBYQhwgAMkbZ5D1TKXEz8i5Xhw1gyjXI6z9jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742207836; c=relaxed/simple;
	bh=CRYiTBUDTQw22I9Tv5AGp+E55IJtf/rhDGIBsrOK5gI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ltur64kgp86PQ+FZKEx+eEgKwrTuGhiASBtynSqvT9z8nk3PvzR/fl2Z8wCXupxHngrAHf4N2ziJQYJpXxNnhCRBeuCfSsd3E3mWdMY8PpVpUM3KP+//4TS9y8VtukuY7dHPdxycJ7n+n+PbHN4Uh1M6RLJRvLH0wOWMnExU4Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HDAifHEP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62E07C4CEE3;
	Mon, 17 Mar 2025 10:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742207836;
	bh=CRYiTBUDTQw22I9Tv5AGp+E55IJtf/rhDGIBsrOK5gI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HDAifHEP/dyQ+dNW8KRc5PJQJlm7eu2UF3YRvWXzPShZxWs1+EI40saMAfBMAgfUm
	 L43aJdYDSN865yfuyc3g0C3ZBmTx10RaDR9CiEYceq8CYQPPx9PRbcNd6pKjnf+YkN
	 Kgjz5P116tGHtM8XYst6iUcgCYAWjtr5JF5K48iVunAjfAPkuNNvyht3E3PjAEulkt
	 eWuCVzavqPIS2ifxPN9C3bx5lbLVq0Ukl4L+hag9Qp/dMkba6iJ+Fqa0v3vMxl1hzr
	 p0duDDu2yFkBNFUp8FxnCBiLZkUZfuTvRQE4qN2Zzz01Vxpc4hRwHYgQBjulQluGwq
	 WrI9RwpCkeQNA==
Date: Mon, 17 Mar 2025 11:37:11 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Pavel Machek <pavel@ucw.cz>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: dt-bindings: Convert Analog Devices ad5820 to
 DT schema
Message-ID: <20250317-impartial-lobster-of-karma-b38fd0@krzk-bin>
References: <20250314-b4-ad5820-dt-yaml-v2-1-287958c3c07c@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250314-b4-ad5820-dt-yaml-v2-1-287958c3c07c@ixit.cz>

On Fri, Mar 14, 2025 at 08:58:27PM +0100, David Heidelberg wrote:
> Convert the Analog Devices ad5820 to DT schema format.
> 
> Add the previously undocumented io-channel-cells property,

You did not explain here *why* you added this property. Your patch, your
changes, anything should say why you are doing it.

> which can be omitted. If present, it must be set to 0,
> as the device provides only one channel.

Also, Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> Changes in v2:
> - added MAINTAINERS entry for the binding
> - documented why io-channel-cells got added into the binding.
> - dropped io-channel-cells in required properties.
> - adjusted example indentation to 4 spaces.
> - Link to v1: https://lore.kernel.org/r/20250209203940.159088-1-david@ixit.cz

Best regards,
Krzysztof


