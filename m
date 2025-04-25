Return-Path: <linux-media+bounces-31019-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 607C6A9C2D9
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 11:08:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B54D4C3A56
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 09:08:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F14B4238157;
	Fri, 25 Apr 2025 09:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="knxVnnQe"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3B2235C14
	for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 09:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745571926; cv=none; b=PZdVizcuoQMShcbFGln7jdOV9sInBwWi8MBmcjrXpe2AH2yZyCO5YXqxPOJofT+J8NyJDJsmtNNEedCieNLO5xV81oBK3R0s0lKlcialeMReELb2wsaruMKKltymoAPAcNGZmO9n5/3t1VrPFcSCBaDDaNZfdqqaBLY4M0/UfrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745571926; c=relaxed/simple;
	bh=UAurvGMTUbCq0DZeWZJRe0RK41KzHEA7IltJK7OZ1oQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EDJRk1xxGMAThcCDfG7ospEpFE1STVU9+Xgr9PcddNyspsJavVgXRA/wFTk7ybPPauZPSZlcRVBQDF0Ny6Fr2x2zdV2Sv6gfwlQXG6gxHnhCPzAhUm7eWsGNCIJohPUgU6GRhQcEHdmorp+tyd8nV0l0PjSgKE9Fybnmn6ksb30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=knxVnnQe; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39c13fa05ebso1290640f8f.0
        for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 02:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745571923; x=1746176723; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VrUZNr/LN/9htUEHRaSq2LQBR+kC1UivZliiMRRS8ME=;
        b=knxVnnQeAaWKMFPt0goHv0LVrYR/h1XIH7xU/SUaCsAGMWhdDMqiNzVvxqqIvDGEeH
         VVTtIcsuix7hAfLgKiVCx1M/Lm3Du0LNFKDW/lDroTkLbFdWS5s+kypA1HlcqBnmBqbP
         OE8nI1pINq9/QpuPOaVUfVKXOHpKDnyGxmHM8oTo2ULusJqigpVoUjXoo7FbjkXBdve7
         GRlwgb7AacuEcwBvhvO/QXNsOOAHgdkf063kr24Ld7EpW9EgoQcIE/MT3Oue+yf1yiye
         NzJoQyOvA9DcBh5QlXLiOMKafKcywDcOfXpn5PFlmhonboel4rm5mB8tQc6kUpHkjyiU
         TR/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745571923; x=1746176723;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VrUZNr/LN/9htUEHRaSq2LQBR+kC1UivZliiMRRS8ME=;
        b=f4HHxpvoz9GTlSK1MDdPA9ARhGV6T1Djg6Us7/lbEXMVaEiM5h+qrz87ZAutRM2+dt
         TsTdYZEeBuL9P/hrblnKmFrGf2JFU6I5F+ajFgNFCJWEJxrGuWlE2+ly0oucm0qutlJR
         HVKkt+REEMdZq5ULFMOIERW3xe0aJPhpeA0ClSPL/UwuJEdW+PNXR0bAxZ7hY05YAcYL
         ymfUgU4oliQRHpJJQ52MGbsZOk/17hHJI6mO8gYmxmZjJiUnpUmkIcM3svGFcMgwz1dR
         wt4OEz2QK30UCVCsu9f3tvTg/+SUzQSlg55I0yY1As1suMGmbUQQdS+Rs4wpTNeUlbcT
         JiEw==
X-Gm-Message-State: AOJu0Yw3xXEaMfWe6zX4hpV4u99nzXM+OrZmPsaNwHXMCqKwFdYuzcHU
	UDjm4a7t5uYg/gG7fRFZmdKnUdFGQBlcPmCZDz1sN0eZGQzlS0tUMO7KLsExJ4OtbVP/m+7O88J
	z
X-Gm-Gg: ASbGncuZdoOHUBliaLptLZ8mVT1ICN+2J15sR/0tcCi2x6uKRRRfqUU0G9M4n+W7zbi
	szhBTpsmWhpKKfHslS9ZXe8zHJqFgZDFH4dwsWyqmb7W9/WzWHdwltPPfHVIQur2yBPQ4l9WBfo
	mY4PEcKN9HKkBzABYwQDpWgQjlxtKDhhCeQRwr5wMMC1CvWjf5f4AkltEpXryVLMq/yMZ7g3Dcs
	wZJC3Mf0tX/997l/uIQyNsiNW2Y8NuPgmRjb0wNYfMAyNYIA1pTMRczk4AyWx6QX0in8nEWCBT8
	EGCALzpxtvLP5d9Tti45U2ykYIlan+u0EUoT5bsoSYLRPA==
X-Google-Smtp-Source: AGHT+IH5f0aoeTCt3lM9faNIRDQQ3WXmGimYtXuMBGtgq7Qnd3+QH8QMv01RI7loDqbNZMvB+i3J4w==
X-Received: by 2002:a5d:5848:0:b0:38d:de45:bf98 with SMTP id ffacd0b85a97d-3a074e0f64bmr1094780f8f.8.1745571922811;
        Fri, 25 Apr 2025 02:05:22 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4409d29b990sm52516965e9.4.2025.04.25.02.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:05:22 -0700 (PDT)
Date: Fri, 25 Apr 2025 12:05:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: linux-media@vger.kernel.org
Subject: [bug report] media: rzg2l-cru: Add function pointer to check if FIFO
 is empty
Message-ID: <aAtQThCibZCROETx@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Lad Prabhakar,

Commit 446c645f7fe4 ("media: rzg2l-cru: Add function pointer to check
if FIFO is empty") from Apr 11, 2025 (linux-next), leads to the
following Smatch static checker warning:

	drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c:351 rzg2l_fifo_empty()
	warn: duplicate check 'amnfifopntr_w == amnfifopntr_r_y' (previous on line 348)

drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
    339 bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru)
    340 {
    341         u32 amnfifopntr, amnfifopntr_w, amnfifopntr_r_y;
    342 
    343         amnfifopntr = rzg2l_cru_read(cru, AMnFIFOPNTR);
    344 
    345         amnfifopntr_w = amnfifopntr & AMnFIFOPNTR_FIFOWPNTR;
    346         amnfifopntr_r_y =
    347                 (amnfifopntr & AMnFIFOPNTR_FIFORPNTR_Y) >> 16;
    348         if (amnfifopntr_w == amnfifopntr_r_y)
    349                 return true;

We should either delete this check

    350 
--> 351         return amnfifopntr_w == amnfifopntr_r_y;

or change this to "return false;".  (I prefer the second option).

    352 }

regards,
dan carpenter

