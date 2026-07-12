Return-Path: <linux-media+bounces-67407-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YbHDGyWWU2o4cAMAu9opvQ
	(envelope-from <linux-media+bounces-67407-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 15:27:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D96A9744CA5
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 15:27:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=googlemail.com header.s=20251104 header.b=IqYlPikd;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=gmail.com (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67407-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67407-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C13BB3026F08
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 13:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 471553ABD91;
	Sun, 12 Jul 2026 13:26:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07A31A6807
	for <linux-media@vger.kernel.org>; Sun, 12 Jul 2026 13:26:41 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783862802; cv=pass; b=F+G7Fg7Osao6DegDMqZCOX20Jx0B6f6rqiaY1v1cF/oQmzVEB77njnl9+WfXX86SSDV4N6opP5EGEyvYK9Jp9eVqbq6UuR+fNAFVzFtFXdyEM7H26bRV0R9eLejSDr8WKGc2BD2JQY+4p3+Y4cPUc4Dik+jsLYH+QV1cEQT84ms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783862802; c=relaxed/simple;
	bh=atG8XqSPZX3CxozOHpc22+hLJIPB/QF7jvdDAJ3IDBc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g8Cn4S562zFDfQuDrAjlYJawY8sgPvmoeDCSzi/3jylkBeH0lvNdvI5D2OdygffiqMJreVJQp1AIuBPVQrJhf/vNjSq+PFUkYnO/6s9gp94fAldExm5y+fX1apermHyyMG+e7OdUhl4kzQ7/qOMjzo1I0lTXgqkvk+pJq/6zOF0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=IqYlPikd; arc=pass smtp.client-ip=209.85.214.172
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ce7d2adef4so30910525ad.3
        for <linux-media@vger.kernel.org>; Sun, 12 Jul 2026 06:26:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783862801; cv=none;
        d=google.com; s=arc-20260327;
        b=TjbCKPPqf2UhgDvDG/RCVOckFtoatFHSRXS+TYsN053bt9DDEEwMGZDOMcmQ84emdd
         z5s5SL/Jdg8jlS/AXDV+iNXqe4B/2eBBJhiDU7Fq+cFvb79czVO4Y+m0DJJRLSqKixsI
         56PzswCtvae68Z/yPeSg8SkaluBaNc4j61dwo9EhphohCmen8VdPEaBOvDmWQ9wi3kH8
         MvLaC93ekPQFufkyNraToNSo1WxVkBy8jPcKkLbbzg3zEw3fRBRcDTaO7r9yyIhMH4kS
         F/FHPOAuNRSPxCL8ZB8vnQfMVGWQRK2gCIiPOPgPf9+ez4HP63tnW1BA7JezKBrYiv0k
         trRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=atG8XqSPZX3CxozOHpc22+hLJIPB/QF7jvdDAJ3IDBc=;
        fh=mBG6IdbLj7DVYnF9T1L+s5nLO3j0Cvuzg/Ar99kMLtI=;
        b=Vk4K4k8fDaI8gtJTS+hALuWDFsrcqotXiU6c5jz5vPWX4BuMi/wSFyV1Q4GpPN5tiN
         zpHiyo60W+O7N2AW2y7Cj7JQZ+Ez7bwzHgRnijb9Ck5BO8vOy6jEhacsvsD7kBTbyPx7
         AI6/por/nxSZlffxc+jTpLnDPgIOZiTRsbtOmdp+VGtWl82/zTs69ikAwTJ3qTeIIVWT
         XMhUaimXlOksG5GK3P22Vgeppm4LTP4+2HkInzIB07Vyz3cQhiPghf7qgOmOpH/JN3Po
         SvmuX1bb76PRuFWo4ZUgcpSprg/UgY1oqyKMPViwvtgVKzKH6IUGEK+xbT5um0hG24/D
         Ws6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1783862801; x=1784467601; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=atG8XqSPZX3CxozOHpc22+hLJIPB/QF7jvdDAJ3IDBc=;
        b=IqYlPikdPznLiL/uc6HyNAEVr03WVnz5J0Pp+nDRxQewiGcnA3m7cINuAiAWmIS9Qf
         s1TuNlqNnSBeysFNxtEYEmSsUlGsTu0Ciq1X8knHptySPGgJ8gA7KcAImcFF7fkhlFUR
         Fd+A1Bxzj16hJjT0qRajt1MzbiteefDhcZyue3w8Zvo6aufI8TLvxNWoqzHSVQVodUzY
         FPl5Iv68ir249u77XDY2uuzmFNMIRKuhg7D9kDnGNX+OZ/PBnkWqGKZNIg8gREy4bh59
         kp0m4XuAum87HukMSxaTwM4gaFtp9uHnfGNaifpFCdQEfOV2bJ6T0C7UErRIwHB9Ix8e
         B10Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783862801; x=1784467601;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=atG8XqSPZX3CxozOHpc22+hLJIPB/QF7jvdDAJ3IDBc=;
        b=XMKjN6nkrY9byNSdbmthihvFPS9X6tUmRPO4YPKWS+b2OFzu1DlmvX+X2bvSXwNmM0
         Qav+0xqHAkrrs3SO2J/HJ1lMIGAcXH9BrLrMJUQC8hXob2yPeGIPFPPbzABbrffyJFz4
         ms83YXQed5XABGE0F/musDp7pmStn1aEtRWf0eX8plLl4WftSl3CGNpZHLBrV6/bBTV+
         m3W24nZj49dLbZgEpSKT2LfhRoHqQIUm6aEMVhoQew7zIPeRIlzF4L+jfLkkN6FvSNSW
         0Mv/AKjenG/HH6kLc7xkHGPzhRu4Ub/QoflUsP7u0FAAmY7MJ8nKPPKdgkqNJqOZ2XjB
         EWHw==
X-Gm-Message-State: AOJu0Yx57a3H3pC3jg2l82kueBzZ5nJm676Vlsnd+B4LqXtF7atXPQva
	huYEzZtp1HZLIOJZm1johWPAm8h1/lXzGVtmKkyrLxvussWiIfUqUxKhCz6SHbpSy1KXocW0TBO
	XTuVdMVNjRSyY9pNy6S6PL5gFzYBzAlU=
X-Gm-Gg: AfdE7ck02dXhB6XD3dAlbjiQ7H3eVQfBOwmRVgCJHDwesaOJMqfDqZDB27sRAKhYpRP
	datlIWl3bdhRRi8td9MpvvnyuC9/ludX1v0OO1cwokAXyBXvZCaiV+nqw3xiztP1lkjHEIN9raB
	XWSCvS4+nQeeMhAimXwWy5hy1BAFnfr9+tj0ydeQPgHD5uXIgtOSGrQbrxYdhZ33y1x/A+tv6Wy
	H5qeZKoQ6kotG2eX8eE4SmTg3huCgB0ncxCdiPSlR+HtXKTvRSpvuOmeZgaCkTFbf1Y/sHc3GZL
	yR82gLBXZL1beFED9Nxyyy+v8n+f7A==
X-Received: by 2002:a17:903:2bcc:b0:2cc:77f3:a934 with SMTP id
 d9443c01a7336-2ce9f174650mr52007555ad.46.1783862800932; Sun, 12 Jul 2026
 06:26:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1783673420.git.sean@mess.org> <2d7772d678d1815276c2d409d68ae4f4673d09aa.1783673420.git.sean@mess.org>
In-Reply-To: <2d7772d678d1815276c2d409d68ae4f4673d09aa.1783673420.git.sean@mess.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 12 Jul 2026 15:26:30 +0200
X-Gm-Features: AUfX_myC7hx4fjS4-JwPMLgRui-DB58_FebfMXfpkFKB1CdDAdfGxwKF54CFOC4
Message-ID: <CAFBinCAPxkEfuY8orhd=R-6+2-uxWmEDJAaZmnKjJnzf_kQqUQ@mail.gmail.com>
Subject: Re: [PATCH 5/7] media: meson-ir-tx: Ensure clock is disabled on unbind
To: Sean Young <sean@mess.org>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Viktor Prutyanov <viktor.prutyanov@phystech.edu>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.06 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[googlemail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67407-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[martinblumenstingl@gmail.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sean@mess.org,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:viktor.prutyanov@phystech.edu,m:mchehab+huawei@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-amlogic@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[googlemail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[martinblumenstingl@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,huawei];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[googlemail.com]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D96A9744CA5

On Fri, Jul 10, 2026 at 10:53=E2=80=AFAM Sean Young <sean@mess.org> wrote:
>
> clk_prepare_enabled() needs a call to clk_disable_prepare() on
> driver unbind. Make it devm managed.
>
> Fixes: 49be1c78d575 ("media: rc: introduce Meson IR TX driver")
> Signed-off-by: Sean Young <sean@mess.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

The additional error that sashiko reported will need to be fixed too.
Let's do that in a separate patch though to keep things simple.

