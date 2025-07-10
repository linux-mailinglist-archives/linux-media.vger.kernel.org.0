Return-Path: <linux-media+bounces-37423-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D51EB00D30
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 22:33:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3FAC484862
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 20:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AE8B287265;
	Thu, 10 Jul 2025 20:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="N6BmlZc4"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F2F21CC63;
	Thu, 10 Jul 2025 20:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752179624; cv=none; b=i0zObc4VQvlSyIHwUQfv0bKTZMS66nglMyTpfBV4hgDN5GauhsZyUTtQ700pUMcqQ3Umw+8WzdZHVzNzI3gv6CfbOHLBnqVSaGEhf007868xuZ/rXbn5m0yTe7cK3byxJUgpFOD0AscU8e0zveaEc+G1/WS2KmY9v45VmCLaZI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752179624; c=relaxed/simple;
	bh=BNeBp1w2sYucriF4AcMPN/Uxh3LoUtbXn+3rVnjz9K8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ipf4/V1PBd9AyzkwBTHB6NJZ0p9fQMKbnjUCKzpBnaLdlMLNIBiCnnMMdIjgdvl29+v0/nUwcvM9KCpCG1yKjuQOl7/sdr1rxKKvxYfa0Wa2Uv1BqEijDY+29GGKvCnLEB0vHi+/3FTtH6k1X+vIlXuTfU1tuV6ZVq8HzzSwheQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=N6BmlZc4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id B95221A9A;
	Thu, 10 Jul 2025 22:33:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752179591;
	bh=BNeBp1w2sYucriF4AcMPN/Uxh3LoUtbXn+3rVnjz9K8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N6BmlZc4/hriiuZmN8BJCvmjXY6SZshPLyilW/blfSps/a4K+L/78oJ+7UOmiqdK+
	 Q0vnzSf6u11uuE1XlER8QrasFEtGsx0tiV/onAawTXDZ5H1e5QTaoy3A2LP2xHVz+U
	 Bo6rsh960PnZqSBH8eG4gX3tKpu1iKEpn7dONY4c=
Date: Thu, 10 Jul 2025 23:33:10 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	devicetree@vger.kernel.org, Leon Luo <leonl@leopardimaging.com>
Subject: Re: [PATCH 04/72] dt-bindings: media: imx274: Make clocks property
 required
Message-ID: <20250710203310.GB22436@pendragon.ideasonboard.com>
References: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
 <20250710174808.5361-5-laurent.pinchart@ideasonboard.com>
 <175217623503.3371435.1552463179944377502.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <175217623503.3371435.1552463179944377502.robh@kernel.org>

On Thu, Jul 10, 2025 at 02:37:15PM -0500, Rob Herring (Arm) wrote:
> On Thu, 10 Jul 2025 20:47:00 +0300, Laurent Pinchart wrote:
> > The sensor requires an external clock, and drivers need to access the
> > clock to retrieve its frequency in order to configure the sensor. This
> > makes usage of the clocks property mandatory for a system to work
> > properly. Mark the clocks and clock-names properties as required, and
> > update the example accordingly.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.example.dtb: sensor@1a (sony,imx274): 'clocks' is a required property
> 	from schema $id: http://devicetree.org/schemas/media/i2c/sony,imx274.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.example.dtb: sensor@1a (sony,imx274): 'clock-names' is a required property
> 	from schema $id: http://devicetree.org/schemas/media/i2c/sony,imx274.yaml#

I noticed that after sending the patches. I checked the bindings I was
modifying, but forgot that some other bindings could reference them.
Sorry about that, I've already fixed the problem in my tree.

> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250710174808.5361-5-laurent.pinchart@ideasonboard.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.

-- 
Regards,

Laurent Pinchart

