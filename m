Return-Path: <linux-media+bounces-53027-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPFlFyA9lWlpNgIAu9opvQ
	(envelope-from <linux-media+bounces-53027-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 05:16:32 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C51152F17
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 05:16:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CAE823037995
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 04:16:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A98D2F5A22;
	Wed, 18 Feb 2026 04:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K4ZxHJza"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4231E19F121
	for <linux-media@vger.kernel.org>; Wed, 18 Feb 2026 04:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771388180; cv=pass; b=D4FE1AfUpMjJW9crvJYOGoPukCCmgdGB7pvspu5UI+HyhXmqi3yB4IHeX3ZY0wlu9SOk5UQP+oHiuXoWjj5ImUuCT4RX1+xsYaYVDjM6atslQWuRRG+xz0l/xNYt/y6LvA+6SVjUVxuKLMlo5LMSPKce2QbWSdpUnBEXAwpeGlw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771388180; c=relaxed/simple;
	bh=a1/UYzg9qprWQ9Xvw/thJ+toRAuQ11/lEa9Mzm8OiWo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lt7n8+vwzOM1Gah00At0FHIhgTd5yBp0bK5LL6GLOT24N/5bmg/7YCWA7XAm/1INfAd/AQKEngkAqWN4WDXUP8uQe29/yBXgFdoaVvGZcrj3OcEOBaNvWDHq/6myTIYqSSEVuL7siyJROgMlYN5juacNwODRpH1fnikxtJYv/r0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K4ZxHJza; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a7bced39cfso50454365ad.1
        for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 20:16:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771388178; cv=none;
        d=google.com; s=arc-20240605;
        b=AZrDywn5cswFEzCh6Plad8yvdHaVQdB+oP+ACzRQOv214s0q0pu7QyNlDQ99CeE33W
         y1BAE20eKzbRBy55NRtniSG/n8tG95jyC2Uq560MZ//kSKFzRdHDYF6+1yB8MbZy6AWa
         GWc3YoPAoZXRyVxPUdeLVTBFY8EoyCYbJhsXjHkb8wuDlyv1PA2fjRtXy9TYxRJJQoLR
         9UzC9Lppek53wnUl1gUe9kLn4oYdHa1vqILfOdBWcF1esMMvtT/ALErJr7eFoA8dzjCb
         ErbkGQppq/qIrEvpeuL2/uGVm/yS61rbCPe5PDBa9CZIx3Lm2tjailEEh83Lvn5mkg1W
         HplQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a1/UYzg9qprWQ9Xvw/thJ+toRAuQ11/lEa9Mzm8OiWo=;
        fh=J3fVQqvf1rU5+XDYAhL+Fajq/vurVsrboplsY/fMPDs=;
        b=SYN/jieMK+nBciIilCSb1N8+Uk1FkzRm8IJ7E0WjxtICPGw1CG/IWfOaXeobqsIxdZ
         HKBf3n2V/Wz13kVZmOLS5HmkzG6Y0jr1LyhcBQefa2wd7pEzk8WkGO1HLB0KwbyBUZ6G
         CcQcdI1VN6XqZ/tSPSHxjVd+fGFfNGcpdVpCYJVBNdd9FaxwZScEq8tx0D7+L1owwrNI
         2+9wp+/itb8hjgnKaqG0g74SKv7Hs6z6PCVVYGpQbqlT7aWhmJrzbFlWopGpSstnzznh
         ah1oNm9Oil/9Un+ah4UCEtZ6hZf89AQein0Zr8ZHRRMaTu7CioZCglPSjq3x0aQ33i8g
         MVtA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771388178; x=1771992978; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a1/UYzg9qprWQ9Xvw/thJ+toRAuQ11/lEa9Mzm8OiWo=;
        b=K4ZxHJza6uj18r4gSxwTTiAWQ9WPEjh3upXfbkubva+ihMzH8oeeuMK6tTGyPn0j5u
         RdUaegYm+o28QBNkiKSECmZezqh4ShmiAWTTtZ5GgDpeykM5H1nVIqFuuvkXhUEO2LdY
         rfb9fA5hVuTJg1voLSSo4BekfWhbOje/aOcnjnSJO1sXjwkq3DERO8nMZDFDMGHxT28D
         xZia/k+fhj3WlYWm6sDY6a7MyfJrLgLJ2AQ22qN+/tzhHBoyGqX4Am4YGv5LS3C4N+4l
         LOfuqNjiP3+wAnA39u7TS+0mXs5MAxDGHj2bVXHSg0L4QOACl7AUqOHbg109LVsQH6yy
         t2nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771388178; x=1771992978;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a1/UYzg9qprWQ9Xvw/thJ+toRAuQ11/lEa9Mzm8OiWo=;
        b=c8kOXNhBdjV/NMYuAPWuu2+EvXn/dKhflf1vsx3Z3TyPAI5Gy5ps14tmgziDfISRsJ
         XpGpJYZfPmUCSxcbc/ZFgE1i+5Yi1G1ndjEBBB1ZPpaWzeYK0B9gn9wMNeX4Q7aTyiI8
         yRUTF1FgKnvX5aG8UpwLrFXlsy1G4opDsR/f5YRKVNsPEWCJTlzqG4hrVkgZ9XKs6XAB
         174oFrumgsv0275PrNLJu8JkTfXKQlLCVxW8ZLssoe+Hi9XUBVA5htzkurR05yWuq0ea
         OhKrmC34Bi9RsoE8Qed3pOnSP4pGNGRbYRKYV0K/mjRKgjQ3S9UKYjKDCyN4omDKM66t
         UInA==
X-Forwarded-Encrypted: i=1; AJvYcCWPWpfVjclWYkP9NKGLJvDEIKv+6AJnL1DkAcy+2b+13payZknt/bUBxK2mvcXuDuhG4/wAW7N80rEcUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwebBzkzHnnHxC7SSi7XQtWgsVJcef9IjIkhtccqeF1s91Olo69
	AIl8cSOFV0CXeCenxLu/Cd65Fzp8bAT2cM06BRZJcij6lYWxU1vVL3G3V00P/Pm42yp33vVtuIp
	w/HO2LVZUkFvGdrQpoa4/ONPt/GMP/VM=
X-Gm-Gg: AZuq6aKUGbFJmEgsFd8vcyFBAKIqOL4WxctRmuEp7MjiveUvD5T/A5UX51wX+e1BlwT
	AR7T75GNwr1Gyj9Akf6hHVe59Q+QiW33Bs+qKVlV2D1keuUKalsah4o6Yq/WBuLHtyN4Ff5oSAi
	4KKG5TOI0QotAEzcvjrxJl98WAjzIeqY03bvcudxxfTIptXdafQmk6mg0uirNFq+et0t0/biRBf
	9WoVWXov5a9J/Za+1GkXahHcL+fldT8XnYQ2huuTb9Wza/lwcFJhE9kQlqEYgwLTEGvfd56bxa9
	57n69f9xdpLWxVkYSL8e8/wYVWs+W5m3VB+ELy0AC3U/jlyJjSqv
X-Received: by 2002:a17:903:3d10:b0:2a9:2a0b:4ef5 with SMTP id
 d9443c01a7336-2ad50e5a92dmr7916715ad.7.1771388178534; Tue, 17 Feb 2026
 20:16:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251120084926.18620-1-opensource206@gmail.com>
 <832f4621-53af-465a-a5e9-f7d65a082481@linuxfoundation.org>
 <CAKPKb8-qyqMmp6c9OnO+AapRRJyE8ygtQUyuUqK8+C0LvMTYTg@mail.gmail.com>
 <CAKPKb8-8ctSewOwBk7fFUMVnb-F_gXnyXS8gd9xJ-fpnW1_ZYA@mail.gmail.com>
 <b5240bd1-eee7-47fd-be70-88435519b12a@linuxfoundation.org>
 <CAKPKb8-VW3C8c-BmwLEWdLXZ8LVuH_MDMdVzzFs6O8QWmpDeuA@mail.gmail.com>
 <CAKPKb8_PGYUStAovWjWG8XxabjB5WuT7kQ3qxT3NuYSKihgDDA@mail.gmail.com>
 <754a344f-4759-4b94-aae5-41e1ce6b7e2f@linuxfoundation.org> <CAKPKb8-hd72r2-11xo6EaN33FfAZ7KFLt59kiwE8UCQKgW+z4Q@mail.gmail.com>
In-Reply-To: <CAKPKb8-hd72r2-11xo6EaN33FfAZ7KFLt59kiwE8UCQKgW+z4Q@mail.gmail.com>
From: opensource india <opensource206@gmail.com>
Date: Wed, 18 Feb 2026 09:46:05 +0530
X-Gm-Features: AaiRm53NNhCckCkDGiCSFmHdY_xsnAvTXxRGuATWH34hxrtd4JmZiZbRf85jjxM
Message-ID: <CAKPKb8-HZdpGzbnStwr6TvpPdFT=1J8mc=Bx1mtAcHBXiHhxtQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] media: vimc: add RGB/YUV input entity and improve
 pipeline support
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: kieran.bingham@ideasonboard.com, mchehab@kernel.org, 
	Hans Verkuil <hverkuil@xs4all.nl>, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-53027-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,xs4all.nl,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[opensource206@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B7C51152F17
X-Rspamd-Action: no action

On Thu, Jan 1, 2026 at 6:41=E2=80=AFAM opensource india <opensource206@gmai=
l.com> wrote:
>
> Hi Shuah
>
> On Thu, Jan 1, 2026 at 2:13=E2=80=AFAM Shuah Khan <skhan@linuxfoundation.=
org> wrote:
> >
> > On 12/29/25 09:04, opensource india wrote:
> > > Hi Shuah,
> > >
> > > On Tue, Dec 16, 2025 at 8:27=E2=80=AFAM opensource india
> > > <opensource206@gmail.com> wrote:
> > >>
> > >> On Tue, Dec 16, 2025 at 12:40=E2=80=AFAM Shuah Khan <skhan@linuxfoun=
dation.org> wrote:
> > >>
> > >>>>>
> > >>>>> Hi Kieran and Hans,
> > >>>>> can you please review?
> > >>>>
> > >>>> Hi team, can someone please review?
> > >>>
> > >>> I will send these up in my pull request to Mauro - it might be
> > >>> later in December of early January.
> > >>>
> > >>> thanks,
> > >>> -- Shuah
> > >>>
> > >>
> > >> Thank you so much Shuah
> > >
> > > able to pick my changes?
> >
> > I applied them to vimc branch a while back.
> >
> > https://web.git.kernel.org/pub/scm/linux/kernel/git/shuah/linux.git/log=
/?h=3Dvimc
> >
> > thanks,
> > -- Shuah
> >
>
> Thank you so much

Hi Shuah, is this patch series going to be part of the mainline kernel?

