Return-Path: <linux-media+bounces-40123-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 64743B29E78
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 11:54:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1631216E3D1
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 09:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEC5730FF25;
	Mon, 18 Aug 2025 09:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e2AxEVcU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4159230F80F
	for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 09:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755510847; cv=none; b=QDJZkjW28OymknW0VTFXK8HEZL6ozqXvsZTt+hc0otdZxK/I3Wybrs3DSP5GxvykfxwzB9Zpa99k6Gri05B7OhueVhk53OvLQhbuyr7hAHqx9GLgCpGGBaRLfo5VRGM0KGRs2v1NhbLWK0yjOTbSZLe8M2LQoOJXWprPAdr0ISc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755510847; c=relaxed/simple;
	bh=nDf5IhLQrbrGGDiKoZdCPkDrArJhhFQx1IwFcMrBtuc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J9cW+jAqwip2is8hemFMWGDGv/PED7rbMN+3gXC25vTorQvBvyETMv4hFq+8rWN0O+2TWwXprUoTgMzLZERJ8TZQ11EZaUYDCEht7PqxahsbMA8xCzYxnPbfZfY2jTJSHYk/q57zIkKfhButZ1O6ibuPMCvOlcVypqRalMeZCcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e2AxEVcU; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3b9e415a68fso3734630f8f.2
        for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 02:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755510843; x=1756115643; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RjxE0JoWh7KeO7hHrmyRRKT9NSdOiV1QyUKIGfRvIjU=;
        b=e2AxEVcU/FQmhjEu52Hn7kKILrTZ7viVuhH0VULcGw9f5SHD3hEzQGLyhWLiC6LtC7
         oud6mP6ytY+CNx1mQieKiKQS8dYTT1zU1t1JKzvEDFrDCU7Ii4uUDbR5D6d6iEy2bHGB
         qTvbGxFfjqNyKihGpAuUzqt5eRaGw3K7Y57v0uD2JWmNXWZ4BuJDr70all7+LNxhAEJi
         kD7If0pa6iOA8E7uq4ACmqHSmF+zQkC8/f2JyyI3mOz2KOyPLjkoHyT93x/i3eI/GRet
         2MByL4B+DJlF8u/4gCLBGK3jX630+i8Xaj9km1u0MquOZkB+8YS+LfbQlcxi1q4e1rHO
         h1/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755510843; x=1756115643;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RjxE0JoWh7KeO7hHrmyRRKT9NSdOiV1QyUKIGfRvIjU=;
        b=PjzuTw5TQJHLRg+6w4y+YfDFOVF3Y9f3uNd/8IBx1Ao1NMndmwobjBArqmbY/f0uMU
         8MCRpy6RhbEtK7RKeF3NGKy5KaGZw6OonhMHyAX3FaR/2dAaw8kwLc+F2Drnxl4hMqM+
         LdWa5vy46AQkgQwAa/juAJguURi82LP/GDiUbFcHC3bZOKpTxtMuoEmTJY9NcfAOEGAs
         ZgKVAuN/0aGrLuOZP/tqj5xSqhJXgjlfZIaxyNA25kGHAaGiLvdgkZo6F63GtrB5ZjdI
         zE7nTsc4h4RxEkrZK1mN1BhXJYcBvezRTCkID5YTZPCzHaUdGnL9bqtsz3QO+b5AOkFp
         H4EQ==
X-Gm-Message-State: AOJu0Ywqq/k0I/0rxOiduySIpNoGFGuEB7xPPhF0u/Ref/jiO42dr3u4
	+XevcM+9YOewjZuUgxb6uZac7Cxiv9ltmmKVbK8ah4EH+x6Qgghu4tGy1NndWFEx4WTGpZMyGQJ
	lYV+D
X-Gm-Gg: ASbGncttvjbjQHRNvNEWdYGmICjWFjNde9+GdSq/GTo5dNC27vBm0H5fdlAExCAZeWw
	zFYdp+4PL0Sh42aJVyr5yrKuSWFRP5vwDz+0OUFkeIM4QVQMl7/WQGJAupiOO0AQIJlzXriko7r
	SnH5rnOYntNxTEvroloHqsNhX9XV8eVbqip24jtTZe3ZaZZaUuLuQ0iGUyvRMxd8v+Rl1bFVcuw
	FGzlyelhr4VWtwwWjg4Q5StKS5WON++pc6a9jIVroi0SGWECMPW3OQdVz/0+p0V1xoRIpQar8bA
	w8a5pX+9NYDty0kzN3yZ7ZiTVmS8FgS7OaRrKpEaXPSL/oRtf/Eg41i0XN+oUcLkTBfo8k2pIxH
	vnTiq1Xy9aj9LN/oXriXNDCVjq5EDvAJ9ZWpcsA==
X-Google-Smtp-Source: AGHT+IFKvjXB0/xnOp2CEKc14cv63+L4INqD43bgC/Or8Z+SXI+knx976XZrGBrdUM3PWqIhtN60gg==
X-Received: by 2002:a05:6000:178f:b0:3b7:5dda:d57 with SMTP id ffacd0b85a97d-3bb694ae02dmr8593825f8f.50.1755510843486;
        Mon, 18 Aug 2025 02:54:03 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3bb652f9debsm12592198f8f.28.2025.08.18.02.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 02:54:03 -0700 (PDT)
Date: Mon, 18 Aug 2025 12:54:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org
Subject: [bug report] media: cx18: Access v4l2_fh from file
Message-ID: <aKL4OMWsESUdX8KQ@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Jacopo Mondi,

Commit 7b9eb53e8591 ("media: cx18: Access v4l2_fh from file") from
Aug 10, 2025 (linux-next), leads to the following Smatch static
checker warning:

drivers/media/pci/cx18/cx18-driver.c:1223 cx18_init_on_first_open() error: NULL dereference inside function
drivers/media/pci/cx18/cx18-driver.c:1229 cx18_init_on_first_open() error: NULL dereference inside function
drivers/media/pci/cx18/cx18-driver.c:1230 cx18_init_on_first_open() error: NULL dereference inside function
drivers/media/pci/ivtv/ivtv-driver.c:1313 ivtv_init_on_first_open() error: NULL dereference inside function
drivers/media/pci/ivtv/ivtv-driver.c:1319 ivtv_init_on_first_open() error: NULL dereference inside function

drivers/media/pci/cx18/cx18-driver.c
    1214         /* Set initial frequency. For PAL/SECAM broadcasts no
    1215            'default' channel exists AFAIK. */
    1216         if (cx->std == V4L2_STD_NTSC_M_JP)
    1217                 vf.frequency = 1460;        /* ch. 1 91250*16/1000 */
    1218         else if (cx->std & V4L2_STD_NTSC_M)
    1219                 vf.frequency = 1076;        /* ch. 4 67250*16/1000 */
    1220 
    1221         video_input = cx->active_input;
    1222         cx->active_input++;        /* Force update of input */
--> 1223         cx18_s_input(NULL, &fh, video_input);
                              ^^^^
The patch adds a new dereference of "file" but some of the callers pass a
NULL pointer.

    1224 
    1225         /* Let the VIDIOC_S_STD ioctl do all the work, keeps the code
    1226            in one place. */
    1227         cx->std++;                /* Force full standard initialization */
    1228         std = (cx->tuner_std == V4L2_STD_ALL) ? V4L2_STD_NTSC_M : cx->tuner_std;
    1229         cx18_s_std(NULL, &fh, std);
    1230         cx18_s_frequency(NULL, &fh, &vf);
    1231         return 0;
    1232 }

regards,
dan carpenter

