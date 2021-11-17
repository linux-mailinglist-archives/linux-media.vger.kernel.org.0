Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD7EE454DF1
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 20:34:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240520AbhKQThP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 14:37:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:45420 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240498AbhKQThJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 14:37:09 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A63DF61B31;
        Wed, 17 Nov 2021 19:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637177650;
        bh=OhdD8cWQa3I182u35I+LDtO/zXFR14uAXRJudFRFVQ8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=A+IFLCpl/l+1EPS30edjHt32IhxMVAM4QnfNROCSJX9H7uPs9cK+whZeF4+DTgQ8H
         QBj766f6BuKgLGbd5CPJ3aH/vZUAErSzxfOqyQ13gmC5ItImNwcOr0shi1lLcK7uva
         Z6MN1gqaqw1TxCHI3bYRLUsi+hISlgEpu+81U+qi3g5apWvDoviZR7uXZDqsxAOs8+
         kfx0CzW+4X9reqh2eoR8vePhzRjYa9IUvc6XIKjPagD62byW1BMJg0NW7yIRG1M7Ia
         /03uMTsvNrMNzgNIpXSX+1u+ZcwQxruoLzcyNAWdSUkc7XUweSY5CkFCwEgFmok7KR
         zdLP4AHK08JUA==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mnQh6-00DXHu-4t; Wed, 17 Nov 2021 19:34:08 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Alex Dewar <alex.dewar90@gmail.com>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 7/8] media: atomisp: add YUVPP at __atomisp_get_pipe() logic
Date:   Wed, 17 Nov 2021 19:34:05 +0000
Message-Id: <a7adcd166bba73f87776ae7f01846ed9aa919558.1637177402.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637177402.git.mchehab+huawei@kernel.org>
References: <cover.1637177402.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Aligns it which the Intel Aero firmware.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 0/8] at: https://lore.kernel.org/all/cover.1637177402.git.mchehab+huawei@kernel.org/

 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 86dad9fe61bf..5a90cc31cd1a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -857,7 +857,8 @@ static struct atomisp_video_pipe *__atomisp_get_pipe(
 	} else if (asd->run_mode->val == ATOMISP_RUN_MODE_VIDEO) {
 		/* For online video or SDV video pipe. */
 		if (css_pipe_id == IA_CSS_PIPE_ID_VIDEO ||
-		    css_pipe_id == IA_CSS_PIPE_ID_COPY) {
+		    css_pipe_id == IA_CSS_PIPE_ID_COPY ||
+		    css_pipe_id == IA_CSS_PIPE_ID_YUVPP) {
 			if (buf_type == IA_CSS_BUFFER_TYPE_OUTPUT_FRAME)
 				return &asd->video_out_video_capture;
 			return &asd->video_out_preview;
@@ -865,7 +866,8 @@ static struct atomisp_video_pipe *__atomisp_get_pipe(
 	} else if (asd->run_mode->val == ATOMISP_RUN_MODE_PREVIEW) {
 		/* For online preview or ZSL preview pipe. */
 		if (css_pipe_id == IA_CSS_PIPE_ID_PREVIEW ||
-		    css_pipe_id == IA_CSS_PIPE_ID_COPY)
+		    css_pipe_id == IA_CSS_PIPE_ID_COPY ||
+		    css_pipe_id == IA_CSS_PIPE_ID_YUVPP)
 			return &asd->video_out_preview;
 	}
 	/* For capture pipe. */
-- 
2.33.1

