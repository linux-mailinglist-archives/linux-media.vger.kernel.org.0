Return-Path: <linux-media+bounces-7760-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D3F88A8F0
	for <lists+linux-media@lfdr.de>; Mon, 25 Mar 2024 17:22:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E0001F62DF2
	for <lists+linux-media@lfdr.de>; Mon, 25 Mar 2024 16:22:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D44E7153BCD;
	Mon, 25 Mar 2024 14:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nMg/uVE/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B29128368
	for <linux-media@vger.kernel.org>; Mon, 25 Mar 2024 14:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711376399; cv=none; b=U6SmUxUqZzUBxC9W52+QPS2AJGWYFlcCfTnZVycu/tD46s5WSEmmH4748wxPw1c7yTrihPUcLbvWGvonYBeD9vZBXB2xECFwmT99V7w5lxn61jyJrPTYvCtKLd9AhvOe+nAkC2B4T5Sm24tkuBCYtperKqYsMtjQpjVXYgyU3r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711376399; c=relaxed/simple;
	bh=SydhYBUNZqt6seDV8GSPes7otcagbCoXjH+x0l9PSis=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uSzJxR9ca/nx9bImFnVkt9xZ+RsTIURqVuP9f207HtDhim2b4jr5SQ/9FbPxfjw5vs3SMdPyWkKcV116i7svTPsoFA6jVYaDHEFbiOFwiCTKYT42XO4dRdLvO1ICqr7Ry52B58l7knWSOUSyk1Jmf9ZERrZblIav+c9bClTMduU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nMg/uVE/; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-430b7b22b17so30812661cf.2
        for <linux-media@vger.kernel.org>; Mon, 25 Mar 2024 07:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711376396; x=1711981196; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H3XV/BFRORhDDlgNHHmWyRWqMIVOw6WvWWLzRQu/wIQ=;
        b=nMg/uVE/TL6u6fL6AzDxSZwnQzAjadgsZTZT8E2sZqodgHh4JMh+NnIqUAKBF2KiPp
         Uhf8FeXRjkfRHwBoEN+9HafE25od3khaHWe5KwP3QD11kTwsR0mlAy/E1Qq05birEqIs
         5DX2ztrA4a8YaATMC+x3ToK3CmHhMWnbJaD8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711376396; x=1711981196;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H3XV/BFRORhDDlgNHHmWyRWqMIVOw6WvWWLzRQu/wIQ=;
        b=WeO+jMHmxUDHJyFeEF23Bl4hE6uncuxghpj69gEgvBscf+vgq5baq7e6X0cEyjzJzH
         zuMnL+An8itdcj/L3Cxioo28SvnBHuoV4uKne7bWexMRc/sxx1ZOCSjMUOtbYqss4zSw
         2xLZu+bw3rPHRK4r/sX8WkGb8mwDjKkvVAwxzZVbjNZWdGspQnrj4Axl9VKM5kQV5AhC
         yneX71qqyMtBV+aCFjNLIueadegOAeTQ59oasXCzZ5VKb6SUeGQdR1RnPd4p35gsdXeo
         UPRmYSzA9W56y3gF4IUDF+KmWldyEGqcZqtVOdQHkbVubDBvyjm7WuR+rEUngaYf71dV
         ARRQ==
X-Gm-Message-State: AOJu0YwO1fv1L4I/xWulMTTMPrfkrpG72Gf8C8UhcsZaAcSM2UkGT2Go
	xecCQkrEh2iCrvMKS7LmQeQUQT+a6qwpHDFEuO815e7DiHvr2+Ap1/iGRev/Tg==
X-Google-Smtp-Source: AGHT+IFEBffHombxu9VAZkjJQI0jb6jvl5jRk9TPO0Fy0y3nb6ZId/qWKdNbjlbDsQjikKxzHMWPyw==
X-Received: by 2002:ac8:5a09:0:b0:431:5c20:f0d2 with SMTP id n9-20020ac85a09000000b004315c20f0d2mr2279132qta.22.1711376396512;
        Mon, 25 Mar 2024 07:19:56 -0700 (PDT)
Received: from denia.c.googlers.com (188.173.86.34.bc.googleusercontent.com. [34.86.173.188])
        by smtp.gmail.com with ESMTPSA id br11-20020a05622a1e0b00b00430a9b20a55sm2618759qtb.69.2024.03.25.07.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 07:19:55 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 25 Mar 2024 14:19:53 +0000
Subject: [PATCH v2 1/3] staging: media: tegra-video: Fix
 -Wmaybe-unitialized warn in gcc
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240325-gcc-arm-warnings-v2-1-47523cf5c8ca@chromium.org>
References: <20240325-gcc-arm-warnings-v2-0-47523cf5c8ca@chromium.org>
In-Reply-To: <20240325-gcc-arm-warnings-v2-0-47523cf5c8ca@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

Make sure that tegra20_vi_get_input_formats always assign a value for
yuv_input_format.

Fix:
drivers/staging/media/tegra-video/tegra20.c:624:72: warning: ‘yuv_input_format’ may be used uninitialized [-Wmaybe-uninitialized]

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/tegra-video/tegra20.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index c25286772603c..c39b52d0e4447 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -176,6 +176,7 @@ static void tegra20_vi_get_input_formats(struct tegra_vi_channel *chan,
 		(*yuv_input_format) = VI_INPUT_YUV_INPUT_FORMAT_YUYV;
 		break;
 	case MEDIA_BUS_FMT_YVYU8_2X8:
+	default:
 		(*yuv_input_format) = VI_INPUT_YUV_INPUT_FORMAT_YVYU;
 		break;
 	}

-- 
2.44.0.396.g6e790dbe36-goog


