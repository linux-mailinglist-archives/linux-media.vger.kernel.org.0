Return-Path: <linux-media+bounces-58322-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BNkK51312nTOAgAu9opvQ
	(envelope-from <linux-media+bounces-58322-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 11:55:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C473C8C32
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 11:55:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1444F3003BE0
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 09:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAA0B3B52F7;
	Thu,  9 Apr 2026 09:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="T7Bti8CZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21263ACA4B
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 09:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775728497; cv=pass; b=u4phk5Wpa/nC3ZMySN9lXsqp9kIng5ucqwXeaeJr+9yFsMgzkHPXusLWzbIuUBicZ2bQWMbpmHiv2/3viOrlnMeWJCCidfQG8fGoX6HJrH6aWMQzn2QL+goJCGdN6eUBpsJncR640vXGWVH/JI6O8R2XavvNY+OITz63o4XszeI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775728497; c=relaxed/simple;
	bh=kVhlDxAgWFJn12ZVg10oT6kB5cwQiliC7NLQ1Rcthg0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CRQRPPV8Kx4tKYVttS3FIr749Nd/mgZm7sXL/W4OAkZ7PZseWBhKVaaMwbT0JOZoDeOTW9GFDctFezNfRXdygaPidJs3W5la5tak7vLJmNgVVdYitvMB2d6aDjPO5DwtdgawYs0QShVM5xgvuhjKzI1s4uiUG9X19kWYVqBJfpE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=T7Bti8CZ; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a3e5b4acc1so598027e87.2
        for <linux-media@vger.kernel.org>; Thu, 09 Apr 2026 02:54:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775728494; cv=none;
        d=google.com; s=arc-20240605;
        b=Cd+t7DwLFWFb6vI0BNTd5BCMXqUYmzI4yQ8oOkh76ou0LQPD5mPve9kwcVMricA5Hv
         roeh35irrL/6SYEG7fooq5Q1jNzBSaSaOz1WP9ZrBLwWIlhdq+hxRfinl2HmgnVCBHXF
         iT4aHFJicrLbUPwQ4NYFPj/o9E28FZZudsZ2zY2MrVgxbqVIPEBh1jTDcddk/fp5kbgc
         KiZPbS6kvx3Q/34qRxwWYEJ36DSsuXwrBWYvv+xoEzOMHXVhpYluC4M1mn2S6dA4vGsZ
         4guwxin8rxHtdy7FdLw5/fgWPlE2EzTAhIUB+25lDZ/nyRbTSjIoa3O+JScudnpuPuD6
         HdQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Bj7sPjSd+XOMrMYAc4RsV5swRAsq8jTuOPcjZUJ+AJ8=;
        fh=qdFcGCz8MMRpImzLN1pPUwj4UOOljPl4zNaNK1z9yq4=;
        b=S+WQ1v0nR9r3pgfmNhmzUSUeYdDlxdaqZa1ehuUVB8MVH/OMwLmtqzHu1bbI+oo/z5
         ZyxPOPU4J3QkRt6rIXQlGDkGPZVBVTcFa66syPNE9W8pJI+hw8VZrM50Oob6qd202g3U
         wA1J+NHH3fda74lehDPEuzvWMuYsdoaeT9M29f75qL5mfGUMdJHS/a/CyJhCL53JnV1r
         LGYUt6EFsu3xcNJ/afSdUqRmrUe61+xJyEt5jrHG4IlD/PwraWclaqWOkpc8WI9U6D6O
         D7axxT0g+GKK5QVXVLPY/l0+lgP2wTZkjyehiK14Y1ljZt+0H1eMlouJOAUwpV1h0ln5
         iMOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775728494; x=1776333294; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bj7sPjSd+XOMrMYAc4RsV5swRAsq8jTuOPcjZUJ+AJ8=;
        b=T7Bti8CZfI7S0G42ekFdKWBP15GBWu04OWiBRk5FINd/MOhRNVnj5zuw3sn/bimRmd
         CTGiYKuobd2OLO5oThcrlVmGuB/J9R2GfBRmIZx5c8Ny4DhXRIxHjisifELvc3bah95+
         BC+KlrjiIuldIz42gKPqFBmClkmv8v10P753OZ489V2AFxRW/N+MCquNWInr1OBtBHz6
         sybWrDXRGG+Wz3fI+jQVVjFOkiggNvi8ekG3qKid5FrVflTtqdh2hSIsX1b0V6+xCp1s
         GKxBEaJEiEK36VONaevE/LOGO9KiixlqdWHrSCBYi5am7LxiOZYpqHjEM/scBKDHpAi0
         XhiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775728494; x=1776333294;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bj7sPjSd+XOMrMYAc4RsV5swRAsq8jTuOPcjZUJ+AJ8=;
        b=AJPIJGr2wMMwxGtS7F/cjjH7WIA8OBniF5KXE6bSVNH0JsvJwFgxiIZkXide9fhpCf
         lzmlo62yKQeO0RK1d80a6tsE1jgJwrKLpepAQD6WpBjwL2WSfwW30PjeayMEFo7TKgWe
         zwrU0XsuZvew5mwqvy2XindGX8MIs7ENCw2gPyglQSesEj+RKGnK+hqOSB5c3LtsQm5e
         mw/ukoO53ohBjq1cXGlc+70Ynluq50HVDA2CarmIHiPcvx7iwWr9t2MYWYpds9w7ctDI
         pCCfojB/QhnLlCMsCfJy0X9y7PMYYKs8DZy2Ul3yBWRKrORmuDiMU6U+zyzPpLNITW9Y
         JErA==
X-Forwarded-Encrypted: i=1; AJvYcCUx5SI6uiq8MeViOkDI6OSYsZHIU0+2I4ZC3DGGEtLZAJOOZLPc242xuA79QZqew0NAZRadGcp2yT2bHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvMOCzBWr0H7aab/pqFpm/U0/DVhyce0E6/NbvxtNR5uhLaWK9
	HxeyZ7ZO86gWAw22ZhdZ5v5XFbdJ5D+NuokOquk4Fw15fTVghAwj/J33X4USnaESKEuPQDuUGrm
	8U7N1uaNlLVMoZE/ojJB1Wut1EXcmfsU2xioFAOk7kg==
X-Gm-Gg: AeBDieshmg0QFzN6PQO0D+SGuAuzoTSQcaNcRMAnz0VamMgHfgpkxNNyNt9Bs7FqhhT
	UogaWxeyoSOF6bUwfHLKam1eqwdepFA+PHsXG8PnNE5eVAOtqNRzyyf5wjNhvP3cCzyhJRwriyW
	Ne9RLdLkSQyQxfo7ZC2QErFGb+A+hsWaaVFe4RC026U/m26PgiDh0MQhgmlQaJmewmZVvouYGXd
	DEv9BtZgmPywU7WSfDnJ15axrMEg+6bVQib762/Dp7Ik1X3/B4mIdFq7SC2gjYZSLG2lgN/+ct+
	g4dfsww8XiragZViNaaEBJXN3sBE/b6idJl+KF6m
X-Received: by 2002:a05:6512:3d1b:b0:5a1:2e0c:86f0 with SMTP id
 2adb3069b0e04-5a3e7c4d27amr938154e87.37.1775728494123; Thu, 09 Apr 2026
 02:54:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260113140446.196930-1-marco.crivellari@suse.com>
In-Reply-To: <20260113140446.196930-1-marco.crivellari@suse.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Thu, 9 Apr 2026 11:54:43 +0200
X-Gm-Features: AQROBzApAFHwOLkClIX6lvWH5vObVEIZU5bnHM-veRMD5MxkoSOashtOu4FMUM4
Message-ID: <CAAofZF6Ap96qQ33=9ak1euxj_-_Z7Y_T5ZmhfGH9TXkpRsoqyA@mail.gmail.com>
Subject: Re: [PATCH] media: platform: Add WQ_PERCPU to alloc_workqueue users
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linutronix.de,suse.com,ideasonboard.com];
	TAGGED_FROM(0.00)[bounces-58322-lists,linux-media=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,suse.com:dkim,suse.com:email]
X-Rspamd-Queue-Id: B6C473C8C32
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 13, 2026 at 3:04=E2=80=AFPM Marco Crivellari
<marco.crivellari@suse.com> wrote:
> [...]
>  drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Hi,

Gentle ping.

Thanks!

--=20

Marco Crivellari

SUSE Labs

