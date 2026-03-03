Return-Path: <linux-media+bounces-54246-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QAN7DzY9pmmpMwAAu9opvQ
	(envelope-from <linux-media+bounces-54246-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 02:45:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CD71E7C9F
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 02:45:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1E4C3075E83
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 01:45:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E71D1347509;
	Tue,  3 Mar 2026 01:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="suwkxbs2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200AC3164AA
	for <linux-media@vger.kernel.org>; Tue,  3 Mar 2026 01:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772502319; cv=pass; b=N2fIVE1f0S28HZIU7H5jcxWnCFMKMp5d0FpLT059NhlsqGxxWg6ptN5J9EJHDnQaZbBQ493HeV2d14bYsAGu7AYe3g9mDilf6Pn4yXnBlCAYb3Vbjidge1ijcAEoy+/QOVPFABdbofsWis7Hm2a7kZfsMEXhULTl/QvjTfTk218=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772502319; c=relaxed/simple;
	bh=eVfO5NGg3pLHjsODSCaTQcdIWTdROEkpn3YHlUIRyY0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NcQWW/rPoFNcy0E/Wurt+w35zgLxF9ck1tfCD63sszVjoORu7LoPyWHSUlM/jGMf1oO0CK9SQx76MasJWEdciLAyni/GUBQxr9vLXgFp+QmJVHv/0ntQYkCn7yVVPEGZvAOh7QApm55YUeIVD+E0u96AWhJ/Q98tQPyF+Bq4zPs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=suwkxbs2; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48318d08ec2so12595e9.1
        for <linux-media@vger.kernel.org>; Mon, 02 Mar 2026 17:45:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772502316; cv=none;
        d=google.com; s=arc-20240605;
        b=cgoQnujTNrRNL5PaX136EJb1qm0qCo4Lcvkf8AxE3rdl1rQ6OKv95R+pHInNXagdOb
         4xGgoojHn3ffLnSB24IAhdZWoWMgnObkoKIpVz5wgSpHfsLtNK6serZyj6W0F/PQ0lfA
         8k0910elWVKPSfegjHG3ev6Q0yjQva0VDS9JN+LuUAREJZ0ssdOKRc2qev4kWJa7YHmP
         9l80Z6dOd5AkNgJipuMN2nyRLKs59+QfI3J+gIxJJqBF9TLxNhSrRcRXT616YScMYV/J
         52L0/EuLVxKaZvAQl3slv/pfkV0Xk00xXydpbYRAjEJhVoZzetb7J8hp+jbw+r10mA30
         uP0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eVfO5NGg3pLHjsODSCaTQcdIWTdROEkpn3YHlUIRyY0=;
        fh=yvGlh4MJRLuO/n0b3PiK4C8k/U/OoE9F1jNqufM7Dpw=;
        b=NL25Ux5IbQYwzNHk3e19XOkE21hTPe6Dvufg74P+27fqRdB6dDhsEYM4NUvTF9wUjX
         GtPs2mE1W36ZlG07Vcv6GkTDUQsY8V43xNlUIenJfVzYLS5oCjj8gsYW8NlQRRUdCSVU
         U/eGV816MfrdEu8m9oKLrOxJDCEkPZCuF0Phbk6HzLYS+qxQrsO0+W2r0XiWHzJ4o85v
         Ia6ji4woiU+FTgDDNr98+Ik88LuhjJyoisYi56MSJgsM7t4wMnT5rW/ojMooXdGVe7oM
         DFDn/HnvMTQxiiiZ0lUwBSj4TAka8Xfq+X9vkM7nI4Ab11EnM7EVYz1MJe60ZSPZS3UM
         hYUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772502316; x=1773107116; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eVfO5NGg3pLHjsODSCaTQcdIWTdROEkpn3YHlUIRyY0=;
        b=suwkxbs2lgrrv98OJlbt70qrpPCA4e8foGBzoKg9gw/VmnLzSL12Xta+2vtil2O7I5
         zFOG2i6fTer6tKK+h+7087qBi2YuUlc4+y1OaSp+BoO8TPNMwMMebNTJF6bi7OfjgWOG
         oCAaudq8QrbpFfmsn1UcYx0jFD7DUfy1AVcNIFUP8Ov4d8Syfm1v2KfQw/tsVzNVbFdt
         rtNG0hyr4qZfjk3Ch851GewdOe7yqoUKYCFqQGPkwt1G917zpIZgmFxDIzatPNvwBU66
         gjxTUVCOpys9f7Z5VDxOqx5WvXE8M2KbhY8YkBqc920FZ3xXXBhRBz8CgVnvbDm3KDlf
         WK3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772502316; x=1773107116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eVfO5NGg3pLHjsODSCaTQcdIWTdROEkpn3YHlUIRyY0=;
        b=Ewlg7/tyjdA2MJWdM0L0Q+O7d1POlIFKmljWII/voVUNTc+MmUJoAOykDBtZC0HTfJ
         J1QMrMJ2XEm3YRSgZ4lGPf/oKxoZZvGoVO/79JAVl97xpGLz8o3ZtDKQ9+nFKYcxo3ex
         Mvq/5crnJ4nMQeAp+HnGrQDvCx5GzvdDPICViDbGIaK2JwFtqIwKPOXi6Dv2+5NYGtN7
         nQx7yHYybrUm1Idl+tG7SsHEoXswBGBYwNZVsZEzTSubnsd3ArEI5Ac7+122BWM0r4/C
         Hybg+nuEOuHpCTbe5JlSrJeH+OSnr6QeiWbLHjf6pao/QG+2nnFm7b+xcBI5t6iM4gB4
         Qz9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUARp2hXOPkVOqcr1wr+qSC/I+qInyCblhSvJzK8j6Xlp8Me6lFzCQz6MNcoF6wjDsJv5DjS3VRC9sd7w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1sMmS/mZOput/ZNCQFIVB2edArtNmsTsUupZDurlmDhUNFoAS
	RhFnistWRHseKmDCftfnniRnzW28tsALdVi8zMkpDfT8tae/UXwti0nAO5v1W1jF30imBWV3y2i
	OOsIdCuFqZHrxQjYTuldeLpR5FtrBU0TD1CLZdciV
X-Gm-Gg: ATEYQzxrZrjpJemoXxvMAjvwfecyUkV5wZTOjBpjzN7WLoI5bpgCqeMCvxmi3DEHy27
	l/RnBMX7CvYai8pZKAeiYLsS8YgNOwm2Om3BpOww+colQmoQ3UJey71Kd0H1SdlFMAUycDJLyM+
	HGHwYNiGhXBIYnkeGotnaVXkQUJgnZdJhiL4JGxeh2Gh5yfiTdeXtrGMihFWpzTjOY1FWNPQO76
	pwhWEAmTmYwg5Ni4guFjILN4fKGY3UEhvV7t44LAFiZY1YQbxUgJNne7j9DI1TM8JwMzFPVctR6
	clCAgkdH6Hmn3JOCV7GXEUT7EbVmbdUeqgKnlIv/qtCyknXM
X-Received: by 2002:a05:600c:b4d:b0:47b:deb9:15ca with SMTP id
 5b1f17b1804b1-483d0606017mr1685455e9.3.1772502316281; Mon, 02 Mar 2026
 17:45:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303002309.1401849-1-isaacmanjarres@google.com>
In-Reply-To: <20260303002309.1401849-1-isaacmanjarres@google.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Mon, 2 Mar 2026 17:45:03 -0800
X-Gm-Features: AaiRm52M5VZfCpbXmMK9kpf_bZc2gUde5DZblmjqXRWIojHMBeZAG-Sxb_r794o
Message-ID: <CABdmKX3FOUUq=9rriXa3BYOOAqedaLma6TXZsA5LH0gBgCAEvg@mail.gmail.com>
Subject: Re: [PATCH v1] dma-buf: Include ioctl.h in UAPI header
To: "Isaac J. Manjarres" <isaacmanjarres@google.com>
Cc: christian.koenig@amd.com, sumit.semwal@linaro.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 92CD71E7C9F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54246-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[google.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tjmercier@google.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Mon, Mar 2, 2026 at 4:23=E2=80=AFPM Isaac J. Manjarres
<isaacmanjarres@google.com> wrote:
>
> include/uapi/linux/dma-buf.h uses several macros from ioctl.h to define
> its ioctl commands. However, it does not include ioctl.h itself. So,
> if userspace source code tries to include the dma-buf.h file without
> including ioctl.h, it can result in build failures.
>
> Therefore, include ioctl.h in the dma-buf UAPI header.
>
> Signed-off-by: Isaac J. Manjarres <isaacmanjarres@google.com>

Reviewed-by: T.J. Mercier <tjmercier@google.com>

