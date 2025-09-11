Return-Path: <linux-media+bounces-42381-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 93304B53987
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 18:41:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB6E05827B1
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 16:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D48DF35FC3C;
	Thu, 11 Sep 2025 16:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BHLoIa5+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7582035E4D2
	for <linux-media@vger.kernel.org>; Thu, 11 Sep 2025 16:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757608857; cv=none; b=WnvON4s/KdZjCVZs2Fhu1P3jN3mNYiqC0Wb6Do+HQN9E4mK8GspLjxLoSCoJZEMWq96Ws+LOem3J5CSznhg10s9if5RWmok0QX8W1k5BUMjNthXwYQNLpYgoFqqq8r5Btz3ftJFfq8LCLNUBkj8qvxNiZt2xjhuSBQqiNGbk/n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757608857; c=relaxed/simple;
	bh=RPBQwPNuYyYtQUtZ2JZFYIKb6yx1lRSpbGv4ihtUNa0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fjVt/dLG+6+i5SiyUZy1zz/asUOZPzu4sTJMNIIjn5TI2HoWFGngFELpQWRjgUnv0SNajpt4edKFFwXPkdWUYln8IuuUndmb2wj/idIssy3nxvAvPYY3Pf9McqUJlCigVhpirQ2G8xdl2VYdN4pKBW7trZvzA6kF0nVVJN1Ak/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BHLoIa5+; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45dd7b15a64so8351525e9.0
        for <linux-media@vger.kernel.org>; Thu, 11 Sep 2025 09:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757608852; x=1758213652; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uMQMHx+8Y9PVtHu5Fhv1ceibqlTqO0/BLpLsbyBHbrQ=;
        b=BHLoIa5+gzOmNMr0fYq78vEnc9uG8tGUGlDRut6vINYZkTQkybTQYtt7vM9yi6YWGh
         jc8RVqtVKVlp+N4up1Ovkd8istgYRw9TzOWFJRPSrGDGB3VkJZn5lcgLv5ab6BKCErTm
         SbfRXGrFCUczlIl5JSa/4N7AvnnbYJSH/UoEXm/OPKqsfiD9xoTu/hID3fDKV/HSO6Y0
         RmDXGXqEAsf00zaITMNteR8drVrfBbIVMT7ClbrRou0/cNiNiP7VnSiq+EvGAnR55sUN
         +R57fkBaHOU9gN4FLa30QdEyGz93S2BxskNGZrAEZMvgp1K7X6CvVTkJO03KvdO1m6tR
         HgtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757608852; x=1758213652;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uMQMHx+8Y9PVtHu5Fhv1ceibqlTqO0/BLpLsbyBHbrQ=;
        b=FN+o2YReUAIcjk56wt1odvkkILZ9vc+H1togZKZHEdnP1pwsa86MxQ7rBQLV8sTHYw
         SBT3kb6kg7qjTjzfQSLmhagBrJozVtZ6p9o15maID+9bE/CM9U6W+Ia67G8YfQbysu/3
         DE3uPW1Jmsl3AwUjLoWkufWZZn8zr7zKZAnppnhen2odTn/TyiIyNvy5/Hf1NvBiO7FI
         slbr3bRlCHj5yx7qvL+oH6mJx2tz+m3sXIMOp/dNfcHZyu/DQigvoHpNxitOYkNVR5SD
         QftooEaT42coiL8xd5TniEi4YCk3N9VYBgilRyAJcJM+2kk+F4YbEqsLDpl21xhwGx8b
         86TQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKYY20VFChaHd5+x4o5gBeO9XquMCG2bJhfhjqV1SRDdQLyqwvJWUdX+gcqTkFxs+yrK4kNwGXR2extw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyE/bkEscZD/fjkjpUB/yj3f7LnT6n23VLEsa9+hV9qJyHUB76i
	2+gIQtyW67DL1S3D1A+c0dTlfM5gTp0UB6ocqQ6P6rJSTXWD25ymrKDu
X-Gm-Gg: ASbGncvaUK1ViGU63N4UB/d7p2Z+/W6wOBOuWSIN+f1AX8/UIQftBgrT8df0yJRmEZQ
	Nuiypc13EN8+2lzB694WgSq7i778iHXeqPXTosKSYzLxfv8lFkqPzgZ36pZpv+CsNXe67toMLLI
	Sqaxtjyjyri73I81wf5htbGEte+nYxmt21rD2Bwcu0+rKxXs81rn6qBBVX0ltsUNVTv4PRe1gb0
	7bBC9+DibSQcVjy9Hn2ebTkn5YbC9pgPstgkAs2FRog0octvDAWG1BOimWl90nJ4II3dgOV1HKM
	M3FXSfy2rjuh7tqdzt7aei3FWd1o2Ey7YzsTyok2VXUXMO4+vz7waKaupU37dc5lJdK4G0PR2kW
	yxn3+UYOFhq4+NDl64TLmXi4aXiOCwag2wKcaLjmz4pYP
X-Google-Smtp-Source: AGHT+IEV2fAo5+1KU/1dEim/AbauImb4ZS8yoNPDcA6mm9LIEdb6hwKHDMfpgtEkevMzMRNv1mgNcA==
X-Received: by 2002:a05:600c:1c19:b0:45d:d259:9a48 with SMTP id 5b1f17b1804b1-45f2128cba7mr155095e9.9.1757608852107;
        Thu, 11 Sep 2025 09:40:52 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45e01575fadsm32846505e9.6.2025.09.11.09.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 09:40:51 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Thu, 11 Sep 2025 18:40:00 +0200
Subject: [PATCH 4/4] dt-bindings: clock: st: flexgen: remove deprecated
 compatibles
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-master-v1-4-5d5d5ea9af22@gmail.com>
References: <20250911-master-v1-0-5d5d5ea9af22@gmail.com>
In-Reply-To: <20250911-master-v1-0-5d5d5ea9af22@gmail.com>
To: Patrice Chotard <partice.chotard@foss.st.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1176; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=RPBQwPNuYyYtQUtZ2JZFYIKb6yx1lRSpbGv4ihtUNa0=;
 b=owEBbQKS/ZANAwAKAechimjUEsK1AcsmYgBowvuMhoMAqyg4f7fuJzIMrdJHVjiH3Pjtk3Qyt
 6C1PmXFFlmJAjMEAAEKAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCaML7jAAKCRDnIYpo1BLC
 tcXuEACV0LaWPJcYAtrzhR+HUM1hlanPrthmPqzH1P5CP1R8qHkOgPC1Je5dJ6GbZ6ww3m7LWSu
 qnVmynGir6SfQSjeGy8BxOW2QtF5hACVCtxbj99E2Y6CME8TN189WQA5sKh+hZ552OVE4HydKmm
 5X/FsBHjTMfGEUVYt94jgMWOu9ZdRTrbljkPeZFBcHxn9DXqSXrVsFByeXVYy0R6qyzQKzBuHCy
 DpsVZlkzBpsmKc0rhOEkW6dXcxHBcW8ZSaiY4A6V7zJx0CU0HZXGa37e6A3OHMk7NzdvVdsHOt9
 wUZzXrOb5neMOR0uvKyUI+huOqaX8e60KPSG9gdPlMZ38EeCtRy9EYjEm9GFPVLf2LMpmfCBJ3a
 RzTtxg6ZWLVI52hhCjWI1KpUD1X7nXF7ziGedtfbQbbouMTyGIwkM/L13iVwfFzEDBYfSOrtp6R
 Tqan0wj4eJEdbfg0j/wT8LyOWkxN8II7NGrBb1DVvE1jSjJJZpYKAPYPJDjtsCUepOMk5vRDfe0
 T1fbWm1oJCAvLiZaV8Ber7aWciZJOjMyicInGQCLWCfkex1jSvVa/bMbzsxpRFmS61I4gtqfgbK
 Exh/tNbOonAl+n44/6BWPBDNKSESBaEV/b5V3pFUfLxI4QTDzr8ijiKRJDMajmFHFdDCcpx/UQM
 UxRer5rlsjPLcFQ==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5

st/stih407-clock.dtsi file has been removed in commit 65322c1daf51
("clk: st: flexgen: remove unused compatible").  This file has three
compatibles which are now dangling.  Remove them from documentation.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 Documentation/devicetree/bindings/clock/st/st,flexgen.txt | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/st/st,flexgen.txt b/Documentation/devicetree/bindings/clock/st/st,flexgen.txt
index c918075405babb99a8f930f4a4430f57269417af..a9d1c19f30a3366c2ec86b6fe84e412b4b41ea56 100644
--- a/Documentation/devicetree/bindings/clock/st/st,flexgen.txt
+++ b/Documentation/devicetree/bindings/clock/st/st,flexgen.txt
@@ -64,12 +64,9 @@ Required properties:
   audio use case)
   "st,flexgen-video", "st,flexgen" (enable clock propagation on parent
 					and activate synchronous mode)
-  "st,flexgen-stih407-a0"
   "st,flexgen-stih410-a0"
-  "st,flexgen-stih407-c0"
   "st,flexgen-stih410-c0"
   "st,flexgen-stih418-c0"
-  "st,flexgen-stih407-d0"
   "st,flexgen-stih410-d0"
   "st,flexgen-stih407-d2"
   "st,flexgen-stih418-d2"

-- 
2.51.0


