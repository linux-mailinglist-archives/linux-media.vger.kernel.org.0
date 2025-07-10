Return-Path: <linux-media+bounces-37439-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A83B00F60
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 01:12:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8CDB03BA870
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 23:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 574C82C159D;
	Thu, 10 Jul 2025 23:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="axRt43hi"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54242C08D7;
	Thu, 10 Jul 2025 23:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752189101; cv=none; b=ElcK0AOiSOA8wIzEmTCw3/cO/PRXGy+0vntCDoPwuFBeE/+iBAzWym+0HnnB3WO82e575uF/Ga0V2pHR2JLpHplYt1LrPYI8LaWvJ0icFXgboCoUJTdaVL6pogUFnOdS1FVgyFCuLpHARLaC9mwqJjBOVyPA6fS6KajNtfKC1G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752189101; c=relaxed/simple;
	bh=3HMmJn3yVK4MNDJ0kYXM5ifHyjOzwsIdDSU5mP8AOHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FN9N8pEIAtxvKpYjPJ1S7BYi+r2AWZ6NAaxMuQYT2ymwENZMvdKdpnxuapV7ZflEL6M0hEAvteP2IBXhY1ZkrKfgikPUhwMvBxiLRpuOkJ1NN8fEY4lLLXKnut1zFNK2tpW17J9uwPgCmfP1ZDSpGRz2X4mKaivz1DTR+1ChCto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=axRt43hi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B18EC4CEED;
	Thu, 10 Jul 2025 23:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752189101;
	bh=3HMmJn3yVK4MNDJ0kYXM5ifHyjOzwsIdDSU5mP8AOHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=axRt43hi2l8T7bG2P3a1bw0fzg24tnjjG6e5+5ZQdm1H6+NnBfjWAt0W7D5QnKEp8
	 cawytoFbOZ8dkQMzeQfK4BM46SuBz+S28SKu+xTg2yYym0cM/fN0bJQfjeVVYVNWCE
	 O2+e12jwYsyM/VXagQNbvswDXeISXJVj8U4c3luu1g9kMP2Ta98mpVFfGGO7dqbVGT
	 Ie1GCONjDj/dYcAyyxuOEySvodw9crT7a8T5QDWxrWEV7AhszT7jzWTmovI2iAPsZs
	 5ZXRSPuLinGy5gnQahA5eLf7ChAIeVKopbxrs9sMyyTZ3BYCotfkAkFx2X5NGWyFiz
	 4Qg2hJqfI/7tQ==
Date: Thu, 10 Jul 2025 18:11:40 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 03/72] dt-bindings: media: imx258: Make clocks property
 required
Message-ID: <175218909992.56398.683086460903869755.robh@kernel.org>
References: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
 <20250710174808.5361-4-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710174808.5361-4-laurent.pinchart@ideasonboard.com>


On Thu, 10 Jul 2025 20:46:59 +0300, Laurent Pinchart wrote:
> The sensor requires an external clock, and drivers need to access the
> clock to retrieve its frequency in order to configure the sensor. This
> makes usage of the clocks property mandatory for a system to work
> properly. Mark the property as required.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


