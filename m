Return-Path: <linux-media+bounces-22187-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB0D9DA889
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 14:31:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE6DDB22AAC
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 13:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BC0A1FCF73;
	Wed, 27 Nov 2024 13:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WfO8liPi"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF16F1FCF4F;
	Wed, 27 Nov 2024 13:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732714246; cv=none; b=PuQKrv8mSQUnGbioPodofZeBaB8NjyALas6uPYW6unGeu86uJXEpijY12tL0DGVsIvhP65B5lEF//g2Os9Fsv34BwQSLPmAs8GCuOXw9k8iyZ8Z/HVef8SDfUga0XRrafJYkr1TPgB3b+BbK/jE5RznMLcj2xyLTAgu848O2C30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732714246; c=relaxed/simple;
	bh=tKxq0VITEqUZkJ3SHVjkCHF4Pz+DQP2bD/HDITqaVBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KGqlkFVDK5btfWrtVngPPZ4cXHExOf8akdQDjqOLTsZ7CRivIKX3S4iMpjZzhZy9YhjpY555GLqj1hnIIwF41AOnshfDtGDC5ggbx2FoSRiR/iZPzf97DDSz2olv1p+RqU7NfuybLrlz6IdpEhfrRy34X/KWZq7vegrfhfeHLEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WfO8liPi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E829C4CECC;
	Wed, 27 Nov 2024 13:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732714246;
	bh=tKxq0VITEqUZkJ3SHVjkCHF4Pz+DQP2bD/HDITqaVBc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WfO8liPivxDaeLacERamme8R3cz0ljs9O7E+wuK99QfZvv679a7PcW+yGgRuS0Xzp
	 YiGYHafllGeYrbsf9L1/xw8zrx6LzS3HKdL5P+R5AZYAhkiiZdi7B26Oh4pt67zLei
	 skYCSMN/16Ex8xu19GfG0NTlm3IKHndrlg8owMfVRm1UGkT1NoTxw12FtrquteqiqJ
	 bEAXzH4ajgAWbiUAvt7WhUoVwJ/js4fb1EgtV/bHHo74jLiPMC4LX0Drq5FUCQPc/P
	 Z1W/kIvR97tMispt3k6KOuI2SBNxwEsP1ayKnNgyoIvwp6MmpGGWEyveHohFEV8KmB
	 fVCP9tLmbHSJw==
Date: Wed, 27 Nov 2024 07:30:44 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 1/4] media: dt-bindings: Add property to describe
 CSI-2 C-PHY line orders
Message-ID: <173271424244.3224145.1716079804054814469.robh@kernel.org>
References: <20241121134108.2029925-1-niklas.soderlund+renesas@ragnatech.se>
 <20241121134108.2029925-2-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241121134108.2029925-2-niklas.soderlund+renesas@ragnatech.se>


On Thu, 21 Nov 2024 14:41:05 +0100, Niklas Söderlund wrote:
> Each data lane on a CSI-2 C-PHY bus uses three phase encoding and is
> constructed from three physical wires. The wires are referred to as A, B
> and C and their default order is ABC. However to ease hardware design
> the specification allows for the wires to be switched in any order.
> 
> Add a vendor neutral property to describe the line order used. The
> property name 'line-orders', the possible values it can be assigned and
> there names are taken from the MIPI Discovery and Configuration (DisCo)
> Specification for Imaging.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> * Changes since v1
> - Add missing 'items' node.
> - Improve usage of should and must it the property description as
>   suggested by Sakari, thanks!
> ---
>  .../bindings/media/video-interfaces.yaml      | 21 +++++++++++++++++++
>  include/dt-bindings/media/video-interfaces.h  |  7 +++++++
>  2 files changed, 28 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


