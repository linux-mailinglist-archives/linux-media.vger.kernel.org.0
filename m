Return-Path: <linux-media+bounces-56584-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Bd7CbNBvmmhKwMAu9opvQ
	(envelope-from <linux-media+bounces-56584-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 07:58:59 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4D42E3DD2
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 07:58:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E66B30584BD
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 06:54:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50E91374E5E;
	Sat, 21 Mar 2026 06:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EOwZcgjF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701C537417B
	for <linux-media@vger.kernel.org>; Sat, 21 Mar 2026 06:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774076059; cv=pass; b=PGG8V/sHL8iDMEM6HQ3e6HyjqcOu0t8z9urLp0YTnXEu/9G1xP6e56t8Qp3zyGp676prZ1QF2EJj/AVIuUoXZNP7NcA2Bh4uUo7hKi/2R8eYaSuX6f4M5eTCEDFZKDNpqSpApSOeMYTwrytsvFQymHc4y5YpVVTRy+dS+L6nZgY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774076059; c=relaxed/simple;
	bh=MbIxk44fu2xuOaMBzYw8jG4/PPhvqs4IHRP9dDfBPzA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gTZCMXIsPEqofzddSPVDzQ3mw3gzXBCKazIln0FPDvAgXFiGGRBuqoPSYkI0GAoGkDuHrLDY8aN9O35y62owGk4CrMDPOKHvmAiq+tqn6xlXJ77pXykv4DOc/uVC5ccfe4a44NIzqIc+hGvjJ49oAOgBkVdt2gKUiEHTabg4qS4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EOwZcgjF; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b9841aecf72so118592866b.2
        for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 23:54:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774076057; cv=none;
        d=google.com; s=arc-20240605;
        b=EfJfmb77H4+pyiky8xhiv6P7MxLlwCnAk4phuq4JqMNUWJY4RojN9DfNKsAGpK3qll
         3CR0Hj1UE10LcQNC6ZO4GjGy+jatRG1wh3OSGLfPGaVCKMoEKAfhoPaNnqRCV49T+Nsu
         7e4nkdbkduNyfFQ3hGBtPgLjS2rrWIy/8reWBSD9le0DyU9HH+d5B4MpW97tWrNcFwIh
         X12wiNLLd1d4QuK6Qri+12Me6FPNjjMd46bR5QkgUE3wtHM/1xeC9pJd/XvSi7olOgVA
         NcBpYNUKYPJ5dj682fS95RvTKAjjDc4DNZ6xGI+l0oJRh+Yrg6iKryj7C6WwENC7hfLm
         +LBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Tbl+o0FBCsTBj4CkROI9ysmcgdS1EFqniJjzP33wZX4=;
        fh=b498syp5b5NuHg1tcMpA6qBJG5sv1B6UMN2VMYK0R80=;
        b=NyWBtOjpUu9jh8rj2Dx35Eo4tLFKjf5E7+bohJCqM3CJ9ZJwgTGNz8X9hhoSp/l1uh
         xzEV3P/zHOn1kHneFt2VF4JAfqsvJgMSm5VXGmOzr3T3MywLy4DBprBtEeWd1NlF6kQF
         wZLH5RFoDBwhtTCOgJCb5xeZjbsIpjAKPWyef8CgpOeO3IFVP5PUFlHb6c9KMEvSOMeH
         w9ugsdqnIH2dj37AMltj5oGrOrZ2KorosmecsQDX8TQGZvOsAmY3IvIOu9RPEJtjuiG5
         nv8DYytNqz9b5F4P3Gz1uUi8J0kwOgbQMXeTGIdmg7aArnnmPheDvz0yl1XXiwzFxys3
         uN0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774076057; x=1774680857; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tbl+o0FBCsTBj4CkROI9ysmcgdS1EFqniJjzP33wZX4=;
        b=EOwZcgjFEDIXeV83SI4pzrh1Kl5XqLTwO+CVrdO4sK8Ftm+Bk6BGiLfHKr5YDaSPir
         9n62+ZI7JDIUtCfmVjNNR35jSAMch2j6+GdKVj9AnI2zzc3m2jkhO3ndhj7IkRoh5mwu
         lCprau142HDxqSrxiZqPvKjBzU0UmuqrRVWQQK2OwGZfbanrQFr8ZmefFqQAfuX819c9
         r3yIwjdZvjD4tOZVMr5yHOJvuHUsoit1QtcBzOervfLPiK8/DrI7zVMyicf2NXO7LW4A
         aeCqxC4ZObfSdFcLfutyHTPIscTuUfCAXSRRVBGONjkINixYq2uD3egO1p5UzqLcqk0B
         VzSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774076057; x=1774680857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Tbl+o0FBCsTBj4CkROI9ysmcgdS1EFqniJjzP33wZX4=;
        b=TeVsGiQQAL9PPuGVUjFlIgTJhrovqLfRBFVc0EG+/ZP/dZozex3qOPqoXyuenaY+aU
         NhitvTeEzh3YSoKgOpsCWOfcpqXYicTfkBNT6uQ3BasWzaW625NVpVZYO7iuABwkJos3
         8qGwXdrE3+rd2aywAGWcqxSAvuq6ZkAGEc4DtNusM/pP+KKCXthiweOfPXpWzmvT6YtS
         e707jYbZDLHGX9GgcUQOCkLFjk/M6SyAhk2yK9jdXdRM1M0UmBsxlsYG5/8kZOe9RQMx
         8QzXC522WT/znl9LckCObsmV+49RCiEmujx09TEhudmSZlUPimifJbZyjvvcwcXbBOef
         ZZhg==
X-Forwarded-Encrypted: i=1; AJvYcCW/rAQJndOtp3kFp7aSpFLgvbUE1qcdd1QMwSfN5sNnEkmF72o2UvYn5cAhWM9IPXotslm7mwfdOiSRqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yydqxl4iTJGdu6Ug5MHtb20jcVRAI9libvz2qGm4vDpbikW88nQ
	VX2wGUhD+Edp2CCfJhQjUdO5yvyuPAbRaql+3AoIf/zn07FUfWiZoDEAWK+7D/0C9K6A30jgcr0
	dLBQqUXX7PKAtFB0y+8B4Uy8d/OAfedk=
X-Gm-Gg: ATEYQzy4HiG9JFhwQsT/rdeQ54avftX6kgLraCjUyxYOWH7gLPejjdfuVXHxjm4ULsz
	8t6pGeUJMSGlWjhdOaEjWRUExkhOp4bxaP0gMENQY6QUlot8peNHaP6AAFChBTpK6ozklokS7ZC
	eX3J6+pe+PQDqVuQrW+gqN6WFQ/N/ea1Z1njMGXFGFv9dx/u9M0PDbcpvH+/uecfSjItXZHlqjV
	Apvc8UT7gogjkvhKX//3SN1e5V5+0UQPMxN8Sht8OlCTgzG+OdcuBkeehlSfpaJbCHY8fgKyaTJ
	rjIC4oIx3hR8a7wu
X-Received: by 2002:a17:907:d109:b0:b96:f6f1:e7af with SMTP id
 a640c23a62f3a-b982f1ed7bdmr419710366b.9.1774076056402; Fri, 20 Mar 2026
 23:54:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304100557.126488-1-linux.amoon@gmail.com> <9db109a657e18d1e5ead67d7db06cfaf68f7fa84.camel@ndufresne.ca>
In-Reply-To: <9db109a657e18d1e5ead67d7db06cfaf68f7fa84.camel@ndufresne.ca>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 21 Mar 2026 12:24:01 +0530
X-Gm-Features: AaiRm522SeNM1abZw4YAK4uXkmRkLpmLZXI60fMElcfZGsZpbYfOo6oOjvIO9yA
Message-ID: <CANAwSgQ0N3wmJF2s_fuQN8GWvoYrrgg09X2cMnGFiyM+5U641Q@mail.gmail.com>
Subject: Re: [PATCH v1] media: meson: vdec: Fix memory leak in error path of vdec_open
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Maxime Jourdan <mjourdan@baylibre.com>, 
	Hans Verkuil <hverkuil@kernel.org>, 
	"open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS" <linux-media@vger.kernel.org>, 
	"open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS" <linux-amlogic@lists.infradead.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, 
	"moderated list:ARM/Amlogic Meson SoC support" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56584-lists,linux-media=lfdr.de];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,linuxfoundation.org,baylibre.com,googlemail.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linuxamoon@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,ndufresne.ca:email]
X-Rspamd-Queue-Id: 7F4D42E3DD2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Nicolas,

Thanks for your review comments.

On Fri, 20 Mar 2026 at 02:05, Nicolas Dufresne <nicolas@ndufresne.ca> wrote=
:
>
> Hi,
>
> Le mercredi 04 mars 2026 =C3=A0 15:35 +0530, Anand Moon a =C3=A9crit :
> > If vdec_init_ctrls(sess) fails, or any subsequent initialization step
> > during vdec_open fails, the control handler allocated for the session
> > is not released. This causes a memory leak of the v4l2_ctrl_handler
> > and its associated control objects.
> >
> > Add a call to v4l2_ctrl_handler_free() in the err_m2m_release error
> > path to ensure resources are properly reclaimed.
> >
> > unreferenced object 0xffff0000205d6878 (size 8):
> >   comm "v4l_id", pid 5289, jiffies 4294938580
> >   hex dump (first 8 bytes):
> >     40 d2 49 18 00 00 ff ff                          @.I.....
> >   backtrace (crc d3204599):
> >     kmemleak_alloc+0xc8/0xf0
> >     __kvmalloc_node_noprof+0x60c/0x850
> >     v4l2_ctrl_handler_init_class+0x1b4/0x2e8 [videodev]
> >     vdec_open+0x1f4/0x788 [meson_vdec]
> >     v4l2_open+0x144/0x460 [videodev]
> >     chrdev_open+0x1ac/0x500
> >     do_dentry_open+0x3f0/0xfe8
> >     vfs_open+0x68/0x320
> >     do_open+0x2d8/0x9a8
> >     path_openat+0x1d0/0x4f0
> >     do_filp_open+0x190/0x380
> >     do_sys_openat2+0xf8/0x1b0
> >     __arm64_sys_openat+0x13c/0x1e8
> >     invoke_syscall+0xdc/0x268
> >     el0_svc_common.constprop.0+0x178/0x258
> >     do_el0_svc+0x4c/0x70
> >
> > Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> >  drivers/staging/media/meson/vdec/vdec.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/=
media/meson/vdec/vdec.c
> > index 4b77ec1af5a7..a5ab0c2390f5 100644
> > --- a/drivers/staging/media/meson/vdec/vdec.c
> > +++ b/drivers/staging/media/meson/vdec/vdec.c
> > @@ -914,6 +914,7 @@ static int vdec_open(struct file *file)
> >       return 0;
> >
> >  err_m2m_release:
>
> This goto is used twice. The second time is when vdec_init_ctrls() fails,=
 and in
> that case the v4l2_m2m_ctx is leaded. Can you add the missing label and c=
all
> v4l2_m2m_ctx_release() accordingly. This way we don't have to revisit aga=
in.
>
Ok, understood, I will update this in the next version.

Thanks
-Anand

