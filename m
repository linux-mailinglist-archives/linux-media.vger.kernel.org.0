Return-Path: <linux-media+bounces-53600-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMynIYGPoGkokwQAu9opvQ
	(envelope-from <linux-media+bounces-53600-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 19:22:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E39381AD83D
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 19:22:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D85E73282399
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 17:10:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76C7B368952;
	Thu, 26 Feb 2026 17:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X/teeb/D"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951673290B8
	for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 17:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772125771; cv=pass; b=iTJg+0wNbTCcFTRBEqUPxYfrieJQu7Q+vMPXSPA+NgIvhg853jMJjCeHXJb2l862L44+AbQjPufJkFHE3ykYNmB7KZ0XoMLE91fBZu6Mm6GUMku4MCbKyYMZ7xM+t8eTX2/fC5wSg0GtN/heDmAwdvx8dld4SsssV23d3nB5wpI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772125771; c=relaxed/simple;
	bh=NdwWsolg2gJUNM6isgYnzGqyXeK2I3/x3luj0VOWYtg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RzjHUYV8tcYvt6nxRIbvQrAXNTjkNmQ3RI+PDE7rEFeWzbvWUvoQPIQRdU7W84BBGeCnyRizD9qtgQcQAUQvcQrq4eN9GGMNabcLiETTmndA2j7Mr/VtU/fQUyNgA2qL2w1Blsq0wFtGFA4bimOPLDxytwlWdjJWgqnuFuwlTvg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X/teeb/D; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43991064db8so1146367f8f.2
        for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 09:09:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772125769; cv=none;
        d=google.com; s=arc-20240605;
        b=LGwAmzr2XBTagVljqbsiOigvP8FhPZrJ5fGcKP7LPjH/tdpoVO/WTQaXG6xTy8iiyK
         KiwhVHP1L/hZks0+fBIfSQuZE+MD1JbENyShWob1eT1tn01RXh/vj3tNYLE2p+FcQtz5
         VEaHvZ4DUwpVFGMnUAAa/Pmsg+vbB9Wqw9P7QN0e9h37hyip2qZj+z4r/whVenYOKz52
         FDyTc4y4XFZ/vNwgPGtrkOzsjJrXLEc9Nh8RJANnLYFWwNfuu5haKuRCT0x/wjvTSsBE
         ddajniyoILn/1k5LQZdWthqMpd3N09ypc6YW2kubAEaAJVISgJZAIwhuYW10fmR1FLHd
         /Jlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NdwWsolg2gJUNM6isgYnzGqyXeK2I3/x3luj0VOWYtg=;
        fh=yNS94GV+C7icwd6EwnKdUbFeqEvlclMl1ruA6CSz0Q0=;
        b=PGu+YQiPcTVwoqmTFtyBmwXyYsaKjOGmxj1tg20kaYhz1moz/0/W8fvMPlv9C9ES8A
         k1YMvS4l78/SHIerpDzrcYsgI/Bxa4D0XxG/Y9MNHog5EsZ6KKcyZ3Hihq20I75KPvTu
         jm55cks77M5PI8+wFwj7n2eG2U9feLTEjD3yqMtO0nXZLHLqi91exeZXF/6I7ImFQCqk
         iVoSes5Gfu8kq0+bvDtsdbA3JXWpZlOgghbkPQzm55+6R5pJAS2cJyu5uMNUhpnzIONc
         gjeW5ATRIxNWq7cFUWuA4TcR4RADsLv7af2AOjlvIaA+xF72GOukX9s1rgVSLGWjRzuZ
         /tJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772125769; x=1772730569; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NdwWsolg2gJUNM6isgYnzGqyXeK2I3/x3luj0VOWYtg=;
        b=X/teeb/DlbVa88TzVFhrMMbwiTpnNTX//6csemlmiSvVJorHWiL5x2e3zVI9e1qtuK
         eWd/hyf59lqjaODiSnXycAed2m/8+LANoKbOWDUVbHB5OxszzOs43kan9k/BCjRU3SR5
         +KPVIokUCBhCeDhO2v7HUhof9r4h9+TgeiDDzSTB0T7F74iWg+oZJgcSfbkWMAxb6s+X
         sX8LFxUeIHDKBuG3QjdFZz5wz0+cUwln/WZFQWx0Wf+/asGN5aL0onLi/tga8L4MLjlo
         ZGk8r78ym6MXeVH72ZmI9hdmArRff5ry7kiE2IAR7Gh8/y9HEWaWYyhLCwL+r46MZPRH
         yi7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772125769; x=1772730569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NdwWsolg2gJUNM6isgYnzGqyXeK2I3/x3luj0VOWYtg=;
        b=FWxNr99Ron7j3fTOoT+fHkOdJ5frnMdW5rra/Ym/9tRdjcvfrPm8JRBU+849uyua6W
         g6IMm2PRN04yITDxvncQOea5SctLFhYD5edMVHSPus2QkPO3736zYTAdDYKZo7wC5GdV
         oHhscXUfgqjC421pbrZKtCqUIm48pnvin1le+e5Cw2105NrMSjSDptjClGt4kvKIQ6VH
         dzBAWnbqOU/NHSUJrL9aLidPAJqPAUjGU8EOnwINBDbgJJTe9jauLMPKUDjls2JQMdop
         1E6mPJJUC9fBJFUiCjLaq8F+/9Ro3chTlaaSMLFp2wGwd1HNdFPgTJfCOvcbGsSpxHoT
         4bbA==
X-Forwarded-Encrypted: i=1; AJvYcCViDlKZ1PHu/865eRLBFtdkz0PnZciAmetch/vGEtyofBM03MJ6q6DiFpSnWJ3bw/cnKJ7Vw3F3iaYp3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJX6p+UyAj8ljPVXvl/nuFz0sObYC7C7JAAZt8xPsG1b+qieho
	DtXp3YGDCbyLoBeyeO6kcMGTKVEXLF5dF+CsdQhYyeXx1hArYRTWy4NJnHMJ8a3JFTJ2ZZibu/D
	6ZhrZsaHPUcbuIWdGMefy25RJxTPq1gY=
X-Gm-Gg: ATEYQzxkiJGcNyVWgzPpl99SGF7iJVf+LkCGhONz4DLSCpK6mw2GYYJBm6xljpRCpBp
	ItygsO5T7kU/tDQJqkOfV/rBzlNH0cA6y7YdDafm3rwCR9MB9b2n3HzyO6YxnBQY7u+C5LwNPA0
	mrUDPCLQNG0Zez04QNk7p2WiuTSAx8dUtGMvAEabnyBdKLQubmhHGv5snibwOQgR5KsxWvEdGhz
	nqvalCoDZegD7K6EA9M4T1dysxPwkaitMsSSr4dHxO5F63QQ2z3GtEp+7U60rrbWcx0STHAkRpT
	XStVUWxVtqTkCdXAQK0=
X-Received: by 2002:a05:6000:250a:b0:431:c73:48a8 with SMTP id
 ffacd0b85a97d-4396f17b061mr36791168f8f.29.1772125768766; Thu, 26 Feb 2026
 09:09:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260130124932.351328-1-clamor95@gmail.com> <20260130124932.351328-6-clamor95@gmail.com>
 <DGP1SU17I99K.3QKZWHDPBB74H@bootlin.com>
In-Reply-To: <DGP1SU17I99K.3QKZWHDPBB74H@bootlin.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 26 Feb 2026 19:09:17 +0200
X-Gm-Features: AaiRm532NOiD6_qJCcwIyPfsUO4-fF-YWthyRveATlcMfJkzAmg60rnRqSw5Slk
Message-ID: <CAPVz0n2uiF_UHK5_7-dW+AjazxTsonQQsnf96QvRu5HgmsyGSg@mail.gmail.com>
Subject: Re: [PATCH v6 05/15] gpu: host1x: convert MIPI to use operation
 function pointers
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53600-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[gmail.com,nvidia.com,ffwll.ch,kernel.org,linuxfoundation.org,vger.kernel.org,lists.freedesktop.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,bootlin.com:url,bootlin.com:email]
X-Rspamd-Queue-Id: E39381AD83D
X-Rspamd-Action: no action

=D1=87=D1=82, 26 =D0=BB=D1=8E=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 18:52 Luca=
 Ceresoli <luca.ceresoli@bootlin.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hello Svyatoslav,
>
> On Fri Jan 30, 2026 at 1:49 PM CET, Svyatoslav Ryhel wrote:
> > Convert existing MIPI code to use operation function pointers, a necess=
ary
> > step for supporting Tegra20/Tegra30 SoCs. All common MIPI configuration
> > that is SoC-independent remains in mipi.c, while all SoC-specific code =
is
> > moved to tegra114-mipi.c (The naming matches the first SoC generation w=
ith
> > a dedicated calibration block). Shared structures and function calls ar=
e
> > placed into tegra-mipi-cal.h.
> >
> > Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, paralle=
l camera
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > Acked-by: Mikko Perttunen <mperttunen@nvidia.com>
>
> I wanted to test this series on top of v7.0-rc1, but applying this patch
> fails (with b4 shazam). Can you rebase and send a new iteration?
>

kzalloc(sizeof(*mipidev), GFP_KERNEL) > kzalloc_obj(*mipidev)

> Best regards,
> Luca
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

