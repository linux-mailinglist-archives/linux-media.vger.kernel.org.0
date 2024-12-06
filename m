Return-Path: <linux-media+bounces-22785-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 280059E68D9
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 09:30:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 881A416BA65
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 08:29:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E106B1E0DED;
	Fri,  6 Dec 2024 08:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JGk94H5w"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75E51FC7FE;
	Fri,  6 Dec 2024 08:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733473655; cv=none; b=aay3um7Au76sra4q3Th8dpzFliJuN4gIvKQJKKnalhIOa6AXTbHZ+T7acpfTrP/gJ+MFdCNMlbJHMEd/BXZ0VXND+R+qtu4gqySMyklyOdTSpFNRKEmOcsOYMDlk31ut9gJks9TblJEzCq9DxH6/2HAA82Ho+rU1HCJeZPkNrcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733473655; c=relaxed/simple;
	bh=RYU/Zn5ud6P9uUYX2gMHAgrS1tNcKPspcgZ5Fhzg/Ok=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SNZgG++j7d7Xu3+ajrinRjpenJcqV9WziD7mmhthVU+Tt3hRJf8zVQoYhSZSAm6ktkrgfxqyixmqFmedgWCYAwvzl118xUBmmpmspi1b0N5eAdoHV7Q4RtOCuvvOLRQ+vQv/DIJnYXYgoraApbKjaOjaGpp42n9qkoc8HzSSRUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JGk94H5w; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 229D59FC;
	Fri,  6 Dec 2024 09:26:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733473611;
	bh=RYU/Zn5ud6P9uUYX2gMHAgrS1tNcKPspcgZ5Fhzg/Ok=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JGk94H5w6kIl9NddrV0AQQtEchyVBxaBHLfVuSnpmjC/0aQ+QS+8Y33P15wCrDfeh
	 IL1eXB1CQqZ36/8v/ancOsWTfSn5XTdAE+pVwoOYyYcfsiwOXvzXTimR0CnAG/NCdY
	 NZK/B1FpnOs4IpGJDYgeFaOOdkgOsiKajBTs4ezI=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 06 Dec 2024 10:26:47 +0200
Subject: [PATCH v4 11/15] media: i2c: ds90ub960: Reduce sleep in
 ub960_rxport_wait_locks()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-ub9xx-fixes-v4-11-466786eec7cc@ideasonboard.com>
References: <20241206-ub9xx-fixes-v4-0-466786eec7cc@ideasonboard.com>
In-Reply-To: <20241206-ub9xx-fixes-v4-0-466786eec7cc@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1092;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=RYU/Zn5ud6P9uUYX2gMHAgrS1tNcKPspcgZ5Fhzg/Ok=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUrVfmO5H5Xl9ac3uO31GNs2TeFtKXqTK7YcjU
 gl8yJF85n6JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1K1XwAKCRD6PaqMvJYe
 9aCHD/4p53f0HG30DIypXKDRI3AfupjVXoKgss8qyvtTB16EdHGJlDcYubFPfIwWrS3LZbaP2sM
 GVW0vZ6OzTuZxVDVy7caksRutph13Dul53eWgTR6B0gHY/R+UFJfe8+yVL7dtauJdEDF9cSHcLr
 Dv7R3hnHSdXGzbW2nDXAoqUbsjQ0SuMk25ThsQLnqo6YGVihPx05C1iwlv3r3taoDTf8MSPP/id
 THjBm9wKowYoL8nn0j2SDP1+xgfGXMuR7mfv892ELWQp34K3JaJoung6zfKzk4vEaHTJoo2vW7b
 4e8tlefo2Nz+mNYNUKLEqxcmwwUy3+najtxWDCSiUZYX+RCXZ9q+FKjHp4lCQ65dFcRM7sVLdlC
 Q5y5F/xpYk7QinngcYAwc6OIaFZ4gRCgq7oPWv4PaOaXKYKMUOCfKNdlM06ChOov2OcVqI+Rrc7
 mp9quN61niCyz8X37+XObY6Xf1uV+wMcrKknZ/+nvtkCQiUqN0HDC3cBK2ADzbeXMDjT7PilubG
 M7s8rOts7tldMY38m36lL0IbKLksNTyFQNZ6JfLqnKLF3eadNw34fMtp+THK7G9G/f93ChX7WIP
 Yu13qYMUpK7CCP5HcCFkAGkZHo90KcpGkbwLjfDX7AXYgaInddlnBEMHP2Tey2LY6+vxtBXgyvw
 rfs+1afjoox2u8Q==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

We currently sleep for 50 ms at the end of each iteration in
ub960_rxport_wait_locks(). This feels a bit excessive, especially as we
always do at least two loops, so there's always at least one sleep, even
if we already have a stable lock.

Change the sleep to 10 ms.

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub960.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 51b4aead6ac6..8e8cda4475af 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -1576,7 +1576,12 @@ static int ub960_rxport_wait_locks(struct ub960_data *priv,
 		if (missing == 0)
 			break;
 
-		msleep(50);
+		/*
+		 * The sleep time of 10 ms was found by testing to give a lock
+		 * with a few iterations. It can be decreased if on some setups
+		 * the lock can be achieved much faster.
+		 */
+		fsleep(10 * USEC_PER_MSEC);
 	}
 
 	if (lock_mask)

-- 
2.43.0


