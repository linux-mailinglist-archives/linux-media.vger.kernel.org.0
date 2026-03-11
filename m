Return-Path: <linux-media+bounces-55303-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PVlLvUAsWn1pgIAu9opvQ
	(envelope-from <linux-media+bounces-55303-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 06:43:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1705525C83E
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 06:43:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D2AA3118FC3
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 05:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEA4234D93E;
	Wed, 11 Mar 2026 05:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fc9Y/gi8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358A9347538
	for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 05:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773207786; cv=pass; b=mF3EJ7ICbvZYOp+6Zr5cmyRueJ5t5EFgPgkQOFyt38S6F+mUlPmvTZrPzwfV9ERvO9pDc4zG7i+b66RvM3fehxVUM7va/j6bAXzX2rMYRbnDbbimK7J3DtBODGd8dgBg8zo3oVgXjj0iIMl8e323Inb0Z5bjyP1RvABBErnctMw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773207786; c=relaxed/simple;
	bh=j7GPyZUOKWPd6Eb1FHA6D0wCDgNjFxXANFaMP57pH6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ie2eMW42afcE3a+uhsdkpCG5m8tZDT34jgWr5F5N3kI+jOCLKAS9rDBz5L4ERSaK/Kb/LLLWvRlQtXPSAIoUeiJrDwZX6Q7SaAYUK/vSsDcNOSSdetNcCFSLgUn/R3OsHKx2glnEqlAhwigJeSn12ZNiQbLmssD8hqKfoJOsqfk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fc9Y/gi8; arc=pass smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c73967cf77aso2127536a12.3
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 22:43:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773207780; cv=none;
        d=google.com; s=arc-20240605;
        b=b1OwRcfDqK3iHfFU4VmlDiv1/zFwlwSlkL5OeWM8dHmmGXGvgtBXfIJtNedMS46bOq
         vOhM/+iT6ktdpQ2nNaxo8u76ez0JdCsGdDP7bXsVlLX3fSsbH1h8L4Vf6PHhP9D9/zpJ
         +LQruvCYNekg1gRs6/20OKiJjJL/Ns4FbDS0ndvFy7rlyNSZ6OcG5mbuI8Ei3zOZGKha
         nVyhtrEOGy0+MtITIpMq0fxv9tTuvn3Pl9Pn73x9SV8xXvLXINFSlYfkml/iYf4hcH9+
         E8e7bS4LHDMoeY5JjYS5B/bA6BDtmGHkiSzlScE+sSfhOLmBNwkTri2wzuIZBsXEF+lb
         FFww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HsZ0aj30QzrWxLy9ik/IeJVQ3KkElzxj0uQiMmN5kNQ=;
        fh=Qmu1zxfCwCjYrJgG5G4e5wlQojpS1sQ2ACzeD4kYTHQ=;
        b=Kz28FSRJOUFZPjea66tefBZb+5V8avSpJTH2aBHXcgvIw9ig16KGKkUqPCXeZ+WL3e
         9RZrAVXCoxgSUBTQkCqk0Ws7P95uPHIOQjZdzJyGyjQpq7bV1BegSX7WHIktvquSHvwD
         lGqhgO98XZ3A7v5Hnb7jMB8rt5ebE3BmEGfhHloP3L0ZsDk6aJRHA3UwyCEMmtCRtaB1
         B1Kkdcz3442JLDckdz43z/eiaFr2OjhKursMg+BQpZeKu+PlM7Ic83e5dnybw5a2fmLT
         J83GDeZCrDkH74m+TbtVyTmFJ2e7asQ0Md2x2ljqQzc47XlvFOudUdr2D9irH8D3EWGn
         TQWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773207780; x=1773812580; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HsZ0aj30QzrWxLy9ik/IeJVQ3KkElzxj0uQiMmN5kNQ=;
        b=Fc9Y/gi8h0IRJqbzu7rWmHZPhR0danXRKTqZ4Vp9nYMsd3/XoHh0jp1UnTgITpvYJf
         e5T5nR6kq5ZTSgHtpKTuzxYNH5JAHA2KbT9Y9oXAZQpJYebC5P8w9BUWJzLqRIQCKzBG
         1Tfc56uaF6EqYJ7KMYtMorUZ172ncyZaswvfg4FOP3xH3Uaj67UshLib+Y22Trbf32C1
         +1hlhkuwd9p2hz/TBG42/kJ2zo8tDWphAGyCdo00nNd8oEJda6MrQ8iSMElMM4xBRO3+
         Ouz0He3U3b89ngArRnTIjtwRjxn3hwZ420SF7krDkuB4oKIIZaauHEHNVZY+I56CJQEe
         zEEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773207780; x=1773812580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HsZ0aj30QzrWxLy9ik/IeJVQ3KkElzxj0uQiMmN5kNQ=;
        b=IhOUy8mdd6wp2sldPanfOKATWxmjpL+rZvhJq6y/kXlTfvhPc+wp/0C9hWeW/pIlhS
         lTG3w7RHB98KqeH89M1rEEnR647l6GeyGL5TmoiEI4DfTL5eppmzer5ab6J2QpHFKm4p
         8s9kAsvxnI1yoaiOCZdGjyurFuYVOGFk+djt4XYxVzwp18WNQXpYMb1m48cCom1WuRWK
         1zl2kQILOboH9wVaIIeaZm00zDg72O2RXhrAk+M3sU+jkODXh4CD3NID3K/gejB59SKP
         H+4yF7AzezoS/uJQcBxSvJ+skmXFCz3K78eyInJZxsbhiOfIxxQOTpzPj/n1fGA4Z59I
         RwVw==
X-Forwarded-Encrypted: i=1; AJvYcCV/oQxkrbHR+sO55ssRuKbqCNyJP/sj7Y9eFphJTwL7T+fO+woPRkBov1n0muH0F6Vk7IW/FKNj1cjO9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMSqfDkrLLZBzdsmJVLR5IY04OACQPyAh12dKZSl70MTwSP66o
	yqIqg2eRlReUiOyUiMPK55TWH/LaKWOII0IEU0XWJeqo4kbhhegWvqIxA2FS1+XZDon+Sm4u05/
	jUoVADq2FaTvkdAq2CnWR4sRwGQNEyQ==
X-Gm-Gg: ATEYQzyA40oJ4h/oa5q0m5s+UntR5i3JryDxp0MzPElg8ifwQ8S7hgQ4UX8PIRWiekA
	FVmoeQKMJixpGQUkgOYCjYoff3443om3N54GpX8C5IybW7VKJEOCb84m15u/a1NUlha6VMnIzX3
	Wrwi7IE1w7utFdDC2qZFvr+beW9omaxBO0lbzVgidn48xFiKKcGf7pwMS52DHdR01Nve4AzG/W5
	PEEesSyNmN0S2Z0BfoAXEVCEXFgxZFrDb/ylcsEzGI/iSLNdEsf/9whJO8R4YqMuT2VA94L/Azp
	PbgHz/x+WxJR5gv+AS4NJTPYqQHgBIcT8DiXPV4oNXZayGk1C2ykC1ovYDw6oStoZpF/
X-Received: by 2002:a05:6a21:458f:b0:398:791a:9caa with SMTP id
 adf61e73a8af0-398c5ec806amr1236794637.18.1773207780121; Tue, 10 Mar 2026
 22:43:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
In-Reply-To: <20260310200513.2162018-1-sanjayembedded@gmail.com>
From: Luka Gejak <lukagejak5@gmail.com>
Date: Wed, 11 Mar 2026 06:42:48 +0100
X-Gm-Features: AaiRm53yOPVigtTBWqUrHQSRYbaimfIQ_tKWwOGhPWuEPWqnKrEs0Ob5KWiVmFM
Message-ID: <CADRnA90=F5rRtWWJtSg7mA_QLzQa5Fzh3s2RzXDJtOOTiitzrQ@mail.gmail.com>
Subject: Re: [PATCH 0/7] drivers: Simplify cleanup paths using __free
To: Sanjay Chitroda <sanjayembeddedse@gmail.com>
Cc: jic23@kernel.org, m.tretter@pengutronix.de, mchehab@kernel.org, 
	p.zabel@pengutronix.de, tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com, 
	yunfei.dong@mediatek.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, johan@kernel.org, elder@kernel.org, 
	gregkh@linuxfoundation.org, pure.logic@nexus-software.ie, 
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, 
	kernel@pengutronix.de, kees@kernel.org, nabijaczleweli@nabijaczleweli.xyz, 
	marcelo.schmitt1@gmail.com, maudspierings@gocontroll.com, 
	hverkuil+cisco@kernel.org, ribalda@chromium.org, straube.linux@gmail.com, 
	dan.carpenter@linaro.org, ethantidmore06@gmail.com, 
	samasth.norway.ananda@oracle.com, karanja99erick@gmail.com, 
	s9430939@naver.com, tglx@kernel.org, mingo@kernel.org, 
	sun.jian.kdev@gmail.com, weibu@redadmin.org, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
	skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 1705525C83E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55303-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[42];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lukagejak5@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,pengutronix.de,mediatek.com,gmail.com,collabora.com,linuxfoundation.org,nexus-software.ie,baylibre.com,analog.com,nabijaczleweli.xyz,gocontroll.com,chromium.org,linaro.org,oracle.com,naver.com,redadmin.org,vger.kernel.org,lists.infradead.org,lists.linaro.org,lists.linux.dev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux.dev:email]
X-Rspamd-Action: no action

Dear Sanjay,
Would you mind explaining why you put so many people into TO and CC
fields when sending patch series. You should stick to maintainers and
reviewers from maintainers file as others can still see it on the
mailing list(that's why you CC kernel mailing.list related emails).
Sincerely Luka Gejak
P.S. If you are including me in further discussions or patch series
please use luka.gejak@linux.dev instead of lukagejak5@gmail.com.
Thanks in advance.

On Tue, Mar 10, 2026 at 9:05=E2=80=AFPM Sanjay Chitroda
<sanjayembeddedse@gmail.com> wrote:
>
> From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
>
> Hi all,
>
> This patch series replaces manual cleanup and explicit kfree() calls with
> the __free attribute from <linux/cleanup.h>. This modernizes the memory
> management style and simplifies common error paths without altering any
> functional behavior.
>
> The __free attribute provides automatic scope-based cleanup, making
> resource management clearer and reducing the chances of missing cleanup
> on early returns.
>
> No functional changes are intended in this series.
>
> Testing:
>   - Compiled with W=3D1
>   - Build-tested on i86_64
>
> Based on:
>   <linux-v7.0-rc2>
>
> Feel free to share your valuable input in context of the cleanup API.
>
> Thanks,
> Sanjay Chitroda
>
> Sanjay Chitroda (7):
>   staging: greybus: simplify cleanup using __free
>   iio: ssp_sensors: simplify cleanup using __free
>   iio: st_sensors: simplify cleanup using __free
>   media: mediatek: vcodec: simplify cleanup using __free
>   media: chips-media: coda: simplify cleanup using __free
>   media: allegro: simplify cleanup using __free
>   staging: rtl8723bs: simplify cleanup using __free
>
>  drivers/iio/common/ssp_sensors/ssp_spi.c      |  9 +-
>  .../iio/common/st_sensors/st_sensors_core.c   |  7 +-
>  .../media/platform/allegro-dvt/allegro-core.c | 95 +++++--------------
>  .../platform/chips-media/coda/coda-bit.c      |  4 +-
>  .../platform/chips-media/coda/coda-jpeg.c     | 39 ++++----
>  .../mediatek/vcodec/common/mtk_vcodec_dbgfs.c |  3 +-
>  drivers/staging/greybus/camera.c              | 27 ++----
>  drivers/staging/greybus/loopback.c            | 35 +++-----
>  drivers/staging/greybus/raw.c                 |  6 +-
>  .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 13 +--
>  drivers/staging/rtl8723bs/hal/sdio_ops.c      | 37 ++------
>  11 files changed, 78 insertions(+), 197 deletions(-)
>
> --
> 2.34.1
>

