Return-Path: <linux-media+bounces-19825-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DAB9A34AC
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 07:54:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 499821F21486
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 05:54:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF7F0188722;
	Fri, 18 Oct 2024 05:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M3mLxixd"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EB317CA0B;
	Fri, 18 Oct 2024 05:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729230807; cv=none; b=rAX8q3x4gz3IsTE2W3UduHQCuHlRkavt7lCVel+iRslXUOtHw5s9l/ceQvGA1uwYgb0LKoNrnkoocR/ASL/cUv5qT8nxbmKme7BbHjw6dAPUjlchgbqT8YhApVIE2ewtGpwUI6mWmlCQNRxl6zhz+S0DPJyZcbge9vz5xNRSTjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729230807; c=relaxed/simple;
	bh=0mACDK++z3gYpIXaJs1fswOXuXPX4SSUmn45ykw9UT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=egQamZ7NLt7jmavOoZTz4Rm50479gHM2t044oCgh+NFMqYoW6azesL13JEIJZorusaUMkxQWfYwbGDh/F92vqXsqNbT0DlcRpUf9duDLS3q29+Ac38l0xjrd1t08Q474/ofxkAjvxP0E3JNNKViN1mvwOOyV3+8YatVDCd50SfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M3mLxixd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1F50C4CECF;
	Fri, 18 Oct 2024 05:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729230806;
	bh=0mACDK++z3gYpIXaJs1fswOXuXPX4SSUmn45ykw9UT4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M3mLxixdkL3zLYHqT+OhPE/LSE64zcD/p58v4ZhMT2MSNrYIhhISlDmfM1uR9vxy/
	 tBY/Ekr6JYlcNDV6sXIyLvLuOpYWPozDUEN2y78hrxfj0GSZh4U00Fs0QehiZq5FRn
	 k4V7p/ZF0r2CvFxJzO53jAxNxMx4A1gfiQ0emlUPB+CtQ/paiMz825krSi4a3xV0Y2
	 g1vUghpH/Egv0N7Xejl+gIxGMIrGoh4qNIljLw+2hMfaNapQw4vhpQRynblSawkw9g
	 QpiOiNvlKT8L7y6vCkCCu+I/YVtyDTQNBZaAbayHJR7aX3s0tD5XFjR+daa0cLcep5
	 pYc0nu3jGjjhw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1t1fvQ-00000005Mef-2Rt6;
	Fri, 18 Oct 2024 07:53:24 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v2 12/13] media: cec: extron-da-hd-4k-plus: don't use -1 as an error code
Date: Fri, 18 Oct 2024 07:53:14 +0200
Message-ID: <86725525d38f8c79897d646c55c3341559f62640.1729230718.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1729230718.git.mchehab+huawei@kernel.org>
References: <cover.1729230718.git.mchehab+huawei@kernel.org>
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
non-standard "-1" value. This hits a Coverity bug, as Coverity
assumes that positive values are underflow. While this is a
false positive, returning error codes as -1 is an issue.

So, instead, use -ENOENT to indicate that the tag was not found.

Fixes: 056f2821b631 ("media: cec: extron-da-hd-4k-plus: add the Extron DA HD 4K Plus CEC driver")
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


