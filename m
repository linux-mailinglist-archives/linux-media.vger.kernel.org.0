Return-Path: <linux-media+bounces-15488-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9AC93FE76
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 21:44:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EC3728403B
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 19:44:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98106188CA5;
	Mon, 29 Jul 2024 19:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FXaKbdF9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D1F85947
	for <linux-media@vger.kernel.org>; Mon, 29 Jul 2024 19:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722282269; cv=none; b=JiWzTatLi5pufXMplVEbue6EwSXxpzNFY21VnP1puVUYkfXPPUuHUnHrGns2vlmieYH+TJWnndw6yrJPXi7FkuqNSpMN6Bsy/H26S9ss36jPrXRhmhwCDhgpXUBpxbQZqxypR2r5YaMeTCgm8kBx6toMSjW4RaVrqo/F8q4mAnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722282269; c=relaxed/simple;
	bh=dnFCoil/3B/VHuUo8uF+8E+XLToW/SvtL+eEUBfsnIU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=M0ENiHwWs+PWmQMZJU8xkv3Uiz0DdshJqP2oTOHqfrPcyzabUYJCFvqCvkok6gA86i0x4vR0I3dbIviGg3JnihDtpsRuiYtsAZ5rofmdZG3Yh6AISNb2FBCr2HT6MfYk/RlhMsd2yzJHtxmWr5DwN76Rl5048Nj7MEm7JEveARI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FXaKbdF9; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a7ab5fc975dso325882266b.1
        for <linux-media@vger.kernel.org>; Mon, 29 Jul 2024 12:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1722282265; x=1722887065; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dnFCoil/3B/VHuUo8uF+8E+XLToW/SvtL+eEUBfsnIU=;
        b=FXaKbdF9oeue5B0J3yWgzhIeVPehZxEVG+2P3AOubAe5okZibLz//vNqx0aeT1jkrO
         EMzOq+JJ2JrLqW9CXYl3l+FPvi2EnD175VdUW08Q5rFMrkhNLSzLriJ0Xdj6eDBtsczv
         +konGYngipO6dYOtRZ+P5bkPVTCZ6C2N0vs8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722282265; x=1722887065;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dnFCoil/3B/VHuUo8uF+8E+XLToW/SvtL+eEUBfsnIU=;
        b=qPsA5i7vIcX4YQNTSJJKIyNFrPknOOuU9zt0tu7xol3vdxPHxQBj0KizcxL4Q1CSsp
         iL8RglpFY5qPeUmOKOqyrcU9QM8FBYkYklGGbdd3i2stlq25uo9M01PxLBkvTzQGByWp
         6Htnu4lTn3LPAkfhP3SwPknlPBDPSrLTILbYxw5Ay7dkPnnn16bjfjGSMXP4SDiy+w6r
         QcycFalKZF51Tr/GWNUGPU++nlYBU1ZeDvRP03j4UzUhHWdBQShDOOIOtV8auenaiRgF
         m83uxMq+OuZhEtLI2a0IuuPDaVkqdvJybKvlVd4VzAkmVcMdcGPNoA92PApE4tN8Tqg4
         Acsw==
X-Gm-Message-State: AOJu0Yx+yXGOXokehggp+RWVbEQfhMLVRbGxTUX8kq4/rKaEctQ5EsIc
	irfM5wd3YMzuZlv5tB7+wIDj650ySiHsdUZcquCEW4XAb05TnTkG+Iao3MOc5QV+X2x3mA8gOuT
	ENw==
X-Google-Smtp-Source: AGHT+IGUizHGafQCJcygQL2LC9CbLdvPH49r1zYN68MmRqZBCObsqlTM68mtOGuyQz0QrKE0Uc5m3A==
X-Received: by 2002:a17:907:3faa:b0:a7a:be06:d8e7 with SMTP id a640c23a62f3a-a7d40160a63mr727121066b.44.1722282265631;
        Mon, 29 Jul 2024 12:44:25 -0700 (PDT)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com. [209.85.128.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acab23d56sm545885066b.38.2024.07.29.12.44.25
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jul 2024 12:44:25 -0700 (PDT)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4280ca0791bso18472675e9.1
        for <linux-media@vger.kernel.org>; Mon, 29 Jul 2024 12:44:25 -0700 (PDT)
X-Received: by 2002:a05:600c:45cb:b0:428:1007:6068 with SMTP id
 5b1f17b1804b1-42811e0b70amr65220215e9.34.1722282264340; Mon, 29 Jul 2024
 12:44:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Fritz Koenig <frkoenig@chromium.org>
Date: Mon, 29 Jul 2024 12:44:13 -0700
X-Gmail-Original-Message-ID: <CAMfZQbxCsW0SE=uUgejg5=FY26zxhg=J3YNFhVmoK4s5+w_B5g@mail.gmail.com>
Message-ID: <CAMfZQbxCsW0SE=uUgejg5=FY26zxhg=J3YNFhVmoK4s5+w_B5g@mail.gmail.com>
Subject: [PATCH v2 0/3] media: venus: Hierarchical P frames
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, stanimir.k.varbanov@gmail.com, 
	Vikash Garodia <quic_vgarodia@quicinc.com>, bryan.odonoghue@linaro.org
Content-Type: text/plain; charset="UTF-8"

v2:
- cover letter
- testing explanation
- signed-off-by

V4L2 supports hierarchical P frames via the
V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING* controls.
These controls are needed for implementing the L1T2 web standard[1].
L1T2 is a way to specify a bitstream that every other frame is unreferenced
and therefore can be dropped without causing artifacts during playback.

ChromeOS is planning to use this feature for video conferencing apps.
A single encoded stream can be shared to clients with different
performance characteristics. Those with lower bandwidth or slower
decoders only need to receive the referenced frames, not the unreferenced
ones.

The changes in the patch have been run through the ChromeOS tast test
system to verify no regressions are occurring on a SC7180 board.

Hierarchical P frames are not yet integrated into the test system. These
changes have instead been checked using a bitstream analyser to verify
the reference frame management.

[1]: https://www.w3.org/TR/webrtc-svc/#L1T2*

