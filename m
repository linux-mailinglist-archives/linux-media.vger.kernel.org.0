Return-Path: <linux-media+bounces-41742-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8837B42C1B
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 23:47:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 811C95680BA
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 21:47:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC06C2EC56B;
	Wed,  3 Sep 2025 21:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Bl1bwWQZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876B91E2307;
	Wed,  3 Sep 2025 21:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756936044; cv=none; b=LEUNhz5JrQxbOQ11bDY2gd+YzEw2FTe0ZIRCpkQ/l/DUsDs+4FiHcn5a4jsGOoH/TFK09yxMNP0UoMGQ4RWkAJcfJwIxmIaG8UINTR1U/I+t0hbAwgfnO8SHJYkZH3va6olVXTgurYN7p/AnmJBhYPSTa9EuIEaLxvLAbekYtoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756936044; c=relaxed/simple;
	bh=0GgytPfcIO0Q4/krr70mcNW/yq3FCj9S7utoaJM+kzo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MfQhgUNKN15HAsz2edWJP+8Rm0jPh25RexpuKvslK0+n5PWOPR3QPAZsFcFg1svXCZytOIGOhXqMMDnkhN+kAS+RQz702gHLDi5ZOkFaP+mN6cW1iB7WMfKl8xmjte4RJSveUYgOZMgEhR90NgJyDx40IAixfBY1ljLT2YFbHSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Bl1bwWQZ; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cHGRP2Vjqz9tTZ;
	Wed,  3 Sep 2025 23:47:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1756936033;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w2/qBRLW8QwNWolmp5KZMKZxO0q6IN8ptMt6ovi4FOo=;
	b=Bl1bwWQZc3N+nfL+h+CMEwn9kGZkUZgIovio+8CKKIi8KI8WxSeaT4pETNCkPY1wQg2Tpy
	CkF2oNKUUKLSklNSwwbF2wa2gvx+gvUn+VfAQK2xt6eD24o4SrKx5XoESvdqbEbF3vO1YU
	umkGvmqNf0eHjt3kstJBZmpKGHXKDBNt1I6NQcSAh6Qt3gnxiYKmx5oAU9WEEc5g1uJSs1
	+yeaFgHsM3hOAjZ+8QXt6Oqld4U1kgWbY/DkTXOJ4w5nQ8uE6aT69l2lPqxQbi3cP37bba
	8qgDIGNMlDTUUMsuKp5j+B9lG+XC7wYWWTyY2BI35hvObBWJwrOVFn+9dPyN/Q==
Message-ID: <f03d0ae0-d28b-4b06-8f63-9d06f15c0522@mailbox.org>
Date: Wed, 3 Sep 2025 23:47:09 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/8] Add support for Wave6 video codec driver
To: Nas Chung <nas.chung@chipsnmedia.com>, mchehab@kernel.org,
 hverkuil@xs4all.nl, sebastian.fricke@collabora.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-imx@nxp.com,
 jackson.lee@chipsnmedia.com, lafley.kim@chipsnmedia.com
References: <20250422093119.595-1-nas.chung@chipsnmedia.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20250422093119.595-1-nas.chung@chipsnmedia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 14d7dbf95193078b02e
X-MBO-RS-META: ci7eu3bdapium5nw3s4r9au7fjchjxhb

On 4/22/25 11:31 AM, Nas Chung wrote:
> This patch series introduces support for the Chips&Media Wave6 video
> codec IP, a completely different hardware architecture compared to Wave5.
> 
> The wave6 driver is a M2M stateful encoder/decoder driver.
> It supports various video formats, including H.264 and H.265,
> for both encoding and decoding.
> While other versions of the Wave6 IP may support VP9 decoding and
> AV1 decoding and encoding those formats are not implemented or validated
> in this driver at this time.
> 
> On NXP i.MX SoCs, the Wave6 IP functionality is split between two regions:
> VPU Control region, Manages shared resources such as firmware memory.
> VPU Core region, Provides encoding and decoding capabilities.
> The VPU core cannot operate independently without the VPU control region.
> 
> This driver has been tested with GStreamer on:
> - NXP i.MX95 board
> - pre-silicon FPGA environment
> 
> Test results for decoder fluster:
> - JVT-AVC_V1, Ran 77/135 tests successfully              in 35.519 secs
> - JVT-FR-EXT, Ran 25/69 tests successfully               in 17.725 secs
> - JCT-VC-HEVC_V1, Ran 132/147 tests successfully         in 81.549 secs
> - All failures are due to unsupported hardware features:
> -- 10bit, Resolutions higher than 4K, FMO, MBAFF
> -- Extended profile, Field encoding and High422 sreams.
> 
> Test results for v4l2-compliance:
> v4l2-compliance 1.29.0-5359, 64 bits, 64-bit time_t
> v4l2-compliance SHA: 2a91a869eb8a 2025-04-12 11:35:53
> 
> Compliance test for wave6-dec device /dev/video0:
>                  fail: ../utils/v4l2-compliance/v4l2-test-controls.cpp(1180): !have_source_change || !have_eos
>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
> Total for wave6-dec device /dev/video0: 48, Succeeded: 47, Failed: 1, Warnings: 0
> 
> Compliance test for wave6-enc device /dev/video1:
>                  fail: ../utils/v4l2-compliance/v4l2-test-controls.cpp(1169): node->codec_mask & STATEFUL_ENCODER
>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
> Total for wave6-enc device /dev/video1: 48, Succeeded: 47, Failed: 1, Warnings: 0
> 
> Note: the failures are all related with the eos event.

For what its worth, the whole series:

Tested-by: Marek Vasut <marek.vasut@mailbox.org> # NXP i.MX95 rev. A0

