Return-Path: <linux-media+bounces-42081-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF9FB4A6F9
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 11:13:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45F63188B812
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 09:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 337A0283FDF;
	Tue,  9 Sep 2025 09:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jfIQZhl5"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B29027586C
	for <linux-media@vger.kernel.org>; Tue,  9 Sep 2025 09:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757408997; cv=none; b=AxgZ0VM9HcvYFDEA/qpAjRve+9Q6kD4NAIsORHos7mGnUegxP0ft0DOgyFG1IDEIafkVvNnoidq2IWZqJn5UaMS+EPqYECOoj3r5UGybItgtulpJ4KONlYPh8dJ79DcHqnm0WVIz2C8VouG9gDYYgCW9lrkycGW8sgDXGcl+ZBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757408997; c=relaxed/simple;
	bh=rxP7IFM8bgc2gMaL8B0l+WEsBqhtoey3ApM1ZagMdiY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L/O2dniqJNpz35HdWq4O3uUXzxJ84e9NWEn4g8H+Vok1unpVHUFG67PNtCk1YSxVHA4cEjJ5IEByICDxuTqJxhIAvMayllkKZ9DUBH3ZwRtrThCPdMrwPY+QFjTMFX0WA8ZZ8N1yxa+M8W2o3p4bK6Kuq63zLKBJiYJYjBazlG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jfIQZhl5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBEF6C4CEF4;
	Tue,  9 Sep 2025 09:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757408997;
	bh=rxP7IFM8bgc2gMaL8B0l+WEsBqhtoey3ApM1ZagMdiY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jfIQZhl5SIoV/9f5gV89T4RlOOGkiOZjQyMCW1CqCzs9db5IaE/opDEVqypaqdfOH
	 6R8HH3PyITgo1Xy5ROuQZsznatKFfTEwxRkC/KkACRqNn84uEl2RYYhCGYpv7lT2a2
	 vzcNEWHlF274ngwX510Ra02NxSuxadA4LDmOkdiYJDfdNHdqwEVIFPs9oRhs1jouPP
	 t3iIPFDjSi0Mpn3eSPMe5t2AhnLlZ0JF3qCZPQG2JOq7zrIz6HBHxz03kXocAL8TnF
	 RjF8BJvGb4D89AVQp6qM65Zv4nlvPF1yCUU21O2G0C3z202uLJAGfbqDTQOa9fYvdD
	 AzHY+9zPve7bQ==
Message-ID: <9ac85f36-f866-4bc3-b6b6-14e00a43ba3e@kernel.org>
Date: Tue, 9 Sep 2025 10:09:53 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL FOR 6.18] Please pull
 platform-qcom-iris-generic-fixes-updates-for-6.18-v2
To: linux-media@vger.kernel.org, hans@jjverkuil.nl
Cc: bryan.odonoghue@linaro.org
References: <Ov1LOSHqy4F9X8TjthERT4KcAFeJuQr2yua2G14yvy6j0HUkecmRlyGNQgtIvQx9QBNqi9ncnThRhbLGPBZaAg==@protonmail.internalid>
 <20250909085336.33976-1-bod@kernel.org>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20250909085336.33976-1-bod@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/09/2025 09:53, bod@kernel.org wrote:
> From: Bryan O'Donoghue <bod@kernel.org>
> 
> The following changes since commit 04f08db52b3f892c85bd92ebbc3a7ca32e4f60f3:
> 
>    media: i2c: tc358743: add support for more infoframe types (2025-09-07 10:29:19 +0200)
> 
> are available in the Git repository at:
> 
>    https://gitlab.freedesktop.org/linux-media/users/bodonoghue.git tags/platform-qcom-iris-generic-fixes-updates-for-6.18-v2
> 
> for you to fetch changes up to 5be8379a5f6e1b28edfc231ea89331e7dec6ea22:
> 
>    media: iris: Fix firmware reference leak and unmap memory after load (2025-09-09 09:47:45 +0100)
> 
> ----------------------------------------------------------------
> This PR contains:
> 
> - MAINTAINERS updates for Dikshita, Vikash, Bryan
> - dt-bindings additions for x1e80100 and sm8750
> - dt-bindings fix from Krzysztof
> - Fixes: from the community
>    A number of memory leak and power-sequencing
>    fixes.
> - v2 mailmap update for Dikshita missed in my
>    queue in v1.
> - v2 adds a patch from Krzysztof which is RB since v1
>    media: iris: Add support for SM8750 (VPU v3.5)
> 
> ----------------------------------------------------------------
> Bryan O'Donoghue (1):
>        MAINTAINERS: Add a media/platform/qcom MAINTAINERS entry
> 
> Dikshita Agarwal (4):
>        MAINTAINERS: update Dikshita Agarwal's email addresses
>        dt-bindings: media: qcom,sm8550-iris: Update Dikshita Agarwal's email address
>        mailmap: update Dikshita Agarwal's email addresses
>        media: iris: vpu3x: Add MNoC low power handshake during hardware power-off
> 
> Hans Verkuil (8):
>        MAINTAINERS: update Hans Verkuil's email addresses
>        Documentation: media: update Hans Verkuil's email address
>        media: v4l2-core: update Hans Verkuil's email address
>        media: update Hans Verkuil's email address
>        Documentation: update Hans Verkuil's email address
>        media: include: update Hans Verkuil's email address
>        media: update Hans Verkuil's email address
>        gpu: drm: display: drm_dp_cec: update Hans' email address
> 
> Jorge Ramirez-Ortiz (6):
>        media: dt-bindings: venus: Add qcm2290 dt schema
>        media: venus: Define minimum valid firmware version
>        media: venus: Add framework support for AR50_LITE video core
>        media: venus: hfi_plat_v4: Add capabilities for the 4XX lite core
>        media: venus: core: Sort dt_match alphabetically.
>        media: venus: core: Add qcm2290 DT compatible and resource data
> 
> Krzysztof Kozlowski (5):
>        dt-bindings: media: qcom,sm8550-iris: Add SM8750 video codec
>        dt-bindings: media: qcom,sm8550-iris: Do not reference legacy venus properties
>        media: iris: Call correct power off callback in cleanup path
>        media: iris: Split power on per variants
>        media: iris: Add support for SM8750 (VPU v3.5)
> 
> Neil Armstrong (1):
>        media: iris: fix module removal if firmware download failed
> 
> Stephan Gerhold (3):
>        media: venus: firmware: Use correct reset sequence for IRIS2
>        dt-bindings: media: qcom,sm8550-iris: Add X1E80100 compatible
>        media: iris: Fix firmware reference leak and unmap memory after load
> 
> Vikash Garodia (1):
>        MAINTAINERS: Update Vikash Garodia's email address
Please ignore I accidentially cc'd the list :(

