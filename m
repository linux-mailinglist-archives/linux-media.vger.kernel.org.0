Return-Path: <linux-media+bounces-50846-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA7BD2E53B
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 09:55:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A79503005F11
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 08:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C25D31195A;
	Fri, 16 Jan 2026 08:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MGRVe4vq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444883115AF
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 08:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768553706; cv=none; b=IxRcVn9f9029mypGh0/nUMgQA5plWDsAFoX36RWiKM01P5Ldxa5dclTM7HyZgoPu5uO8w5vP+TLfdx6VB0OGPW15TAY1NFzTLLih7zpmadOG3dTZEr62UiCgOWSzSTOwPiUvXcktwYc22unVq6Oc6b4qxIjdofLfioYCbunwNb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768553706; c=relaxed/simple;
	bh=LZNh/B15RQu+YqUrBR6c36jS6KvAXKHkwL3ylqzkC0Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YQKUyP2mlaVEPQBpAwSG3PHXSeCKJI0IXMHiQr5HFkpRaSL4UnBpb4jZ2EcdnYOrWLqkvyUtmSqUUMVBr+Go/A4qGufKa3lc9B1o4Lu1PZ22HVDRQ+CFasEGLiW7ewU617ztBb5hGtQKsZQUDQ0gaBHn11ULaewgRiTV1hpClEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=MGRVe4vq; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-383138a497bso16025961fa.2
        for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 00:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768553702; x=1769158502; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LZNh/B15RQu+YqUrBR6c36jS6KvAXKHkwL3ylqzkC0Q=;
        b=MGRVe4vqEoQvvWoL83/yPMuGeLZxI0LilnPDo4aCbYv8NkZLO79tUUdqrDIsao5qZz
         TODTY/3r2mlq7DakXQR2AxzzkRYpNk9dE5f/KqpbdkoW7K1lEaKZ/vk9GqF8GhsdxM+e
         MNbnZuTpj9Z8FqcZ1gvHfw+8sotkc4mlA3a8gvWdJTOuygmlBNxVpc4aeC+bx3E62vGk
         gOe7p337RYJ4VER6qP4jCRktNRGk4ckbZlZLkH2bWdQwVw/XCVIKk25pX5fNP8nXf0Ji
         RWz9Iim4AgDVHhl44p6MMTalHC/SCgoEq+2No/o44WYlW1NG9HL36WEAvOyi4H/yemvc
         OM9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768553702; x=1769158502;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LZNh/B15RQu+YqUrBR6c36jS6KvAXKHkwL3ylqzkC0Q=;
        b=cLoXkmExcjBpOcTKEoGHypjPUFOSjZ2gD5N+EwVkQo3N3VKbvLxoAvP6jipmaICv2/
         VZCIJtC0eGDo4icfTXDBvySiplB2cqYEfg1oksCLeEeSLwfupbenBcc6LLcJ9TxBsbAg
         KguORT6lC6n3txRHqrlVtsGK7w0YgbjboIM8fWrwT22JTVMF8PQD+zIU4KPKOqM6hazx
         2Rzzur7skTyQw8Fm1nHxYOklhuo0uASZKLQuo8GqSO2MfvPcS/085l9/t+DUmIpGXSau
         Bg5H8+ACV7hf8SlInJZuN6G/BViWzQw9TMfeG6DkrPWl+6s7P9knZpXsWoT+nqU16rNJ
         Aupg==
X-Forwarded-Encrypted: i=1; AJvYcCXHtQ0wIQksfdO6vvKSfejRWF3Q8RfZMQQ4PkTNmwaUS5Py/BGq3roNXNE/xuF5pXUjMc8aFqEcSHVFQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0y+droO37RtwvoA0plLLyzv34FPs0+UWOkoaDc5hatsr4gpjn
	rgLGBXe7pnDnQxkcWdR+6TnO/P39JnAJrNyEbTu8R5T8gJeoGxWOR7yUC7KlpeRSEuJeGUncaLK
	mdycfTblV33C9ZHr3qfkuVb8DKd+0neaMYJXaOSBASQ==
X-Gm-Gg: AY/fxX7LWR9NcZ9z1VgMfr3yPB1y7ioU3rP0/gCwZRuSwPVTkq/wkau0tJUXbRZ7GrZ
	AQds/41zdJaKc7H4iCM8Texyi2GYNpgGqYfMgxqoraL/+dBjUdzdr3S7G2EUmrxEkqnEy3rk0/D
	okcVIkWr1E/yJgtC0ajosm22POeclfp6J22VVBfxc+tXNUgOghtUXtsnmlWQf+FNii85N9MO8+Q
	JUiGU4Iiykg6ZvTEOyd4EC7WBxet0EDMEktUCX8jw3KD4dXxPUA651l/bN6waFiXrJFhC1Xr2Xv
	Brk3mCjqVuYT2B+zwxI/5Y9zz8fl
X-Received: by 2002:a05:6512:1153:b0:598:e8b7:665d with SMTP id
 2adb3069b0e04-59bafdb54fcmr688853e87.3.1768553702228; Fri, 16 Jan 2026
 00:55:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260113140446.196930-1-marco.crivellari@suse.com> <ead963dd-11eb-44b4-9bf5-bab4dae4bcde@ideasonboard.com>
In-Reply-To: <ead963dd-11eb-44b4-9bf5-bab4dae4bcde@ideasonboard.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Fri, 16 Jan 2026 09:54:50 +0100
X-Gm-Features: AZwV_Qg7LDca2kc3G7dY5_H-fn6a9EkLkuaCsBuocRLHlERJRX0STr4pKIdN5sQ
Message-ID: <CAAofZF4D4jAdTK6ZttOE7nSXbDqyGefYRsroNtS-7yoPRE5EEQ@mail.gmail.com>
Subject: Re: [PATCH] media: platform: Add WQ_PERCPU to alloc_workqueue users
To: Dan Scally <dan.scally@ideasonboard.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2026 at 10:20=E2=80=AFPM Dan Scally <dan.scally@ideasonboar=
d.com> wrote:
> [...]
> Sorry for the delay getting back to you. I haven't looked at the impact o=
f the refactoring in
> detail, but I'm happy to trust you on the workqueue internals and this is=
 line with the changes to
> other drivers across the tree so:
>
> Acked-by: Daniel Scally <dan.scally@ideasonboard.com>

Hi Daniel,

No worries, thanks for your reply and the Ack!

BTW, the introduction of WQ_PERCPU here it's only to keep the same old
behavior, but make explicit it is per-cpu and not unbound.

Looking at the code there is a big chance this can already be
converted to unbound anyhow,
(WQ_UNBOUND, explicitly) because I don't see per-cpu variables around.
Otherwise this can
be done in a later step, and keep the per-cpu behavior for now, like
it has been till now.

Thanks!

--=20

Marco Crivellari

L3 Support Engineer

