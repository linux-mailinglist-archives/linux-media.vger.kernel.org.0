Return-Path: <linux-media+bounces-8567-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD6E89759F
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 18:52:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09E311C25C1C
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 16:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D1ED15218F;
	Wed,  3 Apr 2024 16:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jQJ5OWNa"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0BA1B7F4;
	Wed,  3 Apr 2024 16:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712163118; cv=none; b=iqiVuU2eWjLsgD7cc0fm8BZCpl/H1fD/6cTym/ZrrhjroHDnc8NMHxeu/8d/Qr+NAURJjnhOEFsXgoY5Ii04T02zxfdfDelNr0llbAGf1Zy9pE+likuzQPFF6QUM6cUYsCjo6v7MAVuuK9o0CK1BBP8Y/TFsC58afQaYkwINuBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712163118; c=relaxed/simple;
	bh=749Ls6gqomWInLum9yLluZbwwLmTjtZOhHIjT4Dy0f4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n4whw2loj4/KhCVXOWNPBMSKKZtRnxwGkLqQ+43lvursUWCHpeat6dD3HvZIEQcEwMQDGndDpGd1FhgeYEVmKcAOVPuUHzSBAzPs1b08NNiIoFZHVrotbxAfy2ZKjtIB6Ls6z82I80/Jv/HvryRgG8a6KnDbIJITG4VPxmoo81M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jQJ5OWNa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2645CC433C7;
	Wed,  3 Apr 2024 16:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712163118;
	bh=749Ls6gqomWInLum9yLluZbwwLmTjtZOhHIjT4Dy0f4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jQJ5OWNaKJvaXP/+dqMyDVNnVnsKxCcWBknitKC2Na4jLl3JKXu87rU5eLLu1uyKs
	 nWk1BhE0BxPJTelKzy0NealcVFKi5pY7cwBECE+3FfRr7ZadS1uCb7kzgvwvHPyZcZ
	 wUb4wAhpC+wtdXoStQ/MRSSnnJBepPeCDDjFYWHkfso+bqGUF860xeB8IK1qBTL7Pn
	 CRxBmBaG7Az0BLsKHjq3MQNFU1Y01g1utKXbzYHnYS7Oa7Jo0rj5hhQqv9bt7xTew3
	 0Cwf6iXbVP9iMmk7vg4QTNswbn1O7H64PT+E7q6b2T4aAsFqDkvLba3LrtR13rAML5
	 KqFfQd+SKIzoQ==
Date: Wed, 3 Apr 2024 11:51:56 -0500
From: Rob Herring <robh@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: Fabio Estevam <festevam@denx.de>, krzysztof.kozlowski+dt@linaro.org,
	laurent.pinchart@ideasonboard.com, devicetree@vger.kernel.org,
	linux-media@vger.kernel.org, hansg@kernel.org,
	sakari.ailus@linux.intel.com, conor+dt@kernel.org, rmfrfs@gmail.com
Subject: Re: [PATCH v4 1/2] media: dt-bindings: ovti,ov2680: Fix the power
 supply names
Message-ID: <171216311346.3977852.12166569871249018805.robh@kernel.org>
References: <20240402174028.205434-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240402174028.205434-1-festevam@gmail.com>


On Tue, 02 Apr 2024 14:40:27 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> The original .txt bindings had the OV2680 power supply names correct,
> but the transition from .txt to yaml spelled them incorrectly.
> 
> Fix the OV2680 power supply names as the original .txt bindings
> as these are the names used by the OV2680 driver and in devicetree.
> 
> Fixes: 57226cd8c8bf ("media: dt-bindings: ov2680: convert bindings to yaml")
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
> Changes since v3:
> - Newly introduced.
> 
>  .../bindings/media/i2c/ovti,ov2680.yaml        | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


