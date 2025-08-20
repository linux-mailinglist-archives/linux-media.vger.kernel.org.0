Return-Path: <linux-media+bounces-40425-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F73DB2DE98
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 16:03:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 451461BA5B9D
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 14:01:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 190C425CC63;
	Wed, 20 Aug 2025 14:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aSqcPeGQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBA121ABC1
	for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 14:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755698448; cv=none; b=pfRjjtgPtbFw1+1m2ZE7eHo+POQAHOKqLm9NYekswzFpHqG9dWwFw6t36kxvNB3waYYcKpLolVUG2BBdiuIiopEs+4enGRCJjKs2Qn0Zb6mNf1GjVMugoFOOuDZoSRErHqg89/Lp3+OYM8rzXNkGQlNvmbmgpaypDvOQ1H/1Uw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755698448; c=relaxed/simple;
	bh=xJcliNsP6dM4G2Wuc2NsrfITKFoYg2l79GgUux91mbA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ba9vtKQCvMTGqCn+UMxn9YO7gw3mJoVGCz+2kX8VWzcUNtvHQolYMV8IRHyIxrwJACs6Rhmex4LTXoN89gbsRz+vvKNMJAXiiXJcOMuXkRl7nYBnIndNARJvaseht65sNs+O7JF5R+ttW3IbIIgSlcL4Hl+7NAaAi5FTr6cMmUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=aSqcPeGQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id C199A6AF;
	Wed, 20 Aug 2025 15:59:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755698386;
	bh=xJcliNsP6dM4G2Wuc2NsrfITKFoYg2l79GgUux91mbA=;
	h=From:To:Cc:Subject:Date:From;
	b=aSqcPeGQyJ4ya/5phn+hherP7VbyGf9kQfAFnGYDk3ahxl9kxnH6nC9vKRNeuYVEF
	 DcdgWrYFRC+no2uHD0kn5H64jqcJkixhi0UPuEXRUKK9J9uOjhXLS8X/E/R6abcRJV
	 uBmCBGqjH0+cdeYFGL7ASTLdTQi6Y4lmTpCaMaS0=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Maud Spierings <maudspierings@gocontroll.com>,
	=?UTF-8?q?Martin=20Kepplinger-Novakovi=C4=87?= <martink@posteo.de>
Subject: [PATCH 0/2] media: mc: Fix crash when starting pipelines
Date: Wed, 20 Aug 2025 17:00:19 +0300
Message-ID: <20250820140021.8026-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This small patch series fixes a source of driver crashes when starting
pipelines that contain unconnected pads marked with MUST_CONNECT. Since
commit b3decc5ce7d7 ("media: mc: Expand MUST_CONNECT flag to always
require an enabled link"), the MUST_CONNECT flag indicates that the pad
must have an enabled link for the pipeline to be valid. Drivers are
relying on this guarantee to avoid some NULL checks.

A bug in the pipeline validation code causes pipelines with unconnected
MUST_CONNECT pads to be accepted in some circumstances. This has caused
crashes in the imx8-isi driver, as reported in [1], [2] and [3]. Patch
1/2 fixes the issue, while patch 2/2 expands a log message with
additional information that I found useful when debugging.

Martin, Maud, would you be able to review and test patch 1/2 to verify
it fixes your issues ? I have reproduced the crash and verified that the
patch fixes it, but a confirmation it also works for you would be
appreciated.

[1] https://lore.kernel.org/linux-media/20250205172957.182362-1-martink@posteo.de
[2] https://lore.kernel.org/linux-media/1536a61b-b405-4762-9fb4-7e257f95e49e@gocontroll.com/
[3] https://lore.kernel.org/linux-media/20250818-imx8_isi-v1-1-e9cfe994c435@gocontroll.com

Laurent Pinchart (2):
  media: mc: Fix MUST_CONNECT handling for pads with no links
  media: mc: Improve unconnected pads debugging message in link
    exploration

 drivers/media/mc/mc-entity.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)


base-commit: c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9
-- 
Regards,

Laurent Pinchart


