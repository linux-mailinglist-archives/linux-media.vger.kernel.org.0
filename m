Return-Path: <linux-media+bounces-13409-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9693F90AAC5
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 12:08:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B9C1CB3834F
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 09:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96349196D93;
	Mon, 17 Jun 2024 09:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KxCFO+Mu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B761190686;
	Mon, 17 Jun 2024 09:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718617665; cv=none; b=CNv2nQwNO8kr7Y+HPrklVmdmJ/B9aA8XS44BJwKru4nOhWv7FpV41sFUzH26JGjfq1sGl/9POdnAhHuS/3JkD1vtGZ/QWxxSRw1uimecYYglby9DW/BowRAwcsQOe/aTxuGIt+HLe/83VfIDyP44Or3TsJ8sKbm3BoufjbiYmXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718617665; c=relaxed/simple;
	bh=8RBdNog9v6i7Y12AFGORLNl5FaRMz/KfSoh+ctsLO0s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JTQ188wSLnlbiH/MBAmjRwBXyRUo0FwL+VsCs/i5BDcgQv+CDsuwDRPHB22duts6zbYRwE1WOTEWIWOz4UorSvvW78XeiAJCusV6J/iyUTSBoIfm+UZh1Ibe9V4uEmxxCUQ7QKFeLCCS3Pr7VprDN8Za59JDL9GQl86wSJEvWt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KxCFO+Mu; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-6e41550ae5bso2949795a12.3;
        Mon, 17 Jun 2024 02:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718617663; x=1719222463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=usGpbKfnBPC6WUjY1RuxzYU4ZgAbIRTvzZTlT0vlyVY=;
        b=KxCFO+MuRjXB39G79ciTJyojqXlgoFQNLxKaDQPv1qmT1ydBNKzoNG+7jOIHvRVfGB
         YgXUryZHl8E+tsvmJyHG79xLL/gLmy/LUmXd72iYaL48Mj2o/3FgyEpIeeSPgpAWigOw
         PfhzlZhVi+2m1Zkjwdt18Ia2yAWeNaSMJc5Q1lORe16DGsvzzLe6kXjTGKQ43ahhuwpk
         kL6wA6jVQWGswD+IYYA3sWGWfpO+hKL2DO1e70H8HvZueEbhvox0hqF6FLnZhF4xh/2a
         r7hFkmFblgSZum/R00mPZHoU7f7dA4YPlXzQL+WTsT7gfWyrxFB9wfS91pNevZpOU+va
         r8HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718617663; x=1719222463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=usGpbKfnBPC6WUjY1RuxzYU4ZgAbIRTvzZTlT0vlyVY=;
        b=AoUUxi4CwIRQ10B2sabqgn+ol86e/u9fQHbyr70J3QQ9Ny59zA/VGb3620eXr/3VjV
         vyFs2WgHG2LA8QxH6YBjJs+rfjsbCqKGR58kGI8jw0wjgDdcZFsowprkTRrs6BmPJgs3
         U94GyuM9Lb7ZyLW25bhC1MDG0NzjumX/cNL5jxfNHXhNUQKvyB3eAcrxO5hLfRIkJAHH
         L/SZRGNeWsQ1LHZbNalefWmmgw/v0ylRLdKD4LyD6NiH/YeOnEZAWO3WFx/T83uxpCbf
         rAEw+YbRSHq355o7FdH3IWQYUrbk//BRF+foMxKZPUYDhr4cfb5zbZnefgqFDIxSYRhq
         hBMw==
X-Forwarded-Encrypted: i=1; AJvYcCVDyCcAgEYOKuaamd6pB9LTqzQ0DmdFjxzOva4LddHMmlDE2PTBkGjp1L1WdgcuzJgmDhKaldA1eYUQeeSFydnf/4HKnKZhqTQvnVJP3cIStWT67ZzQTV04aNqad8CJJ4QWfXpXI0rRpoV/ygtkDJ771e1TyPKFbD9NCwjB5BTtfYLVhOde
X-Gm-Message-State: AOJu0Yw2rzjnpMi0cuNpKxlzOdLHngbGEQZ4ekDh1CWbwvRKYmfdaF1J
	zQ+GqoL/YAsoiqY4AiFxxQM/lOrAZw+I4OCVtOKqmUi99tAnnU5V
X-Google-Smtp-Source: AGHT+IFyxj6DeLjbzNAUMQS9A9wQr543YPl1rLY7vjP9jo76xxnmD/MsXV8euv4MDQM0ooApWPY5Kw==
X-Received: by 2002:a05:6a20:da92:b0:1b5:b214:efcc with SMTP id adf61e73a8af0-1bae82fd317mr10638457637.53.1718617662752;
        Mon, 17 Jun 2024 02:47:42 -0700 (PDT)
Received: from localhost.localdomain ([221.220.133.99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c4c46701absm8576488a91.40.2024.06.17.02.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 02:47:42 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: detlev.casanova@collabora.com
Cc: alchark@gmail.com,
	andy.yan@rock-chips.com,
	conor+dt@kernel.org,
	cristian.ciocaltea@collabora.com,
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
	mchehab@kernel.org,
	robh@kernel.org,
	sebastian.reichel@collabora.com
Subject: Re: [PATCH 1/3] media: rockchip: Introduce the rkvdec2 driver
Date: Mon, 17 Jun 2024 17:47:34 +0800
Message-Id: <20240617094735.27928-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240615015734.1612108-2-detlev.casanova@collabora.com>
References: <20240615015734.1612108-2-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Detlev,

Thanks a lot for your work! I try to use rkvdec2 with chromium but it
can't play h264 video. Here is the log of chromium:

[5799:5873:0617/171224.850061:VERBOSE2:video_decoder_pipeline.cc(473)] Initialize(): config: codec: h264, profile: h264 high, level: not available, alpha_mode: is_opaque, coded size: [1920,1080], visible rect: [0,0,1920,1080], natural size: [1920,1080], has extra data: true, encryption scheme: Unencrypted, rotation: 0°, flipped: 0, color space: {primaries:BT709, transfer:BT709, matrix:BT709, range:LIMITED}
[5799:5886:0617/171224.850915:VERBOSE2:v4l2_video_decoder.cc(182)] V4L2VideoDecoder():
[5799:5886:0617/171224.851218:VERBOSE1:v4l2_device.cc(128)] Open(): No devices supporting H264 for type: 0
[5799:5886:0617/171224.851346:VERBOSE4:v4l2_queue.cc(1069)] This queue does  support requests.: No such file or directory (2)
[5799:5886:0617/171224.851426:VERBOSE1:v4l2_video_decoder.cc(476)] InitializeBackend(): Using a stateless API for profile: h264 high and fourcc: S264
[5799:5886:0617/171224.851687:VERBOSE1:v4l2_video_decoder.cc(598)] SetupInputFormat(): Input (OUTPUT queue) Fourcc: S264
[5799:5886:0617/171224.851797:VERBOSE1:v4l2_video_decoder.cc(636)] AllocateInputBuffers(): Requesting: 17 OUTPUT buffers of type V4L2_MEMORY_MMAP
[5799:5886:0617/171224.867687:VERBOSE1:v4l2_queue.cc(1511)] Streamon(): (OUTPUT_MPLANE) VIDIOC_STREAMON failed: Invalid argument (22)
[5799:5886:0617/171224.867902:VERBOSE1:v4l2_video_decoder.cc(937)] StartStreamV4L2Queue(): Failed to streamon V4L2 queue.
[5799:5886:0617/171224.868009:VERBOSE1:v4l2_video_decoder.cc(1377)] SetState(): Error occurred, stopping queues.
[5799:5886:0617/171224.868105:ERROR:v4l2_video_decoder.cc(120)] StartStreamV4L2Queue failed at Decode@media/gpu/v4l2/v4l2_video_decoder.cc:915
[5799:5886:0617/171224.871898:WARNING:v4l2_video_decoder_backend_stateless.cc(126)] There is/are 0 pending CAPTURE queue buffers pending dequeuing. This might be fine or a problem depending on the destruction semantics (of theclient code.

Here is the chromium code failed when calling VIDIOC_STREAMON:
https://github.com/chromium/chromium/blob/125.0.6422.60/media/gpu/v4l2/v4l2_queue.cc#L1508

I'm running chromium v125.0.6422.60 and I can decode 1080p h264 with
hantro g1 decoder on rk3588.

Best regards,
Jianfeng

