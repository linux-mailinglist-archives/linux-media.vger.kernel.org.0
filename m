Return-Path: <linux-media+bounces-63314-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id asokI1jRHWowfAkAu9opvQ
	(envelope-from <linux-media+bounces-63314-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 20:37:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E31262415C
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 20:37:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ABD0A30241BD
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 18:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39EEA3EA979;
	Mon,  1 Jun 2026 18:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HdGkWpk6"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C2E3E866C
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 18:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780338134; cv=none; b=KsNsM9R8Yd3k+lUxJ250ZrugW55CZTwWxFIsy65+hMJ4Xl+TQmS8nJOOMHPHtUCsgIKwgbOPkvc4r7Il5ZzbCpXJnN6zj09yhHmPNON3tlQYHTqTAZc8CKOoX0+XUUwbiwSIZqezLOcHHbggl0bWabucxKNeU7CLwGQG0fpxg3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780338134; c=relaxed/simple;
	bh=VQuKlvwV4eZQyrRRUuM+4HRf2g3sBNyVBOZ4hFC+pQ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dx7I8TVMpc8zGyaPQ5AadqZLedNtINeNsKmeghn3OCCAMGHJ79cdmI3qikQ8M+pEyNsHO3Nhm+WaxFNdsOqqo+ILDMhEN62VzsMKM591T7YSfMhk9WDvdvseOh/MaTljOTVin49CukRdGtxz6xySPjfuedmvvzC454FbiVFR3dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HdGkWpk6; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21B361F0089A
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 18:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780338133;
	bh=r48NnIlVqXZufhNNAi2X29vwzl6BbMVh195TUth/lGI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=HdGkWpk6WogYcl021MQVs+Qf2DGiLNMMtnGcrvcLYC9aMaxax0eclZtii12vl5BEc
	 zYJ4/sqJ6RN7Az4/UMh75ONCHkyccJnI+eJsa2D4ylgGXXrInXHDE2OVUX7x7oVgQs
	 BTacTKW0btrEkxPEDePin4gjsv+y5gZehi86mIn8CUfrJlo8+qkwnD7/B2tYNva9Ql
	 a3aVeROkjAtcoAXNmSUsqTEdFsJscO1FxawhbdSDTy8fkjkwV7NHBuF/vTpveItbJt
	 S0iGpx9CL0CkFuzvPyK4HiZ5EojyRRT/Sn/d72X1GSgpC55GKJ0uL10sdIb+AN9UZX
	 CbGV0ehB2hNFA==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3966c0d5ac9so22118131fa.2
        for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 11:22:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8b3Udy+NC2w/9vlwmARvfMwEhZCvvtBIk9bShoU+3T4w9D5vT5gfCmU0tWaGG+dSmR3BBbtH09D6mRQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrMvb6q+ogSrczDsdl5r2A385ZJ3uE4fpoFo/XeqCtVK/3OoqD
	LM0jueKoAs+qZE/lQ/eLXzQVdo4opukdcZl2IYq6s2htM/vl6PaL382Q/NxmAaHghdutxWGxYbl
	4r5bR0WgRJjyDDpeTZGhH6O8KpRRBi1M=
X-Received: by 2002:a05:6512:33c1:b0:5a8:64fd:142 with SMTP id
 2adb3069b0e04-5aa73eaac3amr358116e87.15.1780338131589; Mon, 01 Jun 2026
 11:22:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428080513.1833515-1-tuhaowen@uniontech.com>
 <20260528081840.3528089-1-tuhaowen@uniontech.com> <20260528081840.3528089-2-tuhaowen@uniontech.com>
In-Reply-To: <20260528081840.3528089-2-tuhaowen@uniontech.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 1 Jun 2026 20:22:00 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0gvcsowJL0oqKqaG-VFinpb9Rj06KNOkG9XaQ+6wp0Ygg@mail.gmail.com>
X-Gm-Features: AVHnY4I3h_nJVfbBOZ_6CvZ4PvSQtQmTMcd-7ar70x3H_wF8Ob5BeP9NyY_c7dI
Message-ID: <CAJZ5v0gvcsowJL0oqKqaG-VFinpb9Rj06KNOkG9XaQ+6wp0Ygg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] PM: hibernate: add pm_hibernation_snapshot_done() helper
To: Haowen Tu <tuhaowen@uniontech.com>
Cc: rafael@kernel.org, lenb@kernel.org, pavel@kernel.org, 
	linux-pm@vger.kernel.org, laurent.pinchart@ideasonboard.com, hansg@kernel.org, 
	mchehab@kernel.org, linux-media@vger.kernel.org, gregkh@linuxfoundation.org, 
	stern@rowland.harvard.edu, oneukum@suse.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@uniontech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63314-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rafael@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 8E31262415C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 28, 2026 at 10:19=E2=80=AFAM Haowen Tu <tuhaowen@uniontech.com>=
 wrote:
>
> During hibernation, after create_image() saves the memory snapshot, the
> kernel resumes devices with PMSG_THAW solely to write the hibernation
> image to storage, then powers off.  Drivers for hardware not involved in
> storage I/O have no reason to reinitialize during this transient phase.

They do have a reason for doing it.

Their poweroff (or shutdown) callbacks will be called while preparing
to power off the system subsequently and they need to be ready for
that.  The most straightforward way to achieve this is to resume so
they can "suspend" again.

> Some subsystems, such as USB, do not expose the hibernation PM message
> to driver resume callbacks, so drivers there need an explicit query to
> distinguish the image-write phase from the final restore path.  Export
> pm_hibernation_snapshot_done() for this purpose.
>
> The implementation returns !!in_suspend, which is set to 1 in
> create_image() just before swsusp_arch_suspend().  Because in_suspend is
> marked __nosavedata, it is not saved into the hibernation image; on the
> restore path the variable remains 0, so the helper correctly returns
> false during PMSG_RESTORE device resume.
>
> Clear in_suspend before releasing snapshot memory on hibernation failure
> paths and after swsusp_write() returns, so the helper does not report a
> stale snapshot after the snapshot pages have been released.

This last piece needs to be split off into a separate patch.

> Signed-off-by: Haowen Tu <tuhaowen@uniontech.com>
> ---
> Changes in v2:
> - Rename pm_hibernation_storing_image() to
>   pm_hibernation_snapshot_done().
> - Clear in_suspend before releasing snapshot memory on failure paths and
>   after swsusp_write() returns.
>
>  include/linux/suspend.h  |  2 ++
>  kernel/power/hibernate.c | 31 +++++++++++++++++++++++++++----
>  2 files changed, 29 insertions(+), 4 deletions(-)
>
> diff --git a/include/linux/suspend.h b/include/linux/suspend.h
> index b02876f1ae38..78e7e33c3d19 100644
> --- a/include/linux/suspend.h
> +++ b/include/linux/suspend.h
> @@ -393,6 +393,7 @@ extern void hibernation_set_ops(const struct platform=
_hibernation_ops *ops);
>  extern int hibernate(void);
>  extern bool system_entering_hibernation(void);
>  extern bool hibernation_available(void);
> +extern bool pm_hibernation_snapshot_done(void);
>  asmlinkage int swsusp_save(void);
>  extern struct pbe *restore_pblist;
>  int pfn_is_nosave(unsigned long pfn);
> @@ -412,6 +413,7 @@ static inline void hibernation_set_ops(const struct p=
latform_hibernation_ops *op
>  static inline int hibernate(void) { return -ENOSYS; }
>  static inline bool system_entering_hibernation(void) { return false; }
>  static inline bool hibernation_available(void) { return false; }
> +static inline bool pm_hibernation_snapshot_done(void) { return false; }
>
>  static inline int hibernate_quiet_exec(int (*func)(void *data), void *da=
ta) {
>         return -ENOTSUPP;
> diff --git a/kernel/power/hibernate.c b/kernel/power/hibernate.c
> index af8d07bafe02..47047937e262 100644
> --- a/kernel/power/hibernate.c
> +++ b/kernel/power/hibernate.c
> @@ -113,6 +113,25 @@ bool hibernation_available(void)
>                 !secretmem_active() && !cxl_mem_active();
>  }
>
> +/**
> + * pm_hibernation_snapshot_done - check if a hibernation snapshot is ava=
ilable
> + *
> + * After create_image() saves a memory snapshot, the kernel briefly resu=
mes
> + * devices with PMSG_THAW to write the image to storage before final pow=
erdown.
> + * Drivers that do not need to participate in image writing may call thi=
s
> + * helper from their resume callbacks to skip unnecessary hardware
> + * initialization during that transient phase.
> + *
> + * Context: May be called from device PM callbacks.
> + * Return: %true if a hibernation snapshot has been taken and has not be=
en
> + *         released yet.
> + */
> +bool pm_hibernation_snapshot_done(void)
> +{
> +       return !!in_suspend;
> +}
> +EXPORT_SYMBOL_GPL(pm_hibernation_snapshot_done);
> +
>  /**
>   * hibernation_set_ops - Set the global hibernate operations.
>   * @ops: Hibernation operations to use in subsequent hibernation transit=
ions.
> @@ -418,6 +437,7 @@ static void shrink_shmem_memory(void)
>  int hibernation_snapshot(int platform_mode)
>  {
>         pm_message_t msg;
> +       bool snapshot_done;
>         int error;
>
>         pm_suspend_clear_flags();
> @@ -474,15 +494,18 @@ int hibernation_snapshot(int platform_mode)
>          * returns here (1) after the image has been created or the
>          * image creation has failed and (2) after a successful restore.
>          */
> +       snapshot_done =3D in_suspend;
>
>         /* We may need to release the preallocated image pages here. */
> -       if (error || !in_suspend)
> +       if (error || !snapshot_done) {
> +               in_suspend =3D 0;
>                 swsusp_free();
> +       }
>
> -       msg =3D in_suspend ? (error ? PMSG_RECOVER : PMSG_THAW) : PMSG_RE=
STORE;
> +       msg =3D snapshot_done ? (error ? PMSG_RECOVER : PMSG_THAW) : PMSG=
_RESTORE;
>         dpm_resume(msg);
>
> -       if (error || !in_suspend)
> +       if (error || !snapshot_done)
>                 pm_restore_gfp_mask();
>
>         console_resume_all();
> @@ -865,6 +888,7 @@ int hibernate(void)
>
>                 pm_pr_dbg("Writing hibernation image.\n");
>                 error =3D swsusp_write(flags);
> +               in_suspend =3D 0;
>                 swsusp_free();
>                 if (!error) {
>                         if (hibernation_mode =3D=3D HIBERNATION_TEST_RESU=
ME)
> @@ -872,7 +896,6 @@ int hibernate(void)
>                         else
>                                 power_down();
>                 }
> -               in_suspend =3D 0;
>                 pm_restore_gfp_mask();
>         } else {
>                 pm_pr_dbg("Hibernation image restored successfully.\n");
> --
> 2.20.1

