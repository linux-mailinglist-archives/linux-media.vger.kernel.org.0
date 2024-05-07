Return-Path: <linux-media+bounces-11053-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D07018BE7F9
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 17:57:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C9661B209AB
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 15:57:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D08F16D32D;
	Tue,  7 May 2024 15:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rSUoQwBr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D39F16D32F
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 15:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715097326; cv=none; b=cqISIJt/dmiRgpT+sNou5dDIAg+G+iJBZABxJ35AK33FpUPQAzXeK6PIxYXKDQSKFbcKc1KbOg4D34ugxyDoAxqnA9RtUTyz3h/lh+CmcESVwcCvTLcKsOA6/oGSWo50ObGvGsSj0LafDZEgDQKlgIofn9HL0zJLjP3XlPkLFPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715097326; c=relaxed/simple;
	bh=XHUDN2VI7MLg/CxYWpMrE4fMasb8Fe9kDfLMNRGc7jU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hXgymTUIyR/ZSoW83p2tLWjKFeJUatb3TRH5dtvi1Rz29gAzfWMqkri2NGj1+FmBVIjCvQiwDrue1F1XfTIFe7+UKX5SMLruXbUVtL9Pczt8vvWK7dUiSsJ1gc4IAy1Ta+pfva9oe3+vh2kqErH+hv0a5qVdSA2tWNDkl/1qoOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--panikiel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rSUoQwBr; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--panikiel.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-41dc9c831acso28260575e9.0
        for <linux-media@vger.kernel.org>; Tue, 07 May 2024 08:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715097323; x=1715702123; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KogNzHA8DNUq5qVErfyTruPa2HrDq2ZydyrNVBz6ZGM=;
        b=rSUoQwBreLtUFrMSh6I0JJI6c5XcJgsQGbbXgSgWqn7Ce2V4l4dRqaufMjfBhGKjh6
         J13oaxtKFT9HSpdushKPIdYuSp0EL+cvqLYM8WAzFFxPqZkK3Yrm8DJbpTvJ6NUJi/4n
         /7fsZiu+nOnc9o6a81nkAr+/3QPg1NwxTKkkJt3b7Bncrg64iLhXnVjRsRyXC/G+2Rkn
         Aa4zFF2FhK0tSeek9kdnROw1kwWT22eo9LI2dCrjKaN9EcJ8EpaihwhMH4SQbAPgdr5N
         asQJrc5IwBm+XuPwNAQaqMY8X3yLF3J+WCELULAq01h3BaOVoYBaThvwvkqti40PEPuH
         vinQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715097323; x=1715702123;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KogNzHA8DNUq5qVErfyTruPa2HrDq2ZydyrNVBz6ZGM=;
        b=Yh7vt+JpyXFeHUKMvLAWZPxC1utECm7H0YZXxQ9xHK0UTP2idPzdt7ssVCWWdryGHH
         hpnSrSINw5+q6bXkwj0IaEP7da5NaIVN4iyB0ali+vP3UvtvxYcEUTjH6HaJf/0BV5Tr
         3FCpNrcGHCrd/kh0hCo4QLG/If4Yec3PwljYU+roRQCNj+xhjWeGyt5SJx9kK9cTC6NO
         fMp9q2+3H3VhbQ0P0u/9Zdryjcwovdowe4BzHhL8xYWt6V0yyMaIO/aHjju5DPOQRzpF
         DKSZDERBYAHrXPUka7J5MQrdTSKXW6CTeUGv5jdSdOFwvx2Z1t1+UVa9RGFPxFhwrvVl
         /TRQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+xz0/lNoiDzysKcdMy0h+oU6Dq7yeEw6Z5L1BUNIiPmixC9vaTXqt8RObOHMYoJOFZChj6o6SmDbiiamspoPH7sUOQ+aTN1/ISZ4=
X-Gm-Message-State: AOJu0YzDD10sRV2+6e7ELUNf58t/JCc0TITj8Av8wSx4f7vo5gqiEcdv
	db0LsOtZLbDb3FM8FyVQKflGrT3zW1eoO0KNo2T5jaD5qQKsN+E/jIdb+yY4RK5pHnZFcR5cKqv
	7/w/+PsgGSQ==
X-Google-Smtp-Source: AGHT+IGDg7S/ue235EfhlQUzDC/L5iFA57uekVNXwTOfcB0fO9I1mzuwv8vAyKMuJbKe/pE9JwRfCzdMS/2g1g==
X-Received: from szatan.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:2d83])
 (user=panikiel job=sendgmr) by 2002:a05:600c:4305:b0:41b:d9c8:5c19 with SMTP
 id 5b1f17b1804b1-41f2db247b5mr326195e9.2.1715097322908; Tue, 07 May 2024
 08:55:22 -0700 (PDT)
Date: Tue,  7 May 2024 15:54:09 +0000
In-Reply-To: <20240507155413.266057-1-panikiel@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240507155413.266057-1-panikiel@google.com>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
Message-ID: <20240507155413.266057-7-panikiel@google.com>
Subject: [PATCH v3 06/10] media: v4l2-mediabus: Add support for DisplayPort
 media bus
From: "=?UTF-8?q?Pawe=C5=82=20Anikiel?=" <panikiel@google.com>
To: airlied@gmail.com, akpm@linux-foundation.org, conor+dt@kernel.org, 
	daniel@ffwll.ch, dinguyen@kernel.org, hverkuil-cisco@xs4all.nl, 
	krzysztof.kozlowski+dt@linaro.org, maarten.lankhorst@linux.intel.com, 
	mchehab@kernel.org, mripard@kernel.org, robh+dt@kernel.org, 
	tzimmermann@suse.de
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	chromeos-krk-upstreaming@google.com, 
	"=?UTF-8?q?Pawe=C5=82=20Anikiel?=" <panikiel@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Add new definitions, a config struct, and a parser for the DisplayPort
media bus.

Signed-off-by: Pawe=C5=82 Anikiel <panikiel@google.com>
---
 drivers/media/v4l2-core/v4l2-fwnode.c | 38 +++++++++++++++++++++++++++
 include/media/v4l2-fwnode.h           |  5 ++++
 include/media/v4l2-mediabus.h         | 17 ++++++++++++
 3 files changed, 60 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-cor=
e/v4l2-fwnode.c
index 89c7192148df..49ea4d264eb2 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -67,6 +67,10 @@ static const struct v4l2_fwnode_bus_conv {
 		V4L2_FWNODE_BUS_TYPE_DPI,
 		V4L2_MBUS_DPI,
 		"DPI",
+	}, {
+		V4L2_FWNODE_BUS_TYPE_DISPLAYPORT,
+		V4L2_MBUS_DISPLAYPORT,
+		"DisplayPort",
 	}
 };
=20
@@ -417,6 +421,33 @@ v4l2_fwnode_endpoint_parse_csi1_bus(struct fwnode_hand=
le *fwnode,
 		vep->bus_type =3D V4L2_MBUS_CSI1;
 }
=20
+static int
+v4l2_fwnode_endpoint_parse_dp_bus(struct fwnode_handle *fwnode,
+				  struct v4l2_fwnode_endpoint *vep,
+				  enum v4l2_mbus_type bus_type)
+{
+	struct v4l2_mbus_config_displayport *bus =3D &vep->bus.displayport;
+	u32 array[4];
+	int count;
+	int i;
+
+	count =3D fwnode_property_count_u32(fwnode, "data-lanes");
+	if (count < 0)
+		return count;
+	if (!(count =3D=3D 1 || count =3D=3D 2 || count =3D=3D 4))
+		return -EINVAL;
+	fwnode_property_read_u32_array(fwnode, "data-lanes", array, count);
+
+	for (i =3D 0; i < count; i++)
+		bus->data_lanes[i] =3D array[i];
+	bus->num_data_lanes =3D count;
+	bus->multi_stream_support =3D fwnode_property_present(fwnode, "multi-stre=
am-support");
+
+	vep->bus_type =3D V4L2_MBUS_DISPLAYPORT;
+
+	return 0;
+}
+
 static int __v4l2_fwnode_endpoint_parse(struct fwnode_handle *fwnode,
 					struct v4l2_fwnode_endpoint *vep)
 {
@@ -482,6 +513,13 @@ static int __v4l2_fwnode_endpoint_parse(struct fwnode_=
handle *fwnode,
 		v4l2_fwnode_endpoint_parse_parallel_bus(fwnode, vep,
 							vep->bus_type);
=20
+		break;
+	case V4L2_MBUS_DISPLAYPORT:
+		rval =3D v4l2_fwnode_endpoint_parse_dp_bus(fwnode, vep,
+							 vep->bus_type);
+		if (rval)
+			return rval;
+
 		break;
 	default:
 		pr_warn("unsupported bus type %u\n", mbus_type);
diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
index f7c57c776589..777a61015ca0 100644
--- a/include/media/v4l2-fwnode.h
+++ b/include/media/v4l2-fwnode.h
@@ -36,6 +36,8 @@
  * @bus.mipi_csi2: embedded &struct v4l2_mbus_config_mipi_csi2.
  *		   Used if the bus is MIPI Alliance's Camera Serial
  *		   Interface version 2 (MIPI CSI2).
+ * @bus.displayport: embedded &struct v4l2_mbus_config_displayport.
+ *		     Used if the bus is VESA DisplayPort.
  * @link_frequencies: array of supported link frequencies
  * @nr_of_link_frequencies: number of elements in link_frequenccies array
  */
@@ -46,6 +48,7 @@ struct v4l2_fwnode_endpoint {
 		struct v4l2_mbus_config_parallel parallel;
 		struct v4l2_mbus_config_mipi_csi1 mipi_csi1;
 		struct v4l2_mbus_config_mipi_csi2 mipi_csi2;
+		struct v4l2_mbus_config_displayport displayport;
 	} bus;
 	u64 *link_frequencies;
 	unsigned int nr_of_link_frequencies;
@@ -166,6 +169,7 @@ struct v4l2_fwnode_connector {
  * @V4L2_FWNODE_BUS_TYPE_PARALLEL: Camera Parallel Interface bus
  * @V4L2_FWNODE_BUS_TYPE_BT656: BT.656 video format bus-type
  * @V4L2_FWNODE_BUS_TYPE_DPI: Video Parallel Interface bus
+ * @V4L2_FWNODE_BUS_TYPE_DISPLAYPORT: DisplayPort bus
  * @NR_OF_V4L2_FWNODE_BUS_TYPE: Number of bus-types
  */
 enum v4l2_fwnode_bus_type {
@@ -177,6 +181,7 @@ enum v4l2_fwnode_bus_type {
 	V4L2_FWNODE_BUS_TYPE_PARALLEL,
 	V4L2_FWNODE_BUS_TYPE_BT656,
 	V4L2_FWNODE_BUS_TYPE_DPI,
+	V4L2_FWNODE_BUS_TYPE_DISPLAYPORT,
 	NR_OF_V4L2_FWNODE_BUS_TYPE
 };
=20
diff --git a/include/media/v4l2-mediabus.h b/include/media/v4l2-mediabus.h
index 5bce6e423e94..74b5d96f5050 100644
--- a/include/media/v4l2-mediabus.h
+++ b/include/media/v4l2-mediabus.h
@@ -120,6 +120,18 @@ struct v4l2_mbus_config_mipi_csi1 {
 	unsigned char clock_lane;
 };
=20
+/**
+ * struct v4l2_mbus_config_displayport - DisplayPort data bus configuratio=
n
+ * @data_lanes: an array of physical data lane indexes
+ * @num_data_lanes: number of data lanes
+ * @multi_stream_support: multi stream transport support
+ */
+struct v4l2_mbus_config_displayport {
+	unsigned char data_lanes[4];
+	unsigned char num_data_lanes;
+	bool multi_stream_support;
+};
+
 /**
  * enum v4l2_mbus_type - media bus type
  * @V4L2_MBUS_UNKNOWN:	unknown bus type, no V4L2 mediabus configuration
@@ -131,6 +143,7 @@ struct v4l2_mbus_config_mipi_csi1 {
  * @V4L2_MBUS_CSI2_DPHY: MIPI CSI-2 serial interface, with D-PHY
  * @V4L2_MBUS_CSI2_CPHY: MIPI CSI-2 serial interface, with C-PHY
  * @V4L2_MBUS_DPI:      MIPI VIDEO DPI interface
+ * @V4L2_MBUS_DISPLAYPORT: DisplayPort interface
  * @V4L2_MBUS_INVALID:	invalid bus type (keep as last)
  */
 enum v4l2_mbus_type {
@@ -142,6 +155,7 @@ enum v4l2_mbus_type {
 	V4L2_MBUS_CSI2_DPHY,
 	V4L2_MBUS_CSI2_CPHY,
 	V4L2_MBUS_DPI,
+	V4L2_MBUS_DISPLAYPORT,
 	V4L2_MBUS_INVALID,
 };
=20
@@ -159,6 +173,8 @@ enum v4l2_mbus_type {
  * @bus.mipi_csi2: embedded &struct v4l2_mbus_config_mipi_csi2.
  *		   Used if the bus is MIPI Alliance's Camera Serial
  *		   Interface version 2 (MIPI CSI2).
+ * @bus.displayport: embedded &struct v4l2_mbus_config_displayport.
+ *	    Used if the bus is VESA DisplayPort interface.
  */
 struct v4l2_mbus_config {
 	enum v4l2_mbus_type type;
@@ -166,6 +182,7 @@ struct v4l2_mbus_config {
 		struct v4l2_mbus_config_parallel parallel;
 		struct v4l2_mbus_config_mipi_csi1 mipi_csi1;
 		struct v4l2_mbus_config_mipi_csi2 mipi_csi2;
+		struct v4l2_mbus_config_displayport displayport;
 	} bus;
 };
=20
--=20
2.45.0.rc1.225.g2a3ae87e7f-goog


