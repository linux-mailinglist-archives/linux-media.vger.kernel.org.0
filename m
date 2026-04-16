Return-Path: <linux-media+bounces-58847-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNJFE6BZ4GmsfQAAu9opvQ
	(envelope-from <linux-media+bounces-58847-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 05:38:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E35409FC6
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 05:38:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 15D79307263B
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 03:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0584E2FFF9D;
	Thu, 16 Apr 2026 03:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Wt1ChRQ0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f227.google.com (mail-qk1-f227.google.com [209.85.222.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5702F8BF0
	for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 03:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.227
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776310680; cv=pass; b=C+xZb3f3AoJ/92Vn/p8y8UH8oOsjmdXaZR8PPZkb7JUCNh/7PDW7Z75F/S5WcmcUgqAXrgB7qZzhPZnpoRBakdUJ7RNsqWcZ0As6l23A7WX1/bNmyj73wfEB37MbfTIWs7hhjh1e78T4SvMNHGSbbwJiRjeZYyDDjAIURCy8s2k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776310680; c=relaxed/simple;
	bh=uAcWEWfGItgy6cpK1tP48lzib+3lgbUBPMSRXGlV74U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ac/vGTbmbk0WgDeRA1ckbv0mqjmj2lLyVObcUEdKfmrYZ3kEUZjMKYPS4WCMUtQPp6wDiqrzmYh3zuej8YsdY3K88F2+kJAxNtL27gpzBLeuMDMuzeqAdi722jzicbb2ObtWSyQxNsiqyBcwdmicMsbnXNaQM/Jwtcxu5S+Nm68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Wt1ChRQ0; arc=pass smtp.client-ip=209.85.222.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-qk1-f227.google.com with SMTP id af79cd13be357-8e0a768331cso27912285a.0
        for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 20:37:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776310678; x=1776915478;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z5l8/TPmddHftPKNpKZ6bwu+ilJQRvwo1WZ+qEapKI4=;
        b=jLmubbbwzlNeFU8ohmF5yUS5t3qc/4TYcMyfxA1zJeFFE1QWEb0TErH2S7gFULuCtV
         DtAKS7hHWmTJR8um98Oltqlu2kVzt8bhJLS0s28lf/oRmW/RQIn/alnvi2vKG0G0heht
         BjZ0tBIfYtHLXYdNjTI70jdbws0FkoqiwAbZAQR+uES93pCKv7zakoxJdzdCdZkYNrzj
         7h8CP1UlLLJ8zOC2GRBM5XHRXq2NLkDSU2+KUj5x9M9LhGadYDSqiKc8SoMNNQwpZPXx
         ZqYBUbInePQOczCwS+jqoSZ7xBNzRlOkd+NHg0GNmmWzznxFVHCgBON0rJca6pg4soQf
         oxQQ==
X-Forwarded-Encrypted: i=2; AFNElJ+vDRIxvte7V6sdN4sPQkuL6QiRwB5ywIsaSw3wbMrEyo0S0dO/vtN07wrdkjJSBNljUJW1KCHFzxSg6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwicSDKIEKhT0O0PACIdNopYY3Z5ufpA8bqpQ+K0VnoANTN8u0p
	a7/j6O0shyKQHXjDkcrbp9eh/Fut+cPvwLPEjtIETBH0aioTtq1IumE1R9SrNl5QShSSNVeZKc7
	VjMOcbfEIwRYSqRRnp8l1WK6V96zMSocIGpPzGvtawF8Ys+TdPcrIrPLU8/fVtHzb9qLRwkkpMN
	CqNCuAfCpe6QEUFBwDq7OGr96UGlDK35+jfgl02DKVQv4LHkxLaE9+1YTuV8/Lor8bZMUakcl9f
	GKxPeEC0mWlx7w=
X-Gm-Gg: AeBDiet35BEAYRNft78sU5zOVScdIE5HUsUIriZwFmhchk2kk4YuWSlZ4cSgqImTgYR
	yZsLDWyxF/6Geaxz0E36qlbV0j3mMKAYwgNmk7Kteiq+DGh4JuHpjfhExdYR2C17W6w15A87/0u
	TYd2zjgrXSFz8Mcs351HvSaMglVMof/WP3KPmInbEXAK09yo0zAwfLJaR7+K5ZA5g9expWgadIr
	8J3ErTttLISiILIXd/BK/P7nQ0bu7lZWqthmqdwR8VdaBseual0eKDNTxmnioK7IfXUsLACmGGT
	YbvAdNfliXPgbgNfGtrXaKg337vHOBnJKfblGdmurPpd87VWKfigG94IPW9RZRJK+MiEHwsALUZ
	xxM+N38N+0Z8Sn2K7jLnLL+14D8LlOo2hAkazH42v2gsvaZaiE1w/co3dPm4So6pVKzbhYc5jPo
	fgytV2FN+Jm76esczsDlsuDpBqrnLuRbfE14pmeq7C7hAKwdwOeVoOU4cu+ddVNcsZ
X-Received: by 2002:a05:620a:4722:b0:8cf:bac2:d920 with SMTP id af79cd13be357-8e5dc02a513mr306802085a.11.1776310677785;
        Wed, 15 Apr 2026 20:37:57 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-24.dlp.protect.broadcom.com. [144.49.247.24])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-8e4ef14ae98sm19447485a.2.2026.04.15.20.37.57
        for <linux-media@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Apr 2026 20:37:57 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-5a409cef179so978455e87.1
        for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 20:37:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776310676; cv=none;
        d=google.com; s=arc-20240605;
        b=WwdU6wTcFoyeRbJpe7Sq2O/4uBzaJMJqo0EQCxlk728qmx2pK/xPQFj+It7WTLeA/Q
         xyJUo828se/dezZEc5luP36Fox5VyssQi6KsRcnlaKFEv9jmQZdjN3kD8mQz7eoGPcz+
         9mDfiay7NFZ+cMvGvxOETlKg5HrJ7Kxrwo+p2Jcn6hxcmrsNOQ71Qbzx00lUvtLSeeTZ
         U5Zvdi5mhTCsO3JKoUnYcYE9ihTDHLwP5xzY6es67AjP8GJi9jGlEnHzjUg9cyINK5yZ
         WROXStX9LY6kZli+Bo5C74AAnM6Y95EDxKAA+E1AqcNENeusKz4kxt3oVtdW0vcezpWX
         uaWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Z5l8/TPmddHftPKNpKZ6bwu+ilJQRvwo1WZ+qEapKI4=;
        fh=dxcwIdqKAo++BwMsk3c+CQJKbwmEnE9Y78iZVpXBGK0=;
        b=d0JNMAgdVHw4hQKH4seWQsiOY4gtbyVj6P92iTZ/CzX+PEteTRKqnDY/M0l04EOU7s
         7WlcJBJW/+Ebd0uS5A6/h56XGpi8k3kmO9/ANp0Zu8mgbeY9HxPryVOadgyEHs5jvCiy
         dssCGqEn6lfUsmwQGnXONIIz4kJ2bWF2mdXS0JEICpJH2HgTZSe/wrf8nT7ZGdSF7ggM
         +0O0dhC5PWnc9F8lPkoVAv5fTysD4PfcxwRciJNpd1lbWDDiwg71xAjzmUwsx/x6ciMk
         kLPZhMiNmXQDw2z4ku+tAZAcg8zWf12ZU6Q5XaxcVn00KqR0gPqF5QO6N86scwu10Cxe
         jCtw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1776310676; x=1776915476; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z5l8/TPmddHftPKNpKZ6bwu+ilJQRvwo1WZ+qEapKI4=;
        b=Wt1ChRQ0pvfeMxbAe6bW7I4+5i92eXgQeYyRX2mLv34DVeenND2I1tJL2GXOf7KKYA
         k+mWbAaJlQrj6SX9Uv6GLopoTQEXFLvPAzdLP4LByglSBixuuagoAzPrOYPFUxn9vHOd
         kd97MziFzFPI16Hax0b6+373Vhak+T7iDJai8=
X-Forwarded-Encrypted: i=1; AFNElJ+rXdsPEblh+VdhxJbFSRaYRyIfykVwWqYWObKherX9yqeebetCllOhlSyjrzxYjzx7YQp+66pkFgkViA==@vger.kernel.org
X-Received: by 2002:a05:6512:3e28:b0:5a2:ad98:3685 with SMTP id 2adb3069b0e04-5a3efd90bbfmr7195890e87.35.1776310675900;
        Wed, 15 Apr 2026 20:37:55 -0700 (PDT)
X-Received: by 2002:a05:6512:3e28:b0:5a2:ad98:3685 with SMTP id
 2adb3069b0e04-5a3efd90bbfmr7195870e87.35.1776310675337; Wed, 15 Apr 2026
 20:37:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260414105529.9883-1-popov.nkv@gmail.com> <ecf4cd01-b05d-4f51-943a-631cc4b27331@amd.com>
 <CABQX2QMH2XFcuz00DQQWU4uKw2B8OzE4rCE5=8LMXDg4t0AqWQ@mail.gmail.com> <9a33c8b4-64f1-400f-b8a0-0972ea5b5ecf@amd.com>
In-Reply-To: <9a33c8b4-64f1-400f-b8a0-0972ea5b5ecf@amd.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Wed, 15 Apr 2026 23:37:41 -0400
X-Gm-Features: AQROBzBeTXAsyPXmmTJlvmAfqcZclh41H9HUgy916nOi9mKbcOMPsijik6exNAU
Message-ID: <CABQX2QPatyzmoTJYv3C52aUfE2qS4bEr-01J5XbQnay94vs1Cg@mail.gmail.com>
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
	boundary="000000000000dffd04064f8b8ea3"
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_SMIME(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[broadcom.com,reject];
	R_DKIM_ALLOW(-0.20)[broadcom.com:s=google];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-58847-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.b.d.0.0.1.0.0.e.a.0.c.3.0.0.6.2.asn6.rspamd.com:server fail];
	FROM_HAS_DN(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,broadcom.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,linaro.org,lists.freedesktop.org,vger.kernel.org,lists.linaro.org,linuxtesting.org];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[zack.rusin@broadcom.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[broadcom.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 04E35409FC6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

--000000000000dffd04064f8b8ea3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2026 at 3:56=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 4/15/26 03:08, Zack Rusin wrote:
> > On Tue, Apr 14, 2026 at 9:25=E2=80=AFAM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >>
> >> On 4/14/26 12:55, popov.nkv@gmail.com wrote:
> >>> From: Vladimir Popov <popov.nkv@gmail.com>
> >>>
> >>> If vmw_execbuf_fence_commands() call fails in
> >>> vmw_kms_helper_validation_finish(), it sets *p_fence =3D NULL. If
> >>> ctx->bo_list is not empty, the caller, vmw_kms_helper_validation_fini=
sh(),
> >>> passes the fence through a chain of functions to dma_fence_is_array()=
,
> >>> which causes a NULL pointer dereference in dma_fence_is_array():
> >>>
> >>> vmw_kms_helper_validation_finish() // pass NULL fence
> >>>   vmw_validation_done()
> >>>     vmw_validation_bo_fence()
> >>>       ttm_eu_fence_buffer_objects() // pass NULL fence
> >>>         dma_resv_add_fence()
> >>>           dma_fence_is_container()
> >>>             dma_fence_is_array() // NULL deref
> >>
> >> Well good catch, but that is clearly not the right fix.
> >>
> >> I'm not an expert for the vmwgfx code but in case of an error vmw_vali=
dation_revert() should be called an not vmw_kms_helper_validation_finish().
> >
> > To me the patch looks correct. This path is explicitly for submission
> > failure and does BO backoff plus vmw_validation_res_unreserve(ctx,
> > true). The backoff=3Dtrue branch skips committing dirty-state /
> > backup-MOB changes, which is only correct if commands were not
> > committed. Here the commands have already been submitted; only fence
> > creation failed. So I think unlocking BO reservations without
> > attaching a fence, then letting vmw_validation_done() keep taking the
> > success path for resources is correct.
>
> Ah! I would just avoid adding more TTM exec code dependencies.
>
> We also have the always signaled stub fence for such use cases. How about=
 that change here:
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vm=
wgfx/vmwgfx_execbuf.c
> index e1f18020170a..8dcb8cd19e29 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> @@ -3843,7 +3843,7 @@ int vmw_execbuf_fence_commands(struct drm_file *fil=
e_priv,
>         if (unlikely(ret !=3D 0 && !synced)) {
>                 (void) vmw_fallback_wait(dev_priv, false, false, sequence=
,
>                                          false, VMW_FENCE_WAIT_TIMEOUT);
> -               *p_fence =3D NULL;
> +               *p_fence =3D dma_fence_get_stub();
>         }
>
>         return ret;

Yeah, that would be an ideal cleanup, but it needs a lot more work.
The p_fence is a vmw_fence_obj so we'll need to write code that allows
creation of vmw_fence_obj with a signaled dma_fence and then plumb
that through the driver. We'll also have to change a bunch of places
(especially in older kms code) in vmwgfx that treat null fence as "the
device has already synchronized". It's the right path, but to fix this
particular issue I'd be happy to take Vladimir patch for now and
perhaps I'd ask Ian to put a proper cleanup on his todo.

z

--000000000000dffd04064f8b8ea3
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
QSAyMDIzAgxhPxw+eieHWB40hPkwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEINFB
rIE9ROoOc0xiUpWtzO6U/Fm02Q/KSp34pKYx00X/MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTI2MDQxNjAzMzc1NlowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJ
YIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAG+q0rz1Q4UB2syWSijmwSYPN1TFf5AKljUY44y+
yBlvtwKWYHziOB/5kpoPEYd8VuKyGLjeUv48kB5j6nsP+btZP9uZPCV8rxVjghAuzL1jeh1QPgdr
hQPkfkv9VtA+EK+/K5QwGmuxwgtjGdisE+4Cfaxb0BbjHs9xf5BrHSP4F4ussmYXuWSXLqA1MJq/
6MYPySQAaU+TN3wfl1ffjEfB7DH7+nArNYmCOKkqnMaHJAjv/iUnyvX4KJUJYLyy6szGdYYfhT7J
a+sfKABJY8PyrwV+3jNOdqx9MRtd65hC88xFfWMRoeokekJBaFQhGXC//EkAmcF35KBGjkNtNO8=
--000000000000dffd04064f8b8ea3--

