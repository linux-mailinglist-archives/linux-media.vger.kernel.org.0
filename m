Return-Path: <linux-media+bounces-59052-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBehGgKO4mkc7QAAu9opvQ
	(envelope-from <linux-media+bounces-59052-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 21:46:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0495D41E5A7
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 21:46:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D62BE3047DE2
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 19:46:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4957396D08;
	Fri, 17 Apr 2026 19:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IljC20xI";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="qEEUxVA0"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E332332EBC
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 19:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776455160; cv=none; b=tc/WexwazWVMniJxVfG4lZupjMCA+oX1E5fhvZAT+qWCysQwDr11J0eoxwXwImYPSdv7tddxgDFG6QwsyYrfsOuXe9ql8bCDwP0u6C7R+iC3qaj6lS8pBeWwljaPicvXcS5qRc3Wdf7i8HzigeaBjgJqvAjm8ADwL97kNwNcTUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776455160; c=relaxed/simple;
	bh=JyF/IwexmA4DSB1w6L4ViBDKOIzXHAQn3+2YDMuup0k=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a+xL6WwZ9kiV1dcu8txAMRrlI1zxBTkJQMUTc1JNYx5TFDuBAWFH/bt/rG0GAjPgmAfd8tPeCP9fnkXl42BG8nXI+INCgxa99ecnSglbfR4iINPUDkzA4Mz+1FR9DKvtM6tBuV0DvDbB3ICgOpva9eaX0vzQS8MiUstVUNdM9lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IljC20xI; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=qEEUxVA0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776455157;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JyF/IwexmA4DSB1w6L4ViBDKOIzXHAQn3+2YDMuup0k=;
	b=IljC20xIYWYrN4dSdX9mrhR2AR7c+JVguMMJTqcl3ArWzc26k2lUIqdOvft/kLOb++3D8i
	upk7jlC55qFcyanZw3/BkwKl8pxJD6oEaIY4VIBDUA8E2l+wcbR8KhbvP+hx6OfrAPC6t6
	AIraucfRShjK9vTWpOtC1K46KGVeZQA=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-Ms8F0oLGPc-JGWfy-hh4Aw-1; Fri, 17 Apr 2026 15:45:55 -0400
X-MC-Unique: Ms8F0oLGPc-JGWfy-hh4Aw-1
X-Mimecast-MFC-AGG-ID: Ms8F0oLGPc-JGWfy-hh4Aw_1776455155
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d63962d83so25372741cf.2
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 12:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776455155; x=1777059955; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JyF/IwexmA4DSB1w6L4ViBDKOIzXHAQn3+2YDMuup0k=;
        b=qEEUxVA0IV6REYPA9Y7hgFk7JzhuBvKifWYV7gJMpDj8k5GLzScMqhicGGVT/g8lk3
         fYrDErv7fEghafGtQIhaHY6s6NsArM/oYgUeUHluaDpqpPCj2aer8nQT7rAS8prkx33/
         xj/qKi90syAGCfm8fdF2lMIGRHALhF/kBj3iYPUY51d8XaKefTtS6Qcng6UtUfjz+FaW
         CTs3gBSF8R3qYTAe5iTvRzmyEDezfW7XPHiyJy1inQ3F1rVoZPF4WXkQud9Rkq5I45hI
         qKEwHTY9XTDwG8bbWeFMl7jkERZrKnL84nnFQ0Fw9K5/DkRwSQtLK8vptw66+GR2Cptr
         98zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776455155; x=1777059955;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JyF/IwexmA4DSB1w6L4ViBDKOIzXHAQn3+2YDMuup0k=;
        b=aD6NOTpp4NZ65+PqCtqEuAWAU9W5xnl9ShnKcRlqymt2MhS/FNn/Evmf+ESzsaFpr5
         Ud0g84VCXUCxZMQgg61kURzrnjmhc7q4zqs9OlpuP1N3ey0ptfianB1/P4XmCwiLq0AI
         H7yjxJulX9lSzELtdBRXov/ym7u0Qfss55ZZIq9NZ7jwYc4mDMGx7182P8ZDVjR9komk
         X4IX0Jz4pgQFd7Z9p06spFeG8yEugeqrlUe6GwLg6RPmcDgP6W3rm7Bn+eh63Yihxi9J
         TNIvu8dhHzIHsGjIUYsuXKWQApetcOU794pDWEEufMAxFD40bHqMXQLGlg58cOwUFZrk
         IS4w==
X-Forwarded-Encrypted: i=1; AFNElJ/4TzvlvNdUCksxPLRqGwp4jGQz9XzRnsUoA8iNZ4KFAaj3QH+CREg2Hhj/DZFJ+wC2ExCoxrwsZjYJaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe5pL4fQTIylkXHNWtv/dQr5QLqSVCUyrXAB5zNXOAJBJSlFX0
	sukEz+mJQ3vAwVfTX+eZHPX/mgac3QLzw6HLmlQ9fKqBULk3s8de7RXJZg+TkRPIfNGI0qojFqG
	hVe9cWvV6accihDYACQODyW31QtYBiUlqvSHJEoMi/xgLsw/HofCuZ37i+hx+EuqE
X-Gm-Gg: AeBDieuUHzWrJ600ktcWmlzNeB5KBoqXArp00hcuRNW/FwOerPeLONMEWhao+sfoaNz
	fuHO1N8WEAmRjGyctdnkr8sWK9qwc+bmFz9BnUwOVkzq1pbb7PbgNamOQs/bnq0vqYGVfuQBk00
	kNgMigWrZIPUtTe7Nap8lKzgNhfqjOnFljkLYP7HIPnhKo77MRWx0BaREWloJ6b/u55MX9CvX+b
	Z43OWOMmzANnkslYzHNPpDf8plC9MtbOJz0q2iuHcODemKtmYej2zqzmmMfaaeAvuhsoFk31LoY
	/iEpIJYm2hWe0ViSb/JkSnj4kXU34CTrFqGRUNp8W488KRTXHpwMSbx78qVUJk2D2lVBqyLpwWV
	1ZTKCAibKKlNP/Ypc13avnBZvqkhc
X-Received: by 2002:a05:622a:1189:b0:50d:84a7:72d0 with SMTP id d75a77b69052e-50e36e9c0c7mr60319631cf.36.1776455155164;
        Fri, 17 Apr 2026 12:45:55 -0700 (PDT)
X-Received: by 2002:a05:622a:1189:b0:50d:84a7:72d0 with SMTP id d75a77b69052e-50e36e9c0c7mr60319041cf.36.1776455154662;
        Fri, 17 Apr 2026 12:45:54 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ae97347sm18023616d6.41.2026.04.17.12.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 12:45:54 -0700 (PDT)
Message-ID: <34695156e1db9195eee105bcfd89b554b6ad32cd.camel@redhat.com>
Subject: Re: [PATCH v10 4/5] rust: drm: gem: Introduce shmem::SGTable
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
Date: Fri, 17 Apr 2026 15:45:52 -0400
In-Reply-To: <ba9d6fbd12a42d95e6349e232111d5e72e88e1d3.camel@redhat.com>
References: <20260409001559.622026-1-lyude@redhat.com>
		 <20260409001559.622026-5-lyude@redhat.com>
		 <DHPBAVQHIM11.XVBHOWYFRITF@nvidia.com>
	 <ba9d6fbd12a42d95e6349e232111d5e72e88e1d3.camel@redhat.com>
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
	TAGGED_FROM(0.00)[bounces-59052-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0495D41E5A7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

...realized the moment I sent this I meant to say labeled block
expressions, but also I realized I won't need those either anyhow :).

On Fri, 2026-04-17 at 15:44 -0400, lyude@redhat.com wrote:
> Just so it doesn't come as a surprise in the next respin - I don't
> really see a reasonable way of using get_or_insert_with() here
> (though
> I had no idea this was a thing!). However - I can get rid of all of
> the
> ret =3D statements and also clean up the indenting a little bit with
> block expressions as I forgot those exist.
>=20
> On Fri, 2026-04-10 at 16:55 +0900, Alexandre Courbot wrote:
> >=20
> > nit: let's use `let ret =3D if let Some(sgt_res) ...` to avoid the
> > multiple `ret =3D `statements?
> >=20
> > Or maybe even better, you might be able to use
> > `Option::get_or_insert_with`.


