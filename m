Return-Path: <linux-media+bounces-58233-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBOMKrJd1mmNEggAu9opvQ
	(envelope-from <linux-media+bounces-58233-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 15:52:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0694E3BD366
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 15:52:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 221593014646
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 13:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2A0A3D090F;
	Wed,  8 Apr 2026 13:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E0aub7tx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22536335063
	for <linux-media@vger.kernel.org>; Wed,  8 Apr 2026 13:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775656243; cv=pass; b=E4N5qRsVoNmVB5FuXmPFpYDynQQPoTvtY1Fbb8mAW9WTn2W1IMz2cMvs7WOcL00PF4DU/XN1bp10vVTk9WAa/TR3y8MkouurfQWvQyQXC23/VR7Z5PWz0+VbTr45ym9sEEWAu31G6SBkJ3rFoMn23/tfU9riBr7jS4n+CF+vwSw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775656243; c=relaxed/simple;
	bh=lCIJfRatUMsLXI84C494X/0r6IWitDQ+7gqAKLP9bG4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p2N2CJxETxE9sRcXap0MG73vDK/FFkKUr9SN8SQ/tfkKIoBfCkIHO4j7bhRgSrv6WFIEgql1SJtSFQ3l7tZGfSC0XU3/ZI7UlpBY53wu4cR0BsED0Q4Ek9nJws11VIl2b9ND3b7fElrX8GivZEWmDhPA6hz4oJNAWMPPhXlQUQo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E0aub7tx; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43cfe71e5d3so5335647f8f.0
        for <linux-media@vger.kernel.org>; Wed, 08 Apr 2026 06:50:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775656240; cv=none;
        d=google.com; s=arc-20240605;
        b=ljPZUoiyyZO1vAi0Ht69RJGNohJyTqNNb0h3HPXJEokbvicb8HjbUXJTYRcqW9Rgdv
         SIXnWz+t0JDTL/GvQBWNOHDNdzo41UT/k1rVC2SiJSkq7eX7KICsC3OcAtUR9dRkZQnX
         O4W5WTmu2Gly3KiccpIzcDCqne+jKuAj3RJm+flC1hK6dzgZ4murlOa8tOVpW3gxCEr4
         2D7b2YCHNQT+CFUmQ/SAfQ/rsJRnnEo9Vedd/QbRrwhPEVayOo9kuiKWQvQRbUaVWIDt
         BtUu0gtSDj2KK/kq75PS0/NnkeYiHefHdWn366KOnquzWgCmQ53alNidvMPH6kbPlF3C
         d5cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=oGtEb2yHeNmcrgvXzY1HsE+I5Aw6Ec0BxHiFB9eP2l0=;
        fh=dsD6BxyEYvzwmzQbcBTypsbWkL0f7ga35ytK9R9JgWQ=;
        b=KymTwYy1FCLpB6rknnCF3J3Ckbgxpz66uck6/TmOUAM28/m/YDaWPI8VfuabGktzlP
         IjBDuvXxPVbhK0nAr/qWuQslsS9JRxNIp6LAn15VJdEl9HQLaldDZY3KTWyUv7moshCF
         W0l21z82XGqjWpvayyaIzBEO2WNhI7awlyBXkOFoFI5ih3G4ALqZzMvuRxYnHK64j9I5
         6Kd2vX8oSv+LvoJcaZvdXtFC2pm3x5LvYd1KX+7Gh+FR59a4hhOp5eJxtW+S6xNAJWoe
         hlZ7cmBr9RGq2vFz1neDDw1P2mdzyHGIFAnbgg1Zc0lrusd5kAFKI8g230bWR+cHCZtJ
         1Mlg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775656240; x=1776261040; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oGtEb2yHeNmcrgvXzY1HsE+I5Aw6Ec0BxHiFB9eP2l0=;
        b=E0aub7tx/RbIe2cE5oiODjIUsvFMch95CzS6g6QlvXUmh0/Y65q1U15VCMHGiSUhyt
         Fi/lZw3XElb7ySzKUz4i9PLS6Tnm5flUaceJ4zg6xF3X1tzSfNeVVKf/nHjUkGGcqFm0
         TKNpm4UseAxVQqRLW89zVqhXAvQKbTvFxe6hjZHvAkU89WocIiw9RJ9bzz/wfQxq6/px
         BleAwtiZNTKsZsbIzxcx8jo7kQqcJJ2ljlffQdHpaP/HQNGC1v60QtPpNgyJ1jKXg1ri
         xfD/gfIjC5zskCzW3gj++rloNTUpFdQGb2UyoSY8RmhXB00EY7F2tq2IwWrDx2mgi5UQ
         3XMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775656240; x=1776261040;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oGtEb2yHeNmcrgvXzY1HsE+I5Aw6Ec0BxHiFB9eP2l0=;
        b=H1cSn91DNn3KlBAkDKYK3jZmC0wdNNlrkrX5nUsRNTbw0KUeBexZgXTPx2oarqGN+P
         0ZGccGiGuLtEyA4rhOZXTeaJvx6XPF8QXWt/M6VeVZKfSx2uWVnF3ntsxK84gHAGymJl
         HXN6cAHEWLQf2k0OusjsAKLx1l6rFT39ztD9GK+nv/FpkmHpvU4TSCTAAxfUd4rjYDAS
         cePzkv3y9j7K8yrXzQ+yxvYBGQh16N5Z4oJ9BaGSEuKvYWwlxNG3wRxmKZ2NCN0ahP+k
         ox1kIDj3qIBELMLQZqL0u+8fE3ptgM5Afv+OYXpcgrV1O69YUWO0LBm08tFrM6aSkJ3+
         5HwA==
X-Forwarded-Encrypted: i=1; AJvYcCULgZ2H2lo1qCGBQk0D2w6tyfsdj4yR44HwFaotDvNONsq2d3R6RZHoKiHFcGLsla8wH80fJzslyza6LQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi/qQEUbUHHVVxcK26GUK6fuYWgQ93ZfcDmt/ELGUKYHmCWEdE
	VHbMB8f2QgLFCkAZKsEMzHowawv3ClZ9YwDVblkmolYW8/CBqQqRFTn8QMI5yB/XVe5VIHlejFq
	aXGfAN3c7nxahoH/uL9sCCKRp7x4RfWnpmTxgRn8=
X-Gm-Gg: AeBDietxW43PP27tJRawI44f4ZOohE+pv1udRkcnOEhwPxvc2hVDTvKE3fU5GqjRVls
	EUENwfNWGKnB5QX2YRfhIfTw2h4uyWdNrJcJPJKp+MlPiihACAvIGmNJvkEsiGIGUOKxRck2g4v
	7KgsF2H0CEEb0za4b1dmIeg/l1LZUYaYJnC+q288pbKNYukr7ERN5zy9KCXXI5yDja78zCvF1YV
	64ipaT8NnqB+f1C15TO6ihnBgJQJrrVnCEIQQlHK4ex8107hcA7FWZhZQWSGosQsadfFE3brZrj
	PTMLgVrP6wGWkU25Snl1RSE/N/oWJtJt6Jh71tLfy6T3FBYjArngZxQ8Xi8wNAbM80briMg4Vz3
	oZW7LRosOHQcCmzAKVOtFO/k6uQ==
X-Received: by 2002:a05:6000:4285:b0:439:b057:cb05 with SMTP id
 ffacd0b85a97d-43d292f0b41mr32274228f8f.49.1775656240241; Wed, 08 Apr 2026
 06:50:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <adUeywfiQzZ5JgEd@ashevche-desk.local> <20260408134612.1380-1-joshua.crofts1@gmail.com>
In-Reply-To: <20260408134612.1380-1-joshua.crofts1@gmail.com>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Wed, 8 Apr 2026 15:50:37 +0200
X-Gm-Features: AQROBzCVC3JBDLGivxsFP2FG-KJ2ijABqTy6_kGDbH8FX82M3BkY3FmCKCm7dQ0
Message-ID: <CALoEA-xazTLhHpdQBtw0TU79vSpzv73+MTChLENbzAouXKGeiw@mail.gmail.com>
Subject: Re: [RFC] media: atomisp: change copy_from_compatible to iov_iter
To: andriy.shevchenko@intel.com
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58233-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joshuacrofts1@gmail.com,linux-media@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0694E3BD366
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 8 Apr 2026 at 15:46, Joshua Crofts <joshua.crofts1@gmail.com> wrote:
>
> Since the atomisp driver concerns transferring video
> data, it would probably be better to use an iov_iter
> than copy_to_user calls (scatter-gather i/o and better
> pointer safety). Per yesterday's emails, I'm sending an
> an example of a function in atomisp_cmd.c where I've
> implemented iov_iter usage.
>
> Note, this isn't a patch, more of a question whether this
> style of changing the copy_to_user calls is valid (or if
> I'm writing garbage code). I'd rather get your opinion
> than submitting a patch first.
>
Before I forget, this change was compile-tested.

-- 
Kind regards

CJD

