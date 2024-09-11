Return-Path: <linux-media+bounces-18179-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7011B975A1B
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 20:12:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3085928C7EB
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 18:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A52A1B81AB;
	Wed, 11 Sep 2024 18:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QLQDzddJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3A01B140D
	for <linux-media@vger.kernel.org>; Wed, 11 Sep 2024 18:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726078308; cv=none; b=QAYDBQwYTdslafg4EolxJ9Ywq2cs4lpwaUH861BPqtf/zSAzBITE4Hydw8xPN39IXYG0yMBu/nlQvjvpeNESFa7Z8rxX0VIwIiJNhhwj2CWLmd400KMFX2Dv9EQ0kHs+UBSpQXgucmlLn8YhEo+pNSCt1wVHLI2nh3ZDKzBoVTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726078308; c=relaxed/simple;
	bh=z857oVhOO9Ge5wn4k4nabsLRCg+zyT2pPs33TkWJQgE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rVzHCBjlL38TZ3Mab8aYHL79+G0EdTj5dGVJ6Rpfke12SXVyqwS79eXqh2ifwvCfH7tw95/yEh4x5tpxg3nGvx3bI/So4KTZnaDVEbAFtY4DJCUlxkAq8l/MfOJJP8P8MG8Q35PtP6wa1DMTe9S9Lza7tnubT3vzZghbAHv7k9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QLQDzddJ; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a8d100e9ce0so14657866b.2
        for <linux-media@vger.kernel.org>; Wed, 11 Sep 2024 11:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1726078304; x=1726683104; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QXiJI/L0vchgadKCOX7xJsbzxv2AfJtb8fmGhILgPNI=;
        b=QLQDzddJHGLjsGGeAU/V/QerDX+8YYLHUswbATuFFhKBdQrsC7CBrFaJjwOqlQn02p
         tpVFrUtM/Ca7GRyEfJ/ivHZXoEfElvTDcJrjfmEP9SY4Slse7JgyL3T6WWkSbsp9gRaI
         dpI61X7heQ6V9ISr1aKwEzIe4OZog/cF962IU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726078304; x=1726683104;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QXiJI/L0vchgadKCOX7xJsbzxv2AfJtb8fmGhILgPNI=;
        b=ku70seKp7HyhE0nuujuWbR7MgwwS7LYPBk3IrT0auGWSURClnFwM7rlrIMskDuVlCW
         L+XuYyyj4QV1Vj8DRZQfdphPxdRPUP7a3yhZzJagcPv+3N+ycFbUylotzuDsy69zQp6E
         Kxhkur/w+9C+jG+X/fcC+JVAPK9gAVPyjRP4WTcURbeej42HOsMXyMw83TQ69bhhQyTd
         P11E/45vEe0/VWcpELc12fzLaDEh5Ykr1IaE/TT6n+q8ORK4WHoBjRraxeldccRUM+Zx
         lppZpQ8o2PCDNfIzY5uq3gvD/42tFZGPc5uvRwolKRzObNHuakTRYKeTrg43WZCML0TI
         KEKA==
X-Forwarded-Encrypted: i=1; AJvYcCVFWP0JaWr0rf63U+Vbf41KrdBEd72vd1KyEGqoMp2C+LMBMRHA0fd8ZkltQ1NJCquXzhx6ixYJU4q+uw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXH5GmkdPi1ebmvpaDWbIyNc0l8X8YSXNdbsABmam8GsZNBI5V
	srW+OC8Q/LZ4AMItWwA/l2pKkPzwnml4CEs1xku2hgH0UmwHG+qk3sr0Ghl01LjqAFw8FG6j/2O
	qzfn8DQ==
X-Google-Smtp-Source: AGHT+IHkVrL1v/fsqrhA7JuFLRubH+4/paRaGYsdT/gkFo6FJmr2tm/t4RdvLLIShbKRZ762TA9UMg==
X-Received: by 2002:a17:907:868c:b0:a8d:2d2e:90f3 with SMTP id a640c23a62f3a-a9029668262mr25028166b.55.1726078304264;
        Wed, 11 Sep 2024 11:11:44 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25cf03fcsm636288566b.162.2024.09.11.11.11.42
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Sep 2024 11:11:43 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5c245c62362so113684a12.0
        for <linux-media@vger.kernel.org>; Wed, 11 Sep 2024 11:11:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV9F/V5kKIBo7B6blE/nza2HeLER5lHOZTd9m1wBSn1FL0bQHmVO5xWoL7tuZp1ON9JInPXgnRZD9ES8A==@vger.kernel.org
X-Received: by 2002:a05:6402:33d5:b0:5c2:5620:f70 with SMTP id
 4fb4d7f45d1cf-5c413e4fbd6mr215370a12.28.1726078302536; Wed, 11 Sep 2024
 11:11:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1726074904.git.lorenzo.stoakes@oracle.com> <b38d8936eaddd524d19823f7429138e2ef24e0d1.1726074904.git.lorenzo.stoakes@oracle.com>
In-Reply-To: <b38d8936eaddd524d19823f7429138e2ef24e0d1.1726074904.git.lorenzo.stoakes@oracle.com>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Wed, 11 Sep 2024 11:11:25 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgWJmQJSWz_5S8ZqEpDs1t3Abym9DPZfUzWu+OCNM3igw@mail.gmail.com>
Message-ID: <CAHk-=wgWJmQJSWz_5S8ZqEpDs1t3Abym9DPZfUzWu+OCNM3igw@mail.gmail.com>
Subject: Re: [PATCH hotfix 6.11 v2 3/3] minmax: reduce min/max macro expansion
 in atomisp driver
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Richard Narron <richard@aaazen.com>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marcin Wojtas <marcin.s.wojtas@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S . Miller" <davem@davemloft.net>, 
	Arnd Bergmann <arnd@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-mm@kvack.org, Andrew Lunn <andrew@lunn.ch>, 
	Dan Carpenter <dan.carpenter@linaro.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Sept 2024 at 10:51, Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> Avoid unnecessary nested min()/max() which results in egregious macro
> expansion. Use clamp_t() as this introduces the least possible expansion.

I took this (single) patch directly, since that's the one that
actually causes build problems in limited environments (admittedly not
in current git with the more invasive min/max cleanups, but in order
to be back-ported).

Plus it cleans up the code with more legible inline functions, rather
than just doing some minimal syntactic changes. I expanded on the
commit message to say that.

The two others I'll leave for now and see what maintainers of their
respective areas think.

            Linus

