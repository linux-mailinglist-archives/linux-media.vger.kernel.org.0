Return-Path: <linux-media+bounces-14232-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BD591A139
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 10:13:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 848E5286397
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 08:13:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 490F3770E4;
	Thu, 27 Jun 2024 08:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NpJWAkrR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA5D446BF;
	Thu, 27 Jun 2024 08:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719475998; cv=none; b=H+NtFPwHe1EI9t3BwGD+VVU239PKiTbjDTbU3GmIX+nQ6mmh9vBqM7uDsWcyMa2jUQT3TJzBR4KF+MFUESyGnrCXk65dCYi7TeL0QsaCqYQiKN4vighW7BGUEMDZE73AmHey52EEpBGunPhIDw9Poe0NMPbXz3ZZVuVHCVmuMXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719475998; c=relaxed/simple;
	bh=aqwTrcSYiqQJUhfArYN0dEmmLzN0Z0hlc2lvyFyjTgc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jppUajXFCmnm3SOe1CaxJTGStAkziK5qCHZhU2/Q1WKIXwtK1VVed57SJXKRCXIM0FLu6OP1shPbrdlotx8SUbkTOzLgD+b0Wj8DYkdrINpt2u1eAWvpUDPfUY6YzsDy0XFlp7p2ecRjzM2Blnpmwa4PaDGR+YW2Q5mTXvwYRZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NpJWAkrR; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1fa07e4f44eso45091145ad.2;
        Thu, 27 Jun 2024 01:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719475997; x=1720080797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aqwTrcSYiqQJUhfArYN0dEmmLzN0Z0hlc2lvyFyjTgc=;
        b=NpJWAkrRpVic+B+lXkfstsegROQzN7Yie0McEC4lyKIdUT+tzM1uM3V2tTsAuwb3nx
         cRHRa8zJWwVigrMjpDV/3e1+zu8cZy6HtvbvCfZlNq1qERS2y/ygVHdGh+A+SblxMy2g
         gZZ0ttmZ+Du/rd+xOPOdT/CxDD+hkB56hMvfASYuXGjub71eAy6w5wgayXNado56Fozb
         tv9G9Dsu8NGBqEHhfrYe9oi/JWFiUU7eeJ3/+FT9YQeJena19K8VUVo9jdDNznoCDi7E
         xENHlD8rIeA5/KUIPPwXlfA377j4HiTBTfkXpZuKCbSAfcZRJccgqghhFpIPdMx1eHyD
         UDTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719475997; x=1720080797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aqwTrcSYiqQJUhfArYN0dEmmLzN0Z0hlc2lvyFyjTgc=;
        b=umAW07wBPmi1SAulMmT0LTcXvkehKRiL/nLEsp2VHuJmKZ0VznUWO5fLZmKUIGd/5Z
         VZRml2cpzF9TMxgLnQQoYiz2hOGTzDIFrP0u1lohQrHED2nuv/hun/VnIeLCbuzDL6nI
         3kONMwbDmW7JQUW9ILXn1momt/elhozYMA5nXoUZJmRTi60EhYSsEesWLaSDx12K71DW
         CiYv288DbjBwF63oW+6czqnLt2DI2XzNgLlzTCcTECjycTSIcBLwvqCJ15gu93qQFGA0
         JER+we1KzlJpoCdc/nbZH9/88vI/4/cO+UeU9TEHWZLqbPtG+Gqi724KLhsKUkK/FTUu
         C/3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVYrJRP1StiaZuhyOQT9O8pmV3qHZG84K3sfKSZT7peuf+HE39lkw3nkoyDKLiE4TsNpzeqxE1oREtprJFBEyHHk/xN47WlSTN8NcOkLMfqsaF9L3s3UugNw6k1vR+4tzafRJuLxVRuAYisz3w/egBFuQb+yHeU1KhSCibZY0BPWTy3QPU9
X-Gm-Message-State: AOJu0YyCu+5GU69oewBILCR1/EnkF7IrzCxkudaLqeh0QHrnmQFuB84s
	e5yZrjsPueauPgZjnxSBOa8Czyx9ksQwJgI497imb9wKYzKUp4ey
X-Google-Smtp-Source: AGHT+IE0n90VUhe4DUiFkf3qdpni5UChtIA8uA1O2viLG9jXpeWy1fCOwI7kkSkvPn50aebe+Ahylg==
X-Received: by 2002:a17:902:d4d2:b0:1f7:3a4:f66f with SMTP id d9443c01a7336-1fa23ef7c2cmr141387655ad.43.1719475996534;
        Thu, 27 Jun 2024 01:13:16 -0700 (PDT)
Received: from localhost.localdomain ([221.220.128.96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1faac8f286fsm7548675ad.82.2024.06.27.01.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 01:13:16 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: nicolas.dufresne@collabora.com
Cc: conor+dt@kernel.org,
	detlev.casanova@collabora.com,
	devicetree@vger.kernel.org,
	ezequiel@vanguardiasur.com.ar,
	frattaroli.nicolas@gmail.com,
	heiko@sntech.de,
	kernel@collabora.com,
	krzk+dt@kernel.org,
	linkmauve@linkmauve.fr,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	liujianfeng1994@gmail.com,
	p.zabel@pengutronix.de,
	robh@kernel.org,
	sebastian.reichel@collabora.com,
	sigmaris@gmail.com
Subject: Re: [PATCH v7 6/6] arm64: dts: rockchip: Add VPU121 support for RK3588
Date: Thu, 27 Jun 2024 16:13:10 +0800
Message-Id: <20240627081310.583427-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <f04e25bf3c09c55049775e8f012cb653cb4682ba.camel@collabora.com>
References: <f04e25bf3c09c55049775e8f012cb653cb4682ba.camel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Nicolas,

On Wed, 26 Jun 2024 13:46:03 -0400, Nicolas Dufresne wrote:
>Just to clarify, since you are right that it won't work well with GStreamer. It
>does work with multiple decoders (it exposes them all), it is simply that it
>will randomly pick one when decoding, and it may not pick the best one.

I have tested rkvdec2 and vpu121 with gstreamer 1.24.2 on rk356x to decode
a 4K video, and gstreamer always fall with error:
"v4l2slh264dec0: Failed to configure H264 decoder".
I guess that's because 1080p vpu is at fdea0000 which is always
initialized earlier than rkvdec2 at fdf80200, so gstreamer will always
choose the 1080p decoder.

>In the long term, I'd like to stop having to do "like downstream" and expose
>them all. I believe the fix is fairly straightforward in GStreamer. We need to
>expose in the generated element the width/height ranges, and for H.264 the
>supported profiles and level. With that, we at least won't randomly fail at
>decoding 4K, and it should be good enough.

Not only gstreamer, chromium also has similar issue. Chromium will only
check video resolution globally before starting to use one decoder: if
there is a 4K decoder detected before, it will mark 4K resolution as
supported. But when decoding videos, it will choose the first decoder
supporting profile like H264. So chromium may use a 1080p decoder to
decode a 4K video.

Chromium's code about v4l2 is complicated for me. I may create a bug about
it. But chrome os doesn't support devices with multi v4l2 decoders like
rockchip's socs, I don't know if they have the motion to fix it quickly.

>For RK3588, which is a new SoC, its not a problem to upstream something that
>does not work with existing userspace. It would only be a regression if we where
>to enable VDPU121 on RK3399, as now updating linux would cause bugs with
>existing userspace.

There is an old soc just like RK3399: RK3328, which also has a 1080p
hantro h264 decoder and a 4K rkvdec h264 decoder. I guess less people care
about its mainline decoding with gstreamer/chromium so it still has 1080p
decoder enabled.

>For users, it would be best if we get this sorted out in GStreamer by the time
>we have a second decoder. Note that I have some vacation coming up this month,
>so there might be extra delays. Yet, its logical to merge this (the "worst"
>decoder) first, since then randomly picking a better one won't be a regression.

Happy vacation days! I will also take a look at chromium's code to see if
I can fix it.

Best regards,
Jianfeng

