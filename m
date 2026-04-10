Return-Path: <linux-media+bounces-58564-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJNMHro72WkjnggAu9opvQ
	(envelope-from <linux-media+bounces-58564-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 20:04:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B923DB4FB
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 20:04:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED30C3015E0D
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 18:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF0CF3E3152;
	Fri, 10 Apr 2026 18:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ngyM0CS0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FC91514F8
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 18:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775844265; cv=none; b=STWx037ij3Gkv27SXebTuCfJLI6gBNChUK4x3ZqJNMrRDmJ6VHwqvGYw0QHPCkA9ru3rodArNdnlnYHKkaHj8RXF/KazdqXssXJRHAi7ehmPB/jszsXJkw6m1KfogAwk5u5uTly/gm4kVRTor5NtwY+7kD5Ve/5wmOi0CYaooTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775844265; c=relaxed/simple;
	bh=jOZHfakR+Yjbmg3aIrlf2xq8lD6y2oUnife5jH3FzOA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TNGn+bIVvuPDdLbS7GJlYqi7RGGLPqlUxwwtipaLZ8TGMIX5y9N3lCZPobTtB5lXm0t7A2TMEzmO2sXR27m6hrLWWT8ctT/WbuPUgIGo+77/cMRFcck3/3L5eEB4EzQeFMH2UzfMdAG3gieCGBHdYYt3r+p2epgM+rl1BBjqanE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ngyM0CS0; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488aa77a06eso37249225e9.0
        for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 11:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775844262; x=1776449062; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bnYX49rlVOy33WZ4h4FnNkTYchaIYbQqSK+hJqyW10Y=;
        b=ngyM0CS0iqzlMY6l5axWmwGR9wkI8Ls1V4FBdZUDI+HabNwkVbtZyE2W+WFAY1Pj0u
         GtbskzWjnWE2lD13eHMmpkoTaxpHJj/GJF6/qZa4nvcfhBoJ0fAycueUt4QlwNZZWEi3
         Pd03/qYjyCSuoCSbLpjsn6xlxCvuaYBB5cWww67Q6cUyUpBbmf3L+l1uHkRDkuSGqNyO
         zW9k9FL+NjDlou9EFcwajf8RgGYyD7U+nZjhQ0pGf9eSgMVYQqyfL6rLcZmkm2FhtWds
         BX0lH0U8cU/6X13G2yivgJlh8RNvOLl7G3G+pTJwxssCubnhiQc/uR9/Dps8wjn+D5eB
         kirQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775844262; x=1776449062;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bnYX49rlVOy33WZ4h4FnNkTYchaIYbQqSK+hJqyW10Y=;
        b=Lt9FXCgGaTc0fhpT0YTz8z0+FitziDPoqpv4PJugHLeoOfyu+Wm/IsD4V+v2F3uQTW
         4eAhlR51hYYmmkKcrF6u+BRgCaXb9KgJbiLTQvf+DOTkS3fOz2SfkcqCcV7snYyo+5SB
         h9K+9XPCjrG28uY0u3K98m5930yJmBt5/bwh+nt2SYJJcxesesA5+iZ6rZW8Y7HCm0S3
         iQYQCeROZUNf0BhGQULB/Huza/VsTzgg3BwUBDWvVrDKJHNUuE+EeYh0dJnHdGsMiKAL
         FK8KIzd1IrsvvJQG5rQAaqJxyRRpLDWT1xa7GjXGhg8VoIQ/kUbskLSKLBvash/4G6sI
         d5nw==
X-Gm-Message-State: AOJu0YyomJ4PzsEUBfBakJZV1jBwuoeWzJW8+NkupzqmHfEHxgDlZOrV
	N7SDS4Sn0+3+1j2ppXlpwXYv7Q6xisovEpBmABzV5kcw9GUge2SrQbox
X-Gm-Gg: AeBDies4sCYN2zWUdvvsrFqMS+6Lixf2pLV+Ubv6GkqQrxd7hWJ3iXOhedrogRtMrTR
	2mFXCM0xwlr13pB0h/5PrDmVsnfj/5wtNmoQrVm8BCGobYIpIVc7vnDLAKOmZnb3OmmysM3SHw9
	uqhOB0SlqZFtrO2obVhDQSkyKXCDoij4GeCrfNN9MoFxkVbOtJJnnMoTTIHTauCylhev6EUB6jv
	WLPiBiNT5On7ptqqFI+dCh3/2ee6Ku8k1fOz/AO7yfwcqu9rcXN6eokTdVV4nfUqLJMwH5/So6B
	8k1c3V+OkRFGwTVs9gTPooEooqOIBIMcN2wDbKPjEB5umGMgMSuIrVBAV7dMx0V0896nM2RH3B2
	cTncW6OeatbcGHlGKILTrXrG6uMUqa1rUa/jkDVQT9VsDXZZM71HUDTn0qHxASjTc8j3yJTDksL
	SsuEuLZpwNQ6OxcHYnQ5Y=
X-Received: by 2002:a05:600c:3149:b0:488:ae6c:42c6 with SMTP id 5b1f17b1804b1-488d684319emr53905685e9.14.1775844261860;
        Fri, 10 Apr 2026 11:04:21 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5888a97sm104752135e9.2.2026.04.10.11.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:04:20 -0700 (PDT)
Date: Fri, 10 Apr 2026 21:04:18 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: linux-media@vger.kernel.org
Subject: [bug report] media: stm32: dcmi: addition of DMA-MDMA chaining
 support
Message-ID: <adk7oph0JD6RAaN9@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58564-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stanley.mountain:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C7B923DB4FB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Alain Volmat,

Commit 87ebce19aa03 ("media: stm32: dcmi: addition of DMA-MDMA
chaining support") from Jan 6, 2026 (linux-next), leads to the
following Smatch static checker warning:

	drivers/media/platform/st/stm32/stm32-dcmi.c:2053 dcmi_probe()
	warn: missing error code here? 'of_gen_pool_get()' failed. 'ret' = '0'

drivers/media/platform/st/stm32/stm32-dcmi.c
    1954 static int dcmi_probe(struct platform_device *pdev)
    1955 {
    1956         struct device_node *np = pdev->dev.of_node;
    1957         struct v4l2_fwnode_endpoint ep = { .bus_type = 0 };
    1958         struct stm32_dcmi *dcmi;
    1959         struct vb2_queue *q;
    1960         struct dma_chan *chan, *mdma_chan;
    1961         struct dma_slave_caps caps;
    1962         struct dma_slave_config dma_config, mdma_config;
    1963         struct clk *mclk;
    1964         int ret = 0;
    1965 
    1966         dcmi = devm_kzalloc(&pdev->dev, sizeof(struct stm32_dcmi), GFP_KERNEL);
    1967         if (!dcmi)
    1968                 return -ENOMEM;
    1969 
    1970         dcmi->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
    1971         if (IS_ERR(dcmi->rstc))
    1972                 return dev_err_probe(&pdev->dev, PTR_ERR(dcmi->rstc),
    1973                                      "Could not get reset control\n");
    1974 
    1975         /* Get bus characteristics from devicetree */
    1976         np = of_graph_get_endpoint_by_regs(np, 0, -1);
    1977         if (!np) {
    1978                 dev_err(&pdev->dev, "Could not find the endpoint\n");
    1979                 return -ENODEV;
    1980         }
    1981 
    1982         ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(np), &ep);
    1983         of_node_put(np);
    1984         if (ret) {
    1985                 dev_err(&pdev->dev, "Could not parse the endpoint\n");
    1986                 return ret;
    1987         }
    1988 
    1989         if (ep.bus_type == V4L2_MBUS_CSI2_DPHY) {
    1990                 dev_err(&pdev->dev, "CSI bus not supported\n");
    1991                 return -ENODEV;
    1992         }
    1993 
    1994         if (ep.bus_type == V4L2_MBUS_BT656 &&
    1995             ep.bus.parallel.bus_width != 8) {
    1996                 dev_err(&pdev->dev, "BT656 bus conflicts with %u bits bus width (8 bits required)\n",
    1997                         ep.bus.parallel.bus_width);
    1998                 return -ENODEV;
    1999         }
    2000 
    2001         dcmi->bus.flags = ep.bus.parallel.flags;
    2002         dcmi->bus.bus_width = ep.bus.parallel.bus_width;
    2003         dcmi->bus.data_shift = ep.bus.parallel.data_shift;
    2004         dcmi->bus_type = ep.bus_type;
    2005 
    2006         dcmi->irq = platform_get_irq(pdev, 0);
    2007         if (dcmi->irq < 0)
    2008                 return dcmi->irq;
    2009 
    2010         dcmi->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &dcmi->res);
    2011         if (IS_ERR(dcmi->regs))
    2012                 return PTR_ERR(dcmi->regs);
    2013 
    2014         mclk = devm_clk_get(&pdev->dev, "mclk");
    2015         if (IS_ERR(mclk))
    2016                 return dev_err_probe(&pdev->dev, PTR_ERR(mclk),
    2017                                      "Unable to get mclk\n");
    2018 
    2019         chan = dma_request_chan(&pdev->dev, "tx");
    2020         if (IS_ERR(chan))
    2021                 return dev_err_probe(&pdev->dev, PTR_ERR(chan),
    2022                                      "Failed to request DMA channel\n");
    2023 
    2024         mdma_chan = dma_request_chan(&pdev->dev, "mdma_tx");
    2025         if (IS_ERR(mdma_chan)) {
    2026                 ret = PTR_ERR(mdma_chan);
    2027                 if (ret != -ENODEV)
    2028                         return dev_err_probe(&pdev->dev, ret, "Failed to request MDMA channel\n");
    2029                 mdma_chan = NULL;
    2030         }
    2031 
    2032         /* Configure the DMA channel */
    2033         memset(&dma_config, 0, sizeof(dma_config));
    2034 
    2035         dma_config.src_addr = (dma_addr_t)dcmi->res->start + DCMI_DR;
    2036         dma_config.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
    2037         if (mdma_chan)
    2038                 dma_config.peripheral_size = 1; /* Indicates chaining */
    2039 
    2040         /* Configure DMA channel */
    2041         ret = dmaengine_slave_config(chan, &dma_config);
    2042         if (ret < 0) {
    2043                 dev_err(dcmi->dev, "%s: DMA channel config failed (%d)\n",
    2044                         __func__, ret);
    2045                 goto err_dma_slave_config;
    2046         }
    2047 
    2048         /* If we want MDMA, we also need a sram pool */
    2049         if (mdma_chan) {
    2050                 dcmi->sram_pool = of_gen_pool_get(pdev->dev.of_node, "sram", 0);
    2051                 if (!dcmi->sram_pool) {
    2052                         dev_info(&pdev->dev, "No SRAM pool, can't use MDMA chaining\n");
--> 2053                         goto err_dma_slave_config;

ret = -ENOMEM?

    2054                 }
    2055 
    2056                 dev_info(&pdev->dev, "SRAM pool: %zu KiB for DMA/MDMA chaining\n",
    2057                          gen_pool_size(dcmi->sram_pool) / 1024);
    2058 
    2059                 dcmi->sram_buf_size = gen_pool_size(dcmi->sram_pool);
    2060                 dcmi->sram_buf = gen_pool_dma_zalloc(dcmi->sram_pool, dcmi->sram_buf_size,
    2061                                                      &dcmi->sram_dma_buf);
    2062                 if (!dcmi->sram_buf) {
    2063                         dev_err(dcmi->dev, "Failed to allocate from SRAM\n");
    2064                         goto err_dma_slave_config;

ret = -ENOMEM?

    2065                 }
    2066 
    2067                 /* Configure the MDMA Channel */
    2068                 memset(&mdma_config, 0, sizeof(mdma_config));
    2069                 mdma_config.direction = DMA_DEV_TO_MEM;
    2070                 mdma_config.src_addr = dcmi->sram_dma_buf;
    2071                 mdma_config.peripheral_size = dma_config.peripheral_size;
    2072                 mdma_config.peripheral_config = dma_config.peripheral_config;
    2073                 ret = dmaengine_slave_config(mdma_chan, &mdma_config);
    2074                 if (ret < 0) {
    2075                         dev_err(dcmi->dev, "%s: MDMA channel config failed (%d)\n",
    2076                                 __func__, ret);
    2077                         goto err_mdma_slave_config;
    2078                 }
    2079         }
    2080 
    2081         dcmi->dma_max_burst = UINT_MAX;
    2082         /* In case of using DMA-MDMA chaining we consider the maximum infini */
    2083         if (!mdma_chan) {
    2084                 ret = dma_get_slave_caps(chan, &caps);
    2085                 if (!ret && caps.max_sg_burst)
    2086                         dcmi->dma_max_burst = caps.max_sg_burst * DMA_SLAVE_BUSWIDTH_4_BYTES;
    2087         }
    2088 
    2089         spin_lock_init(&dcmi->irqlock);
    2090         mutex_init(&dcmi->lock);
    2091         init_completion(&dcmi->complete);
    2092         INIT_LIST_HEAD(&dcmi->buffers);
    2093 
    2094         dcmi->dev = &pdev->dev;
    2095         dcmi->mclk = mclk;
    2096         dcmi->state = STOPPED;
    2097         dcmi->dma_chan = chan;
    2098         dcmi->mdma_chan = mdma_chan;
    2099 
    2100         q = &dcmi->queue;
    2101 
    2102         dcmi->v4l2_dev.mdev = &dcmi->mdev;
    2103 
    2104         /* Initialize media device */
    2105         strscpy(dcmi->mdev.model, DRV_NAME, sizeof(dcmi->mdev.model));
    2106         dcmi->mdev.dev = &pdev->dev;
    2107         media_device_init(&dcmi->mdev);
    2108 
    2109         /* Initialize the top-level structure */
    2110         ret = v4l2_device_register(&pdev->dev, &dcmi->v4l2_dev);
    2111         if (ret)
    2112                 goto err_media_device_cleanup;
    2113 
    2114         dcmi->vdev = video_device_alloc();
    2115         if (!dcmi->vdev) {
    2116                 ret = -ENOMEM;
    2117                 goto err_device_unregister;
    2118         }
    2119 
    2120         /* Video node */
    2121         dcmi->vdev->fops = &dcmi_fops;
    2122         dcmi->vdev->v4l2_dev = &dcmi->v4l2_dev;
    2123         dcmi->vdev->queue = &dcmi->queue;
    2124         strscpy(dcmi->vdev->name, KBUILD_MODNAME, sizeof(dcmi->vdev->name));
    2125         dcmi->vdev->release = video_device_release;
    2126         dcmi->vdev->ioctl_ops = &dcmi_ioctl_ops;
    2127         dcmi->vdev->lock = &dcmi->lock;
    2128         dcmi->vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
    2129                                   V4L2_CAP_READWRITE;
    2130         video_set_drvdata(dcmi->vdev, dcmi);
    2131 
    2132         /* Media entity pads */
    2133         dcmi->vid_cap_pad.flags = MEDIA_PAD_FL_SINK;
    2134         ret = media_entity_pads_init(&dcmi->vdev->entity,
    2135                                      1, &dcmi->vid_cap_pad);
    2136         if (ret) {
    2137                 dev_err(dcmi->dev, "Failed to init media entity pad\n");
    2138                 goto err_device_release;
    2139         }
    2140         dcmi->vdev->entity.flags |= MEDIA_ENT_FL_DEFAULT;
    2141 
    2142         ret = video_register_device(dcmi->vdev, VFL_TYPE_VIDEO, -1);
    2143         if (ret) {
    2144                 dev_err(dcmi->dev, "Failed to register video device\n");
    2145                 goto err_media_entity_cleanup;
    2146         }
    2147 
    2148         dev_dbg(dcmi->dev, "Device registered as %s\n",
    2149                 video_device_node_name(dcmi->vdev));
    2150 
    2151         /* Buffer queue */
    2152         q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
    2153         q->io_modes = VB2_MMAP | VB2_READ | VB2_DMABUF;
    2154         q->lock = &dcmi->lock;
    2155         q->drv_priv = dcmi;
    2156         q->buf_struct_size = sizeof(struct dcmi_buf);
    2157         q->ops = &dcmi_video_qops;
    2158         q->mem_ops = &vb2_dma_contig_memops;
    2159         q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
    2160         q->min_queued_buffers = 2;
    2161         q->allow_cache_hints = 1;
    2162         q->dev = &pdev->dev;
    2163 
    2164         ret = vb2_queue_init(q);
    2165         if (ret < 0) {
    2166                 dev_err(&pdev->dev, "Failed to initialize vb2 queue\n");
    2167                 goto err_media_entity_cleanup;
    2168         }
    2169 
    2170         ret = dcmi_graph_init(dcmi);
    2171         if (ret < 0)
    2172                 goto err_media_entity_cleanup;
    2173 
    2174         /* Reset device */
    2175         ret = reset_control_assert(dcmi->rstc);
    2176         if (ret) {
    2177                 dev_err(&pdev->dev, "Failed to assert the reset line\n");
    2178                 goto err_cleanup;
    2179         }
    2180 
    2181         usleep_range(3000, 5000);
    2182 
    2183         ret = reset_control_deassert(dcmi->rstc);
    2184         if (ret) {
    2185                 dev_err(&pdev->dev, "Failed to deassert the reset line\n");
    2186                 goto err_cleanup;
    2187         }
    2188 
    2189         dev_info(&pdev->dev, "Probe done\n");
    2190 
    2191         platform_set_drvdata(pdev, dcmi);
    2192 
    2193         pm_runtime_enable(&pdev->dev);
    2194 
    2195         return 0;
    2196 
    2197 err_cleanup:
    2198         v4l2_async_nf_cleanup(&dcmi->notifier);
    2199 err_media_entity_cleanup:
    2200         media_entity_cleanup(&dcmi->vdev->entity);
    2201 err_device_release:
    2202         video_device_release(dcmi->vdev);
    2203 err_device_unregister:
    2204         v4l2_device_unregister(&dcmi->v4l2_dev);
    2205 err_media_device_cleanup:
    2206         media_device_cleanup(&dcmi->mdev);
    2207 err_mdma_slave_config:
    2208         if (dcmi->mdma_chan)
    2209                 gen_pool_free(dcmi->sram_pool, (unsigned long)dcmi->sram_buf, dcmi->sram_buf_size);
    2210 err_dma_slave_config:
    2211         dma_release_channel(dcmi->dma_chan);
    2212         if (dcmi->mdma_chan)
    2213                 dma_release_channel(mdma_chan);
    2214 
    2215         return ret;
    2216 }

This email is a free service from the Smatch-CI project [smatch.sf.net].

regards,
dan carpenter

