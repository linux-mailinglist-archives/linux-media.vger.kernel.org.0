Return-Path: <linux-media+bounces-14366-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6799491C746
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 22:23:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8633C1C23E58
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 20:23:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A704277113;
	Fri, 28 Jun 2024 20:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="lenEJl0m"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1EE74061
	for <linux-media@vger.kernel.org>; Fri, 28 Jun 2024 20:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719606210; cv=none; b=dJSZNUCfYzaak5gSyApf2zoDDfG4EGpQlXbrVvLtC0aCOR7xBljfCJjHRGP3Lwu0shuwp2ursv2e/pgp+ACBuOyBpmVgFMPzMTsCE4RzqNu0qnbnc8Av1W87KQABkfFviMX3LLlvc7EN4ydBjxlL8TNEpqRz9MMuNzZG0NiiIks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719606210; c=relaxed/simple;
	bh=meF+jxyCw4OoAYyu1gwMI5pGdbLesBvTuciMbHzTey8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PZWjLeTbulq0L2IVlQ5Y+r4bMTKbXfYKDPHEH7mAQbZMRPoZI72ogXruS5jnr4odczBFi4kK1DwGFO0sl1zD9+I9YgmAuqyVQoLplDK2EE22I058KsJ0j3InVpmu/of0Zw+ZxnlQUJjYqw06zMXFi0wbYm72Hpmhoso0LfDkRUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=lenEJl0m; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6b4ff7cb429so4950016d6.2
        for <linux-media@vger.kernel.org>; Fri, 28 Jun 2024 13:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1719606207; x=1720211007; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=meF+jxyCw4OoAYyu1gwMI5pGdbLesBvTuciMbHzTey8=;
        b=lenEJl0mqbxVuKS3bujXF4YlYff+6uLs1G3UqjpRTFxnLaJ2NVL6xebJsZyf9xCVCu
         34D5BOscdkh43vYHHjOHecoWzZ7JiY0eIXFWdj6Mk2oRn8NtAYQFI9TUvdJ7GY0iE3G/
         dX9dKhCjMzpehtbRS1DXrFjRaKstfaeVobUV5aRGydn6ZyUoydj6lmsMFezf4N/BoUlr
         Spph/Sk/7IZJvWzi73m0XEuWTFr/HaQc/OOecNZZm02bfs04dSb5m00W9NkBdZfLkII1
         R5H+ncBAHvCrCo0Wohu9N7kY41s63If3w1mt0Z7YTVDEP9bMfRLdc6KsMUYFCm1gL6l8
         H6mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719606207; x=1720211007;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=meF+jxyCw4OoAYyu1gwMI5pGdbLesBvTuciMbHzTey8=;
        b=qOYHDLkP8JAqfhzqcvIdFnQB7WKQPjcRcIYsKmcvhJyYrSI9rMfan+zshV555UF/XA
         1uxOmpXIINoH5prKTyG9C84TegIWH9fmGXHBaf8Q02sthX3CMYyz39UT5G9KzZes5i2S
         a5KYvADukJJEMDuNTeAYBeAz18hsT0XMiA3mVuntM8CMwEJ3D6hDrXHMjtSPZqnIZpK7
         LeOZjg65o8VUDXobEakYs5I9UB76Se9+W2abDj0rGyrGX9MbuP3tsN5Pr7Y8u53iDQ3U
         qXusgh/5hAmtSvzbdRnV6QKeqBWwTzZpwvJhA6tTQIrvprCxhT/lrtYfDb6Us+kVwzM7
         QStg==
X-Forwarded-Encrypted: i=1; AJvYcCV16yMnonLxm+CXqfUBcOsFnVffC1irWQMjRQCICFtRqpibCz4jpzXm1JKPxaxdOcIT+HaNl6LbgvRlQAXp2Kk+LAcvzqjaMYoI34k=
X-Gm-Message-State: AOJu0YwbxUZx8I/qQUd8Rhs4pd8wvAq1i78vSCVc7+MZCRFypg3j8qFI
	4vjqMMSsSGJB0wBsZHoEShghnVSNX9xcmWkl1qzxhOUcTcnJyVo9daU2/HWHN5Y=
X-Google-Smtp-Source: AGHT+IHtfw7Xq3Cf0WFYd9L6i5fVpDUyYC/Xic5L6R5XMrTyAZAROOc6sOeuO8nND/pHTXuCm/Q3Pg==
X-Received: by 2002:a05:6214:27e9:b0:6b5:98aa:8b1b with SMTP id 6a1803df08f44-6b598aa8c3amr67210986d6.50.1719606207610;
        Fri, 28 Jun 2024 13:23:27 -0700 (PDT)
Received: from nicolas-tpx395.mtl.collabora.ca (mtl.collabora.ca. [66.171.169.34])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b59e6146bcsm10736956d6.120.2024.06.28.13.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 13:23:27 -0700 (PDT)
Message-ID: <ee405147d5e9826f1b2ad7d7c3bdb2fb745de420.camel@ndufresne.ca>
Subject: Re: [PATCH v5 2/9] scatterlist: Add a flag for the restricted memory
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: "mripard@kernel.org" <mripard@kernel.org>, Christian
 =?ISO-8859-1?Q?K=F6nig?=
	 <christian.koenig@amd.com>
Cc: Jason-JH Lin =?UTF-8?Q?=28=E6=9E=97=E7=9D=BF=E7=A5=A5=29?=
 <Jason-JH.Lin@mediatek.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 "quic_vjitta@quicinc.com" <quic_vjitta@quicinc.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "sumit.semwal@linaro.org"
 <sumit.semwal@linaro.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
 "jkardatzke@google.com" <jkardatzke@google.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "joakim.bech@linaro.org" <joakim.bech@linaro.org>, Youlin Pei
 =?UTF-8?Q?=28=E8=A3=B4=E5=8F=8B=E6=9E=97=29?= <youlin.pei@mediatek.com>,
 "logang@deltatee.com" <logang@deltatee.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Kuohong Wang =?UTF-8?Q?=28=E7=8E=8B=E5=9C=8B=E9=B4=BB=29?=
 <kuohong.wang@mediatek.com>, Jianjiao Zeng
 =?UTF-8?Q?=28=E6=9B=BE=E5=81=A5=E5=A7=A3=29?= <Jianjiao.Zeng@mediatek.com>,
 "contact@emersion.fr" <contact@emersion.fr>, 
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "willy@infradead.org" <willy@infradead.org>,  "pavel@ucw.cz"
 <pavel@ucw.cz>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, 
 "Brian.Starkey@arm.com" <Brian.Starkey@arm.com>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>,  "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "tjmercier@google.com"
 <tjmercier@google.com>,  "jstultz@google.com" <jstultz@google.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "robin.murphy@arm.com"
 <robin.murphy@arm.com>, Yong Wu =?UTF-8?Q?=28=E5=90=B4=E5=8B=87=29?=
 <Yong.Wu@mediatek.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "ppaalanen@gmail.com" <ppaalanen@gmail.com>
Date: Fri, 28 Jun 2024 16:23:25 -0400
In-Reply-To: <20240627-impetuous-aboriginal-cougar-cdcbbf@houat>
References: <98721904-003d-4d0d-8cfe-1cecdd59ce01@amd.com>
	 <779ce30a657754ff945ebd32b66e1c644635e84d.camel@mediatek.com>
	 <cef8f87d-edab-41d8-8b95-f3fc39ad7f74@amd.com>
	 <1050c44512374031d1349b5dced228d0efc3fbde.camel@mediatek.com>
	 <3104b765-5666-44e4-8788-f1b1b296fe17@amd.com>
	 <98c11bad7f40bcc79ed7a2039ddb3a46f99908f5.camel@mediatek.com>
	 <75dc1136-7751-4772-9fa7-dd9124684cd2@amd.com>
	 <ZnxWWtdShekGSUif@phenom.ffwll.local>
	 <ae73a0203d6acf2878c9e3ae2d7554816b9c66ad.camel@mediatek.com>
	 <5739abdb-0234-412a-9f25-49219411bbc6@amd.com>
	 <20240627-impetuous-aboriginal-cougar-cdcbbf@houat>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

Le jeudi 27 juin 2024 =C3=A0 16:40 +0200, mripard@kernel.org a =C3=A9crit=
=C2=A0:
> > You can trivially say during use hey this buffer is encrypted.
> >=20
> > At least that's my 10 mile high view, maybe I'm missing some extensive =
key
> > exchange or something like that.
>=20
> That doesn't work in all cases, unfortunately.
>=20
> If you're doing secure video playback, the firmware is typically in
> charge of the frame decryption/decoding, and you'd get dma-buf back that
> aren't accessible by the CPU (or at least, not at the execution level
> Linux runs with).
>=20
> So nobody can map that buffer, and the firmware driver is the one who
> knows that this buffer cannot be accessed by anyone. Putting this on the
> userspace to know would be pretty weird, and wouldn't solve the case
> where the kernel would try to map it.

Userspace will be the one calling into the CDM TF-A to get the bitstream bu=
ffer
to be decrypted, not the firmware. The encrypted buffers are not using
restricted memory. Userspace is also responsible for calling into the MTK
restricted heap to allocate the destination buffer (on other platform it co=
uld
be CMA heaps + TF-A call to restrict the allocated memory, I've seen some
discussions related to this, but its not possible on Mediatek HW).

I think its fair to assume that userspace always know which buffers are
restricted or not in the SVP process.

Nicolas

