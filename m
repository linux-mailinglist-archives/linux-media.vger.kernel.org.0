Return-Path: <linux-media+bounces-10770-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 206D98BBD38
	for <lists+linux-media@lfdr.de>; Sat,  4 May 2024 18:41:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B3CBC1F21C3F
	for <lists+linux-media@lfdr.de>; Sat,  4 May 2024 16:41:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB8085FB9A;
	Sat,  4 May 2024 16:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WETNYmLI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972AB5A117;
	Sat,  4 May 2024 16:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714840896; cv=none; b=Uk7vXYp/WrNxDh9833C7t7bQ2HJfE4xFxfujKDKMW26iqv0rZbBfvYI/3aXysG9K3uPqQGt87gQERULToIrQnoZFsvLTUeZTEIE4sL4qYvhIrNFIuTsNDgAuLjk6I6VJcluA6A/G9hfnmGup0gIAZknScT7+5FNTDbvJlqd589c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714840896; c=relaxed/simple;
	bh=Inl5WKHIxnr/agO4EGvltrcdqiZnvrkdHhH77AFSLeE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DdzqETzQ2IQAPvXxqZG0aONWJsZa6vJvyTqYe16FPB1Kl0hkGtcFEREskyeHfJ7AZY1NMcBRifvonu1TIe56RG+85KgnZ+2be6WvuMfqn6ymLdbqogR0TF1lJF7/RSFlEw/HmPpWLmIjXGnONyEakDPxOdD06OLAosjM47nTzm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WETNYmLI; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-51f57713684so685575e87.1;
        Sat, 04 May 2024 09:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714840893; x=1715445693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XhON/OZV9ajp6V36scwsgItH6va4hYr4O9dtKBwyvm8=;
        b=WETNYmLIrLPLF9yM+/vhKyou9LHcF6U1+914fcIeamw2sJr4gY8QDUAHdlMceRldgJ
         urD3amLZ05m88RrzuR3g8wqPvfgDEnJzgs5jTwNSpZvqN2TqvNrc44ditvd75hf2g5Nk
         vdLU7RNKrLhzvK3/Gn/YEf2hl8znK5NfsRZwIWcjoTFzD6H8fRQNP/m33Bao4OKOYGHQ
         o+QqYtaJ9+RNC0C0wrM93zSiOyh+y3wBlTw+CZ5D119hd5N9lM1D5Hol33FvSTGeZPMb
         6O7juUZU1egID9KuwH8Uc2RLd9/RC/OpyNWuB/gNf5g0V8SAWv6iDs0MVqWxsaAMCP7k
         94xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714840893; x=1715445693;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XhON/OZV9ajp6V36scwsgItH6va4hYr4O9dtKBwyvm8=;
        b=OvxtL7zT8uer8ud+B/haeVNe1fv34/t6A95graaXtVCp1xXcfxJBDyiTa5ZL47A4kv
         l/gfZJ6aRYq0Xk9rghQjAnj4aYyWKDliWV7SboxaUx5NuaKtQfjhHoDBitSmxu5qjq9w
         43UdIDltMoi7qgORgW+lBTrPkZPQBRMXizpYP8rqsioG5cq7FkEtJw7WxAX/K5djb7pL
         m9oPQ5N5c8PCfbYjPDNKuFafJl2XIA6AkjKQdhItei3EaBP+asae1o1ZNywuf7hCgurt
         5jXCxZ+TMPnT/gtKNSETRZjpQjl8casYwXYHniba/7bVv+u4zFMlNZ/F4nYiIJZbfANE
         Jf9w==
X-Forwarded-Encrypted: i=1; AJvYcCUZuV0fh83dHq2874cZ5lU4xw988vyotWdgWX9FaFmyvYaWHTL0P7pYvvvrWMUBhySHFRh6aeSlQ035KysB++oAJkjWqSgMyRSt60BdZPTJDnzgQJamW2Wf/+4dc6ho4T/A2PbmgTpCbD1HGKyZaGkD6/VSGtzx9lv1Lo7mqZGH6YBTy0Xa
X-Gm-Message-State: AOJu0Yxx7rUIwNDhdFEENZ7rvLDActI+S7CyOJtpzoW8rLJ9KORthhTA
	ba16my5+gXrDmqa6F7zNIj+vWeKNlMbWoxftedQHsZ6jfjHSfaeE
X-Google-Smtp-Source: AGHT+IGst2dINXiWNLsPfxJ0NHhHC6dXqSLvnIfdVvPw0Xb0Tbzhz5xTUmnWbhenK4y+21Nfa5gMWQ==
X-Received: by 2002:ac2:5b4d:0:b0:516:c766:5b4f with SMTP id i13-20020ac25b4d000000b00516c7665b4fmr4173223lfp.67.1714840892365;
        Sat, 04 May 2024 09:41:32 -0700 (PDT)
Received: from localhost.localdomain ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id q14-20020ac246ee000000b0051d2075cacbsm938267lfo.82.2024.05.04.09.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 09:41:32 -0700 (PDT)
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megi@xff.cz>,
	Pavel Machek <pavel@ucw.cz>,
	Arnaud Ferraris <arnaud.ferraris@collabora.com>,
	Andrey Skvortsov <andrej.skvortzov@gmail.com>
Subject: [PATCH v3 0/2] media: gc2145: add basic dvp bus support
Date: Sat,  4 May 2024 19:41:13 +0300
Message-ID: <20240504164115.64603-1-andrej.skvortzov@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tested on PinePhone with libcamera-based application GNOME screenshot (45.2).

Andrey Skvortsov (2):
  dt-bindings: media: i2c: add galaxycore,gc2145 DVP bus support
  media: gc2145: implement basic dvp bus support

v3:
 - driver:
  - fixed formatting
  - added short commit description
  - removed unused defines, except GC2145_SYNC_MODE_OPCLK_GATE

v2:
 - bindings:
   - add required bus-type property
   - conditionally require link-frequency property based on bus-type
   - add DVP properties with their default values

 - driver:
  - fix fwnode parsing
  - remove gc2145_is_csi2
  - fix error message for unsupported bus-type

 .../bindings/media/i2c/galaxycore,gc2145.yaml |  65 +++++++++-
 drivers/media/i2c/gc2145.c                    | 112 ++++++++++++++----
 2 files changed, 150 insertions(+), 27 deletions(-)

-- 
2.43.0


