Return-Path: <linux-media+bounces-19254-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1E2994AC3
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 14:36:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0B641C24CFE
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 12:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F57C1DE4CB;
	Tue,  8 Oct 2024 12:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EEUgVJEv"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9232C192594;
	Tue,  8 Oct 2024 12:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728390973; cv=none; b=ID4pZ29Sjwq6CUCgwTRydR+O+xiB7fLxgYb3auDdYmjHFZtfHd4QNpNwcUtMQiY0J0g6LmSB5X+1oVGsdQcyorVJU4IwScUWuYQkE9hcGsuIaTuOv1vZKOQpPhA88Tmeu/X4HhxoTrcsEdz/wVjptdoanAHuQqvfGiPcjFY1R+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728390973; c=relaxed/simple;
	bh=pxWhGhOhEA0Z8p6MyMieIv6wZHVqWy909W+j2KODUww=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=E4xe1A3lbrIA6FQGFcqAnBU5LWpMVzHTqKnI/7lUXUkZMno8UvuLckL5u+XT1UfMxjd111Xy2J9ta1s8SeofrcFpzsn6FxI/CcT0xUbjbz0RP/TKtGXfoa41fkFoX+2amOezzRmdlN4+n8LZzK5l5yb5H6VzeYksUhCa+DcbXNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EEUgVJEv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A324C4CEC7;
	Tue,  8 Oct 2024 12:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728390973;
	bh=pxWhGhOhEA0Z8p6MyMieIv6wZHVqWy909W+j2KODUww=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=EEUgVJEvy1Yapyc4wpkIvBcJ7KsMJfONvFvlmBLhufZQwOmcbQVvqvJrCr6D9DrR5
	 /d31pNJoeJlRgk7wFrqQhaAxJpR45umiGX+Y2oAgHLqBjliB4IBpaD2C+GNsyt6on7
	 KxKj+dIiPt5Z5MUZjhnDzkQ51yruicl7zKBKERMOfJG3limfIb4oUtNjc6uLzOhQdB
	 XcdsibAYp895YHcb8wDWhzWfdwYG46osAvM9/qyn/mv1RZZmV6oSoiUEAcI5GiFx4C
	 hcaHNoetKvn3r+f+orbqjPX0aIsX499WV8rUIxYRyVHteaR1fNGxAxlfXpksavoxJw
	 AbOJdA8RUA69w==
Date: Tue, 08 Oct 2024 07:36:12 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Hugues Fruchet <hugues.fruchet@foss.st.com>, linux-kernel@vger.kernel.org, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
In-Reply-To: <20241008-csi_dcmipp_mp25-v1-2-e3fd0ed54b31@foss.st.com>
References: <20241008-csi_dcmipp_mp25-v1-0-e3fd0ed54b31@foss.st.com>
 <20241008-csi_dcmipp_mp25-v1-2-e3fd0ed54b31@foss.st.com>
Message-Id: <172839097255.1123420.12436577400755634663.robh@kernel.org>
Subject: Re: [PATCH 02/15] dt-bindings: media: addition of stm32 csi driver
 description


On Tue, 08 Oct 2024 13:18:04 +0200, Alain Volmat wrote:
> Addition of the stm32 csi controller driver
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  .../devicetree/bindings/media/st,stm32-csi.yaml    | 129 +++++++++++++++++++++
>  1 file changed, 129 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/st,stm32-csi.example.dtb: csi@48020000: ports:port@0:endpoint:data-lanes:0: 0 is not of type 'array'
	from schema $id: http://devicetree.org/schemas/media/st,stm32-csi.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/st,stm32-csi.example.dtb: csi@48020000: ports:port@0:endpoint:data-lanes:1: 1 is not of type 'array'
	from schema $id: http://devicetree.org/schemas/media/st,stm32-csi.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241008-csi_dcmipp_mp25-v1-2-e3fd0ed54b31@foss.st.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


