Return-Path: <linux-media+bounces-28284-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F129AA62D9A
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 14:40:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD0807A4C66
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 13:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F3E21FCCF1;
	Sat, 15 Mar 2025 13:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nCWur0p5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F084F1DC98B
	for <linux-media@vger.kernel.org>; Sat, 15 Mar 2025 13:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742046032; cv=none; b=on7BvpRYF6eOiIi5zd/Trq5/uzxv6up85fvWwdInwoAsWzhHJ6raBGRdrP48ycAn0RLKEDbKzjmQGnX76V2XKcRwks3/r1RmCKWVvT86XDBII1so4V5Lz/xALyy5nRDcMjDIC6nQPr0vRuZHmxRRbzJTvJCGaQQVO7sqbJHAy0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742046032; c=relaxed/simple;
	bh=fpKNAvZg5jUPFqZM/QDAnxBteRgwbtlKzxjpEVsIlHw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qX00ftsr1q2/nW6+hwhyJXuZ5YXN85ECTlu1ZGxR1wMrqOfS9P1zpdVEQP555VekHDr0veim5aVOBALx/lg6r7XGR6xUPKaBlSK0eXGLBCwhLCR0vX6l2bFzJ8s/wPazHi2r7NdAV+WMRCErfo1ywgbuPsWxnLuS/xI7Y3xgcCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nCWur0p5; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e4d50ed90aso3742548a12.0
        for <linux-media@vger.kernel.org>; Sat, 15 Mar 2025 06:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742046029; x=1742650829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hd0WuN5XAsIyWQxxxaF0swQwbR9Pp9u9K4byDce5TuQ=;
        b=nCWur0p5PQhYT+plK/9LiR/5sLvPTGbVrYdEgar3GBNjOpqa80N5VfSeDKUhlmy0OV
         Nrv7tOyojELSciIX/MtShMvGlZjPN5hKrFFohGrshUjj8/wb2SGcuN4VE2H6UQiqyVdj
         okajt1zwUlOHP6FmiAjO4Jklu7gCfOgPgdU2NoNdOfc15hVgbGW0sL1ffO+6hVSx2WVU
         UhVZGrmSEfYE5Q6Q3EJDmlaDy/HKymXj2bOuZ1s9hjeRdOU9qL+n3dI2W8SPs2w0ClVI
         PKBQX4GQ1QLdUG3TvaW96eGK1PWEGHnqJAVv+qZLUGn59p1n0AdPWrHFc55pNdCBpYe9
         znxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742046029; x=1742650829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hd0WuN5XAsIyWQxxxaF0swQwbR9Pp9u9K4byDce5TuQ=;
        b=f1hZoPiyYfMnH9uYTm04OaoSDdGf+iyPCS/RyW3QVF6LysWCbQ2oRTIQ8ocMHFc+ah
         T7+Nj7elrCV/nZNbsxx3rnSYc8iblPfFvYHY0E6ill0mOIz+J6KOT/9KkABkb4duEwwm
         OXamJyAB3qdS5VMT5xFLxaAFKVeeeQ7RWqWFd2iUVYD3zaG/7iMmnmnkETHc85S24V3k
         abRK6p2W8zNHF3HvSv30WepUtSLcTWrNq/z3Dmyryvab+3Dup/hHXaRSy1P9dDQ06UIv
         8iQlJ4ugGSvOajmhUMPpCAYHqEDqx5SiFazVlqDZ/v+wtP/UyFQdj34VYOc2HH+zRHYR
         GVSw==
X-Forwarded-Encrypted: i=1; AJvYcCUtnmjhYyMGbK+7pQf3jOtBZ7Mrj1qcZZOX0gSszPQeXqcir5TSa23pdcTl/A8ZF3dC4GH3yyx6/QAC6A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhctyue6WcBnkScGGj347ajJ9pex7S1T29IyqN9y9OuRJ/wz8Q
	vg6IUxe5T05ZOxIhB66uX7sScS091W9j0NRBLlBLJo9VoYSZNMlCAyXdeNSj1W4=
X-Gm-Gg: ASbGncsgPSZc4b+4B0KyazwVWxl2PubBDRR7W8DlI2RB3em2i99DsIO3CwDSm8yR8mQ
	IbFerdrTUYAstZc0oRtFjmALhSuF2T9noGyniqlqqeZzVetJhOraRj0H+fD5s6xvJX0E1iDAiEX
	UWSA79MQZU9ppLBSt7tpx3cDW36uv4Un/FHpbPnPx8wCOe+uUwuyE+piYDOgvszLW6fPGl5nidZ
	RxoqMx/TFu/AzP8g6DiybnI/9OtYIJYehj0vNmR/u68pHmlXhS1FaPSiSOVgTSMa40new0W8BFH
	3udevXTnYYHKW6TTSeympmYWoQKkb0JdRMlonDCEfBoL0udbeMPFAzjB2Mri66bhpafp/N7dm4U
	iG0SA1iMaT2hg1O49bnHak531vCO8HFQeDc7soeXkKrqI84uI46of3YvT6/s5bf75DMZOY3PGpx
	2FIQXYEnEE
X-Google-Smtp-Source: AGHT+IGr8+WCLRRQrYZ3j3xSccHyTV/LgJjQFyOdomILOfkYMUEllulVdmMbhaCVYPLOLnpsujqr+w==
X-Received: by 2002:aa7:d853:0:b0:5e7:b081:aa7c with SMTP id 4fb4d7f45d1cf-5e89fa29a8bmr6264682a12.12.1742046029173;
        Sat, 15 Mar 2025 06:40:29 -0700 (PDT)
Received: from localhost.localdomain (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e8169b009fsm3378824a12.34.2025.03.15.06.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 06:40:28 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: hdegoede@redhat.com
Cc: sakari.ailus@linux.intel.com,
	heimir.sverrisson@gmail.com,
	linux-media@vger.kernel.org,
	stanislaw.gruszka@linux.intel.com,
	ingvar@redpill-linpro.com,
	hao.yao@intel.com,
	mchehab@kernel.org,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 0/4] ov02c10: OF extensions and fixups
Date: Sat, 15 Mar 2025 13:40:05 +0000
Message-ID: <20250315134009.157132-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250314101125.9853-1-hdegoede@redhat.com>
References: <20250314101125.9853-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a quick pass through the ov02c10. v7 as posted on the list with
some of these changes on-top have been reported to me as working on a Dell
XPS 9345 - the Qualcomm X Elite version.

A rough wip of that is available here based on the v9 ov02c10:
https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/x1e80100-6.14-rc6-inspirion14-slim7x-camss?ref_type=heads

I'm still waiting to here back on testing for these v9 changes but in
general this series is what we would want to-do to reuse this code on the
Arm laptops.

In particular I think the first three patches could be merged and tested on
the x86 systems in parallel.

The last patch here can't be applied to the in-flight series as we need an
as yet unwritten yaml description but the first three I believe could be
merged in.

I'm happy to do the donkey work on the yaml and post the last patch with
the yaml later on.

I thought it might save time to get the necessary logic in on the first
pass for ov02c10 wrt OF system probe, power-rails and I think the power-on
sequence.

I had problems with power-on with ov08x40 which is another reason I thought
to publish these changes early.

Bryan O'Donoghue (4):
  media: i2c: ov02c10: Support full range of power rails
  media: i2c: ov02c10: Make reset gpio logic optional
  media: i2c: ov02c10: Implement power-on reset
  media: i2c: ov02c10: Add OF probe support

 drivers/media/i2c/ov02c10.c | 56 ++++++++++++++++++++++++-------------
 1 file changed, 36 insertions(+), 20 deletions(-)

-- 
2.48.1


