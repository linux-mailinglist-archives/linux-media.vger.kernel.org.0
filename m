Return-Path: <linux-media+bounces-27805-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C69A563D3
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 10:30:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8DA3418955B4
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 09:30:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7F3620B817;
	Fri,  7 Mar 2025 09:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VDsWTn4q"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17DF20B209
	for <linux-media@vger.kernel.org>; Fri,  7 Mar 2025 09:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741339824; cv=none; b=lDVzrKzsj8BEeSeW8Bxs3A4NcHl3ThsIhfiiB9K78haLDCJ/SVyRnY+OkpESGIdaS05Op7GKSOmOBKN0c4++Lnh8dcSF2yZivT2jrvocnw8sASOyR7CJQQOeiS9Q8jlJZTxaYJVZJuFocrT3jrdj2TueI6TcU0XyPxx8C1s9Lhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741339824; c=relaxed/simple;
	bh=Ai4u6jucrFJEo5fiJus6WWtKhesRZx/NrT2YEqPhK3o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U0R8Y6/NgcaMC2D8aodCcHj8sjClDG09QogScyc3n+kRTCmX4mb+dSGP6Krd5/GLjPZaNx7+ThhBnIRyBEUWPHZdswYYJfDUyMZG+p+eDMPkr22wwERYv3NUx1M12qcZ6x/VUNFIg5MANJdgNcWAGvU1f56p6Qq+8uc3Kn5O7cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VDsWTn4q; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43bbd711eedso12523775e9.3
        for <linux-media@vger.kernel.org>; Fri, 07 Mar 2025 01:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741339820; x=1741944620; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=93blEQmxjswWheyXHKesIB+wQzCMQvJ6bucP/eSHntw=;
        b=VDsWTn4qx/JCgvdN9+TYPTjaj1IZ+ww8uk5lWdsZfzUDSYO35B0i/UrnmwcpGuLlzq
         stNmTrMd+H8HdhIhGKIoIGCBBd4fM5cqfXSnHoZKmOreAgstZJKAwfgq5IpJ9DxjE6h2
         wcVK/EVXam2bnd7hN77O+idKL4VPLZeuhOyKx35EQijix/IZl1uqMnJrwZWDINkCQEi3
         1CacdI896HKUOHOMs4B/DupEi4O2zManKuxUt0dQh9s0qA7aE7eUap2T/iqT/j2h4peA
         tgTt1BSqYYUZlILhzX41d/Z9Lg5ajWUXVKBwFf0MpcW+F03WlcNqOTGiW+MAgedH5uJb
         bX+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741339820; x=1741944620;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=93blEQmxjswWheyXHKesIB+wQzCMQvJ6bucP/eSHntw=;
        b=fnBP6KFIEg2F9jflt9ucsaIaOcncuJf2nGXOtRyio7dPWGclxjFDa8TZf79GKS3A8v
         BqjPxkSJKG1QHIcE5UkhnniGFY7JRqHZSGMg7cxc+jxV/gjM4UUxdklTGxUcAQtXAcNq
         E24FxTn+H//Qs0BBHv/W0aNop20SlDxEP+Jxnl5IeGv+43MVABtYTjR8ZfG/BzSKCYIO
         sHFPrDUk1GzpvsZoBr/Y4To8ubDNHUoKvsWb/+DY6Kz3E8dHJ5E9phh4oYw7Axfkfw0G
         fm8EdbrjG3gLsP2T1phHlCi5XsXc4nFvNmB0WpDUY03319rgDsiKhCv+Twxx0czsGJkK
         K94w==
X-Forwarded-Encrypted: i=1; AJvYcCXNzi6xDjWbRz4yigmGub04NNa0yuaILj6IQFJMJp0x7SHVGPZSlId0evZ7izsl+CgLBbhxe0yFUXn9KQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVGRPJZ4yJPlR7yz1jq/0lDCHGLKqwZpRngZjNkcWwI1hbz8Ws
	rrZNov15a0swcr0DC/H3wI3ZNvPz9mdy+Y1gS4xcHo9PdpFdTTYnUbmzLBU3h1I=
X-Gm-Gg: ASbGncsOE0udX4/3uzgxZtuSvqvDnvgZEijny2+rdAqlNByZZUjJGslMXbjOCF+tWsv
	38JmDydQJMbS/TkkkuaI4EBY3rWXukTncyjCGW2h+BE3IGSraeh4dZztUUtlCIgy0uWFjlcJTEU
	nq8QpNhcD1BgdSRw4ev/ZhHLi8aq2RaL2IX5M8e5deyMdIizRy6zZ+voMxzgGsF1e9LqYrX5m8Z
	1PpVwJGEl1zUContDb8gSfQEQWjFstIX039xWKAUDivakxnfE/Ym/itUg7VnZ7sxKiXkmOXxuCw
	RTQvVFA3MAiH8Jt0ExFOxk9f88ub8SK5Fly/Cv1UH33JfW1zCQ==
X-Google-Smtp-Source: AGHT+IF7W0BZOmIMpa6aTO/bUCCYodrmELNE8zettIHxeBxOTGRaV6zmqbl8WqRyoPh3IyqfSxwMVQ==
X-Received: by 2002:a05:600c:8a8:b0:43b:ca39:a9ca with SMTP id 5b1f17b1804b1-43c5a60e07amr22236695e9.16.1741339820010;
        Fri, 07 Mar 2025 01:30:20 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3912bfdfdb9sm4709196f8f.27.2025.03.07.01.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 01:30:19 -0800 (PST)
Date: Fri, 7 Mar 2025 12:30:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shreeya Patel <shreeya.patel@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Dingxian Wen <shawn.wen@rock-chips.com>,
	linux-media@vger.kernel.org, kernel@collabora.com,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] media: synopsys: hdmirx: Fix signedness bug in
 hdmirx_parse_dt()
Message-ID: <7ec94789-305c-4de4-b477-c0eb839170e5@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The num_clks is set this way:

	hdmirx_dev->num_clks = devm_clk_bulk_get_all(dev, &hdmirx_dev->clks);
        if (hdmirx_dev->num_clks < 1)
                return -ENODEV;

The devm_clk_bulk_get_all() function returns negative error codes so the
hdmirx_dev->num_cks variable needs to be signed for the error handling to
work.

Fixes: 7b59b132ad43 ("media: platform: synopsys: Add support for HDMI input driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
index 4ffc86ad6c35..e0d3fed87a92 100644
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
@@ -154,7 +154,7 @@ struct snps_hdmirx_dev {
 	bool hpd_trigger_level_high;
 	bool tmds_clk_ratio;
 	bool plugged;
-	u32 num_clks;
+	int num_clks;
 	u32 edid_blocks_written;
 	u32 cur_fmt_fourcc;
 	u32 color_depth;
-- 
2.47.2


