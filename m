Return-Path: <linux-media+bounces-58079-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id zPr/MBLq0mn/cAcAu9opvQ
	(envelope-from <linux-media+bounces-58079-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Apr 2026 01:02:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C323A0140
	for <lists+linux-media@lfdr.de>; Mon, 06 Apr 2026 01:02:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4C6273001D49
	for <lists+linux-media@lfdr.de>; Sun,  5 Apr 2026 23:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A88C63845BD;
	Sun,  5 Apr 2026 23:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UpzF/e9r"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173492367CF;
	Sun,  5 Apr 2026 23:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775430154; cv=none; b=hWINH8PN0VfpmZnX1u9F+Fwf0HQhJ1VHrzjaOVufwUO8wbSbd1ASfdMJGsQC9ZzoneYa9Uau+D/itqEublfrfExYBC0iPN00Ny+t3QG+Rp03kLrdV/AVoOGb7wFi8vsFlUJugBnsFlnOgmvRIROP1hwwbJPWCBEg/XDhkKoUdXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775430154; c=relaxed/simple;
	bh=AWRDv3dYlnVLH8M78Vu/CRSLMGyviOHStxu9JnvTLnw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LgUdfB2DVS3Lkz/K3VSXyIPfAl123KgxIp5/2ApxnsSs+HvjYEPKcggSf22VXN/e/AytZGFtTkVSatygB76vep6v+L5WwCpEC4+f1UWol1b4zEWs+zFFYOenHGJ0BUqJcWYvriXEnMSTzOgRQF5JsZNmEL7YfRskVPsy4SHhUck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UpzF/e9r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79783C116C6;
	Sun,  5 Apr 2026 23:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775430153;
	bh=AWRDv3dYlnVLH8M78Vu/CRSLMGyviOHStxu9JnvTLnw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UpzF/e9rwQePgER3O3lp0nBHskFh1r5QwllSDnOagkLDwHKjaTORIw7K9coLH64V0
	 PGXQPHqr16Q5sUNKKeyfDFxqA4l7DC84eTjXRjmowSeEFND7sppO8MAOSRLR3k52U9
	 QxcQa1xtY8BNepGVzXmoXhJaXAU0rI+PFyJRiHZSi16WBiWP0wcXF/E0F14QtxaFgs
	 yvBTadJEMccztoUW1Bah+Yp+TZUFOFUrGzGlIkqDolEiDn95vYYNFhTnw7tlCtccC9
	 J/JONU5FDfO5YC7WqXDBtgZYFj1aROmgydSxjxLNcexqpbkZTFIfjBgQzVRmnOYVHD
	 5mUWMPHZ93uIA==
Message-ID: <954a1202-e9b7-47ce-b218-a576e41d2512@kernel.org>
Date: Mon, 6 Apr 2026 00:02:28 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] media: qcom: camss: CAMSS Offline Processing
 Engine support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 vladimir.zapolskiy@linaro.org, kieran.bingham@ideasonboard.com,
 robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, johannes.goede@oss.qualcomm.com,
 mchehab@kernel.org
References: <xy6TKmdveRx4cMshSHEUGZ7s3lbsurWcsc2vq05A7_N4bCialR7EelZitouugtZDkpFCAghjqY4NDdSQEIPprw==@protonmail.internalid>
 <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
 <055a7281-3e41-4e26-a8c8-5e28d69c0685@kernel.org>
 <CAFEp6-2NniQquVrw_V8P_cyUayMMY0SPC8hgczjB3ef5zx7e5A@mail.gmail.com>
 <j1jExQP2GCnHhjXkyuhDn_d0CP50oZDMyso3CFfkygb7Ww_9Z3L93P8Px0KjTQAqU5jzr2I41V1_2ZdQOQqfxA==@protonmail.internalid>
 <20260405194851.GA3972481@killaraus.ideasonboard.com>
 <d5bb1f75-f55f-43e6-8160-bacc4088b0a2@kernel.org>
 <zZSYnBEVwbsoC3zAxYw3b-FDBES5SVplE8_8v55ro9lhsRrCnB3xietqoJ41CLDv5iHdFFvfWF7ZgO1QFjrQiQ==@protonmail.internalid>
 <20260405204722.GF1213462@killaraus.ideasonboard.com>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <20260405204722.GF1213462@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58079-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 87C323A0140
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 05/04/2026 21:47, Laurent Pinchart wrote:
>> So actually I've shifted my focus on Hamoa to IFE/IPP.
> I'd love to get stats out of the IFE 🙂

Yeah, I'm fiddling with stats on Hamoa IFE right now.

---
bod

