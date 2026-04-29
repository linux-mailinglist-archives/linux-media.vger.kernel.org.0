Return-Path: <linux-media+bounces-60029-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHfgOfF68mnjrgEAu9opvQ
	(envelope-from <linux-media+bounces-60029-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 23:41:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3A649AA72
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 23:41:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5201D301D944
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 21:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB71C3AF64B;
	Wed, 29 Apr 2026 21:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="LuyuGTHZ"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA4C1A6819;
	Wed, 29 Apr 2026 21:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777498861; cv=pass; b=jsxHIhg+1n/GelaSWbLVSFu2DTAMubil8+0LDUNjJlvu4RJutWhlF7jrXt/LSa89S1FSg0SnVj0LLyjKaIEeU++WNw7mRMK558cTFs6xS449foK5uglXKfv0jsO5MvVAn7+/TGx2lkuDKrwhhMc8S5gYuXnrLq5OnaAbDKJymts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777498861; c=relaxed/simple;
	bh=XhfsTHjqlUcyLZ6dzOKc30l41HRbYIjARVccHlZfkUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I7FMzcxvf1Gl6alk1dmXq2wyjDIFcHyk0cOTQ6V/JOCH5eS8+AVT9WCXCg4zyiE9P5vlTrdbInOSIs8ufJ6QEv5r99161YC9i5AxePFrs8ESfiBWkIkSMIii1/fz7m+dOcUv93Jii4fuzwTNxOjMw9R5ZrMid14uKXEAjF3xRqY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=LuyuGTHZ; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1777498828; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iIg3N6KVM9tGksa69tR+Rw1tKEpC6Drno8ArxLJ+CAFg1++FHLqbkE/kTIoPArU6/Zme/Z5PcBWTjDWJuP1LP5LMUgNPrh0uE+FY4rBjxlsNHCqIQTFTE416t+j0Iu8NgXAyPnFFLs2nj3vXx5l1sAgt9hVUYIkk55j5eOeaxbw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1777498828; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=WJX7xHCfvTT+uoYdGdgResyGTcDES1g9sRJnLBitFRQ=; 
	b=npG/D4rtyXZda4rONm0viZ5L1zr5IWnx9dwv0K6yYVWUiC0b5+GRxvYd2rBAK8elrBhRwiXJ3Etk0vCGml+7DGylGGXSjmFMauds/0KMrzTAv4dWkbK6W2B15uuoq8Zeq4s3llV1WuopU3VyBeYfcpCjzqkUuKg+Bjn2oSk/6fQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1777498828;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=WJX7xHCfvTT+uoYdGdgResyGTcDES1g9sRJnLBitFRQ=;
	b=LuyuGTHZLbfXwpbIMZKOdT6zYqCBj4Na+Yeg3vPMSnUTr5q4KBF+YBb76zVsjYa4
	ePRNj3SgjFJgMyEqoS5x68X1qTdST/sl+8Bv4BOw0/hi5T6oyHrxfEyiyXLg+t3DbjQ
	wYI48w5ZSKE6nIzfZEaA3wuQBkZvkj+lQoOk/OLo=
Received: by mx.zohomail.com with SMTPS id 1777498826399615.4481576439005;
	Wed, 29 Apr 2026 14:40:26 -0700 (PDT)
Date: Wed, 29 Apr 2026 14:40:25 -0700
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Lyude Paul <lyude@redhat.com>, nouveau@lists.freedesktop.org,
	Gary Guo <gary@garyguo.net>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
	dri-devel@lists.freedesktop.org,
	Matthew Maurer <mmaurer@google.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	christian.koenig@amd.com, Asahi Lina <lina@asahilina.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Simona Vetter <simona@ffwll.ch>, Boqun Feng <boqun@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Krishna Ketan Rai <prafulrai522@gmail.com>,
	linux-media@vger.kernel.org,
	Shankari Anand <shankari.ak0208@gmail.com>,
	David Airlie <airlied@gmail.com>, Benno Lossin <lossin@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	linaro-mm-sig@lists.linaro.org,
	Asahi Lina <lina+kernel@asahilina.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	kernel@vger.kernel.org
Subject: Re: [PATCH v13 4/5] rust: drm: gem: Introduce shmem::SGTable
Message-ID: <afJ6ySox_f7g0sfn@um790>
References: <20260428190605.3355690-1-lyude@redhat.com>
 <20260428190605.3355690-5-lyude@redhat.com>
 <afG_HUjCMH2qKjPS@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afG_HUjCMH2qKjPS@google.com>
X-Rspamd-Queue-Id: 5A3A649AA72
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60029-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deborah.brouwer@collabora.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[redhat.com,lists.freedesktop.org,garyguo.net,collabora.com,vger.kernel.org,kernel.org,google.com,gmail.com,oracle.com,amd.com,asahilina.net,ffwll.ch,linaro.org,lists.linaro.org,linuxfoundation.org];
	TAGGED_RCPT(0.00)[linux-media,kernel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,collabora.com:dkim]

On Wed, Apr 29, 2026 at 08:19:41AM +0000, Alice Ryhl wrote:
> On Tue, Apr 28, 2026 at 03:03:44PM -0400, Lyude Paul wrote:
> > In order to do this, we need to be careful to ensure that any interface we
> > expose for scatterlists ensures that any mappings created from one are
> > destroyed on driver-unbind. To do this, we introduce a Devres resource into
> > shmem::Object that we use in order to ensure that we release any SGTable
> > mappings on driver-unbind. We store this in an UnsafeCell and protect
> 
> Outdated? No longer UnsafeCell.
> 
> > access to it using the dma_resv lock that we already have from the shmem
> > gem object, which is the same lock that currently protects
> > drm_gem_object_shmem->sgt.
> > 
> > We also provide two different methods for acquiring an sg table:
> > self.sg_table(), and self.owned_sg_table(). The first function is for
> > short-term uses of mapped SGTables, the second is for callers that need to
> > hold onto the mapped SGTable for an extended period of time. The second
> > variant uses Devres of course, whereas the first simply relies on rust's
> > borrow checker to prevent driver-unbind when using the mapped SGTable.
> > 
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> 
> >      obj: Opaque<bindings::drm_gem_shmem_object>,
> >      /// Parent object that owns this object's DMA reservation object.
> >      parent_resv_obj: Option<ARef<Object<T>>>,
> > +    /// Devres object for unmapping any SGTable on driver-unbind.
> > +    /// TODO: Drop the mutex once we can use Init with SetOnce.
> > +    #[pin]
> > +    sgt_res: Mutex<SetOnce<Devres<SGTableMap<T>>>>,
> 
> As far as I can tell, you don't need this Mutex. Also, it causes
> problems like requiring the reference transmute below.

I think it is also causing a lockdep warning pointing to this sgt_res mutex.
It only happens when KUnit tests are enabled.
If the KUnit tests register a lock class for this mutex first, then when Tyr
later locks it via sg_table(), lockdep complains about the same key being used
for a different class.

> 
> Alice

