Return-Path: <linux-media+bounces-62806-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFJAHzrDFWoAagcAu9opvQ
	(envelope-from <linux-media+bounces-62806-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 17:58:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 337DC5D931C
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 17:58:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 38DC83059A7B
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 15:54:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D4C638D3E5;
	Tue, 26 May 2026 15:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VAh8zN5X"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E53438D41F;
	Tue, 26 May 2026 15:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779810891; cv=none; b=co1KGoZVZhuV4uiwGb/FUJ8S76NwQna/8GeYZV3TE9AVHsByWFQLSbriuPguaxa7KlAncx8bgv7zE1vHcMTY1QdX7M26/XGKzXrbR7S9l4GtYGsU6B9eoc9Lk8LyggiIMxa3hfORki4dfkaBzTk2BY+vcnnHCECELNYrqN6A3Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779810891; c=relaxed/simple;
	bh=aXZAYs7f9xhjYH460cclAxyzwGfMvic4lyX2fq9SXDE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=pb1nAFVXCBYO9GiS576GkyBsj3l0qtBVOV3MOgzJsTkIV3eBsc+m+rqz5UicmW0isFleyGnjbcQOZEyfG9DbF0jqQnb+Pn7zdOLDoTud46jEMg3VGjIj1NFNLXknnDCh5E4Ia6bbhLxZ/awc3aWro7oOMw00t/QJjiPlc6Nfg50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VAh8zN5X; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.83] (cpc89242-aztw30-2-0-cust469.18-1.cable.virginm.net [86.31.129.214])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 293FB236;
	Tue, 26 May 2026 17:54:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779810862;
	bh=aXZAYs7f9xhjYH460cclAxyzwGfMvic4lyX2fq9SXDE=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=VAh8zN5Xi5jiSnSVB21/cNckuvodH90H+JQPgHfJBuXDPnAyMWFgZAHL9IvXTLQvd
	 RC7dnER6bKM2AJ+rVTZJSIoSPdilLaMgDsmMqte/ESrNTAj9sD5+rTRnLbkwx8HISc
	 YyF5ZQBaHeCwPxQvO/UddsTBVJTMi72BFi2/Kvoc=
Message-ID: <93997447-2f03-4449-ac51-ee6a2e470d58@ideasonboard.com>
Date: Tue, 26 May 2026 16:54:37 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Alen Karnil <alen.karnil@ideasonboard.com>
Subject: Re: [PATCH v6 0/2] Pinefeat cef168 lens control board driver
To: Aliaksandr Smirnou <asmirnou@pinefeat.co.uk>,
 jacopo.mondi@ideasonboard.com, hverkuil@xs4all.nl, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251007195732.16436-1-asmirnou@pinefeat.co.uk>
Content-Language: en-GB
Autocrypt: addr=alen.karnil@ideasonboard.com; keydata=
 xjMEafxhCxYJKwYBBAHaRw8BAQdAXswEEnvxYiHXb8Q8GsSAuaLuXqJFs3kmsMI7EWF9EuDN
 NUFsZW4gS2FybmlsIChXb3JrIElvQikgPGFsZW4ua2FybmlsQGlkZWFzb25ib2FyZC5jb20+
 wpkEExYKAEEWIQT0whyXpTyoVtApVAlRzoJ78NRPngUCagGrrgIbAwUJBaOagAULCQgHAgIi
 AgYVCgkICwIEFgIDAQIeBwIXgAAKCRBRzoJ78NRPnkpDAP4kmtHsMfTtV6BC1z7GTb86BL2g
 9FC1EarGJDDzcafMGQEA6clsoXvRYjHPJexVebjmkI4bq1QM0X/L9Ffe0PfpdQbOOARp/GEL
 EgorBgEEAZdVAQUBAQdAsVoGZ4IK0EgJ8HU05PQKzK15jaCi/IEA/7Cw9ZzcBmwDAQgHwn4E
 GBYKACYWIQT0whyXpTyoVtApVAlRzoJ78NRPngUCafxhCwIbDAUJBaOagAAKCRBRzoJ78NRP
 nqYcAP0eh3LahCDsfNa8zsiK+8QzeujWPKhc5zDcIqrDI6xufwD+Mu9e202It54rNZb8UWEy
 V5OzTEy0JlsQfO6DYWIORwI=
In-Reply-To: <20251007195732.16436-1-asmirnou@pinefeat.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62806-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[pinefeat.co.uk,ideasonboard.com,xs4all.nl,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alen.karnil@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 337DC5D931C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Aliaksandr,

I've been asked by Kieran Bingham to review your patches, I've 
reproduced your work on setup with a Pi 5 with a 6.18 kernel and I got a 
few questions

On 07/10/2025 20:57, Aliaksandr Smirnou wrote:
> This patch series adds support for the Pinefeat adapter, which interfaces
> Canon EF and EF-S lenses to non-Canon camera bodies. The cef168 circuit
> control board provides an I2C interface for electronic focus and aperture
> control. The driver integrates with the V4L2 sub-device API.
> 
> For more information about the product, see:
> https://github.com/pinefeat/cef168

I built the calibration application but it would not work out the box,
I can see that CEF168_V4L2_CID_CUSTOM is different between that is in 
the patch and in the application? Which is the correct one, does the 
patch need updating?

The tool to modify the device tree also did not work with the IMX477, I 
needed to manually modify my device tree to get the dtbo to build, there 
needs to be some further discussions on how we could improve the user 
experience when it comes to enabling the vcm with camera sensors.

> 
> Changes in v6:
>   - removed "focus_range" custom control, instead modified the range of
>     the standard "focus_absolute"
> 
> There were no changes in dt-bindings patch.
> 
> Link to v5: https://lore.kernel.org/all/20251005133228.62704-1-asmirnou@pinefeat.co.uk/
> 
> Patches:
>    dt-bindings: Pinefeat cef168 lens control board
>    media: i2c: Pinefeat cef168 lens control board driver
> 
>   .../bindings/media/i2c/pinefeat,cef168.yaml   |  47 +++
>   .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>   MAINTAINERS                                   |   7 +
>   drivers/media/i2c/Kconfig                     |   9 +
>   drivers/media/i2c/Makefile                    |   1 +
>   drivers/media/i2c/cef168.c                    | 317 ++++++++++++++++++
>   include/uapi/linux/v4l2-controls.h            |   6 +
>   7 files changed, 389 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/media/i2c/pinefeat,cef168.yaml
>   create mode 100644 drivers/media/i2c/cef168.c
> 
> 
> base-commit: 6093a688a07da07808f0122f9aa2a3eed250d853

Thank you,
Alen Karnil


