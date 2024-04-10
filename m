Return-Path: <linux-media+bounces-9022-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC1E89F1FA
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 14:25:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDAFF1C21973
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 12:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA45E15DBAE;
	Wed, 10 Apr 2024 12:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DgKr42tu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C3615B15E
	for <linux-media@vger.kernel.org>; Wed, 10 Apr 2024 12:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712751884; cv=none; b=tE6DWX50X/aK/B0uz4s+9rb57JE7zS8cGeZEZGexwjSEg5Zz4T2CChqg/KI1DnOpEYlGHFyCzYuQ1ZM/9iHVkw5nhgFFBpHbrenKJryRkp15mdTFbHTdwa5zVtfCiyc3xBOdE5bLUqwqLZM4hoP8mzHNo+y88G8EidwURvV+D9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712751884; c=relaxed/simple;
	bh=tqy5RaJiXteDvdC/cyKO+b2613HwrFfwHfeUjkXSy8w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BrGRwm3IwDmF/Wa9ftHO7nZO7q5gXnlYIqvzCKWmoRYjnsDVcV4TsXrPLeCAu0CtASoSfBfIwC1lhwQhlgR0HIh2/1FjW/Y3zlOCWF0kc49cQ8GtbJ3pxHRKm+CiIHY03aifn6DG/DX+NYUgNTxG7Ds8K7qqnLNqM7eHjrm6JlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DgKr42tu; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-432c947e92eso63141881cf.0
        for <linux-media@vger.kernel.org>; Wed, 10 Apr 2024 05:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712751881; x=1713356681; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MfpAXz8Bcfy/TLkzFPLD2yYUR7bPCnwgt9TJrWa9s1U=;
        b=DgKr42tuIiVRjo3s/bmAVguAs4KQ8U0+lvepaCv2uiJcNXVIgBEpsbS7Y8Y9ytc7yJ
         shZi0m7M9iW/9pBYnSn6NfjjLyCd2jp9e3xttu4eoMGAnrINhIy/s0ncNDExPvyj9Zlm
         Qhq0YIcCcyslyR9ZSS2C7BTBSdin+Ql9f4exc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712751881; x=1713356681;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MfpAXz8Bcfy/TLkzFPLD2yYUR7bPCnwgt9TJrWa9s1U=;
        b=tMFtbg5rlqAcJpjocW0hwsG7ri0GJJ56UnOFGz3/gO3Yg5N94SxBcesLdS6sqXzptN
         cTTlXHx3aa0rS3RoSn6+vrgQcW+jO+tPbIEVsTXmfNSuWMZwN7Rv9GbuGXsf3gXTdmKX
         NwF82hlgGKEdEhoakJkup85Abi+obqzDfs5PdVUqJGBepdE5+Cpo3Ry7ggrOZ96EqcVp
         tB51et7fHz8AY9DIbddrh+VnkMXhGj+ncZcx4VEif36++Ioj1HSo7GVeUwGl4UwC6Cgt
         R/vsvf21P62Gl0dJeGOijdQ0zwD7KUTRkIAWwbWNihT2ICLYuVntOUC5tyYvK2bR81hK
         dwSw==
X-Forwarded-Encrypted: i=1; AJvYcCUjznBnJSmW7Pu8+5rhbI+IUeKO2PZY7NCiImRWz95+Brs/cmV/EiaV9pQ3pCSllTdLpzo2oNb/cr6XjuFN7j4b2HTrRQ/u6xUvFRA=
X-Gm-Message-State: AOJu0YyUEc3rAcYifSM20Mf/qJlFr1trVvzCqZn1QhMfIrSDAB6FaEsp
	Sdk85khShn21cWs7O4iusaKZn/2siaheeioz+69ArH2nyAnb7NZR/n5wG8xkPg==
X-Google-Smtp-Source: AGHT+IHniFHijne50ct4dDiCfXqrYaE0q7Ul3bSD5D/xopuvSqykSDUiWPdCd6gCi40hRkdVKi8rNg==
X-Received: by 2002:a05:622a:19a1:b0:434:6fee:5983 with SMTP id u33-20020a05622a19a100b004346fee5983mr8687083qtc.7.1712751881654;
        Wed, 10 Apr 2024 05:24:41 -0700 (PDT)
Received: from denia.c.googlers.com (188.173.86.34.bc.googleusercontent.com. [34.86.173.188])
        by smtp.gmail.com with ESMTPSA id jy14-20020a05622a818e00b00434ce53c664sm1921579qtb.80.2024.04.10.05.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 05:24:41 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 10 Apr 2024 12:24:39 +0000
Subject: [PATCH 3/3] media: videodev2: Fix v4l2_ext-control packing.
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240410-pack-v1-3-70f287dd8a66@chromium.org>
References: <20240410-pack-v1-0-70f287dd8a66@chromium.org>
In-Reply-To: <20240410-pack-v1-0-70f287dd8a66@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

The structure is packed, which requires that all its fields need to be
also packed.

./include/uapi/linux/videodev2.h:1810:2: warning: field  within 'struct v4l2_ext_control' is less aligned than 'union v4l2_ext_control::(anonymous at ./include/uapi/linux/videodev2.h:1810:2)' and is usually due to 'struct v4l2_ext_control' being packed, which can lead to unaligned accesses [-Wunaligned-access]

Explicitly set the inner union as packed.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 include/uapi/linux/videodev2.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 2663213b76a49..bf12860d570af 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1842,7 +1842,7 @@ struct v4l2_ext_control {
 		struct v4l2_ctrl_hdr10_cll_info __user *p_hdr10_cll_info;
 		struct v4l2_ctrl_hdr10_mastering_display __user *p_hdr10_mastering_display;
 		void __user *ptr;
-	};
+	} __attribute__ ((packed));
 } __attribute__ ((packed));
 
 struct v4l2_ext_controls {

-- 
2.44.0.478.gd926399ef9-goog


