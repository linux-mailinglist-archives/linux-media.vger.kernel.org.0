Return-Path: <linux-media+bounces-55456-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +M07AzchsmnlIwAAu9opvQ
	(envelope-from <linux-media+bounces-55456-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 03:13:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A2D26C1D6
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 03:13:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 657DB30CA54F
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 02:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68E4637700E;
	Thu, 12 Mar 2026 02:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W31zH1LU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C750835DA46
	for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 02:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773281536; cv=none; b=lyuN8lx6QPqQFgUfg4AllgmO4JP0axgvgTjvg/u47iEogwXQ7iAi6PYznWUC6Q10IdCZmNcJzH7P7IoNmRI42zsMLB0s1Kt1kNfYR0S0eRBr8Eku6jy3zZ5k+2iQ/RmiFbmE0ljJyZunCa78zbd4fZERyXdYVQtjSNa/PsiR3Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773281536; c=relaxed/simple;
	bh=gxNe5r/AaCxDltqhKTSFZAJQ56T6YCn5nOYQ1U14IZg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=PIueX4TFh8ZK6YV8dM/V/MNZaxDdzmnTQEWGpByJqmBw3GuWMLDYpSD3cahh3iJZIYXac0ggiX61oIjjpYMy7bnzwh6EccrkVPhY/FzXYpoB2kxM9NzO9dD6i399TkgG5AEwkDGuR561+K/vPO9htM9zEBhkZ/6zRoncfhUe8u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W31zH1LU; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-797ab169454so5253647b3.3
        for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 19:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773281535; x=1773886335; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gxNe5r/AaCxDltqhKTSFZAJQ56T6YCn5nOYQ1U14IZg=;
        b=W31zH1LUYPFNhUmUi7a9T2uoHuU2DL/G/vY2M7E1u5lPdy4+68B6A4MtXRhgbdMOCV
         tyXMxy3XTpJSA6XOy/d/K2H2HKr1SsgNq7f0Q2wa2o6JLUGIUgKCVhgAeCiIWxWj0NAh
         dn8e/A2dmBTxK6fFDVYxmL1GDPBN776UDWi10tt8Qm3rhfb8XjlJj20q0BjgS6QorPVI
         TSCzWLiX9QCmenlfAkgFG/K0hYR539fXJpZA+UA72cTDX441OoBZKNOcbCh+uZW4kTxr
         hi32ISGtX6Cre0XX79cpxlOVaThMWma6EIxcEo81oak18tARqT+oupgpr4jqlvea6xH8
         o50w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773281535; x=1773886335;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gxNe5r/AaCxDltqhKTSFZAJQ56T6YCn5nOYQ1U14IZg=;
        b=ixKBEqbM6C0cDgOZRZ9+f0ptPojEVBSldiT/qmJGwgKb8R2uPK/fZGdpahfAeW9GNV
         5Q88naesVOIZXxF0EToOJE4EzWZS/HoMrpLjvsMd/iLOenaE030sNzU+c42FU1fvO+77
         TgszfOLcz5CwWFMeQsBpwMjE/pCwdBdX1xp/qI7cpZOF3WqZVvOEA9i2/IewM0v9SnI/
         aB3VmAMedH+2KkHmzaLMyErpbm/HBsJArIiHo9aLDkk1Vwlm4C3ECVdOm7s/jWgsSZ1A
         zc/JURK7zuFGzMG78Ljr7vIG8Zr/NaPX0GXfr9yb4p7IVb9PRcvMUXOVKGuIniDsE/qT
         AzLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDfiAmzmnnBkDnTwu55QkkCJ6YIo8Dy0A0DpFxF3dp/KTNeVMvE6+BtyLtp0v1tCiJLjA+rpOq/8UoSw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt56ORNZ6CeMkUJ2qvTZ3BYscVDvlKQvWwGDosEaB/YbXMILbQ
	Gcx29dLZDopTUvdR+itL0OfaOUvNMgqCQjLucEkUb5KxOKRCdXmCg/7+
X-Gm-Gg: ATEYQzwvX/7LpbZm9rLxA06PEhXlN8Ozv2Lk+GzZBa0F6z9glGx8RL1GroNIYrrMns+
	g4Xg7yvzGtFkhcMFdimcu18+sv1GOYQhZrznvaRVTRQNk/okroA6Q+iEMYEx9zvvoLwW+ghyQeo
	3+hMpQuBh9S5DRNBAtknWij0KE/5YfX/Oi4Sr7uphWGooQaBdQtVxOvhBn5GMovXy5LW6OOJsML
	E4U0CAiGGuf5X6joWKlJLZsCs0zC44g8hzcCTgEYmI628jPweHognaRnzMbGdy5g2qU/u5Glqft
	H6LT4kkmdXyrTt8xh7Y5uM/hB3KzN1hcufOiHmfBLIefW6HeKMOqNFSl6ARf2Oy8/jNPvTTZuOC
	zxzD73l3AkvoB0HcAv5dWAqyrXs+85W1vssufKrP667Lms5fMmr/BnInfpJr8sQSMH2kS4mSPfs
	5PEKW8ltcYbnVBQthmTCqfR6OwYihKVRB5ix/itRj6JUknaIjNl82KZhun9vep1mX+d34NylW40
	hbqtAl68I3GBWpnrFtr45kAgk+1B/s2nV4fvYUOMCchNUu8P3RSGBH+QcNP1NNcmWw887ugYhY=
X-Received: by 2002:a05:690c:660a:b0:794:e839:ad75 with SMTP id 00721157ae682-79917f90fb5mr45352207b3.42.1773281534717;
        Wed, 11 Mar 2026 19:12:14 -0700 (PDT)
Received: from localhost ([2600:1005:b11d:678c:3de7:a5af:fa81:a42f])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7991edd6facsm13077917b3.23.2026.03.11.19.12.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 19:12:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Mar 2026 21:12:12 -0500
Message-Id: <DH0FU9NX3QNS.2L2CYBXPGLZLW@gmail.com>
Cc: <sakari.ailus@linux.intel.com>, <andy@kernel.org>,
 <gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] staging: media: atomisp: remove unnecessary braces
 in single statement blocks
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Oskar Ray-Frayssinet" <rayfraytech@gmail.com>, <hansg@kernel.org>,
 <mchehab@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260310203646.8869-1-rayfraytech@gmail.com>
 <20260311170423.13157-1-rayfraytech@gmail.com>
In-Reply-To: <20260311170423.13157-1-rayfraytech@gmail.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55456-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ethantidmore06@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 64A2D26C1D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed Mar 11, 2026 at 12:04 PM CDT, Oskar Ray-Frayssinet wrote:
> Remove unnecessary braces around single statement blocks throughout
> the atomisp driver to comply with kernel coding style.
>
> Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
> ---

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET

