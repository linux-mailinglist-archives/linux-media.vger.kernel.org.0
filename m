Return-Path: <linux-media+bounces-60114-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJ1YHoEz9Gk5/QEAu9opvQ
	(envelope-from <linux-media+bounces-60114-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 07:00:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1A64AA705
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 07:00:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 88C26301904D
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2026 05:00:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DD9F2D97BB;
	Fri,  1 May 2026 05:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LiEdR2e3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64771F0E29
	for <linux-media@vger.kernel.org>; Fri,  1 May 2026 05:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777611637; cv=pass; b=Uhlw5YFhHlFDsroz0ohnexZaRhy5OWAXot/palD4tVGhqyDjngzzVhsJXfVB3bVc+HMZ1AHJUb9M/xPYl4/gxBLf+M4sKViTt7r0RA5rZCsWnGXi/QcX4iS+bm49wb+eFwLWnObwz8BZqRl3ZdLk7e7gz5f7nNAphY1uH/j5D1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777611637; c=relaxed/simple;
	bh=SBauyVcTPX2Ataosw2rZRkBglocAQphV8+r815lWmR8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BCAHk8U7l4k6LZlMyEPFTKCThMRS8RIv/3fng4UsKvlbqTN5ZB4ACD8fY36xSo5oFb45VpJDTwYED8zK3mx2KnzJZ97vOLJZNchuVAZa1QogM5QlqI68cetZqcJuyyQDs+0eq4wfranvmP3HBI6NZ5ZgojOIikeCYshqt8b2frE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LiEdR2e3; arc=pass smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so16544575e9.2
        for <linux-media@vger.kernel.org>; Thu, 30 Apr 2026 22:00:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777611634; cv=none;
        d=google.com; s=arc-20240605;
        b=eb+k8Ypa8zmsmXMUZX4rob2zCn1fsXaGV08kLdzrCDoHcFSdw3iJu3/rcbYgxBN3oL
         Uif86rlFAPTVqfdKVc1oqkzvX6v1BNaw9Ec33sizaMMNmMBuFMBTkVvjfV4pJoUfz7w1
         dhdhhfflJZ8ePQVzdQ30vvo2Y45dWfrOxJ9WjeaGFKFG8GgutlcZ3iQkkNJakchfByAP
         yBtH2lHV7GSsrduZbKwh7cpE7xWL2brgyc1P01XZaIVPMsmteBw00Gs0mBp1priVkqmQ
         lkr3JYjThYnDYBKDdTifdIGokroNPqR1DlGVUA/wlds66uiinTkY2rI9RLyu//ZXEoIn
         Ku9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u4fQWvYslfT7zG5J1AHK+cbagfvgWh5WDnFa7R4/FpE=;
        fh=9RZOaEOdtOXxQDXZPg2sESLNfEihr3pRz057PC1yc+U=;
        b=PvVA/jYqME27PIDwy/0l975LbHN/6IHUIzi3jvo9B9wlVNYjQ4Y2Fm6xGBJToQ8Jy4
         VUKw9SMAasOvE63mqsUXKrKZBYWG5pMtCcP7fPiSfEin95EdSZmew+JNDiL2iFkrEC/l
         9NxiS55cF/yx/hBvSjOHjAWZA8lJQEn7IGMf1aAxIxc2lZAdrbQQs97POnDlyYM4TP1s
         0tc9GTJ/L1mwlJBnijZwvr95bQ67E75WAwI876tlV8LkyPIOb+Xxn1BUO4bVaXHrqTgG
         rJJ+tnN4U/8J6iEl9A9MN3fwofejkeDA4+r2AYq/H2cm1VhRzVp7SvVOADDniih9cPp1
         7vgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777611634; x=1778216434; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u4fQWvYslfT7zG5J1AHK+cbagfvgWh5WDnFa7R4/FpE=;
        b=LiEdR2e3ds2xAwAt8smNmGpxkyonV63yfyLBw2yNm4kCvCdCpvzXwNeUyWDcn3mpGq
         1mO6AhhniZZs1+q7gc4OQbDcJuYUFKmYqAUglrQZT8v/dbGG/CIYebeJbdGWvwgW5noC
         zoJSQWJY7Wb7Mm5CDDIjX5Nq6ESTUoo5xpqXQZ+QTFcXDOiQENwqgIwncJcHGWRFN0Sg
         Rq1IGKNILeBUbE3T3an00IgKqD0iEy5bRDLDvN4hGQFqkTck7sN1bCoVppveSF0+SXNA
         fHsJ6lpVxSfHIK1ujL5bTuW44WlzI8tHsYHCaVMEMCaJgDI7m0ohuoDP9ExtuTQwDPyw
         D7YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777611634; x=1778216434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u4fQWvYslfT7zG5J1AHK+cbagfvgWh5WDnFa7R4/FpE=;
        b=eU5Sx/ChBWv/Nhbl5ndIIMDQvq3Oz3sqMxq5PWE8ELoOMio+DA/rmqGxIr0/1TK7yx
         C5CUZq10WZcfibmO870UxJl1WuvDPHZG+O9aT/HQIhu5PUouNehT5ch9gWFoCLf1aFzm
         pmkTOlPQyTw3GtYPBaGQsJFMmIRV0JcW8XyVQviJg4gSB6PMCE+jFB8obo9EK66FWgzx
         BiQ9xsuJCHLJj1FB4rI1I/+X3wg3fqoE3sbelt4dMDwztZVp1ChsvWm9znOHJYKeq3DX
         8CcApk08goLhHKBRPrhZBCo9imlK5oLzmezrNKaqeYp+x2TmK4TUsyoZybbj1pJHZfUB
         jgIw==
X-Forwarded-Encrypted: i=1; AFNElJ8iHFO3hZMwvrh2Bnjw8daEbAXlBTZligRiTlZ3eNj9HeCkLdHNn2NC5ZArBLgZdgwhm2gBAS6HSVMO9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJOGtOpLGa4TpmLS9xKJfnOgYzq9Hj9TntKQ82f3WpQhPC5XBy
	Qo/NTICH41XQY0Umyfthdoi+dWnJkdbNkIP/Fl0/qjG4Ez8IZDwFO8dfmFNkt3RGk5kh9X61Z1o
	L4oTQoFYyo5RMc1f8bh+wBeZC6fLgZjg=
X-Gm-Gg: AeBDiev3EjliQhHrfyKUwlePgyihRat2r7wrh+CgjFBufRnBQM1mr9FrwX5ILi38XTS
	B2BR4SZJ3FDZB2pSyWIzDwlUigW56V3yzT5OxbIseQs2P4bzRQMxTFGZ0mTH4ZLVtQ32z0DnG8X
	KGpG+fGlCqwg+Y86+MVZDr9gGDjw8zLfSGBotqajh+7qddv59J2B6YTowJx3IqFKeEoEWB1I38P
	2clDdXlLpUutX76LBG3WBluBErXMMDU8ZOrOMAoTZ8k7L3+zlXrxlvB0t8v1N1bvbGteoSIOsjq
	ViIa28v59s0YSfMBF6E=
X-Received: by 2002:a05:600c:a010:b0:488:7ff6:1f75 with SMTP id
 5b1f17b1804b1-48a8eb98882mr22166985e9.21.1777611633905; Thu, 30 Apr 2026
 22:00:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428113923.112920-1-clamor95@gmail.com> <20260428113923.112920-2-clamor95@gmail.com>
 <afO-nOr2JUfm2dUA@kekkonen.localdomain>
In-Reply-To: <afO-nOr2JUfm2dUA@kekkonen.localdomain>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 1 May 2026 08:00:22 +0300
X-Gm-Features: AVHnY4JLhHPzj6DGjsiLYEr3D-nEAFcsblb5hzuuwo4dyelOT22nmoL5seKrUFw
Message-ID: <CAPVz0n178FSdKfyEzbij+dvHTv8C4KENbOvyt3-A4a=mJxsYig@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] dt-bindings: leds: Document TI LM3560 Synchronous
 Boost Flash Driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: CB1A64AA705
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-60114-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]

=D1=87=D1=82, 30 =D0=BA=D0=B2=D1=96=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 23:4=
2 Sakari Ailus <sakari.ailus@linux.intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyatoslav,
>
> On Tue, Apr 28, 2026 at 02:39:18PM +0300, Svyatoslav Ryhel wrote:
> > +  flash-max-timeout-us:
> > +    minimum: 32000
> > +    maximum: 1024000
> > +    default: 32000
> > +
> > +  ti,peak-current-microamp:
> > +    description:
> > +      The LM3560 features 4 selectable current limits 1.6A, 2.3A, 3A, =
and 3.6A.
> > +      When the current limit is reached, the LM3560 stops switching fo=
r the
> > +      remainder of the switching cycle.
> > +    enum: [1600000, 2300000, 3000000, 3600000]
> > +    default: 1600000
>
> I missed earlier these limits are of course incorrect for lm3559. These
> would need to be changed for the lm3559, too. I'd just drop that compatib=
le
> for now.
>
> I can do that while applying the patches if you're fine with that.
>

I appreciate your efforts, but removing this property will lock both
lm3559 and lm3560 in the lowest current which may cause malfunction
when driving more powerful dual LED configuration.

I will address lm3559 handling in the driver and I will send v5 as
soon as it is ready and tested (since I don't have lm3559 I will test
on lm3560 but they will have same mechanism just different values so
it should be enough). Will this be acceptable for you?

> --
> Regards,
>
> Sakari Ailus

