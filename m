Return-Path: <linux-media+bounces-42843-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63747B8DF8D
	for <lists+linux-media@lfdr.de>; Sun, 21 Sep 2025 18:27:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D404189A461
	for <lists+linux-media@lfdr.de>; Sun, 21 Sep 2025 16:28:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F9EB23B63B;
	Sun, 21 Sep 2025 16:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EDYIuLMv"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC89F249E5;
	Sun, 21 Sep 2025 16:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758472063; cv=none; b=sYnwI7w5mzrU6wP+5IIAgi51bPzJC0TtJjaILoUDTOhEfT68Vj/G+siTtAIWpxUqIzQ/tUaTBoW9GYNoKsV5n4xsYt1WpUH/+gbePSss30xXYJL1j1cSnDj4UXkFcqfX+Tl5xtakRDdz08B8cwg2uMVRhzVShRxoxtsNZOHA/wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758472063; c=relaxed/simple;
	bh=Juiz871kv5CBXmpODGGbYwKbUNo5yPf1gnJK3yHR9eM=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=A+UIGFHlBY7Q9FwGW5Qm/weEopBSW6tPpJsRNP2yVfuJJ/5YLCbgDtVz5ka5YcfSo2cBoYPtPiBHZwQwfQXNpRZKOH0opKlZ47vE9TOYO40Zx4xa+5DhMu1mAvEw0F8dH6ebplrfGdPGiIl67yPDK+dfcKmZvsB9nMGe+2/FDwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EDYIuLMv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 265DEC4CEE7;
	Sun, 21 Sep 2025 16:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758472063;
	bh=Juiz871kv5CBXmpODGGbYwKbUNo5yPf1gnJK3yHR9eM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=EDYIuLMvKK6Qam04j91zYtHSvtlXcvYZmno+z1CGJV2mSGS5dclzNFuDr2aqLi5oG
	 S9ay+yycCThu+EDj2QwsT8KQE9pjfe9/OYzorGqp1xoJWQkI1h655OgeXSFNSfQbE9
	 nD+Np43SLUFrs5oAhPWcErzTvPpjri6YzmmIUjPhPnTw5ryKPBmqq/XsfyVnIE2JG6
	 jrz/uyuQYnbqAwKz5xqytab0EMqZPDap3XtwV187U63h+atJAng35Y0vYyNi1+Zljb
	 f8JMe/Qi/GkyNsaF+6m1/wG1K4ieFo6N8vddNqfYV1zrxedTZ2S6pYhqopkDKoIk2H
	 Mj7K2Qydd5UdA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250912-master-v2-5-2c0b1b891c20@gmail.com>
References: <20250912-master-v2-0-2c0b1b891c20@gmail.com> <20250912-master-v2-5-2c0b1b891c20@gmail.com>
Subject: Re: [PATCH v2 5/5] dt-bindings: clock: st: flexgen: remove deprecated compatibles
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
To: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Patrice Chotard <patrice.chotard@foss.st.com>, Raphael Gallais-Pou <rgallaispou@gmail.com>, Rob Herring <robh@kernel.org>
Date: Sun, 21 Sep 2025 09:27:41 -0700
Message-ID: <175847206190.4354.484711272634275190@lazor>
User-Agent: alot/0.11

Quoting Raphael Gallais-Pou (2025-09-12 04:36:12)
> st/stih407-clock.dtsi file has been removed in commit 65322c1daf51
> ("clk: st: flexgen: remove unused compatible").  This file has three
> compatibles which are now dangling.  Remove them from documentation.
>=20
> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
> ---

Applied to clk-next

