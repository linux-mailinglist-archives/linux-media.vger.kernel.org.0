Return-Path: <linux-media+bounces-19741-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 620309A0728
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 12:24:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 947561C22763
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 10:24:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB1D3208D6F;
	Wed, 16 Oct 2024 10:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hgXpLv48"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558352071E7;
	Wed, 16 Oct 2024 10:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729074158; cv=none; b=o5jmXKCgKPo6aZP0erUos4AbChlVNt14hUTTPMXs0xi7TtScX4t4aCjM+tvgUp7h/l361/0lkb31CchzzgEELuOg3fuwYGgLl57Vo731dAnn84+tR0D0L2HD9y5spcki6O5y96yg+t8dRSKFVPE79AvrYQX22omHlhOBUfuAY2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729074158; c=relaxed/simple;
	bh=X/tpMzX5sWaZm7bI/IQfEVsIrHbC90ecUHkZSJsDhWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rCCXDVyF1mnd1f63BXazl30qzSCam7p4GYKtDSa9VNqzGOr4aNOVp/iKCVhvVaJItO+jLqmTNH5wQqjB/Cd2bLqA0KRGFppNWlb10sYD67YoQGpRzjAJwowXFBYYJBSQSFkjA/fhQJcYdQa3TfaL7fTeBQglC+kzGkfjGHN2S4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hgXpLv48; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DADBEC4CED3;
	Wed, 16 Oct 2024 10:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729074157;
	bh=X/tpMzX5sWaZm7bI/IQfEVsIrHbC90ecUHkZSJsDhWQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hgXpLv48hBKuLrlVyWNEhsjguV17uqYvM3igvsfgGt+rO0plqekNBuDW2aSoph1Oh
	 y4BbCXESQmGC/w5gsWBu9zTJBvCYy0xn8mUO3zm2WGLNYAxLsBOy8ZqEFID7Bgfmgn
	 D6trMvK58fZFPgDyDltkaXICSKdqS0bPRoB9kjXGRWbSKNdZ4cQpXgNSrJWz2aYiWm
	 Jmb2ZcOTXyTrMg/WMZi6YB1tFx1FiKbGIiFLLcb0nEoolsc19H4loIl3eUZRQYMESW
	 K7pqTjazOr7sTNJVcG+9BK0dk6z7g/am2YSeJgJA+vQyO3dBo3YnUciCxbt8Tbm3Jm
	 wSPbHuZtxR2Bg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1t11Ap-00000004YnB-2zm7;
	Wed, 16 Oct 2024 12:22:35 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 12/13] media: cec: extron-da-hd-4k-plus: don't use -1 as an error code
Date: Wed, 16 Oct 2024 12:22:28 +0200
Message-ID: <21a4b368b49aaa46e9d78cccd855bb11b49ab39c.1729074076.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1729074076.git.mchehab+huawei@kernel.org>
References: <cover.1729074076.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

The logic at get_edid_tag_location() returns either an offset
or an error condition. However, the error condition uses a
non-standard "-1" value.

Use instead -ENOENT to indicate that the tag was not found.

Fixes: 056f2821b631 ("media: cec: extron-da-hd-4k-plus: add the Extron DA HD 4K Plus CEC driver")
Cc: stable@vger.kernel.org
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
index a526464af88c..7d03a36df5cf 100644
--- a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
+++ b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
@@ -348,12 +348,12 @@ static int get_edid_tag_location(const u8 *edid, unsigned int size,
 
 	/* Return if not a CTA-861 extension block */
 	if (size < 256 || edid[0] != 0x02 || edid[1] != 0x03)
-		return -1;
+		return -ENOENT;
 
 	/* search tag */
 	d = edid[0x02] & 0x7f;
 	if (d <= 4)
-		return -1;
+		return -ENOENT;
 
 	i = 0x04;
 	end = 0x00 + d;
@@ -371,7 +371,7 @@ static int get_edid_tag_location(const u8 *edid, unsigned int size,
 			return offset + i;
 		i += len + 1;
 	} while (i < end);
-	return -1;
+	return -ENOENT;
 }
 
 static void extron_edid_crc(u8 *edid)
-- 
2.47.0


