Return-Path: <linux-media+bounces-13456-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B3290B505
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 17:47:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45F00281746
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 15:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FEE6158D77;
	Mon, 17 Jun 2024 15:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ILov2p6V"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3A2158DB6;
	Mon, 17 Jun 2024 15:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718637694; cv=none; b=hyZOGPGzaa7pJAAJAsQU9pJgsgbbNDKtJPuIRc/+wuylPqYrSD7obUg4Ddh+y4cNkx7F6P0GRTicJdeRqj3AwczW7KiEfOfjW0/Gqonq5hRFsWU7taL3yfz2AnZRLXuo6HkgdvSEJX6GkYgTBaOFrvenys/a/IIO0ywcTceER9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718637694; c=relaxed/simple;
	bh=5Wn7SBadF1voQ3s8lFOjrITjw/7NasFYsMiD4rEzIT8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=o9aRDDIryuS/MrpmfLY70lR6KRRAgAKFPIMFeY3hvSsbYBGJm+zn2Cu8WldSydn42O8FZRomeKhX1+II2MW2V24mkLqW3Q2B98Fla469NwS25nkpff4mJfMRgOrSXY6egjD8hKJOOccN0cGn/4riagPbCW6p5TEVUZ+4+fHf01g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ILov2p6V; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-70435f4c330so3574814b3a.1;
        Mon, 17 Jun 2024 08:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718637693; x=1719242493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=00MR3ut2aMx7bMI2LS9yReBsbwXpambIHWaVlb3riis=;
        b=ILov2p6V69cMgt7VzMLFPZxZfPHDH00CNYayZkqXCFeqZq13i0yGaeODRhQ+vxiQtj
         9Rv2zwZIhmD4zbAepTF5mN1QxBeGr6RFuN7WNTkzvTkTocW9K2Vsb0iRpsA1h0l/EiLp
         vrbUIHsxcQDTxJOkcXflPophscGB5+FdEaSAJlPssmNqRaj2DwkLphB45Az9h8Rhamuv
         9JSHiDQ1h3PeadwNeeZF4hULBPNrXtesFNL/H/vbNqb+XNZvDh0XE/VET5MZ46cnXoZe
         lYxmV7GQPpbhfaV2wM0+x9Qry7olwxgzMMwU91Ijabl62iMk9tizzQbcLxYwPLnZCC5k
         N/gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718637693; x=1719242493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=00MR3ut2aMx7bMI2LS9yReBsbwXpambIHWaVlb3riis=;
        b=H+DmYbOYpRHZiKLCk/y83hJVm3aFPLRHMgtSPCZb+SKY1HkZbaO1PtTcsG55QtbK3K
         WGXnmCKSEaSJLT6G1pU3Em7JOvCOULuDSv9f0kbC06vQDt3h+fG+RgVALdBTlI0NklDs
         eExDoO4wjT5CYc4OW01KaZj0ckGTc5WWNp6JLFd/WeJxMiR64UY5BNO6weX4elmANWtw
         nPl+9pICnQ8y6gno+QBp0i2T+bNJfz+yrpBopmfVBrPRVyptYF9H06jLnoucA+AxlFhM
         HgnGUV0IHiSAAoOiKj0J2DbSPSAfDSD6iRGwnOkQwkjzJ/0cYTRYiKIJPK9bYqhfk5aJ
         pc/A==
X-Forwarded-Encrypted: i=1; AJvYcCWfidXvBepByAWkV34Y/WhohrSKCCEsfh/zFaK1ByAz7mqTHC+hda9sj6TV8cRhCkWfkTBHmi9yN/K/4tjnmzNnygRse9XU/JppuW1Kb1b9DkTcccp4xnh0tY3QD9b8KnjwDATdkFYCxfs6pFO4bXYo6hTqtQGEjLbaR4JdX7abC20gsVl5
X-Gm-Message-State: AOJu0YwTBkMum6rWrvkSSIEtT6JPikeCU33UWpYdOwm41jxkKVsM2pjm
	IKA4iZYqzvp2yBdPsV3IRjpRM7D9DZDD++NjLqgiiahY2u56NICh
X-Google-Smtp-Source: AGHT+IHBHAhCvnxr/UkOTrgt6uZtW2TW6zVduT+0n5X0O7AEH43lwuvAseCDAnFPI71RKlft3Z+Kkw==
X-Received: by 2002:a05:6a20:3c91:b0:1b6:5b3a:9a55 with SMTP id adf61e73a8af0-1bae7eb2d92mr9897841637.14.1718637692784;
        Mon, 17 Jun 2024 08:21:32 -0700 (PDT)
Received: from localhost.localdomain ([221.220.133.99])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-70a36b6954dsm1760558a12.84.2024.06.17.08.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 08:21:32 -0700 (PDT)
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
Date: Mon, 17 Jun 2024 23:21:18 +0800
Message-Id: <20240617152118.30684-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <f295f41ef1c9ee920ac3ac8e70ccf672ba7c9648.camel@ndufresne.ca>
References: <f295f41ef1c9ee920ac3ac8e70ccf672ba7c9648.camel@ndufresne.ca>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Nicolas,

On Mon, 17 Jun 2024 10:04:59 -0400, Nicolas Dufresne wrote:
>> [5799:5886:0617/171224.851218:VERBOSE1:v4l2_device.cc(128)] Open(): No devices supporting H264 for type: 0
>> [5799:5886:0617/171224.851346:VERBOSE4:v4l2_queue.cc(1069)] This queue does  support requests.: No such file or directory (2)
>
>This one indicates that V4L2_BUF_CAP_SUPPORTS_REQUESTS might be missing in the
>REQBUFS implementation. I suspect GStreamer simply assumes this today for driver
>exposing stateless formats (which is fair, its not a compliance test, and we
>don't have a codec compliance yet).
>
>I'd suggest to check and fix this one, and retry, might only be noise, might be
>the main cause, we cannot tell.

This log doesn't harm chromium decoding. I can also see it when using
hantro g1 decoder. The issue is "VIDIOC_STREAMON failed" later causing 
decode failed.

>Are you using minigbm ? Because if you do, we don't have minigbm code for this
>driver (and have no plan to do so, since we don't aim for ChromeOS support).

I'm using patched chromium which can use mesa's libgbm to render NV12.
Robert Mader has showed me patches from this mesa's merge request[1].

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23214

Best regards,
Jianfeng

