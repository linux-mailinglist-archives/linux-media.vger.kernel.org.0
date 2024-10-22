Return-Path: <linux-media+bounces-20052-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0725A9AB3B2
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 18:19:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBFED282D5C
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 16:19:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE7F21B5EB0;
	Tue, 22 Oct 2024 16:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sOX9Uxwp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43CD1A01D4
	for <linux-media@vger.kernel.org>; Tue, 22 Oct 2024 16:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729613960; cv=none; b=CGKUE+IXkf/5xv2j3f951jMhagsqqNRYTKLbj/pkOQ2kB/BqAGZJj9AboOFGagc8B76wE0GUaKNsqBXTdoITYXZCJBwuU+VDXgSgqR4gehICm2Pb3zXx4Xa0HDHOkOmgezHE1Mf1DKmEisJWrmjxPFaKb3Y47oTqBJuASdgJe/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729613960; c=relaxed/simple;
	bh=O010jrXbVVYc/oBTmTv82BWnbf0mEg5IgHol5Aj0+vg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iU539SrznWadqvddbSDxaNuPVUJcIKRpm1flDT+rfkFa1SsDfoVH7nVV0pKGgAzLTJpNaJnTob0IzcYTpQwZ9P0CHqzq2f01TZA/600b9v186xIP5lVKFTw9T0tT/19bEyW6uq/cCJBbxg5pu2DNG8+I3LCJag2qJ5ps+G8eVzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sOX9Uxwp; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a99f629a7aaso1053656866b.1
        for <linux-media@vger.kernel.org>; Tue, 22 Oct 2024 09:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729613957; x=1730218757; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O010jrXbVVYc/oBTmTv82BWnbf0mEg5IgHol5Aj0+vg=;
        b=sOX9UxwpnrwGksSh2XYnUjSxZ1nlCmxQGfvZbLAd0bZpFmJuaR7p4azWivFhq4jBYI
         hb+LOU/wyVUtt7Uw409ebo14uDbyurIZ0lwVK/aOXXFJ+vjWL4ZDzLqjbIBkjDCwXUbB
         1rKRmCeg1y38YZqi+giJ4JXzXWRzAzBFw8BVQibZmhjZzSFvasrZnRsRHU4JBpLtqgE5
         7EdolMEC2bwM7x7EheQYCLe0ElLPJxFv3tolGNCuYeCjQZcQoaeI5J28o6XdantZj2AK
         pmQfr06bFvjuXhvO/shlQ89TmxKnktJmjxNhoZCU4seX0idZv3QySnmYRryQKCMIaUiF
         s66w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729613957; x=1730218757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O010jrXbVVYc/oBTmTv82BWnbf0mEg5IgHol5Aj0+vg=;
        b=Tu9Van78/SOA3W+ChPko/e2bMQJVBLpLf7SstYPwO93gVfK+Znl5lU4Wym5QbQcr+L
         TYWUTL4wc5P9iGXTAnFFuYAz1yzkMP42EGRtglYytih5Vr82O0gquonLMMjw0XdliSVu
         o9N1Rsb1QlKnCLPzFVW17tsQl7XUFvQTAPzrqSVUXZXRXl8qXa16QTpImosUPBV8R1I1
         QjbUt8nsy8Yd2mMS8Fd2Me9urtGTA1+2Uw9jtM5XAfjtBNLRl4D31PIci3ckpwBzGgH7
         K8QozDRQ+XhpHsvbSNZPqrbyQX/yU/xu7+XoYdhdA8l6rdwHdjgWNGCSiKkeG/tghjnG
         SPHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiK3NaryHqOt7xbSRc+J4qXsOeon1jyrVe2tfPk9jiuTbIxPGIoBd+x6TGL0pk7f7EHlb0GV8x1eAolg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWry7rjgnjkRhYYt7JsjqoKBQSlZpebwZdojaGt1ubduEWtagH
	DAirPrulEtMD4sVda5yM1gbltIoMldwGNelD7Ri7FIc6pq7Rgh2zro/nRmnqZ/PJtiHxXfofeqy
	ZVGC75E4ZcPGOPppDuGeMzoTZcmMQGcqUyxIj1eqL+RXMx2ZnxQY=
X-Google-Smtp-Source: AGHT+IE2UWF9akIjKN3CLcsBih/tjrcN+DK2fnaCGfTRq+l4mjlUsUQFO0mOXVfH5O+jRzv/E6HKLsTurAdaP0J2Ixw=
X-Received: by 2002:a17:907:6096:b0:a9a:4b51:9e7 with SMTP id
 a640c23a62f3a-a9aaa53a59amr424231966b.16.1729613956687; Tue, 22 Oct 2024
 09:19:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241022-macaw-of-spectacular-joy-8dcefa@houat>
In-Reply-To: <20241022-macaw-of-spectacular-joy-8dcefa@houat>
From: John Stultz <jstultz@google.com>
Date: Tue, 22 Oct 2024 09:19:05 -0700
Message-ID: <CANDhNCoLgzy=CPBWjBKLiJzRdnf=SS3AgtFJNB-CBYAo=UEQJA@mail.gmail.com>
Subject: Re: Requirements to merge new heaps in the kernel
To: Maxime Ripard <mripard@redhat.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	"T.J. Mercier" <tjmercier@google.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2024 at 1:38=E2=80=AFAM Maxime Ripard <mripard@redhat.com> =
wrote:
>
> I wanted to follow-up on the discussion we had at Plumbers with John and
> T.J. about (among other things) adding new heaps to the kernel.
>
> I'm still interested in merging a carve-out driver[1], since it seems to =
be
> in every vendor BSP and got asked again last week.
>
> I remember from our discussion that for new heap types to be merged, we
> needed a kernel use-case. Looking back, I'm not entirely sure how one
> can provide that given that heaps are essentially facilities for
> user-space.
>
> Am I misremembering or missing something? What are the requirements for
> you to consider adding a new heap driver?

It's basically the same as the DRM subsystem rules.
https://docs.kernel.org/gpu/drm-uapi.html#open-source-userspace-requirement=
s
ie: There has to be opensource user for it, and the user has to be
more significant than a "toy" implementation (which can be a bit
subjective and contentious when trying to get out of a chicken and egg
loop).

thanks
-john

