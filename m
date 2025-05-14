Return-Path: <linux-media+bounces-32531-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B566AAB74F8
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 21:02:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C15117A75D
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 19:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DF9A28CF56;
	Wed, 14 May 2025 19:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IdnHNENT"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74D827FD7F;
	Wed, 14 May 2025 19:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747249335; cv=none; b=E9LLjCT1ZERnITTz96DAuf6eKB7B+PvKRh8j3pO6pqVhU8B0o/m6CUONw3V4VmeBkha2VQB29rMg0hQUnmKPitpi4F5O+6gIOdqBWTbAWYLyRxGKJfkEObguIcWSKoruihtDSjuxPhanmNTZvbF/1yoXSFrK2zq0w5i1mldDdGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747249335; c=relaxed/simple;
	bh=qckdhnOroLOIn0+Ty5qwey62vScSAhbxfSwhKJP9TYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pADlafd2p1MluYY5c40Xeb8Jjjpgo1cd/zdH+5bgvz/oRIg4FM9wbb16b/4UZZCE4lZipeJAH+AkknLObpWsYI5Q/x5Xrz0AoaVRaoETTqEGsYxmUuUIu1WEwP4yfsKwnltYByJrPCjGIvr2DsU0gvonE9rck8zvKoCh92iiV3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IdnHNENT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0513AC4CEE3;
	Wed, 14 May 2025 19:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747249334;
	bh=qckdhnOroLOIn0+Ty5qwey62vScSAhbxfSwhKJP9TYo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IdnHNENTKElFqeFDfl+fxuyzYv8u3Um1KeZJhIcND6axKeuf8Q9Fg7gP078D3+lcS
	 ZEpSCMZBsAw7haaytqfMmYp85u2L52bZSKU3mOlIMmQx3KoXG5EM33OAtV67tnN5Fg
	 ud7RWP51Gf/Dubc/gZx2pKICrBS0ijVeoAcyq12cngFiVWJsFdLhGXFAL3Y7KimJqG
	 AQ5oq4IjUo4phus6NIu8CCI0G/hK1+rEnevkEwZTjwsoLX3nUT51q9+Y6CqYARAymz
	 QWEKUzK9NqTs+A/1jr3w7UHYOpuJo0PSvRWNgIvVKx3DMgGKJF5xkY5elPQYqTHXHQ
	 oUP97g6naMQmg==
Date: Wed, 14 May 2025 14:02:12 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-media@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/1] media: dt-bindings: mipi-ccs: Refer to
 video-interface-devices.yaml
Message-ID: <174724933184.2826365.6297808261187117339.robh@kernel.org>
References: <20250507063651.52322-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507063651.52322-1-sakari.ailus@linux.intel.com>


On Wed, 07 May 2025 09:36:51 +0300, Sakari Ailus wrote:
> Refer to video-interface-devices.yaml instead of documenting the common
> properties here.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../devicetree/bindings/media/i2c/mipi-ccs.yaml     | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


