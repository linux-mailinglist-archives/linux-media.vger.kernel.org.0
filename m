Return-Path: <linux-media+bounces-37035-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 882F8AFB815
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 17:57:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D84A61768A8
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 15:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47C7A224B03;
	Mon,  7 Jul 2025 15:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="ss/AozUY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A7A2206B2
	for <linux-media@vger.kernel.org>; Mon,  7 Jul 2025 15:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751903861; cv=none; b=U5GVCjSakEL0XQ+4lK96Kf5ZJRVCRSuSpMp46uWXDjW+4TaNPRrvgNgdJfvSjKqwR0ZQZsRCxYEa/SuvNNZA2yZ6COcXEUaF1DEGTzBkBQaCDVez8HlGFGfdPoxQ5eT13kpu+3YONIQ2hRGg4eAamI2uUt/G70fNouUTgUe/2PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751903861; c=relaxed/simple;
	bh=GekIVrGK4ewwojNX69mkqW74yj273UAIP552cTKfajc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e7qkN4hNjxjSmmWGi7zUvatYmmD0/B+D1PPd7E44+JrPdPtM/sQs0r33ls2M3tG8oelQtYJXGEVPchCeb1F+082qScklE9XhCURa1MKGadYXhWcfStdAK+UIBiOsrmo9Lp7G8Coi/1mxE1q4mWfarVvBXc8rLLIcDHfhqm8UPPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=ss/AozUY; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-70e3e0415a7so29126667b3.0
        for <linux-media@vger.kernel.org>; Mon, 07 Jul 2025 08:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1751903857; x=1752508657; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5nyJdBZNGQXRfrLLWrFULNmrJUzDZd+q5i06LyK0ZHY=;
        b=ss/AozUYB1urGta9L+qEj8R68XPB0ndjIlzamNIgzK0U8fu1QDy44+ED1/cyYqWlos
         nVLhQGiG4l4hlpEuv6fA06i7lgzre2MkE5UU8lVJ4ls8AJMLeh1NHoNn3CK6T4xkzBQW
         DlikNfPFumemx0klFZ3h0Gy+V3r/4d0dwPKRU3kXAADxPVkOc6FS7Xc9YQB/fQ2HdMAb
         k2xiFHzhCt0qLWLK4shdasCk4Ru7uG7GbGDImVw3qi5UX2WiL3EBP7GwbfvCsEPOYIVT
         oG0bDHjKNS0PWBbbys8Y0hnof+cb/x/5mCi1Z3ennUBp2lqHIqo/tjXVyLRxdfaGeaQ2
         vM4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751903857; x=1752508657;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5nyJdBZNGQXRfrLLWrFULNmrJUzDZd+q5i06LyK0ZHY=;
        b=iXJvK0RhaGbzfDKABf7SU6qW8vW3CDcowFRUhyQNq5qLD6HbtAh4pHpeKjKmchaaQp
         0QY+xl/gbO0f02M0cB3QflXQPI6bXMWqY88iKALrQznhZM1cIgG6rFCzaMirQ9NtGNJO
         LoTb9gOMW1HgPYYW4e5iSSikWZXKJYjlQWfjmHJAbi25UBaIhwK92jMuvKfTL1JU4Dgr
         qSWQUo51fVj9T8DVHuxRNu0zirSh2kVotKIwl8CS1na3LYXwYOb0/CkPrrZ/lPAVXNTg
         v3bQVVrjACGLoIulOIY9T5QW8D+nvjxAT08hEQzKQdlak9i4K7lKMC0g5rhrI47ZfUpw
         t9hA==
X-Forwarded-Encrypted: i=1; AJvYcCWONHbLvFGIexOz8xpGk110nuJ/lHbzmrYAleOBVWqLDBWNEnQqL2QYWWf8p1ZNvwm6HxmUWi/CSQtpaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOCMjPR4D+nY+wVAKB3dg7zzuiiH9Oa11QXF95vl9paj2eBTVN
	aYxlDNf1C7ENPi5Hsasl6QMHk76WJaFWfoseD0iutAb8NEYbJcXlt+6GgutzSXMUllsaTaEsLPJ
	LSR5BNqhDtxcryFrXdhuUGvQ2MNGNC4PWsZf1YRZUeQ==
X-Gm-Gg: ASbGncvchuycQtIMIFM2cuq90vi17sTSCGW5QvOOzw9r0HteYQMH6+KnYP4ZsyopA/N
	OCtdXNSd8+Rt5M/24zq9t6YhUiN7N2Ko+8+9LZWqGfNClwybMKL898ECHUlLxk5xW0qBhQa/3WS
	j27y/6yGjF0ScdQj5cwovtxUvorXioMXouIB2w7Z+WMuvUfCUIHqP7igkyJKx86hPaQNCo3vvs2
	wM=
X-Google-Smtp-Source: AGHT+IGXkinsClHw9T6S8vqJyiAKqsR81bmWFSB3E1wGxVpBShaqy93Jxk6vBcBEnqP8XUAGbCaobGyW++qJmVzyqGk=
X-Received: by 2002:a05:690c:c9d:b0:712:c5f7:1eed with SMTP id
 00721157ae682-71667ecfed7mr187732797b3.16.1751903857530; Mon, 07 Jul 2025
 08:57:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com> <20250704075431.3220262-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20250704075431.3220262-1-sakari.ailus@linux.intel.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 7 Jul 2025 16:57:20 +0100
X-Gm-Features: Ac12FXzisPQw3Zak1z4PISdT8JVI6i-l6yfwQpDlf8066YfTihFWEfCR_f0QlqY
Message-ID: <CAPY8ntCgEb9fd_rMGeWSeR=Hbzf1GNQeSh-gRcubtwzoahqnxQ@mail.gmail.com>
Subject: Re: [PATCH 41/80] media: Remove redundant pm_runtime_mark_last_busy() calls
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tommaso Merciai <tomm.merciai@gmail.com>, Martin Hecht <mhecht73@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
	Alain Volmat <alain.volmat@foss.st.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Umang Jain <umang.jain@ideasonboard.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Michael Riesch <michael.riesch@collabora.com>, Mikhail Rudenko <mike.rudenko@gmail.com>, 
	Steve Longerbeam <slongerbeam@gmail.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Nicholas Roth <nicholas@rothemail.net>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Paul Elder <paul.elder@ideasonboard.com>, 
	Matt Ranostay <matt@ranostay.sg>, Nas Chung <nas.chung@chipsnmedia.com>, 
	Jackson Lee <jackson.lee@chipsnmedia.com>, Dmitry Osipenko <digetx@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Vikash Garodia <quic_vgarodia@quicinc.com>, Dikshita Agarwal <quic_dikshita@quicinc.com>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Sean Young <sean@mess.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Matthias Fend <matthias.fend@emfend.at>, Marco Felsch <m.felsch@pengutronix.de>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Ricardo Ribalda <ribalda@chromium.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Sakari

On Fri, 4 Jul 2025 at 08:54, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
[...]
>  drivers/media/i2c/imx219.c                               | 2 --

Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

