Return-Path: <linux-media+bounces-24185-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A0C9FEA85
	for <lists+linux-media@lfdr.de>; Mon, 30 Dec 2024 21:00:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74D92161737
	for <lists+linux-media@lfdr.de>; Mon, 30 Dec 2024 20:00:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BA6419ABD8;
	Mon, 30 Dec 2024 20:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="psVByz0B"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3C918858A;
	Mon, 30 Dec 2024 20:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735588830; cv=none; b=bv5xCsrHLT3VfsWzmLmcpPTA0QqJQu9ocLDPEkjowGoYZKma8oOxKXj5fDLqCvUfMxQPHfBIFNkjtl+bFmg1vrfdcDCOdL8ra87ny424M18kWsiSlA7iNeXYkZrHN15sak3C72K1utmDkK+SOAGQBYMzojMTsUW5rNGXRG/RICQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735588830; c=relaxed/simple;
	bh=XVXy2fuy5cQTUl1NQssku78zv2A1hYK9bqf3cTVcWes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hi+eO0ZfouksZX047lv/X5ehM6o3rt/5v9v/IA/OOTZSyWjwJf8JLTKVnolOBX+akrqF2otaYvDqWcRi9uZ4W8ze7uf/u+ZwhAPhyYTbx38C7WcbTfFMlRiMJP/7HSn9bWG692rsm3u7KKY91S73TomohhnqcTX4VTzaAFet6t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=psVByz0B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2D77C4CED0;
	Mon, 30 Dec 2024 20:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735588830;
	bh=XVXy2fuy5cQTUl1NQssku78zv2A1hYK9bqf3cTVcWes=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=psVByz0Bj8dcUEvUVyu8mGyW0LVhHTqj2N8kkeJ9NvyNzTt7KQxEe/3moBnM90m71
	 1+DLeczYoHERZzKKlFlC9NQLIf8EQFQuCKlQ09ioqmKdMGH5vHQUhSI0VN+bKTEm4Z
	 eMZ7l3LTVsEQWg5Fb4aX/YRefAx/kYtXEsHAGcaiffgiuNyMzshtfyseM+9BPh9irW
	 WJJPM/o+JpImJ8+4edTAHVH7lN8eJ4Ti4iipO/t45aDPXXNpKWENqp65cJpquo/nzu
	 Lt1mS4neY1C05rOk6jruKFQ1Zn68ghh3fbFWYGnWVvz0WNBgkvygloODhbG6C8Aqjh
	 SDpJ/iumEpaQg==
Date: Mon, 30 Dec 2024 14:00:28 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Michael Riesch <michael.riesch@wolfvision.net>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Val Packett <val@packett.cool>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	devicetree@vger.kernel.org, Mehdi Djait <mehdi.djait@bootlin.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 2/6] media: dt-bindings: media: add bindings for
 rockchip px30 vip
Message-ID: <173558882822.2475187.7583820035837779776.robh@kernel.org>
References: <20241217-v6-8-topic-rk3568-vicap-v2-0-b1d488fcc0d3@wolfvision.net>
 <20241217-v6-8-topic-rk3568-vicap-v2-2-b1d488fcc0d3@wolfvision.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217-v6-8-topic-rk3568-vicap-v2-2-b1d488fcc0d3@wolfvision.net>


On Tue, 17 Dec 2024 16:55:14 +0100, Michael Riesch wrote:
> From: Mehdi Djait <mehdi.djait@bootlin.com>
> 
> Add documentation for the Rockchip PX30 Video Input Processor (VIP).
> 
> Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>
> [revised description]
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> ---
>  .../bindings/media/rockchip,px30-vip.yaml          | 123 +++++++++++++++++++++
>  MAINTAINERS                                        |   7 ++
>  2 files changed, 130 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


