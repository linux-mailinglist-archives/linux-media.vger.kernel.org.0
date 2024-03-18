Return-Path: <linux-media+bounces-7233-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E6587F445
	for <lists+linux-media@lfdr.de>; Tue, 19 Mar 2024 00:55:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55D401C2181F
	for <lists+linux-media@lfdr.de>; Mon, 18 Mar 2024 23:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10E865F861;
	Mon, 18 Mar 2024 23:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kuFAKYCf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25F95F86E
	for <linux-media@vger.kernel.org>; Mon, 18 Mar 2024 23:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710806133; cv=none; b=umlf6cXdig1tgWiFVoT0N4Qv+QzalX9ZC6Zy/VcvK5Cb/+GlcH1OCDKoo1/NMol8d2QicFYUWM1xv3zp0w9s1NdbRbtmxe1DKr4TjwjXX4Q9xaf+dyz85eQFuzH8Pi2s1i2yYulUOnXX0E12QmIBg05kiMGcq17P0+DiA08nRlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710806133; c=relaxed/simple;
	bh=cNoHLLQvJGEdRJ/fXGpe0t7q5Pac3xLinizI/oUYWCI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Op2Hz5/CZGNzML8JvmAkWa5blS1bO1CYEZWQCkbWQGZj5RF4MCzaHa4VRQwTGySXtO37a5iyu4SRzNOlVJFO698dHZmYp7IiS7M1Dyp6Bo9f9ee3xqG5x0lkXtkvOzjiE1JWPKbODh4ABEY+NlnkYFfU++rthiQxIeD8DWffy0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kuFAKYCf; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-789f5ce0b5bso137402485a.3
        for <linux-media@vger.kernel.org>; Mon, 18 Mar 2024 16:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710806131; x=1711410931; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HH164PWpqmWsxknEeMAJyub736cK5Z2OEMFfDMtcc0Y=;
        b=kuFAKYCfjwmGmqGlpzDFDcey0dsNPxschPwQgzON18poiwYsMCIYqT32rCK1BTBgUT
         bOsoGyFXnTK2dLxPUWtAo8ampMvFQLIQSMSDexGPdarQi1LUyFXZdsY+5zOtAJYq0GQy
         K4a8raqnQeW5DaF7UPY2uVHyAQzGC+x63wLy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710806131; x=1711410931;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HH164PWpqmWsxknEeMAJyub736cK5Z2OEMFfDMtcc0Y=;
        b=qFLuL4ccjZ749o+AY8Qm+CfWWTKN891TClGbQyHIyEEYovZkqgvh7/SLR3EmYMLXXn
         +hLwNYIqXtx5SClYtNkojU0VBvIRmyOkO/KQEDdTVcYmbV3QpW76Swv0ZLAN6BoHMPPY
         HrkvIhl2ehMaeSntNo06o6fglKIBnKVrnEn55kLPMA1Kj85QOfO8YE6DJqmjDfvRO9Ws
         NS1C6crVPkc2gQovXXjRMavZX4DPtS6BAeVHsT3dMAr9CzgjCqDdqkssXUOiorCs6KXU
         RUCQTFi+nt5zQxPgm2SpwCzfHxMIVoCBkVUsrRjivWKVel2yOJdGmnu+PtFFRXVi533k
         L0Sw==
X-Forwarded-Encrypted: i=1; AJvYcCW6H2GaYGJSYNHINRMMHnubfC/MWhjzFKGeivnz6d6GsZgRMojpvRdpynWL379yN8IgEKSklV6fz2SWOKTAw08rpUTvW2QN3V7LEl4=
X-Gm-Message-State: AOJu0Yw6U2TJ5vYSk1TSvqNbaaG2mzAkawgjH0+NZlX15FOkrgL5RNJ+
	dn8TMpZa5/yMgvXnXcQYjnsz8tuZNlMkSHI18y55eAkmcYRHGDa8pVdZaRm7Tw==
X-Google-Smtp-Source: AGHT+IHxInxRNV6IqZh9cCvDPHVqyxnR81Scsj5aqtqnwOcJMSH57AaJel1+HzXIfNAQdV5Ou8PR9w==
X-Received: by 2002:a05:620a:2e9:b0:788:2fc4:c3ff with SMTP id a9-20020a05620a02e900b007882fc4c3ffmr14008745qko.31.1710806130967;
        Mon, 18 Mar 2024 16:55:30 -0700 (PDT)
Received: from denia.c.googlers.com (188.173.86.34.bc.googleusercontent.com. [34.86.173.188])
        by smtp.gmail.com with ESMTPSA id h15-20020ae9ec0f000000b00787930320b6sm4991690qkg.70.2024.03.18.16.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 16:55:30 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/5] media: uvc: Probe PLF limits at start-up
Date: Mon, 18 Mar 2024 23:55:22 +0000
Message-Id: <20240318-billion-v1-0-2f7bc0ee2030@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGrU+GUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDY0Nj3aTMnBygGl3TJKNEE9O0RAuzNBMloOqCotS0zAqwSdGxtbUAXaF
 yhlkAAAA=
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

The UVC standard descries the values for the PLF control for its
versions 1.1 and and 1.5, but it does not describe which values MUST be
implemented.

So far, we have been adding "device quirks" to provide proper limits for
the control, but this is failing to scale.

Add a function that during probe-time checks the capability of the
control.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (5):
      media: uvcvideo: Allow custom control mapping
      media: uvcvideo: Refactor Power Line Frequency limit selection
      media: uvcvideo: Probe the PLF characteristics
      media: uvcvideo: Cleanup version-specific mapping
      media: uvcvideo: Remove PLF device quirking

 drivers/media/usb/uvc/uvc_ctrl.c   | 173 ++++++++++++++++++++++++-------------
 drivers/media/usb/uvc/uvc_driver.c | 122 --------------------------
 drivers/media/usb/uvc/uvcvideo.h   |  61 ++++++-------
 3 files changed, 143 insertions(+), 213 deletions(-)
---
base-commit: b14257abe7057def6127f6fb2f14f9adc8acabdb
change-id: 20240313-billion-5b2a45fa86f4

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


