Return-Path: <linux-media+bounces-45877-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB4DC16B96
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 21:06:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67FBB1C265A6
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 20:06:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8256634CFA3;
	Tue, 28 Oct 2025 20:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KPq6tPMe"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A87B34EEF5
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 20:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761681982; cv=none; b=isn+WIP+sZIpGK6D2F/ecMHralEQkkjm1aZZdVlnjsAj+o8F4ImPmX40P9pom7LGj4gqdWM0/mnzLZdpwl5QpeWii0FE1N4jn0mMz1oHvEubcphpSkPkRpweyx9yAQfSMjcPdhfiFxH0ms4QctgvJWXcuVT5tuumBCfQQC8GyDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761681982; c=relaxed/simple;
	bh=U88rrjJ/k3+le9GMkv5Dl6CKs6gqD+sNOCezB2wa0wo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k2hVkQ1wIJPSb5ot396VIYDL0EdN7afzAP15zNs2CBvuja/e/eES310V8Cz7XJtAXoOapS64vrzfGGMRzt5P4H80H1CToM6qhjP7Dg7UVyuR9KXxgdDuuG7igmng9kqPR91CC7VZ8RzkUJ2qfBBk6eGBTU9FjAu5uyKDydc2UmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KPq6tPMe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36961C4CEE7;
	Tue, 28 Oct 2025 20:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761681981;
	bh=U88rrjJ/k3+le9GMkv5Dl6CKs6gqD+sNOCezB2wa0wo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KPq6tPMem32u/l20EuSSYo0q8++rNnm9u93kGPOAeS1YYULKPjte0ORc086er9hHA
	 QAtmvEY9psKG5oYxyV6kH2YxnNXcuhEu4b1/qtavxRmOMd8Vz3MBQe9e9vjjslrUPw
	 h/Qr/aXW8rZRXy02CNpnJ1IBq9Ka1BcZptJ8z68sfNdEnHSWl63Gv0sWU441YcZXCs
	 qHrdhCQ5vv3Q67WlZBVbQSfii09XJ0RtPA+CBlcPP199AQyRQcd42Kt/PAbrOU4SzH
	 URf60VQjrwmgR+Aed2G/ehbgYsKwzkspuSMpliDuTQOiNS/+bBErVEji990ICtaDKi
	 S/7cX/2wIkpUg==
Message-ID: <1e50738e-55db-499d-9984-165d595af45a@kernel.org>
Date: Tue, 28 Oct 2025 21:06:19 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/25] media: i2c: ov01a10: Add crop, ov01a1b and ov01a1s
 support
To: Bingbu Cao <bingbu.cao@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
References: <20251014174033.20534-1-hansg@kernel.org>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20251014174033.20534-1-hansg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi all,

On 14-Oct-25 7:40 PM, Hans de Goede wrote:
> Hi All,
> 
> This is a series with various ov01a10 driver improvements
> 1. A set of bugfixes
> 2. Add cropping support / allow arbitrary sizes
> 3. OV01A1B monochrome/IR model support
> 4. OV01A1S RGB-IR model support
> 
> This has been tested on:
> 1. A Dell XPS 13 9320 Raptor Lake with OV1A10 color + OV1A1B IR sensor
> 2. A Dell Latitude 9420 Tiger Lake with OV01A1S RGB-IR
> 
> Testing has been done both with:
> 1. libcamera (qcam + softISP patches for RGB-IR); and
> 2. Intel's proprietary userspace stack with out of tree psys driver (*)
> 
> Regards,
> 
> Hans
> 
> 
> *) The out of tree ov01a1s driver has a fixed resolution of 1296x798
>    (with the height not being a multiple of bayer-pattern-size <sigh>)
>    the closest the mainline driver can get after this series is 1288x800.
>    This requires some changes to the xml files describing the ov01a1s
>    graph in ipu6-camera-hal.

I've submitted pull-requests for the out of tree ov01a1s driver resp.
ipu6-camera-hal to match the 1288x800 output size the mainline driver
will support on the ov01a1s and to update the xml sensor / graph
configs for this new size:

https://github.com/intel/ipu6-drivers/pull/395
https://github.com/intel/ipu6-camera-hal/pull/160

Regards,

Hans



