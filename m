Return-Path: <linux-media+bounces-55864-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CMomIOLCt2n5UwEAu9opvQ
	(envelope-from <linux-media+bounces-55864-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 09:44:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6FD296673
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 09:44:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D0F56301F79D
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 08:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95A3F382286;
	Mon, 16 Mar 2026 08:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HueAbbgb"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066BB355F48;
	Mon, 16 Mar 2026 08:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773650549; cv=none; b=Vbt6lIMQVdOVncZUNeoff36Aggy0GlO5YiMzRL7P6oKBmy2UR6Jn5uld5anNK6ECdMkNsLypm11TyE9mO7goFppoMmz1hITPhgTrFC/b/dzNh7Pkypbl7lKuf4a1ul+SJ6L4BXM+RPJoSp8y/FW6Fut7LQimpHv1h/TBqg/tSjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773650549; c=relaxed/simple;
	bh=9LJ2+2SgK7w+NRyNaEGoZkSKWLsSd19na5lnCcCLdDA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=C+0fgfDcMZ06UON8XQYJZZgLIqiErtsQ7RSgml/te1VYrgTtJHbB1JnDyt+dmo7RbeA67xDnuAlWzkDdieUZplpiJBg3IszTVmRNGHUvpYWZ829xx+TWd2y6qbDzKgskTyDav8EaVc1Ecl4lzfybnF3aQ3ubw0v249VO42xsTXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HueAbbgb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB1B3C19421;
	Mon, 16 Mar 2026 08:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773650548;
	bh=9LJ2+2SgK7w+NRyNaEGoZkSKWLsSd19na5lnCcCLdDA=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=HueAbbgbhxKEaBW7w0dzIcNXgtAE9iyH0WnDtPEOzjPRgM71uZliWj8r0Mz7sQCrS
	 9SwYtorMTIo0o4AfIeBdDWSRXF5TlvCphV36rMWzFcoLZaVnQH4SPhLc3M5TlZqb0L
	 vBkdB79aBc76zAUt2+11fObdKcjBUIqAF0qYW/h354DhJbLj4D4ByTZjqswWFutVFE
	 Sbp+n19NLxxsFope55qDW3egNxCb48nf/BiUjaHT9Gj/TFwXInqNlsxLvnow3vHZrZ
	 05ThNtgMvOZ0L8xV7rj4yEbEmu+rSSb2eDyuLBCyh0Ehst/lK8lGR+IyiVfrES+pTh
	 ffgqQGNEIQF7w==
Message-ID: <2d879c2a-aded-444c-a54f-cb0e8acd89b1@kernel.org>
Date: Mon, 16 Mar 2026 09:42:21 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v2 01/13] media: saa7134: rename i2c_dbg() to
 saa7134_i2c_dbg()
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Khalil Blaiech <kblaiech@nvidia.com>,
 Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-actions@lists.infradead.org, Bartosz Golaszewski <brgl@kernel.org>,
 linux-media@vger.kernel.org
References: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com>
 <20260223-i2c-printk-helpers-v2-1-13b2a97762af@oss.qualcomm.com>
 <76fd11b2-7789-47c1-a832-12907155ead1@kernel.org> <abfBkg8YpDKIlOVu@shikoro>
Content-Language: en-US, nl
In-Reply-To: <abfBkg8YpDKIlOVu@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55864-lists,linux-media=lfdr.de,cisco];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,gmail.com,sholland.org,nvidia.com,suse.com,linux.ibm.com,ellerman.id.au,suse.de,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EF6FD296673
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 16/03/2026 09:38, Wolfram Sang wrote:
> Hi Hans,
> 
>> Do you want to merge this through the i2c subsystem? Or do you want me to
>> merge this patch through the media subsystem?
> 
> The rest of this series has been dropped in favor of a different
> approach. I still think this single patch here is useful, so if you
> could pick it up, that would make a potential future change easier.

OK! The patch makes sense, so I'll pick it up.

Regards,

	Hans

> 
> Thanks and happy hacking,
> 
>    Wolfram
> 


