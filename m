Return-Path: <linux-media+bounces-62852-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +EWdLiCmFmoOoAcAu9opvQ
	(envelope-from <linux-media+bounces-62852-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 10:06:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 195465E0D5F
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 10:06:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6EFBC300F50F
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 08:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D02E73CFF4A;
	Wed, 27 May 2026 08:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g1DMhng9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACE230FF21
	for <linux-media@vger.kernel.org>; Wed, 27 May 2026 08:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779869158; cv=pass; b=tcTifFLFzNKjlLQPjQSpXx71TKPFWPPYNyaFQQdd15CZEPRWJHipHoM2TdVzJAp1EJaOg2mlRpRXG2k4oAebPMvdX3JTHuTFrvzMk5auN/rV3KXWhm1uK2e51r7fDB7qANYViqvwlD7krRcSbMRwmrtwEmUYPO7UU6xfsJwnnSc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779869158; c=relaxed/simple;
	bh=3dgk+B0nXM6LhiLoCbn9rBDzg0eyUBTqpwuB4ry8O5g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YPLefD+odbmKNFA4CXjfrOT8FXNJ7wn/63Q/ryeRDnDDIHT/r5CYmVXArJ6XV6KmvOYgUpWdzfIewkj+cjoTYh8rXPhu9ZwEpebEWb5hXvpbVfec/qK/UN+VZzuJSR8mcIyZ+vCirYHj79mHr7fGOuILedCWDXF7LAhkiWDFDOY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g1DMhng9; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-bd8d0e4e341so1625991366b.0
        for <linux-media@vger.kernel.org>; Wed, 27 May 2026 01:05:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779869155; cv=none;
        d=google.com; s=arc-20240605;
        b=A595T6usmlX2Fzg7lJ58k4W0Vh2OXX4zFk5Ptgr2rqaPh5mRylFDu4BPlvvRxc38nU
         +mw0RpnD8uX/3rGl+/mVoz6aIzPiDZy+zZqQXK3VNXRtfWKStS/6NC+P9V7mztLeYFF3
         JFy5Pbb70YFZOQBuSYAzDCzvHpVtQvB22JFnN+eVN4+zIl+618Ay46vmt2G2gDDh9y2n
         NQq4W/3jvLAsOKX8+QW5qb6Cc+rCrh0R3f2VIUujdRLuubdv/vYmQb5c5QuqdFz3SmYj
         XoqXfD7hTXhqsOGk31p1xjmbDH7iEjhxCstCknnWQMWCJyykeWfljiNZxdPh3f7wYJwp
         RVxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3dgk+B0nXM6LhiLoCbn9rBDzg0eyUBTqpwuB4ry8O5g=;
        fh=xIOAOqIcKPgsyKofCVVKQvb+Oe7h58LK4bJwp9juQXQ=;
        b=d/0tNabwEgH1nv6KlWOj7SZCereBzqqg1wR9lYKibzcKaqESPfUp6NWIe1NuuGnxc9
         OmoT/4saBgWogbn+tQylz1UQrvEhUE50dA2UJ/fC8RQ0cCs+fzoAk6kjn5ujcLAPkTuU
         PQbbqleAFY8/jcOTNlUhLpNCRaau+tnucint10ph5SU21tkW5vr1XTClyL1pnnGIs5Xb
         yoJevwRMlRXwfX+PFDAEWHaE/4BlXqWieVYYBuwKsjmuTubEbiAePVGS3zDd1bBga8iv
         E06ovm+olhZkJWU4mS2HoR6xbZj0eeaUhBm8j/75j6KftYjq+lHao6hYVidZLJ6kbZbp
         H2ZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779869155; x=1780473955; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3dgk+B0nXM6LhiLoCbn9rBDzg0eyUBTqpwuB4ry8O5g=;
        b=g1DMhng9kLwEDSMCL1vrFKns95qKkeyI1tC8qPgzHj6we2IQhrilO17898v35Yvu5p
         UPLm33pqiBgxxzLZlOJaTliYfq2R4G9fM4ZQWYt101dGqaV5CMWlnpU5B8FSZuMe6w+q
         jLjQOZqcQWHsiS9TW2SfBgj95QTX9cDxdJIRjPeImeGD2uqlJin6zKbbhMKXQQ6P2q2a
         wtfJi/DOrVWNFX6xE6oMr/nhQk5CDlGE0BgQQXx8X50bWFZADlogXFUtVWalRSAyxZUg
         xwqJZuDyfrsbfTva5JP2a57igFFysteTyjsvIDuibjE8rwt6lA8SosrUgDO++xOiMHln
         FlDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779869155; x=1780473955;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3dgk+B0nXM6LhiLoCbn9rBDzg0eyUBTqpwuB4ry8O5g=;
        b=ekYzFEyW17kucOOYXxxKdUD9l+coJohPkpKs0fXSc3vYGRog6H8OA6+n/eQ3DqaqUP
         2rrWo+n/wDK3lmRV0/G20fHtWcG+GYb3U1kzi2XHiCN92YpSAl/7x6QRbWFO8O2LCZ8W
         blZ52Hyg4GtUGm+HOaSnaEIRx2qX0QMw8XXQiHQkdveEotmOpezyzHpbqqFOAs/bGReE
         iYNCQEEYGEcvCbHNhYWlWR2dyOocXCPMDG1wpTKE8j271kqCcSHttPB4AR/e1X+/woy6
         fjUIU7tO7IM0XQtZeNJnGLV/EnqlSa1ddrrzy2tjXd3RsiEjPMehFZFvSYPq5aZFK9Zj
         m/ew==
X-Forwarded-Encrypted: i=1; AFNElJ8NZzZRGU2utNS2R4lb3+MP5d+oXzZtdkDwbUoUWiTNE4hqV2o7yFsmSgSHO5WIgce3MZAZT2NKTZVV/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3I/0hgB+3ETfQF97m9VM8VrTW4v053tCtL+wv0MNBg/qSnwj4
	XQ5VB2nMYpGrbZF8g5oC39Woh7Uj78EL4IDU9334nuDv7yOEOEeTBJXUbIYnFN7DvmjWJr3k7ft
	EU98mV+cbiRkrMTfuzjH5XVkXQwR54Bw=
X-Gm-Gg: Acq92OEpmeathEbeVcsgkQmjJDNZg91019T8SbLlBhCIcgXCah1FjtGNT065tofKREB
	pQN02g0ik3KNYdgGf8L+uqFUIYUjC9M9oG38D//WPBAL+THI+k+YIG0ycRb6nwJEcffuyn1iPZK
	h1GAqWggeYY64MWDFDpKjUBDqQNxQqIS0zCivvBSRAJ+1uZQPAcKETJxFFCfc5kWMbu8ycb1mXf
	BrCZord9JbrViVDcDDfTnKcVD54YBtY/ezcNBfnwFS5AbCL3AeQ92+GoP+QkIvrBKh2SQXDtM/B
	UEaV1KinLn7hAUpXb9woJw9kvl0DfBldVTWSYlC7dtgG6v/sWEix+i/UUF2GRIP3SI0q4uUPdQ6
	XsBx2iPTFUE9RS2ORkVzApVitlVD/EqVawWdNgzOSRdrvIdiuzzFie8Jv4xlNMnMs1fLuXQ==
X-Received: by 2002:a17:906:3087:b0:bde:151:5a23 with SMTP id
 a640c23a62f3a-bde01609ebbmr950760266b.8.1779869154882; Wed, 27 May 2026
 01:05:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260527073705.1544479-1-jeongin.yeo@luaberry.com>
In-Reply-To: <20260527073705.1544479-1-jeongin.yeo@luaberry.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 27 May 2026 10:05:16 +0200
X-Gm-Features: AVHnY4KzohR6B6wtPxA5ioGjk6m7QUdg_GGGRRno4HqJkyhlupAYn71h8TE6io4
Message-ID: <CAHp75VcL4KK=K4ZhT+Qc8VWUBsdaPcjcHJX0WJu8cty_fpJsOg@mail.gmail.com>
Subject: Re: [PATCH v3] media: atomisp: remove redundant prefix from dev_dbg calls
To: Jeongin Yeo <jeongin.yeo@luaberry.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	sakari.ailus@linux.intel.com, andy@kernel.org, matt@mattwardle.net, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-62852-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,luaberry.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 195465E0D5F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 27, 2026 at 9:37=E2=80=AFAM Jeongin Yeo <jeongin.yeo@luaberry.c=
om> wrote:
>
> Remove the hardcoded function name and line number prefix from
> dev_dbg() output strings within ia_css_binary_find(). dev_dbg()
> can already emit the function name and line number via dynamic_debug's
> 'f' and 'l' flags, so embedding it in the format string is redundant.
>
> This resolves the EMBEDDED_FUNCTION_NAME checkpatch warnings without
> introducing __func__ to format strings.
>
> No functional changes.

LGTM,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

