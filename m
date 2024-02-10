Return-Path: <linux-media+bounces-4943-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F39850523
	for <lists+linux-media@lfdr.de>; Sat, 10 Feb 2024 17:26:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C89701F220F9
	for <lists+linux-media@lfdr.de>; Sat, 10 Feb 2024 16:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE3205C5E5;
	Sat, 10 Feb 2024 16:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pyV0PQpX"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118AF5C8F6;
	Sat, 10 Feb 2024 16:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707582376; cv=none; b=EDrZX511m1utvYTtCSl9ArkYmQ232pvkbLJifOIDjIFbMGKgcNoQiO8A5OVS9tNiYSm9n0CLue4aqLTThODb2wauEXxwSTC5hK3l3P32h7ggv64a8e0ojJe4N5v+Agvl/SG42a/wKd8HNJOT27DdPcnToMI5FVyUuu1LMRPjtE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707582376; c=relaxed/simple;
	bh=8allh953qRq+FkPhlKlFLrA6vI+IHSsRCMREoY5ZPHc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JMvFyImLpZKyeNnldP5sG+Noq+9qJZkxLxbIHlVCBnZuYIQvE+z/EONiXFxlzhubvKXXvV058bRAOteZNiNvEUg+hrURGb1+msxjBuMPcHE6L4jzWAgbqLdlxWDHhA9BB8oLk3ktXEZUf83TK30mctuBzZhqgaDDBZRUrcxpBd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pyV0PQpX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B24A4C43390;
	Sat, 10 Feb 2024 16:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707582375;
	bh=8allh953qRq+FkPhlKlFLrA6vI+IHSsRCMREoY5ZPHc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pyV0PQpXXnnuKVBQH2G/l1k6l95aBF6OiN0S1LxZ1YJQwBrV0uQksgweYYmCAAMPw
	 OtSF2Rslvdo6tIGxD12NTyS+ngSagmAwQNbQTbIY7JjQiL53Rme3Yj6Q+EeXemVPR1
	 N73cBi9kxIR2Tz5rrJR0Q7P9xTsaW16pnMGT5E/KKvQlc3Ieo6BB5IRI2Oz6Uedg11
	 CouY5NKdUep1nZ+tiriT/IWFN4exz/1R8UB08a3ciX09cxfoy9yGtgsz8Lan70kNly
	 OvUdkJozKlDiMHX9tD3kpCWncONrGLNYBUCXrWFxXgZN+1PcgVpWiikJiiMznwEz/C
	 7B6NlJihKEUEA==
From: Miguel Ojeda <ojeda@kernel.org>
To: nathan@kernel.org
Cc: justinstitt@google.com,
	linux-media@vger.kernel.org,
	llvm@lists.linux.dev,
	mchehab@kernel.org,
	morbo@google.com,
	ndesaulniers@google.com,
	patches@lists.linux.dev,
	stable@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>
Subject: Re: [PATCH] media: mxl5xx: Move xpt structures off stack
Date: Sat, 10 Feb 2024 17:26:04 +0100
Message-ID: <20240210162604.342349-1-ojeda@kernel.org>
In-Reply-To: <20240111-dvb-mxl5xx-move-structs-off-stack-v1-1-ca4230e67c11@kernel.org>
References: <20240111-dvb-mxl5xx-move-structs-off-stack-v1-1-ca4230e67c11@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> On Thu, 11 Jan 2024 17:40:36 -0700 Nathan Chancellor <nathan@kernel.org> wrote:
>
> Closes: https://github.com/ClangBuiltLinux/linux/issues/1977

The next one: 1978 :)

> of the stackvia 'static const', which is a better location for these

Nit: space.

Built-tested for loongarch64:

Reviewed-by: Miguel Ojeda <ojeda@kernel.org>
Tested-by: Miguel Ojeda <ojeda@kernel.org>

With this applied, I have a `WERROR`-clean `defconfig` build with a Rust-enabled
kernel using LLVM 18 (using LLVM-provided apt pre-releases).

Thanks Nathan!

Cheers,
Miguel

