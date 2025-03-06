Return-Path: <linux-media+bounces-27730-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEC4A54F97
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 16:51:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 475103B1595
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 15:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C05EE21170B;
	Thu,  6 Mar 2025 15:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WVDUjOpP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE63920F071
	for <linux-media@vger.kernel.org>; Thu,  6 Mar 2025 15:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741276269; cv=none; b=kr0r8LuKEVAhd/Zm6ybpMAi3C6DWqg8Keh9GbHMZcvqKTgsDEDIG6Hg55T/6+9IVVlCA0GqgDkk7327Whja08lU8Fg1bAfEqQkLBZWn5GBD8ZpsLAJjy7xSWp0ubhc5UzBUluV5KuTBzKAhVyRrT+p9yJuLPq4+YDby8rqBR6h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741276269; c=relaxed/simple;
	bh=5mF3yhDyZ984uk7RoubZ8XpqAlVSm925HnRSq7bds3U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hoeZVlA+A5gZl/6isGlfBuNcjyubf6g2DgBTq50EZZY9qLaasX7uthqe3knq99608n5+GdSEJH1rdNH43N1x6NwJqpl1yETA29zeHYChwzWL5CS0gu8DCZ37p6FaOcuPgI6a8IA0RYAplOlKvp2KJcucG6t4s1kduZTAwbKy4bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WVDUjOpP; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c3cb761402so152998585a.0
        for <linux-media@vger.kernel.org>; Thu, 06 Mar 2025 07:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741276266; x=1741881066; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UsSa+JKj39pPYtX0boTlbPBxfwuId0RpTAo3OqB6/1I=;
        b=WVDUjOpPVh5KRC0KgWjNjz0yWUGdPHhkjfbsVvYKQMo1+rqxJmyVZZjw38XSHGRDCw
         B7lawyk6dQVpLqBqvRtPPJxy4Ud1dg1ebVd8pi/8vkgUCE/wMf0/4uFfPBrsCnfBYUze
         GRyf9XoLbrTGNCQYYKJ1e+px+3Exo2dJX4Pq4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741276266; x=1741881066;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UsSa+JKj39pPYtX0boTlbPBxfwuId0RpTAo3OqB6/1I=;
        b=RuF/GzNsVuYK4tZLCla/QNz7dF0ZZvCddnirvQbvHGwBDS1ERoPJZ1G4UysVRhoLb2
         RdJRAwJVMMe5NSkG/a0uAxYW7C9LnBUfHVFEYAUJhx9IuF7RDsnv7SIi/VVQbJSFO2E8
         0KxRPDBtfZNskoZaNIG87hJZyYG61AinYZvrcPhoGchkKIy03y+hGwieMr1+R4GK2rT8
         v5Zlg7iOXtwAwJZmDB0M7LcnUauqraGS2RcF2Qn7z0LucRdMAfWrboD/cDM6PMPVu068
         Dq52XOCfS4xxuodmUvUYeQB+jialb5Tkj+U0GbFHbc22enrMJMHHB8S5wkn1dQ71Ow/X
         Mm4Q==
X-Gm-Message-State: AOJu0YyRXQRJbZXdhdwWgJBt2MPQ2ury805c5WefjsfTUB6+J+pMa1wd
	iEhABGiWFe0XftjKDgiu04hSgngSPUy9k63VNRDpACvhZzqZ00EnEFElx0kdBGhwvrYAz/8YbEo
	=
X-Gm-Gg: ASbGncukG2qcvA+Kj5Dk4dBQwA9TSQln3W5sQewcf+brd3XZsTQZ+lE1v+ZoRBsmtIX
	qOS07Sbsrb3DfAP0IYo9ZLRqG8sVQBRji2WizR1tZE52A5mXu/jBuFJrO2X6VOj1V508hkR9Kro
	wIQM49kmfUPufY00teKGNhtoe52KZrbA4pLWjSFiLVv5pmOd7HNhYpVcUahUcprJgeJPaD+BU4q
	rm7pv4KEIMVg64Trz6PLVIjOwg5TJjK1ACYUYSR8vs6NztemZLAbJIRh2Sguvr+bc71Bq/sVuDe
	x8R3Xai+q43w4JhzsaAVmdhqdocmgd62+696vTCDA39Y1WjhX/VmzqgS4zq04Ol25frKJrdEgAi
	t/ZXlyTaYVZJ4zYfaelYkog==
X-Google-Smtp-Source: AGHT+IGaPRp7BfTuXVNq9ubOX42+gm3iaTgGnD/JJ/jx8dRs5bQKTPSsb/pvVPIVVzCwTG0KQvOkSg==
X-Received: by 2002:a05:620a:2813:b0:7c3:d266:334f with SMTP id af79cd13be357-7c3d8e797b7mr1109333085a.38.1741276266339;
        Thu, 06 Mar 2025 07:51:06 -0800 (PST)
Received: from denia.c.googlers.com (15.237.245.35.bc.googleusercontent.com. [35.245.237.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c3e533a1a1sm106257585a.6.2025.03.06.07.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 07:51:05 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 06 Mar 2025 15:51:02 +0000
Subject: [PATCH v2 2/3] media: Documentation: Add note about UVCH length
 field
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-uvc-metadata-v2-2-7e939857cad5@chromium.org>
References: <20250306-uvc-metadata-v2-0-7e939857cad5@chromium.org>
In-Reply-To: <20250306-uvc-metadata-v2-0-7e939857cad5@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

The documentation currently describes the UVC length field as the "length
of the rest of the block", which can be misleading. The driver limits the
data copied to a maximum of 12 bytes.

This change adds a clarifying sentence to the documentation to make this
restriction explicit.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 Documentation/userspace-api/media/v4l/metafmt-uvc.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/metafmt-uvc.rst b/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
index 784346d14bbdbf28348262084d5b0646d30bd1da..42599875331c0066cf529153caccb731148023b9 100644
--- a/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
+++ b/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
@@ -44,7 +44,9 @@ Each individual block contains the following fields:
         them
     * - :cspan:`1` *The rest is an exact copy of the UVC payload header:*
     * - __u8 length;
-      - length of the rest of the block, including this field
+      - length of the rest of the block, including this field. Please note that
+        regardless of the this value, for V4L2_META_FMT_UVC the kernel will
+        never copy more than 2-12 bytes.
     * - __u8 flags;
       - Flags, indicating presence of other standard UVC fields
     * - __u8 buf[];

-- 
2.48.1.711.g2feabab25a-goog


