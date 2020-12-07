Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEE4A2D18F8
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 20:03:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726588AbgLGTCx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 14:02:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726572AbgLGTCx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Dec 2020 14:02:53 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1415AC0617B0
        for <linux-media@vger.kernel.org>; Mon,  7 Dec 2020 11:02:13 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id i3so7407810pfd.6
        for <linux-media@vger.kernel.org>; Mon, 07 Dec 2020 11:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oNT/GSD6Jspry3xOETMgZ+5R7hOQNHkoYsb81OOSgoE=;
        b=qXHRxVdXGEt4jrgV3Np+hYLOFnMr+lPYCgp6i+RvZ+sOWv8QndMUEJLPtrZc3TabP8
         8yOJ6imHgzPwIzUHA92RNc3AWwrMrNVNEeIOkZJeKPkOBHtPvJNrT/6MO0nH6sFL8sI0
         x4w5Td/0H4765t4HieBvcBuxSaHDxZY7uB6B6pCT4x8Y23iopO2rWbP2OznBVLXT9i1q
         SrOk3hkltym0GA//wQ1R0+HbbzBeHe0zud277Sb0PQwMSagF41kDDSaWALifrV1LT/ME
         mXvITHn9NLjcchIsekyMQt36oNMA1E6er2zEwYOfZGtY7PSCzldqbyAx6AvNd158RCkF
         9ZxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oNT/GSD6Jspry3xOETMgZ+5R7hOQNHkoYsb81OOSgoE=;
        b=jbvylL0/WEsUvK9HQr+X1DV35nzYIE+KZDTyhqphQgwh5D2Z+YltDDF+6lXQndzk1B
         mP4y5BKxiYe3eb/jQ2Y3Yv8kfK4nutdgXiVWI9NwLcCGIvHQLHQCb+cqSnM28yDD0vmm
         pbacjImLM47BJJWGdHZb/C8GBv+LrPt1vhb52BRrXm6dLc0K3+wezSWCKHt+PMmzmxYO
         /lY/bLizBH+d/tOfM4fZdjsPL4trJQ/O8xUt9hLXyBkpTXEDScFd2+kDZoFLOLqpyWU2
         gwtLHW8njDE1YW4tLh1Qs2fBcYFt9Is9+ZMNTaLPulgjDGge00tl26ChpmEkreDk6VgH
         zsAg==
X-Gm-Message-State: AOAM5312JMFi9PgjvhJrQLkry1XsW4pMxrfO8GTMTqjUWKaYn7TMxTbs
        HOAvJuv71fq7TwkNVCQ1a35Agw==
X-Google-Smtp-Source: ABdhPJwD7F8xYbr/B1aFoLQzlUyqcUSXwJaeS8K7Zyi68TZ6ORXeM8yNFnPC0loE4GWpnbs63dixLA==
X-Received: by 2002:a62:7b84:0:b029:19c:7146:4bbb with SMTP id w126-20020a627b840000b029019c71464bbbmr17309429pfc.52.1607367732544;
        Mon, 07 Dec 2020 11:02:12 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id t131sm1242202pgc.55.2020.12.07.11.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 11:02:11 -0800 (PST)
From:   Kevin Hilman <khilman@baylibre.com>
To:     hverkuil@xs4all.nl, Neil Armstrong <narmstrong@baylibre.com>
Cc:     linux-amlogic@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/4] media: meson: Add support for the Amlogic GE2D Accelerator Unit
Date:   Mon,  7 Dec 2020 11:02:10 -0800
Message-Id: <160736772527.32056.13173177680923020386.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201202174417.3778306-1-narmstrong@baylibre.com>
References: <20201202174417.3778306-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 2 Dec 2020 18:44:13 +0100, Neil Armstrong wrote:
> The GE2D is a 2D accelerator with various features like configurable blitter
> with alpha blending, frame rotation, scaling, format conversion and colorspace
> conversion.
> 
> The driver implements a Memory2Memory VB2 V4L2 streaming device permitting:
> - 0, 90, 180, 270deg rotation
> - horizontal/vertical flipping
> - source cropping
> - destination compositing
> - 32bit/24bit/16bit format conversion
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: media: Add bindings for the Amlogic GE2D Accelerator Unit
      (no commit info)
[2/4] media: meson: Add M2M driver for the Amlogic GE2D Accelerator Unit
      (no commit info)
[3/4] MAINTAINERS: Add myself as maintainer of the Amlogic GE2D driver
      (no commit info)
[4/4] arm64: dts: meson-axg: add GE2D node
      commit: b03455ae3c8a7e7999f9cc43ad87c63b44a89344

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>
