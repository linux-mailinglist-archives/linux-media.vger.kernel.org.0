Return-Path: <linux-media+bounces-59042-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJrSEhBp4mnk5gAAu9opvQ
	(envelope-from <linux-media+bounces-59042-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 19:08:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3E541D6C0
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 19:08:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF9523023DD0
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 17:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F03F282F18;
	Fri, 17 Apr 2026 17:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hRy2AMGv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEF73B0ACB
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 17:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776445320; cv=pass; b=ncqZ0at1kh43CffMiLLokuvhzsx6EfNvUXXJu7NXu6we2/qSROdxlow77fjDElse84UlNPav4/1B36G81XTKUpjnxXvDL7BU96CaWW53b9mv9uOe3Zc7GDH5zIcOiM7i5g2wmN8faNp/In41usUYFr2luaUoDoiGlWoUdqEWdWU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776445320; c=relaxed/simple;
	bh=b78DnSlkUaTdHWKliqPNEL5HD6ix7is74cppKWHsCy8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g48K+F0wngA2jvaOhu9r+4QypDfaF4R70c9k15sOG9D9deuLcnlAFTDXyjDXG9ANiP1tO1uLbYkovLnp1cgzkVFiIAQhVodSlIjwOWiX0XQg9ukICkoZq4hoqOoSass9VXDc6+wp34xLB/kzxbxBqPIOGvAFvVWlgi0XMTIGNw0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hRy2AMGv; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-12c555f886dso1218536c88.0
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 10:01:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776445312; cv=none;
        d=google.com; s=arc-20240605;
        b=fW5MGLtQxDryC+JNPG/6Kwjn5IXoDo9OobPLEziX3taaOuvpxIXpaUSgYYr5Gs9d24
         POy+FdUM5jfVlkzHZU7f2uFNkhZazGK9AkXCUaRXeo5lhj4e/AleKlZ+ew0tDbPlPtZb
         jNeUsQOr8nSrg5T0rDl8FSVXzLB5RGR4QhWrD/u11wcEcS4AAtmdDbOntrTOKZVXCV+V
         wC+YtlyxKLO1IziKxPv2orOAOx+TMJp/TpIaNzjxLzMZX0s+6Jps5nzYRSJBQUGZTxUg
         wjnpvQMVzvd9ukcn6ns6ew8BbeycDfolLQMFHhOYPozpboan8I8G4ZtwqihWbIH9MUpZ
         Lwaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EdXbw8ruQnDuxyXud9pqLO7P6ne13TbWgACZPF9q6l4=;
        fh=/0j1quBpIrctFMEmstdiWwYq4S21EtmCPOKAKofh008=;
        b=a5DY1yCcaGNeQiau0UoY8Q8O0IZCLJq31v+RT51uM5//9mWIyef5hpZKAvbcqM8M6Y
         CKfC1GUNtT72CvbM2xeUlv3otxiLE59qfpK6Beoz7zMfLiCam+ypmtCWr3+0DwdCKPQq
         DXaDP2pdQwn5NI3EmyDaS6/2919DSehxfOq+lKAjTWWqAsDNafKDVCgdLr791Ix+vfWT
         hlRqHS0MfCkWHJ7yMWsg7Z2dpbn8Brp8rDxLcIChvKgML0yMkXBt0lTXUhJYtZlD6ENC
         YKPzCT1E2LB0WnzXl9JU1TamorWebcnwXMtfPA/NPHpio8HmQIkNX6k7agIpVti1vIAE
         Y6JA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776445312; x=1777050112; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EdXbw8ruQnDuxyXud9pqLO7P6ne13TbWgACZPF9q6l4=;
        b=hRy2AMGvo06jECQ4yw6+LjuIIHSgv00gDIrpDR1E9l8G6s19xBHKki2XAsjcX8fno1
         IvFW0Wfty3DtpByq99DWnGacf3oOFWoYukKKryrN3vWh/iLp8SdA4Jcfhu6SyIlKEpnI
         XJGJJVwxbHcEMKhV6zF5j5P3bADiud26P2vxZueF9X7Qv5FXXFjzZ6sEavJME4BwU+Gp
         2Hkw/VhKcbzSVVYyyugURK96rGPq9LDrtV6ngyejJDCxW66M8ijCuGuRn7FZAaatLAl9
         mw6ghNUOLRic5E6psnh1+CHY76b3X0DBXiGazoTtSAsGYvkSYcj57DYLZu58ZeG+0NIn
         0lUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776445312; x=1777050112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EdXbw8ruQnDuxyXud9pqLO7P6ne13TbWgACZPF9q6l4=;
        b=gRiiMxauFcbeUsUk7RPXvs0kcyDGNW3tS1bGdgLlXw8fIEygsjtBZcLP2gKQQBGSNz
         +UrMqCeSLXJlfU+lGHkW7HK37W+K8shZC0AsRIzduwfqoT4faSpeRm8PqlyrWLuTkzgd
         fUXqWuSv5zva7M6LEZ6/I+vRAPvXY3+tS+6MCFypLi9Gbe/3lwyjulwtpEMfsQb961EW
         Lr221Qe7O3NLKR98XyUatMPsPzUqza1GARXvv6+8hO9wyyhwNFpeOEh9zqa/ZhaQTTjI
         08yaRScOYJAUXSJl7IM19AIH/g2zkLvtk6wsDF5monQSshj33jbjtOYAzn60Kpl9Jdg1
         yW5Q==
X-Forwarded-Encrypted: i=1; AFNElJ9542dSWmLi290+16dx6mLPFK3bU06eISOMMWfWBIaM1iD7KZR1vNYioWBt5Fx9DXyRlYQFU3euWOZDAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfhcbiEvtG5GMhKPcmaik4b3i4DWw/zZuhhdJrMB5GWhadjY1M
	DEgYtZ+mLswbwcL6PPmh7Ssd99DsUwsqXKBUwU+g/FG6hoIKXgFxn+/Q+mZ/q0gyjbTiTwqMX1f
	9hZ6j48REoGUb4naSRmdaYVdycJip/e8=
X-Gm-Gg: AeBDiet5PvurUSgWchBrm/cTW7wHF9qZZT5u7ECMKcs5wbDPtdvTednG3Y2thSknXtA
	tr6InJrxOl8QkiRap4fQiifTMPAQ3aL85f8sw/3glm2iVOoYrsxJP3gHTjZIJTXjA3XCLVcBBwR
	SpS8foKbbnYsFUmwlscOgdDooVKr5W1GvPm0rcgsBK+bpemJp5aJ7v3O0AKw14UcatOg4KX/ZD+
	FNAj6u3+ixCcNwDCRyrWqMBXIkvjnFf2S91NC3W1VCh4swM4Nr0eH0tfhpKmhJRfA9AhCeJmJqp
	lNUlkclsHySVI743BAtieGnxK8Mui8dEXZab++OvYLeToY1O3hZSiS9PLCiCoq5+s8sGWkh/n6H
	6Y1W77/5Fb1T101lKBDt7VayrX99RYN7IX5BMJqTjVUTWN4xN
X-Received: by 2002:a05:7022:985:b0:128:d7a7:526b with SMTP id
 a92af1059eb24-12c73f957c5mr1805488c88.22.1776445311456; Fri, 17 Apr 2026
 10:01:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330-job-submission-fixes-cleanup-v1-0-7de8c09cef8c@imgtec.com>
In-Reply-To: <20260330-job-submission-fixes-cleanup-v1-0-7de8c09cef8c@imgtec.com>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Fri, 17 Apr 2026 12:01:24 -0500
X-Gm-Features: AQROBzAmoDifysD6gsakq-ejyyvsk094ITMTDrSQ37RcrzyThndYubnsOWLSElk
Message-ID: <CAOCHtYg6_Gob1uQ3RBp_vrjunJ5F2qi_Yvd6Z0OpKktVXuSuXg@mail.gmail.com>
Subject: Re: [PATCH 0/8] drm/imagination: Job submission fixes and cleanup
To: Alessio Belle <alessio.belle@imgtec.com>
Cc: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
	Brajesh Gupta <brajesh.gupta@imgtec.com>, Alexandru Dadu <alexandru.dadu@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59042-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[imgtec.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,collabora.com,lists.freedesktop.org,vger.kernel.org,lists.linaro.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robertcnelson@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rcn-ee.com:url,imgtec.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BD3E541D6C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 3:21=E2=80=AFAM Alessio Belle <alessio.belle@imgtec=
.com> wrote:
>
> The first two commits fix rare bugs and should be backported to stable
> branches.

Yeap, that triggered on BeaglePlay v7.0.0, Mesa 26.1.0-rc1 and xserver
21.1.20-1 overnight..  testing now (and updating xserver to 21.1.22 as
more glamor changes)..

https://gist.github.com/RobertCNelson/5e1dcf4c648a5bffaaf970c5a50e5c96

Regards,

>
> The rest is an attempt to cleanup and document the code to make it
> a bit easier to understand.
>
> Signed-off-by: Alessio Belle <alessio.belle@imgtec.com>
> ---
> Alessio Belle (8):
>       drm/imagination: Count paired job fence as dependency in prepare_jo=
b()
>       drm/imagination: Fit paired fragment job in the correct CCCB
>       drm/imagination: Skip check on paired job fence during job submissi=
on
>       drm/imagination: Rename pvr_queue_fence_is_ufo_backed() to reflect =
usage
>       drm/imagination: Rename fence returned by pvr_queue_job_arm()
>       drm/imagination: Move repeated job fence check to its own function
>       drm/imagination: Update check to skip prepare_job() for fragment jo=
bs
>       drm/imagination: Minor improvements to job submission code document=
ation
>
>  drivers/gpu/drm/imagination/pvr_job.c              |   8 +-
>  drivers/gpu/drm/imagination/pvr_queue.c            | 154 +++++++++++++--=
------
>  drivers/gpu/drm/imagination/pvr_queue.h            |   2 +-
>  .../gpu/drm/imagination/pvr_rogue_fwif_shared.h    |  10 +-
>  drivers/gpu/drm/imagination/pvr_sync.c             |   8 +-
>  drivers/gpu/drm/imagination/pvr_sync.h             |   2 +-
>  6 files changed, 110 insertions(+), 74 deletions(-)
> ---
> base-commit: 3bce3fdd1ff2ba242f76ab66659fff27207299f1
> change-id: 20260330-job-submission-fixes-cleanup-83e01196c3e9
>
> Best regards,
> --
> Alessio Belle <alessio.belle@imgtec.com>
>
>


--=20
Robert Nelson
https://rcn-ee.com/

