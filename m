Return-Path: <linux-media+bounces-54958-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNJtKIHirmmoJgIAu9opvQ
	(envelope-from <linux-media+bounces-54958-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 16:08:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD1B23B4C1
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 16:08:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D65B33089607
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2026 15:02:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 035563D75A8;
	Mon,  9 Mar 2026 15:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZexH5tXO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF6E3B8D65
	for <linux-media@vger.kernel.org>; Mon,  9 Mar 2026 15:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773068521; cv=none; b=AHiQO3Zt0NJy4s2nfSOzgbIuOP5WGafTAq940u/75W19DXBCfgBhrA9cSjj+Cofq6TXuFujCe6Whn+Fhot3VQTsfBidz8tDp2Mfx81bKnsP28IfvIl5c+sovz7lkgzlxkeTDGHEVxYDHCWJ1zklA74Z57Rtktox9FurIwwoXjWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773068521; c=relaxed/simple;
	bh=gztHX5oQ3fyBjxMmTbV5Rxprhn4C04hApGEvrDJ0n3A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aAUap2aPoTfbEpro6k6nAeIxg/JUW/tU/PSj9zv7yFwZNyjviULMxVR+kOfpuWbwWfQIcTsuaXlf0U6poffqR9uBpkI6NzuUpIdGrC7RFKUVGynQv7l4NVmwbcuB8hioOhwvzniSmIDjpWD/TwZHVsDhdcB3qhgRW4EwgLkckeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZexH5tXO; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3878de20527so147201751fa.3
        for <linux-media@vger.kernel.org>; Mon, 09 Mar 2026 08:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773068518; x=1773673318; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=55ZaSS6rivKHPgxpbt+2mikvVBcoH0ldDIdH6+NFR6A=;
        b=ZexH5tXO5u/zojZOU3RGCFPLpu88TYQJHQ8nk1Jio+46fMW3QYB1CYnDsZzd9oyRGY
         xaDQMBAiWR+7aP0Mg0DsaItvvypYhlAFWrAUF7pziE47vU/UYPyRURyyI4G667iOtWUc
         Z0b8gAjwMM/ikDnKIeL2VE5gldhQ9owO9bc4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773068518; x=1773673318;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=55ZaSS6rivKHPgxpbt+2mikvVBcoH0ldDIdH6+NFR6A=;
        b=oXiRfsruud57Y1reOLDlsEMbTT7FYsLMRTjd75tektXtE9Zudt+eGq4NapzacZh6Rj
         QSFjLd0k/W7rJbL6w178DGD/Soytc1e1I80TyFV0NsN7ZLu7lFKMToABt/nDsFKg2xVz
         HVJ+avjb6l1Is++I8cUeWxdFEino3wWqbF/HprGb+naOwptKueBK98ADoXLUfeX/STZD
         vY1ahtqU13TDUrFU5sh/cEAhmLq2ON8QvMOpnT2/a3363CmIwwvWdP+Lkb7783QlQkwo
         DmvVD9OHEuSQuhomKjLRwM3pjQXTTfb8vxzEPNcWfeXAOqggDcM9czBvZi+g+hsDeZi2
         xO0w==
X-Gm-Message-State: AOJu0YwQGWsq/a3iAookUQ+4A+XaakvP+BVuezRxqfocjS0kS2BJow5z
	eK0garEQDhygUayNjqj5aRCuY1qlDuvlIOuLDWhlJh93M7eQFnrAhuOtG6FviDmJ6g==
X-Gm-Gg: ATEYQzy3QWgaYS1ExuLFvW24a28PkfCw5kWGBv7vxCp6tdiq6NUeARj/fRXL9Xx4JZ1
	WRE1/DHWh+EqVgzVRb3ThzOOYoXVI1pvRd3u5E5WCxKtKpv24pYZ2jskfEGaokPwdnRxwMkyduG
	G6j6GOUHhaOtdy7W77joJrj+j7FLsuaIeXkbk0YB/wtbnV6FrGBDij5rLQTs9YD3PQk7PPEi++M
	3aFUPjIo9FAaS/Un2EozIL+WH7Pa/tXWWpg8uL5PUJIMKBYG3x4XDvz9xIbF1tzAgZUhi8VuZtc
	rKbaWvHelLU99+mn2j0D8tZ1qCXTB9/bXtYXv7dkEi8ZlAywXfVfSNTi7ai85e2ThZ7ODzyvRGi
	mynTMTvQL41kDvtxc/hL/na4ZeIEIeUPmdqfMjXrMMXqNdszlVjxvBXcMGsQNUme2t5m1d1vuMN
	mGI+RbzHGvykwk6XHe2UqNEnD3XLVdkqK8JP169v7YV1+TcpraxI0Lddf+O7iGPaHHc9/h6BSyo
	Q==
X-Received: by 2002:a05:6512:40ca:b0:59f:6923:1cbd with SMTP id 2adb3069b0e04-5a13cac11a2mr2777388e87.8.1773068518002;
        Mon, 09 Mar 2026 08:01:58 -0700 (PDT)
Received: from ribalda.c.googlers.com (27.69.88.34.bc.googleusercontent.com. [34.88.69.27])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d08cc0dsm2138003e87.80.2026.03.09.08.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 08:01:56 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/3] media: uvcvideo: Improvements for UVC metadata
Date: Mon, 09 Mar 2026 15:01:53 +0000
Message-Id: <20260309-uvc-metadata-dmabuf-v1-0-fc8b87bd29c5@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOHgrmkC/x3MPQqAMAxA4atIZgNVUaxXEYfYRM3gD60WQby7x
 fEb3nsgiFcJ0GUPeIkadN8SijwDt9A2CyonQ2nKxlTG4hUdrnIS00nIK43XhKNtq9qKuJYZUnl
 4mfT+r/3wvh8e8f3AZQAAAA==
X-Change-ID: 20260309-uvc-metadata-dmabuf-b98359eec8dd
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Yunke Cao <yunkec@google.com>, Ricardo Ribalda <ribalda@chromium.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: 3FD1B23B4C1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54958-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.939];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,chromium.org:dkim,chromium.org:email,chromium.org:mid]
X-Rspamd-Action: no action

This series introduces some improvements for UVC metadata:

- Allow bigger sizes of metadata.
- Refactor the code to avoid invalid pointer arithmetic.
- Add support for DMABUF

Cheers!

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (3):
      media: uvcvideo: Enable VB2_DMABUF for metadata stream
      media: uvcvideo: uvc_queue_to_stream(): Support meta queues
      media: uvcvideo: Allow userspace to increase the meta buffersize

 drivers/media/usb/uvc/uvc_isight.c   |  3 ++-
 drivers/media/usb/uvc/uvc_metadata.c |  9 +++++++--
 drivers/media/usb/uvc/uvc_queue.c    | 18 ++++++++----------
 drivers/media/usb/uvc/uvcvideo.h     |  7 +++++--
 4 files changed, 22 insertions(+), 15 deletions(-)
---
base-commit: a7da7fb57f2a787412da1a62292a17fa00fbfbdf
change-id: 20260309-uvc-metadata-dmabuf-b98359eec8dd

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


