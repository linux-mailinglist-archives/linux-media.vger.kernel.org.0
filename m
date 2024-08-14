Return-Path: <linux-media+bounces-16296-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC49D951A33
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 13:43:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75FD31F22206
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 11:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8E041AED56;
	Wed, 14 Aug 2024 11:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="b7Bm28IJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD8E1B1424
	for <linux-media@vger.kernel.org>; Wed, 14 Aug 2024 11:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723635652; cv=none; b=nzqvFznGCpH5RoMFUDMzHiIq/FuG2IjI7e3RGt7KxTc6aUihlJK34lGJqQyNBuoxJ7TSsksWUXpHmMONTOBjl1NlkLJbfMY1THEvXHUV5W36Mnvs7AbtKUW5j8Vm4PACBXYgLGI2aYhj2HJME3OT7VbOonPMN4It62VRNR35LEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723635652; c=relaxed/simple;
	bh=e8mXQbUqQCEEWGhTEMIaH+4giqzidvJR227tArHS/aY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RRinTg/kInODOIFlhEmpq/TyuZwE0KbfoFUjEwa5qwB8LKuqdKWobGf7TnuZUwSiI+wr+dvaUoZe9qZCBtxUzb4KS8lYp909Jz3Nz1XFV0pXdfz93nKAhL6lcMXcUmTXzGhIQI2Fb2ROyMmgzImIv7Jt1vSWUUN3rd6icL2WC5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=b7Bm28IJ; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a7ad02501c3so785084366b.2
        for <linux-media@vger.kernel.org>; Wed, 14 Aug 2024 04:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723635649; x=1724240449; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sbgxlrXHc3w9+156HZaTZfFlJWdnKYz3nijx1PbV2J8=;
        b=b7Bm28IJ8D0CMlSoe+g350Nv2fcWkkC2gP9KsZomO/vgoJ5C1RIGG+wRM6fM30E/8h
         yBKARWJZRwAT4mZRnlk9EySNAZFvqbhbM0B0NhAPsAaG2bA/Q88jJLxBoT1AXjLTyRf5
         I9wbWRaOBNtE2if6L9vwXex+okHQgIJC4OxMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723635649; x=1724240449;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sbgxlrXHc3w9+156HZaTZfFlJWdnKYz3nijx1PbV2J8=;
        b=dFCfFZy/yNlKy7lKmQaZ858nms0TzQxN9IOranShRWxJ965/+kyNQ3jXx5JFU7ZIw1
         VmaFQO72O2lSVjvuYmdUmv9z5eks/ds976bvGNNnoFNjuXVBEV7yX2A1BOEs/tMs/Pc3
         JJTaMWsvUuBXL6Lb4aH7rSvPNOHuWWbPIPia0tj3bBa1EKgyAwhEZvaAyogoxnDZuvcr
         UeLpYjYqXXrg7AzhENQPtG35lCOMaJWkiJGSbKM/32WdvSsoVxzpA3Cqe4HuxQmN7xDZ
         ApiSNebNZTiV0aggM1sIOTgmHXm6nDrPpniLlf3N7epT1+8HA10sZb79gHENvl0fgCLP
         iTCg==
X-Forwarded-Encrypted: i=1; AJvYcCU7w2EwJg79EdE8d6i2HrTwM7HPEzE78Z7gReq7kmEKpOKJtX3AH4sx+UFDY8Wyqw70Ls/AL5hUwKFvqfp2jo8Rurlv4W2vO0LR0T4=
X-Gm-Message-State: AOJu0YwNuZa8pfjCI0WGVvY/aPpTxVu/jXgLgnb8WnP71N1YeEO/KUlo
	+rAwfCmGuInbno2JK5LhINh05WSVEe5gsEVc0xr+5qIRDK2p3ZUIPpct3juFuS/MZhbPyv37lFo
	Bhtgs
X-Google-Smtp-Source: AGHT+IHuWmh0BeGSbUGRwzl3f3xTkKGCDkvNgxygW2KRghxFonINZ5R1a1pVcgPayQspOa+L4z6tEg==
X-Received: by 2002:a17:906:bc15:b0:a6f:c9c6:7219 with SMTP id a640c23a62f3a-a836702b4cbmr191779966b.47.1723635648854;
        Wed, 14 Aug 2024 04:40:48 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80f411b4c9sm165094866b.141.2024.08.14.04.40.47
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Aug 2024 04:40:48 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a7a94aa5080so757142966b.3
        for <linux-media@vger.kernel.org>; Wed, 14 Aug 2024 04:40:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWh3aCsQDg/4ksNPAolaWtgNWGQ90NKu7ym/TUDJK1sW0o0xge0fXBXpVq1h60Xb6L859NU3Az7F0ESp/6KyJb9fXtlOUZJeUpo45U=
X-Received: by 2002:a17:907:e285:b0:a7a:a06b:eebe with SMTP id
 a640c23a62f3a-a8366c1ef88mr189428466b.9.1723635646675; Wed, 14 Aug 2024
 04:40:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240813-cocci-flexarray-v6-0-de903fd8d988@chromium.org>
 <20240813-cocci-flexarray-v6-1-de903fd8d988@chromium.org> <3352aa92-6c50-45c6-b5a7-215e359bdf0c@suse.de>
In-Reply-To: <3352aa92-6c50-45c6-b5a7-215e359bdf0c@suse.de>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 14 Aug 2024 13:40:31 +0200
X-Gmail-Original-Message-ID: <CANiDSCvpHoMb69=z8-Gbag+9EsO_KH5k8ickSL6NrTDy4DraAA@mail.gmail.com>
Message-ID: <CANiDSCvpHoMb69=z8-Gbag+9EsO_KH5k8ickSL6NrTDy4DraAA@mail.gmail.com>
Subject: Re: [PATCH v6 01/10] media: venus: Use flex array for hfi_session_release_buffer_pkt
To: Stanimir Varbanov <svarbanov@suse.de>
Cc: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
	Vikash Garodia <quic_vgarodia@quicinc.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Stan

On Tue, 13 Aug 2024 at 23:38, Stanimir Varbanov <svarbanov@suse.de> wrote:
>
> Hi Ricardo,
>
> On 8/13/24 15:31, Ricardo Ribalda wrote:
> > Replace the old style single element array with a flex array. We do not
> > allocate this structure, so the size change should not be an issue.
> >
> > This fixes the following cocci warning:
> > drivers/media/platform/qcom/venus/hfi_cmds.h:204:5-16: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> >
> > Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>
> Could you inverse the order of the tags, please. "Signed-off-by" must be
> first and then the others.

Just sent a v7 taking care of this.

I am almost sure that I used b4 to import the tags.... Are we sure
that this is a policy that we should follow?

Regards!

>
> All patches in the series has this issue.
>
> ~Stan
>


-- 
Ricardo Ribalda

