Return-Path: <linux-media+bounces-35845-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2B7AE7736
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 08:36:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E26917E38C
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 06:36:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98ED21E22E9;
	Wed, 25 Jun 2025 06:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="J8ji6NHD"
X-Original-To: linux-media@vger.kernel.org
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1DB1CAA82
	for <linux-media@vger.kernel.org>; Wed, 25 Jun 2025 06:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750833411; cv=none; b=JHiVpMG5BzqY+Xzxniej4rkEVQGNTfGjyOFyWe3/ETPDiJdK1riOwon8waKZitpCrL51wKQy/PAtAThiUHdBpmJZnb24LCcFxuYz7WrXKyscH1ZVEXTpeKCohT3rrhgIxlE29ns7ZlvCHtLY4tEAzAQe5XGBkJr/LknWbDxOegg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750833411; c=relaxed/simple;
	bh=xOsLNWMQCVPZjzcIMDke09dvxQ06byhAnyysuK/BnWg=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=ppwE8wsy43zfqEC4l6nijLmu0+FQG4E7Cc30zQWKIZWO/h7ziwJrscKqW0dhoBUx9nkchTts3/5Jc7/KWzkCK+hoYp7F7Si9AOY11xg+zbru0ntucHDKTfnAA7pYDPV/0QZHaVqJYLXgpC3cnT7q351DyogNGi7thN3r93EhVmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=J8ji6NHD; arc=none smtp.client-ip=195.121.94.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
X-KPN-MessageId: 9dcde642-518e-11f0-a9bd-00505699b430
Received: from smtp.kpnmail.nl (unknown [10.31.155.8])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 9dcde642-518e-11f0-a9bd-00505699b430;
	Wed, 25 Jun 2025 08:35:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:subject:from:to:mime-version:date:message-id;
	bh=e+HdQo2yjqyO2oFdRlh/9MxB9kNuou1dglt8QcQsgTQ=;
	b=J8ji6NHDprZPUzkseFUxDlJkctF5iwcuQr1JYTRVA9ZtZbvfVcZSpsbpAQK8rHYOyQr8qhYWyDjQz
	 zs40XYA/+FsjpA2ff9Xr6Bexb+b5/ZsMgThSh+6AwnPgEkgSKYEqIbpA/M15yhxt5AcBsPukup4Bn/
	 LvXmyWvZCxDRsHYFw/k7ouMCBeDD2yZxQOBxf90aEEIvl1PINpCVr6Xg9qwtTTMfcid5ID1tglXTsO
	 r0F2c7VPQC3c0yzj1ujH1+q2tmnD7yy0F5vc45a4Brx6lhdzW6y+MMYkzGy4zV7v7HmWy0aMdxztAb
	 As+A8hYa0t7tu7OM5oS+nYAtIsi3c0A==
X-KPN-MID: 33|n0aVTCmja36xbfClEK0lX3M9lrkpjYNki8uifFqw2q2JtPmH/5LJUVmdaE4T4OI
 NpTAyjZW4HgmriNt06P3RAYZbiL0O0TNn4+ZPqKD8wHo=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|76rKMhJZs+PcJR3BxeCpMwgqI06QjWeLh9Y+0iceW6DajIAZBFRaAr4kz69zjw4
 0sEb2aiZzua41jrAd8Yutjg==
Received: from [192.168.2.10] (unknown [178.74.16.2])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 9aa87bf9-518e-11f0-981c-00505699d6e5;
	Wed, 25 Jun 2025 08:35:37 +0200 (CEST)
Message-ID: <0be70785-ce50-4e30-b0d1-d4adcdfd397e@xs4all.nl>
Date: Wed, 25 Jun 2025 08:35:36 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] media: i2c: adv7604/tc358743/tda1997x: HPD low for HZ / 7
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

When the EDID is updated, the hotplug detect signal must remain low for
100 ms minimum. Currently these three drivers use that exact minimum,
but some HDMI transmitters need the HPD to be low for a bit longer
before they detect that they need to read the EDID again.

Experience shows that HZ / 7 (= 143 ms) is a good value.

So change HZ / 10 to HZ / 7.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
---
 drivers/media/i2c/adv7604.c  | 4 ++--
 drivers/media/i2c/tc358743.c | 4 ++--
 drivers/media/i2c/tda1997x.c | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
index 453a9d38ccfe..8fe7c2f72883 100644
--- a/drivers/media/i2c/adv7604.c
+++ b/drivers/media/i2c/adv7604.c
@@ -2448,8 +2448,8 @@ static int adv76xx_set_edid(struct v4l2_subdev *sd, struct v4l2_edid *edid)
 	}
 	cec_s_phys_addr(state->cec_adap, parent_pa, false);

-	/* enable hotplug after 100 ms */
-	schedule_delayed_work(&state->delayed_work_enable_hotplug, HZ / 10);
+	/* enable hotplug after 143 ms */
+	schedule_delayed_work(&state->delayed_work_enable_hotplug, HZ / 7);
 	return 0;
 }

diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
index 37ebc760f73b..1cc7636e446d 100644
--- a/drivers/media/i2c/tc358743.c
+++ b/drivers/media/i2c/tc358743.c
@@ -437,9 +437,9 @@ static void tc358743_enable_edid(struct v4l2_subdev *sd)

 	v4l2_dbg(2, debug, sd, "%s:\n", __func__);

-	/* Enable hotplug after 100 ms. DDC access to EDID is also enabled when
+	/* Enable hotplug after 143 ms. DDC access to EDID is also enabled when
 	 * hotplug is enabled. See register DDC_CTL */
-	schedule_delayed_work(&state->delayed_work_enable_hotplug, HZ / 10);
+	schedule_delayed_work(&state->delayed_work_enable_hotplug, HZ / 7);

 	tc358743_enable_interrupts(sd, true);
 	tc358743_s_ctrl_detect_tx_5v(sd);
diff --git a/drivers/media/i2c/tda1997x.c b/drivers/media/i2c/tda1997x.c
index 959590afc80f..1087d2bddaf2 100644
--- a/drivers/media/i2c/tda1997x.c
+++ b/drivers/media/i2c/tda1997x.c
@@ -589,8 +589,8 @@ static void tda1997x_enable_edid(struct v4l2_subdev *sd)

 	v4l2_dbg(1, debug, sd, "%s\n", __func__);

-	/* Enable hotplug after 100ms */
-	schedule_delayed_work(&state->delayed_work_enable_hpd, HZ / 10);
+	/* Enable hotplug after 143ms */
+	schedule_delayed_work(&state->delayed_work_enable_hpd, HZ / 7);
 }

 /* -----------------------------------------------------------------------------
-- 
2.47.2


