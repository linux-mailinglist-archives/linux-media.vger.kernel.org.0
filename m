Return-Path: <linux-media+bounces-26407-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3EB9A3C84C
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 20:11:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8F71189BAF7
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 19:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9806321B196;
	Wed, 19 Feb 2025 19:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GPFPeFF0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7316021A457;
	Wed, 19 Feb 2025 19:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739992307; cv=none; b=sNkoO4rUaBL9leXk6WDlhQQSdvHHydnPAfmPFoVWBxU79Xxdd9LCwenebmBM/ohueND6hNjLZ/CEpTyRR7SvuoLKRdPO3PjXFcgnJjRwvbA5IoUppXZtTHQ15wNCA7aN+lg9Ypte/yuvfw6n7QzitPs7NRkUBUgPRanK09pEBik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739992307; c=relaxed/simple;
	bh=FokUvGzTSI9hIbd2H5u+cn8FMk0LbJzXrBt0aXU5UBk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=foSVKbsTYKwTVERWOole608KL5fVod+tDsh0OaG/ujF6rbp/CJvEMgp9+FzB60IbZHQozxyn8Z06hoxNOwfEzt2rS8IB1YexR1fjk+rPYSLA/4nztmjN9mErfr79WGSDnVrRlm4LpTH57M4FSZNZWyW/nDccfJjdnF3HKM2V6uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GPFPeFF0; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-abb79af88afso34925366b.1;
        Wed, 19 Feb 2025 11:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739992304; x=1740597104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Iw+WecHf0QEZQa5MiiCupXdrm6woCUMUehYbzlS6fgw=;
        b=GPFPeFF0kGdtwW4SJflSHBSoelzMxn5GK5GN5j+4O/kQ8nMToBFjkZIkWLcS4hg5no
         zCBsUe3HiWI7EPgqm6s7S9mjtkmE3pSd5SPFnoMnlOsX/Ta0thCfAT8FzopPlDFzdobU
         bBMk5PW9RWBtlegkWJ2m+wDfVM515EdsgK54zUVMQNgOz1IsuOTFKA9AsSaEldAUp9ah
         NJdoz/vHU4ObjjCJVjcLeFpjKbzFb/2JrOYOvfG+y+hoYWc+tWL3Gc0g3WwSnJqqoBM2
         VFyBLUWN5t2OwtZFVhXIeTkNndIpkUwC8Xo9Du/W+zyTxtwY0RAtrbhA+rG3xDABgpET
         81OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739992304; x=1740597104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iw+WecHf0QEZQa5MiiCupXdrm6woCUMUehYbzlS6fgw=;
        b=fraiCdKdNt2/YNnuelF2O1+izQRixL88eCLcYA/Cxq/2aIDOWXOkRxljJ5OHfNkOBp
         Bgh4PNC9FbRu0in3hZf5E/yY1WkTvSABMFy/l0YfF5MYd1gSWof1DbxdXwiBnNRDwBzD
         itgt9AeyiwYaq17PxLwp64a+t6U3ODOdZgIJTZTgD3C2w+gNK1l94M4wAKSi9n/jdQk+
         MoofNxpULLnE1Sbo5woIIpKwUhO+XdDomch/kqR7EOhBLZBAGBm/WoY+Urp5nyVa+FME
         aJb1JVupGHyxDNd+bhuchkA6elcPUMjtBY1qpm8uhKq0n1OqiUWs8gVNf4TMeAqTtIzi
         qG2g==
X-Forwarded-Encrypted: i=1; AJvYcCWLzX2crxea3tfjv9PI8xmdC/YsxNeGvDwavtS7EVjwRs+Ki73JIb7KyeGbAnfM23iFuXqUjjPjwP/s5uA=@vger.kernel.org, AJvYcCWiTxv1yemlIgT/YXz/q2AAkJECeP9cnxYSxaIx2U71Z/go7Z/U3zOFxOq8VW4YFneFyE/pLT6RuDiDmVY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0hOOccTy0zixJFbFXg/m7eC9kGGdVKoJr5EMYk41r0CoQjtOB
	f33GIUDC3PgF9OMbVEN61uULLVBYMcggBKDFyrPiA55jx++hB32u
X-Gm-Gg: ASbGncs4ASk7k6h9dV6notQ6XvwQRAEpSsHPnD7XfludWRjPvOhwQqtszED1MdLSaz/
	mMdTNj2BkieipDVZV912qPq8zBtplAMi+F1o7xNYjzVkQHG8gQKbmVGXzsF+6cI0XfHzLAk6VIr
	asp/3ELLMiX61Y3cfC9emRA9utYGkKw2h10WeggJ7o0qfmPGcoUjQGB6FfRu7DAIEPjRJaIP5xb
	hIC5STARPjpoWR16BLynyMAKUbQ7ySwTduqw4uIYZA3KhPZhlp5BnE9JXxI0E8a765hlZRoFQzf
	5Kh2egMeTt+iZFIb+kBGTDizKy/A
X-Google-Smtp-Source: AGHT+IExsfcOTzNXWdNX/MrDn+3r+Z1RDoKYU2juHnsdyNky2ySy69RRBxOFeMW+7W21mr37N0NBsw==
X-Received: by 2002:a17:907:26ce:b0:ab7:b878:e8bc with SMTP id a640c23a62f3a-abb70de288cmr2281215066b.38.1739992303417;
        Wed, 19 Feb 2025 11:11:43 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbe0d39f9csm127767866b.69.2025.02.19.11.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 11:11:42 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	=?UTF-8?q?Pawe=C5=82=20Anikiel?= <panikiel@google.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/3] media: add v4l2_subdev_state_xlate_streams()
Date: Wed, 19 Feb 2025 21:11:29 +0200
Message-ID: <20250219191136.215151-1-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, the v4l2_subdev_state_xlate_streams() function is used
to translate streams from one pad to another.
This function takes the entire subdev state as argument, but only makes
use of the routing.

Introduce a v4l2_subdev_routing_xlate_streams() function which can be
used without the entire subdev state, to avoid passing the entire state
around when not needed.

Convert all usages of v4l2_subdev_state_xlate_streams() to
v4l2_subdev_routing_xlate_streams().

Remove v4l2_subdev_state_xlate_streams().

Cosmin Tanislav (3):
  media: v4l: subdev: add v4l2_subdev_routing_xlate_streams()
  media: use v4l2_subdev_routing_xlate_streams()
  media: v4l: subdev: remove v4l2_subdev_state_xlate_streams()

 drivers/media/i2c/ds90ub913.c                 | 14 ++++++-----
 drivers/media/i2c/ds90ub953.c                 | 14 ++++++-----
 drivers/media/i2c/max96714.c                  | 16 ++++++-------
 drivers/media/i2c/max96717.c                  | 23 ++++++++++---------
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 14 ++++++-----
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c |  2 +-
 drivers/media/v4l2-core/v4l2-subdev.c         |  7 +++---
 include/media/v4l2-subdev.h                   |  8 +++----
 8 files changed, 52 insertions(+), 46 deletions(-)

-- 
2.48.1


