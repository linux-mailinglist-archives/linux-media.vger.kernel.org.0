Return-Path: <linux-media+bounces-57459-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEDpCEL/x2kqgAUAu9opvQ
	(envelope-from <linux-media+bounces-57459-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 17:18:10 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6930E34F241
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 17:18:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0624630131F6
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 16:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DA1734F47E;
	Sat, 28 Mar 2026 16:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WjvFegs1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB5319E819
	for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 16:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774714675; cv=none; b=hsHxF1rAEzIa76gTULfjwGaS2CEDfa2cs0xK8siUdSA9H42MNIq6JIY5OYgosVOzClTcsSsKsuD46JuKG0S6KPzmoLqppQ/8yPQ2xKVVv/H00/5goMI/yfWA+GhCIjhr3JMNVPFQ3HpyMtvhnQv/p41mvTLw5JY/0uHDf2mxx+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774714675; c=relaxed/simple;
	bh=RJe9GzRsVnP9RgGUrpNPFKt+FZ5gT6tjolAsDsfcPn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lo7J2Bswz2QNRVYLQmyTX5ZuFp5TiFdFTLCWbrdxp2rByGyjBx5gbqaLIhqfDmBNHPhR//sAxD3yRGm8MLJtaQhNtjzQnhiY3F/S46HhWm+JHio/XFkkT28I9PBd+ZVgVpoZLu0DW9cWxkLn76wq9e927HRG3CXEBMEyL2U3ZK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WjvFegs1; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b97e6e48b24so545794766b.2
        for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 09:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774714673; x=1775319473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7X4Hw21VVlfFhBGvSzfDwQVT4JNcMNCdD8bUyasxiZU=;
        b=WjvFegs1YneqH1zzLSsMIADUVEsS+m5KZVV73muaGm3Ncl5Wb2yOtBIbeCtwgNm3Wb
         SlD3lVdHwzAMBPniCfBTjxGQGKPFL9GwMNLdoZH3Yiem2P/gVujD3mveVvNf/ALEbKcx
         aeKEn9arP+/LQV5sLzVm8S3QpXIuzOGDf9Np1EP15Hds8VEtO0NsjVmz4JkSGn0RWTrC
         itqtItrC9d4qWjoN7rDtkxaXZjTpMpeclgLT4mEVO+chSwzRErLB3SLm45Hdl6H26tB+
         eZWbc/U9pX4MdIRVUufqaWrybmk7q1bofX6WYidq46tiv1Fs1FAngUO8GhDgSO4piR65
         IRdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774714673; x=1775319473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7X4Hw21VVlfFhBGvSzfDwQVT4JNcMNCdD8bUyasxiZU=;
        b=E7mpAg7osiG5PpiZqQdSdJPDTgSYkFBpyHKiXDiKIMY5063CLlam1MEpBcneEfhu2c
         /h8YyhU9Xbk9e1lHqDWRdhI93eIvZqEq3EpTxbB2ro2V7iUKWmUdrRuA7esXrdtxBn3y
         mA4QNJfdSruEjatdGYJlEqoMYXi9JdoSUkcBLUeiNCTN+KikeMKEZH0Qt0TyASNQvPoK
         Mtr39eTYoxlWF1SV0EL0/QPL6UjR6ps2SpYGop51NP7QvSum0yOJQSKhbo68S341upW5
         O0hRnmzkrrY01FYrONXv95JZAEwEyjeg+ICK6WJ/83S13+8AI6uRFElhvfapLrNe6jP5
         oMjQ==
X-Gm-Message-State: AOJu0YxGvM90M+6E4EQ+9gLVfY0twMTynx/c/N9g5osKmoWNM9nQ8lW4
	0g08JuWi8IbhJqVU6AyX6EvcaHpW292ar6xI7LPys7M8nuITkMgA3sP/FlweWeknmuk=
X-Gm-Gg: ATEYQzx3ONnrcQKf5KAIlJ/n9RgLg8vWRWEQpz4a6IjsB9QX5iSW7ff8wZlfqoDjuRh
	uGA+uN/pbYmsT70ClwgtLmSiad5zzVF3Khd7cPu3Ovf9MHu7mG34nd4opsihoLSyXOzHCRD15UR
	QdqoHvvGcLeBLssVf1evDE9pVox5I7Sj4lUL4zN2fIYUttsYN3ZWW8FkJZ1s7LyEuHJiVCEX3Rb
	22xVrOiYSttuF0foZ5NAF+lcy0f2xK/ewa/0RKdPCGC1mgNErPJR4cou1gEH/LsgmRBy144g7k8
	0shm15Tmz85wPi2XoolKEH14fpaaDxtHTxGiDO1s6oPOqqr/pqRqgtdajFLU53VmukwygnJ53m8
	hpZTniJh18r8nlEDucG07DDHsrq+mvYd+OTK19xZtfYfS3PaW7buFGatJY79MrfqTvOyMuWBUSD
	DOnGpGD3ZJQVhgiUe4ic6F//gByfrPXTt1wLoLpElChTj458DTBg4mKF73I20fTB0gaMJ+j/QSK
	aELL99Usk94itNwcFm5wwQA3opsq6Kuu1Mm9hA7Ju14sW4=
X-Received: by 2002:a05:600c:4e15:b0:477:7ae0:cd6e with SMTP id 5b1f17b1804b1-48727d5a16fmr96169455e9.5.1774704568187;
        Sat, 28 Mar 2026 06:29:28 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:e1de:7c03:e16f:8136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21e265fsm5369110f8f.1.2026.03.28.06.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 06:29:27 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Xiaolei Wang <xiaolei.wang@windriver.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v2 1/2] media: i2c: ov5645: Report streams using frame descriptors
Date: Sat, 28 Mar 2026 13:29:01 +0000
Message-ID: <20260328132902.776757-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260328132902.776757-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260328132902.776757-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-57459-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com,ideasonboard.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,ideasonboard.com:email]
X-Rspamd-Queue-Id: 6930E34F241
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Implement the .get_frame_desc() subdev operation to report information
about streams to the connected CSI-2 receiver. This is required to let
the CSI-2 receiver driver know about virtual channels and data types for
each stream.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v3 [0],
- Added a macro for the source pad index.
- Updated ov5645_init_state() to use the new macro.

[0] https://lore.kernel.org/all/20241018153230.235647-9-prabhakar.mahadev-lad.rj@bp.renesas.com/

Hi Laurent,

Ive restored your RB tag with the above changes. Please let me know if
you have any further comments.
Cheers,
Prabhakar
---
 drivers/media/i2c/ov5645.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index b10d408034a1..df9001fce44d 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -28,6 +28,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/types.h>
+#include <media/mipi-csi2.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
@@ -68,6 +69,8 @@ static const char * const ov5645_supply_name[] = {
 
 #define OV5645_NUM_SUPPLIES ARRAY_SIZE(ov5645_supply_name)
 
+#define OV5645_PAD_SOURCE	0
+
 struct reg_value {
 	u16 reg;
 	u8 val;
@@ -817,6 +820,29 @@ static const struct v4l2_ctrl_ops ov5645_ctrl_ops = {
 	.s_ctrl = ov5645_s_ctrl,
 };
 
+static int ov5645_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+				 struct v4l2_mbus_frame_desc *fd)
+{
+	struct v4l2_subdev_state *state;
+	u32 code;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+	code = v4l2_subdev_state_get_format(state, OV5645_PAD_SOURCE, 0)->code;
+	v4l2_subdev_unlock_state(state);
+
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+	fd->num_entries = 1;
+
+	memset(fd->entry, 0, sizeof(fd->entry));
+
+	fd->entry[0].pixelcode = code;
+	fd->entry[0].stream = 0;
+	fd->entry[0].bus.csi2.vc = 0;
+	fd->entry[0].bus.csi2.dt = MIPI_CSI2_DT_YUV422_8B;
+
+	return 0;
+}
+
 static int ov5645_enum_mbus_code(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
@@ -897,7 +923,7 @@ static int ov5645_init_state(struct v4l2_subdev *subdev,
 {
 	struct v4l2_subdev_format fmt = {
 		.which = V4L2_SUBDEV_FORMAT_TRY,
-		.pad = 0,
+		.pad = OV5645_PAD_SOURCE,
 		.format = {
 			.code = MEDIA_BUS_FMT_UYVY8_1X16,
 			.width = ov5645_mode_info_data[1].width,
@@ -988,6 +1014,7 @@ static const struct v4l2_subdev_video_ops ov5645_video_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops ov5645_subdev_pad_ops = {
+	.get_frame_desc = ov5645_get_frame_desc,
 	.enum_mbus_code = ov5645_enum_mbus_code,
 	.enum_frame_size = ov5645_enum_frame_size,
 	.get_fmt = v4l2_subdev_get_fmt,
-- 
2.53.0


