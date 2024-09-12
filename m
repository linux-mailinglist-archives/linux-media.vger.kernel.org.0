Return-Path: <linux-media+bounces-18217-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5262D976B91
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 16:07:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A2908B21A1A
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 14:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A3061B12E6;
	Thu, 12 Sep 2024 14:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kycrAe3w"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAED01AD255;
	Thu, 12 Sep 2024 14:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726150019; cv=none; b=TPJdr0sWSEDMXF0Daif17C2HWitrQ6XXKDgSukRhg27BZDZqBgPKTi1iFdasfytZZO0a2aTf+mE9QIO6l/TcWwnpxUHaMdesQfg1KOEYhA7pvdCdQS9KlE4OmcE9OY9/mVng9qRjEO/fU0y6cloDJ9TY5sl6wiPMU0/4mjdGKns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726150019; c=relaxed/simple;
	bh=yh55Fja5imKCEj5s0pmPR0AD0iVtKIlI4pm7KKVPpQ4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Dglpdxr680EuRwg7Byi1XfGz4fZ/vB5Z6zNfYD5gEt8Qjuw3KAfUW2895nZZgI5t+SdP9SPdiYsFfvMb9JGLNgQjGn6ybUQfC8K/dTIBFqEN/Ropieg/dgbNzoWyPLwBYueUc9ijZ1VaXYDcg2pv97kooat+OuNArflDXFE88SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kycrAe3w; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a8d6d0fe021so158265966b.1;
        Thu, 12 Sep 2024 07:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726150016; x=1726754816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PtFTlJ4LGeILm8e/R3yARNqYPoho3QSOqPGen2YyTwc=;
        b=kycrAe3wPBTU4aedxwubPihLwb8YM+ovAF8xSbpVaC5gSGN/XJMB267nkFW4t4wAXy
         r2JkMjbE90Wu+xtbxNELPFcI6nI6y7NLjaDXjfndKNBV2Yuf7PAbz+ETtEVPyeZzIjna
         +tdVMrBEpleoS6+egNpR1zZjEcZyziPTRtQCPDXaxfMvvgYnCtf5dLY7eBmcbXC+dLcd
         95MCJW5fpw03TOysqEZAnEjH0PzG4Nj6Jc99wpFFpcxAHC/95x4zR7Kjd6NXQJ5pMt17
         278ihkxsjMqVGsXLjHTMFlOW7s7SUvlZSg412GCKFVstUgj5BsNcp0Bm6BdfTPjgKJ4A
         R1og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726150016; x=1726754816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PtFTlJ4LGeILm8e/R3yARNqYPoho3QSOqPGen2YyTwc=;
        b=mGoP8FStJBmHFiyVN2G2MWeAFsf7wnU028RZQNIzcr+/Xh6lHKNqCb65newrIHnhUI
         AI4I3SOg4o4YzdZ8p7BfqTsix72CATwuub2sbVd2QnT/6OirfaES5IDib5MgKmkwcAaF
         9cFRqF3P217lsZFOBiYRfzVuWXbuGr9K3Tz96UOBS9osDcimmD3u/FtSa5dIY+Lh2FWe
         vU+dOya81w7f1bJvGExNDEDKWVd7y5lItRUcOiUo6FY6r8tqrywUBXtTcNBr7QL5fx9B
         Gxu6w2SKuQ3LdMFpseJxNQoN3/mNf0/WeQm2UUTsvPfWU/XzgdMU5MTZbltYc4ieuBVl
         NA6w==
X-Forwarded-Encrypted: i=1; AJvYcCWMaJTCSfoPPG9VTZCEnVkIEdVU7NuO8OX0oWzllpMlkyn8uHJuDsSqKh0r+Drhh+vG/DYYVTQr5VFdzis=@vger.kernel.org, AJvYcCWxkFSnvEjlyd/GpnlH4Fxs/Sized86Xbr15q7enyuLA2fF4SGwyaP8RhEUvM+0uu52JeyqBJ1sLXkHc9A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAZ+xR1WjM+5wOQ6jgRlQ3Os7MAblhIhzb44ZxzUxJa7s6EG9e
	m1x6Ue5ahDnmIEvPPMgOChbXBdAmyyEa3EYqunePXgQrm1xhOa2J4fESzg==
X-Google-Smtp-Source: AGHT+IG86/ezpoTWZehl1uQOzFPn+8Pv8fA8YkWez5k4yzj+CUblwK3M/AZq3cj6uF0/AKBUktvPSQ==
X-Received: by 2002:a17:906:fe09:b0:a7a:b070:92c6 with SMTP id a640c23a62f3a-a9029617408mr302056966b.50.1726150013566;
        Thu, 12 Sep 2024 07:06:53 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation.station (net-188-217-48-58.cust.vodafonedsl.it. [188.217.48.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25a258a3sm748268466b.89.2024.09.12.07.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 07:06:52 -0700 (PDT)
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: 
Cc: linuxfancy@googlegroups.com,
	sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	tomm.merciai@gmail.com,
	julien.massot@collabora.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] media: i2c: max96714/max96717
Date: Thu, 12 Sep 2024 16:06:47 +0200
Message-Id: <20240912140649.1243602-1-tomm.merciai@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi All,
This patchset add missing HAS_EVENTS flags to max96714/max96717 drivers.

"If HAS_DEVNODE is set, and there are controls, then HAS_EVENTS
must be set and you have to be able to (un)subscribe to events.
Because the controls can be exposed to userspace via a v4l-subdevX device, and
userspace has to be able to subscribe to control events so that it is
notified when the control changes value."

References:
 - https://www.spinics.net/lists/linux-media/msg220721.html

Regards,
Tommaso

Tommaso Merciai (2):
  media: i2c: max96714: add HAS_EVENTS support
  media: i2c: max96717: add HAS_EVENTS support

 drivers/media/i2c/max96714.c | 6 +++++-
 drivers/media/i2c/max96717.c | 6 +++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

-- 
2.34.1


