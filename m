Return-Path: <linux-media+bounces-40249-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C28EDB2BEF3
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 12:31:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B7BD582D5D
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 10:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7AF6322A36;
	Tue, 19 Aug 2025 10:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NLcE0AYN"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6B02AE66;
	Tue, 19 Aug 2025 10:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755599452; cv=none; b=jgc21oPzhC87gVFieI3Y4uT0fGUR7RynVIef0Vgaj4FvWtr8YioCCHWnPQHFb6Ba83YRq55UoCM5RlOjeTq6eLpnsDfNOBpjQDu8rojSygIDRczwUJErS598oxndjzOa1ErllS8Hkc5hj18R1MuISdgIRqDQgur1lh5M0pqiws0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755599452; c=relaxed/simple;
	bh=IcyFASKIRonI5f/iTr13fAvpBsYPA0sslsL+pYsDvmk=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Ropm4KUHPdjetrbEibVIZDFcye8s4lzNtz2acR45XuMG6cokOd81uFfgklwUQKjspUR2ZTOja/MPOM/dFUdkXMvWZNKq1ShGvj5tOtttcXNNVHEPQk4XwJyHyqZwTtpN3vx3U3v/0j6mjuMSLF6twabKFTi7vUmj+p2fe7P59zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NLcE0AYN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58094C4CEF1;
	Tue, 19 Aug 2025 10:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755599451;
	bh=IcyFASKIRonI5f/iTr13fAvpBsYPA0sslsL+pYsDvmk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=NLcE0AYNFByESJ6pprQ6ZWUrrlu8KuzChAopnEm33HaC/9cNsEfihVIrKxp48WZYZ
	 XVHGhDDHPIJ6qoS2SoHUdv4ipdzR2CBuSv7vzF9E33H+6efC7yyg1yQsu/u9cxVOpJ
	 JAj39/w6fhTov0srHTSgc4mWatndteIZ7aDRYxpfnpbJKE+TBR8K3yxaqOmjoPu8NA
	 YY0pM96fDKrj2GAkZKLNgN2HEXUWvJi6L5c9tzFS9hjM76uRS9ALhHbK03kaJq8Tu1
	 HdUuSQcNqjVwjp7oxXt8GreyQR3aZCSkejbTAIG7zB5HIBzxvBql0qtiFgc9t1RlNe
	 7rcRHMZXBZYNg==
Date: Tue, 19 Aug 2025 05:30:50 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>, linux-kernel@vger.kernel.org, 
 Magnus Damm <magnus.damm@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
To: Biju <biju.das.au@gmail.com>
In-Reply-To: <20250819074849.18696-1-biju.das.jz@bp.renesas.com>
References: <20250819074849.18696-1-biju.das.jz@bp.renesas.com>
Message-Id: <175559945053.3807930.4480265788068260274.robh@kernel.org>
Subject: Re: [PATCH v2] media: dt-bindings: renesas,rzg2l-cru: Improve
 documentation


On Tue, 19 Aug 2025 08:48:42 +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Drop CRU prefix from clocks and interrupts description.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> Ref: https://lore.kernel.org/all/20240909143358.GA2013-robh@kernel.org/
> v1->v2:
>  * Updated commit description
>  * Dropped CRU prefixes from clocks and interrupts description.
> ---
>  .../bindings/media/renesas,rzg2l-cru.yaml     | 22 +++++++++----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250819074849.18696-1-biju.das.jz@bp.renesas.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


