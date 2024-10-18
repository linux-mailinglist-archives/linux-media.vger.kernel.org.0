Return-Path: <linux-media+bounces-19877-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 97ADA9A3FFF
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 15:39:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C632F1C247D7
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 13:39:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ADB220492A;
	Fri, 18 Oct 2024 13:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YOvObG/p"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F27204084;
	Fri, 18 Oct 2024 13:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729258518; cv=none; b=Hl4iH38nYxGNzNv3Zt1Vd4ZlBWaPYypUcTo9v5oa0J7EPUGV7oMfkpiZPvxOV5IAcd2NUQmMqHZU43NQIRl4wVAxRAXYKWmCEWI05tGZdTPEdMnr/xcBDsE2vsxIMh78YhvllU08rFKFfzRSjJQiJFgB0qVJSZkx2/W6zoBrbJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729258518; c=relaxed/simple;
	bh=PHRKf7x6L1ASM8G3srDIcBNdp5OhV2Njq3EqPXHRcho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aA1wWnc/1fvka1Fd/59RaGiliCIvK9g3yyER7LQZp78JlfpqOd2LeDNw6eGBpwfdW9hducDOxrC7NrO6GXPqglhfpQp1OCpVU2pwq6KGon5WZUHfa4TSmfb69BZziYeXJNBYysm4RA1znzRbsWDvRcXyv467tpWcX26YowzvVCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YOvObG/p; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4315f24a6bbso11993365e9.1;
        Fri, 18 Oct 2024 06:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729258515; x=1729863315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+msqcCV32I7SF5lf57WZeKZsQ3gqFv9ozYk9tMSxqs=;
        b=YOvObG/pEcxEeIImcO0XRuWSI5TErK31TkjCprqhttt3vka/hpdCyv90ZgeFnrAywW
         xntsFcBV+MRG6Wyoc3sILwXrtrCmeOTlRFLOUt2KREgPgfvl4i+TcEgsdzolPhdKEjqQ
         wTcMhaXAI1IAWpzT/o0+XqiLIBKTXk87lAu5S7OedCwx+4L2BRuGN8zahZ9uA9oGGXiX
         8EgiHVCI7Uk2yqzJOBosoX6AjYewCsiRfgA0zzJ+F8lSOVFlZpL3WMrAxUszzJ1ePV0l
         kbzwUa3MPoLm518h5v7N+ka3cs/UXOb18wzU6T1fz0Wep72Wng3FREsfrwjiPqbBWxrz
         MbIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729258515; x=1729863315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N+msqcCV32I7SF5lf57WZeKZsQ3gqFv9ozYk9tMSxqs=;
        b=O8ldYCeVTK34dlSpwUmj2AYNIjoZj6HlZtA74nOd4/tC7TsEoVS25bSYZFJI26usvK
         Nja3NoWXVirYdzJeQY99szDFx3M5EK2Nr/HeDZ9rwer3huF1u4xYKCmdjr5OELZMBOeF
         yq6U1PLxbJFFSkd5Q8xE/gLhADCQm/paGR7nz8yXOS9eJXxTz5VYgGnWWp6eyVw/Qu26
         7imfkHxQRMCB80afHjpjePxiTk23/bbChaWgFjLpnbWR6DSFKOF+HHHSUyCc0zspX7fI
         NXDVrNri49DpCAVdY+McsvNce86WsWUt2wU7IGHKiBvnwZOKIaCKUFCHwemGQkgFeDW+
         grPA==
X-Forwarded-Encrypted: i=1; AJvYcCUUWjq0sD58oP2wmayfwDayLzpnxPPEo8oCcrCT2vkHnBMJYV8Tu7bStAupotuLGrCV9Gw8rFPSybDmKPU=@vger.kernel.org, AJvYcCVePbdJhEg42KLN15AcQjtLirFH11OYVTY60wEn/CLkhd1gQG2LzJJbWdzYHOoSKtyxaMvMDRYx6iSOJy0UoAO3MdU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgkps7GrXtJx1RvuVklHApM5onBNwIQ2GczoKZtuSyDrkB/K1Y
	lFssvBcuTlpE4nbrrAq0WjlqMK0xmNkXU9R/xOEW0xyFk21hVudL
X-Google-Smtp-Source: AGHT+IG7BcFLJf8wfPD4S5KCnIb1Rf33UiEGcYwKZrAWfa/bvxMW/w5d76EvrLbjDwRnMUytYY5SjQ==
X-Received: by 2002:a05:600c:458e:b0:431:561b:b32a with SMTP id 5b1f17b1804b1-43161647f5dmr16565205e9.19.1729258515226;
        Fri, 18 Oct 2024 06:35:15 -0700 (PDT)
Received: from localhost.localdomain ([2a06:5906:61b:2d00:d416:f456:3869:adaf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43160e0a7acsm24320475e9.22.2024.10.18.06.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 06:35:14 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v6 16/23] media: rzg2l-cru: Use `rzg2l_cru_ip_formats` array in enum_frame_size
Date: Fri, 18 Oct 2024 14:34:39 +0100
Message-ID: <20241018133446.223516-17-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018133446.223516-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241018133446.223516-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Use the `rzg2l_cru_ip_formats` array in `rzg2l_cru_ip_enum_frame_size()`
to validate the format code.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
index a40b0184b955..07859c89be77 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
@@ -165,7 +165,7 @@ static int rzg2l_cru_ip_enum_frame_size(struct v4l2_subdev *sd,
 	if (fse->index != 0)
 		return -EINVAL;
 
-	if (fse->code != MEDIA_BUS_FMT_UYVY8_1X16)
+	if (!rzg2l_cru_ip_code_to_fmt(fse->code))
 		return -EINVAL;
 
 	fse->min_width = RZG2L_CRU_MIN_INPUT_WIDTH;
-- 
2.43.0


