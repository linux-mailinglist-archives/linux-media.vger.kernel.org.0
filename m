Return-Path: <linux-media+bounces-34374-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D7FAD2885
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 23:12:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A140188721D
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 21:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 868C7221F21;
	Mon,  9 Jun 2025 21:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="gHZ1a3lY"
X-Original-To: linux-media@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A970193062;
	Mon,  9 Jun 2025 21:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749503570; cv=none; b=pxxQeH3vtCJcMpHK27Bg33pnHhEDpvrqbW8mzSRh/N0fsmCF8s+5MBBFJ/5Ueoic+cSJDzgA7LGmuwWhoeDtGJ8kkPWdh+nqFuPz/FK6WjwQ5lfzEgVcP6Vw3WmMEVNX57FdKQsXHsBDDuMmmuKBQXI+iEw7BclqA2rOFkDKziA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749503570; c=relaxed/simple;
	bh=NT2UgqnErpFBb9pVgnzpL0UiyzFv8Ul/DJKbfOdd8PY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PgSC1ta9QtYYsLTD02D+HxlGlRB4fikODdsoTHTRLW0DnRYmi8bSj62BEqrGwC9oxSZDX5MngMTxor0Y+efuG2wYLxP7SqRghLkSP9wXcKZvo8eKlmvH3qx5BqYWNaH9Iol/txbwEXMa6lfzvORjbar41AM7OtQSoTYiAt4fBDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=gHZ1a3lY; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A90AB41AA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1749503567; bh=kVmqBCyOZoSYjjiDKN0T/GrRw00/Wp5UCB2rbJmBnFc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=gHZ1a3lY6xmAElRtFXGIyYJ3uYWGUzxCd1lWY8xIXLmfg5tk4UzWEzWlz5wIZ2jVu
	 rg6/Lk1Afwyyu85VAReg85zEuj621/ZOxjEU2rNK243hnTX8TUemJFuYPZZwK9b3wh
	 gWBRscbilgpH3Y+Dv+L0aPxdVr4dI3jXBAb1vWyJOEQhiY075tOGcoPDEmWACvYZPt
	 NZ6NzvXAtaTh0vFqUzS9U4llPSp8oklgfHN90XbyGTdsz7ng+l/L2E9eD+RGYLR3bt
	 9f6tLamSFgS9UQ48pw+ZUHVDJd/0wdGaQyM/5n+XowSpdWji7hCLIWNTkscrVeuusn
	 Ilt9wyWpmOPUg==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id A90AB41AA1;
	Mon,  9 Jun 2025 21:12:47 +0000 (UTC)
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
Subject: Re: [PATCH v2 3/4] docs: Improve grammar in Userspace API/fwctl
In-Reply-To: <20250522115255.137450-3-hannelotta@gmail.com>
References: <20250522115255.137450-1-hannelotta@gmail.com>
 <20250522115255.137450-3-hannelotta@gmail.com>
Date: Mon, 09 Jun 2025 15:12:46 -0600
Message-ID: <878qm0aab5.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hanne-Lotta M=C3=A4enp=C3=A4=C3=A4 <hannelotta@gmail.com> writes:

> Fix typos and improve grammar in the documentation for
> fwctl subsystem.
>
> Use the word user space consistently, instead of having
> two variants (user space vs. userspace).
>
> Change wording of denied behaviour to be disallowed
> behaviour when describing the interface.
>
> Signed-off-by: Hanne-Lotta M=C3=A4enp=C3=A4=C3=A4 <hannelotta@gmail.com>
> ---
>
> Notes:
>     v1 -> v2: No changes
>
>  Documentation/userspace-api/fwctl/fwctl.rst | 30 ++++++++++-----------
>  1 file changed, 15 insertions(+), 15 deletions(-)

I've applied this one.

Thanks,

jon

