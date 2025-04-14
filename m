Return-Path: <linux-media+bounces-30148-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7D4A87F76
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 13:43:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F2DA163030
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 11:43:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD5BF29C333;
	Mon, 14 Apr 2025 11:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Vt9CxhJj"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA31293B62;
	Mon, 14 Apr 2025 11:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744630993; cv=none; b=PyxDAYVBYDh9EwuOS5dwpevPgsv1myBmIXyiZLUvEFcPPWfetumT8MkegWg95TiCxl+K+z5Vo/SF25ZY8UZxroQeIyFqIHCz0sIqgYh6LMkGwoeH1TdJHTbs78HNkuDM0qZRWPslEmsWIDqySha2QxPvE/wFoEXIbsVMZXxQb/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744630993; c=relaxed/simple;
	bh=FYKvrynLsDaxZBstU34tOoBLrmrnzq8eiLT9NiQLpNM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KZFea2DrE+iX+QKRFKhvAjIKUuq8GeOYmVNQHydA6kmcJsGd2DJkkTTeXlZrjOlESv0Bq+3NF5T0B51wZ+ZoAapN+J6vJ2NhNfip/j3PbOtcE6UyXzBpKCuhyBUTRxM9FpDgYbP8EN0O9mIZqRWBE16hWIS1C4q8/Tc7H6gNNc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Vt9CxhJj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c31:2dc0:c767:bd08:cc70:b57a])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 840A6502;
	Mon, 14 Apr 2025 13:41:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744630868;
	bh=FYKvrynLsDaxZBstU34tOoBLrmrnzq8eiLT9NiQLpNM=;
	h=From:Subject:Date:To:Cc:From;
	b=Vt9CxhJjUp384eX0SE9lh7JywyHooJ6NoM8Bzui049UY6kiVMnaLaMcBI0JROIQz5
	 6Vqvd1o9FMNLFTkilpRtjDNcwm8/NJ3PvNgL0nCzXAtbZtJf8/WkPxeChKuVibOUGA
	 Ds1dpassjjLaDuS10yrOpwsh0NatFstXcxmT8pxs=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH v4 0/2] media: rockchip: rkisp1: Add support for WDR and
 AWB64
Date: Mon, 14 Apr 2025 17:12:11 +0530
Message-Id: <20250414-awb64-v4-0-bfaea506cbd0@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJP0/GcC/3XMQQ6CMBCF4auYrq3pDC0FV97DuGhhkC6kpjVVQ
 7i7hQRNjC7fZL5/ZJGCo8j2m5EFSi46P+QhtxvW9GY4E3dt3gwFSsBCcHO3peS6Ri1EXREoYvn
 3Gqhzj6VzPOXdu3jz4blkE8zX70ICDhy1FUSl6pSCg2vJRD9Yb0K7a/yFzaGEK1YC4I0xYwFWd
 1ZqkKX6g4sPRlQrLnjudFhbQAEkqx94mqYX/sIG7RsBAAA=
X-Change-ID: 20241230-awb64-79270098e15e
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Stefan Klug <stefan.klug@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2309;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=FYKvrynLsDaxZBstU34tOoBLrmrnzq8eiLT9NiQLpNM=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBn/PTHLnQUsCSzjRwBWU2Y1/b+qWlo0gSSQAD8e
 KjbIjPClf2JAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ/z0xwAKCRBD3pH5JJpx
 RfNdD/0X+Nb1A930CAE3wd2x3UK3vb76iVoM/SIoDZwcxuJ/JrNWLEWC7vbo/lzID8SYNAQON4Y
 lrGYzX+XbFvz/Z90oLM/y+6Lnw+TPkkQqhxpPNpHT7NWv9DvtfTOJ6hfqLdjLaci/MdXcl5Bl0j
 bpV154zUtIVBdKbsdre5JSLmDLbj5mc6vo+u//P6oNal6eiR4YcNWt2zdSesKxvI3pKMNu31847
 8ianIc/OnJt9jI5a1XzjWqxvmm5rGpKTKFUtmSNJKRmBiBJFe+btxWmpitvfYE7ovBHUTbd69EI
 2Tx694nKfUF5ou0Jk2WLMKRBsQijJUtp8aY4MpflZJhzZo7YDPn2zn8tnbyENtGIcpvLgFBbA/T
 VlvRZdSvrGhPOAo9CAPi4fHWtVnDGekIpyO25rH3KE2gXA61RKyiUzwk7xqA9kunGlyKSbUx4jg
 hmRTvNQBkiTocs9O2l9DZxY4QfeAtqaHXc3gaUd8SmFYsRDdYLFhuM9bXR2FuMnXaXIOogbZNKX
 cWLaPqy5vqKkqj6QXUpO0sC8dWpKF5P2wiVm7t7Mea6/gRYL3P+AhGCFijq9iUew2dqnQWs7jcY
 r/CEjE+ydcFhNAihHV6PFTGs7tomh4ItQSyxOH5j64++Zostud6Wixr2ZHPIGYAYf5Ox50Sz56C
 gtQZk7JRrR+ov6Q==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

Add support for Wide Dynamic Range and Auto White Balance 64 modules of
the ISP.

This series is in continuation of the v2 posted earlier that enabled
only AWB64. We add a new patch enabling WDR, and rebase the AWB64
patch on top of it, as WDR is a simpler module which is present across
different variants of the ISP.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v4:
- Rebase on v6.15-rc1
- Address Laurent's review comments on WDR patch
- Link to v3: https://lore.kernel.org/r/20250225-awb64-v3-0-af29b1201e48@ideasonboard.com

Changes in v3:
- Add a new patch that enables support for WDR module, and rebase AWB64
  support on top of it
- Document the fractional bits used for AWB64 configuration parameters
- Link to v2: https://lore.kernel.org/r/20250110-awb64-v2-1-01b7fb471465@ideasonboard.com

Changes in v2:
- Fix register offsets
- Drop the _v10 suffix from awb64 functions
- Combine the min and max for R, G, B components into a single value in
  the struct
- Move all the configuration except IRQ and module enable in the
  meas_config() routine, making sure the bool bits are cleared if
  userspace updates the struct
- Fix documentation and indent at various places
- Create a single function for getting both AWB and AWB64 stats for
  IMX8MP
- Rename accumulator fields to only specify RGB and not YUV, as AWB64
  block does not operate on YUV colorspace
- Link to v1: https://lore.kernel.org/r/20241230-awb64-v1-1-27b0ee65f551@ideasonboard.com

---
Jai Luthra (2):
      media: rockchip: rkisp1: Add support for Wide Dynamic Range
      media: rockchip: rkisp1: Add support for AWB64

 .../media/platform/rockchip/rkisp1/rkisp1-common.h |   2 +
 .../media/platform/rockchip/rkisp1/rkisp1-dev.c    |   3 +-
 .../media/platform/rockchip/rkisp1/rkisp1-params.c | 213 +++++++++++++++++++++
 .../media/platform/rockchip/rkisp1/rkisp1-regs.h   | 140 +++++++-------
 .../media/platform/rockchip/rkisp1/rkisp1-stats.c  |  40 ++++
 include/uapi/linux/rkisp1-config.h                 | 208 ++++++++++++++++++++
 6 files changed, 531 insertions(+), 75 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20241230-awb64-79270098e15e

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>


