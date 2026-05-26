Return-Path: <linux-media+bounces-62801-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGa+CcikFWqJXAcAu9opvQ
	(envelope-from <linux-media+bounces-62801-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 15:48:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF02B5D6D6C
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 15:48:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6217B306CACB
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 13:43:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2C713F7887;
	Tue, 26 May 2026 13:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NRCIkDgp"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BB63BBA08
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 13:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779803005; cv=none; b=Ol50n3VypVRXp+sXH4bdG+ym0hNShLoUn4f6OkZP477mXOxcc8I7hW1s6zeXrN11kZF33Rz+IfjPQVSqBv6IG0XZUcGAlVXRmEUPUrAzBMNNvmmEttJoWefQ95Oka7OLOO5WBCnNSOldZ855hI6f3wQgRbDqehVjwxq8ouOzvjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779803005; c=relaxed/simple;
	bh=CCUoa61mcLwr4VdtCOvNq1W/mDB5D3Lw3OdOf6V+5sQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nZB09r9hfNFAzflqRidxro7fQd+llQJpJPOut+3l0BMzcGr8g5s35fcm8yEunMzwcI/cw/gOF7HBN42a4PtucrKvNWaLQL9gzeME5MsnKpsRsPTB8Jg8901pVkEzq2ELfcnNnZL8fdtSq3oNyWbThuDaHOMTpMBsgAdZbJ+h9nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NRCIkDgp; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B8B61F00A3E
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 13:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779803003;
	bh=onYU15ZSswBDHBQgYer7fqI1iFeWN5ErEBp+0R/HHLE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NRCIkDgprGfJuzHo53TGSQKHMvVRujnpQIcHCHxZ7xtX8hiLBHua1nujl+Jyq1b59
	 oh+xHjgvuxRCNQLllzB277b+IRUBkOXFIZTnWpiAdffCv0lreIB6QHdN6VbM9H36NX
	 pZkD9+TkEvgz9rOmCObY3HoIZkJ43gOid5XW79WEaCc019n9TnAk9ZKtuP4/k53z9v
	 nPHhxHxNaS5w07xj00/Fi87RnUvC7uADQ77lzzTZm/uaEcwX4p1DDFZdLg/FvFsUeS
	 dmDjjYrHy4+edwD2+bHyHbpPK9Z9k3wHcyuHFx3gxyekqC1N9Y3SQCzXprngWoKlsv
	 kBpdArtfY41gw==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aa1b2327c8so12196874e87.0
        for <linux-media@vger.kernel.org>; Tue, 26 May 2026 06:43:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ90SDg5Bh7IqFIkcrzsNR9YdJP0ZbzH7h95NacZ9pCymL3dGylI92yIa/vj0upxJNaWGwd/jpxWLzDJ4A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl5taZ+IFiDpjCHG1wZdYs2JbjfIqYTFYb0UX61rkdeUwjsGxi
	f07EOVyqYhBk71Fs7OX/VxkKDLcTNJE/x9M44/hDbLm4CKJKW1EM/Ipa0o2XfOKsCp4zT1o9lBx
	TBXECFQcvnBMeVXVfXxUhZqo4wK5YvUQ=
X-Received: by 2002:a05:6512:388f:b0:5a8:6eb1:2b6d with SMTP id
 2adb3069b0e04-5aa32314263mr3942928e87.9.1779803001849; Tue, 26 May 2026
 06:43:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428080513.1833515-1-tuhaowen@uniontech.com> <20260428080513.1833515-2-tuhaowen@uniontech.com>
In-Reply-To: <20260428080513.1833515-2-tuhaowen@uniontech.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 26 May 2026 15:43:10 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0jFUemrBWNN7=NXPPRb2cHk=ZJG5VaNhaE3uD+NRSn6tg@mail.gmail.com>
X-Gm-Features: AVHnY4I5KRc6L49SOodcQ5gG3nbXpyhw7M7qfvjIEKl2Xcr2-_6AJAkN7-v7xdI
Message-ID: <CAJZ5v0jFUemrBWNN7=NXPPRb2cHk=ZJG5VaNhaE3uD+NRSn6tg@mail.gmail.com>
Subject: Re: [PATCH 1/2] PM: hibernate: add pm_hibernation_storing_image() helper
To: Haowen Tu <tuhaowen@uniontech.com>
Cc: rafael@kernel.org, lenb@kernel.org, pavel@kernel.org, 
	linux-pm@vger.kernel.org, laurent.pinchart@ideasonboard.com, hansg@kernel.org, 
	mchehab@kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62801-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rafael@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[uniontech.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: EF02B5D6D6C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 28, 2026 at 10:06=E2=80=AFAM Haowen Tu <tuhaowen@uniontech.com>=
 wrote:
>
> During hibernation, after create_image() saves the memory snapshot,
> the kernel resumes devices with PMSG_THAW solely to write the hibernation
> image to storage, then powers off.  Drivers for hardware not involved in
> storage I/O have no reason to reinitialize during this transient phase.
>
> Some subsystems, such as USB, do not expose the hibernation PM message
> to driver resume callbacks, so drivers there need an explicit query to
> distinguish the image-write phase from the final restore path.  Export
> pm_hibernation_storing_image() for this purpose.
>
> The implementation returns !!in_suspend, which is set to 1 in
> create_image() just before swsusp_arch_suspend() and reset to 0 in
> hibernate() after swsusp_write() completes.  Because in_suspend is
> marked __nosavedata, it is not saved into the hibernation image; on the
> restore path the variable remains 0 throughout, so the helper correctly
> returns false during PMSG_RESTORE device resume.
>
> Signed-off-by: Haowen Tu <tuhaowen@uniontech.com>
> ---
>  include/linux/suspend.h  |  2 ++
>  kernel/power/hibernate.c | 19 +++++++++++++++++++
>  2 files changed, 21 insertions(+)
>
> diff --git a/include/linux/suspend.h b/include/linux/suspend.h
> index b02876f1ae38..28b454def83d 100644
> --- a/include/linux/suspend.h
> +++ b/include/linux/suspend.h
> @@ -393,6 +393,7 @@ extern void hibernation_set_ops(const struct platform=
_hibernation_ops *ops);
>  extern int hibernate(void);
>  extern bool system_entering_hibernation(void);
>  extern bool hibernation_available(void);
> +extern bool pm_hibernation_storing_image(void);
>  asmlinkage int swsusp_save(void);
>  extern struct pbe *restore_pblist;
>  int pfn_is_nosave(unsigned long pfn);
> @@ -412,6 +413,7 @@ static inline void hibernation_set_ops(const struct p=
latform_hibernation_ops *op
>  static inline int hibernate(void) { return -ENOSYS; }
>  static inline bool system_entering_hibernation(void) { return false; }
>  static inline bool hibernation_available(void) { return false; }
> +static inline bool pm_hibernation_storing_image(void) { return false; }
>
>  static inline int hibernate_quiet_exec(int (*func)(void *data), void *da=
ta) {
>         return -ENOTSUPP;
> diff --git a/kernel/power/hibernate.c b/kernel/power/hibernate.c
> index af8d07bafe02..bc632cce40ff 100644
> --- a/kernel/power/hibernate.c
> +++ b/kernel/power/hibernate.c
> @@ -113,6 +113,25 @@ bool hibernation_available(void)
>                 !secretmem_active() && !cxl_mem_active();
>  }
>
> +/**
> + * pm_hibernation_storing_image - check if system is writing the hiberna=
tion image
> + *
> + * After create_image() saves a memory snapshot, the kernel briefly resu=
mes
> + * devices with PMSG_THAW to write the image to storage before final pow=
erdown.
> + * Drivers for hardware not involved in storage I/O may call this helper=
 from
> + * their resume callbacks to skip unnecessary hardware initialization du=
ring
> + * that transient phase.
> + *
> + * Context: May be called from device PM callbacks.
> + * Return: %true if a hibernation snapshot has been taken and the system=
 is
> + *         in the process of writing the image to persistent storage.
> + */
> +bool pm_hibernation_storing_image(void)
> +{
> +       return !!in_suspend;
> +}
> +EXPORT_SYMBOL_GPL(pm_hibernation_storing_image);

Could this be called pm_hibernation_snapshot_done(), please?

Also, since it relies on in_suspend, please double check that
in_suspend is cleared properly in all hibernation failure/test paths
(basically, it must be cleared if the snapshot memory is going to be
released).

