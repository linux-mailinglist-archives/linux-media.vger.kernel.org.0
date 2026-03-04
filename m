Return-Path: <linux-media+bounces-54501-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0C/hCrhdqGmZtgAAu9opvQ
	(envelope-from <linux-media+bounces-54501-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 17:28:40 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8981E204422
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 17:28:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 901C03216219
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2026 16:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB74234D91F;
	Wed,  4 Mar 2026 16:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a3hrZfjN";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="af7l/Wwm"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F50034B1A5
	for <linux-media@vger.kernel.org>; Wed,  4 Mar 2026 16:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772640515; cv=pass; b=PgIFPmgzDxK9wTA7dirpiopy3FP7dfxAxhxG3NBjUyzO3ixDELIPO5TbflcYqmSPRDKJqL4feJ/fWZm5TChp2r846OY5fsTzCaGwTTVTNHhDOlysyev8ameqJIJAjxl7jMOrf0NvtFJE8HfqaDw28dfBdbuxMRZEf9MxzFPEg+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772640515; c=relaxed/simple;
	bh=XuIJEyuPZseimNyB1dClJ9+gsbn4gJI4NK41evppQNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FfYoRgQeBldWfE3js9H5cn+RXMNn3ObSIF8atCpvYFQuIVCbC8Vua60/xRk+U3qX/P3bYnIOLEF3GNIbB4mFV6bawrjXekLpDF21hLfNl7Z8IqVEafCsIMdFgFS3dOYggrwadelfHlXUVa6K9DOc29x/0fM0fiOKJXiaz7fOWJQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a3hrZfjN; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=af7l/Wwm; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772640509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XuIJEyuPZseimNyB1dClJ9+gsbn4gJI4NK41evppQNk=;
	b=a3hrZfjNCSvZf277AHmIZ8i/pDK+6jrKgLJFVbtf4BeCP9EMei4BLkPvH7brrYTOc8VeFD
	OuA6zuI4fqS+mMgxpcK7iVJqepJ0m/f4Xil6ZfDWbipW5pzIrMjBwp2jGfu+yNuyxY+Irg
	LxAFPM5gDFbQziPT3AJrSimzXcehxGU=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-694-KrfCMv1sMNe8yx7L7XGlsQ-1; Wed, 04 Mar 2026 11:08:17 -0500
X-MC-Unique: KrfCMv1sMNe8yx7L7XGlsQ-1
X-Mimecast-MFC-AGG-ID: KrfCMv1sMNe8yx7L7XGlsQ_1772640496
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-67995e1ecacso121124520eaf.0
        for <linux-media@vger.kernel.org>; Wed, 04 Mar 2026 08:08:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772640486; cv=none;
        d=google.com; s=arc-20240605;
        b=gpg4bK163CJrJ6M6qGLkBni2nPLZjmjZvLl4uAKe6J+eYDRdUgbVRuwXjBBt/5sa5n
         LJqA7ZL39TiP0tJYGiUKKZa49v/Dz6EwpZml7YtP1MqQRrSSlcYcVxmZvWBzm5XTsyom
         u+WWsN04QZE2kNZnLdMu6CXibWHAhNmVNV2Y4Z3KF8nLw0gFPJTcrCKDMlSDZsSPziNh
         YJGLdRqX3DlEiMHjQeF7uUso3flWl4Zv5ytvv0o/4tsZy5xwom1sFOaGNVWf+pw1w252
         i0eL5QHKBIGwSmqZF61RtwS7VwWc2uifWwIfazrjLLqnjW+CjwuTmeqWK+jALHsgiNSj
         Q1sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XuIJEyuPZseimNyB1dClJ9+gsbn4gJI4NK41evppQNk=;
        fh=dLkNY/UXMq62K3ryuo3aCc4lIOVSd3i+LgqI58Mn5/U=;
        b=KgR0NIa88RjJxZ4AvmnQZc4/ntOAF27iYyVgtpqIxecqivZewvWOPbcxSg1k9E210d
         jpoAyUaA8DUxl3ZcRJk4EZ/KsasPKyjTeSyWG+IXKy2GY+9VTTjEYMX9bwL/YA6yIGZG
         XfIgi97FFpLLllhpnE7mO1vzVPcGYiGi5cF2/TCFJJqATtI7bL3eXrDfXagUuDaoLT6K
         dzqWYDJLAfCTgK4fmE1CeiUWW32tfolZy9FIlzYJU8isXon5SowOWznXQccVm/Ta9cqD
         vEnBIwkae63jftwN/v6hJ+B5pHgTTQb3XAchFr/qqCH7knRzgOw3VIfIBN0mvCwXkWqd
         9quQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772640486; x=1773245286; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XuIJEyuPZseimNyB1dClJ9+gsbn4gJI4NK41evppQNk=;
        b=af7l/WwmjSccYL25DU+Sg4Gbsvu9x6sJ0Rhx3G/i1tsKJMht5fnmfJ7xdPYXe1wZ0g
         Rv0yBaXnZaqEG1zJkqX90BU3rJvdxEV8W+i+IFNtI0NuNALTNuWe4Ye9zYRhsdDUDEXj
         dM9YFKQq3R7dwZVmTZjedghcrCaAa1P08iqTcWSgLqOMDxhaLZUHl3YNcVjewyAAm+kM
         wfeCIx3u8O9pF5iBui+MRSp9mIpO+3VMu8YUqNXpWJCUbSvHwn5I6/mDxthd3pfwW6Vh
         XKbNXs4H1ORRkzhZa4av92IEFypsbAjjDkxRUykGBYWd3jimIVkFgh7GpaVvCN97Tm8n
         3naQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772640486; x=1773245286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XuIJEyuPZseimNyB1dClJ9+gsbn4gJI4NK41evppQNk=;
        b=jcJ6FKmlIJdMt7cm0krFOzcLJpwJDX6TMrUJlc1vySYcV5GJnY5vX2hi+o8vnpAI0A
         aj49HkjCQM2dLbQkLBLOX7T/A9MGw4dwTYst6ltqIKjhU3wLC2fiLMKzbhH/IlzAhXmJ
         YsOezG6xQWAW8vMWi8X0RNho2RuBeulr/wUd3iWsZoRtmNnlNYw6yeg+YoZ/o7X9fGie
         FcbFqCzXycUa8EJpLu7BNH5/VfZMxtUAwymDujXEFFdACMnVb45f8Trx2gfjiIClQL6T
         YFNtN7410PshUhIth1sDU3DdtYbLhws+s0/Cs+E5Kyo/oDgjOiXobn3euqjLnO7Gszsi
         h+7g==
X-Forwarded-Encrypted: i=1; AJvYcCWco/ZDBDnQLNvC4zVOUxHwlFCcUhigQ4KF0QaWDvSeCMvQyX6WLVWp104v+A1ROVcD0WAdjkaV04HPxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdGj4Mh0QbjaVSn2kMFV1NDibC1qHRyUwgPo39cwx2n8Q6C8mb
	uKa/vfz1gdh2CVJhzQzDNpq+Ff/v2MPtZwCeoJAAsUW7rAKYwpemopESBnPjWc9dKxjNClqg2Fz
	pjBdHF9KQcyuTmP1ILF2FEI3dqoWxDbU2ZVAIOIM+yCmDOdLicbvQh7q3FvvRQubbP/mbRfs9wG
	jF+JMHUQcYc2p4zf2NUITAFnmdTvJLkUUmSN/2OR4=
X-Gm-Gg: ATEYQzxPkiKdQ0x9RdCpQi4BCx2vHUbZjy7nVRIx4B2Deyb5yhfsY1x+rmxv0K+8p6T
	pE6sBVQVyfmYfskC0lydRQURYZo5SAa2zMQfe2aBoTQ5uy6z5JNeyJksTtUisqxZDE6Nwv6UKbV
	OlUV9VZ+VJR2KzEXdxZ5hBrviFL0xcLhOqN79GB3eIbE7vlpZXG92opUaryOeQtWvRHT3OL1rQe
	A==
X-Received: by 2002:a05:6820:1ca4:b0:679:e68b:f95d with SMTP id 006d021491bc7-67b1776bde5mr1385792eaf.53.1772640486022;
        Wed, 04 Mar 2026 08:08:06 -0800 (PST)
X-Received: by 2002:a05:6820:1ca4:b0:679:e68b:f95d with SMTP id
 006d021491bc7-67b1776bde5mr1385781eaf.53.1772640485669; Wed, 04 Mar 2026
 08:08:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303-b4-dmabuf-heap-coherent-rmem-v2-0-65a4653b3378@redhat.com>
 <CANDhNCrVVGsxEjgRcVJSn_E9WPUVY_9zpd+t0X_Jy7JqbcHDqA@mail.gmail.com>
In-Reply-To: <CANDhNCrVVGsxEjgRcVJSn_E9WPUVY_9zpd+t0X_Jy7JqbcHDqA@mail.gmail.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Wed, 4 Mar 2026 17:07:54 +0100
X-Gm-Features: AaiRm51Q5GvpC48eWrWjCC8xCsFxsretWrNgIwHjulMNxRdjdZzE0CFF6Jj-oi0
Message-ID: <CADSE00KqF-7m+ZMYLzzgL3FzZv3P_G-v8ycYdXBj_WE4=P2_jw@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] dma-buf: heaps: add coherent reserved-memory heap
To: John Stultz <jstultz@google.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	"T.J. Mercier" <tjmercier@google.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, 
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev, 
	devicetree@vger.kernel.org, echanude@redhat.com, mripard@redhat.com, 
	John Stultz <john.stultz@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 8981E204422
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54501-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aesteve@redhat.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue, Mar 3, 2026 at 9:55=E2=80=AFPM John Stultz <jstultz@google.com> wro=
te:
>
> On Tue, Mar 3, 2026 at 4:34=E2=80=AFAM Albert Esteve <aesteve@redhat.com>=
 wrote:
> >
> > This patch introduces a new heap driver to expose DT non=E2=80=91reusab=
le
> > "shared-dma-pool" coherent regions as dma-buf heaps, so userspace can
> > allocate buffers from each reserved, named region.
>
> Just a nit here: Might be good to provide some higher level context as
> to why this is wanted, and what it enables.
>
> Also, "shared-dma-pool" is also used for CMA regions, so it might be
> unclear initially how this is different from the CMA heap (you do
> mention non-reusable, but that's a prettty subtle detail).

Sure, I will expand this for the next revision and try to clarify the
points you mentioned here (and add these points to the relevant
patch).

BR,
Albert

>
> Might be good to add some of the rationale to the patch adding the
> heap implementation as well so it makes it into the git history.
>
> thanks
> -john
>


