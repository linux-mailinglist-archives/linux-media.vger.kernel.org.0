Return-Path: <linux-media+bounces-59702-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMviCMmd72nJDQEAu9opvQ
	(envelope-from <linux-media+bounces-59702-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 19:32:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4840C477AA4
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 19:32:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 29AF33012D7D
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 17:29:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9668836074F;
	Mon, 27 Apr 2026 17:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UzwJFbPm";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="U+dkYMTQ"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB923DCD90
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 17:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777310979; cv=none; b=IP+18wxWZ7N7wxM3MJu7x79p4RwFFokWPYNPKHDOj3152X0et5XKk2zEN8TCscBrRsH2uCUd5gQjfDPnJY+rB67BYXgng/+bgPfLEZRBpuN4rD48iCeJ9ViENU3cKrSIJ/OzDtklKS8paY3jbnddvBuC9IaJQKkdeLdkFy96i6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777310979; c=relaxed/simple;
	bh=KF7u6ZoNxfK3+BpCCoO5erH9nqzrz/OiFIJaWAx89LM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H8rivSj2ouQFH/f+j7J2H+RZlE5Yamodlrb3/oKaezzD6QoaJH/TwmYH3WVzyLtC3/sSzq1GibVMbClBmeY3G4XYwTY6n/b3qWUkXiTp+2LmiftPxsZSNU9wiQ45fDBVUo7hFr6r6pY35vixJfFQ/PY+usc/yJtoFNRY3sr8fyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UzwJFbPm; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=U+dkYMTQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777310976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KF7u6ZoNxfK3+BpCCoO5erH9nqzrz/OiFIJaWAx89LM=;
	b=UzwJFbPm+yBC2sBZK6NUwy92uQMxo9PwqPVrKO020huDwOjQE/Dhmo0He/cd9RHIJS3Py2
	RvAREdBe6o8uPcns/cRUidqT36tgWBHdVp4icJwKSOLo2dSwjGG+j1tggvMVnXC1L7sZpi
	Anu2N5053xmsiOAoNLMo+zn5b7/M2MQ=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-360-PuONNAzyNWeWEnG6wjE1jw-1; Mon, 27 Apr 2026 13:29:34 -0400
X-MC-Unique: PuONNAzyNWeWEnG6wjE1jw-1
X-Mimecast-MFC-AGG-ID: PuONNAzyNWeWEnG6wjE1jw_1777310974
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50faf575af4so49671951cf.0
        for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 10:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777310974; x=1777915774; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KF7u6ZoNxfK3+BpCCoO5erH9nqzrz/OiFIJaWAx89LM=;
        b=U+dkYMTQCWqoa+j9E4uu/XZEV+p0v57FLjAaDLVCUJVWycDBnTnvf5/cC9BOwc25LD
         ytZ5EykoK50Kgp2fIuAsnwwqwwh4V8O0mkCBemcKzxSZDJEF6Cyu0lCV6t4oi0FZAVeF
         2qPYL5cL3xXNSX2odf1wKIvnGfoMGClSb8x6ffLgP1LKJzaLMdsWrr/ZWRFa4aVMd6ba
         drx0XlSZTsAaiBiwpXR6P4uo14DaktGgyDlsNVXLPf7YhivtdTiP/ZaYOENwL7GLKhwy
         lOWkbe2gl8HrkFynCmZH+RkSkPlUvITnpsu5Yirkz/8pB/STwa+QE02pqy95Yp7oV3Td
         rRPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777310974; x=1777915774;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KF7u6ZoNxfK3+BpCCoO5erH9nqzrz/OiFIJaWAx89LM=;
        b=p6Mh/fOc5v7vRsB+OV75Qg9p8p5cHrpuywnzwlBbY/JUX0IorWH2w7SjbAu3+FiP3j
         5bOFwAVXZGUpyAcwkyoeUx8GQeC23ncQVaD9bYieFGiM8kNb7gwhJWi+NP5eoyIQKTvK
         GnCzHQmKiqNzONjC7Rwr6HmR4wD+cfvq//0mxAg6766FLLKltpvUk10PejA6W7SiiD+5
         yYmG/liwyJ1i3bbxqusroNwwZW7Sx8hsXMsdsmCNRIkk6RE83xljVEjDUVMa66/xaPe3
         JUaGwVOqupvP+kd0h0skbgkz7ZzkXnOcRuILGWu5DvzYni91YgPARi2jknqSpdzgrr8R
         l1sw==
X-Forwarded-Encrypted: i=1; AFNElJ8aQbyYoD/ap7EICL6Z/ZNnyBVHaXhUERNG6Ujs2wjWADCGrqzAJDMr2BIDCBm3+4PU8kWINmHpSMHFIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSxtkgh3AQ87P3JyiSK8K3L5PZ5VGoTRwyjZM99itN3qJtxyvq
	nS29AARbIbT3s1eUEGG6IaxG3FCVeBYkKPzN2MiwySC2oUc52nyr02NLCY1O/OFa0GOQrGsjqqI
	vkp8v00RDzisKvXD0vaNsM4dauy6UiuJmWuTFCRg4CI+M0wDrFcrgtJza813fO1+R
X-Gm-Gg: AeBDiesDNzT8ft3DirqjEhs1HURVrPCMU6IxusXsOEFvhSIp6WJ+00F+q5rwvtYmL85
	+BVHG3fwsphcQZ6mQmOZcmUpu9ddpzFUsa8Y193G7t+LIAkm25lZ61Tn8jMPR1PItW0TZN/XMmS
	azpjyiVhsqBDT3bvcx4gexeJ+v76cKDmzv7Cce7/Skn1DTaRv80vA9Dr79Lk1VdyPzpyFBEpPxL
	NOzF9y8fDE2uV/Jb9vVK3ik+6pSHDj7YOjcRjCjcAi0zAqmSJoXKj2hIYVFMrAJPodplV5hTNS3
	mtAY1xpMZLef3LukKoh5eeiJjOnSTZfvS2CMxaxRywiHUPdy4YnU2Zqx88o7lkkTcOIxRdD1PcU
	c7QQhh2d/OxEb99GXMMRa00Spdpx/
X-Received: by 2002:a05:622a:486:b0:509:1009:e7a6 with SMTP id d75a77b69052e-5100c97933emr2571161cf.43.1777310973783;
        Mon, 27 Apr 2026 10:29:33 -0700 (PDT)
X-Received: by 2002:a05:622a:486:b0:509:1009:e7a6 with SMTP id d75a77b69052e-5100c97933emr2570391cf.43.1777310973161;
        Mon, 27 Apr 2026 10:29:33 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b3e29932fasm285886d6.45.2026.04.27.10.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:29:32 -0700 (PDT)
Message-ID: <2f8a8b96473d99cee6f33075532a97f956ce21bc.camel@redhat.com>
Subject: Re: [PATCH v12 5/5] rust: drm: gem: Add vmap functions to shmem
 bindings
From: lyude@redhat.com
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: nouveau@lists.freedesktop.org, Gary Guo <gary@garyguo.net>, Daniel
 Almeida	 <daniel.almeida@collabora.com>, rust-for-linux@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>, dri-devel@lists.freedesktop.org,
 Matthew Maurer <mmaurer@google.com>,  FUJITA Tomonori
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
Date: Mon, 27 Apr 2026 13:29:31 -0400
In-Reply-To: <DI0MII8J4P2Y.309VKYVMQJNVK@nvidia.com>
References: <20260421235346.672794-1-lyude@redhat.com>
	 <20260421235346.672794-6-lyude@redhat.com>
	 <DI0MII8J4P2Y.309VKYVMQJNVK@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 4840C477AA4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59702-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,garyguo.net,collabora.com,vger.kernel.org,kernel.org,google.com,gmail.com,oracle.com,amd.com,asahilina.net,ffwll.ch,linaro.org,lists.linaro.org,linuxfoundation.org];
	FROM_NEQ_ENVFROM(0.00)[lyude@redhat.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

On Fri, 2026-04-24 at 00:01 +0900, Alexandre Courbot wrote:
> > =C2=A0=C2=A0 dropped before obj.
>=20
> I am not sure this is enough to solve the double-free issue -
> although my GEM
> knowledge is lacking, so please take this with a grain of salt.
>=20
> Take an object where we called `sg_table`, so the SGT has been
> created.
>=20
> When the object is dropped by DRM, `free_callback` is first called.
> It
> calls `drm_gem_shmem_release`, which frees the SGT.
>=20
> Then, the `Drop` implementation of `Object` is called, and `sgt_res`
> is
> dropped... which attempts to free the SGT again.
>=20
> I haven't tested that and rely only on a quick look at the code and
> my
> partial understanding, but the correct fix appears to be to clearing
> `sgt_res` in `free_callback`.

Whoops! No you're right, and so is Deborah (she mentioned this
previously, but when reading through it I completely forgot that
free_callback() was in the picture). We can't clear SetOnce, but we can
use mem::take() which should be essentially the same thing. Will fix in
the next respin


