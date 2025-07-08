Return-Path: <linux-media+bounces-37147-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D07FAFD50A
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 19:17:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6B154258DE
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 17:15:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64F2C2E6134;
	Tue,  8 Jul 2025 17:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HltkWToj"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6115F9E8;
	Tue,  8 Jul 2025 17:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751994964; cv=none; b=tIxu5iD8HaVKh/fRbXXoGvp62HrqMgR6WPH9FJT0fTiomgrFFJAxxiVFJh3M8AfY7Az47EiKy5Y2kHeGeH8ph54CKa/5Djku8ip8ghRbaeyGf7UwAXsP8xx53EWfbXcFcEuJtRYhVFZ1Xlnzb+UF1DOpm5IzQEBUxiKEOqYMB+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751994964; c=relaxed/simple;
	bh=oPxuCNoSxUQ+b8uXTmL/LOlmEoU1tSZIe+IvYpZDa8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jCcHtEuevFK25EfkxhXCwgd+yl79ioF6WSzF/DvPmxRtktJVLm/+uFb8KP+KTyL08Hwi9sTIEwvNK7fvnhJQdmzorVw+DfyxLjzs3hdz5msqDlGqs+x7lYYCwnijpbhpsEbnIOXrhkHayqnRPJcgMVD9wBmPleHp0RbHWAC3g3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HltkWToj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B2C6C4CEED;
	Tue,  8 Jul 2025 17:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751994964;
	bh=oPxuCNoSxUQ+b8uXTmL/LOlmEoU1tSZIe+IvYpZDa8M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HltkWTojIJI9h36Gf8tmykgdvHzadVkH/W2wil4AP7Tg6oLn0kxNchvTP8ynmfm10
	 yFFbxmO8M0CeUhkZgpGmRfceEHFh0cfFieOD70WMc5fLtdINn+yzjjRhevqeS7t7mA
	 r+Lep6bpA2SlfBCTmQRUK+xJNEJ/1+Lw4Ot662uD725X59CLU4guzi/IIqfIH4LFab
	 lWSLQ/f/2UshcN/NX8LDA3L/gNpkw4d3qQvWXExG+CfgPbfRnv03IL8GSAZEkCD0rx
	 QNgfzhhfJCEXWJO3Fe4ngxSAjPSrgfdSBfsXOkf9aT1FQ3nS4D9gWOi2FwZXJqJt11
	 +eTZGPfg2RFUg==
Date: Tue, 8 Jul 2025 12:16:02 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-sunxi@lists.linux.dev, Stephen Boyd <sboyd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Yong Deng <yong.deng@magewell.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 1/9] dt-bindings: media: sun6i-a31-csi: Add optional
 interconnect properties
Message-ID: <175199495940.648604.8324168473122471061.robh@kernel.org>
References: <20250704154628.3468793-1-paulk@sys-base.io>
 <20250704154628.3468793-2-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704154628.3468793-2-paulk@sys-base.io>


On Fri, 04 Jul 2025 17:46:18 +0200, Paul Kocialkowski wrote:
> An interconnect can be attached to the sun6i-a31-csi device, which is
> useful to attach the dma memory offset. Add related properties.
> 
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
>  .../devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml  | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


