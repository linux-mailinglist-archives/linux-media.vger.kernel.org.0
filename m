Return-Path: <linux-media+bounces-21607-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0C19D30E9
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 00:26:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2B3D1F23430
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 23:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE9701D359A;
	Tue, 19 Nov 2024 23:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MwdPBwdp"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E6C43179;
	Tue, 19 Nov 2024 23:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732058787; cv=none; b=Xbk7OIS01aud++hlWQBZeTj6IS/5JVN2SWCBJbHhdfIEL7lZ7r+WoQ5h8UlCKMcchxeme4tqaFChbUOsuSe5JBgNO5TrOcq+hFedNa/P94l6u0Flod/HuEoS+Q3SagBxZXESna6BDFcOLEw5LJ2iW77SKwDOykmXW9ClO7gfsz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732058787; c=relaxed/simple;
	bh=uNfJjSH3SK7iQhtrkaw65zIURoaJHd/KtAptueGMi2k=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=BGfrCzlz1byI6qmpXfnP/Svp3GKUX0wFKwBAG9fbFiovtXUginsShJp0kX3Giy5mGcoNNAudmBP85gngD2TEe1uadfqnqKl00NmMqCPB7jwCbhEu09Fh21miAL3rMZ6ZjZWxvDA2DZTHawryg1eczuuytYoLbSThAyc5QOmP8hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MwdPBwdp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89028C4CECF;
	Tue, 19 Nov 2024 23:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732058786;
	bh=uNfJjSH3SK7iQhtrkaw65zIURoaJHd/KtAptueGMi2k=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=MwdPBwdpthf9evSQNkJEdFV+PS/y4//vtyi1L31F5VrRxVQU2Tg2Z+AA+n5kwcTA1
	 eOEvg3GvR0L2c7+JXd2UIjiQF+zNJAtx4gvTxSNIzDNz2y0sb33D83TqZqmgBoLEby
	 KAWotQ0DTbMP+WnyeiU7xeWGzNIrNpPzqCMVDH3MlAD+yYO0D9zE9cwnzOrEp19/+I
	 QjsQ1FGBszLGjHtQJeOESQfNnCgP4gz1KwC43EUY4X/PNjuZ1IXzVypd9TrnMZkeWf
	 lNUcFnf13qEqLFiQ13YN79rcKK/WYSKe/bdkppw9rwwr6+TGeC1QemEsCcX9dsYEnu
	 lEGRcwyXpu7rg==
Date: Tue, 19 Nov 2024 17:26:24 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 linux-renesas-soc@vger.kernel.org, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-media@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20241119221249.539610-2-niklas.soderlund+renesas@ragnatech.se>
References: <20241119221249.539610-1-niklas.soderlund+renesas@ragnatech.se>
 <20241119221249.539610-2-niklas.soderlund+renesas@ragnatech.se>
Message-Id: <173205878479.2722151.12372233165574961370.robh@kernel.org>
Subject: Re: [PATCH 1/4] media: dt-bindings: Add property to describe CSI-2
 C-PHY line orders


On Tue, 19 Nov 2024 23:12:46 +0100, Niklas Söderlund wrote:
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
>  .../bindings/media/video-interfaces.yaml      | 20 +++++++++++++++++++
>  include/dt-bindings/media/video-interfaces.h  |  7 +++++++
>  2 files changed, 27 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/video-interfaces.yaml: properties:line-orders: 'enum' should not be valid under {'enum': ['const', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'minimum', 'maximum', 'multipleOf', 'pattern']}
	hint: Scalar and array keywords cannot be mixed
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/video-interfaces.yaml: properties:line-orders: 'enum' should not be valid under {'enum': ['const', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'minimum', 'maximum', 'multipleOf', 'pattern']}
	hint: Scalar and array keywords cannot be mixed
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241119221249.539610-2-niklas.soderlund+renesas@ragnatech.se

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


