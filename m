Return-Path: <linux-media+bounces-53077-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCd7HFzIlmkGmwIAu9opvQ
	(envelope-from <linux-media+bounces-53077-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 09:22:52 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3123A15D0AC
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 09:22:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 844703027D85
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 08:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F857337686;
	Thu, 19 Feb 2026 08:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LR2WH5ne"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14679234994
	for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 08:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771489363; cv=none; b=DfbmS/uO3PWKzGARysgFcgteZrFHmOKBeyiN4ACStgDEm2QuQJbCLpuBugz4ZjtMA3+wcm6eWLaWiank9JbNFLUlPlfcuY5VU/b7bmdS9LQ2ELjM5D8Gg03ZKaw2xS6kq6tBfRMpQd2nWdOEBj2oOfUkwOg2hgeSJsx/2rQW+QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771489363; c=relaxed/simple;
	bh=yJ+COvpiMGz+oVO3xJ3UpYvs+If0stPqHups40gU1fM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=fUE9GQsVg7LzZFzhTudTSwhh8oBEFzihWu6QjcgOYOx1YLXG/4erBkhmeBUOw9GZwsgQqQ4eFsEVHfN29O8Q/FoufA3pxir98M/Ofj4kElWpSjI49WVQH7jsV5ruAeC0TaTkAnjlDsdhYfDR29hCj3AGg8u0bXX+pu5fEp2eC+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LR2WH5ne; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-483770e0b25so6756795e9.0
        for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 00:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771489359; x=1772094159; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0D6P+pMy0FNkLSD5nYId8+lNUqZXXTENXB4evIwBeIY=;
        b=LR2WH5ne+2DFwqu0zvtQYR3x8AWZaDRFmJ21Vt44UKjvnjGu9KtJvIvf3szPx7z7GY
         fIrz9dTLAQNpnH1RRT39JXEEbzGGTR6ZDZw5bCLp7CFiRsEutUFBt2ANxosfL1l1IuoP
         IDwNXAP6sTxYFC3OxYZJf8I5Zpq9ZQzndCNwxcrKL0aC7ZuFE4KXDt79VNV/tq1XoZ8k
         b0n6j6EOSDjrH5e1LowK92BNbwvRdIAF6e/kFSN/sjPFN3zSYsDyaPthOfcdgLbYV0hD
         YzQJAhaaeqWQG88oQ2hl7d3o+jJzYW3p8ow9xtwoPy/+foF2cvZd2W8PSfV9/XhMYSmZ
         V7xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771489359; x=1772094159;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0D6P+pMy0FNkLSD5nYId8+lNUqZXXTENXB4evIwBeIY=;
        b=dlEOkHFhDy6KOwd/bj3Sp0ePUefujkFFCaOGTK3aXhz7ZVp/CXnoQ2k4hAYRKCqqSE
         C3Ky/J1YZu5DhESaGoEG2+VgaIjDu7/cr+/uGLCHM3yQnc8qv0j51Qao5RStF3oyEGef
         oT5NbYhaRfJP9BWGmORQtkkInp2UjdCMVONVX7DrcS5yE+5AT2zeRSf7T0AL/0X5Yhmx
         pvfZdJQR1NiltoNZs9VRrCpB4bX1Blto8U/N9jw0OInAqKhejCiJIQsUYVgUc0W/2gpr
         Z7PwRC4VbU0RA2ujgMJO/KtYjifAHeQzi+znYuDGLRpK+bQk6Yioi1Ob5HhjsuI8ZBsH
         fXBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQFJb7BXgsopgwMajAVIBEgDzUURXevki12cIRYRAMmeY43s6u8Oe4p1SKVNMJWRIdi6dPSSKiiWxWxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzI5+YPjlM/+p1MA46oLvML95nKXesg3Wqa8N7cBh0GDg3PjRhU
	NJMxSbMY34jyAWUGaQ/pmJbo+Ap1PDbW0DkEk0FhmEJLSTj72bE9K6RWzavbka415mg=
X-Gm-Gg: AZuq6aLD4nEALkwqrv6NQwj+HqO4BsjXiWiT02YDGlx6xVq0MV3UiAt8mGAGmvHS0Xz
	OlG11RvX70YFwbhxm5Zu92Da11iguH/YoK+0N3TxJ5yvRb2DlDcAf7Bt5PuNWKkVoeuqsaOp4uA
	2dS27YO9UF6pb+MYaFCkq87o0hYUddHEbMfJ9GS3SWj6n3PDMBdGFF7jN6IyA9TciJ+KVMo28Ge
	cFu/RaeQNFGMJyhJ7hf0GHFu/zq+3664hDxl5nu7F/KmV7j8vbv92PhoOFfpGis9BrsLqUKRQ5w
	q1C9qxjxt1fYhtfh5n2wMhqzN9t4/TUL82TdMHWIrzevKSgmifhdpUoqlT3uUwM5G79XFVfT4tB
	HR5PcjO40YfDmKLa/apVZvwNwtybgcCiEpSfx+fXB6dp67k4u82iZY3CqfJ3ddn+GioygK8c9NU
	1wwdB/TbeXJ6FtOnAsO1SWGOLE5GZL
X-Received: by 2002:a05:600c:870b:b0:483:6f37:1b56 with SMTP id 5b1f17b1804b1-48371051b15mr358346635e9.10.1771489359323;
        Thu, 19 Feb 2026 00:22:39 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4839f986118sm12865185e9.21.2026.02.19.00.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 00:22:38 -0800 (PST)
Date: Thu, 19 Feb 2026 11:22:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Larisa Grigore <larisa.grigore@oss.nxp.com>,
	gregkh@linuxfoundation.org, jirislaby@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, sumit.semwal@linaro.org,
	christian.koenig@amd.com, chester62515@gmail.com,
	cosmin.stoica@nxp.com, adrian.nitu@freescale.com,
	stefan-gabriel.mirea@nxp.com, Mihaela.Martinas@freescale.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	s32@nxp.com, imx@lists.linux.dev, clizzi@redhat.com,
	aruizrui@redhat.com, eballetb@redhat.com, echanude@redhat.com,
	jkangas@redhat.com, Larisa Grigore <larisa.grigore@oss.nxp.com>,
	Radu Pirea <radu-nicolae.pirea@nxp.com>,
	Phu Luu An <phu.luuan@nxp.com>, Js Ha <js.ha@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: Re: [PATCH 12/13] serial: linflexuart: Add DMA support
Message-ID: <202602171109.6YSFXcJ3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260216150205.212318-13-larisa.grigore@oss.nxp.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53077-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[lists.linux.dev,oss.nxp.com,linuxfoundation.org,kernel.org,linaro.org,amd.com,gmail.com,nxp.com,freescale.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:dkim,01.org:url,git-scm.com:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:mid,intel.com:email]
X-Rspamd-Queue-Id: 3123A15D0AC
X-Rspamd-Action: no action

Hi Larisa,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Larisa-Grigore/serial-linflexuart-Fix-locking-in-set_termios/20260216-231403
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20260216150205.212318-13-larisa.grigore%40oss.nxp.com
patch subject: [PATCH 12/13] serial: linflexuart: Add DMA support
config: i386-randconfig-141-20260217 (https://download.01.org/0day-ci/archive/20260217/202602171109.6YSFXcJ3-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202602171109.6YSFXcJ3-lkp@intel.com/

smatch warnings:
drivers/tty/serial/fsl_linflexuart.c:1441 linflex_probe() warn: missing unwind goto?

vim +1441 drivers/tty/serial/fsl_linflexuart.c

09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1377  static int linflex_probe(struct platform_device *pdev)
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1378  {
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1379  	struct device_node *np = pdev->dev.of_node;
1d3f5f07fafc71 Radu Pirea           2026-02-16  1380  	struct linflex_port *lfport;
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1381  	struct uart_port *sport;
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1382  	struct resource *res;
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1383  	int ret;
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1384  
1d3f5f07fafc71 Radu Pirea           2026-02-16  1385  	lfport = devm_kzalloc(&pdev->dev, sizeof(*lfport), GFP_KERNEL);
1d3f5f07fafc71 Radu Pirea           2026-02-16  1386  	if (!lfport)
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1387  		return -ENOMEM;
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1388  
1d3f5f07fafc71 Radu Pirea           2026-02-16  1389  	sport = &lfport->port;
0b34325c5f79f1 Larisa Grigore       2026-02-16  1390  	sport->dev = &pdev->dev;
0b34325c5f79f1 Larisa Grigore       2026-02-16  1391  
0b34325c5f79f1 Larisa Grigore       2026-02-16  1392  	lfport->dma_tx_chan = dma_request_chan(sport->dev, "tx");
0b34325c5f79f1 Larisa Grigore       2026-02-16  1393  	if (IS_ERR(lfport->dma_tx_chan)) {
0b34325c5f79f1 Larisa Grigore       2026-02-16  1394  		ret = PTR_ERR(lfport->dma_tx_chan);
0b34325c5f79f1 Larisa Grigore       2026-02-16  1395  		if (ret == -EPROBE_DEFER)
0b34325c5f79f1 Larisa Grigore       2026-02-16  1396  			return ret;
0b34325c5f79f1 Larisa Grigore       2026-02-16  1397  
0b34325c5f79f1 Larisa Grigore       2026-02-16  1398  		dev_info(sport->dev,
0b34325c5f79f1 Larisa Grigore       2026-02-16  1399  			 "DMA tx channel request failed, operating without tx DMA %ld\n",
0b34325c5f79f1 Larisa Grigore       2026-02-16  1400  			 PTR_ERR(lfport->dma_tx_chan));
0b34325c5f79f1 Larisa Grigore       2026-02-16  1401  		lfport->dma_tx_chan = NULL;
0b34325c5f79f1 Larisa Grigore       2026-02-16  1402  	}
0b34325c5f79f1 Larisa Grigore       2026-02-16  1403  
0b34325c5f79f1 Larisa Grigore       2026-02-16  1404  	lfport->dma_rx_chan = dma_request_chan(sport->dev, "rx");
0b34325c5f79f1 Larisa Grigore       2026-02-16  1405  	if (IS_ERR(lfport->dma_rx_chan)) {
0b34325c5f79f1 Larisa Grigore       2026-02-16  1406  		ret = PTR_ERR(lfport->dma_rx_chan);
0b34325c5f79f1 Larisa Grigore       2026-02-16  1407  		if (ret == -EPROBE_DEFER) {
0b34325c5f79f1 Larisa Grigore       2026-02-16  1408  			dma_release_channel(lfport->dma_tx_chan);
0b34325c5f79f1 Larisa Grigore       2026-02-16  1409  			return ret;
0b34325c5f79f1 Larisa Grigore       2026-02-16  1410  		}
0b34325c5f79f1 Larisa Grigore       2026-02-16  1411  
0b34325c5f79f1 Larisa Grigore       2026-02-16  1412  		dev_info(sport->dev,
0b34325c5f79f1 Larisa Grigore       2026-02-16  1413  			 "DMA rx channel request failed, operating without rx DMA %ld\n",
0b34325c5f79f1 Larisa Grigore       2026-02-16  1414  			 PTR_ERR(lfport->dma_rx_chan));
0b34325c5f79f1 Larisa Grigore       2026-02-16  1415  		lfport->dma_rx_chan = NULL;
0b34325c5f79f1 Larisa Grigore       2026-02-16  1416  	}
1d3f5f07fafc71 Radu Pirea           2026-02-16  1417  
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1418  	ret = of_alias_get_id(np, "serial");
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1419  	if (ret < 0) {
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1420  		dev_err(&pdev->dev, "failed to get alias id, errno %d\n", ret);
0b34325c5f79f1 Larisa Grigore       2026-02-16  1421  		goto linflex_probe_free_dma;
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1422  	}
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1423  	if (ret >= UART_NR) {
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1424  		dev_err(&pdev->dev, "driver limited to %d serial ports\n",
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1425  			UART_NR);
0b34325c5f79f1 Larisa Grigore       2026-02-16  1426  		ret = -ENOMEM;
0b34325c5f79f1 Larisa Grigore       2026-02-16  1427  		goto linflex_probe_free_dma;
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1428  	}
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1429  
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1430  	sport->line = ret;
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1431  
8c6d7e5fd50b45 Yangtao Li           2023-07-12  1432  	sport->membase = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
0b34325c5f79f1 Larisa Grigore       2026-02-16  1433  	if (IS_ERR(sport->membase)) {
0b34325c5f79f1 Larisa Grigore       2026-02-16  1434  		ret = PTR_ERR(sport->membase);
0b34325c5f79f1 Larisa Grigore       2026-02-16  1435  		goto linflex_probe_free_dma;
0b34325c5f79f1 Larisa Grigore       2026-02-16  1436  	}
8c6d7e5fd50b45 Yangtao Li           2023-07-12  1437  	sport->mapbase = res->start;
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1438  
4e8da86fc1f767 Zhang Shurong        2023-08-26  1439  	ret = platform_get_irq(pdev, 0);
4e8da86fc1f767 Zhang Shurong        2023-08-26  1440  	if (ret < 0)
4e8da86fc1f767 Zhang Shurong        2023-08-26 @1441  		return ret;

No clean up?

4e8da86fc1f767 Zhang Shurong        2023-08-26  1442  
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1443  	sport->iotype = UPIO_MEM;
4e8da86fc1f767 Zhang Shurong        2023-08-26  1444  	sport->irq = ret;
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1445  	sport->ops = &linflex_pops;
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1446  	sport->flags = UPF_BOOT_AUTOCONF;
4151bbed79f98b Dmitry Safonov       2019-12-13  1447  	sport->has_sysrq = IS_ENABLED(CONFIG_SERIAL_FSL_LINFLEXUART_CONSOLE);
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1448  
1d3f5f07fafc71 Radu Pirea           2026-02-16  1449  	ret = linflex_init_clk(lfport);
1d3f5f07fafc71 Radu Pirea           2026-02-16  1450  	if (ret)
0b34325c5f79f1 Larisa Grigore       2026-02-16  1451  		goto linflex_probe_free_dma;
1d3f5f07fafc71 Radu Pirea           2026-02-16  1452  
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1453  	linflex_ports[sport->line] = sport;
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1454  
1d3f5f07fafc71 Radu Pirea           2026-02-16  1455  	platform_set_drvdata(pdev, lfport);
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1456  
1d3f5f07fafc71 Radu Pirea           2026-02-16  1457  	ret = uart_add_one_port(&linflex_reg, sport);
0b34325c5f79f1 Larisa Grigore       2026-02-16  1458  	if (ret) {
1d3f5f07fafc71 Radu Pirea           2026-02-16  1459  		clk_bulk_disable_unprepare(LINFLEX_CLK_NUM, lfport->clks);
0b34325c5f79f1 Larisa Grigore       2026-02-16  1460  		goto linflex_probe_free_dma;
0b34325c5f79f1 Larisa Grigore       2026-02-16  1461  	}
0b34325c5f79f1 Larisa Grigore       2026-02-16  1462  
0b34325c5f79f1 Larisa Grigore       2026-02-16  1463  	return 0;
0b34325c5f79f1 Larisa Grigore       2026-02-16  1464  
0b34325c5f79f1 Larisa Grigore       2026-02-16  1465  linflex_probe_free_dma:
0b34325c5f79f1 Larisa Grigore       2026-02-16  1466  	if (lfport->dma_tx_chan)
0b34325c5f79f1 Larisa Grigore       2026-02-16  1467  		dma_release_channel(lfport->dma_tx_chan);
0b34325c5f79f1 Larisa Grigore       2026-02-16  1468  	if (lfport->dma_rx_chan)
0b34325c5f79f1 Larisa Grigore       2026-02-16  1469  		dma_release_channel(lfport->dma_rx_chan);
1d3f5f07fafc71 Radu Pirea           2026-02-16  1470  
1d3f5f07fafc71 Radu Pirea           2026-02-16  1471  	return ret;
09864c1cdf5c53 Stefan-gabriel Mirea 2019-08-09  1472  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


