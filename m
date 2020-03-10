Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53F2017FF3D
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 14:45:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727723AbgCJNpT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 09:45:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:37590 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726917AbgCJNnS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 09:43:18 -0400
Received: from mail.kernel.org (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1A84824693;
        Tue, 10 Mar 2020 13:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583847797;
        bh=BdA03yR4+DlgQTm0fQ3I/NKA1rVacJsnxQdM04uIZHc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=yFAPoeG3tU1Hv/gN3UbTsa5dWZg2LU2SUyn2Q9PwegD+m9ptKx8Jx/7w804y8NZur
         D7SQJ016YJHBEzZL3MqmQl1PE6/wNK06QGT7EN9Wo5YU+bKkVWEg0D5uo754jFHgl6
         kcDCjQrqQVh8QKR8Vf9MCWj77SB+fYCrKutoaPK0=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jBfAB-0005vx-9S; Tue, 10 Mar 2020 14:43:15 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-media@vger.kernel.org, Andy Walls <awalls@md.metrocast.net>
Subject: [PATCH v2 10/22] media: docs: cx18-streams.c: fix broken references to docs
Date:   Tue, 10 Mar 2020 14:43:01 +0100
Message-Id: <fed9a10e29427997886c824b83cde567acb7e993.1583847556.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1583847556.git.mchehab+huawei@kernel.org>
References: <cover.1583847556.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are two places inside this file that points to the
cx2341x documentation, with was split into two. Looking
at changeset dcc0ef88209a
("V4L/DVB (10442): cx18: Fixes for enforcing when Encoder Raw VBI params can be set")
with added those comments, it was originally pointing to:

	Documentation/video4linux/cx2341x/fw-encoder-api.txt

Well, the firmware details went to

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/pci/cx18/cx18-streams.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/cx18/cx18-streams.c b/drivers/media/pci/cx18/cx18-streams.c
index 3178df3c4922..0e2365c9f4ad 100644
--- a/drivers/media/pci/cx18/cx18-streams.c
+++ b/drivers/media/pci/cx18/cx18-streams.c
@@ -845,7 +845,7 @@ int cx18_start_v4l2_encode_stream(struct cx18_stream *s)
 
 		/*
 		 * Audio related reset according to
-		 * Documentation/media/v4l-drivers/cx2341x.rst
+		 * Documentation/media/v4l-drivers/cx2341x-devel.rst
 		 */
 		if (atomic_read(&cx->ana_capturing) == 0)
 			cx18_vapi(cx, CX18_CPU_SET_MISC_PARAMETERS, 2,
@@ -853,7 +853,7 @@ int cx18_start_v4l2_encode_stream(struct cx18_stream *s)
 
 		/*
 		 * Number of lines for Field 1 & Field 2 according to
-		 * Documentation/media/v4l-drivers/cx2341x.rst
+		 * Documentation/media/v4l-drivers/cx2341x-devel.rst
 		 * Field 1 is 312 for 625 line systems in BT.656
 		 * Field 2 is 313 for 625 line systems in BT.656
 		 */
-- 
2.24.1

