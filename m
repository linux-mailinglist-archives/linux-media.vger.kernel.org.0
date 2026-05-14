Return-Path: <linux-media+bounces-61620-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKJXEuYVBmp3egIAu9opvQ
	(envelope-from <linux-media+bounces-61620-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 20:35:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABD3545E94
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 20:35:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ACE1B3060C80
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 18:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADA1439C63E;
	Thu, 14 May 2026 18:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l1PXF2L0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5D33469E6
	for <linux-media@vger.kernel.org>; Thu, 14 May 2026 18:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778783706; cv=pass; b=JYi2aOkiSNAYU1S9Fcm1WkAygXe/SUICoFhjelsfneNxHrlAXT88e3ylDKIHOlBR2cRac/XoykfWnPPX1xHxrMiLoP5sQrmud3iPcCmLL+T/BlmbqPyDcRn4bli7hZs8Mn2EfxAqq3a/xCryN9aE6HEBa91Ai+yQzCcfzh0wA2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778783706; c=relaxed/simple;
	bh=F9S7UmWfk9BcH+7YN6g8KV7ShqopaeFLV8XmOGnSBH4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f7a+BcTFO9uv65VvIi1KshQ7JH1HVRLjxk2/aV1J5v/+ZXYXJ2UMAGJOF+170v+w6qAvnXCoH3jVXhWyW358PwqSmda1gbmAF8msm/zlTUvXM/3a6Z2dOKCh6ToFNOhoFwGTwj0Bw6Eelkwv2GM221mTnJZJ2mvOMgBfR5g1LY0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l1PXF2L0; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-65c305f381eso11098914d50.3
        for <linux-media@vger.kernel.org>; Thu, 14 May 2026 11:35:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778783704; cv=none;
        d=google.com; s=arc-20240605;
        b=c4NA5y57bVXE63YStH6aAvTX1qHbVflF4biRNhaQEZM+NWMzeynSOWyyLbYWIUZBoT
         mkN7WhiMLA/iOc1E0dyUc71Tim+NblS1DqFDbbti3ObCsppG/rwjTAORWSw43IFW9wRJ
         VaJwRNnegft3xFP45ReQ3/8VsDfsgX1DCuCVetYnphbhiR3h20u6QglHJI/oxoKoFz9s
         HHVGcRy1CwowaWwncbvKTtOEFbZP2ViRSO2M/Vu63H/8S3pqGideb56A4Vz9UzmjW2KQ
         rXAZy/Zi3Y3rBDtNYLoDYT8Im6kvRDG9UKbLXZtjJojPY874i6HN1+vX4NuWMsa/bvDu
         wA1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J//dZe/CVmScZjUaogVteeXVlNwNW3S4gHbIIPdEbvU=;
        fh=hQ4jiGBqeCWjs7EZHr/LmsnCx6HbGMWfitvBOgmgqjw=;
        b=lODVqnWJ4N0wVQNqfTINenSR64YCIpZdWgVDQ71IKteNiBNdkTblCYPRFk+ivemRCF
         450LsHNzXA9q1lAphAV8aEOfEwv4Lr6vJsvFs7e4jymgRnr47T3UoH0ypJFq2tBNIJ2C
         en1HSNgaDeJJqXtK9In70nDTmWhRVVq1smoezDR/EWJTs0DewWxakMyb0EE/1mTnxopD
         rdhXovNxcx0uDuqObhD5hywCnM1dtE6XNZSr7eJBqGT9xfWaiaXjw27CrY47EFGwxkLZ
         vkkdJMmpI9fPGRqqodlEL6IrQoNavC1lmK6Y060v74seA/5AvQNyUCUajNdyqJHDxRuI
         hRxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778783704; x=1779388504; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J//dZe/CVmScZjUaogVteeXVlNwNW3S4gHbIIPdEbvU=;
        b=l1PXF2L0jTyeL39SSJ5fSutO0b+/3NDYFUmtOp8Y89ATG2MI+oPUlxrevGgTTdqhMh
         zOSnQDxbW+5IoUrlJaFsWt+6hHlo0yhQ2eLcR47AeomGFBUxcLjA9pI628djdH1qsgHt
         +TZx9Mm8ZbOpjLbUuhNTj1R2dxqmTa+PMTLMsjAONtshxQyXmjWkMCas/W7eSZ1P32te
         KW3XCV3yOHDM7k4SencKW2LBrzkycC4vIOZ4O28I3RnJWw6osRIl8OV0TA8vbdajZoNc
         CZHHX4cUXIlwol77NmETuoqi3DO93frRSgLs0RgJm7stl8OVNcGSIpvnL7HsEywtc3Dz
         M9RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778783704; x=1779388504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J//dZe/CVmScZjUaogVteeXVlNwNW3S4gHbIIPdEbvU=;
        b=Fl0PTOpZSLuun4AJAwBqTg83f4Btsf5LfzFx/HD5TnCD7k12wTgj43Z4UyozizCtGP
         e6g2hs9UXd/S3/GaKm7yQYVKUkuxPp235jJJrjLGLoypTGkiqHdwWNuc61aGYCMu/UIr
         BiISVjwpA6R2otI6g7iK+ujrUn1RBeaOvE9LCWlMtldxS8YuC7Qv7Tsox1IiJchiuFIq
         QvdbKcb0XMOCyBkpMCUNM2weNHmBsoR+cDOO5TLyftobRlHkCYH/tZsKgKEDJOAeZ87M
         uB7AJPcfuMJqfGcaDf7u+OBcuoGpiCrBQmJY/vVj3tVQZOwSvBnntTTxJTiTL4u1pqld
         y2sw==
X-Forwarded-Encrypted: i=1; AFNElJ8DAbHqfk/91z2FpI5uqmGwkSKQXKn74W5E3WdXzHhY0TIQljNex2bMhsxKzXQzJiFfs/TGSlHi0hieoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YziwHGYuBhEdym+TzwB3VtuYiV894b53vGKTaLzpOqXMnjg+5Op
	CjvqTp3qJ2aHGtUXK2xKlm+kSHynIudTOu8ygCthk+6AsB5qXnONMhF1a+rSpYhi3dsXKgpKqz/
	3YUgKhlnMMuSWMJiZ/2FzD0McBv04Z3A=
X-Gm-Gg: Acq92OFvyjpdxRX0PamqBCesyLVVjJ1d2G1IJxxmB3cqsbI0Z1vf/7KqJVg7Kevn2TK
	A2+nkiXq/ClJvp8evJ4OETs4UKlyywZG8JRoUdFv+ghB2FB050J8Yc6umeXmf0tRl9x/62L3rzN
	P28JZzDGmwRX4qzAHjhxgfPgMPv+hELiTI71B+n0ufpl9gqrymd95MsASv4CaTwvffjZv/cZq18
	M/HKfea/uj28gC1lMtBYks0vLpSXizgULdR9ZZXc9lFjH9MkC3rKo53eZ5rHAR2rU1kuyvVwkfd
	KjW8W+zqX5tAmpJZ53h8cttN8ZKrQ16qgEcu46/uAKvR3Xssem4nNxdb6GyPHnD0b1aoWzJTwQ=
	=
X-Received: by 2002:a05:690c:60c5:b0:7b4:b591:e79a with SMTP id
 00721157ae682-7c95a5700dfmr5776747b3.14.1778783703586; Thu, 14 May 2026
 11:35:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513-panthor-guard-refactor-v1-0-f2d8c15a97ce@collabora.com> <20260513-panthor-guard-refactor-v1-3-f2d8c15a97ce@collabora.com>
In-Reply-To: <20260513-panthor-guard-refactor-v1-3-f2d8c15a97ce@collabora.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 14 May 2026 11:34:52 -0700
X-Gm-Features: AVHnY4J0ZfS6wqY8kezEbJgIA7LKzsoOFo2DBZGmkU6Uvlx4juh1BMI8h0we3pE
Message-ID: <CAPaKu7TULU6_-8eoygq0svBTbnX-vFvF3sH5hDzyi9kDP-9enQ@mail.gmail.com>
Subject: Re: [PATCH 3/6] drm: Define a conditional guard for drm_dev_{enter,exit}()
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 9ABD3545E94
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61620-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,linaro.org,amd.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,lists.linaro.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[olvaffe@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 10:24=E2=80=AFAM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> Define a conditional drm_dev_access guard to automate the
> drm_dev_{enter,exit}() sequence.
>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  include/drm/drm_drv.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index 42fc085f986d..79d1958f93e4 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -490,6 +490,15 @@ void drm_dev_unplug(struct drm_device *dev);
>  int drm_dev_wedged_event(struct drm_device *dev, unsigned long method,
>                          struct drm_wedge_task_info *info);
>
> +/*
> + * Only the conditional drm_dev_access guard is valid. The drm_dev one i=
s
> + * here so we can extend it with a conditional variant.
> + */
> +DEFINE_LOCK_GUARD_1(drm_dev, struct drm_device,
> +                   { WARN_ON("Use cond guards"); _T->idx =3D -1; },
> +                   drm_dev_exit(_T->idx), int idx);
If this is ever mis-used, drm_dev_exit(-1) seems to cause OOB access.
Is BUG more appropriate than WARN_ON?

> +DEFINE_LOCK_GUARD_1_COND(drm_dev, _access, drm_dev_enter(_T->lock, &_T->=
idx));
> +
>  /**
>   * drm_dev_is_unplugged - is a DRM device unplugged
>   * @dev: DRM device
>
> --
> 2.54.0
>

