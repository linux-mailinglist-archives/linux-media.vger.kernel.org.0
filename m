Return-Path: <linux-media+bounces-50251-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F029AD05F93
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 21:04:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D5223052A8A
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 20:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9CC832D443;
	Thu,  8 Jan 2026 20:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A5qyu6IH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D76328B43
	for <linux-media@vger.kernel.org>; Thu,  8 Jan 2026 20:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767902617; cv=none; b=qQseUwxBJYgPDrQ9xK1/SvXCvlyoBReRTGm14oOFGf3aR4Mc6TD1B6ZA4xbc11Fi/1a71lnf6F76zOSx8FomkBul4YImZ/sPCWC+L3P2Em7ybz4KgNZCJEf3rqirhaCiFoju7/GFnkUapjyua0Lx/7d/8kqd/6Hvy0lvEHjTqf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767902617; c=relaxed/simple;
	bh=xW14wuO3rpDunHqMU7wmi3C0CV34THPunsb7vXrsYYk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g7JXP2rY3x1K3hjQSrgYirWqPEwdHZxO6K7egWPVwRhvyuFBaGBtoONytvA/PYEjDNvPJ1CsAyS5vz9w+HuRMrzfzpCvKuiCwRlMMGtamdesSoHEPvmb/E3uvQYryVvqzVSWrnmwjXXAAMF32eE2dwflhYpvQg77Z3XaxQpXfDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A5qyu6IH; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so28355145e9.3
        for <linux-media@vger.kernel.org>; Thu, 08 Jan 2026 12:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767902614; x=1768507414; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U+0IrpcN+V0oqtValorBiZ1wiITEvHQIGq+jybV+6PM=;
        b=A5qyu6IHAjh3j5QjY1VhAY3yO1sfc1KUyNuIKKeBkeOsWVx7zoO9GKB+fDcQvNGIXE
         BWs/OtZJ6mdXNGkU1vzDawn74EgHQpn1APPyexKB/EMT2vFqHhF3KHj6ZtZ0l9PXn0LP
         j/CKjD0QFvnljZZopQiPmIkCDjQLxCyNHdO0LTejCS02g5DE9d9+xVSSR84kabENFK9n
         sADsdummxNvO+JEhIQVgHTOrHGWI0TAlmIcNzsyrIytCHGRlhTxMAeq1+ftyW5l6Ei06
         vClD1nDo0Yh0UK7kpQ1c6YqXZxGpilcvCr64Dp4Osk8dlbgJM9dO7vGJ3lB9euan+Jym
         sgXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767902614; x=1768507414;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U+0IrpcN+V0oqtValorBiZ1wiITEvHQIGq+jybV+6PM=;
        b=FeBpYasyQtfWfTCUjDvA9IKaWUTxING/KOJXgwfJ3s2NP50BvVW+FeDj+1iaaPjKnU
         log06e2uzgpuL+NAC2yl9M5wgNmYj84gjKRESKVyamHiw8xnHg1JqqVRB6YgQbKb6Lyi
         Liwuv8fJvKFUSrK4INSXQ1PaTwfz7h7Kcvc7xTOK8tXqghIgqiNLvMJYmf+Z8kbtJvlT
         S0x+xFZA3yg8OO1HwDQuc6XOEuK9db0YVqgOHqFDUZhjkPdHKlsZnMx5smTyAd4PE2LZ
         66n++C7S1s8Rw+Ro64R4zLSi+i5FiOojXXFnssde8ub5blHB6ZzLUXeabPd1Lcz8aJ0d
         XO3g==
X-Forwarded-Encrypted: i=1; AJvYcCXoiqrfQpBZGUcsXC1my2xdoE7sR6RJE9/o6vpq/nHFMATuX4TYbcDXEqFqU/xLtDK8crXXUURLLKyWRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWL7IDqSrXLHT1OGp83Atygsw9EaW8kPqG4x0C/7D1cY/ZD/k9
	KZ/Yos2tX6KoEv+kw0NHUPdhiQzlrvatX78OLioCFjREK3qzh5Y4WtLrZFXePmhkNR8=
X-Gm-Gg: AY/fxX4nnvZPQWbtnrO0hcNk7fj9iUrXuLbrN55dypfoZX7Bg5MzJeBWt8yrWtNOvU+
	A2e8yXHZ2t9G9YArIC7fcc6/m/hgHbudvuujyJ5jOPx7VF7/nid6fWi7UbNQx/H51AiPbli9SFi
	dWJmdaoUUN/75Zk2HdYnr/7F2XYSuSx6uZsxDos8k0OZOg3Kl+TMwyQsLB9qVFN/nhHidLnGmIG
	dqAXRJZQc4UldmzxJaIfOzZOxcB7mu6e7j/3LZy6bKB/tfedTDnZMFS/3lB3H6SdGdscESf9gEd
	SGFVSkA5xFrKtydAk6rwYrm73XjrmbJN/tjcLZ/Lb3g/GvdI+WKG1IF3Ol7U7Ol+GNqm+qwVqq2
	LTgtstLtDvYTG+wnBCVBVpS3MQZk0nDtj9QYt8hriJaXwC2xPTwzIsqLWk8ogDt/K1PKeUKg3m8
	ZirBpUzqaE84HTnfIO
X-Google-Smtp-Source: AGHT+IF09Jx1RsKf/ckE/pQqCWP+iFQloONpAQuOq6DavbULp1WEe4q21ANMIGV5Sd+vyzTCa2FeOg==
X-Received: by 2002:a05:600c:450f:b0:479:3a89:121e with SMTP id 5b1f17b1804b1-47d84b614c6mr85847175e9.37.1767902614177;
        Thu, 08 Jan 2026 12:03:34 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f65d9f0sm177083095e9.12.2026.01.08.12.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 12:03:33 -0800 (PST)
Date: Thu, 8 Jan 2026 23:03:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shreeya Patel <shreeya.patel@collabora.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dingxian Wen <shawn.wen@rock-chips.com>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	kernel@collabora.com, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] media: synopsys: hdmirx: fix integer overflow in
 hdmirx_get_edid()
Message-ID: <aWANkxRApxDeReRW@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "edid->blocks" variable comes from the user via the ioctl.  It's
a u32 and "edid->start_block" is a u32 too.  The addition operation
could have an integer wrapping bug, so use the size_add() function to
prevent that.

Cc: stable@vger.kernel.org
Fixes: 7b59b132ad43 ("media: platform: synopsys: Add support for HDMI input driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
index c3007e09bc9f..f054e30cbfb0 100644
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
@@ -717,7 +717,7 @@ static int hdmirx_get_edid(struct file *file, void *fh, struct v4l2_edid *edid)
 	if (edid->start_block >= hdmirx_dev->edid_blocks_written || !edid->blocks)
 		return -EINVAL;
 
-	if (edid->start_block + edid->blocks > hdmirx_dev->edid_blocks_written)
+	if (size_add(edid->start_block, edid->blocks) > hdmirx_dev->edid_blocks_written)
 		edid->blocks = hdmirx_dev->edid_blocks_written - edid->start_block;
 
 	memcpy(edid->edid, hdmirx_dev->edid, edid->blocks * EDID_BLOCK_SIZE);
-- 
2.51.0


