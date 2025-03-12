Return-Path: <linux-media+bounces-28102-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A02EA5E4DD
	for <lists+linux-media@lfdr.de>; Wed, 12 Mar 2025 20:58:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D8EF168597
	for <lists+linux-media@lfdr.de>; Wed, 12 Mar 2025 19:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 772EC1F4CB7;
	Wed, 12 Mar 2025 19:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NWNS18Hb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631EA1EFF98
	for <linux-media@vger.kernel.org>; Wed, 12 Mar 2025 19:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741809499; cv=none; b=mAWuLh7CvCqEHChVWx9Iz6Cn6wDYRaQVKrZvKNWKtmmj7MNVK5L+x/uiHUv5jnNz/9LRz98P8ZdnXGrxSHTk3YsfNTaD4pKf0CUpITGIPDY1+HJZHPXm1n1cUXDN2VhCGSF8aXTjEZPShgyDkDvnO+PZrYSgj8FopRPwB6KWwOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741809499; c=relaxed/simple;
	bh=0XeiFzhQOEo8ZEiy72OmboYtI5mcmHaI620RZFFY0Xs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=hvESLdTgZVuUK1wSs97hPS+QHO05d/wnfouvQakkbt1sv5HeFFO4oL/H7puN2rUI1sxbn9t2UkDH13/qv9y/0CRbkxv3u6AIxflKP2Tvdu05uM7htvIo6zjOso2Q25BrkTjzYz3kxmiFmXUKo0txvMs5KJVf1JAYP9n2LYTuno4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NWNS18Hb; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ab78e6edb99so37017866b.2
        for <linux-media@vger.kernel.org>; Wed, 12 Mar 2025 12:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741809496; x=1742414296; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wFlXVQ9fKrqjkQptOo8MPRHWaIzzUfvzBt59gIVlO1s=;
        b=NWNS18HbU/t81PWU8L9JMvbIEBkf++t6VZtX5tIbfFEOmaM0ftV8a3ZXVqMpVz4FSg
         GfBN56MV8LlPzApXs0WCdSX3wiv3vJaCfSf48FdUcGj/VZYFXnuiRFG3dK0uBEZkp88h
         O9P2R8zsntBkSodBIn4w1ez1G518+DBCKUkHoOheYoYGjYy/7ng/gSvzZFvsfPD4Qsiz
         RFzkHkFeJml2nuKsErZH/EEqcWVq1NaBoWYMOLGHPr1t8fHeDCkbcf42oHZC3b44ndmk
         SZh9gIRf36cRocX9/46NAR8HKUIkUQpaG1zdDXqAGJLDng91bzu2E/lzXLV4eti4bufU
         Bd6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809496; x=1742414296;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wFlXVQ9fKrqjkQptOo8MPRHWaIzzUfvzBt59gIVlO1s=;
        b=itHcA3mRYujEXGKV5weRVC4piMIuan4eut/yKcI2Rgz0Mf1lF8jUV20X5P5vFTc2wO
         UCIt7nRHvPt2eCQFA0CQ2EYsLd/tNtrA8XR6mpqv159Dz+Ogu+hAaM6XrlAsQ7SKbkBt
         8cni6XanJ06j8ctqn51hSiRNOFoaIaA9IuVcjWWyrxfEG5RcxmxRyS7pVVZQxVtIHfx0
         rsEI2SXpI5rDo/fZo1dJdEwRLUfLmd/2InFqN8gusTtnmKfsh3oZNghzAxSaWsiPmjHK
         s4e9wvM+90y/oPY9ZblyY5GJ2xK9ODweAzwVw+09zfJ02mJb22t91LnTwhU1cJPfWx+1
         IxiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVX8avMSlE/De5VEZKPd0AN8fcC4BNa/erY2HL9ys69sAP/hO+0l9TbCCRVmxyy1kDGjUGzvahNCvIl1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwK3eQnb1ZsXIf3BYWSQxnshRFV8vPBZuT3c9gDBbICncg1bBI
	osWlObrtrMjBaDyTiHd8DpVpdvtBBi/RQggdKNLsn7cJcb/GLzuirD9TQAU3DKAQyVKKpi+7mrZ
	bOx3QAgVYnBdyC8VHr4NCa/+XPjvHI9wG
X-Gm-Gg: ASbGncuuMGizoW44bLPaAEfeK/NuOryB6loONQD6pg4oiBBIHFZOA7RXN+Y9PNjpZDK
	uRfOOj+Mn7NoXGEtqgJ71T3hMCBAbHvYcvvGIndl7pNglYAgnRfuf1xlaP3mKMPpZ5UXzkhh8Fk
	eV43YZV95d1AS/ZG9MGZsWVXojFq4E
X-Google-Smtp-Source: AGHT+IEen1fAX+T45JE00wBMotb54MJ7lxEuWVX7058PXQteUw7f2G0Jmkt846oKNkMvyLKShaQMUPV55rHQp/VpYwQ=
X-Received: by 2002:a17:907:1b2a:b0:ac1:e6b9:57ce with SMTP id
 a640c23a62f3a-ac2525e07b9mr2861363566b.7.1741809496485; Wed, 12 Mar 2025
 12:58:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 12 Mar 2025 21:57:40 +0200
X-Gm-Features: AQ5f1Jpq9II4U684hHyR_tVIcA7Sv9OUrKSnzGni7iGWLLjLvr5H21tifgL11Sw
Message-ID: <CAHp75VdqpfW+WEjQX3i5FfuD6AsM1bMhYo_5J1v=Hn0r5N6Z6A@mail.gmail.com>
Subject: atomisp patches?
To: Hans De Goede <hdegoede@redhat.com>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi!

I just realised that the atomisp stuff you have in your branch didn't
make the upstream (at least it's not in the v6.14), any plans about
that?

-- 
With Best Regards,
Andy Shevchenko

