Return-Path: <linux-media+bounces-20066-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F6B9ABDC0
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2024 07:25:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 682C21C2263D
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2024 05:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 234D2143C7E;
	Wed, 23 Oct 2024 05:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dlj1+kgZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E75313D897
	for <linux-media@vger.kernel.org>; Wed, 23 Oct 2024 05:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729661093; cv=none; b=eYmUF86mxmZYjTkQfjAs4hyiVGPE9yC4SweLx69L+iP96EoVfd9ZAE/zK9nQa7KKB6LMeyIDiCXI8mskNz9nzlqGF7O4wOq+LvW1YUwPgnSbrQawqADB7+WVvIQgMgTZ/eV6XiXv4UEjNdnVXNSxi3PACFZ4CGMXwS7fKJ7m7iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729661093; c=relaxed/simple;
	bh=wHtTx+zCo+C3q4atkWgBTraPW0TMYMSFpuSlK91MPJg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZFzaLyXxPz9GTwhlKlYHPMN7hFhBEml3iftxAFbGHjyMf8BJcMZgYcdhYMG5d8KX1Afp30Qvu6t87vDank/whhTPTzM1Gg9SKxVKoSmTWz/SqO4lTwEFJcget4rJJscZBeU0FrgKdEv+5GuV3jl+xuOIgBBAqxip7iqlOEz4/Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dlj1+kgZ; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2e2ed2230d8so4778255a91.0
        for <linux-media@vger.kernel.org>; Tue, 22 Oct 2024 22:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729661091; x=1730265891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YT7CSLuLBETb2TYfBFixmj2mcZ71PZCoii4OBkjX+oY=;
        b=dlj1+kgZTqGvtRqH0GXnmHyLcpES3guVEK7/9q1TpMiIo34GO0rMBQ2Oh+cm9+Fz5X
         AdYIEThLgAK+DxS10K5zmlmTyEHWWzkoz2QUfwthfQxyzkMdkFWH0tgWIX8VpzPjMLjS
         qF3t2AeCem8Is223Hrvx5r7/RF4yHQOfvwE4o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729661091; x=1730265891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YT7CSLuLBETb2TYfBFixmj2mcZ71PZCoii4OBkjX+oY=;
        b=ezGStTvnlYm9ccXwMeIBHi+YlbKnNbGCZj4Apccp18dGZ1CdSRlp/ixsNakIGF0aXR
         7Ov833moNzBlP6aNyBpcKgumV4etFx77Pj8y7gOaXnIu/fkdxepj5xP5ogSXd0WQyh1i
         0ve/yaP9VdpE2t0Xom+QwWvYGr/oKjTjzgu1flJjfLelntqVjt3DE/A3hWBcoEo0x551
         7N0J4a2dLsTa9In1W1T9Gak5aeKQKvqZnAK2guUbZaeEmEsNyIQHsFYDMqF4omVra/Kg
         zAVuaFm2QNbTqSQoXeq+F1jjulUo3TC1agVIe6khwH5qHOghjrBxEB/PlcWAeptqmrEL
         8zCw==
X-Forwarded-Encrypted: i=1; AJvYcCV8qNDCd0tTUre/tXZTC93oaynHCiLseHnZPzWRUjkipeVAIRaTPC2AAcTei7PptFDOWNsrDzJaOGGMmg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf6vyJW2IsWnv5IKIavoac/7GhNgmt2BsZt1A1kVMD2CC2jW7P
	uCUBKDBPNRAqeO9Z4MuU2jAlBhfL9VXXWjqiFPOl+fjZ0ISVbKc1RcSOKm0yKA==
X-Google-Smtp-Source: AGHT+IGjqXRhnD7DldXrKzHAFKLDKtERgI7XPmVHG/z3n7d5ovk8BN+Zg9EpwGdxvoeSTvf6Tm2gug==
X-Received: by 2002:a17:90a:7083:b0:2e2:de92:5800 with SMTP id 98e67ed59e1d1-2e76b5b6c9bmr1505625a91.8.1729661091600;
        Tue, 22 Oct 2024 22:24:51 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:eec8:692:e549:d490])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e76e088f1fsm413112a91.56.2024.10.22.22.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 22:24:51 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH 0/2] media: venus: close() fixes
Date: Wed, 23 Oct 2024 14:24:20 +0900
Message-ID: <20241023052444.139356-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A couple of venus fixes for close() handling (both enc and dec).

Sergey Senozhatsky (2):
  media: venus: fix enc/dec destruction order
  media: venus: sync with threaded IRQ during inst destruction

 drivers/media/platform/qcom/venus/vdec.c | 20 +++++++++++++++++---
 drivers/media/platform/qcom/venus/venc.c | 19 ++++++++++++++++---
 2 files changed, 33 insertions(+), 6 deletions(-)

-- 
2.47.0.105.g07ac214952-goog


