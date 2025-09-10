Return-Path: <linux-media+bounces-42163-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7710DB51192
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 10:38:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 83D721767B9
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 08:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B38C310627;
	Wed, 10 Sep 2025 08:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k4hDm86E"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01853101DB
	for <linux-media@vger.kernel.org>; Wed, 10 Sep 2025 08:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757493494; cv=none; b=ujWuGyuIb46h4hz5ioRbtSN5U9WGyTB6t+mqhFu99oqarqL6z42fpA7qESZnA6ide2cEgYzNXJhcmCKw8saMMVqqbzmI2xlWnNem7BZKXbcmrZVN+ieEhwmBr3TcKyXMtGA2C/IEpp2viqEhGIP9pTaHuqKi6LImKPmL9XctT6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757493494; c=relaxed/simple;
	bh=lh2mK8+fLSfdH8o8iw/9gSW2FL5P6zsVEQKryT9TZLQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=H4K5fYxSQ8AwXktr4PpfmI4ECEH4r+ow3jOGUALb21xADmTjz6Cm/tzj8BSOhoR0yCZc4KQQwvonoRfwNfAsUWflcQjwcSlHVoISElupU/sG7VYGw2atpzjR+J0VVC4MWruau4ohk/ZYHtOYgEzLfMODsV1UpSlqLIL+5n2spHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k4hDm86E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D948BC4CEF0;
	Wed, 10 Sep 2025 08:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757493493;
	bh=lh2mK8+fLSfdH8o8iw/9gSW2FL5P6zsVEQKryT9TZLQ=;
	h=Date:From:Subject:To:References:In-Reply-To:From;
	b=k4hDm86Egb2A588BUsd5ONMm84sLGUhcA8z0jaEvafyHDeEi5k3LglYubQRwQ5q2D
	 zenf0+YFyBhr4A8fykI96Y2GqyLyY8bIgGpaa0e4Aup2XSq5BX4f/vVfWz4G5YGMGY
	 7C76WwTjBCUxrmo4l8OgGdirAuDiAAfC4000a8TxC+FEztNAXNDXv7FIWfa+2R+HVq
	 huvfMhlKoVj7uKaeizSsw46vYytq38c9DY0nrexbac73rwtN0tw6J8JbuVjkVr+mD/
	 Zh3KZa7CJsPTLJAbUKRdJ7IN221G+RiTeW4/dqaXMEupZ3RxyuW2K6km912LHFtcGU
	 yL8umx21Ui8/g==
Message-ID: <ef93df83-9eaa-4cf8-8449-f41ce9a23d79@kernel.org>
Date: Wed, 10 Sep 2025 10:38:11 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v4l-utils] fix meson target directories
To: Yarny <Yarny@public-files.de>, linux-media@vger.kernel.org
References: <867c4d2e-7871-4280-8c89-d4b654597f32@public-files.de>
Content-Language: en-US, nl
In-Reply-To: <867c4d2e-7871-4280-8c89-d4b654597f32@public-files.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Yarny,

In order for me to take these two patches I need your Signed-off-by line.

Just reply to this email with that line and I'll add it.

Regards,

	Hans

On 22/06/2025 17:35, Yarny wrote:
> Hi linux-media,
> 
> please find attached two patches for current v4l-utils
> master branch that fix packaging errors with meson.
> I stumbled over those bugs while I tried to package
> v4l-utils within the NixOS linux distribution.
> 
> Thanks and best regards -- Yarny


