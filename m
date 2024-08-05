Return-Path: <linux-media+bounces-15765-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 475D99475B0
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2024 09:04:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2D65280D10
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2024 07:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07A42145A06;
	Mon,  5 Aug 2024 07:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="llCsrBwo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E841109
	for <linux-media@vger.kernel.org>; Mon,  5 Aug 2024 07:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722841462; cv=none; b=g9hJCeFDdCo2Ru/MHuQ48kYdhK8UidhIAFw+BeJfQIbt28keQL99iVJGraP7B1d2ZNcWRs4ZVDqTg/FoP1e28pB4+GKfuwnL9yRExZBrRSGEHq0OqaLNpF43Crjx9Y03SXkT7du4EmsTDTJiqiVVOb5uQT/vo/NzzxJ+aDJGZ6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722841462; c=relaxed/simple;
	bh=h6H39F2S0mpS0lMNDm8pSdRK2LaS8yFuqZwSRSJ2+Jc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cYRAOQcoJxY04egbk5eTBSDBSMWOkM3+CZlTC9MbMX/LtdYq/5Hx9nuw4oiELcZ0vWyQvAFwGNyU0qHrAw9fUsDN8g77Cco0XnTs7tSyqakUz0oXvPml8XCmAmhI2r1e1PsV4YZgZFwazqhRDLOEQm0nMPIjnLz3+oKzQ274uyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=llCsrBwo; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5afa207b8bfso10779966a12.0
        for <linux-media@vger.kernel.org>; Mon, 05 Aug 2024 00:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722841459; x=1723446259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FhgplcAuFlwuC98/TJj5z2UdxVN7aqUt1mjMAuBEPuI=;
        b=llCsrBwoGIV1QVQlZnjouaF19YXE1Tv0pa2ZIUwEIg7FLJ1Igz4I+jB55qZMd9j5mX
         hQPgw9QQUYQ5oGwks1ezqe5qEwRNdf12elAEk+uAEhuwMr9pwuH1NMBUvDNL79Y0LXhB
         bt8E0c5tB59QAzQ7sKXDqNMj/C8z5dxVCk6MH3lz1NHYpV6hRtszzFNBjaL5kKx9U7aN
         t2xDp8dSwKO42ERCE5arw/d8XVavFF+4k3CQgLVAO7o5pdPSNyoOtD50iseQwrjKNgvf
         xCftbTMLwnqgS5WKd11erAYArTGstkWUnr6StCc5bCvU0hoSy7Mbv3NunV47r5LswQcn
         eAmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722841459; x=1723446259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FhgplcAuFlwuC98/TJj5z2UdxVN7aqUt1mjMAuBEPuI=;
        b=fV1HSHMCBvI8brNPGmY8alB6Vzc5ljfIi2HNqsi73I2GRmSwmNPeZk2h07jTG+pvTH
         ZLKAIblY/Emufr9F2ZeZbniu+1UszF4ucOzIiTmvk3iS0QyBqt3H1yE1DEV5SaP3IUWA
         mMyfDKQhLES638CtNBiMKUn5AOFRHftd/C6hySV5GTQqUtvZ1Ajg2t4FSXMlMfmiShFF
         FTa0/vyk47YlCV5/KjliLViRHvV97j/DpDlqakeqq3xgDk2KpA18YmZJh79yF6bxb6lv
         mgkbBIt+8D8xet0tkCwiv+Nw4yevoykWpAV+1iazsDdCkEm8iiG3drLKXGOoksd79apk
         bvkQ==
X-Gm-Message-State: AOJu0YzR5urCnYOqHjAPrJABaXfIwPQTv0aABn4hdjOag4T6SO/c/G1L
	kkNNtnfBa4B4pZFX6d7riIlQGzN4jOFSjmzPOnklkNcrej1y9q0wWHqUKw==
X-Google-Smtp-Source: AGHT+IEM3tETaq8UqiF487aWUGcUwgFWKFB67Oddd7hgKjNnpJ2j8lAgWh9A62PEVwvEPzEgXtjCGQ==
X-Received: by 2002:aa7:df12:0:b0:5a0:e62c:61c8 with SMTP id 4fb4d7f45d1cf-5b7f5128fc3mr7623940a12.29.1722841458725;
        Mon, 05 Aug 2024 00:04:18 -0700 (PDT)
Received: from foz.lan (ip5f5a9677.dynamic.kabel-deutschland.de. [95.90.150.119])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5baa6b916b8sm2209629a12.22.2024.08.05.00.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 00:04:18 -0700 (PDT)
Date: Mon, 5 Aug 2024 09:04:14 +0200
From: Mauro Carvalho Chehab <maurochehab@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media <linux-media@vger.kernel.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [GIT PULL v2 FOR v6.11] uvcvideo fixes and improvements
Message-ID: <20240805090241.2df0f4b0@foz.lan>
In-Reply-To: <20240617202800.GA19966@pendragon.ideasonboard.com>
References: <20240617184749.GB23867@pendragon.ideasonboard.com>
	<20240617202800.GA19966@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Mon, 17 Jun 2024 23:28:00 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> Hi Hans, Mauro,
> 
> The following changes since commit 91798162245991e26949ef62851719bb2177a9c2:
> 
>   media: v4l: add missing MODULE_DESCRIPTION() macros (2024-06-15 11:16:40 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/media-next-uvc-20240617-2
> 
> for you to fetch changes up to 8c40efeda94108d65c52038ea82ee83b2fb933e2:
> 
>   media: uvcvideo: Remove mappings form uvc_device_info (2024-06-17 23:21:13 +0300)
> 
> ----------------------------------------------------------------
> uvcvideo fixes and improvements
> 
> ----------------------------------------------------------------
> Daniel Schaefer (1):
>       media: uvcvideo: Override default flags
> 
> Laurent Pinchart (1):
>       media: uvcvideo: Force UVC version to 1.0a for 0408:4035
> 
> Michal Pecio (1):
>       media: uvcvideo: Fix the bandwdith quirk on USB 3.x
> 
> Oleksandr Natalenko (1):
>       media: uvcvideo: Add quirk for invalid dev_sof in Logitech C920
> 
> Ricardo Ribalda (14):
>       media: uvcvideo: Support timestamp lists of any size
>       media: uvcvideo: Ignore empty TS packets
>       media: uvcvideo: Quirk for invalid dev_sof in Logitech C922
>       media: uvcvideo: Allow hw clock updates with buffers not full
>       media: uvcvideo: Refactor clock circular buffer
>       media: uvcvideo: Fix hw timestamp handling for slow FPS
>       media: uvcvideo: Fix integer overflow calculating timestamp
>       media: uvcvideo: Enforce alignment of frame and interval
>       media: uvcvideo: Allow custom control mapping
>       media: uvcvideo: Refactor Power Line Frequency limit selection
>       media: uvcvideo: Probe the PLF characteristics
>       media: uvcvideo: Cleanup version-specific mapping
>       media: uvcvideo: Remove PLF device quirking
>       media: uvcvideo: Remove mappings form uvc_device_info
> 
>  drivers/media/usb/uvc/uvc_ctrl.c   | 193 +++++++++++++++++++++----------------
>  drivers/media/usb/uvc/uvc_driver.c | 160 ++++++------------------------
>  drivers/media/usb/uvc/uvc_video.c  | 169 ++++++++++++++++++++++----------
>  drivers/media/usb/uvc/uvcvideo.h   |  10 +-
>  4 files changed, 261 insertions(+), 271 deletions(-)
> 

Hmm... while the PR has 18 patches, after applying this series on the top of
media-stage, there is just one hunk at the diffstat:

$ git diff  2c25dcc23619
diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 4fe26e82e3d1..8557b8ef2ec2 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2692,6 +2692,10 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
                }
 
                __uvc_ctrl_add_mapping(chain, ctrl, mapping);
+
+               if (uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
+                   ctrl->info.selector == mapping->selector)
+                       __uvc_ctrl_add_mapping(chain, ctrl, mapping);
        }
 }

Perhaps this was already applied but you forgot to update patchwork?

If not the case, please rebase this branch and submit only the patch 
which adds the new logic.

Regards

