Return-Path: <linux-media+bounces-56552-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eM++HGmCvWk4+gIAu9opvQ
	(envelope-from <linux-media+bounces-56552-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 18:22:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE64E2DE877
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 18:22:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E712305B282
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 17:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 307143A5425;
	Fri, 20 Mar 2026 17:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ocitt93n"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D21372692
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 17:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774027040; cv=pass; b=mLdX9QJ8ge75t8Yr3vZA2bCfeZenM3Qg1DrdHgGm2Fl1StU1c/PMU3DVeN6gVJxuZ6llB+wOBJ7NkEljh59wV5TNMN/kDWllt42iU/Kp6/d8UxnvSprnK3umXH5tY+TI5X1vnapHJfpFnKQOfHRMxDoow+jROxG8sTI7/QiSaY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774027040; c=relaxed/simple;
	bh=iNhZ2wMLyGc08p9SXAlItmThExJu1Q8bjF+bH96yuFY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CqgwibQfiC7Gk/U4yAYgODBMY4yHuXXpxYgwM9jA5bBrYP3yre4c5U4OmQ9qLjV58ay4jc2zW+kL9vwnc50cdT/rtsj5qerW9rI81IhSiF9VOSnXXzC4M70u/5+xmHKM22LrMEqcJV6VPmour8Dkqa0OjyOn0FchWCpDZpxkBIg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ocitt93n; arc=pass smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-486fe2024a9so4976395e9.0
        for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 10:17:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774027038; cv=none;
        d=google.com; s=arc-20240605;
        b=B37SbAB5zmTkcSQ6pz+jrdUsaFRhYKAlHWcM6uTeimDva0ImIfNw6yccox3cyIBPKk
         4XeSs5lbjDFmhYrH8tzPjlg9AJRPMKD2x1c9+lcb+EvEqP1lPJiOrkx54c2dxT8VQ+eC
         IHmpIBsJs1Xv4ihymDfDEzmqecz2SuYaAAYwk6aqGfHXKkwIOHMy7cnOohshgcwjEPQc
         1AK//qZMy9pKWiFumpMa3XDHPlngrvWuSg59VqhyNmEnjvOQFKyDX5WwG+NaqYN/VFC0
         Elm+G6kRV6Ba4Zj3A84K01YbnsNOFIrNq0B7uBjckQFXbWiq7kpDmCewMgy9h9t7xbhb
         ZAvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QhFtNfGXo+sAGRLOrajRrqZfKQSgiwD114zY0m+OvzU=;
        fh=8poZqukSxTNpKfhFM4PduxMa9jPCsFNH0WMo0DXI3bM=;
        b=Emu7zHQooOm8SQUUME35RbTSyiX6nEL1bRtkXaEmbgagfX54tB2jN62+nYcEiY5xTm
         +uq7mbsCw0HWRvRjhjOhlY1366R628aSl/h5kO/xP3+aamulYTdeCrp5/ILp+pP+p6vF
         LTSFgtAM2ea8Hbtjpe4sRRG0TrYby5mN54kdV3hDDhkS5UYGZmYOFBOvD+0+g5FM5hnr
         Pa4Sk+Qlc2qiSxcrD7Jp+yeWIvHeZ5U0pG1PvBIGRTTA8yEz+A09A+/N8P1e4Rr09NKw
         WPNiSU/A4Gn7xZzRuF4HSxYzMw1XE9NlMCC5416DN51r/w5mH5Ii32q63UoQR6wSgBHd
         +7lQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774027038; x=1774631838; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QhFtNfGXo+sAGRLOrajRrqZfKQSgiwD114zY0m+OvzU=;
        b=Ocitt93nTekwtDlqSu9wGP7rLIndoAGKkmWfTlOFMTHPGG45iJv52WPscJc56gggMY
         z67W2IXR0E5sM3BI+WBhqawHnAc0BeQ8fxx7jGmDv+5RVWbmVj/Zi2aGGhumlRqPRWIp
         4vJpn/u7lcmmlUZX3UBC/B8sIdBia3VCRCtrjsEdPNqgBarletLb6ApclowK26mhspnM
         xEZi1fPQSStcbrY4NkFtmlj24IiT6mbQ4a+54d9gEKnhXCnJk5QCNHe8tRly+Drvyl46
         f9pXLS8me+QoMhbxBxp3DcHGSNnah6/dJdOgM9V6ogvQWaW04QzapuCbtw1GsC593nMB
         DxJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774027038; x=1774631838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QhFtNfGXo+sAGRLOrajRrqZfKQSgiwD114zY0m+OvzU=;
        b=Uc3fRU+fnbjPRV7avk2kHT37r5KcRjsZM+vVqDfB7l8cqW3+YMB2ILycmSCn1iNmh/
         DZL+Z4ZS9T1eZt9r+bb1ChIR9QXwv6JaSm9BxyWbccvkv4NxOH1kN5RzemdyxXB6eG8j
         rkp5cet9qlP6mTHSgJ6QKJFhkvQndO0mTNYfd/9XigF7M+QjlcgfiZ4SSNQNtpX9+ox4
         iJfosaaWbx/h+sCiMyZJL8Hla/By9wbiYA/Ax02bwq1yo+F3s7pqRMbZPcKDZNEaAiLf
         B1BZk7wbnxMkwLkvuwgzuVmZb2w28tOhs47LXSkhWJ+/07fhzTctsgbbAxU3FSLEm20z
         nwnA==
X-Forwarded-Encrypted: i=1; AJvYcCWUau/TouI2BnoPDX1nId93W7kc/ry9CxDyLm1xryuKcHEjwUSjQ7dtfAo7SaC0kumZb1UEmaQmUTK/Bw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzclhnEAL82UVjI+IdBKCauciMebBYNv0ejMiGALMrHzD7cjRNo
	NL46NWoT/gKtxPK3dSANJI/K18/q877XCaeaAnTVsH5QCh/wvAOj+wPELWY1V2lZpHJ+i20K7WH
	AUBCc9Wa2TziC01hyGv4D/BoHhPB6ba0=
X-Gm-Gg: ATEYQzx0cvMb1U+Sh009RYOeXEOwvaQ33gI0RfEx/5ma7JzVn23GE4KBAOvMS1uj4fd
	FSyBFLwRLixLB+EufYKs7fL+4rdwin7DCGdHOm8A3PRUbptRdjfphi1cLIfK7BdYg//7TfSnUo3
	icHRbMKqfRY4Kn5VEHGEz4tigbicVlp3ta3UNJ3FoCl0AWDqKurys7eKy2vhA1omI8AKdXODbuZ
	DRsOkE5N/U9zuW4LnNyZJKtiJS3PzFhi1wA2Uy0PodR2XzuPacDbPY6dWPb+hmbukwFWAj4S7Fc
	YROclBicMaA5+emOgvJtyAyUXJPPjWV9k3D+ZSNpaMpVkIrikHXHthbVKTz1AxZ6LBZN7g==
X-Received: by 2002:a05:600c:8583:b0:485:3f1c:d8a1 with SMTP id
 5b1f17b1804b1-486fedb9631mr50339565e9.9.1774027037490; Fri, 20 Mar 2026
 10:17:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313-mali-ivc-fixes-v7-0-v1-0-cb0714cd1279@ideasonboard.com>
In-Reply-To: <20260313-mali-ivc-fixes-v7-0-v1-0-cb0714cd1279@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 20 Mar 2026 17:16:51 +0000
X-Gm-Features: AaiRm50l-VieBOYlOBaF8d8MPJDUaDBpjbsbBE5CsWPetMD5LTkW9QNd0OxiFpg
Message-ID: <CA+V-a8t0pskENYNhBiYCk=NtU7w9J1wr3TMtH2GQm_bz_-8thw@mail.gmail.com>
Subject: Re: [PATCH 0/7] media: renesas: rzv2h-ivc: Fix concurrent job scheduling
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	=?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <barnabas.pocze@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
	Daniel Scally <dan.scally+renesas@ideasonboard.com>, stable@vger.kernel.org, 
	=?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <barnabas.pocze+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-56552-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.945];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,mail.gmail.com:mid,ideasonboard.com:email]
X-Rspamd-Queue-Id: CE64E2DE877
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jacopo,

Thank you for the patches.

On Fri, Mar 13, 2026 at 11:14=E2=80=AFAM Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
>
> We have been exercizing the RZ/V2H(P) IVC block quite intensly these
> last two months.
>
> Here it is a collection of fixes and improvements to the driver.
>
> The first 4 patches in the series address a few registers writes that
> do not respect the documentation.
>
> The 5th and 6th patches fixes concurrent access to the list of queued
> buffers and fix a WARN() visible under heavy system load conditions
> caused by concurrent buffer transfers.
>
> The last patch is actually up for discussion. It is my opinion that the
> trouble of setting up a workqueue item is not justified by the
> relatively small amount of work that has to be carried out in interrupt
> context. In any case, there shouldn't be any functional change
> introduced by this patch.
>
> Patch #7 makes patch #6 reduntant: if we use direct function
> calls, then the issue of concurrently running workqueue items cannot
> happen. However, I actually think patch #6 has value regardless as it
> makes the code more robust.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---
> Barnab=C3=A1s P=C5=91cze (4):
>       media: rzv2h-ivc: Fix AXIRX_VBLANK register write
>       media: rzv2h-ivc: Write AXIRX_PIXFMT once
>       media: rzv2h-ivc: Fix FM_STOP register write
>       media: rzv2h-ivc: Fix concurrent buffer list access
>
> Daniel Scally (1):
>       media: rzv2h-ivc: Revise default VBLANK formula
>
> Jacopo Mondi (2):
>       media: rzv2h-ivc: Avoid double job scheduling
>       media: rzv2h-ivc: Replace workqueue with direct function call
>
Tested the patches on RZ/V2H EVK with IMX708 sensor on next-20260319.

Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> #
On RZ/V2H EVK

Cheers,
Prabhakar

