Return-Path: <linux-media+bounces-57882-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MB+WGlYkzWlkaQYAu9opvQ
	(envelope-from <linux-media+bounces-57882-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 15:57:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E428537BB0E
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 15:57:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DB2E330FE681
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 13:42:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A364C425CFF;
	Wed,  1 Apr 2026 13:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RgXXSJ6N"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E5A3C7E12
	for <linux-media@vger.kernel.org>; Wed,  1 Apr 2026 13:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775050958; cv=pass; b=WB6cYdGufHxb4eq4h5Z5X+p9NS8Z3j0EAUKhI+vpGDZ0kjjiGdiXHGlMW6lUI1EQKKxlTy49V7gxp0VVm9i16MSW0IyQJPspzyPhE2PgUVSO2o+/xKT15QJSXDi6ebPw/gXja3xdlqvfmHcwwWWm/+YzhfGl1NCir0tyickNRwk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775050958; c=relaxed/simple;
	bh=ReTfp2BNb5+vhenEth+YeZzq4FqmmZGH7TQ3bS+terQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ipYkkSNF61ozLLnpZtxFG5Z99sI6d7UNbhO/8xvWDllELaLDRNUatQHWef0r+ikObzn2zzzgpMgKF4LmhHf8svPEuqvsK+3oltD0G2spcPINkdVZG+qqQbdRkKgYPhDzDsq+ycy9RnBk1h/tiY52k0nEssJHbM5fvq4/42mTdsU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RgXXSJ6N; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b932fe2e1a7so889155966b.1
        for <linux-media@vger.kernel.org>; Wed, 01 Apr 2026 06:42:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775050955; cv=none;
        d=google.com; s=arc-20240605;
        b=dRWdmMqPbDPPyg26AhOegYvt/wJZ624N0C13TOdBoaalEbXiLL3uselc+oAF0REEYT
         xhUKx6Et5jD/EoepEWuZQTlgkIejZViTIMsdBfkMqMaaxQF8Ypxd4oguP8t2r/oN5Lsx
         50SejxFDFJQHbzlf+g1dLckk7dKkWZPxgnbaxzfIKBuRwRS+B4dzG9svQnT5/5Yqelav
         VlVfSYhylk0WgmSsWrVR6/qbtbmA3ua9OQH7DSsV/YlKiP07ySO14qCzup2JFo/9+5wG
         0U/vDM6Mb2vpiMO+d7AK9hOKmuvagLS/AmnWxHtMn2arkRPNsJ5zE9eE2aqg6OyJx/fp
         oatQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rwB30YTwjUpF0yMyhBCPvLGvl3V17aK6OPJmntebyxU=;
        fh=8c/2dv+gdPfbHZ5kehfDS802vGq/dGCMyUfVtGDIBwE=;
        b=gJGQt+2X9aJV0pzHhl9xhcCVktW9HT1X5KwGQ8LeaH5FS3NffCuQdNFjLXWONymxmY
         5ptot7ZMjl6wSSdWmR1vndVPAOyHM+uaeehYHgI7MVIzYonTtsGaGOFrmBZJ/ubJcbbY
         LFr1M9hEWd393CZ4fYyi9DUOXk1AVueAnqI7Qm4/KGZIJilAqulLPx7fDwbtqf7wYlm7
         125ugCYMiAjWqHOlq4QwHvQ3kEbHLsPzXthQSJdSiDHgD3Y4F3g+ewC/0XIhoRTmw1Wd
         q83jJcX9ytD7Gy/BZ4WMlRpOidwx02zuUkDDO3N+LwPIKlM8f22nDNf44N40JB9+xeQG
         o1DQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775050955; x=1775655755; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rwB30YTwjUpF0yMyhBCPvLGvl3V17aK6OPJmntebyxU=;
        b=RgXXSJ6NMcvx5ErlHJ8oH25PyZKO8B+QelLXDe5VcQe0imgyymEBMg++ZmENZoz/12
         4EwWG5sbf3/0u8jXQHl5gethUV9P4uf89nICZC9jRdNsgcUyxx/w8QP59XpMtB+tLF8D
         W5m5O0ffwaZu5VonfbfQdhFb3fZZY/od8ptFuDub6PR7Ot8mDWbJYdZFtJ/KsIRyaoxs
         ANL6q0rzo74BwZrP4qA6mVfh2Ey0Z0L3dtq6SaCODcMf1k+WgAluUHPwQI1AtL44qcNo
         r6eWcEEVBuRJ8q6zJ9J/R2IgRaGgUfAwmZhsi6ccmFeqRX0yhgLi5qOs2iaTruAZH+yo
         vT+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775050955; x=1775655755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rwB30YTwjUpF0yMyhBCPvLGvl3V17aK6OPJmntebyxU=;
        b=N3CL2pFZdqNndk7qAfIbQjkSwtXlQwnavxb5rf7H7MFmi6x3BVSMSwGOvedcFjhgDA
         EOcnUJqgrtyH/xukkqnUAZ12f1z8tOctKCHo/EfxOUGl9gbUngWxNK3SrUEMJoB+oQRI
         TetS6gclFQXROwIEo+7eccEKzmmjYjd3LiJo6tFbAjFRJrf3y34a3WEThxXC5XwORh+4
         RUdEuDYLuC1Zn+p+X29oTOwh6jeTdD4GqNA3f0pJMHYzuexlJeDfZa9k6eF8Ey7J3NdW
         jZz4eafQ+FH/WeDE0cmkchMfMzpR2YOtV8D2VqiaXA7jGXSgKvBCniI9Yeegyi2kNTs6
         Irng==
X-Forwarded-Encrypted: i=1; AJvYcCXJgOugZn5JOjk16yAqF7vl7pHuu82BxA40HUCojR8hePoKewss/8DIMByoJ105LkoaOy4lqkRxASSgrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFTDuT33iuv4lRxuQf6VkRHeDDKUxrVZYq7civ4uYdcR6DZf8y
	QQxFqLYKF0uEq6faNz9onnJ1aidXHy+CGMZQrjEyNSbkggY6yhUKquDsAslPOeOWciz20PJxSHe
	qcEBRn3DoHZd2x3Kzp5eiL3oskrU+Zg4l4FSg
X-Gm-Gg: ATEYQzzkrAzkHnvopGSxO2O43RzUxivyxT8/jBWc+3LFPDZr+gpdSTl0wzVIt6CrA+z
	dfQj1a8z3h6s1H606mSF5CWHOGDkBKHDCgS+V9h8dISMZ7kFtEIC7J0i8yFKFe+qDzTv2PMjYGW
	lAzkYH1C7uYxXNH5bkB5r3W49FEXVPV/jP67FiNK64X8kSslBJQ8/ba2JNT6WuDlOCjNJ/pmCL2
	AMX3++HwXOizg3rVD/uHpmgg51qGsgwW7QQkhTHul2ZluRXLsknFwcaV4A9sMOHmEsfOiCWBH5B
	l83rx+CHGKjLKHBsocrHcDtvNVbGZN29pOwH1Nk6mJ5ZcOoLLhakgtppiwCU0DJD1hErqMpZXZE
	vOnuJ6ek=
X-Received: by 2002:a17:907:a0d3:b0:b97:1d24:bfd7 with SMTP id
 a640c23a62f3a-b9c1379d454mr281131666b.6.1775050954856; Wed, 01 Apr 2026
 06:42:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331211649.421777-1-azpijr@gmail.com>
In-Reply-To: <20260331211649.421777-1-azpijr@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 1 Apr 2026 16:41:58 +0300
X-Gm-Features: AQROBzAyQMFMW3zpRjh3z9JYTieFZIvJvEOK08Jx4jrfEiGt9fTQs40_G4qRCK8
Message-ID: <CAHp75VdBC_Rza3qvUnbUJpXSgjLWefN7UFu=xeJWNXGjm+Urhg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] staging: media: atomisp: clean up ISP
 configuration path
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Cc: linux-staging@lists.linux.dev, Andy Shevchenko <andy@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-57882-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: E428537BB0E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 1, 2026 at 12:17=E2=80=AFAM Jose A. Perez de Azpillaga
<azpijr@gmail.com> wrote:
>
> NOT TESTED, REVIEW CAREFULLY.
>
> This series cleans up technical debt in the ISP configuration path of
> the AtomISP driver.
>
> Resolves a long-standing FIXME by gating ref and TNR frame configuration
> behind the ISP feature flags that already govern their allocation,
> rather than unconditionally attempting to use frames that may not have
> been built into the pipeline, and removes a duplicate call that
> overwrites the same cached state with identical values.
>
> v2:
> - Replaced NULL checks with feature flag guards to address the root
>   cause rather than the symptom.
> - Updated subject line and commit message accordingly in patch 1/2.
> - Expanded commit message to explain why the duplicate call is safe to
>   remove in patch 2/2.
> - Updated subject line in patch 2/2.

Actually we don't need "staging:" in the Subject, it makes the lines
unnecessary longer. AtomISPv2 is a unique driver and I'm sure staging
or not we always identify it right. Also check `git log --no-merges
--oneline -- drivers/staging/media/atomisp/`, it shows the common way
of doing that.

--=20
With Best Regards,
Andy Shevchenko

