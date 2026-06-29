Return-Path: <linux-media+bounces-66008-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sqL2AFGsQmoc/gkAu9opvQ
	(envelope-from <linux-media+bounces-66008-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 19:33:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 897AA6DDC34
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 19:33:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chromium.org header.s=google header.b=REYFV+to;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66008-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66008-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=chromium.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 235E83053FDC
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 17:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79BC9379982;
	Mon, 29 Jun 2026 17:31:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716BF349CE4
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 17:31:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782754315; cv=none; b=tXgKCybcTAUcZyRj6UQdV5fSN10kM1QHc0sYmJuitHDB0Yls3s6DInAYrM09ix6BOYj7OdEJGOi7TstUH/MUSr1xQFoBizDAquD6x5z1XrUEVCALkXbrQwhpkRxhaZQhsXqagfKFX11HUWxQ3u9aLXNujqAVX5j5j5qEItVvTTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782754315; c=relaxed/simple;
	bh=TL08TzO3D3qpCBAqoDnd/7ghYJ3m8ofj+GSg0J5faFg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IelmZN6NZd5ww0GntFoGzPv/ssDRO/9f8XwQsYDI4i6hvpiRiiHWcCNgMwgNaAhVE8jyK/a9Li7Vtp2fCkjHwGTLFZSi4Z0Q2sOL8RTG+mK+q+tCclow4FuU51tvhCrcjrUYydKl/P7DO4lduOAWGie7hrY4INldIabWxZxkEUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=REYFV+to; arc=none smtp.client-ip=209.85.167.46
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5aeb8c19017so1313517e87.0
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 10:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782754303; x=1783359103; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9EUpiZVAqkBSshI3JVd3gOCLUNBz11MuKzvqTDhb6VI=;
        b=REYFV+topJ/PKOhq5twnY20wYQ2qF5/AEsdB0rFySr8BDZM9NeQ/7dmCkHbKLQQI+X
         IrGvErpXKLdjqCuA3M83GxXYc4n8cPuwLPqbdbOMfOzrThCtrgDgVJPl/cOWLfPxnpdb
         NkNgkldJ78V6J9N2BgGDBokjh+I4l7Al//Xgs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782754303; x=1783359103;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9EUpiZVAqkBSshI3JVd3gOCLUNBz11MuKzvqTDhb6VI=;
        b=nzpkf73HjJ20BAvUXd8eDhushIU/Lktw6PGeOI6y8h5RgwCSFhVzaOJYFKPr8a0brm
         zfW4+dAwxsDFknFAMvXZ+IOk2cJXkahJVvYPqx4Ah+E0eP61joLdaOWDUqyir4FYPeHg
         wDkLwKMWqeRakmW4+gvxOOlYaNSY1zyLeTmdIJP+51lgZD4tdDqzEGhq9mTIO2ala2nT
         sTpGN3zz26TkbfzYIbb73tE6MaJeI1n13HoW56uXY96PLjmLSpD5vbVlm1tvCwhECd9Q
         Bb9M0YCAITKYKiTbLpd/8LXP4KO4/A+oD3Bv/eW9+GoAXttwpm1h/LzHWBULbVrZdoBH
         Ef2w==
X-Gm-Message-State: AOJu0YzfhzBX/a7arYfLqnAB6nvke6H78Ga6oZrOBkkNN+96cK9q40Ls
	9n7MmVXjP4lF6N9oKW9oU+lrDa3u+BDpZrxkA0VW2wBuJyo5NWq812fDQ0cmL3JjeQ==
X-Gm-Gg: AfdE7ckAlEI9b9/qlikkk3R87eDEiAlqU9FwkMnvAjUC6R/wugPvmgxYfkwQzh73dgW
	4aGGDjmANiENjeTEXGpychrQWn6Vsq11k0cX38EUAGGm9XtLUpjyLp4NJFtP0T5knqUgMIGwm4Z
	iVhUS/MRmZJR27JvpcBnPDFRS/l5zp4u80l2WviuyVjTZThtoI4y9y1whmAjhRy+UxPUOkA3m7v
	l40bG3a19k+WgcLutxmp4xh6Y9a+7HxoudMeqpO5EU/3Y9p4BKopan9EYF85jKlUZEE/lJ4uY1Q
	zUs0+6yMy15uFh0g+oGfmBoOwR2LjH+6I+jl5E/MxfVGq8z6dMdV6PtjS7YrJtx8QMKcFaSUW7s
	3zebXZ9U3REp5+xucS3BCpti0JUmDZlE6sfcEi4oz9Tyi1xyiiihME3m37QE9lxsuo7xxZRkSTJ
	yi/F+YSZP+0xIvA6/QHpzrklkjBZAdvR1YHhXnBXmSuPdIl4KE0IT+d75ulxy1WFSIu/Ge
X-Received: by 2002:a05:6512:3d19:b0:5aa:671d:9960 with SMTP id 2adb3069b0e04-5aebdb7d433mr66040e87.6.1782754302744;
        Mon, 29 Jun 2026 10:31:42 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aea237d2e7sm3973868e87.28.2026.06.29.10.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 10:31:41 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 0/2] media: uvcvideo: Fix race condition on metadata
 buffers
Date: Mon, 29 Jun 2026 17:31:39 +0000
Message-Id: <20260629-uvc-racemeta-v2-0-10e91d2afba0@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPurQmoC/3XMQQ7CIBCF4as0sxYDaGvqynuYLigdyiwoZmiJp
 uHuYvcu/5e8b4eETJjg3uzAmClRXGroUwPWm2VGQVNt0FK38qauYstWsLEYcDXCIWrs+nF0doJ
 6eTE6eh/cc6jtKa2RP4ee1W/9A2UllLh0cqqeak1vHtZzDLSFc+QZhlLKFyC8sbGrAAAA
X-Change-ID: 20250714-uvc-racemeta-fee2e69bbfcd
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-66008-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:hansg@kernel.org,m:mchehab@kernel.org,m:guennadi.liakhovetski@intel.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ribalda@chromium.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:dkim,chromium.org:email,chromium.org:mid,chromium.org:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 897AA6DDC34

This series fixes a race condition when calling streamoff only on the
metada queue while streaming.

The first patch fixes the race condition and the second patch replaces a
busy wait with a waitqueue. It is probably overkilled and this is why it
is a follow-up patch.

Feel free to apply the first patch, both, or squash them into one patch.

Regards!!

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v2:
- Use a new flag in_flight to avoid keeping the spinlock for long
  periods of time
- Link to v1: https://lore.kernel.org/r/20250714-uvc-racemeta-v1-1-360de2e15a9a@chromium.org

---
Ricardo Ribalda (2):
      media: uvcvideo: Fix race condition for meta buffer list
      media: uvcvideo: Use wait queue for metadata streamoff

 drivers/media/usb/uvc/uvc_queue.c | 11 +++++++++++
 drivers/media/usb/uvc/uvc_video.c | 32 +++++++++++++++++++++++++++++++-
 drivers/media/usb/uvc/uvcvideo.h  |  3 +++
 3 files changed, 45 insertions(+), 1 deletion(-)
---
base-commit: 253355887a1ab0ac8f33b356c7c1140eee554d18
change-id: 20250714-uvc-racemeta-fee2e69bbfcd

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


