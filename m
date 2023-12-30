Return-Path: <linux-media+bounces-3095-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC5B8208B9
	for <lists+linux-media@lfdr.de>; Sat, 30 Dec 2023 23:48:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA4AE1F224BF
	for <lists+linux-media@lfdr.de>; Sat, 30 Dec 2023 22:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88EEFD518;
	Sat, 30 Dec 2023 22:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fctb5RWl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9CAD2FF
	for <linux-media@vger.kernel.org>; Sat, 30 Dec 2023 22:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-555f581aed9so706132a12.3
        for <linux-media@vger.kernel.org>; Sat, 30 Dec 2023 14:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703976508; x=1704581308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=06Gfi366db2a/s4XG4ycdX4G02ocltA1h9N7JLxAGA0=;
        b=Fctb5RWl+5q/HIMOAmR1RLs4jBY3KPnWGJRm+yUHL+m9KIs85e0EhsMuqogB8Mfb4C
         bxDXs0z6bjaUj1mWkTZsfsyexA5HlADNG5QHJqtKxUu5ad6WzN95kRy9YwKcNmtR5TMO
         Qq9EAVHZYavhn67jPhKaYRcSMiZxwgsHPn4kEY3uirxYa5coh2ZFHR1vnIoZTti1pLc4
         bnu0EZay13vLQWMUX5TwFpOu/sU/kwWPcl+bXp4++AKXq47oMfTmH3KY+3zmkDXke/pj
         JdUnZI+OLgIi1mO0FD3AckPv+unWj5a9wmNdPnhp4sgK/DrPbo4V/h0oyn3oFvmkKnZ/
         HL+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703976508; x=1704581308;
        h=content-transfer-encoding:mime-version:message-id:subject:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=06Gfi366db2a/s4XG4ycdX4G02ocltA1h9N7JLxAGA0=;
        b=fADLjuUYbDN5RAQJ4mN4RjKvU7xWKRtuLkpDVmvDAiwe9LLoXAFoluS99WQlId3Tdi
         /nupAmrEGkRtSvsEfhO6wy0p7ptDptXrqmH+x+Z+oS/iZaYzS9f89HobcUDp9JztBe/b
         tt7JzzX93qzVfjDO6xofkB1bHXXIpksrQgD/wLcNOzxh9fLg5bSNKbdpcUChsl+EaXJ2
         RuXlcS5BfctXYcYayOeEJv85Uo6R6ZcFh0gJznEucFP3MmmWCW69rhcBQhpWxOWuBKn4
         2XhUZcQVua9q9QfNFJZlkFTGIQX43Nuu96bYl0rk1B+JDzADnQNJ0KcVlyD0XfF1jNmz
         irnw==
X-Gm-Message-State: AOJu0YzteKn6k4ZXG2Dqhq33knerVhHg1J4Tv6+zARrjv2a12ain1CAa
	/8C1kmy2HApZwxjS3ThcI1MtZVDRy+w=
X-Google-Smtp-Source: AGHT+IGPZCrkriJhWmr5liEd2m7Lx8jr3mPa2d0CENcXjrxV/LUtACvAAPRs/yk1HawhXFnBt5e4XQ==
X-Received: by 2002:a05:6402:33c1:b0:554:dd0d:1955 with SMTP id a1-20020a05640233c100b00554dd0d1955mr5737395edc.62.1703976507559;
        Sat, 30 Dec 2023 14:48:27 -0800 (PST)
Received: from foxbook (bgu175.neoplus.adsl.tpnet.pl. [83.28.84.175])
        by smtp.gmail.com with ESMTPSA id c13-20020a0564021f8d00b00554bb95bf3fsm8621988edc.58.2023.12.30.14.48.26
        for <linux-media@vger.kernel.org>
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 30 Dec 2023 14:48:27 -0800 (PST)
Date: Sat, 30 Dec 2023 23:48:23 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: linux-media@vger.kernel.org
Subject: uvcvideo bogus SuperSpeed bandwidth calculations
Message-ID: <20231230234823.238115f4@foxbook>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

I encountered two problems getting one no-name SuperSpeed UVC camera to
work with Linux 6.6.8 (some earlier kernels were similar or worse).


1. The required bandwidth (as reported by "Device requested %u B/frame
bandwidth" with trace=0x400) appears to equal wMaxPacketSize*burst*mult
of the fastest altsetting, sometimes the second fastest one, regardless
of selected video mode. (And my xHCI refuses to enable the fastest alt
for supposed lack of bandwidth, so the camera is unusable).

This is nonsense, and I suspect a bug either in uvcvideo or in camera
firmware. Any thoughts or hints what to look at?


2. I tried to work around this by enabling the banwdidth fixup quirk,
but the quirk has never been updated to work with USB3.x. Code below
needs to have USB_SPEED_SUPER (and others?) added to it.

bandwidth = frame->wWidth * frame->wHeight / 8 * format->bpp;
bandwidth *= 10000000 / interval + 1;
bandwidth /= 1000;
if (stream->dev->udev->speed == USB_SPEED_HIGH)
	bandwidth /= 8;


After fixing and enabling the quirk, my camera works. Although with
trace=0xffff I'm still getting regular messages about dropped frames,
not sure if this is normal? Observed framerate is close to nominal.


Regards,
Michal

