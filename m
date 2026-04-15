Return-Path: <linux-media+bounces-58842-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DbxJOIE4Gn4bgAAu9opvQ
	(envelope-from <linux-media+bounces-58842-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 23:36:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F06FF408351
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 23:36:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4800330C98DA
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 21:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3777638F65F;
	Wed, 15 Apr 2026 21:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WVDZEL3f"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E33388383;
	Wed, 15 Apr 2026 21:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776288698; cv=none; b=bwCONaQlYWbs0u5aaGhjLTDiWiskIHwquz5HWH/vePqJgc0wTsXq19RfAdRqkIdxnexttBjQJMmLKqoZCO3y4ajJXHjgFlzGNv0pgN6Fld59r4KUS1kndtTRQQ6Ou212OJojOEDiDxrulVTWi8HYAxs4V5/Vg9AJdFK/ZGVyIxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776288698; c=relaxed/simple;
	bh=CrpGpxzSa2UXFtd3Z2bKLYI55LaUXTkcwLdBVgLKboA=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=hG2m2mIrug4bFsIXodvxancMaUKhh6uP7EWdyqbyvYkgSmVIcmqqe6EGe0/h6zH3heJqnsBEMagnc/orrNE51KMTJKA0fnoAKtZvO4eZpavYJ+3ac3R8WNvULUsvguALbqC1Z5wcCsffZEb/7yuOBkqqk1rPBEQ/VFsFZIDpAw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WVDZEL3f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2898EC19424;
	Wed, 15 Apr 2026 21:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776288698;
	bh=CrpGpxzSa2UXFtd3Z2bKLYI55LaUXTkcwLdBVgLKboA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=WVDZEL3fR0bHKreaKLWmL78cFVtLK70guQ9e31ySFba5PnO+C0B6KZbCH01NYioZV
	 IJwQDlAriJP2k+3g9wl5NRJ09ykrQ3feUjtb1GFE0BlBQFEm8Pola85/XgDUwob1iA
	 +7yH68KwR709E8glGdzwWWte+2kFz5bzn6wb5OuZ9tnCjJvbDn4fkWpLl8k4RUVRL/
	 faWJbVZMZQyACbcNKyOOwO3coBMeoqyrgxvhmm2uTMQ2/5+eKhIKohJrDRl6mjUjK5
	 DccWbFkLnLsOrh60sRRkuurWrEQ4yHqPWrfR8Wr8v4VSxzuxAJWZMFhZ4286QjYZeN
	 BH9XeQSHJqMBQ==
Date: Wed, 15 Apr 2026 16:31:35 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: anthony.mcgivern@arm.com, linux-media@vger.kernel.org, 
 alexi.birlinger@nxp.com, conor+dt@kernel.org, ai.luthra@ideasonboard.com, 
 devicetree@vger.kernel.org, julien.vuillaumier@nxp.com, krzk+dt@kernel.org, 
 imx@lists.linux.dev, mchehab@kernel.org, laurent.pinchart@ideasonboard.com, 
 frank.li@nxp.com, michael.riesch@collabora.com, 
 linux-kernel@vger.kernel.org, paul.elder@ideasonboard.com, 
 daniel.baluta@nxp.com, jacopo.mondi@ideasonboard.com, peng.fan@nxp.com
To: Antoine Bouyer <antoine.bouyer@nxp.com>
In-Reply-To: <20260413160331.2611829-6-antoine.bouyer@nxp.com>
References: <20260413160331.2611829-1-antoine.bouyer@nxp.com>
 <20260413160331.2611829-6-antoine.bouyer@nxp.com>
Message-Id: <177628869587.561223.12597697847678078632.robh@kernel.org>
Subject: Re: [PATCH v1 05/11] dt-bindings: media: Add nxp neoisp support
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58842-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email]
X-Rspamd-Queue-Id: F06FF408351
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 13 Apr 2026 18:03:25 +0200, Antoine Bouyer wrote:
> Add the yaml binding for NXP's Neo Image Signal Processor (ISP).
> 
> Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
> ---
>  .../bindings/media/nxp,imx95-neoisp.yaml      | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/nxp,imx95-neoisp.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/nxp,imx95-neoisp.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/media/nxp,neoisp.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/nxp,imx95-neoisp.yaml
Documentation/devicetree/bindings/media/nxp,imx95-neoisp.example.dtb: /example-0/isp@4ae00000: failed to match any schema with compatible: ['nxp,neoisp-imx95-b0']

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260413160331.2611829-6-antoine.bouyer@nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


