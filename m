Return-Path: <linux-media+bounces-20810-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C159BBC21
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 18:36:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 199971F23135
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 17:36:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E55461C7608;
	Mon,  4 Nov 2024 17:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="mEUqLzMK";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="VzbPvsWE"
X-Original-To: linux-media@vger.kernel.org
Received: from a7-45.smtp-out.eu-west-1.amazonses.com (a7-45.smtp-out.eu-west-1.amazonses.com [54.240.7.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4958333FE;
	Mon,  4 Nov 2024 17:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.7.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730741791; cv=none; b=U6vDiJ2wh9tWPcVuK8KF9BCN/Q0OubOY+NgTILv7GeP8otCpfn7Ma2mHM6qVPhwnrRHiO/I2i+q5WkoWRscyMPpfpd7bT7JK0nJQtnjMChPlvO4Ps4QGoOIZTidtxo1G9QY2pINVTrDYlDH7S32/d1ZZmTfS8VsEAwAeRv34PZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730741791; c=relaxed/simple;
	bh=yl34RGvn530eol6KKKlCd1cMYmqiFsLcin5kdTgiGlw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YWQ/GoNjKsBDtq9YPoa2eKWcBUMIZujOfZQBRsCx2b2EVg/EWV5Owx7FmZBsgTcvz5xABMuOj7NcFGJqCpTZMVFZpK5T5/HiE1QWbP8W9AHXrpGeNkgoPf1fPILk42nKWwFvTfAsB8fKyn1o0U6cHDbe/xO0LKHuE7nXrjxcsM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=amazonses.collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=mEUqLzMK; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=VzbPvsWE; arc=none smtp.client-ip=54.240.7.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazonses.collabora.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=bc7lryepznv65m6r2ewkpoafjt4fiq42; d=collabora.com; t=1730741787;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding;
	bh=yl34RGvn530eol6KKKlCd1cMYmqiFsLcin5kdTgiGlw=;
	b=mEUqLzMKEDY11vgHNBOEWhqra23z0MbmnlnBV9Ayu6orbyeSjuNGlt3N6O8bwQT/
	DdMKoVjCMy9VSybDjpXB+0WnX8iSzW2SmtcBqGBWPDjJs6GEnMQrVnWHp4v6RZY45Ml
	BmkNPllZL2/x/ul99B1u0BBAq19J0Kxl+cAzhpyQhV5HClhANo7jJthpQRhJCXzZvo3
	MxmNENuEpZeHARQLQ2bCs7LZbUZeC9KYLfgm67Yricciy+IL/JmPAaHJ4//PzjjxGKW
	cM9nL0BuTzS50dt0TWVR338dhT+Vwj5gI9HqGgKMhjZAWDFLdcWnHVjvmo+rzDELz6P
	KOPj9mT2mQ==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1730741787;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
	bh=yl34RGvn530eol6KKKlCd1cMYmqiFsLcin5kdTgiGlw=;
	b=VzbPvsWEt4eG9KU6Ym0jzfXfbM+oysnmdHnLHPy//ijja75sY84DZkvYywkiVUS4
	bq+9yJ8ev5DYTNyxRbyl/FLHwt2cXmY8pbBbeDjKvbE3Dfm5M2IgJ0JNTU9xQGZQOJj
	0Hvnrbq8y/TDLaFo09Y1GM1pT/Ini5dgAPjhvDbo=
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de, 
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel@collabora.com, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH 0/2] media: verisilicon: fix reference padding issue
Date: Mon, 4 Nov 2024 17:36:27 +0000
Message-ID: <01020192f83fdb1f-34d2a074-79e4-4fb8-af50-f065312cb65f-000000@eu-west-1.amazonses.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.11.04-54.240.7.45

Hantro hardware is splited into two parts: the decoder which produce
tiled pixels formats and the post-processor which produce raster pixels
formats.
When post-processor is used the selected pixels format may not have the
some padding/stride than the decoder output pixels format. This led to
miscomputing chroma and motion vectors offsets so data are overlapping.
This series introduce a reference pixels format that decoder use to
compute the various needed offsets and size.

With this series Fluster for VP9 tests is now 207/305 vs 145/305.
HEVC test score isn't impacted by these patches (still 141/147).

Benjamin Gaignard (2):
  media: verisilicon: Store reference frames pixels format
  media: verisilicon: Fix IMX8 native pixels format steps values

 drivers/media/platform/verisilicon/hantro.h   |  2 ++
 .../media/platform/verisilicon/hantro_g2.c    |  2 +-
 .../platform/verisilicon/hantro_postproc.c    | 28 ++++++-------------
 .../media/platform/verisilicon/hantro_v4l2.c  | 21 ++++++++++++++
 .../media/platform/verisilicon/imx8m_vpu_hw.c | 10 +++----
 5 files changed, 38 insertions(+), 25 deletions(-)

-- 
2.43.0


