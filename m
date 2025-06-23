Return-Path: <linux-media+bounces-35658-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB42AE4729
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 16:43:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A505D189CDB3
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 14:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F4109267711;
	Mon, 23 Jun 2025 14:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GyblOFKj"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8F22581
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 14:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750689811; cv=none; b=PB2Ieo4mmyHVN3JklSeNnfefcmBdOOevEFPZar6Bud4j8g6c6VZOmfCHJPc3P9OBupIO4HRVSZP5KsSQVS1ZaNnB3VD7nqmHyiDmwSgxGQ692mgyDdmzMGA+x8T8QtM5LPHmX2Yoel/qzaWSyl/6ZXTUDKmw29uTQufRpvoUKOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750689811; c=relaxed/simple;
	bh=6VJgP2+MpJUdGYjWwWDEA71OiXg3kMaOPwvHu/gA0EY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=U1sLO/SaNMgaqmSBlQ92zpSBQtTjengS91kFM/6MrpTUKtqrwMup+I6eMnFCQGg33w8E8yuajqOD3grJK08+C/f1f1eg2Ds78gjWDfW1E6GZOX4VNEuOmAXeBH91PlDBt2ceSwNWregi1qR3pWEh0nwCjbzrPOvbUQmEgYEUjmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GyblOFKj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 555646F3;
	Mon, 23 Jun 2025 16:43:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750689791;
	bh=6VJgP2+MpJUdGYjWwWDEA71OiXg3kMaOPwvHu/gA0EY=;
	h=From:Subject:Date:To:Cc:From;
	b=GyblOFKjkvXy+smHqBpGGi2tifXK3c9mBbmJQIs2dDI1JXggbfJWn69X4xwmB+GF8
	 AUpgOphI9a11UMPKOTMLWcr8ykj9kFVO/L7C4sT3CF6f0Nvqvc/V8X0xIzun+vJwJj
	 EAhWNMlb9Cc2jPDQXZzrMuifxBKem89tsio0dVlE=
From: Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v5 0/6] Extend RAW format support for rzg2l-cru driver
Date: Mon, 23 Jun 2025 15:43:17 +0100
Message-Id: <20250623-rzg2l-cru-v5-0-1663a8c6719a@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAVoWWgC/yXMQQ7CIBCF4as0s5am0AKJK+9huqCA7SQIZtDG2
 nB3sa4m/+Tl2yF7Qp/h3OxAfsWMKdaQpwbsYuLsGbraIDohOyV6Rp9ZBGbpxbQdeq25mToroO4
 f5G/4PqzrWHvB/Ey0HfQqf9+/Uh1eD5etVFoPinHmTGyzNSFsF3Te5BSnZMi1Nt1hLKV8AduR3
 B2nAAAA
X-Change-ID: 20250623-rzg2l-cru-7c43771ab0c2
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com, 
 prabhakar.mahadev-lad.rj@bp.renesas.com, jacopo.mondi@ideasonboard.com, 
 dan.scally@ideasonboard.com, Hans Verkuil <hverkuil@xs4all.nl>, 
 Daniel Scally <dan.scally+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1921;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=6VJgP2+MpJUdGYjWwWDEA71OiXg3kMaOPwvHu/gA0EY=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBoWWgNhJt9Cm4HmsxG83kRzh3aWvLYitnVEBHW7
 yNdCMZeMKCJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaFloDQAKCRDISVd6bEV1
 MnOVEACVgvMb8NP909LmR6ukwMmqgvgBKPUTts+tZ1wI/N/HyWaY15wCrDY4Lt+fWLcpNHKCRTy
 J1bXJ7r1NrzM1fMOV9TG3ilUsapcQT5nmAEOwaqEQaQbLApMGHjpkZVYzcc7HHQjZEmLLAxGaWX
 rj0jjZdVuLLD7nKkE+fTcH207hya15zlY82J3MIRKK0C8JUyr8OLhDzCdyIJuwzPewyuFRmXWsq
 PIUcpL5PLCRd2oEQBqe27H+wDsdlIzsHEQL8kzsJyOvqKRJZz9J6eLCdwesmcMXfhTO+2aNerPK
 T//Gwz+gTdvW5ruOfZzwlT23XfmMmQVG5pvTp5W9+ydT0A5Cpiiy1rpFn0YEfDXrg4Sp+yHBVnn
 W/cwPnVqHRTEYDvTzYtIHjiLJufLtZeS4Geyjj5tFnKb5QIqn/DgjMfM1Mf32hTlU2ybUo8oMjz
 5tFyYeve2JQkGo4Aw+vEZ2aA9e5yjPmCz9Jc6+PX9SlldpMK1HRWs28HQWZ1MPHSJQzgvi3hA/2
 zafzp4P2rTjnaWZjGjz0MpXTUZEsFRBEyz8y1L31HhPLDAI2BbupV7zJdlHy2O6gUsq1oVoZLIQ
 cg0/CPscf15VYiwJRYf/rnwQiAqwYF1ACmCP5VwIxh43nT2NIUYZqEUM/pA219b/LmTudm40OOu
 WcL98rAffDIsm+w==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

Hi All

This series adds new pixel formats representing the 64-bit packed format that's
used by the Camera Receiver Unit in RZ/G2L and V2H SoCs. Support for capturing
those formats is then added to the rzg2l-cru driver itself.

Thanks
Dan

v5: https://lore.kernel.org/r/20250506125015.567746-1-dan.scally@ideasonboard.com
v4: https://lore.kernel.org/linux-media/20250506125015.567746-1-dan.scally@ideasonboard.com/
v3: https://lore.kernel.org/linux-media/20241202145831.127297-1-dan.scally@ideasonboard.com/
v2: https://lore.kernel.org/all/20241112124614.646281-1-dan.scally@ideasonboard.com/T/
v1: https://lore.kernel.org/all/20240927232729.GR12322@pendragon.ideasonboard.com/T/

---
Daniel Scally (6):
      media: v4l2: Add Renesas Camera Receiver Unit pixel formats
      media: rzg2l-cru: Add vidioc_enum_framesizes()
      media: platform: rzg2l-cru: Use v4l2_get_link_freq()
      media: platform: rzg2l-cru: Use v4l2_fill_pixfmt()
      media: rzg2l-cru: Support multiple mbus codes per pixel format
      media: platform: rzg2l-cru: Add support for RAW10/12/14 data

 .../userspace-api/media/v4l/pixfmt-bayer.rst       |   1 +
 .../userspace-api/media/v4l/pixfmt-rawnn-cru.rst   | 143 +++++++++++++++++++++
 .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h   |  10 +-
 .../media/platform/renesas/rzg2l-cru/rzg2l-csi2.c  |  45 +++++--
 .../media/platform/renesas/rzg2l-cru/rzg2l-ip.c    | 108 +++++++++++++---
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c |  38 ++++--
 drivers/media/v4l2-core/v4l2-common.c              |   6 +
 drivers/media/v4l2-core/v4l2-ioctl.c               |   4 +
 include/uapi/linux/videodev2.h                     |   6 +
 9 files changed, 316 insertions(+), 45 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250623-rzg2l-cru-7c43771ab0c2

Best regards,
-- 
Daniel Scally <dan.scally@ideasonboard.com>


