Return-Path: <linux-media+bounces-2976-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7698181DB1B
	for <lists+linux-media@lfdr.de>; Sun, 24 Dec 2023 16:41:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A6F1C1C20B62
	for <lists+linux-media@lfdr.de>; Sun, 24 Dec 2023 15:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D0036ADB;
	Sun, 24 Dec 2023 15:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hiFc9mCy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2002F7470;
	Sun, 24 Dec 2023 15:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40d5473882aso6079165e9.1;
        Sun, 24 Dec 2023 07:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703432492; x=1704037292; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Hsscid1EgQq4Pv9D8Tyu9t5D/wA4c25NkZV8ylTpgOw=;
        b=hiFc9mCy1deG7Uf8uXeIaaP6xclu95QqGESBUvVMBPKSj+zAIN4tix6dHnYeJ9xK50
         MUZr/X2S3MIIwHafwblris+K6U1Ff9z9qyJn7chczZqgDTk8rBLKkLfp8JI8m8EJ+Mg1
         JT4SmypU74NahgpMM4bFKdFzoH5SaZ/mrQzyAfpaQFS7+ElzpBnuowvxKrAs8BHoUlv1
         NZjcY970h2iUDC+evtPclV2itmRI3UZo28A/9GcgDIcuSlWCE1IxDytoE87B4kMIoVEJ
         d7ggJGXfdNlvfMpvijEAi7xtsjaGdsjIJASmLe8I9xu+yrPIhAwnW8qx6tNoH308nbtL
         0tkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703432492; x=1704037292;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hsscid1EgQq4Pv9D8Tyu9t5D/wA4c25NkZV8ylTpgOw=;
        b=dDvHoRil9LGQsq3Ay33B4w8CI3B3F8VXQxnyEaMM0nXSAsNgqCBuirNE4cSXwOnjN5
         r3QLMIk9BkzkGq2e3ad9wzcwxCFBuaiXoIk3+EkBR88UBCqdLVB2WGWUBJCJEZKi0Rob
         7ImiLFUgVNeFCtyefu8rzIpq1fQEjQEPT2C0NbS1oyJ1PJodLGk4meqvhSTqBZYfcNt+
         8J2xx5kPK5xheCIxv9M+vyY2n3TKMcgQXQjj6e5STz213SF9isptOMHliAUV7hAbRu7Z
         Gb86iXohXB6EBhScxOayKIsebHbpL8K/GGuzWVAI3+yHgVjA6as4DDtgfjPbQHe3LOVj
         Xmxg==
X-Gm-Message-State: AOJu0Yz1PbDbhGkigjAankMtBrB1Hs/ipb+d+PRzTsrBeyi8tU7JLLMu
	8q81IWeRcXebT5wBm4sQCHkhxDp+4lsHkFn/MJCUVt8gmrbYf/EY
X-Google-Smtp-Source: AGHT+IFKDO7deVyJSR33qayFwyYReUf9hq+e9IyZjKGrd4K0+xPzCuVi83eieGs2ty6Arow9+moR9N/0qRksB9FUKiY=
X-Received: by 2002:a05:600c:3b11:b0:40d:3f1c:c701 with SMTP id
 m17-20020a05600c3b1100b0040d3f1cc701mr3054046wms.22.1703432491669; Sun, 24
 Dec 2023 07:41:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Mario Marietto <marietto2008@gmail.com>
Date: Sun, 24 Dec 2023 16:40:55 +0100
Message-ID: <CA+1FSig3FqyymCY6prFnX9Bx24WSiec-CxgriKgG5iJvuEPB=A@mail.gmail.com>
Subject: vidioc_try_fmt:379: Unsupported format for destination.
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hello.

Have you ever seen the errors below inside the log of the ARM
Chromebook model XE303C12 ?


[ 2416.631903] vidioc_try_fmt:379: Unsupported format for destination.
[ 2416.631937] vidioc_try_fmt:379: Unsupported format for destination.
[ 2437.287065] vidioc_g_selection:764: Can not get compose information
[ 2437.294194] vidioc_g_fmt:347: Format could not be read
[ 2437.300364] vidioc_g_selection:764: Can not get compose information
[ 2437.301979] vidioc_g_fmt:347: Format could not be read
[ 2441.711496] vidioc_g_selection:764: Can not get compose information
[ 2441.713115] vidioc_g_fmt:347: Format could not be read
[ 2455.174443] vidioc_g_selection:764: Can not get compose information
[ 2455.175663] vidioc_g_fmt:347: Format could not be read


I'm not sure but they could be correlated with the warnings I get when
I try to watch an mp4 file using SMPlayer :


libEGL warning : egl failed to create dri2 screen
libEGL warning : failed to get driver name for fd -1
libEGL warning : MESA-LOADER : failed to retrieve device informations


I'm looking for the technical reason why,when I play an mp4 video with
VLC or SMplayer (and for sure other multimedia players),the video
proceeds in spurts.

Thanks.

-- 
Mario.

