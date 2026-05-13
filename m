Return-Path: <linux-media+bounces-61521-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wK04LHHTBGr0PQIAu9opvQ
	(envelope-from <linux-media+bounces-61521-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 21:39:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE7753A1D7
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 21:39:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F944304856E
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 19:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC4343B7B6B;
	Wed, 13 May 2026 19:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cbAGDnbc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF20D3AD53F
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 19:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778700706; cv=pass; b=s08vS2dAB5KmIEp7O/+9UiR/5mmOtZNR5HdO2Nc3SMKQ3bxZbuKJmnyhotHbYoniqiF5kLLzpGPIgL1ydioO/wZhKHwAnoKGO48Qvv1LDaq1r1XcVZcI3G9P8EBpLgcQRUzsDxhyLcNZUQpTQGqMteMvNN5UXknSPQSuDbm+Xgk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778700706; c=relaxed/simple;
	bh=Fk0M2dahXXkA0FzmVrTU+eVu8F5ePwC5MGTDU99/VtQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CkCdDTUOe4AwbAUOxOOYLzx1nSyXOJr9TYHvzUzWG8MWBhgHNPpOKNWY7CMhnEtLBOJgDf3chuN5rBXVyxw+qfWNFRfr5X4owXSGMKalbEJcPIrIm6cIlYLQ2nmPAz/ykFep4km65/fBlp8cjOYe5Cnb6gtBPMhRsPJuRbbnamo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cbAGDnbc; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-64e87a81639so8241872d50.0
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 12:31:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778700704; cv=none;
        d=google.com; s=arc-20240605;
        b=O8zdzTtorSfIBdt8rbaN3qdEqrotL4uPAaty2iSyDciUM0TPx1+sPcPvG9MjroC70b
         unfq+v8fL42yed7JXW6Ri0cCH8SrffaSUO1EL/1O7Eq98zAk5j24ZUZIOQbmrIqfUAnJ
         TKiGYoYluTX4JVBi4WadNpI+D+Ygq/wAgD3VfELGx69HUtU+ExZ7AeJXstzIJVqrXsoY
         0p7DM68UuT8IWMRK52vyeQQP6EmLJ0vRhhgUpCzoj8mbNcRnSrYpeY+q8OYMfFvYob/5
         yHxSqhuEL7nx6f3v/7WzR9jobXFql/cyJwfyHvtgBlsolpsCNCiybeWcrOGaTEjRxCl3
         OzlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g4Y3i2VzEUpUrHnVXfd2puXKp9894xeLrJot7HkksF4=;
        fh=yFcV0ay6gXXFbE9gLcDWtbnCC5C6rqb8fbL96T4vP14=;
        b=hSRwYO1HOiD0d3eofn3iUxX3+iUd7jkgX2tAkkhHlBcAt/eYa/DLKNspLb3VxRgHGQ
         dd0e/MyV2Lya0GRXLRPO0cKOCKbSCrbIiB5BVwo69gouociYQWNe1PGdTfmWKWjqmMav
         ngZJthVFrsOgTrez9/wg6/LIQdXMHZuuyQaGLynvJt4sDDEGCCdNa19VPTW/PXzPcH3Z
         gtEtP6G+PtZSeWvabz01tExNcOTbvYlIDvm6yfMxOPj+oh9y0/buLC9p4vw2mpcqCjH9
         VIJJw7JWiagF8eWZBfB/UJvGymyNRneI8NK97CDBFJJcemvADxHTih54XQ5RuMHvh1Ty
         0MHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778700704; x=1779305504; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g4Y3i2VzEUpUrHnVXfd2puXKp9894xeLrJot7HkksF4=;
        b=cbAGDnbc9zpvmC2GS6AwSjpegkTu7dCD1Kaql9tb5ryHVu9YliSoFrd8aC1nXCxeQz
         P+Y37Dyv6wAO9evtjgWBCofjkwxOhzTGbMfCD0q9zsCea3MCZhayzAzreECavBu0Sto0
         PXaJJhgSvX10X5//H0gNMaDApwvcIEr4GzFHBzjC4t5KrtX7TFZ4Z4zu7La2Bbf3jNRP
         n8bpwFGQFMY6r/ZjTpP58SQYx3zXQ2rVeXVRbi0JQkl5F18MSXXxNychInBtg1C4i2qD
         O+DrwttVupz8Usp2FmZPl6sKpRdZCusInItRuUcTsIWtQlCVf5/3I7AkK9QhdPBUukYl
         CCPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778700704; x=1779305504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g4Y3i2VzEUpUrHnVXfd2puXKp9894xeLrJot7HkksF4=;
        b=lAIRw74Y8RXvLLD6C1VL+r+bODTcSIt5n/sEKZ+y838rjkpUeeJibKokOzGwJ1wYZ3
         kN2KUUWMOHt1zj8i1gFzP1nWhy7hmgONCuW3pCq+JjOopVc0SihIu9Fa8ixgmh5/JnQF
         VwfgXjUkvhXnUhFIpKSTgW+ciqnfNe//Di0eLwnkuuiswLvWhIkTX/qMv5NMIhk6l3K1
         +Ialuf1VOXJmE5geZWww6yM7B/G8fTejGliZkvQQGo95mizTQVvP188bdM5kfZFs4qXi
         vC7gZqLRaOWfq8e3fZpmr/5mht9Stdkt63uh9jTGMgWiungRY+fSsSWIHP9ojQ0IJDsN
         YZSQ==
X-Forwarded-Encrypted: i=1; AFNElJ/9ltihkhKIu6dWfm+Aohu7wiMUIXGu7dJ1PzO+9ljkUUzeeT9f5b8Fj2eMYRchzguhr8F6X8Xg5jgrtA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQSVyX1zMgKL6fGzq2S3/zm5s7b4liryjK1L4P8Vqg4aZyPqLW
	8lTif53MtQwfJxPROpU/TAwNYoSw1PotiwZjVypIyn15hyeJTiH4LVf05cUokBXHVBUKGR/c0eS
	mXdjVBrV7znSUrXoQAy1c4wdiu8ADri0=
X-Gm-Gg: Acq92OEiuCfmXLyuaRBhgL+tI0c8t8Fm73L2pMHmLTzMT7be7s6mKvr1jge1bghAsYA
	kPyDrwsTVnEW9vqwlOp3aMprits2SbsyxShtz1OaiQTVIgVNlT0LGAzeYbp57vEI8bWVqAgn5r9
	FLxPgYfh5nzt36uTO93NzDtk6dgBSfEPlsCk2ITxqkhxGGmS8KF8kZeG2VTH5Yv4Rw1SvEjiZ5/
	BkJK+431bnqp1f4XXjwWMJm8MqdohAG1G3AjsrCX6u3Phq8hDiW+ejHN2bcAA+cry3ONA/H4U/z
	fd5ZEVlcdBx2DYnY7XrNO+8W7bvZrUJVVA11IhRtiife8QOoi3r0DyCwdzGBCivPBQ6lFVSU5w=
	=
X-Received: by 2002:a05:690c:38b:b0:7bd:a50c:454c with SMTP id
 00721157ae682-7c6da2152a8mr42579647b3.19.1778700703738; Wed, 13 May 2026
 12:31:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505140516.1372388-1-ketil.johnsen@arm.com>
 <20260505140516.1372388-5-ketil.johnsen@arm.com> <20260505181523.49a3d85c@fedora>
 <afxVIuVVPisBQ9p_@e129842.arm.com> <20260507135356.5428d50d@fedora>
 <agMvb_jeRsO7tSS-@e142607> <20260512161111.0cb7000e@fedora> <agNJasayW8VCHTiU@e142607>
In-Reply-To: <agNJasayW8VCHTiU@e142607>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Wed, 13 May 2026 12:31:32 -0700
X-Gm-Features: AVHnY4JH8Ip_tVhSu6utyw5cZH7Mreif1YmCt2t2xjBKPcGuoTWdGxm_i0T-RLg
Message-ID: <CAPaKu7QC7FdjL6m_OSb+E5aYKs6bmT-9DAHc5PC=XctCmRph2Q@mail.gmail.com>
Subject: Re: [PATCH 4/8] drm/panthor: Add support for protected memory
 allocation in panthor
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
	=?UTF-8?Q?Marcin_=C5=9Alusarz?= <marcin.slusarz@arm.com>, 
	Ketil Johnsen <ketil.johnsen@arm.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Steven Price <steven.price@arm.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Alice Ryhl <aliceryhl@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Florent Tomasin <florent.tomasin@arm.com>, nd@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 1CE7753A1D7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61521-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[31];
	FREEMAIL_CC(0.00)[collabora.com,arm.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lwn.net,linuxfoundation.org,linaro.org,google.com,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linaro.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[olvaffe@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 8:39=E2=80=AFAM Liviu Dudau <liviu.dudau@arm.com> w=
rote:
>
> On Tue, May 12, 2026 at 04:11:11PM +0200, Boris Brezillon wrote:
> > On Tue, 12 May 2026 14:47:27 +0100
> > Liviu Dudau <liviu.dudau@arm.com> wrote:
> >
> > > On Thu, May 07, 2026 at 01:53:56PM +0200, Boris Brezillon wrote:
> > > > On Thu, 7 May 2026 11:02:26 +0200
> > > > Marcin =C5=9Alusarz <marcin.slusarz@arm.com> wrote:
> > > >
> > > > > On Tue, May 05, 2026 at 06:15:23PM +0200, Boris Brezillon wrote:
> > > > > > > @@ -277,9 +286,21 @@ int panthor_device_init(struct panthor_d=
evice *ptdev)
> > > > > > >                     return ret;
> > > > > > >     }
> > > > > > >
> > > > > > > +   /* If a protected heap name is specified but not found, d=
efer the probe until created */
> > > > > > > +   if (protected_heap_name && strlen(protected_heap_name)) {
> > > > > >
> > > > > > Do we really need this strlen() > 0? Won't dma_heap_find() fail=
 is the
> > > > > > name is "" already?
> > > > >
> > > > > If dma_heap_find() will fail, then the whole probe with fail too.
> > > > > This check prevents that.
> > > >
> > > > Yeah, that's also a questionable design choice. I mean, we can
> > > > currently probe and boot the FW even though we never setup the
> > > > protected FW sections, so why should we defer the probe here? Can't=
 we
> > > > just retry the next time a group with the protected bit is created =
and
> > > > fail if we can find a protected heap?
> > >
> > > The problem we have with the current firmware is that it does a numbe=
r of setup steps at "boot"
> > > time only. One of the steps is preparing its internal structures for =
when it enters protected
> > > mode and it stores them in the buffer passed in at firmware loading. =
We cannot later run the
> > > process when we have a group with protected mode set.
> >
> > No, but we can force a full/slow reset and have that thing
> > re-initialized, can't we? I mean, that's basically what we do when a
> > fast reset fails: we re-initialize all the sections and reset again, at
> > which point the FW should start from a fresh state, and be able to
> > properly initialize the protected-related stuff if protected sections
> > are populated. Am I missing something?
>
> Right, we can do that. For some reason I keep associating the reset with =
the
> error handling and not with "normal" operations.
I kind of hope we end up with either

 - panthor knows the exact heap to use and fails with EPROBE_DEFER if
the heap is missing, or
 - panthor gets a dma-buf from userspace and does the full reset
   - userspace also needs to provide a dma-buf for each protected
group for the suspend buffer

than something in-between. The latter is more ad-hoc and basically
kicks the issue to the userspace.

For the former, expressing the relation in DT seems to be the best,
but only if possible :-). Otherwise, a kconfig option (instead of
module param) should be easier to work with.

Looking at the userspace implementation, can we also have an panthor
ioctl to return the heap to userspace? A dma-heap ioctl to query the
heap size is also lacking.


>
> Best regards,
> Liviu
>
>
> --
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> | I would like to |
> | fix the world,  |
> | but they're not |
> | giving me the   |
>  \ source code!  /
>   ---------------
>     =C2=AF\_(=E3=83=84)_/=C2=AF
>

