Return-Path: <linux-media+bounces-64064-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OGg0Gge+JWrhLAIAu9opvQ
	(envelope-from <linux-media+bounces-64064-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 20:52:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4E765151D
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 20:52:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=kFBS9Pyg;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64064-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-64064-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7C0F83001D65
	for <lists+linux-media@lfdr.de>; Sun,  7 Jun 2026 18:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 412CF3148D9;
	Sun,  7 Jun 2026 18:52:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737AF19F121
	for <linux-media@vger.kernel.org>; Sun,  7 Jun 2026 18:52:48 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780858369; cv=pass; b=tdP3+UXe8UlyPLJxFOTX5WmpnOljWI/T9JDhMIgi2WwqovyVr6cdhhD1/TGT3dDjObpaqd3zCunQZl3rL0e/eibgilUr40TO9SM1gKEV+KDRZnOZhjQP2tDv6T4ASFha3UurB//xUPJ6rjYTwcY4K6pekDtQKvOvn/ViqS7+NNc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780858369; c=relaxed/simple;
	bh=sxGzZMUfrs6/QHN6gxYyfffxrC4W0FfdRMsXLu9Nsgw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NTK4lQnnGwuV7ma6Z3zYaDxPugINO6Q7Jn1MSOsVAgj2XzrSE9GDs0xMFAbyl+xLCzEW22Cp2fCj7Bjv5HL6LWgA2tH2m/EtJ8S69SmQR+ME3IwFQq5kS3tpl6gtN/SYajaWSkej3B0XEJpHdVymHrjLR19PyKhp1tiQs23e1ns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kFBS9Pyg; arc=pass smtp.client-ip=209.85.218.43
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-bec3ffb95dbso536960466b.0
        for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 11:52:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780858367; cv=none;
        d=google.com; s=arc-20240605;
        b=cULMW5T9ajJH4y6FH+wPz+UD0hSEler97TQjPuCJAu89IuwGyKNdg7RB68mTlyN3nM
         WOA5a1cXPuLZnZ/yzNylQz/NXlDAMIC/EuNfhd4bIBcRHelX7BXetnXbcgBSLcs8hzBH
         pM3UEPrwgdniHsAhSHkfXgi4NGSTyIJkHhtESbKFXJICgMxdsCp0tAP1mv7/HVlgx4eC
         f1V//lbT/6MhPj3gD/qdAi+3LSI/daXeVA3dx1R/uFoZqxgrPKd/CVkvIiOqlc/qE9xj
         Q1VeWFfpuEZywgrb1lXucw2j4QtJe+yxeFTazgr7fhTVJstPt8GJfML504Rul8Absn46
         /whA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E07QAK0Ozjnxfvn7uSekYocA8bPQTqhruQbfEXuVrOg=;
        fh=H7W2j2wnWVYjqiiq+QnKt6suHuJ+lOcad+ik3DaoRhQ=;
        b=LbIjuj1lxf+YmnhKG6lUIJr/G5XYdB+GZYKfPjhDREf+4FYPXsW/Z1Cacvxr9ICeoE
         shNaX5A2N8bqRTDpg/CqWyS1mgwdEhfporEwzfHYDrfMVZHz0UKs9wJVOwth7MT/zMb9
         UUXQZLw4sG3NpKDYX+zCKCI43siGqR1R3f/ZtFwcWjuGrBdqHE44nF+L6IL1GBKystZs
         1YuQux35+qV5aUtBQaYzBUnbzjzk8RFlXuLqhmZJAVDi3bQegtn5oOnVYXA5Eee/4mrL
         RuGJo1bVMMuHGKvoa/LTAZ24fKga4VwPsQ1ItVOhKaS3p8YQVzsMpn9QRa6hHBUEPKer
         JwoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780858367; x=1781463167; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E07QAK0Ozjnxfvn7uSekYocA8bPQTqhruQbfEXuVrOg=;
        b=kFBS9PygSfEs+DlYKojKQBSdWSfI3I7g1SfccwFx+FAZhid9dNxj5h/CTx85OtfByR
         7nY80OgTMGZkcy5uaiwDDdNJ3HJfRbQ8iv9/5nbFmxQJZlCjETs0+kZpRZRkKqmrr+56
         hx6wlGBa6Xc9wgBPfLXeY/qUlKWIrn7qM0xUV8dvklnGEDqJhjNlbGbNevZuAX75FE20
         QwwMV8E7hIr3R5m3zuPI6gLdr3l+y1cQcIqBeK0kOhwEo++1/srlaWDBFdIsWA6PHikD
         +TN4+d9jnj6AgQQMkr6cE+v/uL8/qdjG+O4eb7yaYcAtRLk5vMLS4rEE4dtuHiWXB6Oa
         CdPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780858367; x=1781463167;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E07QAK0Ozjnxfvn7uSekYocA8bPQTqhruQbfEXuVrOg=;
        b=kNUacT7VXVruyqQmty/trJtye1EiclSqlH6M+axSwUWZ508INDskXu6mHeU9abW5wM
         dsS3rk8E0ZDz1+Ry74CxTmyatuhLnuGh9mR2wQr/d4v3zXYd+N73FzPlPgV71UC+H52z
         lZtDw67ePyr07KX5JijsfwqGb+A2JfDDADWSSfNKwz4bgMPRtsVZanJoWuKG4NfyY4ZH
         LtiGefQEiChM7M3Uda+5mTg7+AyR/P2cmg2+wPLZ3q6Qk4vHWVeDWgRdkxsUsd0SBUWT
         0JRejZRxD/zaadoAoGgJ2E05SPv/M/6Xjzdu1W67lg8+o1B1iH4NoGTmgN7QF9mRfDuy
         KfBA==
X-Forwarded-Encrypted: i=1; AFNElJ/mFar9AJWY4tcYTx7pFlj8tdYKrzZ5idixsMhPd7slwBicXOa8LM/5gukXPPdBy9S20bQZ2orzcpRkeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzacVUZNlthHNSODUFkMN1BfHeG7Wo6K6t5PmaZlygTP5oTb24
	P6sg6WQMdGR0ehjJmHBuufRnyWHXfBW9beHPNgu5Z1JMSjRNyJPsiGxiYc3n9SXI6LrdRypawSg
	UDjRBPK797QiV2sapCkP0nkaBO+9IZwo=
X-Gm-Gg: Acq92OFsg0K237MEeIOS0eo+rMRuPYeVdgrVHSoGW4Fu8+JD354oqzcdYBLeUPfTbR2
	421En7S2WqNpjPCGC+TYLGuGK0xXbpRZ8RG2D/4lhDV8toQPQ2n/fl1CZAPGh2cY0RDehO1HgEz
	4AmKP+XxWcaihQ25w7uRBO154D9CIGIYC/5iOjixFf/o9sirmXwPvDazkZwnHKAbyxqkuaF5LB+
	f3ik8VCQpuvHJXim0Yb9wfSzRkA6L20yKX3gECzPw7tn3jb4f3xqdjG+BFvUD+tClyRvaMwBsW1
	z4Uu9tAQGpxI5rwbJ5YCFhIThjTlNtFEv/9VZDMvON3mVvZsFyP5t5RqgwM1LuUAuDNJ2GBQX3i
	XDOvOri5fJboTBohq86bPhwLWO3BzpXzq/1y252vSQX29Ulltq00gsePNQHOcABM/8HN3PEKGsu
	T16Uo=
X-Received: by 2002:a17:907:2d92:b0:bf0:59a2:4ccc with SMTP id
 a640c23a62f3a-bf36fd9bc68mr664811766b.3.1780858366770; Sun, 07 Jun 2026
 11:52:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260606234427.9902-1-linux@notrealandy.dev> <20260607121833.10058-1-linux@notrealandy.dev>
In-Reply-To: <20260607121833.10058-1-linux@notrealandy.dev>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 7 Jun 2026 21:52:10 +0300
X-Gm-Features: AVVi8CfiiScLGYgh904z_dS_H6sFbPWdyTv6pSxK5s9SwXaQdygOyEuTqKyOaWo
Message-ID: <CAHp75VeojUKPE304xr9B0EAjVLdM1i5kCHB02=_y+OoMkxTiBA@mail.gmail.com>
Subject: Re: [PATCH v2] staging: media: atomisp: prefer kcalloc over kzalloc
 with multiply
To: Andrew Soto <linux@notrealandy.dev>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, hansg@kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-64064-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@notrealandy.dev,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:hansg@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[andyshevchenko@gmail.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,vger.kernel.org:from_smtp,notrealandy.dev:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0A4E765151D

On Sun, Jun 7, 2026 at 3:19=E2=80=AFPM Andrew Soto <linux@notrealandy.dev> =
wrote:
>
> Optimize memory allocation layout in sh_css_params.c by replacing
> the raw multiplication inside kzalloc() with a type-safe kcalloc()
> array allocation wrapper.
>
> This prevents potential integer overflow vulnerabilities by validating
> the array size calculations before interacting
> with the kernel heap allocator, aligning the driver with modern kernel
> memory allocation standards.

See my reply to v1.

...

> -       write_buf =3D kzalloc(sizeof(u8) * 8192, GFP_KERNEL);
> +       write_buf =3D kcalloc(8192, sizeof(u8), GFP_KERNEL);

While at it, you can switch to a more robust sizeof(*write_buf).

--=20
With Best Regards,
Andy Shevchenko

