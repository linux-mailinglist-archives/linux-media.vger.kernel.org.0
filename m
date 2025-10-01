Return-Path: <linux-media+bounces-43440-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35605BAF233
	for <lists+linux-media@lfdr.de>; Wed, 01 Oct 2025 07:18:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E05EB4A5D1C
	for <lists+linux-media@lfdr.de>; Wed,  1 Oct 2025 05:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 796C024CEE8;
	Wed,  1 Oct 2025 05:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OpY5bZi0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6BD34BA58
	for <linux-media@vger.kernel.org>; Wed,  1 Oct 2025 05:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759295891; cv=none; b=LJ6r0XmiK6wADyoyP1YcxQx8rzOH3lfZ5yHcGy2KA/ojGik55rLaBY0oSOlELFT0ginecTuK/XTa7IPs3hG6OGTil+nWa9TrpMn9noDxSzFUdiRaDOLKVpBBAkoTRhJhG7IGBV03ICETZx44XTzCNK2viycwMu+JFvzKXeXelO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759295891; c=relaxed/simple;
	bh=oNjTJ0dIWTXRyJd9FpOyJ8FwljWhSqEk2bfEpn7IAGg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D82WJuuG8Op0QX2yYi+Url3jCkCyfUmsC6aEWYK7uSf+8RRoa0n6i2zPdYT7tUf7H96nSGb3nTNAI4VGKTGJkrZXTYZ0+hMqrtfdGYq4ZVE/pEBohp+khQAHU3qhM6QELftzlYwWQFwHsYzy9cI97/O14mwJecG9bpFz11yTHik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OpY5bZi0; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4e06163d9e9so30008871cf.3
        for <linux-media@vger.kernel.org>; Tue, 30 Sep 2025 22:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759295889; x=1759900689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BxqunAE1voP0JsaJfBRf99gtBd6a1o1QCraMtaviFTI=;
        b=OpY5bZi0X6yXfXeaLrG8IzFtq6kGOUD2pz+u0BCI1grs3GCRbmC+OHFJNxRZ4ihSq1
         w0krw9QxXeKvIXcGg57ChKAKX6kLXFoCaKx8otuBG8m0o+TU61Z8q28EZXg5VKt1sDDG
         v7lQAp03AoEFXnV4kX+wQEs5+O9v+4VixRyGHxtNdnqFeQuZ/CF9kb4+ltrjruMO4zwC
         T1ju5ZUZoFEss/2lafyDa4uQC3nP+E6ddFCv0rWUbgmibCFrCK9FvRnxlCXF6RQGfiTy
         wnaNiEGkPNN4wBLJqCUS9I4NJ9TSzOui7F1nWcJ9AFiR6PKNom6U5dMO8+ALEhA/nCnx
         FEaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759295889; x=1759900689;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BxqunAE1voP0JsaJfBRf99gtBd6a1o1QCraMtaviFTI=;
        b=aORSHXLffyil/J+ylkxObkyqPMCPTxJ/i9V+TxYdbHHDWEO4AcOAt8vGK6UgrhxSTy
         1OrqOxa900BeGcl4o2FQxJVub0C8A2KhnIhWZlwl6eZzR1pMohr8qnk8FRLioe1FNw47
         PCciXBFXnv8tf1RPBk5ghVHNq+/cUjTcS6Y3vOibVCrg06G2gYl/fo0gDUMNW6W0OUs5
         aRCwVsI61W+GYkE51pHqoFZq91w+dim2caRaMgDq7aYzxTWaDCcmZ8sGvMZvMI5HebDV
         +UoE8NNXfHtuvP6oFifn4ns7D/msQC3gFXZNm6lscP7VbvXc4SrzaqQPmmBWPyC5hf2a
         s6FQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQ5QuGetVGahe8UX8pp+0I7+1XkR6Q46wr5QOO6aEeKyBbtxPlBWuciUSdDpms46NrBAy6Q9XiNCiJ6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvlMBhZW2eL5SCLDK+t9ytsBHrKNNXkIOyPefjAqBXjdLxjZNz
	g3ggHbVDsaHa3N5gBnMxm+qu/NobN02KwQQoZSLaIZkk9X/fv6gqEfAX
X-Gm-Gg: ASbGncsXRDnq39KjoG7zsXP8Bms+LmXrOINGI6pwHyeOpX50Hl9sGRaJsT/0OusWNvp
	QbhuPpb0AHpR1srXUpqdAW/vajM7GbZ9LiuKH0+b9d1wk41DAlehfY8W674pDmQLs7L0NdEcNVL
	9hmD49vKLJ7gWW8nkpYT2PZ29pMXQj/YIy3S895kI1PdinWRD+7dyIqSgQmjQBbkgxMFmiv79Fi
	4NBgRuT3Kc2m9kR8VJbbh6Acx5+M19qeujTekGNsuaglWCdg3MjQDcm1OdM8XPnpM0De30zCS7S
	md1AG93IXDAWVuZYnXBka2AJxauZlhjglusfE+Qx3ZA3ejuKCKTt+QkF5TqeG1RJFj8pauelZBA
	A5ArBzM8LsIqA8jyshpb/9uGeskMq6XBGAwmVWP1YLDMLc+1kwOfmrsg=
X-Google-Smtp-Source: AGHT+IHb6/fEglczrr3Ev9cuKvc8X8A1IQEUBdNXQFgNrBT3lBV6ALB1q2Du0bnDnnCCY3ZJvaDJlw==
X-Received: by 2002:a05:622a:98b:b0:4b0:8890:105e with SMTP id d75a77b69052e-4e41c544bc3mr31695191cf.2.1759295889040;
        Tue, 30 Sep 2025 22:18:09 -0700 (PDT)
Received: from localhost.localdomain ([23.162.8.189])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4db0b56fe22sm107656811cf.20.2025.09.30.22.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 22:18:08 -0700 (PDT)
From: Forest Crossman <cyrozap@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: Forest Crossman <cyrozap@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/2] Add support for Geniatech/MyGica A681B and PT682C USB ATSC/QAM TV tuners
Date: Wed,  1 Oct 2025 00:15:25 -0500
Message-ID: <20251001051534.925714-1-cyrozap@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello, all,

This patch series adds support for the Geniatech/MyGica A681B and
PT682C, which are USB TV tuners that support ATSC/QAM. These devices
both use the MxL692 combo tuner+demodulator IC, so adding support for
them only required adding the USB IDs and modifying the existing MxL692
driver to take some configuration parameters from the drivers that use
it.

I've sent this series as an RFC for now because I wasn't really sure how
best to pass the clock and MPEG parameters from the USB device drivers
to the MxL692 driver. I ended up just adding some extra members to the
structs and copying the parameters to the MxL692 configuration on probe,
but this feels like the wrong approach. The only other ways I could
think of to do this were:

1. Making the mxl692 module aware of the TV tuners that use it by
   storing the configurations for each TV tuner in the module and
   selecting between them with an enum.
2. Including mxl692_defs.h in the TV tuner drivers that use the module
   and initializing the xtal and mpeg structs directly.

But I wasn't sure which option would be best, or if there was another
way that I hadn't though of. If anyone has any suggestions on how best
to handle this, I'd be happy to hear them!

This is the first change I've made to a driver that's more than just a
handful of lines adding some device IDs, so I'd appreciate any advice I
can get. And if you have any questions, please let me know!

Thanks,
Forest

P.S.: I couldn't find the MxL692 firmware image anywhere, so I wrote a
script to extract it from the driver for Windows and have posted that
script here[1]. Also, for the sake of completeness there is a newer
firmware image embedded in the Geniatech/MyGica drivers for Ubuntu
20.04, but that firmware image didn't work with the mainline driver so I
haven't bothered to publish a script to extract it.

[1]: https://gist.github.com/cyrozap/f07a8b9803d2e9e3d0ee7acf54843ab0


Forest Crossman (2):
  media: mxl692: Add configurable crystal and MPEG settings
  media: dvb-usb-v2: Add support for Geniatech/MyGica A681B and PT682C

 drivers/media/dvb-frontends/mxl692.c  | 38 ++++++++++-----
 drivers/media/dvb-frontends/mxl692.h  | 19 ++++++++
 drivers/media/usb/dvb-usb-v2/Kconfig  |  1 +
 drivers/media/usb/dvb-usb-v2/dvbsky.c | 69 +++++++++++++++++++++++++++
 drivers/media/usb/em28xx/em28xx-dvb.c |  9 ++++
 include/media/dvb-usb-ids.h           |  2 +
 6 files changed, 126 insertions(+), 12 deletions(-)

-- 
2.51.0


