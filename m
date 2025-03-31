Return-Path: <linux-media+bounces-29043-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6BDA76379
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 11:45:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F5291889C66
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 09:45:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB1AB1DEFE7;
	Mon, 31 Mar 2025 09:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fK12p+UV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4231953A1
	for <linux-media@vger.kernel.org>; Mon, 31 Mar 2025 09:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743414318; cv=none; b=ADKhAHnPV25zukYGoP7g8bvVrrJ8WQm0c7gO/OzS2TUjDBpYklB9plLxm+qXLrAVDpvMfc9jaPlqdsKzypm84OMy88UvIVucj76hymekUzOBVPy+tebV5nOxy5ZonRJb0CaraKdWvsxJnd3a5X0twBp7LSFD9/aneW5f6pmQhJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743414318; c=relaxed/simple;
	bh=eb5lElBQ52SQo2tJMBhxvP50tBy4RgLuAmk+7/7KVYM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LI5w9GpgpCU8fl0Po9j8javRpJvqJBpMd7TPcj1zvUJugJ7nYiBst2gk8Bkq4qkzPYXRWwUaen+FkLbZCKcFTHV/WbPP9hw8XYyA1KxpqWI4js1teUdd0LOeilzKXhciC/IP2Qju29nfm9I7fi9HhkJP4wHjg79c5WGThl+sL6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fK12p+UV; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso40579505e9.1
        for <linux-media@vger.kernel.org>; Mon, 31 Mar 2025 02:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743414314; x=1744019114; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aKS0Fboa1dtHIDG4S6gLCYTAz2lAP8mKMrYFIOMeSw4=;
        b=fK12p+UVwSTQk21hUWwQ9pWJpdybFLDovx4h8HgAAxGbV+KYv9uxvopVmmCjmWBUVk
         ZG+Xb1Lqq69CWNWo5Fg7fHTp5bpncmAaHIrFwVYNyBsJ/hCMjtwttSSbsGz9lUbr/HyD
         SXsvKe9xyLV7xVnyHZCBf0adqBzerEVTw2et0MxOWev4YnttYGifmg3Ysb8w8K+l7h2q
         9WV2g7Xoz6Sz6s+YWTpV9ofJfjiEWcAow/fRwiiBLgj8XwYkDj9NZvZpfHHFtjqRFt6U
         RMs0U/+gYNASifZF/IyEMkVV9OwWAAWwd/2r05A3kBDIQTGlSCe8GohO83BsI7l37stE
         SqFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743414314; x=1744019114;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aKS0Fboa1dtHIDG4S6gLCYTAz2lAP8mKMrYFIOMeSw4=;
        b=c8dmazIVEyukHLd5UM8lx/Y66WZwSv01BUJJRGbNXY/OHqCQxdl/k92XCJg8mE/0xp
         jmUCoZRDuYiz0MoQM7dZN+YdPRlu6AaiFdeGygE7QYaQe93ip9Y6Zuqa2IdipgpiL7kX
         zNt2UW5DKlh63SI7oko+MMESDXFNq7aRPa1AqRZwiLuyO3mMwScas33EXk4i3BIoBuCU
         NmVze4RnTar/93rHwPPuuZu8hUZVugGOVtVoSPKkeoGeSJUev+si5n96jE1Jn+ZPZGLN
         ROE0nvnRbakgndRmAg6mf+uCp6Edr05362hDsyH09XNOqfW3rXctWbgSCcGLIl1wtqcD
         xQ3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVGoOdDeF9kYfF/A+p+JCd4YVaJbGV7vWQHcl+CSaLGCtyYoCnEnMuH/guAvB7tWHQJVTdBF1YkESqZHg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdk08Qusnqc9LYVi1krkFOck86WwujLpNo03BLp9ymnYOk1xaJ
	v+jSg1f0XQHfORuTAAbG/wn57rmitTA2u3tY8HbP7Z5K2VBXal6nhKil/9WLxSY=
X-Gm-Gg: ASbGncvkF8x99W55/wa/9NONkY+XH2Snbl7t1DmwCt7EncP6NYJOAGZQNRLj9ieX++2
	GzmL7U5uWdiYVH3S3w+wGvnuc+79Um6ugYISp+vHklbYUOI4qp8qFFg4pL9MBgd1wGPSZF6RSH0
	BmaGwv7A0Q4GmaNyRTpLI94nIdWk8R/ddJlm9STcbO+73avPAO3wjjRtNq8vwWfURSsS+zuwz+J
	ttHcGZ5eYreEP4z8+6QgGBgaZV8QWzkZ8A6ApXqOqT8yfmth4A2D75WtyVOZA5qSONrKXRg0QS7
	csB5hTYq7b98q+s5ZWJYd2+VmX+9I+c9sLhrJocqNm9u6Q1sDw==
X-Google-Smtp-Source: AGHT+IFVzFpYmKBAGEXWi3zw7wUU5N+0+BO4pZCgxv4I35ZkC0wJP7yiqMMStfAjpc9DsFCTgkEtog==
X-Received: by 2002:a05:600c:83c4:b0:43c:ec28:d31b with SMTP id 5b1f17b1804b1-43db62283d1mr102074565e9.10.1743414313954;
        Mon, 31 Mar 2025 02:45:13 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d8fbc10e1sm115778485e9.12.2025.03.31.02.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 02:45:13 -0700 (PDT)
Date: Mon, 31 Mar 2025 12:45:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Clark <robdclark@chromium.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
	Gustavo Padovan <gustavo@padovan.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Pekka Paalanen <pekka.paalanen@collabora.com>,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] dma-buf/sw_sync: Decrement refcount on error in
 sw_sync_ioctl_get_deadline()
Message-ID: <5dbd6105-3acf-47ad-84d6-2920171916ac@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Call dma_fence_put(fence) before returning an error on this error path.

Fixes: 70e67aaec2f4 ("dma-buf/sw_sync: Add fence deadline support")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/dma-buf/sw_sync.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
index f5905d67dedb..b7615c5c6cac 100644
--- a/drivers/dma-buf/sw_sync.c
+++ b/drivers/dma-buf/sw_sync.c
@@ -438,8 +438,10 @@ static int sw_sync_ioctl_get_deadline(struct sync_timeline *obj, unsigned long a
 		return -EINVAL;
 
 	pt = dma_fence_to_sync_pt(fence);
-	if (!pt)
+	if (!pt) {
+		dma_fence_put(fence);
 		return -EINVAL;
+	}
 
 	spin_lock_irqsave(fence->lock, flags);
 	if (test_bit(SW_SYNC_HAS_DEADLINE_BIT, &fence->flags)) {
-- 
2.47.2


