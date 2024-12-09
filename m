Return-Path: <linux-media+bounces-22958-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61ED09E9F79
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 20:26:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ADE5D166490
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 19:26:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25464199E89;
	Mon,  9 Dec 2024 19:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iIu4JGBY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2186619884B
	for <linux-media@vger.kernel.org>; Mon,  9 Dec 2024 19:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733772339; cv=none; b=KwyACy9L2jDYw4vNDjQTlhV1KGopur5Td0JYlVg92i5+zDqwyTfZWV/8X8vrTFN4sgTFmhHkgvKwdaYRqBZORUtb2tDJC947/SMovjgo0frGxt0dH8xwHGyY+JhkATKlcoQuWP9aXV26NLmz5dSl53v7op/ffKJWgSEc/U6N/VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733772339; c=relaxed/simple;
	bh=QTPQ1DyM59FTFwoOCCInfTij+St4lWshfJMO2MNF9Jk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oBidjE4byME47WY7Tsv6hR7z77xPrEH4YgQaiTrQeBTtiV74TYhNsgHQD/CeLfDex+v56inFjZG8yu0Hf82KD37dL4b9PxcQ9E44SuXKCG6KTrLpAu0l+yOSvAE5sUF2U69JBYfpTJnnHsUU4j0u4mEEkulyO051zfHUCzaZlmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iIu4JGBY; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6d8d44e177cso44947146d6.1
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2024 11:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733772337; x=1734377137; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ldrzuJki4Bob493jggNorXy/00Sxo1CNpTeJmfaThng=;
        b=iIu4JGBYFJSNofCrIrysiSZl9FgvesfdhxENnmlefDM0UeeFchhFDA+My5CX+z4pPA
         8Zf9kWY7mboSXqHCRLZ2PIgXIPg+3yZoswhJg0+HvcNkQ69et2SO2G7mvcfZQFjQH0kz
         HVaJ7aWizBd2cQsYf5o627aVW51ZCCx5/WR9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733772337; x=1734377137;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ldrzuJki4Bob493jggNorXy/00Sxo1CNpTeJmfaThng=;
        b=K0p8VGtzoHlj93aW4ZVy/fHObpyUArkyJaGUXwNlUhiU8RFacsFbG92pO8FLwaXMeT
         8Cd8QJnsF5Xy2aRbYJ5CHHSpey5Qgwjm0afRmQze1vutyIyJSTzO7+XVh/jysdR8HuM4
         fiv3FURRKCDNubbkN+gNsRiaMlAHo52FqCAJkIU3JtmfCeW341CrU3uT04dTXtNBeNps
         EmFu5ZVQxwEWQa1/ovNkf4ny2larTUXCnXWiXiM2W1sz6Ka/rZPtkOYrRoYqrd3m+qpa
         qa9KmEwOEqq9kj9ssSSRNcku+CL2BX2tw02KGWF1CwTRLgyJBemFXyMFi0L8oHMKTKt5
         gtuA==
X-Gm-Message-State: AOJu0YzOdVZdUmmCqupDH7VVgRGQ4cWqTrzgo1nx26s9K1E22j9U+rls
	yQYhdizgsE5/kRoXwbx1mGA3Jimxqh2Ui0G87D7F5lQ1FRPzyJJLjDFWN9Lnrw==
X-Gm-Gg: ASbGnctwxY+olJJt2MKfDfbtAmOPirjPXvUH+2q70N6DkzxQ57b7dN/gU+yFs8qhrZi
	/jBR03eUTwl3tOr7UZvHAw6ej1ZhTmGk4YQ9i4xkUyRW9utokTYiHc5pPM1IT51HLg3o6/UnEYF
	yzhI2K/WCfXMJ6EbsJq+DfKmHErTYs79airgz+vGo2m4cMiRKxHtWZVNRDzxPRdBoNGNtVuRwo0
	CHyZK3QXf+6obKuKC6/M/e7SeElrcrrw6pEQEj0vtwHA6cudKaSc9rZM7aDutFlCoo3+YbuMqwK
	ZTO4DZwYKughI20xEyy3qfTk
X-Google-Smtp-Source: AGHT+IFHW0/0qUHG8qwMzURyamcTUPmaaCxTzs+9Cce4VEgPbFPUYI69YdWNaUrMvMWP46LE5wus3A==
X-Received: by 2002:a05:6214:27c2:b0:6d9:1532:d8fc with SMTP id 6a1803df08f44-6d9212c7c65mr9382816d6.11.1733772337147;
        Mon, 09 Dec 2024 11:25:37 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b6cc1cf6fesm217433385a.102.2024.12.09.11.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 11:25:36 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 09 Dec 2024 19:25:34 +0000
Subject: [PATCH 03/10] media: pvrusb2: Remove g/s_ctrl callbacks
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241209-queryctrl-v1-3-deff7acfcdcb@chromium.org>
References: <20241209-queryctrl-v1-0-deff7acfcdcb@chromium.org>
In-Reply-To: <20241209-queryctrl-v1-0-deff7acfcdcb@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Mike Isely <isely@pobox.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

The ioctl helpers can emulate g/s_ctrl with g/s_ext_ctrl. Simplify the
code.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/pvrusb2/pvrusb2-v4l2.c | 27 ---------------------------
 1 file changed, 27 deletions(-)

diff --git a/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c b/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
index 7c8be6a0cf7c..ad38e1240541 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
@@ -574,31 +574,6 @@ static int pvr2_querymenu(struct file *file, void *priv, struct v4l2_querymenu *
 	return ret;
 }
 
-static int pvr2_g_ctrl(struct file *file, void *priv, struct v4l2_control *vc)
-{
-	struct pvr2_v4l2_fh *fh = file->private_data;
-	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
-	int val = 0;
-	int ret;
-
-	ret = pvr2_ctrl_get_value(pvr2_hdw_get_ctrl_v4l(hdw, vc->id),
-			&val);
-	vc->value = val;
-	return ret;
-}
-
-static int pvr2_s_ctrl(struct file *file, void *priv, struct v4l2_control *vc)
-{
-	struct pvr2_v4l2_fh *fh = file->private_data;
-	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
-	int ret;
-
-	ret = pvr2_ctrl_set_value(pvr2_hdw_get_ctrl_v4l(hdw, vc->id),
-			vc->value);
-	pvr2_hdw_commit_ctl(hdw);
-	return ret;
-}
-
 static int pvr2_g_ext_ctrls(struct file *file, void *priv,
 					struct v4l2_ext_controls *ctls)
 {
@@ -817,8 +792,6 @@ static const struct v4l2_ioctl_ops pvr2_ioctl_ops = {
 	.vidioc_streamoff		    = pvr2_streamoff,
 	.vidioc_query_ext_ctrl		    = pvr2_query_ext_ctrl,
 	.vidioc_querymenu		    = pvr2_querymenu,
-	.vidioc_g_ctrl			    = pvr2_g_ctrl,
-	.vidioc_s_ctrl			    = pvr2_s_ctrl,
 	.vidioc_g_ext_ctrls		    = pvr2_g_ext_ctrls,
 	.vidioc_s_ext_ctrls		    = pvr2_s_ext_ctrls,
 	.vidioc_try_ext_ctrls		    = pvr2_try_ext_ctrls,

-- 
2.47.0.338.g60cca15819-goog


