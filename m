Return-Path: <linux-media+bounces-44338-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A71BD776D
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 07:41:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 311374F06D3
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 05:41:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A994729D269;
	Tue, 14 Oct 2025 05:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C9KLe9gI"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE8529C321
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 05:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760420490; cv=none; b=h0PXQYda+85z+UDHYn0YJRYQs2ik8CCumNAXa1EJN8Htjdp+W967G8lhzAc98NP4KdZ0bOk4lKm0+inL63sVpZ3gmL8+e0edRs97r3/axuBJk+4sJ2S13fnw+IuHYQx/3pGz8E5Va/Ci0cBlJ5iaKn1o+xhkJcE4GKTBl3wM3AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760420490; c=relaxed/simple;
	bh=TZ4j1XVleqYvIDIQdgljUJbFZbVi96t3uJfO2YR6ZbU=;
	h=Date:From:To:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=D06zjHVQzwaCcIVwipvq8Rps0anvvnOcMpb+0dAlEDApAzPdJ3LeRAVfLgqJ5da+kJZSUMn4/zBXzyvbvxnAWvdJgGvxEZceZW21+Zb5cW3LJ9mR6B1S81SkleIC9OEpCVNSikdviENv+2xdFmjZIgQAK3tgzCMfhrusuEt4ldg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C9KLe9gI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEA2EC4CEE7;
	Tue, 14 Oct 2025 05:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760420489;
	bh=TZ4j1XVleqYvIDIQdgljUJbFZbVi96t3uJfO2YR6ZbU=;
	h=Date:From:To:Subject:In-Reply-To:References:From;
	b=C9KLe9gIJSRAB67yMqRDc0gxDGBlStrgAHlqCzHTlC/PfreJfQQ/FjoK9E11jv8PE
	 nKcwT/4W/J9Miw0kZQY2/0pn6dMZzh0+nItQGB701g3/QpIYKhay5BvjHW0aLJTSIb
	 GLzMTXLNi9vpSS3A0oc9z22AsHolt+fn/9nA+XQBcbO/M6kCTiCXmHwLw/y9yQ5L/1
	 qD06NKt1x1DuE9AxyFws7uoJyzhh2HxQdCPLWgRlAmdNTfH0Eiw0WS2YojSlS/A+VM
	 uFRS+3bQFddDo5oCdeMo9wQrbDtGbitOawnAFyua5784qqHh1vKM7I2O2f1XT6kt9O
	 wuq+3CzN1Oy8g==
Date: Mon, 13 Oct 2025 22:41:29 -0700
From: Kees Cook <kees@kernel.org>
To: linux-media@vger.kernel.org, Patchwork Integration <patchwork@media-ci.org>
Subject: =?US-ASCII?Q?Re=3A_=5Bv2=2C0/3=5D_module=3A_Add_compile-ti?=
 =?US-ASCII?Q?me_check_for_embedded_NUL_characters?=
User-Agent: K-9 Mail for Android
In-Reply-To: <68ed624c.050a0220.3ba739.64ea@mx.google.com>
References: <20251010030348.it.784-kees@kernel.org> <68ed624c.050a0220.3ba739.64ea@mx.google.com>
Message-ID: <D1CBCBE2-3A54-410A-B15C-F1C621F9F56B@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On October 13, 2025 1:34:20 PM PDT, Patchwork Integration <patchwork@media=
-ci=2Eorg> wrote:
>Dear Kees Cook:
>
>Thanks for your patches! Unfortunately the Media CI robot detected some
>issues:
>
># Test static:test-smatch
>
>drivers/media/usb/usbtv/usbtv-core=2Ec:157:1: error: bad constant express=
ion

Where can I find what this test actually does?

>For more details, check the full report at:
>https://linux-media=2Epages=2Efreedesktop=2Eorg/-/users/patchwork/-/jobs/=
85913402/artifacts/report=2Ehtm =2E

This webserver appears to be misconfigured to send compressed output witho=
ut the right headers? I can't actually view this URL=2E

-Kees

--=20
Kees Cook

