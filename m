Return-Path: <linux-media+bounces-29987-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F181A84E5C
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 22:45:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B76264E0305
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 20:44:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B192293B4A;
	Thu, 10 Apr 2025 20:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="nQqA9+6C"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364B7290BC6;
	Thu, 10 Apr 2025 20:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744317844; cv=none; b=prAvaxipO+gCkaQw9E6IvoWoIejwsJHg9GruzCg5jzamF20RhvwZx3CQVYVOwztBAfBxRsJlDaIoVfSeBSL4EiqFJ5iMoURdRsdfa1p9CgyCBic5IAIwnvni0aXJVl6IrGBT5xwAkQfqH1dnm4N6LmgU149lIeYUy7ep4+TjuYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744317844; c=relaxed/simple;
	bh=7QCBH2k/wn+l3oxtyQ3t+DRWxBs9YW29P8OfVH5UDxc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iOu+iAU2kl+G7ZMdCi+qRSHhmCt4G+wu6LJOTrrugFvYF2HzeW4+1+RQGW+0ynBh55s/MiUNN1OBcnYJUsAjn0YPKATfPprj3szLjyUZIe1chFT5O9QDZISP2R+yI53x3fhd5lPg3M4npven3zCnPfAFUpmeA+IGUAa6hNt0tdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=nQqA9+6C; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744317840;
	bh=7QCBH2k/wn+l3oxtyQ3t+DRWxBs9YW29P8OfVH5UDxc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nQqA9+6CHVmNMVlo1SgIJ719eSRGCjxxNsaK4DA4osfGZpDRr4TJBkJdagsnvQlY0
	 wsSWdvKyCMW5G0WFulBkYC6NMTubexzW0VYWTnRDu0I1cNJ/EjURCbNIIfmRTgAGcq
	 +f9V3qyxhj5kPr0QeY9Lumer51zMGbqOXChcIuJ2qcbwbgjvaDuUO3ZAC+oGr32+/y
	 VsHRBniD9vqconVBczJL2YnoLxRcovStq4AJgVMsQDQIDLXIY4RYveD8VVKwgalXpf
	 WPFKjVwA9K+Ta0EWEdh0hcaKZJ0D/Z6SFbz6HsPVZLhtsXHhR+vyxWcH9glOI29gVs
	 r63MG4soig8pw==
Received: from [192.168.13.3] (unknown [IPv6:2606:6d00:11:e976::c73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2C2A517E0EB8;
	Thu, 10 Apr 2025 22:43:59 +0200 (CEST)
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Date: Thu, 10 Apr 2025 16:43:47 -0400
Subject: [PATCH 2/2] media: synopsys: hdmirx: Count dropped frames
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-rk3588-hdmirx-sequence-v1-2-aad3f216d351@collabora.com>
References: <20250410-rk3588-hdmirx-sequence-v1-0-aad3f216d351@collabora.com>
In-Reply-To: <20250410-rk3588-hdmirx-sequence-v1-0-aad3f216d351@collabora.com>
To: Shreeya Patel <shreeya.patel@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Dingxian Wen <shawn.wen@rock-chips.com>
Cc: linux-media@vger.kernel.org, kernel@collabora.com, 
 linux-kernel@vger.kernel.org, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: b4 0.14.2

The sequence number communicate the lost frames to userspace. For this
reason, it must be incremented even when a frame is skipped. This allows
userspace such as GStreamer to report the loss.

Fixes: 7b59b132ad439 ("media: platform: synopsys: Add support for HDMI input driver")
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
index f5b3f5010ede55bde28756da326a434cc9245492..7af6765532e33239f4260b29ea82b31494b66213 100644
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
@@ -1956,10 +1956,6 @@ static void dma_idle_int_handler(struct snps_hdmirx_dev *hdmirx_dev,
 					vb_done->field = V4L2_FIELD_NONE;
 
 				hdmirx_vb_done(stream, vb_done);
-				stream->sequence++;
-				if (stream->sequence == 30)
-					v4l2_dbg(1, debug, v4l2_dev,
-						 "rcv frames\n");
 			}
 
 			stream->curr_buf = NULL;
@@ -1971,6 +1967,10 @@ static void dma_idle_int_handler(struct snps_hdmirx_dev *hdmirx_dev,
 			v4l2_dbg(3, debug, v4l2_dev,
 				 "%s: next_buf NULL, skip vb_done\n", __func__);
 		}
+
+		stream->sequence++;
+		if (stream->sequence == 30)
+			v4l2_dbg(1, debug, v4l2_dev, "rcv frames\n");
 	}
 
 DMA_IDLE_OUT:

-- 
2.48.1


