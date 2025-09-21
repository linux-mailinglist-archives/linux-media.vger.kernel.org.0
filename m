Return-Path: <linux-media+bounces-42842-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7ECDB8DF80
	for <lists+linux-media@lfdr.de>; Sun, 21 Sep 2025 18:27:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B74D21899D6E
	for <lists+linux-media@lfdr.de>; Sun, 21 Sep 2025 16:27:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83C02215F6B;
	Sun, 21 Sep 2025 16:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oqs2RA8s"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00551B87E8;
	Sun, 21 Sep 2025 16:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758472015; cv=none; b=pYNsONiag8Y4ugByUDT7/QDQNWVRklZcdIpcRPAx+BdUQuWzmW7MjxRp6cIPM3d8uxmT9EnchLuAfBMc6hTpT1OrQoXLq/Xx2TbI+aRmx3JBCPQaEdzGquBmLD6b7itTk2yYetjwmjbVuH3zHENJFs4V8weqKWq/nMqdAM+Ul8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758472015; c=relaxed/simple;
	bh=DnyM/HiW2L8/+nO6lf5exBhkmRcu83sEQj8T4rqCO0c=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=s8Kd7AdT92ABFwXN8jvxRP67Uf8uCf6zgKuFhxrEuPM8YdSbG9ys9rq7f16IuV4Uf+zBDYbutnYXaCEIMbc10h3tBS6Wjj6CNeYLhBBVkuX3oCwdVzGTyNnuRa6i7vbk7sGtjB7+VR0mM4ZvkAlEb9ohruC++G2VBlVfanFA91A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oqs2RA8s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E495C4CEE7;
	Sun, 21 Sep 2025 16:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758472015;
	bh=DnyM/HiW2L8/+nO6lf5exBhkmRcu83sEQj8T4rqCO0c=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=oqs2RA8sdQxc/94driMw2SpJWiaz00MozT5Ndygo6NXhYV1zs1DUPGz4RnWmAnmoA
	 vM5gY/rQUvBCsWZ7OXbTDtZrCh6kRprI72x+2B3bcstCCsVZZ5Rso4Cp/XjuKjkeb8
	 BZr6MtkF7HLKwsBRc1AhpKyxuK2v4D/5ByYBsCBKg6o7BW1iUbkd33MdaMyf0J0QR5
	 gbGTQa6egQESHWTM6AXVggwYyfNe3sDbbyHer0/TSXZRyZ3pn36BCYHZ5vt0aTpCld
	 wweJcEFHgt2x26i2pjKF6snTrZZhwo3VVaJXrX+bjc2JxCr4JQYwT3IRkWD1XJt7Wb
	 zekgiDZuyb3jw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250912-master-v2-4-2c0b1b891c20@gmail.com>
References: <20250912-master-v2-0-2c0b1b891c20@gmail.com> <20250912-master-v2-4-2c0b1b891c20@gmail.com>
Subject: Re: [PATCH v2 4/5] clk: st: flexgen: remove unused compatible
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
To: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Patrice Chotard <patrice.chotard@foss.st.com>, Raphael Gallais-Pou <rgallaispou@gmail.com>, Rob Herring <robh@kernel.org>
Date: Sun, 21 Sep 2025 09:26:53 -0700
Message-ID: <175847201377.4354.4235111396754845133@lazor>
User-Agent: alot/0.11

Quoting Raphael Gallais-Pou (2025-09-12 04:36:11)
> Following B2120 boards removal in commit dee546e1adef ("ARM: sti: drop
> B2120 board support"), several compatibles are left unused.  Remove
> them.
>=20
> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
> ---

Applied to clk-next

