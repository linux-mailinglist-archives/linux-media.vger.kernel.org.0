Return-Path: <linux-media+bounces-37018-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F43AFB597
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 16:10:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 722761AA02EB
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 14:10:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CD6A2BE7C0;
	Mon,  7 Jul 2025 14:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yxh0fZDU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1039D2BDC27;
	Mon,  7 Jul 2025 14:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751897417; cv=none; b=TLYpXfrzJjAR7yrYxZIMIJ/XX7j57gogVgSjakUZKghWJXwJGpxxgdRA8EUjN7N6npKE8KrnOrCHWfzl4fahrVZi1EX/Cyusomf5Ens6OuGDfruOpBt3nSvhilYDt1K521LLl9PQ48XRl4unn8tmMV8W3xTxlax0sqLyQm1fJ2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751897417; c=relaxed/simple;
	bh=Ym1eaiaVRia3tu27Gd2iINJBWKHQtzx9zAsS8xqQYcc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GyUtpXBEHDGdG7x7bOD8Nb4VV+b7TIq6GxLkgPJeazu1lQa6Mtlldnl483wDAgE9LuDQxqVcVLVHvHwnQTkiXZ+hU1ODUk6V+ZckjshQGws0aUdHEmfHB/GsARyFhq53N29Rmr61dZRuvD7O5MU25S23NGX7WSYE/ntmeU5YoyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yxh0fZDU; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-60fdd24613fso346687a12.1;
        Mon, 07 Jul 2025 07:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751897414; x=1752502214; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zfoXr039Mj+Ko7iKVd/LqK9c7pPjVthdjnKyL8+H+oc=;
        b=Yxh0fZDU21aGKLXozCDotpb/micivIORtk8Q7MtX6VmjfB+Q0DAgeDPhYQV8BwtPKq
         Z+tEfZoEmhDxAjlhItPFuySQQBsghQij2YkdBBVEAIbKBnPK1s5f5WcArOnka39NOBzo
         Y3ttQ8AOeqTjT9LZz7BhQpml97nlUANMbgbLmnqfjlR1jJBLXjUAEytBg7gzh91U8HPg
         Gq//8KgFzxx4E5cvc6OqXthHCeEDHDdZK3ZkqTJTU4HnstjhcwrSNEzU/gvic2vid+b4
         Bs3EN8zNMd2wSF8qbIQ5YmwTfHEPdlkdymUCvsXbug+HK+GsT68F8xW93A7ktgBDxV3y
         lxyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751897414; x=1752502214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zfoXr039Mj+Ko7iKVd/LqK9c7pPjVthdjnKyL8+H+oc=;
        b=WyeO01gf6AMKzMYJaPFIri6qG1RAs4tLjczh4Ro2qZjEqrI8W1mlFYjASDSR+dvzjJ
         /gXBC3JFVNTFIMl/lO6mzl/YsY5l+WMOTflFRHOTxCuX6x/HySSV08x2KmffbPnb31if
         XELkqKtdD1A1efwJDi5yeRZvbJItkb8FpHFglEyaz6//UKf+cFJ5zUmFmlQMaPvJ67aR
         LP6WMso0uESSmYrjLgJ3OAZ8fdwp7Sr1QtovroWn/q53fMQG5abnSmMy0anpP6tutoGa
         GVzvrVhgbNbdmAs0cW/zGl8xhtr3yGm96uhwNx3jMj7QfBRAzU3Ajgxg599v4yv41rSI
         L3bw==
X-Forwarded-Encrypted: i=1; AJvYcCWs86znmGDI0XydcR3YsHp8FRLFAJmeW//CFvES3UXxG+sStp3L/1WpWgIVr9VNAyhByYFXtpuNgAfBKSM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxAQg7R3UratI4BETXuIfVJ20vPm8HiI1C8q5L9mGwq8DGgJ+H
	0gc6FKhCcLpeijFMBDlxrOxBtW2Ynacv/1aFgaNznCuZuAWCsBzSYfWo
X-Gm-Gg: ASbGncu+xC/46rZMxNEoONKhVFrRuK8A55m2i0GXcZYIo24n6VQfLwtrDN+/pM66YN9
	c7Ra4Yq142M4C6BROXVNufPCo67vCe08FJpoPeorUV6G6GDJB8fdtGPTWOPh/IhaQRUfxxqg/iu
	IDeUEHC0bbGY6geKXcnws0BaWH0tqbq/ShVOjg/ZZH4Qb7kTvuAyZIBElmUpSUTAAsmPLmETNCs
	6jVGbr6w2lSl2nFH31QJZNdCjRADNaVI7BpFWRgYhjXw7QKVOcg1RZlkPeFvR6XRpncf9bH7GA6
	kiNXuvfc/P29vmMDtcIhIx4QBBlYUwv8LY34RccDSk03JXI2RSVgP2l6GleR78otfynGlmamFif
	CbTY3JxzqjGkKPTNsHHqkc/WZwqe5vJ76sBej9F0eSAYXWp7ODHg12aCdSRtc
X-Google-Smtp-Source: AGHT+IEKnVBWadATSlejdndh1B5AdduKqoWoYdl+TXtUEryj64Oa+knTxIvJk4uK+Ngcdhrr6ocq9Q==
X-Received: by 2002:a17:907:8688:b0:ae4:1eb:c461 with SMTP id a640c23a62f3a-ae401ebc908mr384594066b.14.1751897413716;
        Mon, 07 Jul 2025 07:10:13 -0700 (PDT)
Received: from yousrii-VirtualBox.hotspot.internet-for-guests.com ([82.129.154.18])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d1ae3sm710370466b.7.2025.07.07.07.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 07:10:13 -0700 (PDT)
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.org,
	andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	dan.carpenter@linaro.org,
	Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Subject: [PATCH 1/2] staging: media: atomisp: return early on hmm_bo_device_init() failure
Date: Mon,  7 Jul 2025 17:09:22 +0300
Message-Id: <20250707140923.58935-2-abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250707140923.58935-1-abdelrahmanfekry375@gmail.com>
References: <20250707140923.58935-1-abdelrahmanfekry375@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hmm_init() would continue execution even if hmm_bo_device_init() failed,
potentially leading to bad behaviour when calling hmm_alloc().

- returns the error immediately if hmm_bo_device_init() fails.

Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
---
 drivers/staging/media/atomisp/pci/hmm/hmm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index f998b57f90c4..c2ee9d2ec0d5 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
@@ -36,6 +36,7 @@ int hmm_init(void)
 				 ISP_VM_START, ISP_VM_SIZE);
 	if (ret)
 		dev_err(atomisp_dev, "hmm_bo_device_init failed.\n");
+		return ret;
 
 	hmm_initialized = true;
 
@@ -48,7 +49,7 @@ int hmm_init(void)
 	 */
 	dummy_ptr = hmm_alloc(1);
 
-	return ret;
+	return 0;
 }
 
 void hmm_cleanup(void)
-- 
2.25.1


