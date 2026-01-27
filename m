Return-Path: <linux-media+bounces-51695-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNXQICXgeGkGtwEAu9opvQ
	(envelope-from <linux-media+bounces-51695-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 16:56:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E74E97364
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 16:56:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BE06C3046FDA
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 15:35:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4B5735B65F;
	Tue, 27 Jan 2026 15:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AgwJC/mL"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366E12FE598;
	Tue, 27 Jan 2026 15:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769528089; cv=none; b=OD/A8n0aSDg8uH12TTQQ9rtXhVpfQ7wwTSxx5vRWGPTVb14Da6Oz+E7Jci7M1qllQtXavUwzUWzH0zxUbqXsP+yUesVQltzCBvPoHwQ8qAjXPc6F7cVr+jUkW1Cj+4tF1x9Y3K9Kg1/v/Bt8qbIQ1bNS2Q/lQ3u/5VUn20pofjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769528089; c=relaxed/simple;
	bh=r8swAlZx9gfHag0kXpyqxA7e8B89YoYJ5gDgTraENPE=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=WkRE80muDmgwZWgsRtdVZ70BtK2/lJbkVhzWLDzYhu/0PR2yOLmpkDudZzHWYICFR/3+rehoq91cmkZmPRKNfw8f4RwljlN+l9IPF3dK67m/vsSp+yisb8sMWPiqmPOUCSgaMY5T0V/yzg5BudR1JZfAnh3tHOwZG8AvYgwZLH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AgwJC/mL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70FDAC116C6;
	Tue, 27 Jan 2026 15:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769528088;
	bh=r8swAlZx9gfHag0kXpyqxA7e8B89YoYJ5gDgTraENPE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=AgwJC/mLo/RKTmsx+eYELFgTaPAqfeSLcvwLkkGy2/CtRB3bhuXM4IEq9+YbGYMCQ
	 R3GLERCy/X29SqmJD1hLWV5MP/2MD34L+tTdiGukKBZW3Y7UsdnK2LUtrNWUsUQdYA
	 caLkJQLIHvkhynBAhxNbC+m1l9QoJHfSXcn8D1DTjnNko8YuESxNvMm80L+ZElSR0I
	 e2p0hvdrKzUv25wZ/+xMN6Y49r175vWIE2LejimSl8ccZQYjwmwVH2E9eTLby/0Mki
	 io0mAy4STdYdE4W29dr0JK5auJSPNKpABf0JwW5K72v2JXNl9b5R4Mlzd9ud+ABkMs
	 HbOc+N8xrXM+A==
Date: Tue, 27 Jan 2026 09:34:47 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 linux-rockchip@lists.infradead.org, kernel@pengutronix.de, 
 Jacob Chen <jacob-chen@iotwrt.com>, Conor Dooley <conor+dt@kernel.org>, 
 linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 linux-arm-kernel@lists.infradead.org
To: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
In-Reply-To: <20260127-spu-rga3-v3-1-77b273067beb@pengutronix.de>
References: <20260127-spu-rga3-v3-0-77b273067beb@pengutronix.de>
 <20260127-spu-rga3-v3-1-77b273067beb@pengutronix.de>
Message-Id: <176952808764.1883880.9874819074919420186.robh@kernel.org>
Subject: Re: [PATCH v3 01/27] media: dt-bindings: media: rockchip-rga: add
 rockchip,rk3588-rga3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51695-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3E74E97364
X-Rspamd-Action: no action


On Tue, 27 Jan 2026 15:39:10 +0100, Sven Püschel wrote:
> Add a new compatible for the RGA3 (Raster Graphic Acceleration 3)
> peripheral found on the RK3588 SoC. Also specify an iommu property,
> as the RGA3 contains the generic rockchip iommu. The RGA2 also has
> an iommu, but it's specific to the RGA2.
> 
> The existing binding refers to the RGA2 peripheral. The RK3588
> contains one RGA2 core and two RGA3 cores. Both feature a similar
> functionality of scaling, cropping and rotating of up to two input
> images into one output image. Key differences of the RGA3 are:
> 
> - supports 10bit YUV output formats
> - supports 8x8 tiles and FBCD as inputs and outputs
> - supports BT2020 color space conversion
> - max output resolution of (8192-64)x(8192-64)
> - MMU can map up to 32G DDR RAM
> - fully planar formats (3 planes) are not supported
> - max scale up/down factor of 8 (RGA2 allows up to 16)
> 
> Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
> ---
>  .../devicetree/bindings/media/rockchip-rga.yaml       | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/media/rockchip-rga.yaml:64:1: [warning] wrong indentation: expected 2 but found 0 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260127-spu-rga3-v3-1-77b273067beb@pengutronix.de

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


