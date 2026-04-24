Return-Path: <linux-media+bounces-59566-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFMbNGn462kKTgAAu9opvQ
	(envelope-from <linux-media+bounces-59566-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 01:10:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65591463F99
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 01:10:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 99CA33026CAB
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 23:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A30436F426;
	Fri, 24 Apr 2026 23:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fgRIJhlb";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="XUBFS90S"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFA2311C35
	for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 23:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777072221; cv=none; b=JXbKG0zyB3k0HXavQUsK5Wb0utCkKqy0BqMuWtadM7Y957hVUCszdTog43Pqgw3YaHF8vCzqALtzBhpY1WoP5mFU1kvqD16nPzUMbOXulUYAM/zzIKWG7yRmP8iyns9E7gaEXVxlJKb6le1KyLly28b1U267ePC5IVOfRRYMGuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777072221; c=relaxed/simple;
	bh=N09YNoupJhmv1sapC/t38hsbn3OUvdSVBkUzd+3dwtM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Pm/vQ/sphHoqZK7w2I9a4Z4pRV61d+S1Khlvs08lwANpDPMU7IP/l5lSXtnBJEoodOR5oB7m1BT5xt0Ac+BYJapSI5EaU1+JSABFvmyqoq2JBR/CQGpfgJHdkN8e4eMkDbfrHBcqBBP8Ary6j7oHICZkHHYqf8JFsUOUnnL+Zlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fgRIJhlb; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=XUBFS90S; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777072219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N09YNoupJhmv1sapC/t38hsbn3OUvdSVBkUzd+3dwtM=;
	b=fgRIJhlblErDzfxZL7WOdBVvGI2JqM5hI6/SWvu0nYBP1PbASuHWqyDa7V5D6MygffIHw/
	oK4/eeB0miQjOWA18LbtEUMrK3xDmx/sUQA/pnQ71s3hpUOvWCD6+tyowCABciqiMpQEMf
	MFbAph/bl6oEPmFwsD8qfbJYbFK6kzQ=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-6r2z6EXKOfqwPwPdLvuz3w-1; Fri, 24 Apr 2026 19:10:18 -0400
X-MC-Unique: 6r2z6EXKOfqwPwPdLvuz3w-1
X-Mimecast-MFC-AGG-ID: 6r2z6EXKOfqwPwPdLvuz3w_1777072218
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8eb52a22eb6so1227274185a.0
        for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 16:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777072218; x=1777677018; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=N09YNoupJhmv1sapC/t38hsbn3OUvdSVBkUzd+3dwtM=;
        b=XUBFS90SeyLLNtOpgSR8qBWFiAzpkt4Hi1jRwvxjhGzXmlCo3HFlYrmistM+4G5moy
         4uwDLoYlCUpl3oTZ5Tq9I55nhfas9Sd1daH8vgHmJ5QgZjlALv96ICTwmvNGsMTLSYrH
         gBd63GHhBxPu1HNkAKzWtz2H8+QW7D58u+0EYqomWW++PdxwJ4XIyBpGJrXPRJksGWkp
         f8CKZSekYRp+fPIeFgX+JMxsexo/iaFbhOabGH/NaHS/YCZMaLxfR4kcjtIU1Bynl62E
         yNoizokHP9cZ1mVNXnrME6fH23UpeVCSlzWxXc9A26K6+fEJISSy588p7W6Y0jHTppKr
         637Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777072218; x=1777677018;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N09YNoupJhmv1sapC/t38hsbn3OUvdSVBkUzd+3dwtM=;
        b=LyRPYVO/mPGjevsiLjM+5QjCeetUd23gKPl+QFeJaM5ob91Svc78mTPiYYePHzxjWO
         F1TF1SJucBvzMkHZld7p/BnO5QA8wr7ydTwYwl+BtDVw1iATCVAYESK6lIISnwP030Xf
         nvHQS8WLSvXMf9WYLW2OLX1zrHqoGEZsy0mfm+QwtVg+0SbER8WKCjQFzwqdSQPjkr32
         OuuU9AZkO7dlQzFJZh/jDEsEQC2hDH1X1MedraDkvREWX0TV1yJ8V0EzN9lbKPuga0q9
         zWxGXfhXD3cAkwAgB5aspfplZnCoSqwKxlL5AxmxhpL2YKquyXP+qGPcIjNH5mMUpuUC
         8ENQ==
X-Forwarded-Encrypted: i=1; AFNElJ/rVCgy2s3hoXNUXTGts6jcObOYWuSsJMA6RCXI/aPIXDWksD+aa49i2PPnKosXYpcwMy/fcBTyp3GaSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQkdZVlfnNlstn44nncHHwQMeOtVd99LTlZ54VM8Lpj3g3viDF
	uD0Pcrw1ylIO6PSeCDj71egbieQmqy0NaQlQVUZfUXBRCMEvQn3OT3dDgaz4DHCD9lu+CFsyQSe
	6QicBIID+kvIV+xusH3LbMigu6teOQX0Bld6LAC058fBX2PyAqN8d0Yd0HSlqHr6P
X-Gm-Gg: AeBDieulraI1FKJqaRqPtkUsXjpjaUJnDOSmFPghHalWC3L806k9cHmyOhR+xbYbaYm
	dAb1JSH5rXx9XLmMhFLfYR0uDwzMIJfKyyDORS7Rkcg38YV2SxP+fK+fVg9ylt8p1XHfq4B7F9y
	Jjp7soRYO6ewbV2Gtq/vb0Q1n3RICaQv3zpUBicnWYideR04afrDpbouz52JgcLILahjEZKR5zK
	gfJuNHFbDSwh1q3/4SyWCUDclWTemPtJadM+LEimbZf82i28M2igHIqHpmKltFu/WAyOtPqxY7y
	LqVa+j7s+PbO5eTca3qA5IU69TxdC3RdYg6n3BQVrCIRniyUOWHtfUa5N9HLJCUJyrUsKwwyFgI
	zxvIIAfpd27UrSyctLi9SGbJdzRdv
X-Received: by 2002:a05:620a:f0b:b0:8eb:cbf8:85e7 with SMTP id af79cd13be357-8ebcbf89261mr3123558885a.34.1777072217896;
        Fri, 24 Apr 2026 16:10:17 -0700 (PDT)
X-Received: by 2002:a05:620a:f0b:b0:8eb:cbf8:85e7 with SMTP id af79cd13be357-8ebcbf89261mr3123553685a.34.1777072217335;
        Fri, 24 Apr 2026 16:10:17 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8e7d69ad48asm1913863785a.19.2026.04.24.16.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 16:10:16 -0700 (PDT)
Message-ID: <ed26658c461020547e058b237575324adcbaca59.camel@redhat.com>
Subject: Re: [PATCH v12 4/5] rust: drm: gem: Introduce shmem::SGTable
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
Date: Fri, 24 Apr 2026 19:10:14 -0400
In-Reply-To: <DI0MI6UF325Y.2TDWZGCN3WGIG@nvidia.com>
References: <20260421235346.672794-1-lyude@redhat.com>
	 <20260421235346.672794-5-lyude@redhat.com>
	 <DI0MI6UF325Y.2TDWZGCN3WGIG@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 65591463F99
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59566-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]


On Fri, 2026-04-24 at 00:01 +0900, Alexandre Courbot wrote:
> There are 4 sites where we acquire and release the DMA resv lock,
> each
> of which require unsafe blocks and carrying the risk that we forget
> releasing the lock in the end. For this method in particular we need
> to
> jump through hoops a bit and store the return value into a temporary
> variable so we can unlock the DMA reservation.
>=20
> Let's do ourselves a favor and implement a small, private guard type:
>=20
> =C2=A0=C2=A0=C2=A0 struct DmaResvGuard<'a, T: DriverObject>(&'a Object<T>=
);
>=20
> =C2=A0=C2=A0=C2=A0 impl<'a, T: DriverObject> DmaResvGuard<'a, T> {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fn new(object: &'a Object<T>) =
-> Self {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAF=
ETY: This lock is initialized throughout the
> lifetime of `object`
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe=
 { bindings::dma_resv_lock(object.raw_dma_resv(),
> ptr::null_mut()) };
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Self(o=
bject)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0=C2=A0=C2=A0 }
>=20
> =C2=A0=C2=A0=C2=A0 impl<'a, T> Drop for DmaResvGuard<'a, T>
> =C2=A0=C2=A0=C2=A0 where
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 T: DriverObject,
> =C2=A0=C2=A0=C2=A0 {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fn drop(&mut self) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAF=
ETY: We are releasing the lock grabbed during the
> creation of this object.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe=
 { bindings::dma_resv_unlock(self.0.raw_dma_resv())
> };
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0=C2=A0=C2=A0 }
>=20
> There here you would just do
>=20
> =C2=A0=C2=A0=C2=A0 let _dma_resv =3D DmaResvGuard::new(self);

I thought of doing this but lost track of how many times I was actually
grabbing this lock=E2=80=A6
BTW - want me to just give you authorship on the patch for adding
DmaResvGuard? Since on my branch I've pretty much only just added two
inline annotations, it's otherwise identical to what you wrote here.


