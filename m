Return-Path: <linux-media+bounces-14502-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6505391F047
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 09:34:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 966781C23C77
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 07:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFDA114387C;
	Tue,  2 Jul 2024 07:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="0FzxGbxo"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4EC74047;
	Tue,  2 Jul 2024 07:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719905639; cv=none; b=utD12YA2BwQRnaWdim0DwtqAUR+fimQn5ty+m66XSQ9Wm//mJKt2tqi9xiSz0ubzEq4ZmWAWL/pCaNJe7eD+hP6qoIAJffAKDqsxhKm2ZVe9NoFzHDdFgjzrZmYU5otY1Gz3KpMuQn0xruTc8wHPkXwZDPiOmEPN98Lfef/H9Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719905639; c=relaxed/simple;
	bh=w3GfV/hQPM47V8A8C7lB/UBMrklFJe5KZzfNawdoh7w=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=BjTWVEFcYfEG+eWy7qlIjJf+VyphmLIR4qK7JjDOjaWNn3vIatxPcz195uKQilqLp8Twgd8jz+l1ZP1V9EuMR7QheCxPox4ORcEqsbtCCZqsG1FXmUtl4AvAlcgGgv8zmUh95yEepxps9zWsTg/GPqDF3PpJVZd9etlphouQuWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=0FzxGbxo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50398C116B1;
	Tue,  2 Jul 2024 07:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1719905638;
	bh=w3GfV/hQPM47V8A8C7lB/UBMrklFJe5KZzfNawdoh7w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=0FzxGbxoE6hNMJFYe250AXSbI6hqakLsb9w+BAEm/pqQnP9Y5ZcvHfj9zmMA8cj2z
	 OYRN/NfeoRIfI0TYnF9Hqz7NuxvRf04Ufr7Jh89s1Qpcfw036CAjAJVFJJCxfrUqMN
	 60Vm8PPtFW/k/zich1LxvFIvp2EJrhNevFmAHTho=
Date: Tue, 2 Jul 2024 00:33:57 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Christoph Hellwig <hch@lst.de>, Thorsten Blum
 <thorsten.blum@toblux.com>, jack@suse.cz, surenb@google.com,
 linux-kernel@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH] dma-buf: Remove unnecessary kmalloc() cast
Message-Id: <20240702003357.6bfd1d918c56d536bb664c37@linux-foundation.org>
In-Reply-To: <e0f384b0-6913-4224-a3ea-bdae784f5dab@amd.com>
References: <20240630011215.42525-1-thorsten.blum@toblux.com>
	<20240701232634.0bddb542ddea123b48dcabdf@linux-foundation.org>
	<20240702064017.GA24838@lst.de>
	<e0f384b0-6913-4224-a3ea-bdae784f5dab@amd.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, 2 Jul 2024 09:13:35 +0200 Christian K=F6nig <christian.koenig@amd.c=
om> wrote:

> yes that is=20
> intentionally a define and not an inline function.
>=20
> See this patch here which changed that:
>=20
> commit 2c321f3f70bc284510598f712b702ce8d60c4d14
> Author: Suren Baghdasaryan <surenb@google.com>
> Date:=A0=A0 Sun Apr 14 19:07:31 2024 -0700
>=20
>  =A0=A0=A0 mm: change inlined allocation helpers to account at the call s=
ite

Dang, yes, that was a regrettable change.  But hardly the end of the
world.  I do think each such alteration should have included a comment
to prevent people from going and cleaning them up.



