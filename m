Return-Path: <linux-media+bounces-34375-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 170A3AD2888
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 23:14:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C833F165ACB
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 21:14:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C78E9221F25;
	Mon,  9 Jun 2025 21:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="ryiz/xuC"
X-Original-To: linux-media@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FA0219A8C;
	Mon,  9 Jun 2025 21:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749503642; cv=none; b=tWelO8xBg01IDIIqqofSYxaaHBo9Bqua+rgbWB8I+cl2qi3flvlrJEeLHHnbekOsqcssrLvFE6UL7TzDnCwG51oGakt5/FmpOfEeXto+ft92aq8LqamHgidO4bQx18AwvJe2u7MQ8XZrdeTOXhBWkmpqgIEUYpMbimyDKczVjt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749503642; c=relaxed/simple;
	bh=SH9/4XnQ71BO4Xa2Xfj0k1L5hVY7wDo/Wnb3W1uOUPE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ecrFpgpOKa6dT537JoJx+ve1sY7U42Fs4ZldgTUdEgs5FxXht4ykjziiITp5Yls4qWXxRPSP/QFUsUEodn2U0HCfoEwhmKy15xxSCrGnfJWN0CyPOoti8gsO9hmSiEmNNK0YdJeN2J4sF3ajnE5JYF2/JWg0CtsJyWj7xwEIrZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=ryiz/xuC; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 48C8B41AA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1749503640; bh=rXc/qIZI3+4BXo6YDccZMguNE4ze15F9Hvky0w0+DWs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ryiz/xuCg+DehK4r17KNRHLCPKIi1O7FeYUesDc9B+yg/jRwuG+8wwsfwB0FZUTD8
	 RI/k+yNU0846Hil52F4RztEa2zYYjYmWmbgOdWNhE9lKCAAzzJXpqr6Dc8zbWd7fw0
	 4mK8ic0zgOOQ4PEBKj5lQWETIZc2Prluwn+G1IxNvC0YlSZrdGKEmJNwL8/t9IqBj8
	 aNNpCiVdmrl6Wz4rU+L5hwqk8vPijSq/Se2CBwFQ0Wo28ZWR1te5QOMk8zzsj1EcPE
	 HCtQLAkY54NwNQuIH5tBlvrnpvzJxiGCxLMnHDeexTlcvyG0YWgYeZDY+h/vQzklZm
	 /9dVhHFjqw1yA==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 48C8B41AA1;
	Mon,  9 Jun 2025 21:14:00 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Hanne-Lotta =?utf-8?B?TcOkZW5ww6TDpA==?= <hannelotta@gmail.com>,
 mchehab@kernel.org,
 ribalda@chromium.org, hverkuil@xs4all.nl, sebastian.fricke@collabora.com,
 hljunggr@cisco.com, dave.jiang@intel.com, jgg@ziepe.ca, saeedm@nvidia.com,
 Jonathan.Cameron@huawei.com, ilpo.jarvinen@linux.intel.com,
 mario.limonciello@amd.com, W_Armin@gmx.de, mpearson-lenovo@squebb.ca,
 skhan@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, Hanne-Lotta =?utf-8?B?TcOkZW5ww6Q=?=
 =?utf-8?B?w6Q=?=
 <hannelotta@gmail.com>
Subject: Re: [PATCH v2 4/4] docs: Fix typos, improve grammar in Userspace API
In-Reply-To: <20250522115255.137450-4-hannelotta@gmail.com>
References: <20250522115255.137450-1-hannelotta@gmail.com>
 <20250522115255.137450-4-hannelotta@gmail.com>
Date: Mon, 09 Jun 2025 15:13:59 -0600
Message-ID: <874iwoaa94.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hanne-Lotta M=C3=A4enp=C3=A4=C3=A4 <hannelotta@gmail.com> writes:

> Fix a typo and improve wording and punctuation in
> the documentation for Userspace API.
>
> Signed-off-by: Hanne-Lotta M=C3=A4enp=C3=A4=C3=A4 <hannelotta@gmail.com>
> ---
>
> Notes:
>     v1 -> v2: No changes
>
>  Documentation/userspace-api/sysfs-platform_profile.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

jon

