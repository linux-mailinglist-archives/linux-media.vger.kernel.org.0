Return-Path: <linux-media+bounces-31063-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D10D2A9C996
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 14:55:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46F919E2B31
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 12:54:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5570F2500DF;
	Fri, 25 Apr 2025 12:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IMzcy/zi"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65A32571B0;
	Fri, 25 Apr 2025 12:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745585609; cv=none; b=M5pGx0rFZ4c2dFn8acAGLsDd+lX3B3r4WVRoBNh7viHuOtOSQZkke6rx9Ce3Amy+1ssZFMuFm2IZkq6RMS7TRdF1Od+2Wc7JUqm1zWVo5NEofvYJ7ywYXHYT1WtMbCN4PJHzMkZ8bnflHbEe14qghSwULyRuwoFmCkCgfCduBGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745585609; c=relaxed/simple;
	bh=OiZXl16w7s7qORYOTa9IexXDSbX4Y5FjYoBCt1zwMQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FJXtjpHGCNFHMMJrfnJNkd4ZQLNm79AWV+Xxkcm1VWO58IrpSNiBbPiv2r4GITYDVsFm2AwW3fuQRxfgofW7I++I6i8AjIRIfYw6oOeSC7OStci/SzTtzr4+36LmbMhKlWuPoJaKi3bcFg91FJq4RLkxUvVBFiOLhH3zza74iLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IMzcy/zi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 316E5C4CEE4;
	Fri, 25 Apr 2025 12:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745585609;
	bh=OiZXl16w7s7qORYOTa9IexXDSbX4Y5FjYoBCt1zwMQQ=;
	h=From:To:Cc:Subject:Date:From;
	b=IMzcy/zigoWvgL5zgoR6anfXe6yIYd+FlW2EP/OMSEyKsDM3uRIQ9iAtoni0IzGIn
	 6WqY/ifPqsm/qE5yySLyLGj5cnL07rNm7N0A2Km1EhWzd0N8k9i/SGByNo0Heksy6t
	 My0cHB9Wn79rHKZpnbXQxVumbI4+C6hZnAOgyH5qBQolKaRl0uoF5v6lKfNAhrDbSM
	 HwbYdgEk+NQT+bwMi8ooT648kHaYXWjld49gq0GHb4QUttVwD7M96ZHVT7Y6HAONww
	 z+YhgMXSFE/Dgsio4DJwZ0VgbYJ0xbb9dl3QOFEoqCi7kNTAwXPDwu4UNDAoJ1vj+n
	 DvGOtUoTi0jcQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1u8IYc-000000007OU-11Qh;
	Fri, 25 Apr 2025 14:53:30 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 0/2] media: ov5675/ov8856: suppress probe deferral errors
Date: Fri, 25 Apr 2025 14:52:36 +0200
Message-ID: <20250425125238.28346-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Probe of the camera sensor on the Lenovo ThinkPad X13s is sometimes
deferred when its supplies are not yet ready and this is incorrectly
logged as an error:

	ov5675 24-0010: failed to get HW configuration: -517

This series suppress the bogus error in the ov5675 and ov8856 drivers.

Johan


Johan Hovold (2):
  media: ov5675: suppress probe deferral errors
  media: ov8856: suppress probe deferral errors

 drivers/media/i2c/ov5675.c | 5 +----
 drivers/media/i2c/ov8856.c | 9 +++------
 2 files changed, 4 insertions(+), 10 deletions(-)

-- 
2.49.0


