Return-Path: <linux-media+bounces-34959-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCD1ADB537
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 17:24:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D2781674F2
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 15:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6390422F75E;
	Mon, 16 Jun 2025 15:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nujVl81k"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCDB1C5D7D
	for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 15:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750087492; cv=none; b=XWt1mt1N4sSG8uwM2ooA6rrZkPFdD0/W2hZnG8Qotck9UQF4Bc3DSkS1bcFsKn3QKvzJTQeHhS9F60wZQ+DiSvuJZlTtOniLqqOFKDvMb8LPSlC052aNIhFEiIYOP6qXCoxlgxnPxB5+YAaTyagQapm++cPgeTwWNQaR7csLDoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750087492; c=relaxed/simple;
	bh=/ctcI5zq3gIzZXnfGFYc8xkKJPq2Ec4HSPKJ2/pD5Qc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JXwzLhE/sBH5KZp1NxM/2vK9x3APCdBTUISsYBojumO69N3uTU3S9yqJ8NKFkodQzQgGrvPTkOmHfKLzzZAAs6rdE+EjLPJ8UVwMUa9ko0qxIrurWiLMsIz417DMDytXdV2spk2oTmTyL/e6K78ZfrmmU8tmuQDgwrjxf1qYZpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nujVl81k; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-553241d30b3so4081082e87.3
        for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 08:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750087489; x=1750692289; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E4xFHhWgDcpghRYZo7vm6fqhadBi5lxuMRQKlHZhCCk=;
        b=nujVl81k8VBlCXtcLCjmY9xBmKOqRVPZ4U2Dk00DKnfa2axL1kuvt89VZEsztN3DDU
         sWDsRIypvF8Q+ub9okeTjEmf7hlKTpOQNa3wDTvIYsFm4ZegFmvtFuKRImKvnsnv70BI
         zA9we69nM4390Edj6BxzKT2haGsKOiBzkKBZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750087489; x=1750692289;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E4xFHhWgDcpghRYZo7vm6fqhadBi5lxuMRQKlHZhCCk=;
        b=sgDCc38XVU5NTi4D6Et7a6aej3hylC5GiWOtiojhHVDmRqEIzFYFU80/SnxrCNLO6A
         099pW0qj8fDYxakeQ75Bnc1y+ujbIq93HbTRxDxXIfVXPtafoLtXrWqjlK+eAQctLXpA
         9Pd+6frSl7adNog0oW41j8JClgi+npxavSUhKzNMmLIsJTwP3Zy/ynbtA/TyRAcqYah1
         EiY5e0MR/Sn8UtRazutEhPJM8nfpytdkWG+MYLbVplMPbodvxrXZCxMRUxRITVSqqI3I
         1MWtaihPjmxYsIztzEk1E7yVaDLN1fK/RmMQAER+I2uvA3GD8W5R+BdApJgFKduw+95Y
         936w==
X-Gm-Message-State: AOJu0YyQyPzzGXU4+wKQpXPwb3fKf7kb74cs/8SU6l/UOPKmReqJdn4q
	vN/2FHqSPl4dABFeDaOf3A38dCpSFrzdItfhwWLsmr8cmUDe7+Z1gVBVYFlc5jPM6Q==
X-Gm-Gg: ASbGnctH895yqnhIkgK3oMipdh3xeVz8HCJS/Xm5zHnwC8iXxm8XLHd2xaO5kM0iOu9
	zPnE1EUuKY50O331Vc+N+6CnGeiE2YimZlOcdrixS0Nc+uAdoVtO0hv68wS2KjunJPgSAiOcIQv
	Dm64Yjdw7uDNH4k5JwyGxVFj0LZi3y6umMs+gQoeo1wPahFWvIquOySR8wk1MDIKVbsa60J6dJ/
	KQAmFh1XN/fq3wGkkbSP0z7F6WSjHu3C8O61D4LKWjrB+VbEq0u9cZba58zRGL9hcW9hhJzYrjz
	oHaGebLH/MAJcOzrelQgK1qmscxxROrBKUl/G7JTeMF2qTAS6oG0ZnRFz4zG7CCkoZr/hsdNG4v
	8kh1gb8W3Na4sLcR8pjMUnHGtQaRMj9VHN58e4oOXpw==
X-Google-Smtp-Source: AGHT+IFG2j1B5vIdNM+dOt6CECPa65tQ6vxHGK/kdmI/5t9vH+V5tW9j0VMhLNJ6m6uuevak0D2wTw==
X-Received: by 2002:a05:6512:128a:b0:549:887b:253f with SMTP id 2adb3069b0e04-553b6f50bdfmr2629332e87.51.1750087488959;
        Mon, 16 Jun 2025 08:24:48 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1dbcf5sm1564271e87.190.2025.06.16.08.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 08:24:48 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v4 0/5] media: uvcvideo: use vb2 ioctl and fop helpers
Date: Mon, 16 Jun 2025 15:24:37 +0000
Message-Id: <20250616-uvc-fop-v4-0-250286570ee7@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADU3UGgC/3XMyw7CIBCF4VdpWIsZoPTiyvcwLmgZWhaVBizRN
 H13aRMvMbo8k/n+mQT0FgM5ZDPxGG2w7pJGvstI26tLh9TqtAkHLkFyRqfYUuNG2pQ51gCl1pK
 R9D16NPa2lU7ntHsbrs7ft3Bk6/XZ4K9GZBSoaAyWCsAIpo9t791gp2HvfEfWTORvWsAH5YlKq
 BSvBSqs2A8q/lCRqKprZJUpZJHDF12W5QFl+q30FwEAAA==
X-Change-ID: 20250521-uvc-fop-b74e9007dd51
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, Hans Verkuil <hans@jjverkuil.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, Hans de Goede <hansg@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
X-Mailer: b4 0.14.2

This is a rebump of a 4 years old patch from Hans.
https://lore.kernel.org/linux-media/20210618122923.385938-21-ribalda@chromium.org/

It brings "new" helpers to the uvcdriver and removes tons of code.

The patch:
media: uvcvideo: Refactor uvc_queue_streamon
Is already in the uvc tree. It is here just for CI purposes, do not
review.

I have uploaded my working tree at:
https://gitlab.freedesktop.org/linux-media/users/ribalda/-/commits/b4/uvc-fop
which shows the differences from the original patch, this is mainly for
helping the review to people familiar with the previous patch.

The patch:
"media: uvcvideo: Use prio state from v4l2_device"
is just for RFC, the set can land without it.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v4:
- Improve commit messages
- Move prio changes to a different patch
- Add missing lock
- Remove redundant file->private_data = NULL;
- Link to v3: https://lore.kernel.org/r/20250602-uvc-fop-v3-0-a99e18f65640@chromium.org

Changes in v3:
- Refactor start/stop_streaming(): make meta and video versions
- Link to v2: https://lore.kernel.org/r/20250602-uvc-fop-v2-0-508a293eae81@chromium.org

Changes in v2, Thanks HansV:
- Fix typos
- Use start_streaming and stop_streaming for managing pm
- Link to v1: https://lore.kernel.org/r/20250522-uvc-fop-v1-0-3bfe7a00f31d@chromium.org

---
Hans Verkuil (1):
      media: uvcvideo: Use vb2 ioctl and fop helpers

Ricardo Ribalda (4):
      media: uvcvideo: Handle locks in uvc_queue_return_buffers
      media: uvcvideo: Split uvc_stop_streaming()
      media: uvcvideo: Remove stream->is_streaming field
      media: uvcvideo: Use prio state from v4l2_device

 drivers/media/usb/uvc/uvc_driver.c   |  39 ++---
 drivers/media/usb/uvc/uvc_metadata.c |   8 +-
 drivers/media/usb/uvc/uvc_queue.c    | 194 +++++------------------
 drivers/media/usb/uvc/uvc_v4l2.c     | 293 ++---------------------------------
 drivers/media/usb/uvc/uvcvideo.h     |  38 +----
 5 files changed, 68 insertions(+), 504 deletions(-)
---
base-commit: def55d9b22d294e47a2b4c9eb09a0e9faade7ae7
change-id: 20250521-uvc-fop-b74e9007dd51

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


