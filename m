Return-Path: <linux-media+bounces-31432-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBE9AA493A
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 12:51:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1DE6A17495C
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 10:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 045A22586CD;
	Wed, 30 Apr 2025 10:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YtkmVCYF"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F412580D5;
	Wed, 30 Apr 2025 10:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746010256; cv=none; b=Y5bgtSPn5Ev4gX+7DZABD7PuVQVuLKvt1kkg87xJtlUIymxElNMrbGYvN7X9KUBgjFb2OBb5ImVW9+DddDE9KMLRZe/pBIFftC5v5RYcrRFL6HDIWdZtR/ldhqAqzKVyYGMF7focXRpxDs/c8bAKAGnvkb+YJjML9iIN0dLeOQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746010256; c=relaxed/simple;
	bh=ZjzGktDuEXTVBXBesmsZddLH/eT94AqUPytgvMpqg0c=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Bz1WqsvYjthpQZp+FWvteBlHaiwCHaPZhFq+s0AlbEcrI/Z9sJOZNcwZW6C6NZQcfBrRryEn/yB3h+sfB+RsG3c7kVnEsmA04/CZx7W94advR7jmgxRMlVac9Le5df05N7PKH+CR4LvDtDHWjOKo0JwacN3zmrEAylr8ND8c/28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YtkmVCYF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 992C5C4CEE9;
	Wed, 30 Apr 2025 10:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746010254;
	bh=ZjzGktDuEXTVBXBesmsZddLH/eT94AqUPytgvMpqg0c=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=YtkmVCYFSPPq2DvJRioYCjMT4Mcl+xYmUXng0aOdlomNdNeWz8b8HJViDUOJgRPFm
	 8lC/lPz0VG88pfupxMhOdV/9oSILxHmHUZhRg3p7/0xusNYlaMnBCYFHVMa3cF+kyd
	 L0XTdoHYdJn6NCNkM7vAcIowqqsD7p4v0mvJaKUkUGXqEzDXQ6ZDWg1RZD9X/iKnur
	 qrG26wIJWCVtB2mn0SV8wG4W/yC+FaIIjzjNDLsDB7hpw6e7NJiNrnowiY4SwctCRp
	 cMkBd+tRK2LuuCi+nd0FwnjvSpcFwS2grCCVQy8AFs70mm9qA+jkx0j0ZsKhnKudAL
	 +P0fabQTwSeRw==
Date: Wed, 30 Apr 2025 05:50:53 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 devicetree@vger.kernel.org, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-rockchip@lists.infradead.org, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Val Packett <val@packett.cool>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Michael Riesch <michael.riesch@wolfvision.net>, 
 Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, Rob Herring <robh+dt@kernel.org>
To: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20240220-rk3568-vicap-v6-5-d2f5fbee1551@collabora.com>
References: <20240220-rk3568-vicap-v6-0-d2f5fbee1551@collabora.com>
 <20240220-rk3568-vicap-v6-5-d2f5fbee1551@collabora.com>
Message-Id: <174601024955.2105633.4770841218138986246.robh@kernel.org>
Subject: Re: [PATCH v6 05/13] media: dt-bindings: add rockchip rk3568 mipi
 csi receiver


On Wed, 30 Apr 2025 11:15:54 +0200, Michael Riesch wrote:
> From: Michael Riesch <michael.riesch@wolfvision.net>
> 
> Add documentation for the Rockchip RK3568 MIPI CSI-2 Receiver.
> 
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>  .../bindings/media/rockchip,rk3568-mipi-csi.yaml   | 113 +++++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 114 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.example.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): 'phy-names' is a required property
	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240220-rk3568-vicap-v6-5-d2f5fbee1551@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


