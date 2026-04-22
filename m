Return-Path: <linux-media+bounces-59351-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDJJLlpR6Wl2XgIAu9opvQ
	(envelope-from <linux-media+bounces-59351-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 00:53:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3879D44B5D4
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 00:53:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 208B23086F55
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 22:53:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C4B03806C2;
	Wed, 22 Apr 2026 22:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Tbdd06x4";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZYw5DMbV"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3398132ED40
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 22:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776898383; cv=none; b=WCACSj08wO7Dl1By/NVD/qKjXNMzBHvRvCfXyQhJIJUwea28wkaEmSIiDSadvbT2N7aai6vsZPg6TmsU088IeIbM0d44BONWMvPO87tm/wUMIof5MHESU6O0cNWsU1MZpPpCSYH4ljegHymvBenbUXlcAyt+dA5Tqs1LasjSpsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776898383; c=relaxed/simple;
	bh=PtS+Yyd+jDZyh7aqkBSp9uPt9K/1LdqfexeuOZiRIAk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZfvuVekVNZUpY3UNb7Swk3t85wOLi5XngVeh4NzMZxhmpoDSXvEpbFpFlFuzu28nIuE0TIQRfjm0hhssN8YAOYTFCh3qhsp8174mlrOKVDVpHj54MIyY3+AZzFEDg3SUww2lAY+mJFhKe/42H9P2F4ltMntOBRDkk1Pv3NG9/dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Tbdd06x4; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZYw5DMbV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776898381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mDXm7aAVELWsp3pvLIzbso12bneOyuVrRAMZreDRWg0=;
	b=Tbdd06x4WvmUQYYSwYQuABMYKuI3LEm4V1vlXEHoLAvD8DsUQegk+viuM2O1oRBROSpOef
	a9q5kg6BBDhnVVJyy20QuZULxpxLPUnpc6GLquJXjNBoTzsHejLXfDXHq6Zhuw1CUYGR4w
	RguLqu1nzSGGDzr10D0wrRy0GBYTwnQ=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-235-6BFQz6aCOWGqHBk76MPDaQ-1; Wed, 22 Apr 2026 18:53:00 -0400
X-MC-Unique: 6BFQz6aCOWGqHBk76MPDaQ-1
X-Mimecast-MFC-AGG-ID: 6BFQz6aCOWGqHBk76MPDaQ_1776898379
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d8e8c47a3so160837261cf.0
        for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 15:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776898379; x=1777503179; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mDXm7aAVELWsp3pvLIzbso12bneOyuVrRAMZreDRWg0=;
        b=ZYw5DMbVWWi89j5x0ayCdc06OKLo7hkR79wHKZ1eSujqB9t80gmY1kAcRaI8kSmjzR
         ac5ArHgbhEXG0iv8y+xxT7Fp+isZsJHZ2y7omP7S3fjjK1BYOXJioZAz+ypUSez9EJep
         z4Td5a1h4dKaoga6XK/unL5yWv27oIZCDDwKlfXtttNkLV4hqj0f92JH7KTHkK2cIIUQ
         WyJZDofMxU7ck3i+xWHlMOBJLVxs0GSXdiURZRVLEzRACIZ7/sIOVbISRSR471uL3dMS
         R2cyFWD+gElMxp68+oDr3Cfji+oJgukxT25MMTAViwPc8V2wsrBte5l0aYs9FqQDXrmn
         fAYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776898379; x=1777503179;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mDXm7aAVELWsp3pvLIzbso12bneOyuVrRAMZreDRWg0=;
        b=LrNz1FchSxun/TF3RtN5o8Wk8sxsg2/wDGjjEvlW1qV1SNnosqRgdJoGE64ib97bJG
         8DdlF5qXWYUBpk/GPKNESLgpZetHbCziEcUnpD+D2RAhPAdme/IOABvCG8TTCboFfzBB
         43UDL80i4OYDWoUCuqGGPMDBkIanaSHmOneNW3UwzfjUMi8bUNk/0xORtowEhC5J3LOb
         apZC/buYOhMi2u6PoeQm95WfeaDqKLJtmMVfMaWePdDvcrAXYR48fOOMw7w6ivJlI8eq
         +mGcBSN4JQnJfToq4+ct7sD+v2GaNjiWlZYcamnhbmKetoR5lu+cWOvUvhzcbLxbgTsn
         /BuQ==
X-Forwarded-Encrypted: i=1; AFNElJ9+1sc4DXajfmTIvXh81Uzo/1V5AeNA0VZexWza4wt9ZM7vs0tGQ4NjOMUPYRXwBPgglYPEdzFvrfw3KQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZSpJPubDh+j+7q14cK9gHhphNqGemz1qHq1Gu05cdWCK8Zlrs
	wuv8yPiGDvSWJ1fmL8p+VVVlubRxk9s1YYh/HUXvUX26G2uvQM3GD8FOhPLXu1C7dozM0ngIDo6
	7Y5RsXP4hTqawY/HJXBJ51yUQL8qvNhVNSgqj5oZ/ZXS+1GUQIUiLENA3SrfdlF0x
X-Gm-Gg: AeBDietecMo65f2sFC57AyiG1z61XTcMUDOWg8R8wdYtVN6PxrWhlMQOgPlIatbeFjS
	cQdoQSAAGEgrbzZubCdEFnbdMd8m0u0mqYb7UTJlCVvXUE/YoUaDoJSb+ymyMdEtxZVcxrIbMnI
	zPmBK1qXJVLe9hBUjVUE5FhZUP79INYCN+210ioK9HD4+fMzcL7x+wdvXQ2bW561Mu6mRfHVyQ+
	Ac+y0OGOaOxcbWf4I5FUS+VmxcY49XU3hoPn3z08KJwOg2UGLpquRXWHifJFu1t8B2BteK7yT+x
	PzdN5X8/APN57dyNSps64nwQpbYz6FSK3kPlyBWOl36nk+PoKG37yoKro6/qAJiYLbFgIM2JVdp
	CGmaq8SxFFrUhRMgENOb/kb6Pad3q
X-Received: by 2002:a05:622a:4086:b0:50b:2876:586 with SMTP id d75a77b69052e-50e36820d3emr367722111cf.5.1776898379373;
        Wed, 22 Apr 2026 15:52:59 -0700 (PDT)
X-Received: by 2002:a05:622a:4086:b0:50b:2876:586 with SMTP id d75a77b69052e-50e36820d3emr367721591cf.5.1776898378914;
        Wed, 22 Apr 2026 15:52:58 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50e394c1fddsm151910251cf.30.2026.04.22.15.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 15:52:58 -0700 (PDT)
Message-ID: <1b2d926b919471fd3fbaf5b79d47e1110f6c4797.camel@redhat.com>
Subject: Re: [PATCH v12 2/5] drm/gem/shmem: Introduce
 __drm_gem_shmem_free_sgt_locked()
From: lyude@redhat.com
To: nouveau@lists.freedesktop.org, Gary Guo <gary@garyguo.net>, Daniel
 Almeida	 <daniel.almeida@collabora.com>, rust-for-linux@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>, dri-devel@lists.freedesktop.org
Cc: Matthew Maurer <mmaurer@google.com>, FUJITA Tomonori	
 <fujita.tomonori@gmail.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	christian.koenig@amd.com, Asahi Lina <lina@asahilina.net>, Miguel Ojeda	
 <ojeda@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Simona Vetter
	 <simona@ffwll.ch>, Alice Ryhl <aliceryhl@google.com>, Boqun Feng	
 <boqun@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, Krishna Ketan
 Rai	 <prafulrai522@gmail.com>, linux-media@vger.kernel.org, Shankari Anand	
 <shankari.ak0208@gmail.com>, David Airlie <airlied@gmail.com>, Benno Lossin
	 <lossin@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	linaro-mm-sig@lists.linaro.org, Asahi Lina <lina+kernel@asahilina.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel@vger.kernel.org
Date: Wed, 22 Apr 2026 18:52:57 -0400
In-Reply-To: <20260421235346.672794-3-lyude@redhat.com>
References: <20260421235346.672794-1-lyude@redhat.com>
	 <20260421235346.672794-3-lyude@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59351-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[google.com,gmail.com,oracle.com,amd.com,asahilina.net,kernel.org,ffwll.ch,linaro.org,vger.kernel.org,lists.linaro.org,linuxfoundation.org];
	FROM_NEQ_ENVFROM(0.00)[lyude@redhat.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,kernel];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3879D44B5D4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 2026-04-21 at 19:52 -0400, Lyude Paul wrote:
> +/**
> + * __drm_gem_shmem_release_sgt_locked - Unpin and DMA unmap pages,
> and release the
> + * cached scatter/gather table for an shmem GEM object.

It appears that I misnamed the function in this somehow still, so I
will make note of this and make sure that it gets fixed in the next
respin of this series

> + * @shmem: shmem GEM object
> + *
> + * If the passed shmem object has an active scatter/gather table for
> driver
> + * usage, this function will unmap it and release the memory
> associated with it.
> + * It is the responsibility of the caller to ensure it holds the
> dma_resv_lock
> + * for this object.
> + *
> + * Drivers should not need to call this function themselves, it is
> mainly
> + * intended for usage in the Rust shmem bindings.
> + */
> +void __drm_gem_shmem_free_sgt_locked(struct drm_gem_shmem_object
> *shmem)
> +{
> +	dma_resv_assert_held(shmem->base.resv);
> +
> +	dma_unmap_sgtable(shmem->base.dev->dev, shmem->sgt,
> DMA_BIDIRECTIONAL, 0);
> +	sg_free_table(shmem->sgt);
> +	kfree(shmem->sgt);
> +	shmem->sgt =3D NULL;
> +}
> +EXPORT_SYMBOL_GPL(__drm_gem_shmem_free_sgt_locked);


