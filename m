Return-Path: <linux-media+bounces-57501-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNupD8z0yGkXswUAu9opvQ
	(envelope-from <linux-media+bounces-57501-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 11:45:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2693516D9
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 11:45:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD1413018292
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 09:45:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D34713043DE;
	Sun, 29 Mar 2026 09:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ea8/je30"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4862E2F3C0E;
	Sun, 29 Mar 2026 09:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774777519; cv=none; b=spQqbxMoyTmUsRcewuw9rUoPOz3f9Z6Gw8ux+6HFdWxe+fk36LcrlAYD0Z/nNTiJ8HoEl+QRrN69E7Na15GpRHeRvSS1pbPLIdjEPZLqSSvCTpWYgPiPAFFybq/Rlp7fHk2OA42QZ6/nvQOABmIKuh0SM17UxmWLKtra8LAQh5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774777519; c=relaxed/simple;
	bh=l+dN0lToai8lSGxHzvCi6u+XkB1xl3MrCngigbm7rxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CqDbzglZmZEdR7HA22+lHkU/vZBEfmpMGdQI2FfMBJqU5uCI2Fos0mwc+Q4RQP5cI85dZYJhOaZ3xit1TjHQf98hHhuMCfKumu14LtilMNItA5Kg74E5phdYpPgwCoSd5xqGxzCqZC/yVPcSmOf3A234qqSFol0vIOxteMEWrg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ea8/je30; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83396C116C6;
	Sun, 29 Mar 2026 09:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774777518;
	bh=l+dN0lToai8lSGxHzvCi6u+XkB1xl3MrCngigbm7rxY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ea8/je30j5USqeE9VK2yVyHY1iw88GBezVD6/MU6FqTKaOr2rQKlmySGPPAD6GJSh
	 Nx+JrZo4VMDL0/AP75DXmaEQSkSwMdRfLBUJ2eNF+BjBzSM3ZBmmNKJi5AlLajeDgD
	 IW0GXFEze+LXem11J8IrGIGLgNZO1F63n3GJZH9tJ1zN8cSwhr47/0JlfzVyqFQg8Q
	 ufi8wfCHw32tEPIppG42i/2P2dDQ8wa+yklMkTkCqiOz7Mm4HSiC8mp6Dmvhv0/v6g
	 JB6xiFLMUgRaGGBwq1eRLBw26TF7RDscG2YXj4td+JOn+611QazXd5fx9GXCfgHwqy
	 pEWBhn5IuKHBQ==
Date: Sun, 29 Mar 2026 11:45:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pranav Kharche <pranavkharche7@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/1] dt-bindings: media: convert hix5hd2-ir to DT schema
Message-ID: <20260329-authentic-smiling-cat-0be663@quoll>
References: <20260328084238.201452-1-pranavkharche7@gmail.com>
 <20260328084238.201452-2-pranavkharche7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260328084238.201452-2-pranavkharche7@gmail.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57501-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,f8001000:email,devicetree.org:url]
X-Rspamd-Queue-Id: AE2693516D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 28, 2026 at 02:12:38PM +0530, Pranav Kharche wrote:
> Convert the legacy plaintext binding for HiSilicon hix5hd2 IR remote
> controller to JSON Schema (DT schema) format in YAML.
> 
> This binding documents the infrared remote receiver found in HiSilicon
> SoCs such as hix5hd2 and hi3796cv300. The conversion includes:
> 
> - Standardized property definitions with types and constraints

Drop

> - Reference to rc.yaml base schema for remote controller properties

Drop

> - Addition of include directives for interrupt-controller bindings

Drop

> - Proper example with GIC interrupt specifiers

Drop

> - Schema validation support for device tree sources

Drop

> 
> The new schema enables:
> - Validation improvement

Drop

> 
> tested with: make dt_binding_check DT_SCHEMA_FILES=...
> All schema validation checks pass.

Drop

Please write useful commit msgs, meaning you do not need to state
obvious things. Plenty of examples in git log.

What you MUST say here is documenting the changes you done to the
binding. You removed existing property which is not explained at all,
introduces undocumented ABI and adds new warnings. No, seriously, no.

And if you TESTED this you would see errors, so back to basic
requirements of schema conversion - see my posts on social.kernel.org.


> 
> Signed-off-by: Pranav Kharche <pranavkharche7@gmail.com>
> ---
>  .../devicetree/bindings/media/hix5hd2-ir.txt  | 26 ---------
>  .../devicetree/bindings/media/hix5hd2-ir.yaml | 53 +++++++++++++++++++
>  2 files changed, 53 insertions(+), 26 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/hix5hd2-ir.txt
>  create mode 100644 Documentation/devicetree/bindings/media/hix5hd2-ir.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/hix5hd2-ir.txt b/Documentation/devicetree/bindings/media/hix5hd2-ir.txt
> deleted file mode 100644
> index ca4cf774662e..000000000000
> --- a/Documentation/devicetree/bindings/media/hix5hd2-ir.txt
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -Device-Tree bindings for hix5hd2 ir IP
> -
> -Required properties:
> -	- compatible: Should contain "hisilicon,hix5hd2-ir", or:
> -		- "hisilicon,hi3796cv300-ir" for Hi3796CV300 IR device.
> -	- reg: Base physical address of the controller and length of memory
> -	  mapped region.
> -	- interrupts: interrupt-specifier for the sole interrupt generated by
> -	  the device. The interrupt specifier format depends on the interrupt
> -	  controller parent.
> -	- clocks: clock phandle and specifier pair.
> -
> -Optional properties:
> -	- linux,rc-map-name: see rc.txt file in the same directory.
> -	- hisilicon,power-syscon: DEPRECATED. Don't use this in new dts files.
> -		Provide correct clocks instead.
> -
> -Example node:
> -
> -	ir: ir@f8001000 {
> -		compatible = "hisilicon,hix5hd2-ir";
> -		reg = <0xf8001000 0x1000>;
> -		interrupts = <0 47 4>;
> -		clocks = <&clock HIX5HD2_IR_CLOCK>;
> -		linux,rc-map-name = "rc-tivo";
> -	};
> diff --git a/Documentation/devicetree/bindings/media/hix5hd2-ir.yaml b/Documentation/devicetree/bindings/media/hix5hd2-ir.yaml
> new file mode 100644
> index 000000000000..91cba6ec88c5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/hix5hd2-ir.yaml

Filename must match the compatible, choose one.

> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/hix5hd2-ir.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: HiSilicon Hix5hd2 infrared remote controller
> +
> +maintainers:
> +  - Pranav Kharche <pranavkharche7@gmail.com>
> +
> +allOf:
> +  - $ref: rc.yaml#
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  This binding describes the infrared remote controller found in

So description describes that your binding describes... No, drop.
Explain the hardware and if you do not have any explanation, no need to
state obvious and paste here compatibles.

Best regards,
Krzysztof


