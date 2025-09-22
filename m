Return-Path: <linux-media+bounces-42965-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9338BB93377
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 22:25:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 572062A6AE8
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 20:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E113531770B;
	Mon, 22 Sep 2025 20:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uORVKCxb"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD032AE68;
	Mon, 22 Sep 2025 20:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758572729; cv=none; b=nxI4fNwPWKqEhft2fu+zfnPRwkpN8665HnA/75m8aqqI3ix0LsKEITjxHwsLwCht1s8Wz6Ecyx3wLzAof7Kdn6SaA0gYwqzKLuPB2LgfJIL8GedzupbpZA6ckMY/P+YcXChXN8X8eY1atkLY4log2TsIDT4FI8ZS9DQDPP1ssTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758572729; c=relaxed/simple;
	bh=33P7EYy8b2xhtI5WN0lnv5DDfqZ1xQyv4S8UZazIl50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rG3HGh+2CG/bTK1H7bRBEigkUzTshM8blEqJMkbMUVTS2SeVreoV20YXudNjyNoEJWYzPv2FdBoAD0Nn9giuH356UT3JRSs+lPtIz5/jcZai8tMQZDphOJQxmBaDjuh44pS00ITvAU6+ws1etxtUrfYg+bhOio3hCvbt1hlycds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uORVKCxb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3DF3C4CEF0;
	Mon, 22 Sep 2025 20:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758572728;
	bh=33P7EYy8b2xhtI5WN0lnv5DDfqZ1xQyv4S8UZazIl50=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uORVKCxb5/U++PIX+zKZ7/ZDND+ou2WJqQBJMaSWFzrJUSUBskGZEWZedK4nLHiaV
	 EJInRQ0qLexQ4uAeUnoKzzuZ/zdsc5LCRfm3W9fJiplbDY6pDhhzdss4MM2uePZlp+
	 JrX0jrIMCHLBSjh+xKfnM7G6bKaZ+e2ReZetzrER09IjzYo91HtEW0EI/fLdRhS6Qf
	 McpI90mV9LsJfPwO5vC58zBh0SbdATnDwQ728EeXJoxnGMv6ZoWkZgZmADBrOlJl9N
	 G3zC7xEaAFrldarAoxfRlSR3n8yUxT+PcgiHc+EKJoR2ksvc6VIoHziAuf+QkO13DQ
	 lLX5NnKXfi4+Q==
Date: Mon, 22 Sep 2025 15:25:27 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
Cc: Val Packett <val@packett.cool>, linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Conor Dooley <conor+dt@kernel.org>, phone-devel@vger.kernel.org,
	Daniel Scally <djrscally@gmail.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/8] dt-bindings: media: i2c: Add DW9718S, DW9719 and
 DW9761 VCM
Message-ID: <175857272737.1273170.8254529909120957681.robh@kernel.org>
References: <20250920-dw9719-v2-0-028cdaa156e5@apitzsch.eu>
 <20250920-dw9719-v2-1-028cdaa156e5@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250920-dw9719-v2-1-028cdaa156e5@apitzsch.eu>


On Sat, 20 Sep 2025 14:03:40 +0200, André Apitzsch wrote:
> Document Dongwoon DW9718S, DW9719 and DW9761 VCM devicetree bindings.
> 
> Signed-off-by: André Apitzsch <git@apitzsch.eu>
> 
> --
> 
> The possible values for sac-mode and vcm-prescale of DW9719 and DW9761
> are missing because there is no documentation available.
> ---
>  .../bindings/media/i2c/dongwoon,dw9719.yaml        | 88 ++++++++++++++++++++++
>  1 file changed, 88 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


