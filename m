Return-Path: <linux-media+bounces-57281-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCSfHmSqxmk4NQUAu9opvQ
	(envelope-from <linux-media+bounces-57281-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 17:03:48 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6703471A7
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 17:03:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 100A030091E9
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 16:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23213340A4D;
	Fri, 27 Mar 2026 16:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="eG8/ah1z"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33226322B83
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 16:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774627414; cv=pass; b=rD9mcZiUNw0b0/8pSiknSehLNhdMMNd4zxJNcx+YsS4JNV9UTosCWa7fZQVjRn2NX3SlXFShNPkJDuhU68eqvpE4vm9zMCD1kcDnIUWgIydRsT1CUXp3rAaNYehTLqGLt0xzr9mJOy92M2hcT/kAvve9MrenAkdnM55u0st7I8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774627414; c=relaxed/simple;
	bh=qaJK7ivvJYtk7gsGYKDAxZLxMQORAwx4n1ULqt7dYkI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e8GVz7JmkuGGFf9S0D9bilz8CK5+mSaqzrGZTQcfIfHL5oCJB/iN4MDJLHW+62AtK3Xrx/pFZsakCbrDcfD4a8+i4PeXaTEB77wZYJxygWCPwvkvSnMg/O8feLubsbGiYuE8N8lUmpt7ECAU7nFW4I4n60XP0VwqRwbKf4vS7SE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=eG8/ah1z; arc=pass smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a2a5236811so1479481e87.1
        for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 09:03:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774627411; cv=none;
        d=google.com; s=arc-20240605;
        b=ZPB9tiLGLOHDO2qkUfKz3QCO/hKav4RSywnSLBu2QVPiwDb5iIs7gSBaiwlhYcjlqB
         jB3UlonQ3PIOlLs54ifLd9f/1XBqUKuIp9uZMnibYdIzrsB4Bw98DJZNDBk2az2ly1Ei
         kEjebiskcUKhnDcgcUyf/1ZgMTA6/iOuqjHS3NaST2KavK2jdL/QomtvvxlpxLrew5FV
         IIe3uODGmLNqqS+HWLKQz+3XGg+XpApy7PtAVjeat6J5wPQ68Ww2dlMPjFTsPaSpFBSU
         LC/R3Cd8c30Wha+bKky6JKGCT2E0I34bbPwCIvWlk6uF1RcDGodqn2Z0R2HbkBSQGjh4
         6q+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oXrGnijkpObAvq93icNp8bWnTtjwA325B69Br9cM5B0=;
        fh=ckPZdBJrMSEfCAMNQbPGdCUP6K5lpmdZ3LFeZYWFe6M=;
        b=gNsEPnlDBpXhYEQHmjAX4E7Cuesuho2oMmoyahZ0aOC95u0uw/VG0yu2fVaqTXtXSW
         EG9KDeqyxdoJbyIv7Q06NIygixHWVw55K8a3ewF0dk94bWT0LkwrF+xpIfjN4tWk21YE
         X50llxE6VQORHjXT+VocpJy9S4fcb1UGWI3N2hHR4WjJ+pxfufUsOMFU1WmrjC76XIX/
         T91sLPie662SUVEGFE2sNNPRcq2rB4Wb29rkyuIi4Gskx9V736nNwFAco6Sh67jaXpcJ
         6OQyvt8QsVBUC55H9DHXc/BQtvKwS6Ky5VUedax3+DOwe7XfltKfQ/haaacv4o8G93kx
         7MEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774627411; x=1775232211; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oXrGnijkpObAvq93icNp8bWnTtjwA325B69Br9cM5B0=;
        b=eG8/ah1zR9ehfXZLYacyIvtf796Ke2rQvzIPIR1RFa0SlFTVlRO3zNhs2a4rn2r3Oc
         CvWe+iROBsXeCwlsf8E8zUtqcGpSInNAo4S3uXVzQKRGEVGjC6MbnYMwlDLmx/ifHiFv
         oVdIHfobMblOF4002JaDkFBgPTIQs0EUoH0m6hGFDpoFNUtB+J7fdYoo8IKaQs1DubY6
         HmvBmibPLetRbUScQios6rYn7CB/1K3j0xVwUOz8UztQvEDvpesYfpH2OmaGR/UbLJLO
         tefkhMea4pkuOvjvyfcw3UMF9anOFl5ZS1zGwZ1txnjahK2BjQwKZb9PZBOr6Ug4xFeX
         Q7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774627411; x=1775232211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oXrGnijkpObAvq93icNp8bWnTtjwA325B69Br9cM5B0=;
        b=tKb53eOrSwbXtpTTjZZsHSSt0YcqjtRFDZKjlabSS77fou9UHfdEHvDIQofrL+Xkgb
         SiZImp6Vt0OmJaqfdLdDAiLHSYs7aZC893GhzlUeOSfyR9ERhmOdQE0ypPcOU3lEE8D8
         m0Z5EgA4kLK5ARg4InP1EM4psnDTgZtJuqDAVLG0pOoLmio/4TG80Q6lN02xMsp7kw6s
         Cwq+eTwaXnkAVq5d48x3xEK9opptQcF0ZWugfgEhmaJC4WJZp2ca9mzCc+RhUTbPLE01
         Meq6kgPW6J6fJiXO0zj2g/hJQeBWsxiRZRSeCX4AJXvcU7mdbMWRXfdEo67GRhY7Poge
         8fYQ==
X-Forwarded-Encrypted: i=1; AJvYcCU65t0wppYaPEpYGoLuvDX0aXxekyPNhbcIPNINqWxdW2ojXDntFa1VtzthsuSnNeLUZsZYpa1Y8Knlcg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwM8YCNU1aaCDcGEh6A0dsqV2Xc5L594+xqaDJX/l9sILL02Jol
	vy4coU3Q9SdJxr03rAJHFW0+WHcbM6pv4L1Ed6p6vou9PHeejWYeMaVa9uFSacWM8lSnKjVzEeV
	QEmGAOd0ycw8zoWKhkjUZOiIhRWP/twtaLCp/XRgRBw==
X-Gm-Gg: ATEYQzz5CuBtuF/q788z1N4Fa5P/QtXephFu1oCwnp6cYmAZo6Fgz1TiOBq0whcfdB5
	pXHiBQBuu4WlBdDedFRGMAK08/++J2JJsNJk3TrJm1e3sbP9VV9A9A/HaVvjN8MH59UvrqBuzC/
	+5uTUSwtFFRkZFmzWy6FBqGL8qLhJwzsIsNOc7fa9LpkkJyxtCu6ztQlJIEyf9lIo3A95TOpPUk
	IaWDqtjQMI7Z26aCxBpc3Xkv51obOkcWut2UkY3bRbIivZEMwhsS83PjkxS1ovG0qE9PVVMV6lq
	t81+lL0y
X-Received: by 2002:a05:6512:3d0f:b0:5a1:17db:aaea with SMTP id
 2adb3069b0e04-5a2ab920f8amr1349334e87.24.1774627411118; Fri, 27 Mar 2026
 09:03:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260113141248.203944-1-marco.crivellari@suse.com>
In-Reply-To: <20260113141248.203944-1-marco.crivellari@suse.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Fri, 27 Mar 2026 17:03:19 +0100
X-Gm-Features: AQROBzAoE0ZSMWyO5b1e_nTGRQzG4njQkxoHxp4EOGbD9s57Nfac9E9qFzQ0aaU
Message-ID: <CAAofZF5k1SO-RwfgZMvDTxJ2Go=NZuPEeGFM8gF==ZQzh_SXKg@mail.gmail.com>
Subject: Re: [PATCH] octeontx2-af: add WQ_PERCPU to alloc_workqueue users
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Sunil Goutham <sgoutham@marvell.com>, 
	Linu Cherian <lcherian@marvell.com>, Geetha sowjanya <gakula@marvell.com>, 
	Jerin Jacob <jerinj@marvell.com>, hariprasad <hkelam@marvell.com>, 
	Subbaraya Sundeep <sbhatta@marvell.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57281-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linutronix.de,suse.com,marvell.com,lunn.ch,davemloft.net,google.com,redhat.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marco.crivellari@suse.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,netdev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,suse.com:dkim,suse.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 8F6703471A7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 13, 2026 at 3:13=E2=80=AFPM Marco Crivellari
<marco.crivellari@suse.com> wrote:
> [...]
>  drivers/net/ethernet/marvell/octeontx2/af/rvu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Hi,

Gentle ping.

Thanks!

--=20

Marco Crivellari

L3 Support Engineer

