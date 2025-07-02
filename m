Return-Path: <linux-media+bounces-36514-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E36F6AF0C35
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 09:05:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B2E2A4E0F49
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 07:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 461F5225A38;
	Wed,  2 Jul 2025 07:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KX5y/4JX"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F0FDF42;
	Wed,  2 Jul 2025 07:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751439933; cv=none; b=ftfXB0IW3E+reEK//l9Iuijy6t+kdwQQRssHf0ppZ9AaivlRh5YbjOf95FtTu6DXMLimWo8QfRAmM/tnjjgvJlV+r1gx6GvAkFM+0UuaUPsqc+62IDNTkLnSoVI/5O1XIKQxhxyb68CX0ofFvIIEw/5VQFP17jHN5g78VU+r3lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751439933; c=relaxed/simple;
	bh=iEjqPcF1aaJ3lSy0Olto6Xt8hIHwkTViaJph2F2T9rM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MpcDUUooPzQV9tmIEgf02HjUVl3sNF+XkMxK83GlKs/SOo6WEFr71gw6Uzsv3PF+jQC0gogFLwd+Lq5J8VeicXnYCIZ9cE86YX7NWBFlK1KJ9UyLSVatUmPeJ9svJS7qxgfOIEET/Y/DHjMPBy91jjtgqEsW35Obu1zGdr/lNkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KX5y/4JX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85C5DC4CEEE;
	Wed,  2 Jul 2025 07:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751439932;
	bh=iEjqPcF1aaJ3lSy0Olto6Xt8hIHwkTViaJph2F2T9rM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KX5y/4JXclUqcfvml4jsiNyOu3g6/DZR/L31CzOe/UO8ypBAHZYHzuO7AHd/XwJFj
	 BXnPQo/0zWdnuzZmnrOxlorSBrClQ29JBhzv2RqRQ5s1G1oNq2hNUYY3TS9lWHt02n
	 zhgFzzgG5d+yyTnsZaZ0hQzqbfo9xHTFWRM+aLLNRqY+elwDaVA5xb4Em6GtLSxkVf
	 VGKIcQ1SwFQHHzLqzFZnt8hz28uo4lmZpNHj8GSyfT2obp/A3P42KzZNzrCkvK6lT1
	 n7ajLMmt8UH0+WBsIDDe4ZHgILJmiWVgjBH4OG4FDvMyybyWF01qz1C+t8MDjOyEHU
	 ueX6cAftysnVQ==
Date: Wed, 2 Jul 2025 09:05:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: philippe baetens <philippebaetens@gmail.com>
Cc: mchehab@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	krzk+dt@kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/2] Add bindings for ams Mira220 cmos image sensor
Message-ID: <20250702-festive-convivial-parrot-1241f7@krzk-bin>
References: <aGP67H5_GxL4z2Nc@raspberrypi>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aGP67H5_GxL4z2Nc@raspberrypi>

On Tue, Jul 01, 2025 at 05:12:44PM +0200, philippe baetens wrote:
> Mira220 is a global shutter NIR-enhanced image sensor made by AMS.
> Driver is submitted in the next patch of this series and verified on a raspberry pi.
> 
> Signed-off-by: philippe baetens <philippebaetens@gmail.com>
> ---

And also you totally broke the threading. Send patches in one command -
git send-email - not two or more.

git format-patch -2 -v4 --cover-letter
git send-email ..... v4*


... or just use b4.

Best regards,
Krzysztof


