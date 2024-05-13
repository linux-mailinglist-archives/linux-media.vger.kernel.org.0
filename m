Return-Path: <linux-media+bounces-11418-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0AE8C438E
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2024 16:57:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE2DE286402
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2024 14:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50FFB4C89;
	Mon, 13 May 2024 14:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C4Dpco6P"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C2D4C62;
	Mon, 13 May 2024 14:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715612212; cv=none; b=Fj2COOVzTKulOdVHHnyZyGm+Rw23FsL1f8E0o04SwFtjaPi7TpqrFZPTd5ZFBJ8HpA5hmfRffcXoeZ+1xUcsF2bTogYrS+d3FkFpObk3uJzeG4dTzAkOtUhBB3N2tUrYBuyhWEhxuADWGl74enGosyj2yUmDCtjPOYQzCobE4cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715612212; c=relaxed/simple;
	bh=rGiCLvhHEh+/H/8ISDwxe5vtFuzZZ3yJUHRruvrM/b4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jzFJkMGrDJ4izWwzUzVZovUTs9UrPuOVqLAVRhUh2LxyV/5b3UsLeP9ujF1xDryDSWBf7BsHHIyOy9ib0C52FkAStwW9AEQnIlr4e9VZwu8US5xi2gNsGF2KS49QiC88VY9mvHyX/SaXvejSfef+ti22YRQNPmM2RCa05bJ38KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C4Dpco6P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9AE5C113CC;
	Mon, 13 May 2024 14:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715612212;
	bh=rGiCLvhHEh+/H/8ISDwxe5vtFuzZZ3yJUHRruvrM/b4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C4Dpco6PV3nzhhCiahoCIEl1yiz8vAQ1MSCzioNeX85ElySOJmV9/psFYCEABIdId
	 ZFkaXDJm9opL3lPaos5t+tgB+OStyf+uPdFUTZoouOvDqCdArh7meQ/1YNwQbmEZ7K
	 LfVs3rtL0ARv/EoiIJAEGxtgjzTRtWiLWRVMnufoWUjzxa7hEtmQLwOVuDUwXT8yLL
	 Q5b8FpIllFhXrNPHd9Azx/GLL6gQZnocGR0zA2cuoX1GydoiCJ1G0L/wFI4vg5oklc
	 zUfoTfn8RmZTJ41dzXjPc+5fdN3Q2ObuOqUx3FD7bN0oOJcz8csDYfjVC/1yLZI+bO
	 cVjKEmGeS1TMg==
Date: Mon, 13 May 2024 09:56:50 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?utf-8?B?UGF3ZcWC?= Anikiel <panikiel@google.com>
Cc: mchehab@kernel.org, airlied@gmail.com, mripard@kernel.org,
	devicetree@vger.kernel.org, hverkuil-cisco@xs4all.nl,
	daniel@ffwll.ch, akpm@linux-foundation.org, conor+dt@kernel.org,
	robh+dt@kernel.org, dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org, dinguyen@kernel.org,
	chromeos-krk-upstreaming@google.com,
	maarten.lankhorst@linux.intel.com, linux-kernel@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org, tzimmermann@suse.de
Subject: Re: [PATCH v3 05/10] media: dt-bindings: video-interfaces: Support
 DisplayPort MST
Message-ID: <171561220843.2594407.9178563306645965147.robh@kernel.org>
References: <20240507155413.266057-1-panikiel@google.com>
 <20240507155413.266057-6-panikiel@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240507155413.266057-6-panikiel@google.com>


On Tue, 07 May 2024 15:54:08 +0000, Paweł Anikiel wrote:
> Add a DisplayPort bus type and a multi-stream-support property
> indicating whether the interface supports MST.
> 
> Signed-off-by: Paweł Anikiel <panikiel@google.com>
> ---
>  .../devicetree/bindings/media/video-interfaces.yaml        | 7 +++++++
>  include/dt-bindings/media/video-interfaces.h               | 2 ++
>  2 files changed, 9 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


