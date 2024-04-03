Return-Path: <linux-media+bounces-8531-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0601A8972AA
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 16:33:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 377DA1C2658F
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 14:33:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 471C9487B6;
	Wed,  3 Apr 2024 14:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FpTFLIFg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594343611A;
	Wed,  3 Apr 2024 14:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712154781; cv=none; b=InbU8P8yeVaIrUtaBGH6148u4IuFUGe9tVY/ezefcY3kM+FhOthCZ3NoXl8qRe4HfGnEQYXYvMgaa6YQepeddmtFLnT9rqjFtsER3J7EYOZEBn2cT6gg7DcG7pkWuL4PGkMIcZsiH+olgEU3m6cMCzLkvz3h1mavrYdBOAA4kW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712154781; c=relaxed/simple;
	bh=OUJHSpU0stUn/PZ2Ed30p8qw/Z2Mp8wLrkvOjaU9UMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JAPIdlG+JRe176CUUboKYu8PtOBjjkFtWYZaN4Wk0InK5c8m+ziuJozPEOH6XnpaFwFDysA2JMA8shML7ct7TQSQ2e+wS//Hqk4vrPMnny8EdSeZnK4BGwblgy3rgXI8uPK6GRU7/UOmxh/jiqB4pcym8j1bN+t1tnNgUFhX/pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FpTFLIFg; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2a26243d9c4so395192a91.0;
        Wed, 03 Apr 2024 07:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712154780; x=1712759580; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OUJHSpU0stUn/PZ2Ed30p8qw/Z2Mp8wLrkvOjaU9UMI=;
        b=FpTFLIFg7VTkEBEgBgUjcS0HuObawWTLKfBxLY0PnuN+RWj7jtG3rPya1ztVxoSpJv
         gS6rYvoKuSPQLabrTv59Ln/3FH79XD8AweAuFooWEpvrjy53PboM/PvxmHGzJreAF/Yq
         qXVnh57yFV0zBYtGnlhasvEfCqMmQSfwyyR6jvkzP9vfS3VshQjimVD6W8dx01sjSOYK
         Y/OfY4vlzAWMpsg+a5NAglGMaUlowwndp6B2EQ3syFQrBaSCOH1aDjqK3Vxn79jrF1EP
         tYp0ogGVZh23cFQaHnsVRSRxRfIp/Sjw16piNlclSJVvwF7OoEZQ1YNVibaUhnLRH4np
         n9vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712154780; x=1712759580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OUJHSpU0stUn/PZ2Ed30p8qw/Z2Mp8wLrkvOjaU9UMI=;
        b=STdsjsGobB7FLZ1mYjwvnrtPkjkpvpaYWoKbdm03jf0e08qljCMD7UmZIbeGCMCBhF
         Eh3MEaEpVcFKrRBi8ixwwvo08IzllHfe79PKsjKaOj5MVQQU/k1szJ+d8g/emj+YqGS9
         w0WvLBz2j/a+bvseB3HVmWASDqHxiakNITcXr0lHaZZL9AfneyRbXolfKBGZ3SZxIP4x
         Re9lCs+Y8tiwNxYCjo8+mZDX1zr8zDFTtUAajhyckj4CeJNzP6eu/Bgm0koOtbvZU9NB
         hhjTwuQXrd5lYLrAgW0VvahoLgTeTh+8pFVIGA8VRC5BwfXOuNXK6/DLYIX/wpHOdXn0
         qaOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgXmLjwB6rzHPKaiKov8iKdjb0MezyTL4dGAZ4DDhmlOEj7hM9ofS6Bz6lsXz6HAnLfFPgpTMIcq4xmdvlOrCDIQuFkn8aXIg2hrVa+Wr1r38i9ZbRqQ4yL7/I1WxW1hC1cbChwbRK
X-Gm-Message-State: AOJu0YwcCZJiO16yn/AdEU6vbd8OZyoe64l5ksXwpYE7hNbHg8oQoaa7
	e9jhqv09syFd5k8Dro9UvKaF1iX0pAw0otxau3r+KmIhVjZc7Ln/wJCWGl3dhih5feV9MSJ2Cyh
	CcueQvOEZZATqrN4Oet2z8eUDcro=
X-Google-Smtp-Source: AGHT+IHWD11ulIJ1gHLJMETQReusUkHa/La2cTxwumjKPDyB4FsMTVQjn746D+1Obn8syZMkbkr5xY8NreFTIJu3mRY=
X-Received: by 2002:a17:90b:124a:b0:2a2:666f:966d with SMTP id
 gx10-20020a17090b124a00b002a2666f966dmr4091940pjb.1.1712154779670; Wed, 03
 Apr 2024 07:32:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240326231033.2048193-1-festevam@gmail.com> <ZgPtolH796HER4cP@kekkonen.localdomain>
 <CAOMZO5AYjNPWZfy_dN12K9JNwWaWThpMs0W-FzETF5k8fobgeg@mail.gmail.com>
 <ZgSeACFfBAmOPXdt@kekkonen.localdomain> <CAOMZO5BGYhnhOrBRS9zBeYYJFHXnQkqZCAV2wGtdpmiA3HZTqA@mail.gmail.com>
 <ZgvCJ5F6KlhVGRPC@kekkonen.localdomain>
In-Reply-To: <ZgvCJ5F6KlhVGRPC@kekkonen.localdomain>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 3 Apr 2024 11:32:47 -0300
Message-ID: <CAOMZO5Ck5W3M_eWFqvQAtPcUUQDyF1fwvZ_Pi9vHgiPp7nsEXA@mail.gmail.com>
Subject: Re: [PATCH] media: dt-bindings: ovti,ov2680: Document clock/data-lanes
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: rmfrfs@gmail.com, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

On Tue, Apr 2, 2024 at 5:30=E2=80=AFAM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:

> If it's a problem with the driver, you should fix the driver instead of
> working around it in DT. Just remove the check.

Makes sense. I will send a driver patch to remove the check.

I will wait for my ov2680 patches to be applied first and then I will
submit an additional one.

Thanks

