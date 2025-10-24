Return-Path: <linux-media+bounces-45536-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ED909C0741E
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 18:20:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04E841C26743
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 16:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8971327587C;
	Fri, 24 Oct 2025 16:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cUV4mLrq"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FD4257841;
	Fri, 24 Oct 2025 16:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761322723; cv=none; b=tUBItzwamPmN8duKelYMiDX7Kh2hYzGzneO4SMuEHBhXvfr2ub8yxQbDNHqVjgWaA5DiA+8EfdU4Sp7gQKoXiNyg7y7Wi5uHq0BtcrDO8tvtQbHEeFB3/fzWuf/WwtbY5N8E3wr0wyr3vWzTCU1JQz3QuEwdnnxZZmWTk6kEDm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761322723; c=relaxed/simple;
	bh=Lio6aSIN2AW0oulEGIcetaNn+Qrc/6jfNppmbbkRsqE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZPWtzJmZBwLx7Zx+5BPnaRwBfFgJaOnhyDUxoxiRTYxenyz546vLGI/sSLiOmSojyQ5pyoO0v0moy+7jiNiE7AGItBpK1pdalUIaH69OoniYRuflwbNJrB2TYuiiOB8Yl3cD/ueKQNNcXvLMXi9yv8DKAPC5h8AxbwBCwwHogwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cUV4mLrq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C44D5C4CEF1;
	Fri, 24 Oct 2025 16:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761322723;
	bh=Lio6aSIN2AW0oulEGIcetaNn+Qrc/6jfNppmbbkRsqE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cUV4mLrqFgPPHs6P/+1O2qcE8fpSBixCRaJ/6yT/YsB2C3IvlcRfyQVA6xsWLB+9j
	 pw7JFjbIc2LQwzARvlYfG1qD3jqAeNGykCFd/Xp7hHGSD7HmBk7AUEUPJYKOX/o/so
	 rMx0MBEWgRHlwqhOnjsp1xTobyb9T6RwbsRn25i0NdYhGzX2Tft8KlekKpolVgJhqN
	 FeiVvWAuShiAFtBfmAAf1OFgczcT/v/aEKdnoNIg60RGS+SRnOl/hMz2WmEGQ8Hayp
	 A7V17aAFdPk7I9QF5Sv6h2uHQ+ApW1fPM0JYdbpDVBhDOP23FpgrDV4z31Up1rMlte
	 PZ590fgeebX0g==
Message-ID: <18606a7a-82ea-40fc-a834-b32e843a6e84@kernel.org>
Date: Fri, 24 Oct 2025 18:18:40 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-fence: Correct return of dma_fence_driver_name()
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: phasta@kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251024075019.162351-2-phasta@kernel.org>
 <11b7a8a5-170f-4815-a8ac-5dba2d8e67a1@igalia.com>
 <5de88e79575e06c053f2d61f7bb58bf9cf5b556e.camel@mailbox.org>
 <1d0bbdcf-f4d6-49c0-bbdf-364c2af80868@igalia.com>
 <89812f66-25a6-4f9e-aa4f-74adbf116db8@kernel.org>
 <5640fbf1-7b8d-4537-9f1a-b401a7a4934b@igalia.com>
 <8cba66d2-9608-4a5c-a2af-6cc91f46a49f@kernel.org>
 <cefe8f07-68a3-4c93-ae46-ebb01ff6fa2c@igalia.com>
 <b21ba8b4-a31f-44e5-a2da-ba585a93d3a6@kernel.org>
 <66f066b0-a8bb-40b2-bdd8-7cbcf114cde1@igalia.com>
 <02b7cdce-95fe-475f-a346-b41fd5615695@kernel.org>
 <5b828e1e-bebd-4730-8866-7a650c1f724f@igalia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <5b828e1e-bebd-4730-8866-7a650c1f724f@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/24/25 6:06 PM, Tvrtko Ursulin wrote:
> Maybe "decoupled-driver"?
SGTM.

