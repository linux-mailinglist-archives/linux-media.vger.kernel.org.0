Return-Path: <linux-media+bounces-23827-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DB59F8361
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 19:39:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7DC216179A
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 18:39:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 982731A4E77;
	Thu, 19 Dec 2024 18:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="M1dn1VrQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1788435948;
	Thu, 19 Dec 2024 18:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734633544; cv=none; b=jqMuty0FO5H0Rud5aluo+9zU8BEDeMDg20EnDVdGfmOLFREX6Tv4QOK4940oz2aR+KakZpkI8yQldemw8eOZvxEhqBWD7iMIPkoH7LxJyTCuBdVw34YBfvO5WcLK0D5u+WPYUvC1RAELm+qds7jyLJe0fG+4LAWvPEIrsEWyoKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734633544; c=relaxed/simple;
	bh=wSCHflh/xFKlSaM1HFZxN95crA1XDVViZBkEqiCAdno=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mh1QcMNisaoc4YUVKiQ7Jkk/pAoDat0DzUxVFxcB50eNWzVnKKd5q2yxutNG9l23QYofT6v2x3pyuBeiffwn9KdrgpIcJpVZIZqow9hTROcTEGLp5ZegnaibyO5ebdnX+JkFldjdpusMfLEO5pqTUziBKfjLaOtxcdRoo/62AFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=M1dn1VrQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.104] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B18E3161;
	Thu, 19 Dec 2024 19:38:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734633501;
	bh=wSCHflh/xFKlSaM1HFZxN95crA1XDVViZBkEqiCAdno=;
	h=From:Subject:Date:To:Cc:From;
	b=M1dn1VrQIVO9EUYRw1CWvYnlQxT8Pmu+6cCLOmxIQmdYWm9xpZKEvwc4FzqFIxbmS
	 YkHZrmfqtDpq8aUuWjCjz57HqC6LqR0a8VOiLwYuNwfQSt8Kbg2/vIv4DK3VrJ9JjI
	 4DGbzTSiugC9Zucqt2gGwww06hB+elelikrV878c=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: [PATCH 0/2] Add support for soft reset
Date: Thu, 19 Dec 2024 19:38:28 +0100
Message-Id: <20241219-v4h-fcp-soft-reset-v1-0-026e72dca514@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACVoZGcC/x3MOwqAMBBF0a3I1A6YoPGzFbHw86LTqGREhODeD
 ZanuDeSIgiUuixSwC0qx55g8ozmbdxXsCzJZAtbGmtavsuN/XyyHv7iAMXFUw3nJ7iqaRyl8Az
 w8vzTfnjfD5qMBqBkAAAA
X-Change-ID: 20241219-v4h-fcp-soft-reset-b7e6fbe65886
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 Koji Matsuoka <koji.matsuoka.xm@renesas.com>, 
 LUU HOAI <hoai.luu.ub@renesas.com>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=956;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=wSCHflh/xFKlSaM1HFZxN95crA1XDVViZBkEqiCAdno=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBnZGhC3nxR4U2Wr8lnJc5WuP8gUP8k4E42bf4SH
 JmsrAlXMsWJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ2RoQgAKCRByNAaPFqFW
 PGV/D/9nJH4AodbeEoWmOuo6Nc2TPXqUJYTEv11anlE+WJtePkSyarPyr+bI3Ukn6mgT/qtGsp8
 MKT3MMva/5PwUckNhvAxXslpZZ+TDi0KD66cSi40r8MqJSmmuZYf+BHE+10DFgGYsspNdtVI8wD
 OGwl3kR2hmOObobY8BgsqMdMRWNZIXMg5fS5/IKzsdxM7f2quX6o7A4SfmI18ixTIMMgdDmyAE7
 hWvNr4a6yeenAahfG9N3WNp7pT7wg92DmBtI3NKq2MAgrlA6TP2J0GQAb346e8sr6qDe+z1R8XQ
 DdKFKWLph55DMSf3cSRjJVFmddzgH9d0nRLgphPuWyAVATNjyJ68Y7gcDERorpKiI2l7NuVadH4
 XoPt5FA8OBEyg8JeuHBORJQaWG086inWdqKGVeYIJgZ3CXhqX+eed9x6VzVmi1V+h1Wf3Obh0Zd
 DWGbSVsoFmTuJ7NZu2Fpq009nGnneX2ZNEfY/nL1EHNN+rW/hXRGu5sIENByUl7+c3L2FDxtTxL
 zPBy1SK/O5rUNR9tL41NnrZsB6okTYfJWbLL1og1bOVGKUHSSkGcvLNHLy54wTJfcCkV26uscAh
 ykhPLoMQmvRBkdzyrVTFpY/Itxuk0a3bDzRxCc5ktYyadaR6s1wVQC4fk2yMCWIDITRqx9pgNiM
 3e+4zylW3xheadA==
X-Developer-Key: i=jacopo.mondi+renesas@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Initially my intent was to support the VSPX-FCPVX stop procedure but I
also noticed from patch b4bc2410cd81 ("rcar-fcp: Add FCPVD reset sequence
for VSPD") in the BSP that resetting the FCP has other use cases.

Introduce the function and upport the above patch while preparing to
support VSPX and FCPVX.

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
Jacopo Mondi (1):
      media: rcar-fcp: Add rcar_fcp_soft_reset()

Koji Matsuoka (1):
      rcar-fcp: Add FCPVD reset sequence for VSPD

 drivers/media/platform/renesas/rcar-fcp.c       | 41 +++++++++++++++++++++++++
 drivers/media/platform/renesas/vsp1/vsp1_pipe.c |  6 ++++
 include/media/rcar-fcp.h                        |  5 +++
 3 files changed, 52 insertions(+)
---
base-commit: 50d451b19cc58cf374160e30cbf72a5ed5b1b129
change-id: 20241219-v4h-fcp-soft-reset-b7e6fbe65886

Best regards,
-- 
Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>


