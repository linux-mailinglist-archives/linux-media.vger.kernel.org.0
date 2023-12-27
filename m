Return-Path: <linux-media+bounces-3033-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 860AC81F101
	for <lists+linux-media@lfdr.de>; Wed, 27 Dec 2023 18:40:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B54F281B14
	for <lists+linux-media@lfdr.de>; Wed, 27 Dec 2023 17:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E90BB4653C;
	Wed, 27 Dec 2023 17:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aePgUTaU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA9946522
	for <linux-media@vger.kernel.org>; Wed, 27 Dec 2023 17:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-5bdb0be3591so4174211a12.2
        for <linux-media@vger.kernel.org>; Wed, 27 Dec 2023 09:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703698821; x=1704303621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aICOkkCHGNPQkQGVFyZfBHeeGOMAQbdF3pXGNaUoSUU=;
        b=aePgUTaUerRaiLQ8mDeYwDgn5627xyef/6E0y2RLYzblVS3Ap5fMkAwOachK7W/rLw
         16FFwE2Uo5vGtiwJTVvxLTFFPKhgKqW/aoZwoaJz2vdjlqgEWs/snpWtL+DLE2I+xgou
         gn2sibY/uEt8TLi9eqqM3NQoBjCaT026nmXJ19c4+R4OyVaEzIhyw9zM9nN2frz5L20Z
         GjpFLuLPzBB+K+OS29MhxsZPaonMvnS+Y/mS1qPr+SSd1320mlV8IFuf8ahuoS4DjkgP
         6Tej0rx4IkS7lbeMD4wXB9MOKvAqJtF0ZDICjCVVmIcJulw6gOwfyCqoXYY5M3oDJ75X
         0m/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703698821; x=1704303621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aICOkkCHGNPQkQGVFyZfBHeeGOMAQbdF3pXGNaUoSUU=;
        b=fltrjQM4q9Te3G2KshgGdn4Vq47osbPoJgaNOevxyfM02CncpFj7U7ibxCPVieW+zi
         8KMvY3t0hC89pJv69iBC/Rv0o0shGirScETfgjMH/uEWraNitvq0rEkoz2Y8mxVAskMv
         4amFYJa3qHAVV+m536ChDxe6YZdPBm//PHatrsmFQcgQBJX+vzQkVIHxb93/S9dZPclI
         YahQcFvpAYzgQ55V76Ilombdg7kmrkG3cKIXExzPDzj5jYJLJWPbVa0mgoLNTT5hv8NV
         iNJhG1fuh11cYe2Goz0urGT5UMKvQ4yOpGYW2Jjd1kd9AzumLZyLbKoeAT0p/qVNlQSs
         jhUg==
X-Gm-Message-State: AOJu0Yx+gD8Pz/pseVkutrEnHoFMn8nP5/+UbAekgSK0i0l6qAj6XPQH
	dIErkclUG83L+HOSJ+MNkxdqjpCpHsfbZCZLN5L2JA==
X-Google-Smtp-Source: AGHT+IE6iIJQBzPABV2cyYEQs/jOBGsJ39Ar/sHlptyKt2nwnr2ZHJkRH9I7kuSy3D3KFB7d9LpuUw==
X-Received: by 2002:a17:90a:8911:b0:28c:8dc0:7eda with SMTP id u17-20020a17090a891100b0028c8dc07edamr1072224pjn.91.1703698821022;
        Wed, 27 Dec 2023 09:40:21 -0800 (PST)
Received: from localhost.localdomain ([2408:8207:2540:8c00:3708:559:ea20:9883])
        by smtp.gmail.com with ESMTPSA id qb4-20020a17090b280400b0028aecd6b29fsm17240262pjb.3.2023.12.27.09.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 09:40:20 -0800 (PST)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Cc: liujianfeng1994@gmail.com
Subject: [PATCH 0/3] Add hantro g1 video decoder support for RK3588
Date: Thu, 28 Dec 2023 01:39:08 +0800
Message-Id: <20231227173911.3295410-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RK3588 has Hantro G1 video decoder capable to decode MPEG2/H.264/VP8
video formats just like rockchip's former socs like rk3399 and rk356x.

Tested with FFmpeg v4l2_request code taken from [1]
with MPEG2, H.264 and VP8 samples.

[1] https://github.com/LibreELEC/LibreELEC.tv/blob/master/packages/multimedia/ffmpeg/patches/v4l2-request/ffmpeg-001-v4l2-request.patch

Jianfeng Liu (3):
  media: verisilicon: Add support for Hantro G1 on RK3588
  arm64: dts: rockchip: Add Hantro G1 VPU support for RK3588
  dt-bindings: media: rockchip-vpu: Add RK3588 compatible

 .../bindings/media/rockchip-vpu.yaml          |  1 +
 arch/arm64/boot/dts/rockchip/rk3588s.dtsi     | 20 +++++++++++++++++++
 .../media/platform/verisilicon/hantro_drv.c   |  1 +
 .../media/platform/verisilicon/hantro_hw.h    |  1 +
 .../platform/verisilicon/rockchip_vpu_hw.c    | 14 +++++++++++++
 5 files changed, 37 insertions(+)

--
2.34.1


