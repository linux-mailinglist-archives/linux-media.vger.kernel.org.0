Return-Path: <linux-media+bounces-53436-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDkzII71n2kyfAQAu9opvQ
	(envelope-from <linux-media+bounces-53436-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 08:26:06 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 233831A1D43
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 08:26:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A93E8305C29A
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 07:25:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E59FF38F220;
	Thu, 26 Feb 2026 07:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SbVawm3e"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5883F38759C;
	Thu, 26 Feb 2026 07:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772090754; cv=none; b=OO61uEMZ4ggiS4MwKUoJO08Vk28MulAGxmUxytYxK2NNxVUVG5ahvCNVJIc2yxqcPS6QTysH+1TmHL3qu6iAeo1ikoUBhU1hBPaSHVE946rKFi8bxKokHzvYKUk1SWBPz38Az6Ozf0aWRWnjGDNsIaLfD1BvpGJilzbcFkNYYiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772090754; c=relaxed/simple;
	bh=MVMppmnDaxJ0p8khr1M1MIEYFy0p0GyoafbyqGtoHrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=psLUAe03q+BpEU9niAWtzOOuahxHPlRFbAZcGndL5oe1xqLyNMarcYePFVigvmBJT72g/T3XZViVn3qWMHZayH1R4B0CD+Pfse/qtEbJBKX3dP4NrETsmSEVn3Ivi5abZFEwg8sPZf0sOfpOYnyYMadF4j8VCmuyShu/PHERAsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SbVawm3e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6709BC19424;
	Thu, 26 Feb 2026 07:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772090754;
	bh=MVMppmnDaxJ0p8khr1M1MIEYFy0p0GyoafbyqGtoHrw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SbVawm3e0Fz+jOlSNrulCzWFmus7hdfmcyD2ZgjmgUZvk5MnozYxZ2CsxPiMkOuuB
	 5+H41/YooRaLn5BRievRqKiCqaGNGS8rzsbbEfXRxf39fND+TUBh5GfmIFaxBwleMo
	 tisXXfKun7Am+3iwx3L7Egcqx309McOFI/660N2srl72XEsBlBNOolAeuWB5cVJIbG
	 GPsG9A+MlvMHefWf9Seh51w8Z/qvsg46/WiP4+iRktpwW4op05pYRfwKzA4t6Yl5Wy
	 DW084hjKPEDQJCmCxTFonaDKwPj4i+KqLq2PQjkUJ0D0ts+cngvPsWWF6oskfhCqWD
	 MSHfJbx8MlL2g==
Date: Thu, 26 Feb 2026 08:25:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Detlev Casanova <detlev.casanova@collabora.com>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil <hverkuil@kernel.org>, kernel@collabora.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH v3 1/3] media: dt-bindings: rockchip,vdec: Add
 alternative reg-names order for RK35{76,88}
Message-ID: <20260226-screeching-manatee-of-amplitude-6dfbf6@quoll>
References: <20260225-vdec-reg-order-rk3576-v3-0-5a2ebe1b11a8@collabora.com>
 <20260225-vdec-reg-order-rk3576-v3-1-5a2ebe1b11a8@collabora.com>
 <9bb74438-e759-46a7-9fa1-2c6b1fced76b@kernel.org>
 <d5a244f3-5f1b-4bcb-8042-646320a47b6c@collabora.com>
 <85793250-425d-40da-b382-ada9fc7b50e1@kernel.org>
 <72a72c50-4816-47d4-b533-be4b7feee027@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <72a72c50-4816-47d4-b533-be4b7feee027@collabora.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53436-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 233831A1D43
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 12:26:37AM +0200, Cristian Ciocaltea wrote:
> >> Sorry, but I don't quite get why would this be a better approach than just
> >> properly list the items according to the HW layout, i.e. following the
> >> address-based ordering?
> > 
> > We always expect the list to grow, to have common set. That's rule given
> > during reviews multiple times. For multiple reasons, also explained
> > (consistency, maintenance and actually proper description of hardware
> > like the main reg address space).
> > 
> > Probably this was also given to that binding during discussions when it
> > was upstream, so your change reverts previous discussion and to that I
> > do not agree.
> 
> Thank you for detailing this, I get your point now.
> 
> After digging a bit further, it looks like the "function" naming has been
> introduced as part of the RK3588 support via commit c6ffb7e1fb90 ("media:
> dt-bindings: rockchip: Document RK3588 Video Decoder bindings").
> 
> Morever, it also sets `reg-names: false` for all the SoCs other than RK3588 -
> sorry for missing this initially.
> 
> Hence "function" wasn't used at all in the context of the older SoCs, while on
> RK3588 & RK3576 there is no indication that "function" should be treated as the
> main address space or anything like that.  E.g. RK3588 TRM clearly shows the
> "link" range at the top of the listing, starting at video decoder unit base
> address:
> 
> --------------------------------------------------------------------------------
> Config Register                         |   Base addr
> --------------------------------------------------------------------------------
> VDPU381 core0/1 link table config base  |   VDPU381_core0/1_base+0x000
> VDPU381 core0/1 function config base    |   VDPU381_core0/1_base+0x100
> --------------------------------------------------------------------------------
>                                         |   VDPU381_core0/1_base+0x600 for Y channel
> VDPU381 core0/1 cache config base       |   VDPU381_core0/1_base+0x640 for C channel
>                                         |   VDPU381_core0/1_base+0x680 for head channel
> --------------------------------------------------------------------------------
> 
> Assuming the reasoning above is now good enough to move further with the
> proposed approach, I can prepare a new revision dropping the unnecessary
> one-entry item from the reg-names, while keeping all the rest in the series as
> is.

Yes, with drop of the oneOf this would be fine.

> 
> Regards,
> Cristian
> 

