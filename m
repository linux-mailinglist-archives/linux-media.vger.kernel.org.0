Return-Path: <linux-media+bounces-55423-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIXWE7yJsWnkDAAAu9opvQ
	(envelope-from <linux-media+bounces-55423-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 16:26:52 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AFADF26678E
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 16:26:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 77E8D30BBF9C
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 15:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 688723DFC90;
	Wed, 11 Mar 2026 15:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z/hU3zA5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519A73DF011
	for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 15:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773242555; cv=pass; b=Jm8j5gjM5tmdZ4acPg7liJdyBYj2Ny4Tt++z7fvPv0syEjtxFeJSG+qKBCW7B8+o46bm6/KNCoJ/jPl5MyK2pmHo24OGexR+dTi+ZtF82bnSrb2CIaS5e8UIrzP4KtKfNJ8UZ87DfIUw7ksTljB+YiA7wjqDdw1mCarYaXuu2s4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773242555; c=relaxed/simple;
	bh=S/yZmnEYCd+WqMtgN9VNEc8yu6Z0hzm+57ud2v4UhzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c569d7A2TAMifk0puINpVPyeINlBHOsHw70m6imgk6hDkyWW5UYnCZOJZxk9HRexfqH+ctAC6x6FPWqlhoZDU45/I2ZF2D/4aFdBMoydST54OXmbxdtXn+Xq/y3mN4624dMhxU2TP2gVLgNhBMYTvm6FbugiIMMl9rGrkyEkehU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z/hU3zA5; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439ac15f35fso7596f8f.0
        for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 08:22:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773242553; cv=none;
        d=google.com; s=arc-20240605;
        b=XSvoBKVQ6rnO1b2tpBp1FEZn3jMgyQ/ZeHrdJfkaHuK2oRuZlo8gm6hZxOXrQVjOOH
         9iTyIQ31dZPIbJ+4UrJa+ywS6RVg41T5RO++5bD7yIZO4XPR4UIG8y8V1cpTF4KcSx9g
         51Atd5w4uKnKlGuvJdWjFidKQZm9NhhvBZhmcpl4upLJSVVpZj+M83zAQq6iT1sf5iYE
         QJz7D9JfVoR/Wog57zwsi0S3UQTAUSZCw9ml4JzgB0NeWAGkXQdLCgTP4a1aS5kngo1g
         a00HzWk94o5sYYgZlYmxJv5comsZ5t+BGJzjFcIAXLBb7oJ7fomQXXO7hr7oUWPh6Ivm
         /rog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S/yZmnEYCd+WqMtgN9VNEc8yu6Z0hzm+57ud2v4UhzE=;
        fh=EAH0IvVg5i+b+psuC3uXxnyLpFAOpbrVo7DvFU0mxas=;
        b=Fc/pMT53eO+B+Cu+aViXqfuJFBibf0lQCJRnx7I5prike28UXWUaGQ/aQNyRAcTQFz
         PNuvQcumdECrBhnQyOGVfl51ydMV6yqOlLPc+4s44gXVNUShVum+9MEXOr29NJ6tEhRl
         Vv2223dDAYVmUtsQVmfarAM718gSivjgvnM3AMED7WDgnw6btazP1wcp7BfRcNv7BOzA
         k39/QNw1+E9NkFcUM3LAvIJrHxaByRLupwA99j+jFZDPXvGIODBMHOCp6jZeb5WWKCr9
         i+N26+2K1SGbPS1gq0QddxWlV6U2gNLc2j+g01vC3xD4EAdhagnynfP1lSQ/U9ZCgc0l
         d4EQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773242553; x=1773847353; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S/yZmnEYCd+WqMtgN9VNEc8yu6Z0hzm+57ud2v4UhzE=;
        b=Z/hU3zA5AYOe1K3KejFeZ/wbUx20PZ6wDR1fZy7VrofcjNM1RWhKx/aAw7FW7kyqeC
         ECowd/BHuK2qEETh8PFLLJFXS4N9JEE5o3xxCelUZLdaJ88/PCglPj3seccCyGa75OSZ
         CWBSH2aADfau/LVJpuVW7OdAhydDJR5FJC/sx7Md6PCLH1mFT83pkNeTa/ui2igERTnA
         pI7ivYy5vtJrGfSEiFzMahTowc6D1jN6k+pXoenafKWQPNd2oHtp38pt1zDW1ubcUxX/
         3QNVs9tcG/5F0K3SPB1B0bJL4u2jcCm6O6PsL+shBIQ3a8Zdqd8Gc3sP5rggU93olKJ7
         TL/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773242553; x=1773847353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S/yZmnEYCd+WqMtgN9VNEc8yu6Z0hzm+57ud2v4UhzE=;
        b=su/O0Z4aFgZVHBo1LUGNXuK04LRopcdkiv49gWitUIaBEoj68Kue2Fq4VoFws9LTfw
         /IJZK6dgVSDhiN6BQO0TLwqUegHrouVxQa/k4YNgwVlDCL5dk1wLlHgFc/OC2vulHtOO
         etOKmGev4rh8VsvCWv371wSaerrLm9kbQmnvRDX2/RWc/XZWbPC/mXK8ekn2tpa6oBX5
         tdAQWK99gepuaOULc6EkvH2hCKmqS88zPriHLtmzNixvUlOiuQVqzqaVbGyQTdVe18r1
         D5NmROr2/gcvbEN1in1ekT+C9i6ttg9+vV68GmG+kUld/4CRsO8goEI706M3zCQQLjiv
         l27w==
X-Forwarded-Encrypted: i=1; AJvYcCUS7UaHvRC2ZinJGIrmYqvtkMiqswAcF0IDrca4AdnVbdtpJ+vzBMGLBK6akB4UWWQu9QTEMB/K2C7eOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YztCUdML7j4LhFTWEqVCQd3ez9/Rey4Yk01dSINlIjSrFJt9Njm
	LxqUq1JRZUt4VeRU7DHmJdUP+rb6BD3K4pIp/83Vf2wxWO7zMRtksLghAcMpUg4FnoHjxFyU5M4
	THXWkRnO+qyQN1NMu9ZMJWP08hKJ556E=
X-Gm-Gg: ATEYQzxn6eybQFidkzpYEUopUcbkxAy+pZu1KkNemIt2gnHjF1IglAb4wZ3u7kdNIiu
	VsM/WSoIKl1JeHGXoGgcpXDJIhr0ypZdiTyXdSA9VLVp3OJDfP537ppbf8IyFjonpEMtrtaRVBT
	+Hi67HYUKwVnec5x+O6M1k+cYXp2gsDKtJNeKojp9LaWJxKns0HMc+lDKTIDuCKkxKgCS4dk0MY
	VTtXq2PSjOecI//2SBxRowtKa2EZiLO+BuxftDW7i/kE1WGGx8GTYgBeVdGBVTYcwdi/UewaNTN
	SURrgJnlH/692uXxYpFW6KptkrzPkUI+ejvPeTP76Ehd3jPlehw=
X-Received: by 2002:a05:6000:1a8f:b0:439:afea:aff2 with SMTP id
 ffacd0b85a97d-439f820514bmr5953661f8f.23.1773242552459; Wed, 11 Mar 2026
 08:22:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311151302.105992-1-kalyanipatra2003@gmail.com> <a26ba4c7-05d9-4df0-b4ec-1a82d2df075e@nxp.com>
In-Reply-To: <a26ba4c7-05d9-4df0-b4ec-1a82d2df075e@nxp.com>
From: Kalyani patra <kalyanipatra2003@gmail.com>
Date: Wed, 11 Mar 2026 20:52:20 +0530
X-Gm-Features: AaiRm51rhXY5MAbFa8uqzn1ax-wqEdiLngJBt399mw_Pvps2VigEa7OVXsC4LME
Message-ID: <CACjYBviU6v_QbpPy0zhfpaBYMoQrO-pBNywzXZb9cHgerCCGBw@mail.gmail.com>
Subject: Re: [PATCH v2] staging: atomisp: fix brace style and trailing
 whitespace in isp_param.c
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simona Toaca <simona.toaca@nxp.com>, d-gole@ti.com, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-55423-lists,linux-media=lfdr.de];
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
	FROM_NEQ_ENVFROM(0.00)[kalyanipatra2003@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: AFADF26678E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Daniel,
Thank you for the review and for the clarification about patch versioning.
I will keep that in mind for future submissions.

Thanks,
Kalyani

On Wed, Mar 11, 2026 at 8:47=E2=80=AFPM Daniel Baluta <daniel.baluta@nxp.co=
m> wrote:
>
> On 3/11/26 17:13, Kalyani Patra wrote:
> > Fix checkpatch errors related to brace placement and remove trailing
> > whitespace in isp_param.c.
> >
> > Reported by scripts/checkpatch.pl.
> >
> > Signed-off-by: Kalyani Patra <kalyanipatra2003@gmail.com>
> > ---
>
> Please keep in mint that when submitting a patch you need to start with v=
ersion 1,
> saying [PATCH]... it is enough for people to understand is v1.
>
> Now, even if we did an internal review until v2 community doesn't know th=
at and you need
>
> to reset your counting.
>
> Otherwise, people will ask you where is v1 (plus where is the changelog f=
or v1->v2).
>
> As now this is clear, I hope community can ignore [PATCH v2] in the subje=
ct as git tools will do
>
> when applying the patch.
>
> With that,
>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
>
>

