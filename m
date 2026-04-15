Return-Path: <linux-media+bounces-58771-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WP5GMArl3mnVMAAAu9opvQ
	(envelope-from <linux-media+bounces-58771-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 03:08:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1AE3FF71D
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 03:08:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 44D063083167
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 01:08:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 222372D5923;
	Wed, 15 Apr 2026 01:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Xj0JRyKW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f98.google.com (mail-oa1-f98.google.com [209.85.160.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C06B1EF09B
	for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 01:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776215300; cv=pass; b=pfHxck5imNd3LmXOKMLLzo/nMSmQ+sIALTth0gOpzpRWyvr0lJgfLHII7R0KJk0o4YUUmB1p5nzggAq8ASHZRobghFwGgWqFBa6c8gQy9PdR8jC6q/9nMMEJfMYOCi/EJEAeO/koAiA4/iJ1vLmyVU+uyssVYDTEzoWsC7NXerE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776215300; c=relaxed/simple;
	bh=sqg4QC95Fa1hX4b7POVn4LXiJkByCPuCLyRMCCjykWg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ifYM9eMfkB7VYFXXx20oyUJnOzQktKzV3YCB3AB0WAT+VNtD18nS/1UiXdMu+Taz+7+M3kFZmqCUsP4o8IhM6BLCVBHe7z1VFls0UqVY00bAM4Uw5q0ObXX65Td7NMB4KehxDxw/IhWInlCKrqKufApEp8RD4740TOzejP4JLwA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Xj0JRyKW; arc=pass smtp.client-ip=209.85.160.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-oa1-f98.google.com with SMTP id 586e51a60fabf-4232323a7daso3326249fac.1
        for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 18:08:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776215298; x=1776820098;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ww1F40DAwZwWu3oTa9xqMJpio6zfivRRmHsCfcEklPA=;
        b=FpGNtpKX0vq8JcOLu0xJ8KwxzX7+FqQK0VOJfp75uC3hLA7YUyt5r/MVD/2TLYoeHn
         TxXcivv08gVQfm0Xb2RiD/DuZu+psBaHGmKoX7dgQsfjnnj8udpGsKAG7haH88KeElMi
         8ZiC6PkZB8BfIjaojvgWiEpXbkkEXUT2C42tC3q58N2BFuRg9n5DQ6xk0KwOkA/hEv4P
         0LVd8Glpn3VwhVqlzWlwkG465HBEPeTEgblIY/+EFAae1w4KryxliCx5yM+UF0jkT0xL
         uHbOb316ZlN8tX99xTnCqC/Hw6Br1prn4A4aaDDgBLnuT96NHYojawq1JKcXSOphO2+1
         PvoQ==
X-Forwarded-Encrypted: i=2; AFNElJ/43k1xMp2zkTT4pSrDZ1ZtiX+6zjqxX/6i2e3hqP0LZr453yE+sKgA7fTro33qYFT5OLJo7geLC/hDbw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyix8LlLol6ipmatlrBwVHeXed5T0IXaEXEeLLsNUoPq3mEkJQl
	3/D0V8FsKT55qC1ECBryre/AAbOHHKSm2A75lmehVlFo6bU6lzNyWS6gk+F/wxr84OSy+zG4377
	iZ89JhtzQbpGaDn1nshkCbneh5XC0HvwdrqgfCjyXQyj8U02xdhSfbOAgfie7a7XaT7gOalo8GX
	CMZNAcjui7nbUqQAEyrgaBFSno36zGjHwyUHlqhM4xNScdR1SIfGU0d6i7iaV/n8OYgOnpTmEHL
	+h6g78h5sBmV2Y=
X-Gm-Gg: AeBDiev4DqNXK7Iccdk4lzJ6NF0dQGE0cMbH1OG6rkWJ4LfUpq1JEmysLwURRTthEV4
	f3J2UUIu8zaPLLuO5i0M9lgyBvxgdZUlhzSYfdTptkKoQrECqDGA9nThIggh1J5uha9JQxLN652
	VL9RRfsUFqD1OJpytQU3uirvYojn8MdPd2J6li76TFc9O8VQeRIZz9MAyqO/JFkWI0DR7vf9v8a
	f2vOaily5mfs7VS3D0Od4yhM9suXLZ0XL6DOUQEZHRIvbzbV7+6CCf3WdWONhic4QNoS+Bz2XLP
	ptIbwMk811GM/vdMM7gnsp3qo2thrvr0+u54/Nuntd9sies6h1k5PEZNUc0+QzAelXELqwffzw1
	rXhATqT+PLft7VaIjaGcj02OeyT7+qoYxnjwiMHjO01CCk7qRekSp2A5Jc8Y4zvYJXag4GjpQUh
	v+0xRviH9ocSTx+QR2UahnHQhb/vst8G6Ik/f0XzgfEpaWskYESPC6zR9My1Ven+L2
X-Received: by 2002:a05:6870:1ca:b0:417:4679:d550 with SMTP id 586e51a60fabf-423e10125dbmr11539329fac.22.1776215297995;
        Tue, 14 Apr 2026 18:08:17 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-15.dlp.protect.broadcom.com. [144.49.247.15])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-426446ab330sm34419fac.0.2026.04.14.18.08.16
        for <linux-media@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 Apr 2026 18:08:17 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-5a3ffc66760so1149884e87.3
        for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 18:08:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776215295; cv=none;
        d=google.com; s=arc-20240605;
        b=ImnunImQwfu3mvWBAW23W+Yxx1L0hmaHoXDMv8am9u+bYSzqoOxjW4clKfuBLr9CfS
         fxbjhXarbIxOVoMvjcUqh9CQV74A7Y1UveFqR2ikJ7Pfo9fgCnrfQnrDLOaF0+/3Wfa0
         4+zSDMO1tLzfg88TvQ4GkCEx7cZlrUakq6qw1jPoYHYqfrOrlZtZKQazCRbJ7XzgaMVh
         ug/pMin2SfwJTJZlU29P2zpKI+Wlj7dMnePJZVk/y6UOBlvv9OPiAWkwH4T2hzh765vU
         20305UxoW3+oNyY46QUZYnoNBURaYJELXSoCMAYQ5/LjdPrhU1xwHgR5Ixnht8wX1vz5
         c/Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ww1F40DAwZwWu3oTa9xqMJpio6zfivRRmHsCfcEklPA=;
        fh=G6aN6jTVII1ohYf3l+9whEkKFX6R66OUmavMUUXIAn8=;
        b=UAYKmCC4FsJwIHFbtTjk51+Gq+YBLCB2jo8Fq1ZcuzJDjmerOs3Xah+VZa81et6gUm
         ayu8GeC9nVv3pzykUvriVn/DZEgjT9GypUapEIAYlLut8qpE3xe8uYdLkPPKt6yTtVfT
         gJGvrAf+HMqk+CJJ9wo6YeVqIVVTcIbwWlzmZirM1LhtOIKCvLolSQRpPReJi75rFZ5p
         fXteDQwJ33bOoD+Kksa6umwa0Lx6nKdMA7uvqvNO5EBcWlfn26fgcOXKUmanUZLLyHFL
         qk6g1cMIGp//Mfq5lvSQ00eJZdNXy8AJLWlSQylb9zV012d76Gl/jvS8pYo9byVPMqSA
         0ipA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1776215295; x=1776820095; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ww1F40DAwZwWu3oTa9xqMJpio6zfivRRmHsCfcEklPA=;
        b=Xj0JRyKWtKT7MOOqNjmFMQopz9Sz4u9azJMKsRUFReJASFGjmWAWhN08tEZxTAYOhF
         pdScSWl6taZItXUldGBf+RIkOi7G9yIAsNasZuY6YQ88vp4fWC2v02O3t5I67AZcGb7U
         majpHYkeEXWx1fWnw8uwvACx4A8Xy0Zg3REUk=
X-Forwarded-Encrypted: i=1; AFNElJ9B2CQ4AIvZweNv5M3YRytkOXVOh+my0OEF4HIQZ2vlu21PgpFuS7IGIQErZUZvo4B3EBFQ7S+Mn62hlQ==@vger.kernel.org
X-Received: by 2002:a05:6512:3b28:b0:5a2:c210:4631 with SMTP id 2adb3069b0e04-5a3efb281d6mr6506459e87.24.1776215294990;
        Tue, 14 Apr 2026 18:08:14 -0700 (PDT)
X-Received: by 2002:a05:6512:3b28:b0:5a2:c210:4631 with SMTP id
 2adb3069b0e04-5a3efb281d6mr6506440e87.24.1776215294435; Tue, 14 Apr 2026
 18:08:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260414105529.9883-1-popov.nkv@gmail.com> <ecf4cd01-b05d-4f51-943a-631cc4b27331@amd.com>
In-Reply-To: <ecf4cd01-b05d-4f51-943a-631cc4b27331@amd.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Tue, 14 Apr 2026 21:08:01 -0400
X-Gm-Features: AQROBzB9xDYvxtGn-vVFYidT-0afNkRbq08eF7asqpx7x2PE8EMbH6-BtwZ2p0U
Message-ID: <CABQX2QMH2XFcuz00DQQWU4uKw2B8OzE4rCE5=8LMXDg4t0AqWQ@mail.gmail.com>
Subject: Re: [PATCH 15901/15901] drm/vmwgfx: fix NULL pointer dereference in vmw_validation_bo_fence()
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: popov.nkv@gmail.com, bcm-kernel-feedback-list@broadcom.com, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, lvc-project@linuxtesting.org, 
	stable@vger.kernel.org, Ian Forbes <ian.forbes@broadcom.com>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000ba5216064f7559dd"
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_SMIME(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[broadcom.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[broadcom.com:s=google];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58771-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[gmail.com,broadcom.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,linaro.org,lists.freedesktop.org,vger.kernel.org,lists.linaro.org,linuxtesting.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zack.rusin@broadcom.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[broadcom.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,amd.com:email]
X-Rspamd-Queue-Id: 3C1AE3FF71D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

--000000000000ba5216064f7559dd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 14, 2026 at 9:25=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 4/14/26 12:55, popov.nkv@gmail.com wrote:
> > From: Vladimir Popov <popov.nkv@gmail.com>
> >
> > If vmw_execbuf_fence_commands() call fails in
> > vmw_kms_helper_validation_finish(), it sets *p_fence =3D NULL. If
> > ctx->bo_list is not empty, the caller, vmw_kms_helper_validation_finish=
(),
> > passes the fence through a chain of functions to dma_fence_is_array(),
> > which causes a NULL pointer dereference in dma_fence_is_array():
> >
> > vmw_kms_helper_validation_finish() // pass NULL fence
> >   vmw_validation_done()
> >     vmw_validation_bo_fence()
> >       ttm_eu_fence_buffer_objects() // pass NULL fence
> >         dma_resv_add_fence()
> >           dma_fence_is_container()
> >             dma_fence_is_array() // NULL deref
>
> Well good catch, but that is clearly not the right fix.
>
> I'm not an expert for the vmwgfx code but in case of an error vmw_validat=
ion_revert() should be called an not vmw_kms_helper_validation_finish().

To me the patch looks correct. This path is explicitly for submission
failure and does BO backoff plus vmw_validation_res_unreserve(ctx,
true). The backoff=3Dtrue branch skips committing dirty-state /
backup-MOB changes, which is only correct if commands were not
committed. Here the commands have already been submitted; only fence
creation failed. So I think unlocking BO reservations without
attaching a fence, then letting vmw_validation_done() keep taking the
success path for resources is correct.

iirc the same helper is used by execbuf, and the shared-helper fix
correctly covers both paths so this is probably not only a kms issue.

Untangling this code would make sense because it's confusing, but
that's not something I'd expect Vladimir to do :)

z

--000000000000ba5216064f7559dd
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
6U6qgI8F5eiKsQyE0HgYrQJx/sDs9LLVZlaNiA3U8M8CgEnb8VhuH3BN/yXphhEQdJXb1TyaJA60
SmHcZdEQZbl4EjwUcs3UIowmI/Mhi7ADQB7VNsO/BaOVBEQk53xH+4djY/cg7jvqTTeliY05j2Yx
uwwXcDC4mWjGzxAT5DVqC8fKQvon1uc2heorHb555+sLdwYxAgMBAAGjggHYMIIB1DAOBgNVHQ8B
Af8EBAMCBaAwgZMGCCsGAQUFBwEBBIGGMIGDMEYGCCsGAQUFBzAChjpodHRwOi8vc2VjdXJlLmds
b2JhbHNpZ24uY29tL2NhY2VydC9nc2djY3I2c21pbWVjYTIwMjMuY3J0MDkGCCsGAQUFBzABhi1o
dHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMwZQYDVR0gBF4wXDAJ
BgdngQwBBQMBMAsGCSsGAQQBoDIBKDBCBgorBgEEAaAyCgMCMDQwMgYIKwYBBQUHAgEWJmh0dHBz
Oi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAkGA1UdEwQCMAAwQQYDVR0fBDowODA2
oDSgMoYwaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMuY3JsMCIG
A1UdEQQbMBmBF3phY2sucnVzaW5AYnJvYWRjb20uY29tMBMGA1UdJQQMMAoGCCsGAQUFBwMEMB8G
A1UdIwQYMBaAFAApNp5ceroPry1QLdugI4UYsKCSMB0GA1UdDgQWBBQNDn2m/OLuDx9YjEqPLCDB
s/VKNTANBgkqhkiG9w0BAQsFAAOCAgEAF463syOLTQkWZmEyyR60W1sM3J1cbnMRrBFUBt3S2NTY
SJ2NAvkTAxbPoOhK6IQdaTyrWi8xdg2tftr5FC1bOSUdxudY6dipq2txe7mEoUE6VlpJid/56Mo4
QJRb6YiykQeIfoJiYMKsyuXWsTB1rhQxlxfnaFxi8Xy3+xKAeX68DcsHG3ZU0h1beBURA44tXcz6
fFDNPQ2k6rWDFz+XNN2YOPqfse2wEm3DXpqNT79ycU7Uva7e51b8XdbmJ6XVzUFmWzhjXy5hvV8z
iF+DvP+KT1/bjO6aNL2/3PWiy1u6xjnWvobHuAYVrXxQ5wzk8aPOnED9Q8pt2nqk/UIzw2f67Cn9
3CxrVqXUKm93J+rupyKVTGgKO9T1ODVPo665aIbM72RxSI9Wsofatm2fo8DWOkrfs29pYfy6eECl
91qfFMl+IzIVfDgIrEX6gSngJ2ZLaG6L+/iNrUxHxxsaUmyDwBbTfjYwr10H6NKES3JaxVRslnpF
06HTTciJNx2wowbYF1c+BFY4r/19LHygijIVa+hZEgNuMrVLyAamaAKZ1AWxTdv8Q/eeNN3Myq61
b1ykTSPCXjBq/03CMF/wT1wly16jYjLDXZ6II/HYyJt34QeqnBENU9zXTc9RopqcuHD2g+ROT7lI
VLi5ffzC8rVliltTltbYPc7F0lAvGKAxggJXMIICUwIBATBiMFIxCzAJBgNVBAYTAkJFMRkwFwYD
VQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBD
QSAyMDIzAgxhPxw+eieHWB40hPkwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIJbU
+Ul2Ju230MA3piovGJ+/oE+VmOysjBq8WgmmmKaMMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTI2MDQxNTAxMDgxNVowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJ
YIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBABBa5jgr3/OuBTC1lDJjNPgvsppmGdM6Q6JA3BBA
uLZ6K0OwXUJYVyai2eFDJKjM0Tlk+hyn1bYrW1WvfXBkfvl90BYFFMOH1VvqtTU7ftdjfbsJL9ej
0owoDkug41eKCVHoHVl91rcIS6D3G6y3t6BzuKqhzdNYs7Kyj7wRoNHw2YHC1ySM98dQRa1wXqwM
ugK938rLCbH0S+WUDpM/OWJW6LmhnSGqZ6fi9GYOk9CA435iROfAWVEN3GtcJsQZa1DvN4j+EeN/
kuRHfWzW446PPVl5SPzLXYW+mZH9WAHKdyDysRalQm1kdYqIeTIVnCBgD4mFOm799BYuQFkPfXk=
--000000000000ba5216064f7559dd--

