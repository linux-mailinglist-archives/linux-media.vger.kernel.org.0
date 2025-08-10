Return-Path: <linux-media+bounces-39277-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3201B1F789
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 03:32:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A92E417D632
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 01:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C25B157487;
	Sun, 10 Aug 2025 01:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dCgctBCQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326671553AA
	for <linux-media@vger.kernel.org>; Sun, 10 Aug 2025 01:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754789490; cv=none; b=ra08zGiLVnbZo8BLWywtP/I7P8RjZaGE/2eMZcK3Wux/RA8C6vMklwSt8R/5qAeTlYFc+Uqj1y4QU+Uofl7+TsCxaMkF3gJ9iQptZHEQSMhPwK3jSgLUQk5cYVz5qgPHcHILKPf7noRSfpsTIwFW9xlRK63oEaxfxgPwPk4TTFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754789490; c=relaxed/simple;
	bh=FiOqbX0V5J9hfFv+2qc2GbNbSSyiVAC0U7MAuqaM+cc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HHFPr6093QBAYefdHbDtow1iBm3Vrq8gr2/NndPeE8qXAwAw5+WEcj1owtjwGdgAHEuCZGCvvXz+CB69qTHiqH5sc4Ri+oBARFTFZqwKFBM05PsUkr1NjMl114BQ59Izu/xqENTh00u9cWvZK/Rm0gmnq1MPQbV49fo5YUPIXuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dCgctBCQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id B735F1121;
	Sun, 10 Aug 2025 03:30:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789433;
	bh=FiOqbX0V5J9hfFv+2qc2GbNbSSyiVAC0U7MAuqaM+cc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dCgctBCQCVg1h+6DWqIb8wlKLK7tIRxAjDGONgmruaCBObffGub2aeim1oc+G1+zi
	 ndiIzW5BYR7fwpp+SjSZ2SK9rZtwJwDcK3l94YA0O7sbU4fpcOnfsR5k0CZG1GSpc1
	 +/2H2AD8OmN7Ak38GRQ5sBlgVQ2PHHZ1lLMraVz0=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Subject: [PATCH v3 04/76] media: usb: hdpvr: Store v4l2_fh pointer in file->private_data
Date: Sun, 10 Aug 2025 04:29:46 +0300
Message-ID: <20250810013100.29776-5-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Most V4L2 drivers store the v4l2_fh pointer in file->private_data. The
hdpvr driver instead stores the pointer to the driver-specific structure
that embeds the v4l2_fh. Switch to storing the v4l2_fh pointer itself to
standardize behaviour across drivers. This also prepares for future
refactoring that depends on v4l2_fh being stored in private_data.

No extensive driver refactoring is required, as file->private_data is
only used to check if a file handle is the owner of the device by
comparing pointer values. The private_data pointer is actually compared
to a struct v4l2_fh pointer, which happens to be the first field of the
hdpvr_fh structure.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/usb/hdpvr/hdpvr-video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/hdpvr/hdpvr-video.c b/drivers/media/usb/hdpvr/hdpvr-video.c
index fd7d2a9d0449..4c431bd9b503 100644
--- a/drivers/media/usb/hdpvr/hdpvr-video.c
+++ b/drivers/media/usb/hdpvr/hdpvr-video.c
@@ -381,7 +381,7 @@ static int hdpvr_open(struct file *file)
 	fh->legacy_mode = true;
 	v4l2_fh_init(&fh->fh, video_devdata(file));
 	v4l2_fh_add(&fh->fh);
-	file->private_data = fh;
+	file->private_data = &fh->fh;
 	return 0;
 }
 
-- 
Regards,

Laurent Pinchart


