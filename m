Return-Path: <linux-media+bounces-51425-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOXpOfWFc2krxAAAu9opvQ
	(envelope-from <linux-media+bounces-51425-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 15:30:13 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5DF7712F
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 15:30:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A55FA300A319
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 14:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0D84257827;
	Fri, 23 Jan 2026 14:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ulpWL6sr"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1E21F3FED
	for <linux-media@vger.kernel.org>; Fri, 23 Jan 2026 14:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769178609; cv=none; b=AabW1tZBX/S+qMy8AHMBlIhXRHOr1b/YVCV1i4O3liLxxG5InpcsYDeC5kLcVxO5741UX5uOPmvXUifroyY+u8kpEYATZnd9X9srE6IJ2aA5lRbUo01u9Hp00bZp3r+E17bjWdl3kxCDKm76wtfQVtFtLe8VgJboR7a1nvLVmx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769178609; c=relaxed/simple;
	bh=UI2GirEzJAFiGOBtPNTqY6NwNoKqlBbwXyw4kzV4Srk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=hTMSM+LLMzfCr376NR61a4lyPALJfjc7xfSoVGavMe4wt5Bj4aoptMFfGvobEu1opVgRdL4mJLZG4L/puJdo2unMpbeSVGLPa/tIBnSBSXCUN67WPJwl/533aRQNOr/PUYD7B+cv7UHiNDS1P3UDOjSKDjFlU4id4rTdcpG1bUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ulpWL6sr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E0E7C4CEF1
	for <linux-media@vger.kernel.org>; Fri, 23 Jan 2026 14:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769178608;
	bh=UI2GirEzJAFiGOBtPNTqY6NwNoKqlBbwXyw4kzV4Srk=;
	h=Date:From:Subject:To:References:In-Reply-To:From;
	b=ulpWL6sr4dtBRnxvfCmHbO/C0yYB+46g3GxNr7NU/wzOIPeAZm/M7jNm2NaJABXo8
	 sjJ/fVrIf7HHR/OPsmtc+U35QT92BZ1P2AfoUhQMVP3PgmtQHGbd+XMvo66qpa+L8o
	 TWO3f2OdFjxbIabvUkTw/8QZpn8hCGgMVZ6tuO9U1uDw9sdjdPVFvvPN4ONqqXGEJC
	 vekoWHdYdgJUG4e+7aegODacnJmfJWIR0x9IvVepRO75dWPJQhojmFi+Mhr441qoQk
	 l0Fo0vlORkpXdk+tavUWx+jTHWLfG4CSLO03yv2aQ7ISStPPU3yZT/lcPgEupvQaWh
	 yxhzY9TTrczYw==
Message-ID: <6e5e14f2-ce2f-481e-a065-a8bab3d17ec6@kernel.org>
Date: Fri, 23 Jan 2026 15:30:06 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH edid-decode] edid-decode: implement ARVR_HMD and
 ARVR_Layer Data Block parsers
To: linux-media@vger.kernel.org
References: <CANAm-ceMub3beq21hkU+kEKxwXCWLM+AyO678gtGgL1BZ3mNpA@mail.gmail.com>
Content-Language: en-US, nl
In-Reply-To: <CANAm-ceMub3beq21hkU+kEKxwXCWLM+AyO678gtGgL1BZ3mNpA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-51425-lists,linux-media=lfdr.de,cisco];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.972];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5F5DF7712F
X-Rspamd-Action: no action

Hi Yassine,

Please post these two patches to linux-media@vger.kernel.org, not linuxtv-commits@linuxtv.org.
linux-media is where these patches are discussed and they will also end up in patchwork
(https://patchwork.linuxtv.org/project/linux-media/list/)

And please post the patch inline, not as an attachment.

If your mailer mangles patches, then this page has some help:

https://docs.kernel.org/process/email-clients.html

Regards,

	Hans

On 23/01/2026 14:11, HAYOU YASSINE wrote:
> Hi,
> 
> This patch implements full parsing for DisplayID 2.1 AR/VR data blocks:
> - Tag 0x2c (ARVR_HMD): 79-byte block with optics, lens adjustment,
>   field of view, center of projection, and streams per layer fields
> - Tag 0x2d (ARVR_Layer): 20-byte block with HMD identification,
>   layer configuration, lens distortion, and scaling support
> 
> The patch also includes sanity checks for both blocks.
> 
> Please review.
> 
> Thanks,
> Yassine
> 
> _______________________________________________
> linuxtv-commits mailing list -- linuxtv-commits@linuxtv.org
> To unsubscribe send an email to linuxtv-commits-leave@linuxtv.org


