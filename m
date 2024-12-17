Return-Path: <linux-media+bounces-23577-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B359F4A7F
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 13:01:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 292D21701C6
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 12:00:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8D271F3D40;
	Tue, 17 Dec 2024 11:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UjchDtYf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC521F0E58
	for <linux-media@vger.kernel.org>; Tue, 17 Dec 2024 11:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734436753; cv=none; b=qOoNJ3//qXJvv0itnfDOW4KnSqzOA83tKjH5zVYitYbobor0jeSsdWTp8xOHlVRf8eWBWJI5O2O2r2F+R+oCXSGrNwaYkTcSswQmRxFGjiKsRWm1u2IYxTiV0lwLO5mIRe+MF7zSj8hyP4aCJmN4328gP7+je2o4td+BeCn8PIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734436753; c=relaxed/simple;
	bh=ePQ4/+1RfG5RhRXzHXFaoZSXFo3eJ6fkHQlAiJMxR20=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SHKzju9bvbaWxhrVuvsCuSJx25L9ebhWSl0vEiM5GyBQ0dBVnsVnxWwCW7DXof8toMcnQVSlZ6tEuOS59UIqV6iq0hHukqu93f2DShRaJeEtHvrlQohpAZ4MTZsAdyuM1vgGv/LkCmrtXdcSgNXX020vcRUGjQ15/85jt5rbPNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UjchDtYf; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21669fd5c7cso44735575ad.3
        for <linux-media@vger.kernel.org>; Tue, 17 Dec 2024 03:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734436751; x=1735041551; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ePQ4/+1RfG5RhRXzHXFaoZSXFo3eJ6fkHQlAiJMxR20=;
        b=UjchDtYfV94HV7XWgc9HuIJcip+CtcuBupbax8c8DbCEB3yGdUhymRHKc2nHFxqRTv
         Qu9m4LVdbVBkNnReuNYleYYX66/cB02Cg6577VoACxi+R517aeErvxAyQz76wi5JEjR8
         yu6gOcA2ICLcpcntGCxgFNUlqo8rXP4EP3/t4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734436751; x=1735041551;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ePQ4/+1RfG5RhRXzHXFaoZSXFo3eJ6fkHQlAiJMxR20=;
        b=WR/WPQW4u9+0FNyLeJ9/R/wKFsAs5mzcHqRdWUj2nsJeUGHuVl277eBr617WJ3zGaj
         Z89oEoSlElqz+U9pDC1iWCP6K4IXz1j9tsJtbiQ879fOuo6P/DHubj8EyiWGH5c1EPRE
         /UNSf6I2I+QbICkaF+Tl1r5ZXZWd+vT27KhvKPl89+6nkYt5AyWc0YHqNgVy4ef5dXSD
         Y5kgCq1kjoQlPiPu8G2RZ5B3tK7tOiGGJdIogWsYv5m2TzU5bHt9rgoenicSCTS+hQTf
         IDVaEROu62m3LTjrpFhQsQeqIoFs5wNMeh/O3Vzi/4xu96pnlP9PBzo2SVLKK/ZxWZJv
         AWIw==
X-Forwarded-Encrypted: i=1; AJvYcCX/6Hb6zelwOG5g2+ypotOrUynYPOt4CeJAjnpYuu5s1z8K0H3ELcf10IVu4Xgh/YeQ6T/OdW1SndNPAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSNDmp39Upo0PGdVyk+/TRRW14xInnl1CaMEbqgCwc8vG+Gw/N
	t05Z+uByPzcf0kuiYLPGnomHFLdvgrXb/n94hRiy5vLBNSczfoLg48XFZYg+QMEOYAzBl97e9UE
	=
X-Gm-Gg: ASbGncv+Y2u2OGDgbfWYaRbvVtI69vGPhKXNanswiS9UDsElgoKwqhIRpsps4I7BEQ1
	scmhakbiRsYMHJbYFSpuSJC2MusYkpU/XkpnvIN8TsLzXtaXz6pvcudilnXZ6ZysrNvA0OPCUuF
	buPzfj8dITxWvvYgzx3HbOOpVboVIpfMTZdXgDOjOAK2iLgQlkBlqoKfUrbS/XmvQPwLBen8WWp
	5oGuU8/j5rBmeVmofP7r74goKpjWMpHpaUN23WdtyuGnCy8BGB0GeRLMbqflEfeddxdTXd5TA19
	D8Xbg7FpsM2dCutGJXw=
X-Google-Smtp-Source: AGHT+IF51Slmv/SlnpJ3rQ23/f8jHcpU5MScgj8mCZlQVD7KhJzZG8sREK5q/wSTZkzG0bp1pkiffQ==
X-Received: by 2002:a17:90a:c2c6:b0:2ee:f076:20f1 with SMTP id 98e67ed59e1d1-2f28f869282mr26079263a91.0.1734436750967;
        Tue, 17 Dec 2024 03:59:10 -0800 (PST)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com. [209.85.216.54])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142fc6a53sm9891044a91.51.2024.12.17.03.59.09
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 03:59:09 -0800 (PST)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2efa856e4a4so3705762a91.0
        for <linux-media@vger.kernel.org>; Tue, 17 Dec 2024 03:59:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUAYxdBF52dIc37lYMtD7XebFQl1FO/muvfvRRH8UhygGmzcm8loIsIuy7CZCj6Di8hXpW+c7moncmg9A==@vger.kernel.org
X-Received: by 2002:a17:90b:5105:b0:2ee:ed07:d6d2 with SMTP id
 98e67ed59e1d1-2f2902ac693mr23201677a91.37.1734436749015; Tue, 17 Dec 2024
 03:59:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241217112138.1891708-1-isaac.scott@ideasonboard.com> <20241217112138.1891708-2-isaac.scott@ideasonboard.com>
In-Reply-To: <20241217112138.1891708-2-isaac.scott@ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 17 Dec 2024 12:58:57 +0100
X-Gmail-Original-Message-ID: <CANiDSCtkgRJdPQmwPV6GStLMv_xEYC51LDED1St6i9bnmNEPfg@mail.gmail.com>
X-Gm-Features: AbW1kvYdftMaWOnkSitpR1AyOHmsUn_0YxO3mpfh9sLlwVM_l-3MLVeui-bpTXw
Message-ID: <CANiDSCtkgRJdPQmwPV6GStLMv_xEYC51LDED1St6i9bnmNEPfg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] media: uvcvideo: Add no drop parameter for
 MJPEG_NO_EOF quirk
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: laurent.pinchart@ideasonboard.com, mchehab@kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Issac


On Tue, 17 Dec 2024 at 12:22, Isaac Scott <isaac.scott@ideasonboard.com> wrote:
>
> In use cases where a camera needs to use the UVC_QUIRK_MJPEG_NO_EOF,
> erroneous frames that do not conform to MJPEG standards are correctly
> being marked as erroneous. However, when using the camera in a product,
> manufacturers usually want to enable the quirk in order to pass the
> buffers into user space. To do this, they have to enable the uvc_no_drop
> parameter. To avoid the extra steps to configure the kernel in such a
> way, enable the no_drop parameter by default to comply with this use
> case.

I am not sure what you want to do with this patch.

Why can't people simply set the quirk with

modprobe uvcvideo quirks=0x20000

