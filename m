Return-Path: <linux-media+bounces-66168-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2yuJFOnQRGpS1QoAu9opvQ
	(envelope-from <linux-media+bounces-66168-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 10:33:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D900B6EB244
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 10:33:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="mSX4agR/";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66168-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66168-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B1A23301441E
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 08:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E26D3CA4B6;
	Wed,  1 Jul 2026 08:31:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977FA394788
	for <linux-media@vger.kernel.org>; Wed,  1 Jul 2026 08:31:36 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782894698; cv=pass; b=f6KAlOa1xQIRey5jbvO6N5dPgoZlqWGnAQvrSyf3fiX3ugrjuH75JrRTd/2YZSawOk9JCHe9P1Albo+18yqfCflZL1Up3pGlLQCa6hKKr3L+XVBeOdKHEtDKhMzP+eHrdflwBv4fGeO7BEJurizYA/COk1+5vAApUpn3OKTFtyM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782894698; c=relaxed/simple;
	bh=lznlzRBVcfK1W2i+Y39J7mlTf+xf7x8Qi+oyvc5NT/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eHRyInLiWPiNZxKBhx4wMsn8KfaV3Mdvh9vC9bHKpctisc6DlENrQqkOlsNAWddZDR1+fvHWhyHilDjkEv+iUo1RG53vfWkN5dPOJFEercd/LPGirnuaPSBooVP6a2N2/ECvDm62lH3ZNKtCMaW8kixVOSlJ1o+PAYPqFxRv5WQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mSX4agR/; arc=pass smtp.client-ip=209.85.208.173
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3997a448ecbso4416091fa.0
        for <linux-media@vger.kernel.org>; Wed, 01 Jul 2026 01:31:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782894695; cv=none;
        d=google.com; s=arc-20260327;
        b=paqWl95n3C85uTSVUnNxVB0HGZpA/PBzwfDKO6O7lObdx0pOy0wLzRRhQEBmncQg/O
         T9jAwwMNgS8HX83qDqw9f/LNBki1DSIKjVwmqlWl0dfSSpoE2V/d4YhrGDh/aZFET9ID
         taN6KygYFurBhsAQYZx0SEFnJW1SHRAcCvrkzcG9f2kfVc3wrDC/7oOnStUQYgWYWlC0
         gHW0xkEiJSsaUk97H7mtcNtWmB2juNwAamSmG7SbD6Qo81SOY39xbhgDQQQLuahki8+n
         0wtEJCMtdGMBMaKN45H95fDkj3Dl/0wVPjMD2yrm+S3bQlna4RnOUfIR7jU/S5Bn12cT
         FYEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lznlzRBVcfK1W2i+Y39J7mlTf+xf7x8Qi+oyvc5NT/Q=;
        fh=PeJS8BVeMbIWKPr3JHaU5QpR1qYrxgh5uRNo/YMPLgY=;
        b=CChuX8eZVqi4s7+FWOVX2gP5Va4Y5kK97qXKNXmppZ88YWMn170xg9LSDVjaAiDuj9
         9FyEtp9dQX0itEkEjL25+Jg+F7BIH1nfXIDsrUm0/vccUNYHK67uGbJrS+Urn88b0V9K
         fd1WpKLHvP0ml2mt8biP1VPb0SJjSGU2dx/mwRhKQ48SwU/e3/oS1O1GtexcxHc9NGyH
         ek5vRRAKUVS6S/BKIC0vQZZkJDTKxw0t7zey6p+Dk5jotL0J1WMUY01OCEDSIS9HpKVL
         L7+Y9CsDYsgSP0Ufc5qptN0EQrcmof2m5HUyxbaqHoFyGLVwliTK9u1eHb8lcYYrxNLb
         q7+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782894695; x=1783499495; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lznlzRBVcfK1W2i+Y39J7mlTf+xf7x8Qi+oyvc5NT/Q=;
        b=mSX4agR/S0ilGUSExV38ClV4Qh8U64uZWhVeVJZCcg5c/eN+5qkPazrMq8REovuWFq
         EouaYdxM91eF2duQul5BIoFELVzOtTOVhZPii8I1942jXrrXDyqCuhZsm79HJqtdIDlS
         dl4szPTNlNEyqct7/0RJD+0T2cSWqbyv7AK2SMuv3JRahHUPSE74K8MKd9C3ZXj+ONQE
         bsWFimhKNMuelLy3rl7xAN8iggfxndY2G74JVvGEzSOq01PTkezdysxe7NXzqpKdR96B
         JDe8uJ/+glydxcpQYlWicZMB1FTXVveA3awS+uLeLs1H0IAgUO1/y4xpuDbYi2ZM/bi/
         PHlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782894695; x=1783499495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lznlzRBVcfK1W2i+Y39J7mlTf+xf7x8Qi+oyvc5NT/Q=;
        b=k77JaQ9MpnymHvjxAoe5NcvIfB4kPKkGuPaU653t6nKXxvnO9UINYBc9Zl8W+jbOcI
         sHB/F+5mfKfHyyHqVpVpHdxyx0LyF1GKwqn4rplby1eohni9lLhdgcsGPMPHwVJ6t2rC
         02U9c3cCytR8jcw4SCQu50MYXM0lX5ShP/dadu/Uf5YiWHuSvZh1ax9XbE5vT2FdlOxW
         ytyS08pCeFPVMPCqvlh45d9rmTy309C53PArIO+tgUu+S/UxtSMR3YCJ2Oou5oHyEyBm
         VZ8889aw5Vw5yn5NRUadZYlYXdANHQGo0PRtWhttk/Ye3X8ABJzrMhuxF9cSsbwPVRoq
         0TIw==
X-Forwarded-Encrypted: i=1; AHgh+RoxAp2DmVb1yqgnh4UkAkvXdQwGxZThYcX/Uu7nNuC4xm5DbYbkBJNV6y3MrfFEPy+aFNz18NCaX7dC/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTFlP5Zxna9NLE9Xbs3JSl9ZyJw1KSpvUrlSnu1Lw8M8/Ast3i
	MeFmRHQ18bwmamjiUijsti/Fsmeoesd+jeYy2kuzWIihHFVFPNzD9vif9BrbXRJKUr9XFPXnllk
	+132il656Oci2a5JFCe4qV/mS6qpECw0=
X-Gm-Gg: AfdE7cnzyc25r23n5FhwSWQtvPQznOSXUGN6F2/XPRUd7iwit1+DMs9BIptXQc171J6
	3EyxKVocnVz7ts4dLVldCvyhUJHHwoY+gi0R5TdwodgNbb70ACHi43/nlFPf9WCfRQWjkSXqP/v
	QKXmpcXV8fETXNiARttbALnh/scrIVLV46ONbvz26ZWymIgafoO65JckAlmvKFYeSp29fEZ1sxO
	knyzHqffg2j+H4BaMvv+8hhObkiVRXDrfof4a2aG7mfJb+yhyqhrWPIbosEgtqgiEuEbLo/o4vb
	XvrJh2EfisObbHxusgO8B6aAmO6DnEGHfj+k/wjJaIuZEPZnB7KD0LiroksSYrpiOljCmSqQ2Rf
	ypZJxkhNwnXmmkwYz5YDurETxMPpFzSqzjw7jddhYTNmoWrZkviP9fSK/rBRabMD52/hm
X-Received: by 2002:a2e:bc85:0:b0:399:850b:d84e with SMTP id
 38308e7fff4ca-39b33ffb8e0mr1356361fa.14.1782894694673; Wed, 01 Jul 2026
 01:31:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260630160435.3293-1-bohdandmarcus@gmail.com>
In-Reply-To: <20260630160435.3293-1-bohdandmarcus@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 1 Jul 2026 11:30:56 +0300
X-Gm-Features: AVVi8Ce_LyxAKkEUSOJM9tn5_55aV7q2ZfHH2Vk45bF6ZIsK4SPABGdVQ6HUQyg
Message-ID: <CAHp75VdX_DmiWXc_pYCgZd88cO3=yB7vFsgHx_8HLAJtaJOHow@mail.gmail.com>
Subject: Re: [PATCH v3] media: atomisp: fix block comment formatting style
To: "Bohdan D. Marcus" <bohdandmarcus@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	andy@kernel.org, sakari.ailus@linux.intel.com, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:bohdandmarcus@gmail.com,m:hansg@kernel.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:andy@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[andyshevchenko@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-66168-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,checkpatch.pl:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D900B6EB244

On Tue, Jun 30, 2026 at 7:06=E2=80=AFPM Bohdan D. Marcus
<bohdandmarcus@gmail.com> wrote:
>
> Fix a block comment formatting warning reported by
> checkpatch.pl in atomisp_cmd.c to conform to the
> Linux kernel coding style.

Almost the same comments as per v2. Please, slow down, read other
comments and act accordingly.

--=20
With Best Regards,
Andy Shevchenko

