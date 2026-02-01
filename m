Return-Path: <linux-media+bounces-51946-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6udRI/Lmf2l8zwIAu9opvQ
	(envelope-from <linux-media+bounces-51946-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 00:51:14 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DB0C7926
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 00:51:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD7FE30063AD
	for <lists+linux-media@lfdr.de>; Sun,  1 Feb 2026 23:51:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAC962DE1FA;
	Sun,  1 Feb 2026 23:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U3zp/f0R"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADC43D3B3
	for <linux-media@vger.kernel.org>; Sun,  1 Feb 2026 23:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.194
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769989867; cv=pass; b=RyXtUMJaNLmVIQtsV0ktvHVsOjt4bwYqqGDEEmJvR97WeTgEDx2o+l8YL4j8jVzwxcEdZ+yAnU2KkUxA+G5xZphXGnsTZBFkXjpneWOObIvFIg8iHouRTpdF8HV1m7he7fhCswkFBVmBGLM5QMXTIpwQXP1z4CpYfOV8Q7mXLZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769989867; c=relaxed/simple;
	bh=uD+XpRTXJADFr464/2XRLz5YgEM5mPrRJn+d8szkbVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SgosCVxPtH+Ch7VqcPD/ooewOKiC/UEzC41HJ6tKtItE7gSKNF/0a+/kBK6Gx/FppGHxVvdHtnRNl0rg5NrMua84aTnOh+ZdHX114MRIrh9xmVdwnMzVGOUOfZO4ynhD5Pb9StfFFRfVwXWt2I+vBeuiZzxpCWfyRTIPFaMv9qY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U3zp/f0R; arc=pass smtp.client-ip=209.85.222.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f194.google.com with SMTP id af79cd13be357-8c6f21c2d81so399604185a.2
        for <linux-media@vger.kernel.org>; Sun, 01 Feb 2026 15:51:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769989865; cv=none;
        d=google.com; s=arc-20240605;
        b=EGLa4PrF3BMNkXswX2hBlBhbCgtNeN5J4xILvjwRwGKpZYowctFL0EJF1LJV5fgf5C
         +taTnVj4pAX9dzX5e12tPemEogFWLLwEoznK2QkeGER20inrC2lNgWprqLbVdWPqX7iJ
         qgwc8qGX7BMNOdKaQErxvpzKm8idut+80dspNwVLfrFnnlKk/aUl3FXahfmbqiiaJ6rZ
         bWkEWzQtEk8e163Q5TmthFuWdj9vkmzK9UJsTKW5Z5h6pa0IDK35l6roOw6CsxU7d+jT
         EnvdoE8PlMCGT5NHPE8KOXM7dGIk3Hj5blsi99DHE5idI98hDbsKYFDH4BGkXxsWfZPN
         LQWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uD+XpRTXJADFr464/2XRLz5YgEM5mPrRJn+d8szkbVM=;
        fh=kHiWvLEt8juzWw/Cy0L/jlFX8aQe7ZSrSEmlu0dduxE=;
        b=Up5jJjpDH8iTmzUC9akozfsHC4OBf6x4/CwV7/hJa+fpG+Uzc8CmofQ4OIByTCO2nE
         SIVYxczlK54gLIuIA7x7pkU9kw6P2qcPuQqh/HFGhMp86vLqVBu8kU1dx5Lli5LP4zTk
         PTeYo2RaudTBXmuyKNYbTt1y7tsyGkxrnVzrVNNph4FO/6r5v59ZLrMZfdgrJPhz6IK0
         Qa4MQ/lXwZKBI5LGufgXvjhDPhJ+MmIYDK1gyr+qLNqA2BvKi4fMiw0Qh+vEA30JNsA2
         2GPkKQX9rjQsrRjS5M4uDHZsT0pkd2bQIHoxs5OyO0XE6X8SD67vzKW/UHV6MPB3zpfZ
         9cYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769989865; x=1770594665; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uD+XpRTXJADFr464/2XRLz5YgEM5mPrRJn+d8szkbVM=;
        b=U3zp/f0R3fC+0YzkiLHYgbCIjxCjFyeiEqJO5fq6X9WM1mISIJxapAbmyE6hKUZqWO
         JrtK/pTEY7cwZ+KZU3GMcGVB8rykhw79dM+t4V/CuTOFbFDPmqpFOlNNaeRcvwmyn7Cf
         Cx3piu+IF0GhBxZgM6n3FIPmNgC5Kes9vPKdXxUHaZfACtvYAEgbB7cux6c7LNH7XBKL
         G0PnWg6T8oF66iSBYwsuQ5QuQ7UtfNqg6vyzSBCFXNltAJdjAjo84/LatXaRRZNbGjWn
         1NM1USAM57DTrUnzE9SN95j9DjScEJZUPlIoFpkLCxDnSrYpVRcdm8T0X7EQn7Bi9tIX
         MNpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769989865; x=1770594665;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uD+XpRTXJADFr464/2XRLz5YgEM5mPrRJn+d8szkbVM=;
        b=tcMeS5DtN8hftmMaE+FY9Uzxo2LUEmxegEi1SO7TkAWBOdbSp6T09R1XONOirPU87H
         0Hc6mUdC33EJ3uq7EBzFheJfRDzRptAKAP8gTxhFI5+cVkDrl4HHhmupYW6Sli3z2VVV
         o66FW9pziQzeqz6XOVLObtpC65jv4qM2KIPQTLbTL9ZQBeLoOSr6C5WAsIk/fj8+wxFH
         IHYlEKxLbjrt1/KQS2lLTtrP7ESK/n0N0uXp9qw0geF1Tg8aYbZ0DpEN2nqatNJ8ELZJ
         bCJ0Yerb5QK3mpYF1KvvljC+y3htJvGkFTQO96vCjs7EDSP+eptZ1lSHFK6mxDNcnJyq
         YRZQ==
X-Gm-Message-State: AOJu0Yxm8frM4thW+guZeGQrMHOFPzhGu5XffZSQ9mh7FdBbuorLuKWD
	cCFjbiAXEv12hMEjVGFBmIrsASloz1BrdYvk5tAbInZNW9o5/uHeaFpKEq417ZWRzqa1QXV3/3I
	nBnG+o+tuIvDMM45NZKaq73hRsB5AOqwYW1TF
X-Gm-Gg: AZuq6aKvrAEpaqTRmZxkJ35Si94hy388636n45Tn59MG2OPnEPjZrsoKFz7demgzZK4
	TiQdRIRaMI2Ga6AcHe56gQwedve+ng5psHssIIKotvK7jS4ndk+SJ6OK9cmMBpZoiBCSDmGlrxs
	a44mJ8lygMlE/hKYWWBgSLK6v/HPNVAu3VM2j3ICJVmmkBHDxZ5l9L2DWqZ/L4AR/Y+wqCD4kUN
	C6pJAQZgsDKH9ZVVMzK8atKtkXa3cFVueP0oWS8RyMN+ZWazq2SSbA65hq/OBCZL3hTI6bUFYam
	X7gJ3wdDQrIzFIxN4nV6c9mMwbtg3yRy7p1FxtCOMGJGlxYSpB3LVvxr
X-Received: by 2002:a05:620a:25c6:b0:8c5:31d9:2a7 with SMTP id
 af79cd13be357-8c9eb30e9d6mr1229152385a.70.1769989864941; Sun, 01 Feb 2026
 15:51:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260131020057.46029-1-enelsonmoore@gmail.com> <20260131180529.GT3374091@killaraus>
In-Reply-To: <20260131180529.GT3374091@killaraus>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Sun, 1 Feb 2026 15:50:54 -0800
X-Gm-Features: AZwV_QhmwhKF0LuMODbBk3lyHbEE3yfCfDxwG-jVtCEwQMV3GhH9MGUlCdqUPvo
Message-ID: <CADkSEUhD1fqQdQCopFMK2Ti-F4E7PQxUV1sLRY6G1u7_DrCu0Q@mail.gmail.com>
Subject: Re: [PATCH] media: remove unnecessary module_init/exit functions
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@kernel.org>, Darshan Rathod <darshanrathod475@gmail.com>, 
	Jai Luthra <jai.luthra@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51946-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linux.dev];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[enelsonmoore@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email]
X-Rspamd-Queue-Id: D8DB0C7926
X-Rspamd-Action: no action

Hi, Laurent,

On Sat, Jan 31, 2026 at 10:05=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> Thank you for the patch.
You're welcome.

> How did you identify those, was it scripted or manual ?
Scripted - I don't remember exactly how, but I think I looked for
files that had a return statement or } at the start of the line within
a few lines of the beginning of their module_init/exit functions.

> I would also be nice to replace the module init/exit functions that
> register/unregister PCI or USB drivers with the corresponding helper
> macros (module_pci_driver, module_usb_driver, module_platform_driver,
> ...), as we have quite a few drivers that still open-code that. In a
> separate patch of course.
I will do this at some point soon.

Ethan

