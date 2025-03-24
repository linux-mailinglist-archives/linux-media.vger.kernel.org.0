Return-Path: <linux-media+bounces-28599-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BACA6D27F
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 01:09:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E0271890F8C
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 00:09:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D986C10F9;
	Mon, 24 Mar 2025 00:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wV9rqLZ3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8180D195
	for <linux-media@vger.kernel.org>; Mon, 24 Mar 2025 00:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742774959; cv=none; b=Y1+3tAO8UWxVUh8cBR175PLhmuvpG8n7Nni/8lV7PMoA61Vev/kaAyDHpD6c/jVv2Odm2CMeFXmA47R72j0BS/bW6nk5XnkK260+g2UybufChNJ4A3DWYoFNMjj9Fm5F8iRB1avOysFTkah/h6sc46PkfKW9vFk4ZmXXnWAvdlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742774959; c=relaxed/simple;
	bh=4SE6Vemd7wCvaQkb0zYO/4W5da96PGXTFuikVtM5DMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ADzs6LukXxbTh1zPtQtGoEfqGztLVFfffDYjscMk/tJLK5A0tHt7M3FX0WZLlCaRYUawYTCHPxRWzrUD65VAcqC7Q6m9jOowJ45lD+DW5+jRn43p54erYozynRpk2jXIJzznb3PPaissjexHwwhUtg8vFkn3HFkAid2aRzdV/Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wV9rqLZ3; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43bb6b0b898so35381365e9.1
        for <linux-media@vger.kernel.org>; Sun, 23 Mar 2025 17:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742774956; x=1743379756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gauWOuFMhrQoOGnZl7R840UuLn45kjs8rhjq8TVBvu4=;
        b=wV9rqLZ3zdKTASl+lMLx4pBUKy/BUtgv4M0p0bYluRmaeKHw89dO1Ps8pWzwOeQBNI
         Er06OSzxDOCD9VFtdE7A8/ncsa5VMPnhN2vUHw76f9VzQZdVMwXtWz+ViBGvLoy/0zUt
         0UR+8BseIC4WRpvCv9YxxKqdqiN5LY2LDIiz39n68kz4Dj/eQX6YMXBzGcqwmTH9r8lM
         lWJrfakvSr7X5eLbtVN0pjqMuU8PkrRXQ4rUYAlvNMWJ8XQ4DlglhX+bBj/B6tAakgIL
         c7fnpy9TsQ2nEZh1SeB7+qrKARLo6fDaXOseKeXjk2c1NMxH3c8MSD6BfyCVB1yVJuMN
         TL+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742774956; x=1743379756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gauWOuFMhrQoOGnZl7R840UuLn45kjs8rhjq8TVBvu4=;
        b=spjvuELJr0Hg7bjhjmlaCPhLZhfQSYAX3kG/RO4VcIC9L+SqjB7lYrt78bvn3I4Wcf
         g/Wa+4JPFe8At6my+DO7guQZkXj9K6iKA95v853gX0rMRf7Rr3whNBz8n12uBpDTqETy
         z/RgLhS7ZPh4/I3UsDneb0mxzI5dqKx0/EYHCT/++kEcIoGTQ4kPK/95uuKTvQFLpdLp
         Dat08CDFbp4engzriRi1m1L87f3h4raBOAJFPq73uyZYI474DUKoqT1jJbd5iOX1ZUxI
         VkGMXBo7YlZn/IYAKidGz5ncOR1i7HKXw68uNXdzPYzmZG3Kps5GzPlhKTUkg7UazrXB
         mOew==
X-Gm-Message-State: AOJu0YyFgLQ0gM/eG7pYl4J4VvhjyS8OxVTtLwtVRHT4pohHk3kvPwRJ
	/qORvMzQzn4/HG2zqCu6PrKL+AOWZ50VHkS7KiMWfF2ozHfyQ8FuCQX1V9Ev2zs=
X-Gm-Gg: ASbGnctcEaFSr1BOUyvObvwvH2L+ZTC5Ajt1eEoyf0TbgEpJEN8tX6qVzNa2VrEUOSw
	367SDnXlmeTWJCet7zzdPXZ5cyLSCjpfMx9yFNuDmRQUD/h8SJ16p+g74FDP0G4lVx9CsgXGx3O
	3+f2V5D7h57feHyoNWOq51kCLOHoqgG0QZODYWH9gEZrBUuVcChy88y0JHIKfY1uV8SNZ4FuPqI
	CwidNLuRi1wIGiRmA75nvpuMkUCIDw0ci4yCzi4ZTF0G87YU0UG8IrQIfUbkpYJZV2BhFwy9EM2
	9/ngg2gvlwxVd62V2Nd+YamJ76f5Kjtwn9xfEpjsDMo4L0ZqmkNmIss0D2wvxDuk7llJ8Xoftbu
	Gd9ZleCxvCuVerbjEmRlzHfRA
X-Google-Smtp-Source: AGHT+IER+yqN/cM6kd9faSy6V83DVxh7Xz9oy23ZPLx/sUlAswJ8Qvfspc/M7havH/WOMCaE9dvfCw==
X-Received: by 2002:a05:600c:1c18:b0:43d:7a:471f with SMTP id 5b1f17b1804b1-43d5ddec8f2mr43639035e9.18.1742774955623;
        Sun, 23 Mar 2025 17:09:15 -0700 (PDT)
Received: from inspiron14p-linux.ht.home (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fcea6ecsm103160875e9.5.2025.03.23.17.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 17:09:15 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: hdegoede@redhat.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	sakari.ailus@linux.intel.com,
	hverkuil@xs4all.nl
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 0/1] Add OV02C10 dt yaml description
Date: Mon, 24 Mar 2025 00:09:11 +0000
Message-ID: <20250324000912.105662-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319145927.70534-1-hdegoede@redhat.com>
References: <20250319145927.70534-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here's a yaml descripition to accompany the V10 OV02C10 driver currently on-list.

Link: https://lore.kernel.org/linux-media/20250319145927.70534-1-hdegoede@redhat.com

This yaml passes dtbs_check and dt_binding_check against the following dts for the Dell XPS 

Link: https://tinyurl.com/4a2w3vje

This patch should probably be applied before the driver patch to fix

Applying this patch before the driver will fixup the following warning

WARNING: DT compatible string "ovti,ov02c10" appears un-documented -- check ./Documentation/devicetree/bindings/
#1030: FILE: drivers/media/i2c/ov02c10.c:991:
+	{ .compatible = "ovti,ov02c10" },

Which happens because of the OF compat code I added in.

Bryan O'Donoghue (1):
  media: dt-bindings: Add OmniVision OV02C10

 .../bindings/media/i2c/ovti,ov02c10.yaml      | 117 ++++++++++++++++++
 1 file changed, 117 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02c10.yaml

-- 
2.49.0


