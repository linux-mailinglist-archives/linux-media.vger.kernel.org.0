Return-Path: <linux-media+bounces-18431-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 180BD97DB06
	for <lists+linux-media@lfdr.de>; Sat, 21 Sep 2024 02:33:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CCF4A283DE9
	for <lists+linux-media@lfdr.de>; Sat, 21 Sep 2024 00:33:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F0614A0A;
	Sat, 21 Sep 2024 00:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YEmen7b0"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C6F28F5;
	Sat, 21 Sep 2024 00:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726878779; cv=none; b=Iu8DriCowC7CEzSk/+xIdst01K8UC7qEk7mZNDmX2DuQMpQb4xgbU25rzUAoPpuSyxQnv6MFzmkM7wvh0ehrcwxL2Fng6N221RQz0oFiytCxm+oj6/GJeLLGKlGaFb56A4+VyK+tZQXVrnD+RhPYshX4qdEsBMY3b5crF4T8YM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726878779; c=relaxed/simple;
	bh=BBSx2iDldeOfrcbYfEwO9DZKSzlFh3eC5t4qtwhBVvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ic4XhI1lvRq61+gve6wzmGbkSODKewhDqMWrhTI/rK+FgFaDu6Kq9rSufHGZCsOk/DSL9p6VgQdpx+IxmroTWQ1HXkvY3HD1f3mYP5bzLT+a4a1bjpdjfWN5gM1/pNq5d0aLXPyDeeZZEuW1GeWAjvsgXLm9YhM7l1OwxvgiICo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YEmen7b0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 416D3C4CEC3;
	Sat, 21 Sep 2024 00:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726878777;
	bh=BBSx2iDldeOfrcbYfEwO9DZKSzlFh3eC5t4qtwhBVvY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YEmen7b0KBASKUTIF+dEpLiwBZKqQtbppJ5cuqI7D+wm2BEED8PkHS05a+r4ToRS+
	 qynke/OUcY2I0Xo2aZgoFznIaXnJ0mcj5rrypLWIkWYxu6mU7ae4i8TA26vIH6RvMb
	 O9dQva7BEEGuaiiqKZ5yJPiQ1n9tmlvGn3Bfh57FC5l2MR5LXH0nahE7OggLz8rDW4
	 klOzJMuq1ihMrOGE6ghqSVtGkhtxr8nYXIBS8MFXTfJPqX7uAIUkO8K2bvTCP7FAvD
	 X84xA00bgOsLnlZzTXo0u6yvYLOUYPoEHKl/sxzKViCc02hI/QDGeNo8mHZNmKCN6x
	 S/pDKlNEcDkyA==
Date: Fri, 20 Sep 2024 19:32:56 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Keke Li <keke.li@amlogic.com>
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	dan.scally@ideasonboard.com, kieran.bingham@ideasonboard.com,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v3 5/9] dt-bindings: media: Add amlogic,c3-isp.yaml
Message-ID: <172687877578.158798.13851279447258537000.robh@kernel.org>
References: <20240918-c3isp-v3-0-f774a39e6774@amlogic.com>
 <20240918-c3isp-v3-5-f774a39e6774@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240918-c3isp-v3-5-f774a39e6774@amlogic.com>


On Wed, 18 Sep 2024 14:07:16 +0800, Keke Li wrote:
> c3-isp is used to process raw image.
> 
> Signed-off-by: Keke Li <keke.li@amlogic.com>
> ---
>  .../devicetree/bindings/media/amlogic,c3-isp.yaml  | 85 ++++++++++++++++++++++
>  1 file changed, 85 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


