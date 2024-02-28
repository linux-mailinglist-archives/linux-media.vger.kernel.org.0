Return-Path: <linux-media+bounces-6094-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3168E86B311
	for <lists+linux-media@lfdr.de>; Wed, 28 Feb 2024 16:25:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DCA0D1F28CE1
	for <lists+linux-media@lfdr.de>; Wed, 28 Feb 2024 15:25:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3ADD15B98E;
	Wed, 28 Feb 2024 15:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MG7FMxRY"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F7A15B105
	for <linux-media@vger.kernel.org>; Wed, 28 Feb 2024 15:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709133899; cv=none; b=cqcNbohw7jof/7lPhIXrEc8BBs9gDAAnwPrtdy2FLwSwuIguHa1ZnpdBuaiANabe4IAP+vgYm46950p1/mOvI6AuI1ypQ9+FaYXZYi4V7MANmeyH3Z5xwYzuFtFVqbRB8En5CfYh8wM54+Rtit3tYVUWmljaf8R5eFq2XsfLLoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709133899; c=relaxed/simple;
	bh=t335GacvZZWB9ZO5aGOP1T/vlOmDu6s2tX+hVADPKvE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VNvcR1Y+65BzzenscyLn/o+JHWuFztjDXV97c1wL0uloV4SXmdjtHg93Bhay+cO3bjDKGObMyCHvk1lgA06wIocNbikaUwAS934g0RjEbdL1P+RaR4VBiAdCWFEmeYe2aM+ZH8YZ1DWoRVO9Nqk+1pLzqNY2R19+3+VltWo/1Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MG7FMxRY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709133896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=t335GacvZZWB9ZO5aGOP1T/vlOmDu6s2tX+hVADPKvE=;
	b=MG7FMxRYwpRCazzNo9/9M+S2QaWTOYqNAf4tyBxnRB+DohTh3ahvEy/p8Au5NRse4B+MQu
	lUSq9GmhvppOofVQpbDwOjCz7hXRtoNAQWQ9N0lhY98a+yV3mZQ60FfetxX2xbdrAQ1bk1
	r8ILQna4DQ5d2A9dWPU3+dVrB1Y9rpA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-hgnP_Id9NC6nIq0F-PwvAg-1; Wed, 28 Feb 2024 10:24:54 -0500
X-MC-Unique: hgnP_Id9NC6nIq0F-PwvAg-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-33d7fcb70c2so457371f8f.1
        for <linux-media@vger.kernel.org>; Wed, 28 Feb 2024 07:24:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709133893; x=1709738693;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t335GacvZZWB9ZO5aGOP1T/vlOmDu6s2tX+hVADPKvE=;
        b=KyH7S5UNjDm2uFnOxKoJ83JyMYk/bjvv51DmADTSoRlbLd3cXCSglPuYkSiwmsYtMi
         wuwLMAuKCzbLFOf6L2+rGI+3VBBhHEad2qp1ypzYjiNamCNK1Pz/3YeQx5uWyuCEqiBg
         X3pul4yN7f8x7dbKKJwn/yK2Vc+BYuQKfv5nrdytSymtfA5ZAY4KNR2alLPbzsIS+aJ3
         JY1rxqzRnWS+UtyxMe05yxSnJi+e3pWEm0Srs0D8u+AL3MB4myS9vxJ1l5PZyf/L3WmS
         BsHlc4PHG7z+mmZxp0lUuXckgqkeVLRxOti3OdSGGNQajxVcRpANKy1rvFn2LkLqwpjM
         G49w==
X-Gm-Message-State: AOJu0YxG34CLz2tm8VSFauv/xeVdZcE7dJqR4ZDilsPKEU7HBcKOy5gT
	0vCYkWJqIyd736qIDMLWOJTL/BfHhg61E+hHnwVC+VslgCNFNzWajzDr9XAB7ZLWMGw291e/2fn
	97dArQrfnJghQqIVxgLouaYS0J3yNwbJjbWESo66X/qomSDoRpxWXVlKJDF0w
X-Received: by 2002:a5d:4051:0:b0:33d:754c:8daf with SMTP id w17-20020a5d4051000000b0033d754c8dafmr2616988wrp.10.1709133893056;
        Wed, 28 Feb 2024 07:24:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGz4TYBPMDPkjBGoQZEc2FYZsGCfoARLYG/DpULb7Um4sgHyz+8OZKvQUvexwWeQKigI601uw==
X-Received: by 2002:a5d:4051:0:b0:33d:754c:8daf with SMTP id w17-20020a5d4051000000b0033d754c8dafmr2616967wrp.10.1709133892665;
        Wed, 28 Feb 2024 07:24:52 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
        by smtp.gmail.com with ESMTPSA id o9-20020a5d4a89000000b0033df1dc39f0sm5116060wrq.4.2024.02.28.07.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 07:24:05 -0800 (PST)
Date: Wed, 28 Feb 2024 16:23:05 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org
Subject: ECC memory semantics for heaps
Message-ID: <20240228-nifty-flashy-shrew-905edc@houat>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uqpcltwn5uxrumgj"
Content-Disposition: inline


--uqpcltwn5uxrumgj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I'm currently working on a platform that seems to have togglable RAM ECC
support. Enabling ECC reduces the memory capacity and memory bandwidth,
so while it's a good idea to protect most of the system, it's not worth
it for things like framebuffers that won't really be affected by a
bitflip.

It's currently setup by enabling ECC on the entire memory, and then
having a region of memory where ECC is disabled and where we're supposed
to allocate from for allocations that don't need it.

My first thought to support this was to create a reserved memory region
for the !ECC memory, and to create a heap to allocate buffers from that
region. That would leave the system protected by ECC, while enabling
userspace to be nicer to the system by allocating buffers from the !ECC
region if it doesn't need it.

However, this creates basically a new combination compared to the one we
already have (ie, physically contiguous vs virtually contiguous), and we
probably would want to throw in cacheable vs non-cacheable too.

If we had to provide new heaps for each variation, we would have 8 heaps
(and 6 new ones), which could be fine I guess but would still increase
quite a lot the number of heaps we have so far.

Is it something that would be a problem? If it is, do you see another
way to support those kind of allocations (like providing hints through
the ioctl maybe?)?

Thanks!
Maxime

--uqpcltwn5uxrumgj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZd9P2AAKCRDj7w1vZxhR
xcseAQDNXhfizqmm5H2uN2EY4Je+TYwTRgFflpibGSH+mgadZQEA/ztn8Tq2H8na
rgGnZua3Ci5jMoTbhctf8Hh0oDZuOw4=
=pw5E
-----END PGP SIGNATURE-----

--uqpcltwn5uxrumgj--


