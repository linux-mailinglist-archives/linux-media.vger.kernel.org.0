Return-Path: <linux-media+bounces-39263-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6476EB1F6BD
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 23:21:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71824189C413
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 21:21:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 082162D028F;
	Sat,  9 Aug 2025 21:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VFgVTqSf"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DDA2D0C84
	for <linux-media@vger.kernel.org>; Sat,  9 Aug 2025 21:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754774354; cv=none; b=YXN1r0Y8e7hEo1rPu6jinh84g6culDpfxWfu1pPyxz6/im30ppX/VToXjaiWPGuI8leoYHEEmnE4lg4J+QFVmglH7vtC70dVv8kiIDHE+jBbAO6PPsclJSjPB8btUXVgYZhxFd3dbWlimoWze15//yZ/SHvkoH1w8NkI4nNoGHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754774354; c=relaxed/simple;
	bh=TqSNPHQ51geLYoaPbn/7SwDHBQStX7gKsiICnE34Qgc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bhOQVlfhbnDLkxu4TdpAofxKmLCa+/S6i8X4oBWQlr8ZFJLR9DqR4JjWafKcfGvvlDvZ3aWmY1SZCA3D7F1m4n5ksk/z5R9iDSArV96HYZnxroIZ1l+bnKzNizPMCXSf8kxyMMAOyV+Z3IDcSUPcP+QTwv6PMfA1wczDagvw4yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VFgVTqSf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 2FADE502;
	Sat,  9 Aug 2025 23:18:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774294;
	bh=TqSNPHQ51geLYoaPbn/7SwDHBQStX7gKsiICnE34Qgc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VFgVTqSfT/zkcrE+f/1Wgwds1dAaxLfVyLw4YQeVQ8Ytfe7KJ1kz/tQq8EHclGhze
	 suJX8Qb+I5kow336kb/7ZVO4JLDyEHcEboiFZO7TWqvJSKqZPsKeSol4qYEzllIkL8
	 EnVT3mmGvblfeC71fl77CEAx5Tvz0PhwXBN6iRvE=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-staging@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 68/76] media: staging: imx: Access v4l2_fh from file
Date: Sun, 10 Aug 2025 00:16:45 +0300
Message-ID: <20250809211654.28887-69-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
References: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

The v4l2_fh associated with an open file handle is now guaranteed
to be available in file->private_data, initialised by v4l2_fh_add().

Access the v4l2_fh, and from there the driver-specific structure,
from the file * in all ioctl handlers.

Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v1:

- Update file-to-ctx macro due to removal of fh-to-ctx macro
---
 drivers/staging/media/imx/imx-media-csc-scaler.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-csc-scaler.c b/drivers/staging/media/imx/imx-media-csc-scaler.c
index dc7f9a77cbe6..1869c5792ecb 100644
--- a/drivers/staging/media/imx/imx-media-csc-scaler.c
+++ b/drivers/staging/media/imx/imx-media-csc-scaler.c
@@ -23,8 +23,6 @@
 
 #include "imx-media.h"
 
-#define fh_to_ctx(__fh)	container_of(__fh, struct ipu_csc_scaler_ctx, fh)
-
 #define IMX_CSC_SCALER_NAME "imx-csc-scaler"
 
 enum {
@@ -68,7 +66,7 @@ struct ipu_csc_scaler_ctx {
 
 static inline struct ipu_csc_scaler_ctx *file_to_ctx(struct file *filp)
 {
-	return fh_to_ctx(file_to_v4l2_fh(filp));
+	return container_of(file_to_v4l2_fh(filp), struct ipu_csc_scaler_ctx, fh);
 }
 
 static struct ipu_csc_scaler_q_data *get_q_data(struct ipu_csc_scaler_ctx *ctx,
@@ -184,7 +182,7 @@ static int ipu_csc_scaler_enum_fmt(struct file *file, void *fh,
 static int ipu_csc_scaler_g_fmt(struct file *file, void *priv,
 				struct v4l2_format *f)
 {
-	struct ipu_csc_scaler_ctx *ctx = fh_to_ctx(priv);
+	struct ipu_csc_scaler_ctx *ctx = file_to_ctx(file);
 	struct ipu_csc_scaler_q_data *q_data;
 
 	q_data = get_q_data(ctx, f->type);
@@ -197,7 +195,7 @@ static int ipu_csc_scaler_g_fmt(struct file *file, void *priv,
 static int ipu_csc_scaler_try_fmt(struct file *file, void *priv,
 				  struct v4l2_format *f)
 {
-	struct ipu_csc_scaler_ctx *ctx = fh_to_ctx(priv);
+	struct ipu_csc_scaler_ctx *ctx = file_to_ctx(file);
 	struct ipu_csc_scaler_q_data *q_data = get_q_data(ctx, f->type);
 	struct ipu_image test_in, test_out;
 	enum v4l2_field field;
@@ -245,8 +243,8 @@ static int ipu_csc_scaler_try_fmt(struct file *file, void *priv,
 static int ipu_csc_scaler_s_fmt(struct file *file, void *priv,
 				struct v4l2_format *f)
 {
+	struct ipu_csc_scaler_ctx *ctx = file_to_ctx(file);
 	struct ipu_csc_scaler_q_data *q_data;
-	struct ipu_csc_scaler_ctx *ctx = fh_to_ctx(priv);
 	struct vb2_queue *vq;
 	int ret;
 
@@ -301,7 +299,7 @@ static int ipu_csc_scaler_s_fmt(struct file *file, void *priv,
 static int ipu_csc_scaler_g_selection(struct file *file, void *priv,
 				      struct v4l2_selection *s)
 {
-	struct ipu_csc_scaler_ctx *ctx = fh_to_ctx(priv);
+	struct ipu_csc_scaler_ctx *ctx = file_to_ctx(file);
 	struct ipu_csc_scaler_q_data *q_data;
 
 	switch (s->target) {
@@ -339,7 +337,7 @@ static int ipu_csc_scaler_g_selection(struct file *file, void *priv,
 static int ipu_csc_scaler_s_selection(struct file *file, void *priv,
 				      struct v4l2_selection *s)
 {
-	struct ipu_csc_scaler_ctx *ctx = fh_to_ctx(priv);
+	struct ipu_csc_scaler_ctx *ctx = file_to_ctx(file);
 	struct ipu_csc_scaler_q_data *q_data;
 
 	switch (s->target) {
-- 
Regards,

Laurent Pinchart


