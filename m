Return-Path: <linux-media+bounces-11355-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D7D8C2BDD
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 23:26:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64AC3280C94
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 21:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B67D913BC36;
	Fri, 10 May 2024 21:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B+lmwiXI"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199BC13BC22;
	Fri, 10 May 2024 21:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715376343; cv=none; b=U86Y/CJjqcdcuPJX3WKwQGeWOSU1ps8Jjb72lkBerSKUwOANYp4YFNTtPzCoMdL1xtPLXP8sATKFxtHC4pDYduhwZE6bzcD0D1IdDUbwkGvc1SwB68fRLRlAv/7raicX9zD1V6VZRGvqeCVurMnboiIiSqRMxQ2dAIEkIAJbWSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715376343; c=relaxed/simple;
	bh=IDiYeRxupKFpbWrcDW7eoKaHzmNgzIv9PhoI9GNnRlE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UKF/pGVGB/870h/TllsDgqevGQohjNGhgzVJ1ToCKbaiit94fOSQ24Jwb2li7Gg8CYY1aJMKiXslX8dFotKmTPlWJ7BcX6AoHrc3Eic1me5xl/7GlzU13XM5kutaA1kAehcvMN5KBm0a3c2vcbGTiAvw9R7r8b+NtS20vR/uyek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B+lmwiXI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A0CFC113CC;
	Fri, 10 May 2024 21:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715376342;
	bh=IDiYeRxupKFpbWrcDW7eoKaHzmNgzIv9PhoI9GNnRlE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B+lmwiXI4t+p0X9dc3Ch8VbPvbz6K3d2ZLW9S+K5/MmYBWibTcjGAfJwa0SpyGGvm
	 qgBxo2E6Qq9DCJAX3WlImrUANcOKzYo9thnkgOkItCHDYyQkwR9oBvYCqAwsdpjya5
	 GM+XNYG1IrQA03RfAWVuMdQBykARM4aNkogilxEuQPSdszkGv/PZ9RgN23zI05azZt
	 wY1Wa8KJ+xbVsffnOTpP/ZQk5ytIZgIyz2N80KeTmzz0PVN6sSzVEhxfYuLP6i2Ve9
	 5QgOFSWE4o3NiGcUKex2N3XEkxYKnPZ0nEYne7f8yuD0jQfVowKIlg1XygrL0dZwI4
	 MvF6RWNiDyC+w==
Date: Fri, 10 May 2024 16:25:40 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?utf-8?B?UGF3ZcWC?= Anikiel <panikiel@google.com>
Cc: conor+dt@kernel.org, chromeos-krk-upstreaming@google.com,
	robh+dt@kernel.org, daniel@ffwll.ch, hverkuil-cisco@xs4all.nl,
	linux-kernel@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
	airlied@gmail.com, mripard@kernel.org, tzimmermann@suse.de,
	akpm@linux-foundation.org, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
	dinguyen@kernel.org, maarten.lankhorst@linux.intel.com,
	mchehab@kernel.org
Subject: Re: [PATCH v3 08/10] media: dt-bindings: Add Chameleon v3 video
 interface
Message-ID: <171537633771.768105.2129322533384876377.robh@kernel.org>
References: <20240507155413.266057-1-panikiel@google.com>
 <20240507155413.266057-9-panikiel@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240507155413.266057-9-panikiel@google.com>


On Tue, 07 May 2024 15:54:11 +0000, Paweł Anikiel wrote:
> Add dt binding for the video interface present on the Google
> Chameleon v3. The Chameleon v3 uses the video interface to capture
> a single video source from a given HDMI or DP connector and write
> the resulting frames to memory.
> 
> Signed-off-by: Paweł Anikiel <panikiel@google.com>
> ---
>  .../bindings/media/google,chv3-video.yaml     | 64 +++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/google,chv3-video.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


