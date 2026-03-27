Return-Path: <linux-media+bounces-57208-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PWlGjBUxmkkIwUAu9opvQ
	(envelope-from <linux-media+bounces-57208-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 10:56:00 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C443420F4
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 10:55:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 58CFD30A5B40
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 09:53:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80B5F3DA5AD;
	Fri, 27 Mar 2026 09:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kkZaA45M"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DA13DA5C9
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 09:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774605198; cv=pass; b=kVSPOrG/QsA74gCCA12ReD0fgtYA5w5kwMYt7sNqcBCEAforsII5iBSzdZyClVkh+ehaCoqhm6CNxP1nHQ3WBHlua+5HsEjPb3QpxxHi7PcH1FaMeHMkpOIXLI82ExSBMAa4CxIj73qDoGZIo5kMqQjJYmDwPIAxdpjhWHyucVA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774605198; c=relaxed/simple;
	bh=aepuwxT3La0r7vtalBiO5r2dCdjcwIjPYF1LVnwzA5E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NJIj9ox4EAFc32ttKuutzdfIadqPgukgjPLLRYZoUu+kyJxMPMTIiJM8QCpDVSlPs+Y1ReTxN14/XrUFRzNIe7yXVzVqJfdzICS0FyDo7RgjLCxBs7KD3rfK19DC3tguMVIJk2bl5254rZTM/p4b1X0LahmhqcahyEdtLuzyIbU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kkZaA45M; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-12a6b260693so247805c88.2
        for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 02:53:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774605196; cv=none;
        d=google.com; s=arc-20240605;
        b=JY2nHqfQGGIeLMkiEyXU/eprVrlo8vKf/t/AEir6NeKPWbwH3VT+xbv1yrzrJAGU1N
         wC811qb2fGOgR5b0fijST6KXM9f4RpDzpWURLO950OrnDL9quvvsVaquk9MdCilpjv+p
         eb61rmKE2FOoT91iNLixMEaWW7pbWDWJSdKuUqFvT7XHVAVEyEKj1aSznkBrxPvvB/Ch
         KB6LwQHORqi/7ippEcA9pE1qHjv//rN2Yd9mHFKA5kfMeL6vNSpUC1HL85ui26H5ZqO+
         Tvr8gG65EM6ux8y3e+fsyc4cOP0665kj7ZMfeCNIUDm5YLkNMYpnnQkUW9KggjXpnVhc
         QwVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v5btyYX9lHdsVC1fopO/cY1LA4YDt+YdOziS7/7GqeI=;
        fh=tO3PX2nYceLeHOCLVb0TF+6XUR6I8Cbx4xNDZ7JrioQ=;
        b=NKVKdQRBtDNURT66P4FS/6/cauD3V8ZBqkCq42kOJMMF8o2XPZ6ZeHHppaHdnlMvan
         9AWq3XE/6rHPNSKkU35n1/cx0PsYcnYkqe6E57nJrQh0uR80ukl7i9eKlL6Lrz3jXb1j
         Qd8o+LNf2gBXZhF2ERQHzA2/MbJ18wy/siDh/NT3Ca/ftB6EZ5N9RtFc2oMYOYwNAzoZ
         VlySJYw/RAabYmVa7C6/n6FJfBB/pjbIHsapwWhOTyH/dPo1klUSkzPx+cYg84pqo89Q
         Po0wuXOnnrKFyo0Hxc4NLhy6/tHh/UnsV0Slta2I9zHdG8Qw8NTEOU/HfZw7IZMFns2g
         R/+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774605196; x=1775209996; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v5btyYX9lHdsVC1fopO/cY1LA4YDt+YdOziS7/7GqeI=;
        b=kkZaA45MGVGHwy54eBxaNSlUNCub7++1ZL48O712Y8AQThZyxXz8dlbZQS2KeePfrp
         uBYF8fXYG7ELZEDfw4tMvp3md2aY2kX818w7QioqdYB/7FR2jIdcMyYa+4yUQfNCzs7Z
         qNrRCeoWvwMtZib0lDYesKILKpRfRvETrJs5XoFUcec1lKEa/VPHlL1f2h69KOUjjkNQ
         m6G06/RN5PeAEnp5Wzq+9bo3O1sndvbZECF1lMlhSb56BOzE+JZwWJ08w4/7lSRFuJ+M
         mCaUtjgoAhrRCoz1n8zoyQlMEoHmaVoNEj822RMweAeq6x5ANJXJ4vsu47A+/5oNxujY
         41Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774605196; x=1775209996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v5btyYX9lHdsVC1fopO/cY1LA4YDt+YdOziS7/7GqeI=;
        b=I8pxdIJLvV27hfbzGwnr3A9+XQCx+fnOOoYbOLrx9fDw5C0wRCU7ia2UUrVVNUU1A2
         Fw19t0phQoUKjzSZFKweq74DzK/nqkYzxFKlS7G7AQvBjIBj0YqaazoSTrFgtRwpX5NZ
         9yUoxqFKm6f4GAe1/+5Kx6GHwcJVN5ecDIZBazLyPsdusI6QTkPEEC/agz3Fyj0ZaBH/
         jasV4GxCKRCom6uPcnt0aoyiRNOoCA08zsALppDxtRjQ7JzjEh+cDTAI1+WHrEE/tj+d
         VV5FsZsVHj26s4NES57ipVKj87VSOAYjeaZz8bPpKQsuqhKhWUB38BTVBUpWXQY14hdj
         Lo8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWi+S/7Hduu4t5LfRHRq+M3Au+7l5sMITPMo6bJ7CMORrEhQoC/pIyo4hUnETF8rM7bCHX1Z6rBU3169Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv9z5lnGQyJkDjz5l3Q4WB7NSbqcqof/zWIQtWSPBE96dsy6Iu
	rrP7aVtFmrm2tE+dNqnFCSC3yNWMS0WoPP0y6TCInm/fks7ATcMddxG/Mz9eCbEHuB2qJjNKknx
	PEUaZ8IE93QIAtqov0NqnvS9jHqkWFuo=
X-Gm-Gg: ATEYQzxaCQ1UZUmmqYu5Sj+rvveSr7DxE+wWRzAzTtEaBA7MvlkRuy2bUJ8WNFu3Q4n
	Ew05KamnldiaVByhjhXIuniei66MwDP1HGfdhiicEf7JT48bSbIFN3DqWoA08hys8sgjh/QCqXG
	njgK0iz9Rd78foh63b/5pN8StDPRNIu0k59mxMETAahxtf52zRcdLchEUON8CUh+c6N94E6I1Ar
	LNYbTi3sfXPVPCryFLSNVsYvt8kA3vV3XThzd/joQRBM3X1LpynQ2s9An3JHscwXVu+pzclEtF6
	Y0Uehl7op4Lrx9NaNuYrlg3AiLYj2tLvPj8eCWvGGxUH9Mxpl1x0Vp9yNtGpHr838WK/7R4MWc3
	jIGigsa+L5IaEiSBpj48xYaimU5P+PulUmQ==
X-Received: by 2002:a05:7301:578e:b0:2c1:82a:8711 with SMTP id
 5a478bee46e88-2c185cbaba4mr489012eec.2.1774605195712; Fri, 27 Mar 2026
 02:53:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316211646.650074-1-lyude@redhat.com> <DHCBEGGPWSVK.30MV8652PV4PY@kernel.org>
In-Reply-To: <DHCBEGGPWSVK.30MV8652PV4PY@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 27 Mar 2026 10:53:03 +0100
X-Gm-Features: AQROBzCDQRLEXYtIjvWCBTRZrsm2z1WTrrxZiqYf_IZKuXYInSunVO95k1Dfv0Y
Message-ID: <CANiq72muiQzRkvcEZNUceqxvDmUf0zPLaBvQRH+EfDSS0edo+A@mail.gmail.com>
Subject: Re: (subset) [PATCH v9 0/7] Rust bindings for gem shmem
To: Danilo Krummrich <dakr@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, Alice Ryhl <aliceryhl@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, nouveau@lists.freedesktop.org, 
	Gary Guo <gary@garyguo.net>, Daniel Almeida <daniel.almeida@collabora.com>, 
	rust-for-linux@vger.kernel.org, Matthew Maurer <mmaurer@google.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	christian.koenig@amd.com, Asahi Lina <lina@asahilina.net>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Simona Vetter <simona@ffwll.ch>, Boqun Feng <boqun@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Krishna Ketan Rai <prafulrai522@gmail.com>, 
	linux-media@vger.kernel.org, Shankari Anand <shankari.ak0208@gmail.com>, 
	David Airlie <airlied@gmail.com>, Benno Lossin <lossin@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, linaro-mm-sig@lists.linaro.org, 
	Asahi Lina <lina+kernel@asahilina.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	kernel@vger.kernel.org, Deborah Brouwer <deborah.brouwer@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57208-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_CC(0.00)[redhat.com,google.com,kernel.org,lists.freedesktop.org,garyguo.net,collabora.com,vger.kernel.org,gmail.com,oracle.com,amd.com,asahilina.net,ffwll.ch,linaro.org,lists.linaro.org,linuxfoundation.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,kernel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,rust-lang.org:url]
X-Rspamd-Queue-Id: E0C443420F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 2:15=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> @Lyude, Alice, Miguel: Please have a look at what I came up with below.

Sounds fine to me, thanks!

  - Regarding the enabled unstable feature: looks good -- it will go
away this cycle anyway, so we may get a conflict, but that is fine.

  - Regarding the `&raw`, that sounds also good. I see you did it
similarly to how I did it for `bitmap.rs` -- thanks!

    (And for future reference, the `bitmap.rs` one was 1.92 instead of
1.82 because that one was for unions, while this one is
https://blog.rust-lang.org/2024/10/17/Rust-1.82.0/#safely-addressing-unsafe=
-statics).

  - Regarding the `expect(unused)` -- using `cfg_attr` is fine since
it is a simple case, but if it becomes a big issue, then of course
please feel free to use `allow` (you already know this, but in case it
helps others: I wrote some considerations about this at
https://docs.kernel.org/rust/coding-guidelines.html#lints).

Cheers,
Miguel

