Return-Path: <linux-media+bounces-67352-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0a9pNko9UmoCNgMAu9opvQ
	(envelope-from <linux-media+bounces-67352-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2026 14:55:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 60634741906
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2026 14:55:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="FfM/kmN/";
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67352-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-67352-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 58E0C3008C0A
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2026 12:55:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94D933C769B;
	Sat, 11 Jul 2026 12:55:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58953C4B89
	for <linux-media@vger.kernel.org>; Sat, 11 Jul 2026 12:55:32 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783774534; cv=pass; b=mAK5BUYKMz1BsfYGGnMR1IxqD6t96/JYYZXsHmcIpBha8vE1qSSZd6BMcyi4PSy8x72Tby5gOkXlTFYHX2t/HixgQ2wXZ3VERbtxnLmt9gNnP5jZxkTbDR4VeoFePxkUC0r3CwVhWADqAeQgTfdOpl9/bpDe1q8pvorRj6Yj65I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783774534; c=relaxed/simple;
	bh=Sl+rcNFS4n6sfV7RASsazrAsQq0F5cbeZGTcafT17Rk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DLhcfeZXwu+Rv/RhLCfEADSadgoRfR13nyUJSKYRJUTFRu1UKYhxKFOLFPfV3GBU2EtdVlwuNfPCLC75JYLs1nh6/0KWw9npnhGIgSMSP2ifHjqsbpgBmvP5ixvcmHsp7nXeeXlze7NahlmfhMU0IBttrKhu3XzSBmLqkkffZzI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FfM/kmN/; arc=pass smtp.client-ip=209.85.216.48
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-383fff6e8b6so150857a91.0
        for <linux-media@vger.kernel.org>; Sat, 11 Jul 2026 05:55:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783774532; cv=none;
        d=google.com; s=arc-20260327;
        b=lwPntjErq+NzgY1iIewiQ0zHUKFA7aBJc9xu57wmPM0aSWxPyIecv+F+AAAx6deU4V
         mX0kiACS9lE9+o1T+ldcPM2PpUPyKiA5JVgWoaPAT5kRr0DjExm/mwK17c5VM0Xay9Zb
         WfvWqYXgCD5FYdc/tVexBxKaor6IiS2gqEjXsUlgnjxFrhLvOhZ8Y2kJmZ2vylolS4Q3
         tTAEHE/tt984F85wohi4qyBQ26NqczZiGge5jKMpMThT0Fn3o0mAFfAA2gQZDOSaOv+F
         7b1v3bd0q1mizPFCUpFoZmTQeqhz6XQ+FuYE0ge3WeMOb5ZDOIu8NTaZI0Wr9iGM8QVp
         wdGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1zUvgb/Vijkk139Zbj5Mh0/O0qV2LR06s+/nZ2EMR/8=;
        fh=UFU9YrMyiRDuSekcVrdpHe1Oo4kbsO+KaF6R5t8PORo=;
        b=IeeqMOeotbNAdsUDbvvd9pOy3wCnwtk6t+9dC0Y3koDutGOzuhOi1rcF+dTCHR3igt
         EenyTkJDt0DV0tXIm0zLeh8TMLBV/1UtcO9TQmXdFSQWv4NzPoJpjhMt3vc2B6K8JcaK
         +h9VylC8RtKDfP6xHjqedgyPJx90uPr6PAB4NeKUKa0NABxLLB5226IYzzPUu8gPgXHW
         QFZznFTTEgwOzwt9qyt785Q5TGPnTn+4QCHtX1wJgIf0u9OaDo5ZKVhJugOAJp4bQKOf
         4s2GE9gWKlcuIbpeAv3RSFuQmbDLmzy0YyYkkhG1/PYVJpKdlQz8tfgJhYaWcqvgPQhj
         VZSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783774532; x=1784379332; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1zUvgb/Vijkk139Zbj5Mh0/O0qV2LR06s+/nZ2EMR/8=;
        b=FfM/kmN/tO2vNXlVEHoYYU4Gng3x9pt3bFUHeB17lQNTYT1U7ODfEBW9B6LtFleKVP
         i3NLMWRmDSpf57VeosLE4ZmuaEXgWlH1kAUgg5tbB/WynOpkGfXDLIeEck+RjYlXuNu/
         EXgFjtxaV/jI2ocYua3lwDDL9wR5K7nAGbVLIeZtv3BWy/ABg234I2cX+T7e+O3rnN3v
         2aCo2GB3J+YdiYlnCnv2wA1jqNH/+IwrerF8N72wSXv/cT3G+y/AlYDNO/CCayiLz5ue
         djvgoWIg1BckyiY2RsCczktQUUbvGHYqjr0H1jftRXzswFo15Fw7bVafkSLU2CFq081g
         w5Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783774532; x=1784379332;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1zUvgb/Vijkk139Zbj5Mh0/O0qV2LR06s+/nZ2EMR/8=;
        b=AlHaZMoiv/RsewoozmUEdokqEaKr/W6hcsAtrudSriRbX5mZ7my72w3mEK+nIB5eq9
         jCbkUcy357H8MDzy2C0hT0RdSDQrhtjLK6Uf2KznBpmFeUwZGQATO5U1Aqw2OxyrnhCW
         8r/IOzGpNO6wi7r2qrJCdnDbPUQPJ2NIutEh5QnnA72vcIc4EHq6vDve8p0JayDivX2q
         wX8jk210ucnFMBLaYeOjwmQMFsqkZhhKnfIO1MLE5/KLPCVqCXeV4IP9Bt1xJbWP27QC
         AvC/sHtLSICxkynWSl+4vfmO1c7DJqWFaD2ua+5oCEjDl7Bcx+hgEt8klxnZVGN1hoeP
         Hpyw==
X-Forwarded-Encrypted: i=1; AHgh+RrMuN79k8YG5IVpSYPK5zmbc5/w0a47liYJsUFr9IwYxCrT4Sfi/GlWbLJslf9JRfw3uW7onWFMrdlzQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ7bGjtGgYs4YBxVWxsQg84VJTRMbaY9jZqGxvk2hfWWyNVheG
	97iaRn0Y6S9keZYiM0KpWtLHz0X6R/g0LPIeRDZqVziFekXlEsggRse09FeC5XhAc+nDdwW+bRS
	YOoDi8StTR5hGWjAaq2QP5AmSBjkW8QA=
X-Gm-Gg: AfdE7cmuDHdlQj/37yeDwi3T//46YoETNxvg3DaXOc4LyOdZXDCXe6CzekpcbjdDPB4
	nr5vaQ6T+9EBrbp8vhSeb3dpTtXxMToNeFJpivo1vteuUv+85DapAn/yPjVTFB4nDrXI/f6kAdy
	28inyLXZSwjeJcZsxCxAgVCDCziGblmQViIA+mCvUqPYKNDjKytfoEdKCDYlDB52VceWriVZC/Q
	vZGyGyzm18inhdvw/aRQe7vi2CqsmU6s1uL527rTYbaBx4Ao2cvVjXDXA1dj3Vab7NkreIEYNaN
	TFoul8UbPwDLzQAGxfIh4eNes2TpzDjCvuLqAvTR1W6X9XqK/HMQWkBDhOkuv+bgxYW8dtYiAQQ
	CG38TpOSWTsoY
X-Received: by 2002:a17:90b:3e48:b0:380:7688:fc06 with SMTP id
 98e67ed59e1d1-38dc7849860mr2139954a91.8.1783774532077; Sat, 11 Jul 2026
 05:55:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708-dma-shared-buffer-config-v1-1-8c1571000855@kernel.org>
In-Reply-To: <20260708-dma-shared-buffer-config-v1-1-8c1571000855@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 11 Jul 2026 14:55:19 +0200
X-Gm-Features: AUfX_mxzrtwl0-qM1WcyDgdPW3fSN_iew-N8VZzUs1Dmg7dy-KYQxeN-HmNLFeM
Message-ID: <CANiq72m9t0y3pfZUw_KbJSjujjQcM=FHxTCLenPoC_-v2udibw@mail.gmail.com>
Subject: Re: [PATCH] rust: helpers: guard dma_resv helpers with CONFIG_DMA_SHARED_BUFFER
To: Andreas Hindborg <a.hindborg@kernel.org>, 
	"Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Asahi Lina <lina+kernel@asahilina.net>, David Airlie <airlied@gmail.com>, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:a.hindborg@kernel.org,m:mkchauras@gmail.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:daniel.almeida@collabora.com,m:tamird@kernel.org,m:acourbot@nvidia.com,m:work@onurozkan.dev,m:lina+kernel@asahilina.net,m:airlied@gmail.com,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:lina@asahilina.net,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[miguelojedasandonis@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-67352-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[linaro.org,amd.com,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,collabora.com,nvidia.com,onurozkan.dev,asahilina.net,gmail.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,kernel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 60634741906

On Wed, Jul 8, 2026 at 1:53=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> Commit 9b836641d3bf ("rust: helpers: Add bindings/wrappers for
> dma_resv_lock") added rust_helper_dma_resv_lock() and
> rust_helper_dma_resv_unlock() unconditionally. However, the dma-resv
> functionality is only available when CONFIG_DMA_SHARED_BUFFER is
> enabled, resulting in the following link error when it is not:
>
>       LD      .tmp_vmlinux1
>     ld.lld: error: undefined symbol: dma_resv_reset_max_fences
>     >>> referenced by dma-resv.h:463
>     >>>               rust/helpers/helpers.o:(rust_helper_dma_resv_unlock=
) in archive vmlinux.a
>
> The dma_resv_unlock() inline in <linux/dma-resv.h> calls
> dma_resv_reset_max_fences(), which is only compiled into
> drivers/dma-buf/dma-resv.c when CONFIG_DMA_SHARED_BUFFER is set. With
> the option disabled the symbol is never defined, so the helper fails
> to link.
>
> Fix this by guarding the helper definitions with `#ifdef
> CONFIG_DMA_SHARED_BUFFER`.
>
> The only user of this helper is the DRM shmem abstractions, which already
> depend on `CONFIG_DMA_SHARED_BUFFER`.
>
> Cc: stable@vger.kernel.org
> Fixes: 9b836641d3bf ("rust: helpers: Add bindings/wrappers for dma_resv_l=
ock")
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Please see:

  https://lore.kernel.org/rust-for-linux/20260708082454.1254320-3-mkchauras=
@gmail.com/

Cheers,
Miguel

