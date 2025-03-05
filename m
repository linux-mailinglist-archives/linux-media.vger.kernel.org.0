Return-Path: <linux-media+bounces-27554-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2578BA4F7CF
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 08:22:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E41516F3EB
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 07:22:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BDF51EDA0C;
	Wed,  5 Mar 2025 07:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GNPXMhdo"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CB084D08;
	Wed,  5 Mar 2025 07:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741159313; cv=none; b=RL80nV/uH8U25fTD/v1lWNbPjfYgBMZffaciZcGj+1kzoM2dpG6HEIRHC3/ldv3BtU6Nge5J6OtABvcNKvEW1l54umZncJtLOL6V0ENHdaAbzuaYBToc20YLCYqYlsQpumstnmyapLOjDdnqjP1qQFbr5VYz4J9HnjtvrI1S78k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741159313; c=relaxed/simple;
	bh=NfVfEIy9JAsmc2M4fDTDmPxs03YQCbRkrjjQCG7x4YM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n/1j6yDQeeIh9T5QJAqZJdeZuUo5sxytLrYsoJbwg+bA48OGaMVJQNC1rYtrDmSqR0/1ttffXdBZg0pN9moKYThBsd2OM4ySwgsL04YaiH9MtDdOMUH5eUl6mX1hS+5MRPG6CtIBBaOHgdU7wzULxiL7N2WtQS6kOpln1yk2f2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GNPXMhdo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D460AC4CEE8;
	Wed,  5 Mar 2025 07:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741159312;
	bh=NfVfEIy9JAsmc2M4fDTDmPxs03YQCbRkrjjQCG7x4YM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GNPXMhdoakBXg5//XWkJvhhdG1cXWnLLSCH8/V/YYCwZk4ilIYKgk5IjOTZVdTabU
	 PTwy74ZGOf6YKw1HQ2LutsAAxrIj4Bs+OK4NL7QAZiyuwcOqsfP7hQzIq9c86CAx8U
	 zEJwzEqlvq4PHDP9gfa648WGrjIQf5XV5Ej2yXDMHQNsS9W/OoUpeipIWJCs2uJLse
	 1Fz59U7bvkvlRoLR66hKnRmsUlFcWzLgZGazi5c2Lc583XlykxSPKErm5+1OBjGPAB
	 jtVabQSpW9JEgmhm8uDrBFmsJlwHPntHRpv8K/EhxXmNWY+flg7qOBQ49QHL4P5xxK
	 8LmS2XgqNRUrQ==
Date: Wed, 5 Mar 2025 08:21:49 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mathis Foerst <mathis.foerst@mt.com>
Cc: linux-kernel@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, manuel.traut@mt.com, 
	mathis.foerst@zuehlke.com
Subject: Re: [PATCH v2 1/7] media: dt-bindings: mt9m114: Add pad-slew-rate
 DT-binding
Message-ID: <20250305-vagabond-viper-of-imagination-bd8a46@krzk-bin>
References: <20250304103647.34235-1-mathis.foerst@mt.com>
 <20250304103647.34235-2-mathis.foerst@mt.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250304103647.34235-2-mathis.foerst@mt.com>

On Tue, Mar 04, 2025 at 11:36:41AM +0100, Mathis Foerst wrote:
> The MT9M114 supports the different slew rates (0 to 7) on the output pads.
> At the moment, this is hardcoded to 7 (the fastest rate).
> The user might want to change this values due to EMC requirements.
> 
> Add the 'pad-slew-rate' property to the MT9M114 DT-bindings for selecting

Old commit msg? I see different name.

> the desired slew rate.
> 
> Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
> ---

With fixed commit msg:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


