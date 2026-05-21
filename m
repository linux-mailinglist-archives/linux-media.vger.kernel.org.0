Return-Path: <linux-media+bounces-62395-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YMwQE6ZYDmo4+AUAu9opvQ
	(envelope-from <linux-media+bounces-62395-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 02:58:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B3F59D743
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 02:58:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 58A803027325
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 00:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9703F2989B0;
	Thu, 21 May 2026 00:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fFrRlzyj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58C923D7F0
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 00:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779325090; cv=pass; b=mrC0YBsOvbvA4Y9WVAI/BAtI4sxgx6iA6OZwpFFTIVLFEleVk2m+L0G+bo/Ed3I18OMhB4axeyNWPk9YM622DSkUTpkAlN4XsOe+vGHlQapCSWofNH8P+TETqSxMrBZq8UVNqnThkK+p98h7SrBGR16MIAkfMJGCCjWol3Oc++I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779325090; c=relaxed/simple;
	bh=SEACvTuuwbQUF8OGAR6tpw9W/WW41KgT4ZOfm2fxvck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lXLeuxv5gmwQQkWLdpJdXLE5tUszpCQMuPDS/BO9O5FLWqnAlT8Y46V6n0UDV368FcmYWdHost8SlvVk4YyZHiggb4iwVicXTdWETltYAOxyacjrbJ3kF2oULeYJjZ7248emoQ7l/vE+WEptnd92DeBF7yxhfhGak+gIZ/oTle0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fFrRlzyj; arc=pass smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7bd65714dcaso52373977b3.3
        for <linux-media@vger.kernel.org>; Wed, 20 May 2026 17:58:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779325088; cv=none;
        d=google.com; s=arc-20240605;
        b=gx1Eu1RHbgElmkXVraIEYT9Ql4JntVHR9RbvwTiuT/zJDCoKPqJRA9AV9Il33XauUA
         f+zA3SOLXc5mVM58oXv3H6q12xn3Uycoc3xgsPeYTsSD9FDBB8q+0DgFdscSbgtz8HZf
         82mPbzeMyYtidbbNcFmg/BZRIaoKR5dLLKlzmKzoIPw+6Hk7gNGAXcSzUKLMzrrjISn4
         lOLH1JlBb2nqgtQvP+cqta4mGTS+F2Eas4PP7J/Om9q+KSPDzS6edFOeaNf8Sd4SVve9
         W49a7ew6oQstPfJmRnnpjPC7PJVkGaGDMBSfd40cAaFaTOLVl1UsYTT/LunoNQjGMljB
         7Vbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W5F4HpHZPdS7RM8VbkQ1+0+NF4PdjhH21V3y/145Cyk=;
        fh=qTP/RgPlqdFiIg3UDecqga3AuzsGPv+TyKMMCRA8OMk=;
        b=Z2JG3CnibcTLScBKlDAXD0mRMDAu9hGHZIeEtAMfjGCm77CfjugpcBdb5xrlEy9OIj
         qN0jr5lDMHanylDnGqfrN4Jj3Fwq7hKJDDQV6sLK1Gr/3FyZ6QkBF3HFv3bx2KPNHXJT
         uxtt8akyYjFwYEPuw4WOWVSXhkMA0So2oNG9XvXscegzBD9b8zCAB1FZ5U2mvPGnIBGJ
         VbMD+hNZwrMjAbwBNBwScvWM6htZaiHIbNs6lWEfI4uEa2Nnm0gYkws1yHhOY2fXd2Dn
         Vg70xTJ+jo0Xm70In/wXWm1GB/YCsiyCUyJjSxWpdFnT2cmyD8dhgnjiMyXdaNSsqhVC
         1oFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779325088; x=1779929888; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W5F4HpHZPdS7RM8VbkQ1+0+NF4PdjhH21V3y/145Cyk=;
        b=fFrRlzyj9PtiRSeU6b53aeOBsJ2UQYL1enhd9Cpyq4o/DbqjOueKWLrNWHIkED2ZTa
         VuKsO/gLmsAXApkx9O3fdSmSmi11Fj3630E57d0H2Ozy+LC75PAPPD8FF6sxCTFwyE6G
         CqMUxH8jNSTk5NM7tb6Pptwr0zXgfSU+CdwwlTsXDe6pSdC/oE8g/ebWtIXXxaHzqMYr
         EtkmwutUZYweVRuEiAMi9xCBxSsPoHF1sS8wc0/G0Sctxau3ic2XMuzqDYdHhz1eFf2K
         YUNc8vkldckR/2Y2l2G8LQ5jk1Nt1t0ifdY4bMXVY08frYFsnP5OUYWhJBxJ7DHZQ6bc
         IKeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779325088; x=1779929888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W5F4HpHZPdS7RM8VbkQ1+0+NF4PdjhH21V3y/145Cyk=;
        b=FDAfvIhWSH+7w1QPyuvSHpG7lQy3xJiPpqZDQscNq6/kAH2wWAlcdKQpfXBovqlgL6
         Mm8539+JZvAwCdZ3o+47mzFcmTOJRTHSEAu0EY4zA+u1RPPJx0I1QfcraXl51Hs/kzuO
         zFn/YK1+ifiJuLreOzozmGi8vnETwOVpDbMwD0dF4vsYkY2zJDv1cblg7kYReVItvcqG
         wv9bUG78h/nUnGr04BgZ61w7C4GnQydLauXTr0W7F02Qt1ndWYsNWJ/9nQrH06ir8ivM
         E8pvv6n5XuR9YXzaVoyirj3rUvdLUFgdT783N4xQy1qUa4mzyVxOnVXg2E1YEk2hjDkT
         e6Wg==
X-Forwarded-Encrypted: i=1; AFNElJ+yT47/sAWuNxas9/z3saO7py5IulaTpISauTu0tBCUsFDQ5DoPitG0jLuFTUZWr12bTkEZ2dQa/rDZwg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0eUI3wZaH4RaeCFDiCpjJTiLolUtqN3njTjzikWvthSfkWxH/
	p7uCXUnJjriUhJv6+/NWN3eAiLY8UX9Ykt7I8WTzQaAtIX33DxZtyLZuWm8rRG13yVM6+GOJsWK
	WkjL/KxyyU/kef80aMz3alpkaomDqosg=
X-Gm-Gg: Acq92OE/ngfnoLCCgx2V0a9a9x4Xle8YTqq95MSDDjBGjUkgvoAS7PzbrIlMjRZtTxS
	5zLbJ3/7QoDqpECrfDN3346tloQaJjIDl6WfeOK6QWVuI67ARD3b9XsgoVTHk3MDz1jMP94wzHf
	MGuJj/k1+JPOZwqz59W9YMygiYVM69P7kGAVxK/JqgoqwJciP0DnE3YsJYZwUogowqcq3P1p/vA
	oXuJi+C/hcJubeRpAldlFrxr4T0Ac94MPcEt0PALSijF/fn0AEI1n73STk79cjsCp+Wiz+UpVyP
	MuGpcrLUIOji7cbMcY+q4UtCoR+CA9f0A8tR
X-Received: by 2002:a05:690c:620e:b0:7b1:fa45:72e3 with SMTP id
 00721157ae682-7d20aa9cabdmr8852397b3.4.1779325087719; Wed, 20 May 2026
 17:58:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513181922.2075438-1-michael.bommarito@gmail.com> <67bd72ba-6dab-4bdb-a391-27545e287e94@collabora.com>
In-Reply-To: <67bd72ba-6dab-4bdb-a391-27545e287e94@collabora.com>
From: Michael Bommarito <michael.bommarito@gmail.com>
Date: Wed, 20 May 2026 20:57:56 -0400
X-Gm-Features: AVHnY4LiZldEGrXYzyoGnIuTwsQ0SpJxkVwOBE92FWCPOBOhNuOGZvffXZndLp4
Message-ID: <CAJJ9bXxR5U=33RSzB5uFEZv3ZL2JE=UjK7ZToxm0ewSqyu5GBw@mail.gmail.com>
Subject: Re: [PATCH] media: rkvdec: hevc: cap EXT SPS RPS control counts
 before descriptor assembly
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-62395-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michaelbommarito@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,collabora.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: B8B3F59D743
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 9:04=E2=80=AFAM Detlev Casanova
<detlev.casanova@collabora.com> wrote:
> Still, did you try just changing the cap to 64 (.cfg.dims =3D { 64 },) ?
> You'd need a test that sets the control from userspace though.
>
> It should refuse setting the control if there are more than 64 elements,
> therefore the hevc decoder will not run any function using the count
> values from the SPS (See  rkvdec-vdpu381-hevc.c:601)

Sure, I can test that and send a v2 for ST.  My understanding is that
we have four spots we need to check across the flow though:

1. ST count > 64
2. LT count > 32
3. num_negative_pics / num_positive_pics > 16
4. delta_idx_minus1 + 1 > i

So would you also want the same .cfg approach for the LT cap?

Thanks,
Mike

