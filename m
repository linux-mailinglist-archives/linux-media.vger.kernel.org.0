Return-Path: <linux-media+bounces-41975-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF53B4893E
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 11:57:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF8463A7A56
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 09:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CC252F3616;
	Mon,  8 Sep 2025 09:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GqO72XzD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5217B2E2EE5;
	Mon,  8 Sep 2025 09:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757325461; cv=none; b=a5WtccGGsNM04iN8szG9/mLOiKGKvXZkprdl3zCqCEKLCuiRnMtyYT9+A4vK3/EZOCknbn45oKo3FUb3Fpcb1JxG4BqWbc5g7BH99ND23vrf899+fXmC6pYv9eI8hlhQvYIDQJqTUl5JwI0HJ0DEJmkph9JG8RF9xyj9O07Xe2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757325461; c=relaxed/simple;
	bh=dM5z2tUasXV4s733tX3fvHKZRnpBB4QsUhjTlSr98XA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L5XYhla7b6TUFOlib/1o3q8XS9EADu5YqsVgMo7+CdvmNi3p7tuIUGcXLdzDB4Y2FUWIx+DukZjAKbv13G/sXGUXSHMXZZ/CuF4fekagkSneMI++AgqRVmQ+o3YDT3VhVRZNpkbHCdyUF6+C579p1jDsY10EFBb39PRpOQ5xCMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GqO72XzD; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55f7ab2a84eso4182542e87.1;
        Mon, 08 Sep 2025 02:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757325457; x=1757930257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cbwwRrfMNm0AHhvpRKY5zmyOLjboml80ynPXcO0lBMQ=;
        b=GqO72XzDL+SaTdj3llSMPkwGug61o7foN+1z4Cs8lF0lPGv6vbLCfokLgK49yETBEm
         bxRFXgBlPIsKo3vCuwhKReOV04ALQIR4DnQh7VReYrO8ulHdZoIdqXLcr2F3TRKdhFOK
         ZKQfSMmgVXgedLPvRBAtKqeUmC3L8BaJOI6wXlp/Sy1eAVc+O8M5i/A136+oNWE+5RDT
         EAgK15CmDua3+TN8mYLizc7GPktneEafcL8Yl2janAzPPM+nSaRLOW6+202EKdpcvpWM
         sUDbklzqGxYRoz99ho0qn9W8/NAnPl0FvD5NvljMoArLXsOjMbd5m8fmdJt7V5jPPmeq
         OnRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757325457; x=1757930257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cbwwRrfMNm0AHhvpRKY5zmyOLjboml80ynPXcO0lBMQ=;
        b=AqMhInzHUVRjJC7d5q4MhGQdN6MRelKsfWOrIKQRlVHk5sio1F5gObY2PgTQM4z+j4
         wjhgl55/q7dF1baQBgRp5uBTWft71CeqBq6XQiFYRyeBKnGCm4BIEJCGiVvlqtv6RhCJ
         4HsUtTzMMbs8RPXbwu99OKQsSePoZokfhoTe/6xfzkco5uZVHTVCZWEQerUGFdrKHH8M
         u5vU/ubMIafdL/27L6/KKDYUjBNAAOqD6jUrwnttvJtGppp63DbQvHhfYvu6uD8K/bGT
         AXSE3pqELAi/WjKNxVXUPyPQajYcS123CCXsC9xCHtqXqn3d9frJJHr1evS8CoLgjlwX
         /Tlw==
X-Forwarded-Encrypted: i=1; AJvYcCUsutokbZcNM9nv0DPRi52OAqAKnV7Pda8XRCqAIngHfvfaKOiUrFY09H3dsBddfc9gIpdAqRpE0JNAiCc=@vger.kernel.org, AJvYcCX3P0agn9/YTwO+XXkIg9zhZ7ycDRyPQodr3/vBuROkGjt83eHUBNmwPdwQp/f81bxsgoIqDwTD+zMs54g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2rZmcIKq0w2w5cRaNRw0m8odQnGO2N+Ldu/flpfijaKbLLYD0
	QG9vyvT4hre2ibDPbloxnogAKuNSXGvtM4tVOVXCFJj/3x0C3I/Df/Qa
X-Gm-Gg: ASbGncskJg2sfNG3UyZlGmZsKA4L2L5YWV9S42Yr9KXfdLgozqz0vR97e+tk1RPV3mP
	Ycul9qyjc4nl6WYQvUohxnrVIOYCtKLA+CXJeVi6Ix63oHkQC8+fFL+oMQsPJ99aoQk8Cm6quRG
	C+nkYx1irpsxHJQ4CcMLvu3wnWstSZoL3trLxnCEkyZut9YtqtQ4rbFT9wLDZ36VvVaRbmjipc+
	k86dElwDBk359pD9hDI4gNFbzqYjcoSsn0eAKHxcLIw1m6BGjvsOaPWCCR94Q3saeImj48RH6MS
	pkrB1eKGesllzO2asU668ZDkfOYLDrT5juhy5QfYDWfuLQ4+PcK2VZoAmUYyLmI3PQllOu7bsKh
	0REhyhdH4lt18ShU54KMbrCyJU6mjqmw//DwMXVmfH0q67A==
X-Google-Smtp-Source: AGHT+IHxWqdFON/CCC5LRkI3jVzCwBDwQMiNsLLfdR0gH6Mw6m6zXuvxzp1XJmm0lEOZq7v8YQ3FLw==
X-Received: by 2002:a05:6512:33cd:b0:55f:489d:7bd with SMTP id 2adb3069b0e04-5625d28e732mr2107027e87.0.1757325457107;
        Mon, 08 Sep 2025 02:57:37 -0700 (PDT)
Received: from foxbook (bhd197.neoplus.adsl.tpnet.pl. [83.28.93.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ace9f9asm3517142e87.82.2025.09.08.02.57.36
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 08 Sep 2025 02:57:36 -0700 (PDT)
Date: Mon, 8 Sep 2025 11:57:32 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Shorten the transfer size non
 compliance message
Message-ID: <20250908115732.04e84058.michal.pecio@gmail.com>
In-Reply-To: <20250908083655.GB23493@pendragon.ideasonboard.com>
References: <20250904081429.592e439f.michal.pecio@gmail.com>
	<20250908083655.GB23493@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 8 Sep 2025 10:36:55 +0200, Laurent Pinchart wrote:
> On Thu, Sep 04, 2025 at 08:14:29AM +0200, Michal Pecio wrote:
> > This message is much longer than others and doesn't fit even in a 160
> > column window when printed, despite providing little real information.
> > 
> > Also replace 'transmission' with 'transfer' because that's the actual
> > name and 'max packet' with 'limit' because it isn't same thing with
> > isochronus endpoints. Remove cryptic abbreviations like 'ep'.
> > 
> > Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
> > ---
> > 
> > By the way, this hack doesn't help much in the opposite case:
> > dwMaxPayloadTransferSize is right, but EP descriptors are a mess.  
> 
> Have you encountered such devices ?

Yes, it sometimes reports bad 'mult' in EP descriptors, which leaves
them with insufficient BW for some video modes. Can be fixed with the
usual "turn it off, turn it on again".

I frankly haven't bothered trying what would happen if I override mult
in USB core and I think it would be crazy to send that upstream anyway.

Before that patch, it would simply fail with "no fast enough alt
setting" and -EIO or some such seen by userspace. Now it produces
truncated frames. But also nothing worse than that, so it's fine.

Regards,
Michal

