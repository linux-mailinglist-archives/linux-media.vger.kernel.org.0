Return-Path: <linux-media+bounces-21033-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDD99BFF73
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 08:56:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 551CB1F237AC
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 07:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02CE31991D2;
	Thu,  7 Nov 2024 07:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QYaqA83s"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80AE1D1E64
	for <linux-media@vger.kernel.org>; Thu,  7 Nov 2024 07:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730966191; cv=none; b=esQRxRK1my32Kms2wFR7QxE7YZtAbdBmdexISBNPrYT48Uje+rkfTrWTwCCVKDypG1l+dAQypntdorsjwUrtnOXmmNTNz/Nziau7OGbwgkGmiQioUsxz/Kll30hHU9jQ0bvoVCGajuSEi1VAS/qn3ANtEc0+SLL2Dt6BgF7vebQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730966191; c=relaxed/simple;
	bh=TLe9zBMUybhS3UKkr3WsKvIURof0XTfrEcSx0ACIcec=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=BdlRWF6vb4aK8joq0zsE0XrFPQmZelzoasVPfm1rjPo8WuodbyuQMakoZBeBModM3+HWAjIcTOq/urQSde/kKMIme1FZGW3+GZ00zVV4zNLgtp3HyYxbZaYsHUVJ/2cFevMclfGttB5oVwyDgzMu3JlElHOTvhzS2+qng6aXxRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QYaqA83s; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a9aa8895facso106088966b.2
        for <linux-media@vger.kernel.org>; Wed, 06 Nov 2024 23:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730966188; x=1731570988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fEYhM6GQsEvMrmkCfQQPdiDPJFA2n+5EJZDlcrumY80=;
        b=QYaqA83sWRFShYtgEuZ72Qk6YoVPc2/jqolxOrp9H3iiIBySB8b85ZdMZPme9gdf79
         gnhtILv467bkQRxrO0Ukt3x0+dKjsLjk8w1OEYOzbCtJbx8izAUu8/ceSzDCV0aCFAfx
         xo/0uW2RGUKRby97aMB3pJjmt+a3ffq9SxFWDNkZJVSp4smCq+ujKQ7cLlNCPDhv79CT
         3PCb7tT3+sW98nZQN3wjK2+KFqS7xIFwgKe3IOwlW8cMpkjceFWSfEkePZDraeDmobEA
         nCQkIT7WMSRFHzDhyqI3QsdCNSm1yCpE4kpNwbOhFpAVEyx+wzFxB2LRboeyKOR/SYbd
         HeOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730966188; x=1731570988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fEYhM6GQsEvMrmkCfQQPdiDPJFA2n+5EJZDlcrumY80=;
        b=ag67jMGAmFwzbo7dgmHvDTpM1ggNZDp40OAy6QEDfqlOcmfdTpJjzgxh9IaO67d0mM
         YPcAg6wHaE0XiB30LW+mxVPNVCeieKm9fb3S+dUlMlifh+ivtP+6VBk7meSv/iU4n4TR
         MM5yVER47kXuvvHIMZ+8p+FLQixqRAqrKcw7hxpLGCr/99t/DnQwkS8khsz3AZ5yJVyD
         lCkcjJrtNL9G2N109jHhFc1RU3ORZfHfaL6+jfjqBu5VyR3+uYK+E+hQfVBrHkd/z4tX
         EFjpbh3yFI9Qn2DyfJzeLmjr83SsLoBPm8jOHnJiFtgyKIcYr0xoijDyOxCbMn8/hvJS
         b6+Q==
X-Gm-Message-State: AOJu0YzGKXQBcSTiWkoCSodWtYDyjT2jXbM4U0mLQvqapE5BT0InBukp
	4JiQMytaxz0kQbmZFn+RB516fpHD0sFabb9ZJPFeo075ItY3Vo2Nnm2QEg==
X-Google-Smtp-Source: AGHT+IF0beQ10+jyIQl/P00IrNnbHnGagJhfkI89rBOhlinpez8cnQMgm+uCxwUFdQFvTayYcYCVlg==
X-Received: by 2002:a17:907:968e:b0:a9e:df65:3a81 with SMTP id a640c23a62f3a-a9edf653c1cmr125399666b.59.1730966187825;
        Wed, 06 Nov 2024 23:56:27 -0800 (PST)
Received: from aero-laptop.. (79-100-30-28.ip.btc-net.bg. [79.100.30.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0e0fabesm54427866b.174.2024.11.06.23.56.27
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 23:56:27 -0800 (PST)
From: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
To: linux-media@vger.kernel.org
Subject: [GIT PULL FOR v6.13] Venus updates
Date: Thu,  7 Nov 2024 09:56:21 +0200
Message-Id: <20241107075621.118606-1-stanimir.k.varbanov@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Hans, Mauro,

The pull request includes:
 - Add hierarchical h.264 encoder controls
 - Fixes for enc/dec close

Please, pull.

regards,
~Stan

The following changes since commit c7ccf3683ac9746b263b0502255f5ce47f64fe0a:

  media: ati_remote: don't push static constants on stack for %*ph (2024-10-29 16:37:23 +0100)

are available in the Git repository at:

  git://linuxtv.org/svarbanov/media_tree.git tags/tag-venus-for-v6.13

for you to fetch changes up to c258524129a928af9dfb45e7eba3d9f97a111b72:

  media: venus: factor out inst destruction routine (2024-11-07 09:35:22 +0200)

----------------------------------------------------------------
Venus updates for v6.13

----------------------------------------------------------------
Fritz Koenig (2):
      media: venus: Helper function for dynamically updating bitrate
      media: venus: Enable h.264 hierarchical coding

Sergey Senozhatsky (3):
      media: venus: fix enc/dec destruction order
      media: venus: sync with threaded IRQ during inst destruction
      media: venus: factor out inst destruction routine

 drivers/media/platform/qcom/venus/core.c       |  25 +++++
 drivers/media/platform/qcom/venus/core.h       |   6 ++
 drivers/media/platform/qcom/venus/vdec.c       |  13 +--
 drivers/media/platform/qcom/venus/vdec.h       |   1 -
 drivers/media/platform/qcom/venus/vdec_ctrls.c |   5 -
 drivers/media/platform/qcom/venus/venc.c       |  85 +++++++++-------
 drivers/media/platform/qcom/venus/venc.h       |   1 -
 drivers/media/platform/qcom/venus/venc_ctrls.c | 131 +++++++++++++++++++++----
 8 files changed, 195 insertions(+), 72 deletions(-)

