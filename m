Return-Path: <linux-media+bounces-51059-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5107DD3AA72
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 14:36:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6607D30892BA
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 13:33:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D289369992;
	Mon, 19 Jan 2026 13:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fM35nSQV"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F080B309F1D;
	Mon, 19 Jan 2026 13:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768829611; cv=none; b=g02/qlZq76A2m10XFPe6D1HfLH2GD6ljGvrnSHLh0R7c5ZDDLDQaA8uYXnlAsBfTuR+vQkMZ7WF2b2rwMlS4ZOxB4GKsg0HW8+20FMuqMw4bNIE/lhZpqb2f6Sqy4jxaWIj4NoOOJ8+LmH9dO6he0WDPHoxNBS6+wDX2+TboS5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768829611; c=relaxed/simple;
	bh=8fGKbiXSuaskQQ0Ap4cVCYo2PGF9Yb15kLd9rCnoU/I=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=N+wT1o4oqVj+qbs6T09LPK3GSnwJDVH3bo8QjuR/3kqMtr65CprFCjjJuX9V4T69gn9vwEN2Sj0J9Y+ZopicRCBSPlppb2GvYcASs7ohu6oSR5Fl10s1jkOeT9X/Rtes5GQH1GUypHkd3HiUsV1yX+zUWvVvdfrm+YOsdyvRaAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fM35nSQV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DE28C116C6;
	Mon, 19 Jan 2026 13:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768829610;
	bh=8fGKbiXSuaskQQ0Ap4cVCYo2PGF9Yb15kLd9rCnoU/I=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=fM35nSQV7rbCwksZUGPNHyGEGUnzIgJOtDWs+YQj4OFjlFKRORqcz0C2Otv3ngylx
	 0FAJxuMD/tjvkIXEmah8j2c54cNpUToyOfutqfTFTHNM84sHhwzw5yxnhm5D/xM6Qe
	 PeYKy/isphedVoYtMkJYq7Vh661dhBSROPh5BqGppx7LeA6vXemQDIc/DOlunwFmBu
	 I9WMX/qc62Rh4zI/zA7cjCNFKAEYxToKFs53xdc0psKCTA3GrdEJpgCkBd1zI5WA92
	 aO9y51hkEs3pG+RDyyWmZMekthM34dorjwExHjdfyTRwrIQUsxLa4Ks3qn1B2mGny1
	 ubUtaNBngS9bA==
Message-ID: <d4a199738a7de363a50e349ad6a9a26e@kernel.org>
Date: Mon, 19 Jan 2026 13:33:27 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Eric Chanudet" <echanude@redhat.com>
Subject: Re: [PATCH v3 0/2] dma-buf: system_heap: account for system heap
 allocation in memcg
In-Reply-To: <20260116-dmabuf-heap-system-memcg-v3-0-ecc6b62cc446@redhat.com>
References: <20260116-dmabuf-heap-system-memcg-v3-0-ecc6b62cc446@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, "Benjamin
 Gaignard" <benjamin.gaignard@collabora.com>, "Brian Starkey" <Brian.Starkey@arm.com>,
 =?utf-8?b?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, "John
 Stultz" <jstultz@google.com>, "Maxime Ripard" <mripard@kernel.org>, "Maxime
 Ripard" <mripard@redhat.com>, "Sumit Semwal" <sumit.semwal@linaro.org>, "T.J.
 Mercier" <tjmercier@google.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

On Fri, 16 Jan 2026 15:05:37 -0500, Eric Chanudet wrote:
> Capture dmabuf system heap allocations in memcg following prior
> conversations[1][2]. Disable this behavior by default unless configured
> by "dma_heap.mem_accounting" module parameter.
>=20
> [1] https://lore.kernel.org/dri-devel/Z-5GZ3kJDbhgVBPG@phenom.ffwll.local/
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

