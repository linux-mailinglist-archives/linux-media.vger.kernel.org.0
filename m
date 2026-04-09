Return-Path: <linux-media+bounces-58321-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCo8Eh9412nTOAgAu9opvQ
	(envelope-from <linux-media+bounces-58321-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 11:57:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E923C8CEE
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 11:57:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 48B49305B0A3
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 09:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E95063B585D;
	Thu,  9 Apr 2026 09:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="QZBu8Pgu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBADC3B52EB
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 09:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775728435; cv=pass; b=PYlZePX9nviP4L3Y7XOdXgJ3tAB4Yt+eiUCXRzsIBC9RwJrjHT342buqN+bQBe63hI+K4hrVMfQFqR+ujaCf+qdDqMCwYHkK7XXFGX60gRUgwABDx8r0gqe5GNBR/QAD4b3C4/z+kvF6hhNBa4Azw+1fUWiOEInfVYHiaR5AZP0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775728435; c=relaxed/simple;
	bh=ZtER23wRouk3m0GoGL19ddXRx5WJGj5pj8LICYlEMsY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l4YdpmOKN2jXNjniuxYiDgCVi0RmzmGAFOkGMx0Hu3Y1fz3gtt1fZam4nsSk1CBgvHpYepnLPD1CMqFUceGzoAuzNgqVZfjhUtXSOuycgbkD8c8riLiIWE9Sn0mM7uvoMuRbBjnZ0RUhga8tkhGpZ31uiBhZ9RvfZGQaL3ugP2U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=QZBu8Pgu; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a3cee3a271so675662e87.3
        for <linux-media@vger.kernel.org>; Thu, 09 Apr 2026 02:53:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775728432; cv=none;
        d=google.com; s=arc-20240605;
        b=WqYz5ZaDdlWs6ppFpkYbpGCZGcJPaqZgmRIw4Fx4NJjVvAq9qNOlYiHSkYBYWKOJ3h
         XU80LcS63KpY6wgcUeb7UgM0vEu6vnpg0kqYbWOLlf50DubO3GRIpYlYBAFQLqfHRGVS
         s+djLseh6+myLvBykx4f4yP1DOqr7jqGyYoKkxNc2tpDlrdajlG5NpAvgsFh+YCBQRQS
         0smHuYSdecwj/LlG6TOCxiEz3wYfUw2WNR4TIEESl2I5VnyPvs8Yhyd2E/l79GyAJWrT
         aDq7u5I/eTYG3IIRCkpKHHJ69zqItwNtrLOM5mo5lX/Gc0O3BmuX8kP+Vpf1LZAdkfOe
         Ybxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nIELx651D0E0Gm7bdbiy/k5tj4WQ8mL8RO1bUkmYxxY=;
        fh=fIn5bmecTjQix+FabTWot0NVU95z8iRYgFUGUEXP+SE=;
        b=cZl2IKLAwsMc1IcYfw2N0Vpn6i0xNDr4HATNnPryW0hY+RHasE6fJ0BkmpaZWcktqp
         W14tQ96LKNc4HGiMezdWx68hWrdogVx7M4uDMkfKmC9ihVkkgvjC+u4ELkw3bZIfuz3k
         6QU8uhdTN7G3vQKHw48LqEsDrI5GbQk4ep6y702aXop9K7m3hpXaqWU3ZJXs4H1oNyXW
         Lvtk97xFyHHnsMYl8D8/ZVGGZGHdMyS7lPDsz7yktgunG7SEiJud8O0m1kkfrruzWFk+
         Fjnmpdk3RQCElFUcHe4AT8jipeVSKLpJyaWSCjsuDCZtWhPQbzi++6MmkNh4sXkoGA1e
         GQMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775728432; x=1776333232; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nIELx651D0E0Gm7bdbiy/k5tj4WQ8mL8RO1bUkmYxxY=;
        b=QZBu8PguTqZlHZqFyZCQZ/S7ZPoHiMACsvwZlwidweOF3Oj1yBfZl9W/8e3YrOc84t
         3puj5vfDZ6mQ4JT/9Y/8d91KjRfw0iyreTacXDMvQXjG7T7lAOkbKyvEyYMZEEvpHam/
         HLg6c9yF22d/BcJClPLsrTdLgoz9i4GtEjMaQvlqiPyRiohARqKGu0uJ6sxGYk+qIHeZ
         68TO1s6ugtsk7FaIFPuwhpUb4X5CmffImjsdGmuxZ6q5Y0I9yYFp5LdAPJqCbUORb9D3
         gP3U370QsgGbvc64W+f5pWuJfJBFguEskbATLFALU60PNuVxXoE+Yk5Uz2IIxC1v1Y3M
         /Ehg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775728432; x=1776333232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nIELx651D0E0Gm7bdbiy/k5tj4WQ8mL8RO1bUkmYxxY=;
        b=JqbEHO54UDljmFFzDMmP7R3L+MgiMr8qiVPRQt4n0VHARMwSP5Cr0LDJ6wmTJXR1iK
         21Yyrotxx02dymmYR0KaKOsPDYAauvrjy+C8MIBBPm8d2DlCiwrnzvMWHRqZWvrPb1Ar
         /Z8xK37IlgJIx3j4gMi4JrQqMS+VEt1SMedWa7SUQW0/j9tp8+MultEt3nwwL6HYA6pV
         JAYr7aB3phSQp5e99uqfbEL/tdmcYc1M5mf4V/aMH8ob5Xc4+i07VDXTPETE73fzFjvG
         7SXfs2TlqvY3ojA2W7LQVrjDd/fMbmJTsbpQj9dH7N2dzJLxWRKLZfgciy7AaU1rSYiQ
         nqeg==
X-Forwarded-Encrypted: i=1; AJvYcCVGQLfwC0UJIo2PbFgBnRytn4+HGNTnkJBNxDdqACZl+sB7AFZZtdSkmHHGfjYO7KNk+kqEgV1eNhoJJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhiQyh8e/3Trvdvjg94dJmk0w70rqQIiV+sXO/ULWSpoUo2LYD
	mEgnNG7FYJyDqgw704J3SCoR17ya/9meEVAksma/tY403hLIAAWh4ptMyaj6y5UEWfVqKP/9Q5z
	OSobSrRtgWGaGfh4svsk1PDQsKaap3Npzi9QWqQUxRQ==
X-Gm-Gg: AeBDiet8jm224R+IHg0jBc5rq1K3wdOKCnRJWkEmRq3yVNlihnYlSO8m7j+Y+jgr1Bl
	0M4/Q7vbJy2yvKVR07k4b/w1S4UJ/LdVA84wt/Wbg8R+yYKOQmLbphhdqb1zRjPowgurJJaewrN
	5nuaWpB/Xk+cvUB52tTPExAgy3IvjYCo79Ql6AyuRiNrwg2+5uwg+7vhAzB6+6bG5Pi4RDh94qY
	SG1nh6zVccg1cl/jmjw0zXFkZ6JHQ1Uv0EvVLxvXwpJF64msvnRBal+S1DyM9VIwcNe3ZVhcarL
	vNbOXzFohsgWfNZC3+KFie/fJWIH6axNDkqyP9U6
X-Received: by 2002:a05:6512:3b90:b0:5a0:4344:a519 with SMTP id
 2adb3069b0e04-5a33754efdamr8214808e87.4.1775728432024; Thu, 09 Apr 2026
 02:53:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251107141052.221108-1-marco.crivellari@suse.com>
In-Reply-To: <20251107141052.221108-1-marco.crivellari@suse.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Thu, 9 Apr 2026 11:53:41 +0200
X-Gm-Features: AQROBzBbBCDF9Jo5h40ZrOEzOmetDkavigvsqQwbGg_lUlJpONhtSOF97sQ7TNc
Message-ID: <CAAofZF71zgDKSRew21HfgN-w7ZCUvGCHBv+0qsJm9cToDxugKA@mail.gmail.com>
Subject: Re: [PATCH] media: ddbridge: add WQ_PERCPU to alloc_workqueue users
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linutronix.de,suse.com];
	TAGGED_FROM(0.00)[bounces-58321-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marco.crivellari@suse.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C6E923C8CEE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Nov 7, 2025 at 3:11=E2=80=AFPM Marco Crivellari
<marco.crivellari@suse.com> wrote:
> [...]
>  drivers/media/pci/ddbridge/ddbridge-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Hi,

Gentle ping.

Thanks!

--=20

Marco Crivellari

SUSE Labs

