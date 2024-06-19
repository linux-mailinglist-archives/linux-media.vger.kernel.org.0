Return-Path: <linux-media+bounces-13751-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B27BA90F56C
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 19:46:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BFC91F21BC1
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 17:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A705815665A;
	Wed, 19 Jun 2024 17:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jNGI5Ko9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03F041C69;
	Wed, 19 Jun 2024 17:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718819194; cv=none; b=IycX3gWUuSVvh9lv5i8hH/KqoVp9plruZCiJXR3gxpQLwYFQlhgy0xa/6aombgiMntbFPlDKeLLn8RJem039sUfjT4WppiKAZfAZtR2FgTsLTUlNmUKYAXHkMqOuiRzw4hgjUzrBSVosrPaNDvWggQESX+7OZAPlf/+p2nrDnz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718819194; c=relaxed/simple;
	bh=KfuZUDtRbQnetyeAbuRd3zXq8hTkCKuI/Ak5W9iGk3c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AGgXQ86T86egRi8elFSwC8yazX8Zooc7i13EXAMgMCMY8//ZT+q9qKNi0o/7NxO2O4vsScs5yPxa1XiECm4TVgBeuCHU4o7q1BD/tMrdqFoXlewcIFvbE05cyxc17IIdRTbPQ9uPTW9Zu5VgnatVzSE+h1rvh05avFuAsO0P1g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jNGI5Ko9; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-6fb2f398423so46709a12.0;
        Wed, 19 Jun 2024 10:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718819192; x=1719423992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5UHgTKJnVvGzz0RhWWxAYapaJvaOUe+M0dNscdnn3ck=;
        b=jNGI5Ko9jLtsITieqTDK5RstE9lVTd8c7UErCwTmuwNQEkNxxncOMKV2iRQT+DerIY
         m9zAdD7xxlmXP8WXgSbcAMieMSC5ynbY27CjXCKkD/+CYeHvpoorAJ+OplJwR+vIz0qN
         ZPVoWcDv9vip6JzkAdoF9TCLFMepChmGI/H2BGPYHdVdWMwjkR8/mm8uuyFQbdJMm+px
         tis0ZWydgGHSYh7vBPRFYdmsixO5tO4wKWNswuOBpjP8QOqEtQH8G98X8bHc9t59WbdJ
         wRkQTO+x3cyb5a8EFOnx1iWr45sPvceurm/QeDK59Af9/L26oiaPgc3uhwVUXykniPsj
         lpug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718819192; x=1719423992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5UHgTKJnVvGzz0RhWWxAYapaJvaOUe+M0dNscdnn3ck=;
        b=mxoM+zsLZA6wqHp4m9bfV+/E/gnh4/p4Nwb6NsOegnOmcTuVlrO4FGLHU+JtooHlay
         ZFhCnphH3QwUSC6ZJ+qRvEmz2U7x18yWmFMjCUXdAcgxwB31c+LHgPfmQvX0W4EqW5fp
         /cNg0MaTIHKs4ZiBzM661GnH+kUF9Lw5yIkBg3Mul8da9yVSkjygw7V6xIb51HOl8RtM
         OxpnGCxtjQH4EHyth0lHSjLTY1Q0AYTzeuFZofq+F73DlGkKWC43/6twfMTNKlq64z75
         3bF03z7OgO6kfEzsMKdXfhZ3TGozJV5qZIY0AMVU1VQkXXbjuo1pLlVlnYVukTcRpycx
         c1sA==
X-Forwarded-Encrypted: i=1; AJvYcCUkOZoKb2Zbrw3p8ilE20v5GiFckOgv6UHUz8Kv75QCPoorQGVGiyrPOG/CDlOubxOWvRsFfvmbKXvodBced/Cuj4/1xkLIwSyoYXetFYc8U6OnyHCzsmGpr9oImVYEPEyEzmkYya06LdYlhSY+LIw1KNaaE+1ZpPsrv3X+Lpa3fbacNLPS
X-Gm-Message-State: AOJu0YxNitLwoUvNb0YI675QclJAZomCBDSB8MuIQtVNbi0WQhd9sd78
	nqKSYsCiEHMCw6LEJxMCNHxZ4corfyQzYQpRG3f5vQ6s/pUtpFP5
X-Google-Smtp-Source: AGHT+IH0tqeqkE1rjW4+gz7APWuek16GJuuOw7jkeXENxmGKwm/HYrhSwM4hQ5g0CoPb1P5AUDj4bw==
X-Received: by 2002:a17:90a:7087:b0:2c2:da02:a2c7 with SMTP id 98e67ed59e1d1-2c7b5dca970mr2971807a91.44.1718819191973;
        Wed, 19 Jun 2024 10:46:31 -0700 (PDT)
Received: from localhost.localdomain ([221.220.128.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c4c45ac5f3sm13364906a91.12.2024.06.19.10.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 10:46:31 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: detlev.casanova@collabora.com
Cc: andy.yan@rock-chips.com,
	benjamin.gaignard@collabora.com,
	boris.brezillon@collabora.com,
	conor+dt@kernel.org,
	daniel.almeida@collabora.com,
	devicetree@vger.kernel.org,
	didi.debian@cknow.org,
	dsimic@manjaro.org,
	ezequiel@vanguardiasur.com.ar,
	gregkh@linuxfoundation.org,
	heiko@sntech.de,
	hverkuil-cisco@xs4all.nl,
	jonas@kwiboo.se,
	knaerzche@gmail.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org,
	nicolas.dufresne@collabora.com,
	paul.kocialkowski@bootlin.com,
	robh@kernel.org,
	sebastian.reichel@collabora.com
Subject: Re: [PATCH v2 2/4] media: rockchip: Introduce the rkvdec2 driver
Date: Thu, 20 Jun 2024 01:46:23 +0800
Message-Id: <20240619174623.270706-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240619150029.59730-3-detlev.casanova@collabora.com>
References: <20240619150029.59730-3-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Detlev,

On Wed, 19 Jun 2024 10:57:19 -0400, Detlev Casanova wrote:
>+	if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY))
>+		height *= 2;
>+
>+	if (width > ctx->coded_fmt.fmt.pix_mp.width ||
>+	    height > ctx->coded_fmt.fmt.pix_mp.height)
>+		return -EINVAL;

I did further invesatigation on chromium. I find that before real video
is decoded, chromium will call VIDIOC_STREAMON twice with value of
sps->flags 0:

At the first time width and height are 16; ctx->coded_fmt.fmt.pix_mp.width
and coded_fmt.fmt.pix_mp.height are 16, which are the min size of decoder;
At the second time width and height are still 16; while
coded_fmt.fmt.pix_mp.width is 1920 and coded_fmt.fmt.pix_mp.height is
1088, which are the real size of video.

So VIDIOC_STREAMON will fall at the first time call because sps->flags is
0 so V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY is not set, and then height is
doubled to 32 which is larger than 16.

What do you think if we skip doubling height if sps->flags is 0 and at the
same time V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY is not set? The following hack
did fix my chromium:

--- a/drivers/staging/media/rkvdec2/rkvdec2-h264.c
+++ b/drivers/staging/media/rkvdec2/rkvdec2-h264.c
@@ -767,7 +767,7 @@ static int rkvdec2_h264_validate_sps(struct rkvdec2_ctx *ctx,
         * which is half the final height (see (7-18) in the
         * specification)
         */
-       if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY))
+       if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY) && sps->flags)
                height *= 2;
 
        if (width > ctx->coded_fmt.fmt.pix_mp.width ||

Best regards
Jianfeng

