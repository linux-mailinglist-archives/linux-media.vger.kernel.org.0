Return-Path: <linux-media+bounces-1471-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A44DB800B29
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 13:39:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D462A1C20EDB
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 12:39:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DD0F25554;
	Fri,  1 Dec 2023 12:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="geK5fDe0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AF8F1B4;
	Fri,  1 Dec 2023 04:39:46 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6cde4abdc06so385060b3a.0;
        Fri, 01 Dec 2023 04:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701434386; x=1702039186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N43hwqTZKHanzUxHxh3RdBei5vKqq6OkL7nPoaO7H48=;
        b=geK5fDe0JGyiWGvI7ueHvz1p8gazw7hOYcXTXAwh7+GWz2jn6eiJmHHpICV0/NMjW0
         tGjHsVUq9dFRsOi375W5ShTmJQxRIG6BxssB3ZLMeBvtKFq+S33zaaFAMOM9tH4dEwKZ
         uZuScC0gE3xBg6YvJIbn8L+Oj2NUocyT1OM+DooaMaSFYvAAgwRBYX4k02BUqh/O6Pv3
         Bx4WKBSsrY3FPqGzK4c+3N2WAUrPrwjtcikJCEzRquTGlSryVmfddnjzPblNd8+G8z0L
         McWC+VLPt2TIiOdSwZG0oU/223g/O0BH6LmFvCW03Yx5W+KL+/JNu7N0q6GS/0MOJIIy
         Cpog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701434386; x=1702039186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N43hwqTZKHanzUxHxh3RdBei5vKqq6OkL7nPoaO7H48=;
        b=Jb8QRBCzUxR6+It8YP3fjtSTr2Yj1Qzzol9bU/tpxodhh8kg0gyxrfDwdatuo+i/0f
         J98FgiQdZbjxVDxqObI8o6WjShnVI8nbaRQUfxHSfH5YJdGD+dPFRFKr2UeApaN+NiCU
         Uh2dxE/P9mOSZFrsuHSITwaYhr4YuyF748TAdJJLQ3y1I9ce0k/ElTsidMl4IZ3Sca36
         5+LP2TXbl2AWkr0W6bRp2VbhxJTAycHU1Pb6/TPXovgUR/YDYket5eRgaFvPdtewR/uG
         3vIThlCpO89PphaOjtlbkmrkbtePZpd2YeHyOA4Cy4Y8iqhtOwIjGNK7sKYFLy14U8mU
         zqaQ==
X-Gm-Message-State: AOJu0Yxl69/d8DnyND3IjLdoQpQnyr9YWHep7GHQrKzNzZM08N5QXvrn
	fR8+Q7HdAMSBRf/51cqecgA=
X-Google-Smtp-Source: AGHT+IGWvtQghDY994aEJ+WCNsUHRzw1reHW9PX7alz7KaIjeVJh44ThlehqbM8iHeeP0jUCotyRaw==
X-Received: by 2002:a05:6a00:3904:b0:68e:2fd4:288a with SMTP id fh4-20020a056a00390400b0068e2fd4288amr29463502pfb.3.1701434385686;
        Fri, 01 Dec 2023 04:39:45 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:12b3:b1c7:121e:c465])
        by smtp.gmail.com with ESMTPSA id gx21-20020a056a001e1500b006930db1e6cfsm2896155pfb.62.2023.12.01.04.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 04:39:45 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: rfoss@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	mchehab@kernel.org,
	laurent.pinchart@ideasonboard.com,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	xji@analogixsemi.com,
	Fabio Estevam <festevam@denx.de>,
	Rob Herring <robh@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v2 2/3] media: dt-bindings: media: Introduce MEDIA_BUS_TYPE_DPI
Date: Fri,  1 Dec 2023 09:39:34 -0300
Message-Id: <20231201123935.1057929-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231201123935.1057929-1-festevam@gmail.com>
References: <20231201123935.1057929-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

Commit 18860529a599 ("media: dt-bindings: media: video-interfaces: Add
new bus-type") introduced a new bus-type for DPI video bus.

Introduce MEDIA_BUS_TYPE_DPI into video-interfaces.h to complete
the list of video interfaces.

Signed-off-by: Fabio Estevam <festevam@denx.de>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v1:
- Collected tags.

 include/dt-bindings/media/video-interfaces.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/media/video-interfaces.h b/include/dt-bindings/media/video-interfaces.h
index 68ac4e05e37f..0dace694a18f 100644
--- a/include/dt-bindings/media/video-interfaces.h
+++ b/include/dt-bindings/media/video-interfaces.h
@@ -12,5 +12,6 @@
 #define MEDIA_BUS_TYPE_CSI2_DPHY		4
 #define MEDIA_BUS_TYPE_PARALLEL			5
 #define MEDIA_BUS_TYPE_BT656			6
+#define MEDIA_BUS_TYPE_DPI			7
 
 #endif /* __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__ */
-- 
2.34.1


