Return-Path: <linux-media+bounces-40145-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FF6B2A1D6
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 14:41:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 151767AD4BE
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 12:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E50DC26F286;
	Mon, 18 Aug 2025 12:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wIFuNi5W"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99E23218D5;
	Mon, 18 Aug 2025 12:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755520834; cv=none; b=Nfiu78ZlcnVh1L5dUeOMRfEZpe6iLxcTzUDfSlkMVOwP4vRVzIl9eb1NLP9ULCesRV/Q6qQmtpoeBciydw923MmWG3kxJ2YUiFnEsF9vAm9BlLB2hkQPnb/dY7IdmPOjaw2jUTwlhQwO1Mwhvi2XD8joeO1GXe6Gi5vMrxwhWAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755520834; c=relaxed/simple;
	bh=nN45isTJxzIZjkB1+OZX6kGfR+BlhzKzlg/3pRIMJII=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rElSPRDWHj3YVrRCiWogIs/Baud7E5st3equx0L29EZzsdlTOYev4UFofTRUx7sGuTeYNPLtWMNxXI/q30qYqgU4bBLFEEvm6K0OTVRHLQg+ufgWhSDBKl8G7IuqDltLzl1FXZhfBpOpWu7t5yHkV10ZOSJEHx7TYyfLagYywJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wIFuNi5W; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-51-68.net.vodafone.it [5.90.51.68])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 22CBE1249;
	Mon, 18 Aug 2025 14:39:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755520773;
	bh=nN45isTJxzIZjkB1+OZX6kGfR+BlhzKzlg/3pRIMJII=;
	h=From:Subject:Date:To:Cc:From;
	b=wIFuNi5WyyIRrzIgZS/5608epmrF476Ai1FUFkMplS4yI4/xPvIJ3+87yKrJqnGMW
	 jkFurnn61YXEuAycTn2cb8XYggzLGGqJHx3ryxDylnd1UdfR6KogDIH9aKx60BOsAC
	 jPizyHcMtzTuQNfQ+VHIuGIegDPCSCQ5JEwKFa20=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH 0/2] media: pci: Fix invalid access to file *
Date: Mon, 18 Aug 2025 14:40:10 +0200
Message-Id: <20250818-cx18-v4l2-fh-v1-0-6fe153760bce@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACofo2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDC0ML3eQKIFFmkmOkm5aha56amGhmaGmZlpKSqgTUUlCUmpZZATYuOra
 2FgDJPez5XgAAAA==
X-Change-ID: 20250818-cx18-v4l2-fh-7eaa6199fdde
To: Andy Walls <awalls@md.metrocast.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, stable@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1310;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=nN45isTJxzIZjkB1+OZX6kGfR+BlhzKzlg/3pRIMJII=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoox88GS45UOSxNu+V7EOzbuNiW12eL3m4KANfe
 V1QE3qS7Q+JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaKMfPAAKCRByNAaPFqFW
 PLd6D/9685yz1B00Cmnfa3Gq632TvoUCPp6hfrF+3d5hSkf947KfsqYOEZAxm3cVE672XzObxT+
 uSeHHZXamqBOFUwgv/xB6TtrRH2s4HvXCZ1wCsusGD2mnz0QHJxbscYQ4ZyIaQfaAxDuioS2GmH
 48TOD5UA2qrt39RXrotN1AanZHATkXx40r9NMErE8cSp/AxISi3ZEjmPjQv6DEuDuduSqbif/uC
 NkbvVnZYwIPd6b+NutakcdRAZv87n9cK+Yg5lAbhMATeTJZQb0nqPDqaWWQ/YRsGBqpQ6IO8oi2
 e0+xZPDsL4npulToD+Xmda2Shynvbmie/HPVab9eZPJ9GDxRRfiN9Pe0lmDZNwyh+5KY5H99UUX
 Nj3Gz4q13rB/uLSkB9I5DB9fAOHcW6c6sttJrVMcpUnk5cbz/GsyKDD4OWsjZqrAvZ3j54hGBQP
 4x94PZTupSBTmWdva/XNP4lbuwXBDs8YFmDJuxy9QPLnMX9OS2vHKrEXyQQNGcgi+V7XPBNDU9H
 5kC5jZKqzeaglFeLV3/CxMKKR9CuyjFTvoakCKzkRC5qOM5wQCI+9c1/diuDHoFIe8H/Rzkhe3R
 CMaU/QxATbLqNtG1hsu+MbHiclKb4V+vIajtU8FhsCt3fqFcqE3zZ14R4NKKTV5WPdj1/dduzu4
 NWcBoWygCpNjkPw==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Since commits
7b9eb53e8591 ("media: cx18: Access v4l2_fh from file")
9ba9d11544f9 ("media: ivtv: Access v4l2_fh from file")

All the ioctl handlers access their private data structures
from file *

The ivtv and cx18 drivers call the ioctl handlers from their
DVB layer without a valid file *, causing invalid memory access.

The issue has been reported by smatch in
"[bug report] media: cx18: Access v4l2_fh from file"

Fix this by providing wrappers for the ioctl handlers to be
used by the DVB layer that do not require a valid file *.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
Jacopo Mondi (2):
      media: cx18: Fix invalid access to file *
      media: ivtv: Fix invalid access to file *

 drivers/media/pci/cx18/cx18-driver.c |  6 +++---
 drivers/media/pci/cx18/cx18-ioctl.c  | 26 ++++++++++++++++++++------
 drivers/media/pci/cx18/cx18-ioctl.h  |  8 +++++---
 drivers/media/pci/ivtv/ivtv-driver.c |  4 ++--
 drivers/media/pci/ivtv/ivtv-ioctl.c  | 22 +++++++++++++++++-----
 drivers/media/pci/ivtv/ivtv-ioctl.h  |  6 ++++--
 6 files changed, 51 insertions(+), 21 deletions(-)
---
base-commit: a75b8d198c55e9eb5feb6f6e155496305caba2dc
change-id: 20250818-cx18-v4l2-fh-7eaa6199fdde

Best regards,
-- 
Jacopo Mondi <jacopo.mondi@ideasonboard.com>


