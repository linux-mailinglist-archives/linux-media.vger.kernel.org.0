Return-Path: <linux-media+bounces-46233-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BD3C2DF14
	for <lists+linux-media@lfdr.de>; Mon, 03 Nov 2025 20:50:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BF4218833D9
	for <lists+linux-media@lfdr.de>; Mon,  3 Nov 2025 19:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7148B29BDB5;
	Mon,  3 Nov 2025 19:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ij1Ejwlf"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3291D63F3;
	Mon,  3 Nov 2025 19:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762199442; cv=none; b=r8wsXM+J3ZrMklqHYE746GcpdFysUMcvh8YgObx0fNJC3A6/nphlDvVqFd2ghTgVyqV1elRFObeYcL+xCpMBxsnAlyhR1b2zmoKLh76ID+C1R7FF2ltHS5e5ai6WyJdgIRvvQvq8c8VEu3Ov4QeEP3fNM4mALs5Rs7Vlh3Z7jrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762199442; c=relaxed/simple;
	bh=enGHIs4CYZaSjrMsHT1Pdfu0yIzXOGToAS03vAY2p5s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DyRpcLNso0/v2dXFsDl7oujDJTfFpz71f2gbXx6EHKKUQgQNnGMM9/kLCBndafOrDPvijFTpS1wwm0L1MwWF3RGa9nhA8MZgDTm6VzFIL1H5u7Hw5IY/pk0CggetUwUFLNGNS05BJP+yaXqcPdLCzaSnApmZ4Q7nGd/MAT/n/os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ij1Ejwlf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2DD8C4CEE7;
	Mon,  3 Nov 2025 19:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762199442;
	bh=enGHIs4CYZaSjrMsHT1Pdfu0yIzXOGToAS03vAY2p5s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ij1Ejwlfokk1GTXC5reRyqLTxNWolYonW7JSzakzX5ATZcUM2cKNzYKlupm9ZVx4x
	 VcsDWIZ8UIRK7mrWwJPaWG0a+LLl92WEjMMyMPt84Kb4p6JmrHvrhpcS5Wb3MMzfko
	 BZj2PgMOeVOw/mt+vQkR8fIQyhfGDIWnjvxVEBHz2d/7zmXTUBoFn4p2J6bvj9SOCZ
	 +ObOePxd0RymklUqDimMwldDegUlAWkiOqBiGhPfIkQcO4sTQHX4W6pjsWTNz51Vn9
	 kWtlvVx52LYSdQeSoiEi/yhVcA5I9CdOzKZRk4z16382dCOzdnvQQYImbFCnPHhkpP
	 XPgj7wnMP69JQ==
From: Daniel Gomez <da.gomez@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>,
	Kees Cook <kees@kernel.org>
Cc: Daniel Gomez <da.gomez@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Malcolm Priestley <tvboxspy@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Rusty Russell <rusty@rustcorp.com.au>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 0/3] module: Add compile-time check for embedded NUL characters
Date: Mon,  3 Nov 2025 20:49:43 +0100
Message-ID: <176219902728.2668573.8447418880394997824.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251010030348.it.784-kees@kernel.org>
References: <20251010030348.it.784-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 09 Oct 2025 20:06:06 -0700, Kees Cook wrote:
>  v2:
>  - use static_assert instead of _Static_assert
>  - add Hans's Reviewed-by's
>  v1: https://lore.kernel.org/lkml/20251008033844.work.801-kees@kernel.org/
> 
> Hi!
> 
> [...]

Applied patch 3, thanks!

[3/3] module: Add compile-time check for embedded NUL characters
      commit: 913359754ea821c4d6f6a77e0449b29984099663

Best regards,
-- 
Daniel Gomez <da.gomez@samsung.com>

