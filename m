Return-Path: <linux-media+bounces-13660-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F93990E4BF
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 09:42:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 338611C21ECC
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 07:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A517477107;
	Wed, 19 Jun 2024 07:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ksJkm6BV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C139373514;
	Wed, 19 Jun 2024 07:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718782920; cv=none; b=HecNxYGPta3RLVGKEhMQ0pkXg+oDTq6Ue45U2vkOisbFsxyOnZ9UbDQ/7BOnqpJx8+LOF0D5oRXZHE2fbq/9pWV3R+fPOyu+9bUfPEqo43FUGa0cI7CYwXhNF6XWgfsCviUJ/T2mky8bspRC7LLouq6+3xhP2PECqI7V0Ztxg9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718782920; c=relaxed/simple;
	bh=YTRa4gq5UCd3xSgYihZnce0eIH+/AuZILZa29HHqF/s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TExON7r0eH2hsZG3RIx1VafBdowLnuMhaWguIC4sIE7qjHO8vv0HBHotmvsQEOYl7d1s7NjTB8G7ahEMo70SKRXrli6DVp8ycExWIlYjh+rTzGH0aFlJoBO0Dm5AWGVlFivpTYCmEczNAnT1vGhrIoGMeeLy2cWLZzYTTZqRxv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ksJkm6BV; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-6bfd4b88608so4550708a12.1;
        Wed, 19 Jun 2024 00:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718782918; x=1719387718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EYf14K0o/GtP+Ak9bfKmmPfeyfY6du+2C660F2DlOvU=;
        b=ksJkm6BVXusJegiFJYSyCwC1UscE4NBOtuinLDwhJi/3cCxztnWuhhKkGTJ8eJjiAR
         fYBpipNXCMB8Cf5QwaU5JHqxfFgeeePIvBkElTwgR3QT2S7v5/GEdVi6iuA9PLCQhyVs
         AjLcsBsSAvQv8gfhwalDzcHeWp7jSmi1iX26iIJXju1M+slajcr3Ic4cnqndKVpP5pXk
         DLSO+j9PuAzbeUHSsb2hEbN/i0e8PNHLDxBB0ox3bRzFV1nRW7oauWp1fc0b5m3JBxnS
         LIAPBmvtRVcwdSSEXq229Lrr2hw5KFEsC8UH1lepNPoN46WEDfGbxwqYI9bIOzrWu0Nq
         gXMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718782918; x=1719387718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EYf14K0o/GtP+Ak9bfKmmPfeyfY6du+2C660F2DlOvU=;
        b=Zgr23Mb7/20xtamHaHp6I2cuXunw5UDbCcbBpU8qfQAIk+g0JAK4H1Bh2ZSUoJY/MI
         roWkQyzITOuKvWDuU/17xKvyVUkc/vpbH9gTRknFy8HhykAk1C9OYq8wY1QDCA8RCtKa
         9/QjYx5PkabvGlw4fnsK/5q7qhRUJL8OWle3P8B092JebZJ/03dVTvWCGwlcI6wHXeUZ
         QFJKXqvU8ti9evrLcClo24/m6y68fOcWDw0xFA4KjSQdYGlGWjEVgwJxM2Fm5n4+N+qz
         lDeDZkBzWcqAVZVZu5xKwINImAZ7ckS2RfGUpE6HUdBScmgqy5IvLdtMeOK81n3z8p56
         aTHw==
X-Forwarded-Encrypted: i=1; AJvYcCVgC5JtVfs+Z6xEFuP7xcOBq5+adLC9XSUtIuwwXSO/4gOdvhDcvPY3QYCjxar1oYKaofH3YdRhFN5F6oyeok8R9Le2JqhiMn6c4DgMdZX49pWw9azHBogd0zt+gET2Lc4bWl3prjVP7o9pFuUarmdLM2/wZoOwZPZ7jevFy/GZcTpJ/erh
X-Gm-Message-State: AOJu0YxsZLjJOoluKst8eeP4IKBE8RRaUhsak83gCmWac5m95BhOZuE/
	KxIlLJ2M+ufepVEa3S4AjE9oAJsrTw28FLBG7PWN0DNyO2paIPuw5tXox15BF/I=
X-Google-Smtp-Source: AGHT+IH+9mFlVOWUGxjHQVXw4qG3V8AeXjQgSMD+qpxAz0/Fx43VORUI8LtUbjV7U3DwdOEy2ZllCQ==
X-Received: by 2002:a05:6a21:610:b0:1b0:58e:1b93 with SMTP id adf61e73a8af0-1bcbb3826camr1797590637.1.1718782917869;
        Wed, 19 Jun 2024 00:41:57 -0700 (PDT)
Received: from localhost.localdomain ([221.220.133.99])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855effc9fsm109835865ad.189.2024.06.19.00.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 00:41:57 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: nicolas@ndufresne.ca
Cc: alchark@gmail.com,
	andy.yan@rock-chips.com,
	conor+dt@kernel.org,
	cristian.ciocaltea@collabora.com,
	detlev.casanova@collabora.com,
	devicetree@vger.kernel.org,
	didi.debian@cknow.org,
	dsimic@manjaro.org,
	gregkh@linuxfoundation.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	liujianfeng1994@gmail.com,
	mchehab@kernel.org,
	robh@kernel.org,
	sebastian.reichel@collabora.com
Subject: Re: [PATCH 1/3] media: rockchip: Introduce the rkvdec2 driver
Date: Wed, 19 Jun 2024 15:41:50 +0800
Message-Id: <20240619074150.103770-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <0e8561108c4fc99291ad7cdc0c6af2dbb8e58f02.camel@ndufresne.ca>
References: <0e8561108c4fc99291ad7cdc0c6af2dbb8e58f02.camel@ndufresne.ca>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

On Tue, 18 Jun 2024 08:39:07 -0400, Detlev Casanova wrote:
>> I think the min/max width/height are incorrect. From rockchip's TRM V1.0
>> Part1 page 374, supported image size is 64x64 to 65472x65472.
>
>Page 374 shows the sizes for h265. h264 is the next table, where 16x16 and 
>65520x65520 is documented.
>
>> And my
>> chromium can't use rkvdec2 because min width/height are set to 16, which
>> 
>> will cause error at here in rkvdec2_h264_validate_sps:
>> >+	if (width > ctx->coded_fmt.fmt.pix_mp.width ||
>> >+	    height > ctx->coded_fmt.fmt.pix_mp.height)
>> >+		return -EINVAL;
>> 
>> width is 16, height is 32 while ctx->coded_fmt.fmt.pix_mp.width and
>> ctx->coded_fmt.fmt.pix_mp.height are both 16.
>
>Maybe
>
>if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY))
>	height *= 2;
>
>is causing issues in this case, I can check.

You are right. H264 decoder should support 16x16 to 65520x65520. After 
removeing the "height *= 2" code chromium can also decode video now.
Checking with V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY is copied from rkvdec and
rkvdec has min width/height 48x48 so there is no issue with chromium.
Chromium will call VIDIOC_STREAMON with size 16x16 and without sps flag
V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY at the beginning of the video play.
Gstreamer doesn't has this issue because it will call VIDIOC_STREAMON
with the actual video size like 1920x1080.

On Tue, 18 Jun 2024 12:34:07 -0400, Nicolas Dufresne worte:
>Just a theory, but 64x64 looks like Mali GPU requirement to me. Can you give
>more details how it fails exactly ?

Chromium failed when calling v4l2 uapi VIDIOC_STREAMON with size 16x16 and
V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY disabled. It has not come to render step
which will use gpu. Other decoders I have tested with chromium like
hantro g1 and rkvdec both don't have this 16x16 min width/height.

I also tried gstreamer with a 16x16 video and it works fine. So there
should be something wrong in chromium's code. But I have not find where
chromium set sps flags in its v4l2 decoder.

Best regards,
Jianfeng

