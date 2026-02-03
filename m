Return-Path: <linux-media+bounces-52080-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHM3LmitgWn0IQMAu9opvQ
	(envelope-from <linux-media+bounces-52080-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 09:10:16 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 356F9D6077
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 09:10:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B0287302D0EC
	for <lists+linux-media@lfdr.de>; Tue,  3 Feb 2026 08:10:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7704B392C57;
	Tue,  3 Feb 2026 08:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rljszv7W"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7430B392C4D
	for <linux-media@vger.kernel.org>; Tue,  3 Feb 2026 08:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770106210; cv=pass; b=sOER+5WijisyBiukb6nFJniTJEdKE4rlv/1JusfarEDM17w4DAPhFSoZzKu8Oa3VS+n+tTojzW98Y6+9DyI3M7gkhol4I02VVf+WrpcW3Ba0wQeWmSWUtgIHgUKN28kw5ID60EEJHLJ9XH92R6nhShurP2KAOm1Kh3VHadmq0Xs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770106210; c=relaxed/simple;
	bh=C9oP7tPg9I44enh/U345pZTUlbCHj6gHPrMjsAmLrs0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jPmvcrT5/JR7W1vSDy6D3ZMMnyJwoE0p4jMhbCSU0F63VPWHIPbd2bx9UlUH/8xwbUS2ZR1c0rKLgGKkq3IA2QHsdYgIlxyxRYFa5bq5tV0X6AzcM9M/2I4GNlztpUG/PCd93CaeITQOMCmxBmzxONB6wJBNkuMX6BEHfpE2Jb8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rljszv7W; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6505d141d02so7174344a12.3
        for <linux-media@vger.kernel.org>; Tue, 03 Feb 2026 00:10:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770106208; cv=none;
        d=google.com; s=arc-20240605;
        b=kSgs/Zj5yXQib5iGWrBH3BMCG/DFJdRX9eXzIHjuwJZJcgovVZQWZ2vRnaE2+6lNPE
         5HpunHbxZnHgmJnzZfvbop/E5FxtngPnMyFl22IaqHaIkaIgOMvrFfcawCEXdJ2IRxcR
         8MwXQ5QJpmk5ovqzNcK8ESJxBjE7116hZe8DL+SEJi5SbaDnIiTlBCklFqsyXhurzEEp
         +qS72SPzsVs3QhZxL3TuDoLTeymRpXiHvHiWaZmig12qHS4Ou6clUldJrgNPFM2CnYKW
         5EJh/bllZuNzH30nRxZ7MbCmAFosgHOgcmOeS/64LJwUBajl40GzRhybrXWFWRH3RTnK
         uZmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C9oP7tPg9I44enh/U345pZTUlbCHj6gHPrMjsAmLrs0=;
        fh=VAzONZOhrOpNxRYCrHXWz2dKWrZ2m5m0MpOXst5MRx8=;
        b=GgAshAqq/fvpPH7gdz4R85pmhqs95d+rQnD6QbK7QjlebT9sxuol8F18dB5XMJT1aY
         9li6aQ9fxt73N+AFvv0XRSpOMoAktUzPCsSvc5jU2cEOXtTAfnrPIdKM2kmGwcH7Udtn
         agDIlHGoyUG9J/89s2TXVpOLN5m/i6k7vEu2Bj9pjlLclJbPVhrOsZzQLUB6QZAA9saL
         3OYgWWN6vSKp0ZjDmkc6J8HHyV9fpJfZDDDVD9H1rQuonWZXpYzQfFGKSFTcJrQvz9yA
         nwhB3xHLxwM6jj2HauyHKHasuclM1k+Nh2qb6WiPQaehPsanMhNZoHRQCIIh12mtXZro
         eCsA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770106208; x=1770711008; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C9oP7tPg9I44enh/U345pZTUlbCHj6gHPrMjsAmLrs0=;
        b=Rljszv7WO+vgRpZ6AO9e3Zh+g6DeSGCqwFeH+7xfQGl7a5P1Ox6PrUfy/8sRC0orLa
         OGslmVLtDV3y6ccSlgEfyO7+dh5c/NzdMRTHdeWx0OKVrkcb3D5AocogQzO2Hb7lpTeE
         OxVXjXYsPPv1ecx+Qs/Dk26J43mcpAidCVwIeKz+rK3hB+AFxd/Bkdhf/9WvGclsVKdI
         Vp7zhCiABk6ICnUDk7Lb6W3XPQFQwXAsbRl7AQXr5ZOEQI11UDS2UnIlXoFuu7ZBVgfk
         BpIWQMY4cjzW3C9jv9U+LttvFnU1k5jKjPkLwGdHnR5of1jTyrC3+MPz8S1wdy75S6k2
         MgYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770106208; x=1770711008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C9oP7tPg9I44enh/U345pZTUlbCHj6gHPrMjsAmLrs0=;
        b=uHF5L+wOVX8MnQI6xZ8jP0W8/1NWGyhw1R4QK1qRpAjHDvNZbLuzHQhvbOuOFwHJm6
         txQcDlesjFGRGfmRlPOJNBLSbVzWEJMnK8B1+MUd1G8eNO9agNsXuBrBjy/mn7QIgjCY
         FEk1jwkf9NQs4cmvj85eJFMTDodrA+0fqkezbkEkmlm7R5xE7cLwK0KPZGomaZXKEP+W
         4ng4lo34h7DgXEcigJycllYEmx8lqPV9sEePb3tHzA+z9YQ8Zj1nQI1dQeIwnKjbd5xH
         naBMMX8APWYKIQiPSViSe6+A08byBv2dxplrWuvWwblGHrBLhSeNnywQAdYkBFEXauTp
         2YKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFOeuZyTP/LN4NfnFoMvxPPN7eU57SePvoCnbn6T7HZdxXt+XNw0A80tdtaBSaPqPo/o272Y7mlSgBeg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmCdp8qyBXUALGmXbIzz1XwEsfIiBBUoHIx5J702w0wOyJENpn
	xQkwDn/ciROZ1zvuhhfSJk0S4nLa/PkHg+snHNe7schBsnGW07QIbnvQdr+t81znZNncp7VdyIc
	e9W7+jULyYi036yby4GxGmmqSMG1BRDo=
X-Gm-Gg: AZuq6aKUsWb34BC2fdPyD1aeDhuFdkPEa9SPl3BnNbirJWU3Buizf+Vr6HAXvvk+lWK
	9Hv7VVQ6i7glLsuVJ6++TRW/inKfPom4XzAR38s4gGdRE/e3kdIyZM6JWBh5fOS0C9iUf2o3hj/
	SzDXk/BqbynocGAgPfsWwx+uUdiWCwK219xpwV2mfPvg8nEI1vIVn8LUiwlZBqbPizl4dJke16L
	1H4+P9vX2yU/LmfTIscGreYYwmUC7gMgko0Tc9MyalZXcZ81eC/2taODIVlY2mr6oPj7GGV8do7
	KuQfcIAInTpwBkDRdQqWzBWdt4TcLD8+WGDItYn3SKr8eXZD09pvm1RA4Ubbxr0S0qHmYh8=
X-Received: by 2002:a17:907:3e1a:b0:b87:7485:b4a8 with SMTP id
 a640c23a62f3a-b8dff23aab3mr875762966b.0.1770106207428; Tue, 03 Feb 2026
 00:10:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260201142415.83595-1-adarshdas950@gmail.com>
In-Reply-To: <20260201142415.83595-1-adarshdas950@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 3 Feb 2026 10:09:30 +0200
X-Gm-Features: AZwV_Qi7KIuPVGFKEQFffVN80tTc7L4AIU-pda6qyT2vJMRAJByFXlXjPX44igc
Message-ID: <CAHp75VcP+h0U8+zBsbaZJN=K7kH_Rqszm8MiBm+NNkzVDMfvsQ@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: remove functions doing ftrace
 like logging
To: Adarsh Das <adarshdas950@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52080-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 356F9D6077
X-Rspamd-Action: no action

On Sun, Feb 1, 2026 at 4:24=E2=80=AFPM Adarsh Das <adarshdas950@gmail.com> =
wrote:
>
> Remove ia_css_debug_dtrace() calls which only log function entry.
> ftrace should be used instead.

LGTM,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

