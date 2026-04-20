Return-Path: <linux-media+bounces-59177-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mE9FKDWF5mnTxgEAu9opvQ
	(envelope-from <linux-media+bounces-59177-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 21:57:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0180F43378A
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 21:57:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A405C302C5FD
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 19:57:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CA633CAE8D;
	Mon, 20 Apr 2026 19:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XA9HNag0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F10B56472
	for <linux-media@vger.kernel.org>; Mon, 20 Apr 2026 19:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776715051; cv=pass; b=btjtFPnwfbTqmHrWy7lGJ5jng0BCaPcrLOXV8s/d7f8qCfnS4Snlq2S7MBxNV2GhK+tbgKxBHZkTvEcq3QPbKVecflBcWN4f/NCyXsa/pWMa0PFMLNpGH6kC71uDRMJw88BRusMYFCStSrH4Q6Ktl2mDOf8ScXFoc3wR7LWxNqw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776715051; c=relaxed/simple;
	bh=dGNyxGaCqqvjGmB1UrjxsyafCLtfON0c7TpLnePzPoU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LPv9/rsqktJJD0os8TaY/2J+3uUikKjp7d6w3s1Q7z0iJ2AVVCBr4qNFEQS/f3ARnvjI4Cc/AOx/az+fMfT/M8kBL1r73AxAbOuxaJ4pZCHJeZG8I96Otf346gI4pcqT2FKT6SR5VeoyE2rmPEkGMhNxL9rdvwta1NJw0Ah9Cr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XA9HNag0; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43cf8d550bdso3114594f8f.0
        for <linux-media@vger.kernel.org>; Mon, 20 Apr 2026 12:57:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776715049; cv=none;
        d=google.com; s=arc-20240605;
        b=BygfeWD+giCGkJgspF3Koj8N2/wXNXvTLZjHzAKw//2j5wZZStfMZRxfZvJYHaEklb
         j6WofZnYSiv9S3AfIQbuApTOLLmuEkrWbQOska9f0MIKgOic5be25vrXfEN1JHllqx9E
         Pa6qYFealaaZ2JXd5QKTZcXkfV8QDZ3C9eEqNVJxtFVm+7rDEP7ii0u2TKu+VtXtHhtZ
         UlJidha+H09jWeaWwZvKkZFG9Z6rA+aZHBqhNbzyb3AgA8nUnw2Eg4IaD0AdESO2Y49I
         OTeyj09RHC0E9onupfjwObTvb+Ub4Ku2van08AtwuQgOkCydXSRCNMqhZlE4QS0ObHOD
         Fheg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dGNyxGaCqqvjGmB1UrjxsyafCLtfON0c7TpLnePzPoU=;
        fh=rBmokMwsKFBr89pghXCXmxG4JMcpjNBNNJrtSX0sc9M=;
        b=cCPfiR8oOdKxhMZvraZqC5PoYsdwVGLhGSmtfw5U4THvhY5g5WiW8gSDScAGqzeBD9
         RMOuWQfpt8fD4eof2zfHWIJ7pZhGlFz7ImTlnetJHJQHGlAbaDleF8B0ZgccmgUfLlbR
         FEZrUpWBsyMLo77unp9kRChYfWyF9ROyyqdNrcx8w58staRvlgPO3gEPvufo2dTYIRbW
         +XFCiH558rAQEGSyzr7fAGkuYh9h0MXxwNckSDOghwGH2b5wgb6frst8WkGTJ6RcEzEr
         KNOFGt4FEan0AjQPtI4q2qdRNH8RP4A3XMitmBMWWINy2EfnJCmhjf7vdcXkg8LTy2KR
         Qe/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776715049; x=1777319849; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dGNyxGaCqqvjGmB1UrjxsyafCLtfON0c7TpLnePzPoU=;
        b=XA9HNag0muqVqNomQx94Rg99g7WdBxws2zM4TtDwHnu6LPPIKk2NBcOWO8AuErzNk6
         qpW3HpFkF9hjnTX9ckFuuDdCjfzu1hEkWjtIg168/Yp/znQkPW6dfCScqisNPtKi2/WX
         7h027VMqbF+Zm4cCdnCr255FINRAc+Mow/D0XP94G/p3PDWKpHte7zKm6Y5ZJm1+vsei
         4ht7q7kJavUgUO5I9ziWqDodETy2dV5j5T9e+rz1YUXXaZ0t84VxWxR66SbouCCVuqlj
         dJnapZw707ag9GFqsy0rdj6kVBba/PJcjeHQRi9ADKDJr9NQn4GiHKAoPoa8ASICyMSG
         WP5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776715049; x=1777319849;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dGNyxGaCqqvjGmB1UrjxsyafCLtfON0c7TpLnePzPoU=;
        b=YMEsehbpNjmdri52t48SwF3Hfuy3/5ezKzbX5gaf+wbALrD0CzA9UGuxxv/LTLIYqg
         Yb1KId2/zr8LTBVay3TfNUBKv9cK+PFPwDoMjzScebvJ1+F9PONkyA+bJdYFjlWllcyg
         WKiVxbcY5mrk+IjONFG7rU6mdg1osEi8XBXoPZ/jdDB9dPubNZtdWe/pugAqt39Nqq4U
         lI0X9jzywUyyLH02H5svv8y8ZQuSKHdlWvsI229roEm/7KkSmzwIB0B6bjv0IKVHXj08
         jxjCY2XXeTdPX+FK7tDJkQMGkQH1M84+HqNyA6lX3EMV05cHws9sATjrNtAx/82Zyckf
         DDxA==
X-Forwarded-Encrypted: i=1; AFNElJ9rlVSpuoejBdFcJFAuVYHdJI+G82K5IUXaRAlwmxssILKKZ45cLFnzOvlV0Rc9koCnRzm3w1b4hPZqPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyX7fhdNfC7JvMruDrOtdKtl50sAyPRJHpjlZ/LHLNv0npT1BAl
	KhsDTv2pK3B5jVDF/ZlXfITqLyl4uo2Lr1wIu0pj2bydJoYmCnJJFYuL/Z42v3X12g3mrITD/Xv
	wxlJLp5WMYep1ZMYidgl/4B0L7b4DNUyZ3ex24cpFFg==
X-Gm-Gg: AeBDieuoykAf8FebJJ7xZdQKYFOCzQstJ7fDUiKi7QfQyBer7dXQldfU8H6kWoUWuV3
	ohNSZIHMtNM61VOtpX6lhaMQVjH+gDPwTy11jYFIeGbPLhY8QCl58A5LQY2/Z8NB5Lyf/2S17SA
	IUMprH9+2Eh+csV9ui9/j1i6wN+jLdEMYAZcQRIxWp9FVUJSSDgyvoEM1a/CWmAU1nCYASVWsjB
	cCov2+CX2rRe6L9mM8J/9HxsgdjlszCYwgIUmiHo37of5OegGshfnHSZYQPKWa1nQDNBMkpL7lt
	ovajXIi+TafiR0MCn6u6XWK6j+g=
X-Received: by 2002:a05:6000:184b:b0:43b:3d02:7806 with SMTP id
 ffacd0b85a97d-43fe3e0bd7fmr24060028f8f.28.1776715048203; Mon, 20 Apr 2026
 12:57:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <5RSTHU5_nsLp9gy49GbhT_8mHBjtBeKDsC6F1ABHCU9ZdpW9A8692UruVYnsCexIJGWsWiW2R5WtPULge31Gyw==@protonmail.internalid>
 <20260419-wip-obbardc-qcom-venus-firmware-v1-1-08a0d3cf056f@linaro.org> <b18d5f20-4013-47a3-bf43-06162682a65a@kernel.org>
In-Reply-To: <b18d5f20-4013-47a3-bf43-06162682a65a@kernel.org>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Mon, 20 Apr 2026 20:57:16 +0100
X-Gm-Features: AQROBzACmX0cPvDYkQeJ28spfjSOvMM2oYx-m0UuRXWzp-LCBYUWWjVoVMUQJyo
Message-ID: <CACr-zFBV0p_61ZA6QDLXDqtUqnqajyqHhC9H2SFJ2kSZHevwVA@mail.gmail.com>
Subject: Re: [PATCH] media: venus: declare firmware files via MODULE_FIRMWARE
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59177-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christopher.obbard@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 0180F43378A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bryan,

The background for this was to ensure the firmware is available in a
system image
or copied into the initrd if the driver is built-in. This is done in a
CI environment without
access to the hardware.

Debian's initramfs-tools looks at MODULE_FIRWMARE and copies those
files into the
initrd if the driver is built-in. For now, a workaround for me could
be to just manually copy
the firmware into the initrd and drop this patch.

I didn't get to the bottom of modifying the firmware loading code to
make the driver
defer probe to when the rootfs was ready and instead just threw the
firmware into
the initrd, but that's another story.

On Mon, 20 Apr 2026 at 11:20, Bryan O'Donoghue <bod@kernel.org> wrote:
>
> On 19/04/2026 23:39, Christopher Obbard wrote:
> > The driver loads firmware blobs at runtime via request_firmware()
> > but does not currently advertise the possible filenames. Add
> > MODULE_FIRMWARE() entries for all known firmware variants so they are
> > visible via modinfo and can be picked up by user space tooling.
>
> What about the board dtsi files ?

I really am not keen on adding all of the firmware from the board dts files as
MODULE_FIRMWARE entries into the driver, it then becomes two lists to
maintain. What do you think?

BUT talking of two lists to maintain, I am essentially duplicating fwname in
MODULE_FIRMWARE, so perhaps my argument is moot.

For my use-case, it may make sense to "teach" the initrd generator to look at
the firmware-name entries from the dts files I am building for. But that is also
not ideal.


Cheers!

Chris

