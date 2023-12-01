Return-Path: <linux-media+bounces-1500-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0693E801791
	for <lists+linux-media@lfdr.de>; Sat,  2 Dec 2023 00:23:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37B6A1C20B12
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 23:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A959C2D605;
	Fri,  1 Dec 2023 23:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x+WKEs3H"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7533103
	for <linux-media@vger.kernel.org>; Fri,  1 Dec 2023 15:23:01 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id 38308e7fff4ca-2c9ef682264so1210831fa.3
        for <linux-media@vger.kernel.org>; Fri, 01 Dec 2023 15:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701472980; x=1702077780; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/mPB8J9KOLgFvXqw1rydMIKNrEURsJRhisRvaGx5Qvo=;
        b=x+WKEs3HJwYAJ2XfZPnhRqJjLj/rP2MSDmDJrZPBekUi4t9Qs02KDEPRVYm8hZW4yb
         jUpS2euwI1De0qVamhsF1IxV6PV452Gnoypvwfl+g5LOtg+ViIkq7nfkoK4wl0aWPAWJ
         Qj6s/BdDxaA1irpZCZrrYS4w42Ww/CKQgA0K+Y+ciTh4EIJK58wxwFSXvxtpKnwtq09A
         ce9Rc2Gz+sD9LjdpmANL/ve924qTfKNoqYyr7luSb5Rt/Ze2h1eZtP7LP5VmNFJ5HCvg
         l5gmH9z/MDJB1h+WejY/XhnYtUPmul21izs4Ba3LgEUT+wxo5ItYL/vo6k7Kp6OiQY7A
         AYJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701472980; x=1702077780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/mPB8J9KOLgFvXqw1rydMIKNrEURsJRhisRvaGx5Qvo=;
        b=DZ2IgLoheoZGc2eu3oLitWfLieot3IZZqSI+qLZTHtPn8EdmjrjxdNwxRpvKCjcG85
         7tkFDa67ikuGwkYEgey9df5pJ6YRGqnUR5l3d59IxhCvE0Umqzou3n+EEt6re/CFYHFc
         +OePrKRYEBHyLv9aOCD+s6846OYcfTZdYw+GdcSQOZ3h5VFX5SElu/415+y08MOj18s4
         BV/+COr4ZlSMqnFYrWiuQPl8B2qNpGGVp6+eG8GM5zy/SV3u/7mNF3J2YVwht6kRdgJt
         PznOG9psdvQyLt1+JP/UQeoFQoSEn802ri2W+9WhqhZXlLBHHwjxiszosc1My5GwKXVa
         cyOA==
X-Gm-Message-State: AOJu0YwVjyVlVlsRJ5SMO/X8TR6kEgufpiAX/38l63J8AlH1lwb7ZgI2
	mf+PcyI4CEy2eCrG8W6aH48Tdg==
X-Google-Smtp-Source: AGHT+IEwZ3nkP64SLpV3NkvgH1lRsLPyZfl7SpQBWnCAVSDtZo0FcR829DhEkezYz+K6KxEhUMKjIw==
X-Received: by 2002:a05:6512:313c:b0:50b:c768:d347 with SMTP id p28-20020a056512313c00b0050bc768d347mr1292282lfd.18.1701472979687;
        Fri, 01 Dec 2023 15:22:59 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id k10-20020ac24f0a000000b0050bcb5b443dsm549662lfr.171.2023.12.01.15.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 15:22:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org,
	Rob Clark <robdclark@gmail.com>
Cc: freedreno@lists.freedesktop.org,
	Xaver Hugl <xaver.hugl@gmail.com>,
	Rob Clark <robdclark@chromium.org>,
	Gustavo Padovan <gustavo@padovan.org>,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-pm@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v9 0/3] dma-fence: Deadline awareness (uabi edition)
Date: Sat,  2 Dec 2023 01:22:56 +0200
Message-ID: <170147278460.2064169.18443996473333750316.b4-ty@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230823215458.203366-1-robdclark@gmail.com>
References: <20230823215458.203366-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 23 Aug 2023 14:54:53 -0700, Rob Clark wrote:
> This is a re-post of the remaining patches from:
> https://patchwork.freedesktop.org/series/114490/
> 
> Part of the hold-up of the remaining uabi patches was compositor
> support, but now an MR for kwin exists:
> 
>   https://invent.kde.org/plasma/kwin/-/merge_requests/4358
> 
> [...]

Applied to drm-misc-next, thanks!

[1/3] drm/syncobj: Add deadline support for syncobj waits
      commit: 8570c27932e132d2663e8120311891deb2a853de
[2/3] dma-buf/sync_file: Add SET_DEADLINE ioctl
      commit: 63ee44540205d993854f143a5ab1d7d9e63ffcf1
[3/3] dma-buf/sw_sync: Add fence deadline support
      commit: 70e67aaec2f4706df0006423eebca813b00f5840

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

