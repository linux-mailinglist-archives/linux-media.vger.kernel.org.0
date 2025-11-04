Return-Path: <linux-media+bounces-46236-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AABC2E8D5
	for <lists+linux-media@lfdr.de>; Tue, 04 Nov 2025 01:16:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF720189C848
	for <lists+linux-media@lfdr.de>; Tue,  4 Nov 2025 00:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A982D207A09;
	Tue,  4 Nov 2025 00:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AyVLwvHQ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DB41E5B7A;
	Tue,  4 Nov 2025 00:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762215227; cv=none; b=eiyAqiGRAikHvv2YCgmnNN7iue9GdkbuPevWwmPNvnqotlLwtS8uhz1qtmYfgSXaiQ5YbVoIHZ7z6WZy0PX0IvcX3ea8Gclb7PmD30onBtLtVGI+g2lUEVt+f9YzptLeZFmtaI3e4IncxRTD/QIaJWuIAKmfM2t5c+0P29mp5e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762215227; c=relaxed/simple;
	bh=VFJYRBnpKMizw+xln40E9l/gQ5KUr9v3w/ueJyDiEa4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EFbNG8g7exkT9IFhsRAMn7IpkS9RU6j0892GXCYCA/H5w1z7Lb3TRUviMERcWlrEOyagHy8nCR4wKRxrM7WUdjIMI2pJH2cpfZ69w5Adikek7hUx3aBIU1iyk56b8PUhxwEDcvkot0zsDeXsKD07S0jhbHubGow8+4W4S9xQ7x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AyVLwvHQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A3CAC4CEE7;
	Tue,  4 Nov 2025 00:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762215226;
	bh=VFJYRBnpKMizw+xln40E9l/gQ5KUr9v3w/ueJyDiEa4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AyVLwvHQHD9p9FwBny3PvY3BtQv0l5g0ht+VJDCpecCBkY4qiHJsLBjVINpxG8BkN
	 WQq9RbBs3sdUu82rTFBfn2A+NV17EulTGBn6ObJl3lX1eg0J8/wxsEhzRkOq1fZofd
	 hB0wUfF3nkqYtBV9KYv2Kv/plKEOV961VDs020CbPIdsomuCxDRfP6fgidxv/CEn8q
	 5/oJyUuaLI1BCpLa6R8lsbEJwC6Q7VY5HVTX9kbj1ssyGNDK1n9OkE9oxTdl2l4Vhv
	 PqAoEeKD0/+Aok216Fo3/oQAgeAYWNUURImGS9DknfMIkhIWJAqfUL7U+kLaWX4izI
	 yNIYnxpt1sT/A==
Date: Mon, 3 Nov 2025 16:13:46 -0800
From: Kees Cook <kees@kernel.org>
To: Daniel Gomez <da.gomez@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Malcolm Priestley <tvboxspy@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Rusty Russell <rusty@rustcorp.com.au>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 0/3] module: Add compile-time check for embedded NUL
 characters
Message-ID: <202511031612.8A05E2FD1C@keescook>
References: <20251010030348.it.784-kees@kernel.org>
 <176219902728.2668573.8447418880394997824.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <176219902728.2668573.8447418880394997824.b4-ty@kernel.org>

On Mon, Nov 03, 2025 at 08:49:43PM +0100, Daniel Gomez wrote:
> 
> On Thu, 09 Oct 2025 20:06:06 -0700, Kees Cook wrote:
> >  v2:
> >  - use static_assert instead of _Static_assert
> >  - add Hans's Reviewed-by's
> >  v1: https://lore.kernel.org/lkml/20251008033844.work.801-kees@kernel.org/
> > 
> > Hi!
> > 
> > [...]
> 
> Applied patch 3, thanks!
> 
> [3/3] module: Add compile-time check for embedded NUL characters
>       commit: 913359754ea821c4d6f6a77e0449b29984099663

I'm nervous about this going in alone -- it breaks allmodconfig builds
without the media fixes. My intention was to have the media fixes land
first...

Should I send the media fixes to linus right away?

-Kees

-- 
Kees Cook

