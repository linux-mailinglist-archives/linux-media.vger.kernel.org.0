Return-Path: <linux-media+bounces-40190-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6BAB2B232
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 22:17:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 80F3B563BD8
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 20:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8822B275869;
	Mon, 18 Aug 2025 20:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MJwKW3nC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE71225A3D
	for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 20:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755548145; cv=none; b=bP/796Uds5Kz08/C0c0nZMDSrWNY0q/2vMvWnGiDHJUkzNBslLmJulA6ayNiyBHcRwrXvodoYh7aYDxg4SamPO3wMCQ3+r5sH+qaLOQXzIq6fiFcY/TyupZZKssadEhTfR3+kFeBfNLTznvWfxNikyjb1Iv31SR3DtYYRg7A1ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755548145; c=relaxed/simple;
	bh=2p2FtkZ4Lnr9IlWB9wAFHpMJBW9ofPI2RfNGv3X02BE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FnRdo1tCvofLZM9XWEsV6vXRJSIkczKSSeVdaILqXqHpn9ixw7VKDwW8jC7K2VnSNSij6EOTD/8CpXpG2RT5hgoUWTw2P1yy8pkUXUJN94R1IthHtCIYs3OTrIvrf6q6kzrfYvP+NC+eIxkAvo9+aWBY9sOXOypDmd/E828DNPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MJwKW3nC; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-55ce5268cb8so4361809e87.2
        for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 13:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755548141; x=1756152941; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DLzqZRdyOLv8EDpzaUnt0Q4MFdVvX6ZyIG6yl0VPoqc=;
        b=MJwKW3nC5WAQCeoA87IfFmIEnX1LOg7Un3ZpZuJ/K49fBFHJGf8S5DChYqONTSOnlY
         hDJTmPwfUpw3ACmF0ztuB+ExZ/RpWxj5bwrELwNwuar3O2awYAYPCQ0LI8lVOl3fHJf5
         5mQAQRdX1uo+hbCNP0mJa0FCeRSbxo8TaVoCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755548141; x=1756152941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DLzqZRdyOLv8EDpzaUnt0Q4MFdVvX6ZyIG6yl0VPoqc=;
        b=Yl3VdXEyPsQkeOsmNxdsu7mVHdIWBxySxkyR0MYJDu8ZOZBlhWZShw1OGl0zdfgXG/
         rn5TOBaXY71tF/8y/Jvkbk3gzKulWPZr3YzaKte+/iyEVBnWb9Fs+JC1hbuwzYGNqRiP
         P87UeCGN+Ue9/yLxu03gIhiS/QQZlWPzz/nDmrPBr4QQSr7WkkEELdxXbb7+PddVYaYy
         ZydRJUpe4m34ZbEvbNUu5nnhc2Km8NBW4HsDnUHup6/pYGQmgOwpt1qlHZfVFh5fXpNt
         RCrk63EC3ZubsR4KYO8X3OkJfrgIhSDH6A4lmU/F+fBnT1UaHBUO4ffOw8RGN6NUIh9t
         Xnpw==
X-Gm-Message-State: AOJu0Yz5dD64wKFj+qEkznVvkcCU4Ew7TSYhgc7cUL2WLsNdsXuZxAwe
	XRzYheDYaPcIIv7/jxB22lUKpyMUiZ0t2j8BRRybTzhPERLY4Epdi1hXkdZOH8xyng==
X-Gm-Gg: ASbGnct1UrgZpbh3mOLEWpYMazC9Rk9QM8W6B+cDEUgCcRi6lApCOq6GGhw3884R2bn
	DFSRyVtJCh2nOM+kL/pN8tBnK6GZT2HUW24WoxeNuAjJdWuHUngZjZUEUIBKiwirot1W0VB2inI
	KgwUCov4MVnM7hvLzYJ05Elt0jG1kuIibLnn7lc02pAGRUpUVWgzIDSbrail/zDUG+PGe76G5pv
	uKG2zI2QFOFxoNdqXUeRzFVV9G3rGBB+EgT5sh5kGF4JD5r9Msy8ESz+PNnHk3+kRPMhRSHw3yn
	pRhtSsVDhwNJvwE3O1f3eJ+iFs2b1Cta+aQ+ZRWs19mk2xHdo845iYMHUg8FTJgFJ35KF6qoTZQ
	GsKPvRP7H0uy3kPm/IxdSqaIcEG/7lV0TvCaTivJoBYEGkBULhsdndlqoHaMU8e7OHllpVCz2jY
	w=
X-Google-Smtp-Source: AGHT+IHomcZrlLRv3tAqMDJkW/VO0hvBuw4jaQNof58elMwk6nl++cYJMU4IoI47742CxSR4XiYzsg==
X-Received: by 2002:a05:6512:2348:b0:55c:e752:e9c5 with SMTP id 2adb3069b0e04-55e007512d8mr55584e87.7.1755548141083;
        Mon, 18 Aug 2025 13:15:41 -0700 (PDT)
Received: from ribalda.c.googlers.com (237.65.88.34.bc.googleusercontent.com. [34.88.65.237])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3f3476sm1789268e87.107.2025.08.18.13.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 13:15:40 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 18 Aug 2025 20:15:38 +0000
Subject: [PATCH 3/4] media: uvcvideo: Run uvc_ctrl_init_ctrl for all
 controls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250818-uvc-iq-switch-v1-3-f7ea5e740ddd@chromium.org>
References: <20250818-uvc-iq-switch-v1-0-f7ea5e740ddd@chromium.org>
In-Reply-To: <20250818-uvc-iq-switch-v1-0-f7ea5e740ddd@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

The function uvc_ctrl_init_ctrl() is called for every control for every
entity, but it exits early if the entity is a extension unit. The comment
claims that this is done to avoid querying XU controls during probe.

We only query a control if its entity GUIDs and index matches the
uvc_ctrls list. There are only controls for the following GUIDs:
UVC_GUID_UVC_PROCESSING, UVC_GUID_UVC_CAMERA and
UVC_GUID_EXT_GPIO_CONTROLLER.

In other words, XU controls will not be queried even without this
condition.

In future patches we want to add ChromeOS XU controls that need to the
initialized. We will make sure that all cameras with ChromeOS XU can
be queried at probe time.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index efe609d7087752cb2ef516eef0fce12acd13e747..ff975f96e1325532e2299047c07de5d1b9cf09db 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -3181,15 +3181,6 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
 {
 	unsigned int i;
 
-	/*
-	 * XU controls initialization requires querying the device for control
-	 * information. As some buggy UVC devices will crash when queried
-	 * repeatedly in a tight loop, delay XU controls initialization until
-	 * first use.
-	 */
-	if (UVC_ENTITY_TYPE(ctrl->entity) == UVC_VC_EXTENSION_UNIT)
-		return;
-
 	for (i = 0; i < ARRAY_SIZE(uvc_ctrls); ++i) {
 		const struct uvc_control_info *info = &uvc_ctrls[i];
 

-- 
2.51.0.rc1.167.g924127e9c0-goog


