Return-Path: <linux-media+bounces-11069-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C17888BE8E4
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 18:28:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 782FD2809DE
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 16:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8C6216D9A9;
	Tue,  7 May 2024 16:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QW9gJ5yp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E74116D308
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 16:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715099236; cv=none; b=uZIJAWLGb5QtWphr+xetThnGwO0YmaPuXn8um6Ox2XgE+TlRt1mTQSb7WapAwhEhBf4aZuJV9DW6IS1JrQkIyr0MLKA6k2wuAAtR5lXT2OROrQ3KNQ5cwNmrfS5B1QAF1ZRxtKKx/6xctmHJD4vVDIgd+Xyl37dcYeOq9wcrJJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715099236; c=relaxed/simple;
	bh=Ybzvge6Uw1Eh9FNqgRzW6qmy53LUrGIUlQOKIfHH8ug=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lPzm5zSZwNHUrUmAZmqR7XPEhHApCRvJJzJNmc4gni4dqI2QB4Ep6ENQ/5rT8oSDem2yi33ljKZNzdbEhHVOk+qQjShpXpjgHbvdXwa4wsTSnFmGePndFDVy8jhQBTVmEvWLPSStS5SB29w5FYdKE+9n8BxUJHRuHpsuvxUzNVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QW9gJ5yp; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-43ab76cac73so31118051cf.1
        for <linux-media@vger.kernel.org>; Tue, 07 May 2024 09:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715099233; x=1715704033; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yEp5ZozBkj0x9D1ws5SUxXE7DcMsbsSxhL1FOw8KqVY=;
        b=QW9gJ5ypl03UwodfkeFY8pxPS83KW6HL+RNZ95hB3frMgnXPejntZrrwmLsoZ6Irg3
         M+IJCLVXluMO9DWeHleoeguQlKPdg6CVYTYAb6OVQq+IkHkUH5R4c1bQYWj+UVegOOKy
         fzfiSQ6a58hSgddB5ZYYMrg4sKZYRfH+usGmk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715099233; x=1715704033;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yEp5ZozBkj0x9D1ws5SUxXE7DcMsbsSxhL1FOw8KqVY=;
        b=qPrrp7YaQVyI5lSNPg4VGFYMA6PJnwzgPOeAGNzixjyJdftHu8xevpAOEmlQF5tMTn
         WdcnDdrwgG+8ttXNGwgTvaVPWFH0GXWVZjh7I1KNvvWRdf8VXvK4fqGYGDIPrG+ZNO/F
         9sV13JD4vZ9ffGf9/RjyYSwFM1w7uabSIGQzpiOLQkCscyNwdOSFb0xlDKSWWMeHVDBR
         XbPD2xN4fILCbWGLz7z1hhQYMYuvNPqyuAQoUt5BOqHKwfjfrVregM0o+fjdwjeIFxJq
         hCTg7Hi2L4PORMABo1dhvIJhU0gu4NsfEzFDBZZdYFq8JFRIyLMq5DaC3D1enIziKJbO
         SOlg==
X-Gm-Message-State: AOJu0Yzb7HlZuVvd+xKcrJ1hNlaUWQHAjJKTHubQP9g0Q59GOaae/HW7
	jTMfIWWfPvsWqDgaruJVbJoVCU8asDgqYxrDDR+6xURWloJuypCg1ee2v8c7HQ==
X-Google-Smtp-Source: AGHT+IFG5P8cF3bvogi35ZVCCh3mpoFd/JBPtTJGyHj5A6ptYc39Pcqw/IlsAeEpo3GtlKvW+qflBQ==
X-Received: by 2002:ac8:5a15:0:b0:43b:16d1:a6ee with SMTP id d75a77b69052e-43d8f44bd11mr53130171cf.17.1715099233681;
        Tue, 07 May 2024 09:27:13 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id hf23-20020a05622a609700b0043d1fc9b7d9sm4160597qtb.48.2024.05.07.09.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 09:27:13 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 07 May 2024 16:27:10 +0000
Subject: [PATCH v2 05/18] media: pci: cx18: Use flex arrays for struct
 cx18_scb
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240507-cocci-flexarray-v2-5-7aea262cf065@chromium.org>
References: <20240507-cocci-flexarray-v2-0-7aea262cf065@chromium.org>
In-Reply-To: <20240507-cocci-flexarray-v2-0-7aea262cf065@chromium.org>
To: Michael Tretter <m.tretter@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>, Andy Walls <awalls@md.metrocast.net>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

Replace the old-style single element array with a flexible array.
This structure does not seem to be allocated in the code, so there is no
need to change anything else.

The following cocci warning is fixed:
drivers/media/pci/cx18/cx18-scb.h:261:22-29: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/cx18/cx18-scb.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/cx18/cx18-scb.h b/drivers/media/pci/cx18/cx18-scb.h
index f7105421dd25..841edc0712ab 100644
--- a/drivers/media/pci/cx18/cx18-scb.h
+++ b/drivers/media/pci/cx18/cx18-scb.h
@@ -258,7 +258,7 @@ struct cx18_scb {
 	struct cx18_mailbox  ppu2epu_mb;
 
 	struct cx18_mdl_ack  cpu_mdl_ack[CX18_MAX_STREAMS][CX18_MAX_MDL_ACKS];
-	struct cx18_mdl_ent  cpu_mdl[1];
+	struct cx18_mdl_ent  cpu_mdl[];
 };
 
 void cx18_init_scb(struct cx18 *cx);

-- 
2.45.0.rc1.225.g2a3ae87e7f-goog


