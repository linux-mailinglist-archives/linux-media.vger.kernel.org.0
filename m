Return-Path: <linux-media+bounces-20543-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C81B9B561C
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 23:56:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B2B11C224E6
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 22:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57CB920ADE2;
	Tue, 29 Oct 2024 22:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g1vIVfkP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBED11EE021;
	Tue, 29 Oct 2024 22:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730242598; cv=none; b=WtcIYdglSCrCOw5CADTjtYORtECzuRlEdacCDZjdq8o+U9kp6z6ME8/gyumHcGHxYvIhn8keXvTc2yhp0efb6GQ9E1msBM/Aww4A9jdfBeSR/15+ABoq9TwRuJiXWaAhuF11bADy2W0STMjd1WZz4RIZ09prMQt8SNE6w8437Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730242598; c=relaxed/simple;
	bh=bGGkw2scqhoN1b7J2U6LSncsGok/0dyDrcqHiVJCkO4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sJXNeyUBbkH2iAOUgpomSmjiLWqd8VQkcy3wRTRTgmrQEYOHjtJ2qDjvi73ZP/U6ocb42xfFxx+4hQWJmEUVYlx3sWq3LSKqd+DSyCXmC+FqhXBkTXkw82Xtnpy4fzmm+QfMWefEz+VEKfT4fqEXNetUyS2ym2Y7T9MK2uxvgOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g1vIVfkP; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43167ff0f91so58354925e9.1;
        Tue, 29 Oct 2024 15:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730242595; x=1730847395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MpVn9CCk7p/nBxiNwauWMLUJbSMf+dBaAsp0z8QnPp0=;
        b=g1vIVfkPohvz0xbmn64Uqqao1gtrz46ewoVctpX03HjSwXQHEav2zunlqMdKRorYDj
         zJInhU1mLVEtI6+/dVPv+TSAKGgip4CrcFw+I7YGDeDg/nPOX/c0IRnGsgWl2Phu+DaX
         ygUISm9C0rqYmudJgbCWPLN4e57ZTqc8MLPkR1ut7NnanYsw9HZ2TZA75utkQWkM8NlW
         nqmiU/dpM5l5nEy3hFnWOXGzYcklU8I4XITXTLxRT6wCnJOPZQpsISUWn8t4pTJZkFuw
         iNAfsxUgpo47xzMutgwMuw6XDQ/Qd+WyTeMlHVa/41COycdTwTHXaUI7OW1gCvvr2A3l
         f6bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730242595; x=1730847395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MpVn9CCk7p/nBxiNwauWMLUJbSMf+dBaAsp0z8QnPp0=;
        b=qunrZ+7+ebylGYkbtCHmEayqYfj0kHCtU7SAvIhuTEYkT0tVzH3gjDQF2NHXTFmPof
         eaSOyt3iVxGktEYppfij3y2YajkBbKx3Gw163/36EJ0nqdf7hvt7WA9pP9QY3vEqJU9l
         RFkSIRuXUI8H+bgXU7FJBmllLdJDFifNGKewhpnYI2RidkKtNwXXbJ1rEMPLCPspsi6d
         tjW0mKSGbiGZ5f77c3gw94dW8KpwO+QsD5/QucxgUit54AM67dPQ5JpCKN8kV30zuFxe
         LzJiMrjU52cfm7qRrx4dWMZ3WglzDjXActpA7t7s/3edlib0xcrV8aUsKhk5QpJh9hTN
         Yakg==
X-Forwarded-Encrypted: i=1; AJvYcCVpFIKm12WL3kcQGrVE0QfGZ7ch5w5GmQVG3Mg25qFoB80Ww7EGbTPuLMFjoagpEpuVj1jnuY44GsYwILs=@vger.kernel.org, AJvYcCX1pX16SY1NEiRkYvM3GEVLcTuSpkTtwaxhdPuNn+A3bo3CmBxzHsHOg6hALrVX4GWt3fkBVRBkaucWA2k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdHwIBoOyGIM/zLZX4Xir/LJbSO+R7AWh63o8v2Ykz1Uj+TOFt
	JYJxVaRpO6T4PjFS6h9E4sVHlotF+F38GUhn5lQ7VmunuLqkSrxx
X-Google-Smtp-Source: AGHT+IGTKDJcr0ckytnE14yZ3C4fMaYK2YKNmaOC4z9MjF1zU87TmfeBVvh+pS7vhT3ugoHMVZRGQw==
X-Received: by 2002:a05:600c:3b94:b0:42c:acb0:dda5 with SMTP id 5b1f17b1804b1-4319ac74274mr124223625e9.1.1730242594912;
        Tue, 29 Oct 2024 15:56:34 -0700 (PDT)
Received: from tom-desktop.station (net-188-217-53-167.cust.vodafonedsl.it. [188.217.53.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd9ca704sm2737165e9.41.2024.10.29.15.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 15:56:34 -0700 (PDT)
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: 
Cc: sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Martin Hecht <martin.hecht@avnet.eu>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Sebastian Reichel <sre@kernel.org>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Julien Massot <julien.massot@collabora.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Paul Elder <paul.elder@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] media: i2c: Drop HAS_EVENTS and event handlers
Date: Tue, 29 Oct 2024 23:56:29 +0100
Message-Id: <20241029225632.3019083-1-tomm.merciai@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi All,

After the introduction of [1] v4l2_subdev_init_finalize()
sets the HAS_EVENTS flag if a control handler is set, and
subdev_do_ioctl() uses v4l2_ctrl_subdev_subscribe_event()
and v4l2_event_subdev_unsubscribe() as defaults if the subdev
doesn't have .(un)subscribe.
Then Let's drop the HAS_EVENTS flag and event handlers.

As suggested by LPinchart imx415 imx415 sets the HAS_EVENTS
flags but not the event operations, all is already done from
[1] then we can drop the HAS_EVENTS.

base-commit: 0f9eef17a2638151c56663eb909fe72a7dd4c698

[1] https://git.linuxtv.org/sailus/media_tree.git/commit/?h=devel&id=0f9eef17a2638151c56663eb909fe72a7dd4c698

Tommaso Merciai (2):
  media: i2c: Drop HAS_EVENTS and event handlers
  media: i2c: imx415: Drop HAS_EVENTS flag

 drivers/media/i2c/alvium-csi2.c |  5 +----
 drivers/media/i2c/ds90ub953.c   |  5 +----
 drivers/media/i2c/ds90ub960.c   |  5 +----
 drivers/media/i2c/gc0308.c      |  4 ----
 drivers/media/i2c/gc05a2.c      | 10 +---------
 drivers/media/i2c/gc08a3.c      | 10 +---------
 drivers/media/i2c/gc2145.c      | 10 +---------
 drivers/media/i2c/imx219.c      | 10 +---------
 drivers/media/i2c/imx283.c      | 10 +---------
 drivers/media/i2c/imx290.c      | 10 +---------
 drivers/media/i2c/imx415.c      |  3 +--
 drivers/media/i2c/max96714.c    |  6 +-----
 drivers/media/i2c/max96717.c    |  6 +-----
 drivers/media/i2c/ov01a10.c     |  6 +-----
 drivers/media/i2c/ov64a40.c     | 10 +---------
 drivers/media/i2c/ov8858.c      |  9 +--------
 drivers/media/i2c/thp7312.c     |  5 +----
 17 files changed, 16 insertions(+), 108 deletions(-)

-- 
2.34.1


