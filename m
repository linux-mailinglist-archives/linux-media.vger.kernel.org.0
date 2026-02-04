Return-Path: <linux-media+bounces-52178-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2AIoG1cyg2kwjAMAu9opvQ
	(envelope-from <linux-media+bounces-52178-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 12:49:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C53FAE54F8
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 12:49:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9540B301F314
	for <lists+linux-media@lfdr.de>; Wed,  4 Feb 2026 11:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 967F33E8C51;
	Wed,  4 Feb 2026 11:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="OTdOUJOI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A216938F92F
	for <linux-media@vger.kernel.org>; Wed,  4 Feb 2026 11:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770205765; cv=pass; b=MNDeOP3lVpy1oP3aHPRWHv6/ZOFqC2V0pP751f3QSpDd5vw00QRATubBVM1xsuq+2dd8tQefZB8QPgD+KNxE3TSzSuXnS9CrdgYwPsUcSmcKmtqru6x1/B60yldAgopl4kQQejWE4MTUfQfYyHu0qy0+yRhX968dwVZYPfbp7MI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770205765; c=relaxed/simple;
	bh=sWdZO70ljHKteIUReoS8gTa1QvqmmYSjXf1iJtdq1U4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WaDCVj2eTnFrZiiy/nOFXd7N8Xb36wIZcQIGY8S8zpXvzq6DweogQW9gsO7cFZ1S6AKkTHaFfQ+CSAJRKK9eseooa2ZBn70HA+/CTY9qapY4Gq8oRUj36nesuSDzzlzgQRg7V5UrwArQ5861osMXTZX6YCpefTtqIX7s/vEPwVQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=OTdOUJOI; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-59de0b7c28aso7626235e87.1
        for <linux-media@vger.kernel.org>; Wed, 04 Feb 2026 03:49:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770205763; cv=none;
        d=google.com; s=arc-20240605;
        b=MBe035NLhiHoJgB4y5eBEBQZxRU1wa8YF30mvHtb679HmyfiJuvEAY1YwwabHdUqWH
         5MaPONL7Z3fs12oIsWUoVmhfMY5lapTHOMwQ/FqpAg1/Jew1fuxFOMd2vtMORiiWrdHo
         JM9J5zIVfWD1DuAAO+QxHmTg8uL8rsbWSVka96hbm0d/728LGbqgHHL6ePb/uvGnGkl9
         NgcDwptK54RJ9xN5OM1VVoZhnNxCgYc4LTihnnik5n0Uo31voXRSvZOpv0lsvHNMVs2q
         gn+QzU3Vgui54mqjCPWB8Hs0xymhMDc6FnS5RllDzgMYdjTHftfl+hcAc5VF2Oyugxl2
         5ubw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=It2F6S0b9gIB/Uvl0gDiVk9Xo7Q717wDhO808nuMaL8=;
        fh=iZdxDnLBYSoQS3Dt08uUwW2wgtyf2y+8DES+3rU+t7o=;
        b=I8bYZJRJtXqH+0yeRuTW8utaIn290zWgsgzmzHN9myuZU2u95TzS2ZDrl3aansVj51
         npMbIP1aSB4ySOrGnuXrdH7HJVz49CmtRc5xK4L2NCsRpOiQRh0ARp8R6jQV22ZlXK5Q
         KjQZ/wYV4pRyEunW+J1CCTJr3H9E1A4P7Q4gjHZvu6Xik9PZ5TB1/8RdiOAn3/oTVnAA
         RTeYoWt+3BgF9AXBsNbRdBZGU3R3YhXggbSRDJqhqolvuBNevXrfh6tkiufGBpbu5vlZ
         Js3aNee5xMBZtx3rIZWvpLzluxv7W4rhqdxnXNX8vAt56egEZ0vd2YBWb+XPfvCN/YGn
         w10g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770205763; x=1770810563; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=It2F6S0b9gIB/Uvl0gDiVk9Xo7Q717wDhO808nuMaL8=;
        b=OTdOUJOIMX0t8Yvf6jtdexEAfsb/rKMO+TFPm9GTr9p0AjXFAyb4U61ChnLZUyTGFr
         bkDuuJ0TLD51in7wEomIv8BUmdQRXIviXoLPCpB96uYgyRq0SLpjybg7NPsktzEz3gE7
         ah/mx8gXAmsJZm9GjC4Bqz4oiunXTSjVx3zD5Pmk6JKetko/XGd3F9LG17dDb27cBI5s
         PVVr0T6Has3/QlXl9H5PVcflZp1+n8daxsLoDnYmBjf5TlDv75bsaO9YubuSR/Gv9EC0
         tHZ30AaFEEp7P1D/SwqjIYvchM47O6BtG+h/pTAb4y4cOoSToTNk/7xhtuZTJbawl2Oh
         Qjlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770205763; x=1770810563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=It2F6S0b9gIB/Uvl0gDiVk9Xo7Q717wDhO808nuMaL8=;
        b=CC9CwP+Zlj7ALM8GmvIBTsU+14Cz73Hz0A/HbmYaaZrOKuK5fL5c3DnBmqsNpuEnAh
         JvL5uFS7Bs/3M6kQnZMB9ZEudfiE1v/xSanenk9rupLEWz7H715P/sCO6Jy+93PP4wAG
         2pCG58NvEm/9Ba6iN3N8su4r0ixY9RnLJHFOIDQ+ofss2LqxwRXhSaZnZ28ns53r1Sar
         JiWjml/GCn6Ma+ozDlOZF4FipVSL98+HtZPteNf/WeheeZtMFH+29QsvCnCR/hvmmHna
         IUp/hQnx0v8Xokn8tPDI9gBTtJWyT9ZHNHdHoEaVGWgQSw/uNvfMX4hBZ/V5iTW2T3sa
         Deiw==
X-Forwarded-Encrypted: i=1; AJvYcCVnmEsR29nOXG8JFXcfgAf9mwKjpP9EbwP+WoCgEfFSJVVXXwyqFX2sWNxRUwd2iXIHj11R4XtDe45MCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRL8oKrjTvhx0tUZi3vklHwoz1OMY0hZUOE6o1ZXLBJLdg6eDb
	Et//lbcnmOHaHySxSn957DyAnwa6wC+l3xFYmQvnMj0LbCfm6yYLzW28WEnb/P3OnI1s27f+bFz
	nHgqwWTf9ERAxqcbubX6A288mL35cuawq4UOQf/dB4w==
X-Gm-Gg: AZuq6aIgBHXqHkbMzV8mJ+ue3hPd8ifnbCdHYvlKhf5eYEcDY/cfVR1+0GvXQhyOijI
	xc9ik3nq0/e/Cn6UG1JX+VgwZb5BQSGGPUCt57o8HAwOQN3a1n2CriLT6Q/Na/+mQDcwjMdkqv/
	XEsI+T0Nu4deGv4mNNf1gJnCst5DOYbwYIA26Kv0UDo6/m8pCjlBv1tFt+USLKYmi8615e25/zj
	e4o1TbzkHxEt8naWglZ6xwYXRYGiBP9ZPu2U/toAtGFkOb2AXc5hdLt4WlY81/xj3GAU3C5HErn
	vbuzlHCnipmSiFWAu92jbmzJUIGI
X-Received: by 2002:a05:6512:2391:b0:59e:39af:a70d with SMTP id
 2adb3069b0e04-59e39afa784mr706098e87.47.1770205762700; Wed, 04 Feb 2026
 03:49:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251104102048.79374-1-marco.crivellari@suse.com>
In-Reply-To: <20251104102048.79374-1-marco.crivellari@suse.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 4 Feb 2026 12:49:11 +0100
X-Gm-Features: AZwV_Qihud_fhdGsqHkvG_dz_GxBAjMQl2gL8HgJNlfr-3u0KHNoOTY-yfCvRO4
Message-ID: <CAAofZF42TocsYR7kBMoUWC4YQMnqv4j37kWsnY9r75V5PC7UjQ@mail.gmail.com>
Subject: Re: [PATCH] media: synopsys: hdmirx: replace use of system_unbound_wq
 with system_dfl_wq
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	kernel@collabora.com
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Shreeya Patel <shreeya.patel@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linutronix.de,suse.com,collabora.com];
	TAGGED_FROM(0.00)[bounces-52178-lists,linux-media=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: C53FAE54F8
X-Rspamd-Action: no action

On Tue, Nov 4, 2025 at 11:23=E2=80=AFAM Marco Crivellari
<marco.crivellari@suse.com> wrote:
> [...]
>  drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Gentle ping.

Thanks!

--=20

Marco Crivellari

L3 Support Engineer

