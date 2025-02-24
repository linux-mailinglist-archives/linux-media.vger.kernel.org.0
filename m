Return-Path: <linux-media+bounces-26869-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1464BA42D88
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 21:20:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99F8A3B19FB
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 20:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 525A4241C98;
	Mon, 24 Feb 2025 20:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HN5Oh9ni"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EC118B464;
	Mon, 24 Feb 2025 20:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740428401; cv=none; b=IjK9Gbgwmsn2HmX+KzCCD/zjxeM1JXnYTqt6/JCZ3Xg1tTIEaTsBnhgwk6CpucApgj212Y1F9051q989I4xTGtlzLAcyY51T8o/+FKx+IjQFHZLDzEng+KvW+jdgUwy5+SOC6+hz96fQY8cLZv9f78eCMKmNxaUi0llkvoX6Tks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740428401; c=relaxed/simple;
	bh=0bvGN1vsW4WkjJukPZmqOi/PtlqoDTpb4ZJhb215zHg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NjWKbzzl5RX536h1BCvI/Watm+WntWBMN8GRLNhtYBIopydD+KSf9uqW3wb5XgPSi9HwWgEerTVhQrIeBpowPRZY6C295+s79+5Klq5ILddWSl4DFPsgQq5YRPlostoYhZVqdW/hGZfz9qM2wiqEsd0PQIg9lK4JgMkMUrE4DKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HN5Oh9ni; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.103] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9984C455;
	Mon, 24 Feb 2025 21:18:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740428311;
	bh=0bvGN1vsW4WkjJukPZmqOi/PtlqoDTpb4ZJhb215zHg=;
	h=From:Subject:Date:To:Cc:From;
	b=HN5Oh9niUrcMPgOhkCCbqwQYXJa7qIhjK/yF/oyixPGnH6CeQaKPN/a9gwRWzw2eM
	 6a1W2KFqRkjdkRwteKwAPqNC3jymPQ+JhwcQoMQ4OP8BTCITIH/JU56kcznmcDoYmd
	 XWk9r5bJ6POqFwlgcwT0bARimzPfr7bgFIDoOgCw=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: [PATCH v2 0/6] media: renesas: vsp1: Add support for IIF
Date: Mon, 24 Feb 2025 21:19:40 +0100
Message-Id: <20250224-v4h-iif-v2-0-0305e3c1fe2d@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFzUvGcC/2XMMQ4CIRCF4atsphYDLGiw8h5mCxYGmUIwYIhmw
 93FbS3/l5dvg4qFsMJl2qBgo0o5jZCHCVy06Y6M/GiQXGou5MyaiowoMCu8tyfFndEexvtZMNB
 7l27L6Ej1lctnh5v4rf9GE4yz86pQS2PMbMKVPNqa05pt8UeXH7D03r9So9zhpQAAAA==
X-Change-ID: 20250123-v4h-iif-a1dda640c95d
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=2170;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=0bvGN1vsW4WkjJukPZmqOi/PtlqoDTpb4ZJhb215zHg=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBnvNRr9M4/pE+4J+w4FMek8S8dXsFWo+1EICKVD
 p5GGHs+QCaJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ7zUawAKCRByNAaPFqFW
 PLLfD/9bZ/kyqI7YXEemxXGLMFi7wdckURrX14JB78mBa2eyOKmzyhfLbLndV/A01HdZ3RduCMh
 o8+Ow5Zor/R8msYNWurXPnnba1M88zdX7/jDBis4t31yrsl/95wtzsRGxpHIthRgGP5PC3W+uzm
 LKU+8YlYHZgC9wTzeeM89nlTQKhN21JbBu8DF5hSM1XYmQoaUR99UQaUYT6nITN/GKgookwQ1KY
 apSvkqRhj3noXgHJne24J1mFG8BpFnjAfDU6NGhSurvk+IEGiYR4Bjf40U5m4sOWxajizqJWg+6
 Lo266UCeEad0la9KXmIDrWtOA8B2KDLg5t8UDhs+pRvNqqnymSrLRbxIfbNeZPxKLUJZZwcBfY8
 ST+f60udvTU7flF8OxDYNN/saaNr/Bx/tS74y8Ql17SeZIzjoHq6KDzvUql9Zci20XLaj4FzV1T
 4FQztSzapGyDMiGCsXUXPGiXc0CsAcHXUn0PPimSXwzBPir8+Xw+7Zh/CPrQsl0H3cKW3kFv+fH
 +diBAzy0qNO1R5NV+c8wdyv08NPPfvJGTsuL8wzJd2WzaPoYRkL3Z8dME2HsBKemtAABidrNW6L
 XnlsKFoVISBOX8IcadjkYyJJ86wqOUta0nN4u3AjEKkuwtQz0vjYt18iLt2pvXrHNGWVGz8xGU3
 8gPx8qW0C7JAHgQ==
X-Developer-Key: i=jacopo.mondi+renesas@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

The IIF (ISP InterFace) is a VSP2 function that reads data from
external memory using two RPF instances and feed it to the ISP.

The IIF support is modeled in the vsp1 driver as a new, simple,
entity type.

IIF is part of VSPX, a version of the VSP2 IP specialized for ISP
interfacing. To prepare to support VSPX, support IIF first by
introducing a new entity and by adjusting the RPF/WPF drivers to
operate correctly when an IIF is present.

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
Changes in v2:
- Collect tags
- Address review comments from Laurent, a lot of tiny changes here and
  there but no major redesign worth an entry in the patchset changelog

---
Jacopo Mondi (6):
      media: vsp1: Add support IIF ISP Interface
      media: vsp1: Clean FRE interrupt status
      media: vsp1: dl: Use singleshot DL for VSPX
      media: vsp1: rwpf: Break out format handling
      media: vsp1: rwpf: Support RAW Bayer and ISP config
      media: vsp1: rwpf: Support operations with IIF

 drivers/media/platform/renesas/vsp1/Makefile      |   2 +-
 drivers/media/platform/renesas/vsp1/vsp1.h        |   3 +
 drivers/media/platform/renesas/vsp1/vsp1_dl.c     |   7 +-
 drivers/media/platform/renesas/vsp1/vsp1_drv.c    |  14 ++-
 drivers/media/platform/renesas/vsp1/vsp1_entity.c |   8 ++
 drivers/media/platform/renesas/vsp1/vsp1_entity.h |   1 +
 drivers/media/platform/renesas/vsp1/vsp1_iif.c    | 133 ++++++++++++++++++++++
 drivers/media/platform/renesas/vsp1/vsp1_iif.h    |  26 +++++
 drivers/media/platform/renesas/vsp1/vsp1_pipe.c   |   1 +
 drivers/media/platform/renesas/vsp1/vsp1_pipe.h   |   1 +
 drivers/media/platform/renesas/vsp1/vsp1_regs.h   |   8 ++
 drivers/media/platform/renesas/vsp1/vsp1_rpf.c    |  18 ++-
 drivers/media/platform/renesas/vsp1/vsp1_rwpf.c   | 110 ++++++++++++++++--
 drivers/media/platform/renesas/vsp1/vsp1_wpf.c    |  14 ++-
 14 files changed, 327 insertions(+), 19 deletions(-)
---
base-commit: b2c4bf0c102084e77ed1b12090d77a76469a6814
change-id: 20250123-v4h-iif-a1dda640c95d

Best regards,
-- 
Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>


