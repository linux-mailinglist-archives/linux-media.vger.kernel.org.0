Return-Path: <linux-media+bounces-19746-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1955E9A072B
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 12:24:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE07F28B485
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 10:24:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1556208D75;
	Wed, 16 Oct 2024 10:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DrwtMAld"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665E22071F8;
	Wed, 16 Oct 2024 10:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729074158; cv=none; b=uN122EBEbuEr43Ep/KWQz1Me1UvD+gxjI6ZF/xWrON+dfUVIBcy0UWcS7wCWgWW6veGs9rNY6F5uxrENuigrTEQSC3SsbnX+C9siREgcvO6nyyvrCU2URqvxINzH8/JGJF9F2GjsbfxXtql/kjEyc33QPqUnKhsCFX4ZIl3K3rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729074158; c=relaxed/simple;
	bh=Cn5sdvVgySd2SkhlcB6D2dHU5pDMU4RvB8S/dtW3Ge4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RQZ0/UZp5IZaAJas8+b22k+wUNA1ZaI2po+6jBLPH5Wz0PKiM1niVNzwqhtGoG9MFBo/Xeegv0G9gPjCTxAIYVV/lVWyh9iVEMbedFBjnkuby1n6m8buDwI2A42zAk351LfP3OLaI+HJ3mI/cuKoZTyOUwWnohbPgrl0Q64iNHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DrwtMAld; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF8C5C4CED6;
	Wed, 16 Oct 2024 10:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729074157;
	bh=Cn5sdvVgySd2SkhlcB6D2dHU5pDMU4RvB8S/dtW3Ge4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DrwtMAldEiwsCGnw5o6X4y3LRrz9siEXi3jAEQ77C2u/+7C7L8wBEM3jNqgIim1yk
	 c66U+yFzarA3Ze/f09jhRdPRxXAT0K6zS48SlTOEnDq9YckYxmjuZlWwky+9pXN6KK
	 dpaDY2tgHrehE92gVxC2YsMItccNU/ClIfSll003XuFNY6d0jJL7BKlXvAii/kPH9c
	 XXE6wdDGfnR0S8lSPc9NP8r9+E93hprLiR/9HyWaQCQZM1md3SEonA6Up5U58XtqCg
	 XlnLiwT1q5XvZxytaxhXyt68gEdKgYqswOpct76kHvesoX9xucyYshqu6wefwtLpaE
	 SBjkhJJ07ng3g==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1t11Ap-00000004YnF-36Qm;
	Wed, 16 Oct 2024 12:22:35 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 13/13] media: pulse8-cec: fix data timestamp at pulse8_setup()
Date: Wed, 16 Oct 2024 12:22:29 +0200
Message-ID: <8d5dfc87d297a92d5ccc750c5c002bbc4226d3ad.1729074076.git.mchehab+huawei@kernel.org>
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

There is a hidden overflow condition there. As date is signed
and u8 is unsigned, doing:

	date = (data[0] << 24)

With a value bigger than 07f will make all upper bits of date
0xffffffff. This can be demonstrated with this small code:

<code>

typedef int64_t time64_t;
typedef uint8_t u8;

int main(void)
{
	u8 data[] = { 0xde ,0xad , 0xbe, 0xef };
	time64_t date;

	date = (data[0] << 24) | (data[1] << 16) | (data[2] << 8) | data[3];
	printf("Invalid data = 0x%08lx\n", date);

	date = ((unsigned)data[0] << 24) | (data[1] << 16) | (data[2] << 8) | data[3];
	printf("Expected data = 0x%08lx\n", date);

	return 0;
}
</code>

Fix it by converting the upper bit calculation to unsigned.

Fixes: cea28e7a55e7 ("media: pulse8-cec: reorganize function order")
Cc: stable@vger.kernel.org
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/cec/usb/pulse8/pulse8-cec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/cec/usb/pulse8/pulse8-cec.c b/drivers/media/cec/usb/pulse8/pulse8-cec.c
index ba67587bd43e..171366fe3544 100644
--- a/drivers/media/cec/usb/pulse8/pulse8-cec.c
+++ b/drivers/media/cec/usb/pulse8/pulse8-cec.c
@@ -685,7 +685,7 @@ static int pulse8_setup(struct pulse8 *pulse8, struct serio *serio,
 	err = pulse8_send_and_wait(pulse8, cmd, 1, cmd[0], 4);
 	if (err)
 		return err;
-	date = (data[0] << 24) | (data[1] << 16) | (data[2] << 8) | data[3];
+	date = ((unsigned)data[0] << 24) | (data[1] << 16) | (data[2] << 8) | data[3];
 	dev_info(pulse8->dev, "Firmware build date %ptT\n", &date);
 
 	dev_dbg(pulse8->dev, "Persistent config:\n");
-- 
2.47.0


