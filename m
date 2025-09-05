Return-Path: <linux-media+bounces-41872-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB72FB46329
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 21:06:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35852AA0B9D
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 19:06:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5DDE275B0F;
	Fri,  5 Sep 2025 19:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="YNZ2vfPU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C240315D5C
	for <linux-media@vger.kernel.org>; Fri,  5 Sep 2025 19:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757099204; cv=none; b=OYZQAl3rcMx6RmHs+Qe030Zx0ebRTP6h/i80z6UygHDo2JHunF6vILES5QLN3YBlvx8L23Ouf1cbqiGdIuStmLjkS7HVPeVZdyT7tNv3xoMvpjt4FN94aLnQMFj0i53sT46QC50PLP87BDkgpATUqPAXzZoKPdydPUNwJl0Q5pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757099204; c=relaxed/simple;
	bh=Oz5yDzgQI8awDA1imkucYa+mL2QojOG0Fc1fuxu/aJ4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=C2ZBtQLyb8bWvnDYY24r6Q9P6qAMT2m15ADOwMs8eG2xd/ShW+fMhLSy99pnN98gtfZ2yg4NLIjuUMcu9LkZaMfe8T5UmNlgtgkgCKpjXlcDEqu6ZtHMwnnaKfe70G3SifWsUCsRcuY1Y2msuJVMhC4vqV+u9YJJHgxUVqd6PX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=YNZ2vfPU; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-61ff35a56d3so1021345eaf.3
        for <linux-media@vger.kernel.org>; Fri, 05 Sep 2025 12:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1757099200; x=1757704000; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=etsxjyg4YfsF136YzaCNVjjN75F0ELAgmQtnre7usq8=;
        b=YNZ2vfPU+9WNHOLocIvgTpnkXTaX5I7qhHP8rJiCQjWyq/gTrWKwQp7EFrskhEqdOR
         MB8l9+vlx11dwaLYIwW4uxWNoPsEPww/WN3WQ8P0UYa0nW4QTk3j2f9a1ZC18oLCqcBA
         467Czs4INLFpj29DkUuu2KERP1LMiau+3K4dvFwFGOK3hnHlcGeYRrXch2F9R2Gjyabl
         JA08wC0UNUeK/kI+mYbdkkW2L+86WZPalZIjNHy2o5GSbx9cOKBGs2ek3t/vZQWrJghr
         t+4F3HseqxstHwKux8AdfsCiC431BqsM7OrL1GVyantMDhnCNrSGBA6eg3SxXnwh1t2a
         6Qjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757099200; x=1757704000;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=etsxjyg4YfsF136YzaCNVjjN75F0ELAgmQtnre7usq8=;
        b=L41ldMOqYfAwuClAIPLSt64kWaJZIFurQBTsk/d1Um/Nyu03MeZ4w1NijSOmT93vlO
         gpJb57Ukr0eB5CxLDTYwTT/nVom1opKjIj8pqFki7aJNOGJbjCkrLEm9sreSppmG56Ft
         iz6eR02aaSkU8tDORV8QDMuvpJQgwuXDkGeAyZxrGGRt/nhOOr7emDp6D358LZJeiR64
         vWjKAoe7MZu5qTEN/jrHD+riLCzLObRh7VR24eQwufRaTb5neOreTlht68Xz5WrTUZBz
         sxOb1OGRM4kAP1KEdX3KxRpYHCncEtPddLlfJ0edYxIPZPP0x6I381y6Km91QiJLUmZ1
         PCWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQ7FXzALB2a09gj9zsFRPqsFrB+n8zlhWiz3zYUHo1C7eMNYkuYQYk3Fjwwq7cQ7Ybjkt/R+Pp7iZU9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhBiHJlu92qxg9pvXtYgGA4lIRUiJGqCXWDwnPx9BJZ+fbz58g
	OjLpAe57x2CchNAVlVSH5GX1e2DSrSgY1obhO1SmJgMaTVCT0K0DiPFBYOvES/Xc7JalD5kgDRD
	3qjyI
X-Gm-Gg: ASbGncv/9zFwnirtMOgNjk2FhZKjtPRjzdhuwYtPQW6T71jLNl6I/H3+eBjeQSjl01/
	VhN9HDBwKOy4kYYzhKAIg/pn4CqA0l53Tsvm5TeLgj0WxDDc/bJtWVU1SSJMhmq4rh36z/oHdrQ
	zDgm2PP3o5yq4z7NXcxkF8nTVUJIkrRvOQm1GbRg8YWcBDuEs26LFZZsuu7fSyFW8aOVkqy+SNx
	m5NK3pVjyjeeGzuerYZmh50I9psv06DvAMXFmBc+Pw8ZEGpUiVdbnbWojO3OKeJ3ivlJhCoYEAq
	CNQZjSLh7aWO/4YPvt6Yg/jya+efJKQO1FmS7lKpA6HwTMt+ktzLnW6PyBGkweGxmEfMo5aUDZn
	VCHYbczqDEb3moQlzYPhrsYEpAcfAVZVV4VppDA==
X-Google-Smtp-Source: AGHT+IGb2wPJ87GBn5tZFfPrsJ5SE9jzXrr8X2eXRsXMsEyQczk8Kq0+HLyMFMXmoPvldHEQl3ByVQ==
X-Received: by 2002:a05:6808:48d4:b0:437:e5d6:8c2d with SMTP id 5614622812f47-437f7d20d05mr11191216b6e.2.1757099200370;
        Fri, 05 Sep 2025 12:06:40 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:52e:cda3:16cc:72bb])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-745743cdea4sm4474018a34.39.2025.09.05.12.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 12:06:40 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Subject: [PATCH 0/2] media: pci: mfb4: iio trigger improvements
Date: Fri, 05 Sep 2025 14:06:18 -0500
Message-Id: <20250905-media-pci-mfb4-iio-trigger-improvements-v1-0-55996f077a02@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKo0u2gC/x3NTQqDMBRF4a1Ixn0QU4XarZQO1FzTO8gPLyIFc
 e8NHX6Tc05ToUQ1z+40ioOVOTX0t86snzkFCH2zcdaNdrKjRHjOUlZK3JZByCy7MgSoMBbNByL
 SXmWCc3c8Btv7xbRaUWz8/k+v93X9AHU3OgB5AAAA
X-Change-ID: 20250905-media-pci-mfb4-iio-trigger-improvements-9e223e8401db
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=538; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=Oz5yDzgQI8awDA1imkucYa+mL2QojOG0Fc1fuxu/aJ4=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBouzSsMhuA2T7Rd2KLgFjqVh8RHlIQ9HroD7RTo
 9zWX9M/26iJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaLs0rAAKCRDCzCAB/wGP
 wN07B/9aoidv/luxO5+2nSwYfZqdQIx0hMvAPa8IY/Fq6zuk6JiRGh+/JYuiFmmC5OqEMXvZufB
 sKkLsSsBJlS5lGVBG5PImh1SIzTMgqMZ+kgFV8tR4PvJzZianRyLPz8IhBHoQbS8TBEJ++vALFQ
 jF3gkH0Ftq5hKvUmlp/XmyeJQ78UG59IouM3n3l+pcwkhz1GVm26Up1hkEUYSHhNM0ZSkFvsnI1
 5Kq7loObvRTDOASrz7pdYWBIPSelxq4MUf7ct+PW6cR7E/kCOAa19AX11PzI6NorowPCEDoLgLw
 6hGIvI811zFuQ36dDJj/kmBKEqiIimjK9cnSd0whdfa7oxDO
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

This follows up on a couple of suggestions from Jonathan Cameron for
improving the IIO part of the MGB4 driver.

---
David Lechner (2):
      media: pci: mg4b: use aligned_s64
      media: pci: mg4b: use iio_push_to_buffers_with_ts()

 drivers/media/pci/mgb4/mgb4_trigger.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
---
base-commit: be5d4872e528796df9d7425f2bd9b3893eb3a42c
change-id: 20250905-media-pci-mfb4-iio-trigger-improvements-9e223e8401db

Best regards,
-- 
David Lechner <dlechner@baylibre.com>


