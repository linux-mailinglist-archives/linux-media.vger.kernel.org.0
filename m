Return-Path: <linux-media+bounces-59051-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGliLIaO4mkc7QAAu9opvQ
	(envelope-from <linux-media+bounces-59051-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 21:48:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 477CF41E5FA
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 21:48:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E403130B180A
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 19:44:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E42B358394;
	Fri, 17 Apr 2026 19:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ScaF/hWL";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="It09TyNk"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECAA33B6C4
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 19:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776455071; cv=none; b=OTAd0BOtvzD/hNSy4Xl75n4GbqW0MgD++JVmEiI0eWbTJnnvRtlQRDoLuqQJsoQ9Y6EFs8tU3V/SfWmKbFJfeXjm959M7WZpEKemilTfzi00dBpMM7kHfEPqB9iQPD1InjuSQmN7N/z2oA0oCdgCOwF8JPmvq3qGCu8SncVZg0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776455071; c=relaxed/simple;
	bh=4AUae5KcEeFvFh3msKQXl5hQJhIopamMvxo6YZ4ukss=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M32zPGw0OqVPjjpv21kwWUKQnEDqB5L9IjKlq1OxYib30pW50lLbPUSO9eVfh+uca6EBgR7tPHiM+Ii76Yy+9j8o6OBGxRZMpEyscev4DKlRxGDJV6Ktx+D/JGAWMfTBh9WukeuYdwCWExN2xJ7ahZG0irU5eawfrBdnFzURKjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ScaF/hWL; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=It09TyNk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776455069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4AUae5KcEeFvFh3msKQXl5hQJhIopamMvxo6YZ4ukss=;
	b=ScaF/hWLflWAYuk0Z4w1zIK1BB61+gW2jXF0SUApYSVe4x6/DlccDRXxhm43jDEX7nGOx9
	zpJDpXFvARmjPhSqh28hZWVRlV5edsVAyQnK5OAATzw/144O3EdunQlqWyGIvYlNIBil47
	UtPKuX9K10QLLhIKOqjAgb62EcvYM1s=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-4cHM6yUFNnqPKXTuRVZY3w-1; Fri, 17 Apr 2026 15:44:28 -0400
X-MC-Unique: 4cHM6yUFNnqPKXTuRVZY3w-1
X-Mimecast-MFC-AGG-ID: 4cHM6yUFNnqPKXTuRVZY3w_1776455068
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8d654ade33aso505891485a.1
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 12:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776455068; x=1777059868; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4AUae5KcEeFvFh3msKQXl5hQJhIopamMvxo6YZ4ukss=;
        b=It09TyNkeaLuLq5JOmeUiG5518HDXWICADLfS3+mSr1U5uJunkN3tAs/bV+C3ps2+7
         2BZ3lNNWZb+6yigizMHWKwGDfNaJQwX6DNMYzJF/uOBgzqk0XrEN859HEHWTap0LeWVn
         ugATgajPluFBWwADLZ/q2zkqJ2XBATjslOCaWHquZ78Xo2N1aCdlbR3Iz+IbqOD+dsCj
         C79SbHKoic7WxxnbzGtw41W+FwapM2HlvMkUDEspdsBuGG08krlYveFZdmEpipq7nTVn
         wOV5oeZcwW/5q4Y4XVgrtRYGDShNpnfUZbWKGxIy0Q/4pnoGB8T6jvTBFRWdU8ZLQZxj
         8lNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776455068; x=1777059868;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4AUae5KcEeFvFh3msKQXl5hQJhIopamMvxo6YZ4ukss=;
        b=KkS/Q3MghXvowTNdtq2V8wnM4182/IZl9Z67oIhDuZvp2easl90AKfcHOSILDWV/HH
         t7YosGqPOr2ns85k1TtR+1y5IbDyKSrCyxDBOYW6Yy/Lq1neyDLCxBbZQNUrP6ztpPD7
         J3a8WOJN7K2qiCW3GI2hIN7Rg3vD1QFjSY8JAhGhjy3tbWPJtmE2XMK51K4Wzza8i08s
         nCX2W13Z/7f5lHuL3L0aJ3b6cYMimUSEWqefs3Gv4J5twTS41gWafOe9PBkawKnBtYwD
         2f8uRwjPVttqsqyOrJVD2CeDYlQlt88y9dST3l65gsRrfmVZkbkeVbrJ/WUTf2RKxNHB
         XFDA==
X-Forwarded-Encrypted: i=1; AFNElJ+OqTFb8tmy5rRPoxz06mceprjIKJS7o/8HX/702WyBUChRbdoF7v42ApmPeMwpKW5RbZvVfbo3DWisag==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlbj8vKuAIMtu/tFHBKXv2CWngKU0zvEs9DDK/+aLa6luxzhdu
	zPBNV1VaOHvEQqjvuZiUEL+7jbzIav0TM78dfGOmuTlVasBU0Q/MPQZD/wHm5Tp8cZH3e/Sdan+
	o/94hTTKV6pnvfx1lBWtcUbc+w0XujaXy9c37VQzT9kzVdgkmZErE7j3J8j9stGp/
X-Gm-Gg: AeBDieuI0v5/3FuX0nhMTXZrPReSAXW7F9R/1nYqfEX3LvhyxnEJwsrxf3995jY0MCv
	CD47uhaQkR3Rasfakm4z8ZqeWj72Y4ULdWg54HXb/ix5Q3d9QaJ3in0kPmL1P5dIPenqUu8hZQm
	f+7gjIJT8nMHPJ2Qco4/dWGaS6MmxPyTiAa9GE0tmQmM5H9aEvj5xx1iXl+bd9EEAr86kJQv8IS
	keGJMhkzw3Wr0Spzt+21bVTjhn3x8YmjNrNX/SoXRiogXGnzHt5DFQx7p6bATqb7IO7Iaceygk0
	qLBlTrnR3pa7BsA4muHccVF0iToJVqpgUEtWnCoGitAyMsmwlh0eBFG57HpsowRvqyVSRjIWb1p
	yM9JDfM4/BgHGZfjXKeTEgQRP4QF7
X-Received: by 2002:a05:620a:4408:b0:8d9:ca3b:5ca1 with SMTP id af79cd13be357-8e789c5ab1dmr528961585a.9.1776455067633;
        Fri, 17 Apr 2026 12:44:27 -0700 (PDT)
X-Received: by 2002:a05:620a:4408:b0:8d9:ca3b:5ca1 with SMTP id af79cd13be357-8e789c5ab1dmr528955585a.9.1776455067197;
        Fri, 17 Apr 2026 12:44:27 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8e7d9abce59sm243352085a.46.2026.04.17.12.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 12:44:26 -0700 (PDT)
Message-ID: <ba9d6fbd12a42d95e6349e232111d5e72e88e1d3.camel@redhat.com>
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
Date: Fri, 17 Apr 2026 15:44:25 -0400
In-Reply-To: <DHPBAVQHIM11.XVBHOWYFRITF@nvidia.com>
References: <20260409001559.622026-1-lyude@redhat.com>
	 <20260409001559.622026-5-lyude@redhat.com>
	 <DHPBAVQHIM11.XVBHOWYFRITF@nvidia.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59051-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 477CF41E5FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Just so it doesn't come as a surprise in the next respin - I don't
really see a reasonable way of using get_or_insert_with() here (though
I had no idea this was a thing!). However - I can get rid of all of the
ret =3D statements and also clean up the indenting a little bit with
block expressions as I forgot those exist.

On Fri, 2026-04-10 at 16:55 +0900, Alexandre Courbot wrote:
>=20
> nit: let's use `let ret =3D if let Some(sgt_res) ...` to avoid the
> multiple `ret =3D `statements?
>=20
> Or maybe even better, you might be able to use
> `Option::get_or_insert_with`.


