Return-Path: <linux-media+bounces-61216-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WI/TJh/iAmpEyQEAu9opvQ
	(envelope-from <linux-media+bounces-61216-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 10:17:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC0D51C914
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 10:17:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F32D3303798D
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 08:15:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8185D47DD73;
	Tue, 12 May 2026 08:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zf6Sx//S"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684F747884D
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 08:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778573741; cv=pass; b=hxRyAFHd44xLBHKHhOIWeNtRZ8+hY4f1Dw2kpUcFwVZBBa/MAkTMEOkN8dIeN8qenapAOOqJVqBa5S5wMgybRuDY3QgqFcAKdnCtqgcnmpZ0TYFTHX+8CYJxcwHsOKslXMJ53YG5Gdwkav5+csCYn/pWPp0EDny9MV2NB8LNZq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778573741; c=relaxed/simple;
	bh=a17JfvfY7Y/XLfxZ92JrjnsFOql4egWb1BtwD/QQ/FY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IdAGZUrxdii2YcVo5jj6AJrsNhltPV4a1M1Q3BNpq0kouKK26Qc9LPtSGesZcSh+txPnKIAUDgO0sw1G9RolWqbpvqRnqYSyy7Vwc0RK9ekU2ueKb8mi+xxaxyPoWJub7ZWZKEoyGVZk3o19PhgMqKovNcy31OGGHIFWqPwtZ6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zf6Sx//S; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43d7e23defbso3029261f8f.0
        for <linux-media@vger.kernel.org>; Tue, 12 May 2026 01:15:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778573739; cv=none;
        d=google.com; s=arc-20240605;
        b=a7KRQ7NiSp5sacUc+PVHGHHJOROo1CdFmb68oChCZYn9zWNFJBhvBsjDcXRn3TOlWN
         9GyXkb3zibcB0pANmCXkMGoInv+vIidh3uiaAxPoTEa9IuiMXpmogHpiBxziRppn8L5A
         /8dQ96X/akmZw71L/017w/hVxRmWB/l0MylxZLFlnhCylPMWC7YpT1ZO7juvYbSFxYWn
         iRujcgEeHT3MFpldW18znrf9xPf695Vp8hI318LxL4zQvmHguBTwTPfovsJIhyleHZvp
         eNiG+EbpYroB60nTU/5/GDzyUXIdxQBdOUoqZvLEzQRGz5o4AZi+4FlE94J1/Wh4Nrbd
         e5UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s4KE1DWnczjo3tUySIv2QQL5+IpU6t0WNkEspJKLTh0=;
        fh=Db+Byhx4P+HT5Z6gVb4ftSvjgR9Y9brn/8badRXSADE=;
        b=NY1mive6L0tULVjEmuTmVJtvdnHVrXzcfqpzDShTAqoBw6Sd7tH+rU4uJGRnLBcIG5
         tFioU34R34hoMMea1m4SZfc4IvoUKnKAwaOKBMYLaQG9kxTPEYdsoU7a9EY5VxCazlE3
         jnrddf1MiNyjsqhLQOWM+Qsh4dGvRcdUWaCqC3zWvznaPQrhZDWZyM0CAmZDSFv1EkCM
         M2DZmDnlB6JBycG5PJNFs4CU//cxCeRiwmbsNloqqy/5p+94yiWka0zGlNzihnsz/Tzx
         G2OMoLhouQBzytPjvRrCWI8wiNp87UO838OxBPf5FCXheCw/nfqnV1tT7E9pBMVxA5rx
         U9wg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778573739; x=1779178539; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s4KE1DWnczjo3tUySIv2QQL5+IpU6t0WNkEspJKLTh0=;
        b=Zf6Sx//SPN7USQRwPfZK8qIrO6GWgDl0qXYvPOEXTCJuY6W9pHLV5fHPSUflyrsD2t
         a4w2wlakNA/ZE8kIAihwSw1yLqc7F55TytljWi0qwG9WDFeVepM0tjgOmEqJrYnCmQgg
         QIYTYDOaW520UYVhXCyNq+ct5IAsJrjC0kTQPnpp9N6JRqHqI89hZZZNCXGAavyFdh03
         Uj8P3pKqXL8dnsDC8i+kjsUSxTIOh8uDlU0zSmBb0NybHixp2J87n+GLlmxUToayFHZP
         WHfkhuETkSD9DGznWzHc+4bANoXQ1gZiOA2quez0YdgaltGifeJslFWUagbPyGs1nl8O
         hbMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778573739; x=1779178539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s4KE1DWnczjo3tUySIv2QQL5+IpU6t0WNkEspJKLTh0=;
        b=X7TccK3BG26pynux/vIouPAOGXdRvjYdXaBkILcMwTSQIpwctPxlZX/fmHVzEkGluT
         /vdcwu9SjX31H/8nlJDFEsEzkTc1z0gceBSFwi8ZXdUuSat3xGi+q82LeHQomI4u3blN
         kt64EIHr1UF6L3/u6MpM3ZtChjJLGxox915OXBYh29/f1c2z6lfpHS6GD2kWmqyRk6x2
         WlFv+EOtab6uiOgPkmr2iVTnj3rALcUy6lSzemF22J4zz/oPkDM10E8RNqOTRzf9vAUV
         AM3Kjquu8A99Fujy6uz+z/LbHcKcVUpaX0Gbr5wqHD+YxSlXAEpSliIZoiKITlEjYiqd
         Rgbw==
X-Forwarded-Encrypted: i=1; AFNElJ+cI6r3f73HxzwSwbDKjS/VeMRKHT1jUhGOwEVSxaCyqB9LDv+/aYV8VQ4EGuSeIz1qHcNKsdUb4VKpVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YykOWRXwHCIUqTdZq1VwgE3ksoEdYzlzMjr+LBIC1+fTW9Sd0R+
	/IfCFB9fowB2jCnc5VScM4j6PjnOrL6R72qythu6MTNnNc535iAh7vwjXUYFuE+VYnmyPf8eetn
	E5AusuXe4aastnRCoX0UBlWWR8BZR29IiQn2BhUE=
X-Gm-Gg: Acq92OETYmRy2JbiNdDijNtVkoj81SdaD8NLEQJVzhgFwu/N7KQPSk7hIUN4igZ7xqF
	CyPBRcrB3/a2RXSkquX++SFWabt8i7cngs5qtN55CEJr9KBGKaCll4qBv1JRyavPLsTBNcgR4gH
	Zw5D27r0il0Mn0WPA6IbZ2QhFv0we+nO6ue6L8BItlyJ9ytNVbck9rsuLXqwIetdEw4icvQpJGo
	oQY/jJNJFygJ9y/eUsEa9mCWHMEI7BPP3zmAAMGqEu5XTZQQFDSt920GJWxUZZ5MZtAJQUoKMEy
	2D00wPoc4JaBTCStn487UjmNw1ceZmpnXjUObU/SJbWjvYbZB+LIoIu66L564kH+rl6WpA==
X-Received: by 2002:a05:6000:186b:b0:43d:68ad:3b7f with SMTP id
 ffacd0b85a97d-4568c19b2a6mr18882279f8f.21.1778573738567; Tue, 12 May 2026
 01:15:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512065428.147375-1-jacopo.mondi@ideasonboard.com>
In-Reply-To: <20260512065428.147375-1-jacopo.mondi@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 12 May 2026 09:15:12 +0100
X-Gm-Features: AVHnY4Lr9Ul8UQGcTryszf_nN8PPSk508PckxycDcRxS9WSQWLesyuJ-3ITAqcI
Message-ID: <CA+V-a8u7ADLO5TfTVMSNAAXqHEg3aH09MQg+TTm1X9U1niAcuQ@mail.gmail.com>
Subject: Re: [PATCH v2] media: rzg2l-cru: Add MAINTAINERS entry
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: ECC0D51C914
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-61216-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 7:55=E2=80=AFAM Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
>
> The CRU was missing a maintainer entry.
> Add it.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>
> ---
> v2:
> - Re-sort entries
> ---
>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
Acked-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/MAINTAINERS b/MAINTAINERS
> index f2be8f02dffb..c15d00d4f0e0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22683,6 +22683,15 @@ S:     Supported
>  F:     Documentation/devicetree/bindings/timer/renesas,rz-mtu3.yaml
>  F:     drivers/counter/rz-mtu3-cnt.c
>
> +RENESAS RZ/G2L / RZ/V2H(P) CRU
> +M:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> +M:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> +L:     linux-renesas-soc@vger.kernel.org
> +L:     linux-media@vger.kernel.org
> +S:     Maintained
> +F:     Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
> +F:     drivers/media/platform/renesas/rzg2l-cru/
> +
>  RENESAS RZ/T2H / RZ/N2H A/D DRIVER
>  M:     Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
>  L:     linux-iio@vger.kernel.org
> --
> 2.53.0
>
>

