Return-Path: <linux-media+bounces-23643-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EEBB9F5861
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 22:07:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 25CB218930A2
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 21:07:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 732CA1F9F4D;
	Tue, 17 Dec 2024 21:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="euq0mdZi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCC91DC18F
	for <linux-media@vger.kernel.org>; Tue, 17 Dec 2024 21:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734469624; cv=none; b=GPp3DzgE9kvuy18vH3WUm7470IaIL1TbRmydetaZLzxMr2QRf6eBXKy721n/CibmVWX9kC9Y71DZAaAif3n0bJ/n+XUYPKnQwN+VdeXvxaWUx22f7+XBKty2+hYhSlXaS3jVY6EIg1y/XvIkIpQcAB5tGZJl0ODMZnvPbhbV2No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734469624; c=relaxed/simple;
	bh=z71/4LhvavwXxWLiyBowbyul6ffxcN7deE9XCUuemM8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ne6yd6kdV3Feds+2yodcl8/G+oy+It4rdoO6z/fhGYTNRpuGAX/cJi7tNYaudDJ1n4v7u9kBwQKrDglSuDqF+AARwol3hKzEXtq2As6A40OHYl6xah2fN1FnyC82ZK3UocBRYF5s+kGSgmrRwyWPz8Fo60AIHh1ZPdwBqtdetgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=euq0mdZi; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-46783d44db0so60940201cf.1
        for <linux-media@vger.kernel.org>; Tue, 17 Dec 2024 13:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734469621; x=1735074421; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X2z+gGRH3Hg4TH3ErTWbJ3p44r0TEnT6v/hKO6OREek=;
        b=euq0mdZilSrcEPUApIrzLj4iOw+WvlxR72Y/ln8sORlaq7tqRbW1bzLYJHUky3H50f
         xMt5JbPzArFi9wOSUpPCvaF9IH6IXC0YiSheps8GZ7K67eKKoHBnvNJz0zHVF7/i9QbQ
         nBhLyBbL28WUzGm/k/4SsyHO/u8nUUmpJ9bqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734469621; x=1735074421;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X2z+gGRH3Hg4TH3ErTWbJ3p44r0TEnT6v/hKO6OREek=;
        b=rgzped0+h5FQbO5fEd9+XT7wk1FHKF6KJn3cikyZxaDzB4C3Yaiz9V7/N80OCJGQHO
         c1pO5aFefzIN9TqEAsWQKYqVorkGwTC1MjejkD9ZfuVr7k/D5W/1rz3Bgc9Ta4kCEJNy
         gcSQILO/HkssQoggyjwBiuKZCAAzk+UxCc4oHHHEskcexf99cToJeb6gIX5Mk/4qXjsz
         li7dlPv4fe97Z3tafYw7sQbWbilrzEH+3wLfMP1uu40gKG6FNFVoguVlZqMNK+ujc0jv
         ua2kdW2OJcbIp2v5S+3t5xrIVd/YCTx2nUCt3SioX5/1Oa06ygv/V2EdHoRYFKwpp0LB
         /RgA==
X-Gm-Message-State: AOJu0Yy7reBbs+4CIbbFwjDZgWASIVNzjqApmVQ1qbQK8d9KKqax+RrI
	vFGgXuAgEetWsI03ScGqyN7+WG7Y1BOsFDvg6ggn9fpET7RA+HC/lkgpCVFg4w==
X-Gm-Gg: ASbGnct1JaG8fiIuaG1XJa2h42tH0tvqHW1v+yxYl4kVEd6LPqJamaMPaeYz4Xw84PD
	jksEf7AmbOvE65Ki8acwTZCv65I4/E9IYsvo7Sy6O/2uFg7y/heGfJ3RLziuzDprxT+qoYMfw1N
	bGnaeQjVMw7bVfi7YNWu7gZSjLgO66g6ssq6WFdm7aIriM+8U7CjbkCt0zt/E9eBw6tR352lB2G
	8U/RLy8g4z+PVtiad70H+1zt7aKN5y9w9yvOFr10hBMx8q39MQtw4y1Wc85goGsdQ2MLBBBoLYV
	cCvluO/CvS8rJGlpWYDXecfKoVTf1i0=
X-Google-Smtp-Source: AGHT+IHiXAEmTYDeAuIe5fitEw8m4zt/Upe4SJ7Tdc9yvYm2t0ddYn4mLUyAzjkWjLDDLphiIrxuxg==
X-Received: by 2002:a05:6214:1313:b0:6d8:a7e1:e270 with SMTP id 6a1803df08f44-6dd09259c8cmr9575086d6.40.1734469621208;
        Tue, 17 Dec 2024 13:07:01 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dccd22f2a7sm42825276d6.27.2024.12.17.13.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 13:07:00 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/3] media: uvcvideo: Prepare deprecation of nodrop
Date: Tue, 17 Dec 2024 21:06:56 +0000
Message-Id: <20241217-uvc-deprecate-v1-0-57d353f68f8f@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPDnYWcC/x2MQQqAIBAAvyJ7biGXqOgr0cF0rb1YaEkg/T3pO
 AMzBRJH4QSTKhA5S5IjVNCNArubsDGKqwzUUqdJD3hni47PyNZcjH51PdHojWaC2lTv5fl/8/K
 +H5PsaExfAAAA
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

We intend to deprecate the nodrop parameter in the future and adopt the
default behaviour of the other media drivers: drop invalid packages.

Make the first step in the deprecation by changing the default value of
the parameter and printing an error message when the value is changed.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (3):
      media: uvcvideo: Swap default value for nodrop module param
      media: uvcvideo: Allow changing noparam on the fly
      media: uvcvideo: Announce the user our deprecation intentions

 drivers/media/usb/uvc/uvc_driver.c | 23 ++++++++++++++++++++---
 drivers/media/usb/uvc/uvc_queue.c  |  6 ++----
 drivers/media/usb/uvc/uvcvideo.h   |  4 +---
 3 files changed, 23 insertions(+), 10 deletions(-)
---
base-commit: d216d9cb4dd854ef0a2ec1701f403facb298af51
change-id: 20241217-uvc-deprecate-fbd6228fa1e2

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


