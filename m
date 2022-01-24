Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5501449804C
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 14:03:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239721AbiAXNDf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jan 2022 08:03:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239767AbiAXNDd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jan 2022 08:03:33 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BED6CC061401
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 05:03:32 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id l25so13440474wrb.13
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 05:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yWI5UY1fcglV1EAWhaeDJljaKs8PQI4isWYaACSxoi4=;
        b=AY8x1LnFnJZRez598YgjMdvAyQROXLUy/z6GUO0oWBfUy4+onnlsYauTO0OaoQp+GL
         OmIkmpHQWU7wayN2WlbzQUPXIV47l69i9fA/DRiDGWjKntmUx7bPx75DutO0bmH5olCg
         7du8vXgO4/RPJgr5x4s0oiKIcmnDljWfStE7sPCxUQUuam2WB0tOm+kSY+NrdbaM4TlO
         kDFGprJHWgxOGORrRLgJGzHFUEsv2fb0iqDg/alh+6PE5mfr0N/Lb9xhVp1Z8eZmIyEb
         m4hC3WSoXNBjbQ/sPH5sFeO4FiLEnL0vKqQSRWT6BDKtRuxH1I7JAFpc/ihdmyCaMQHU
         Y5Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yWI5UY1fcglV1EAWhaeDJljaKs8PQI4isWYaACSxoi4=;
        b=Ux4iZsvfByPZ9IrfKCLYMH7CXHyn8uoILFnwtv8ubWPdm8T9oldE8iIHA/MQI8Eky4
         TvhL5qaq5rUCn4gVkspamwB9w+9ObkJ60DlsTPrJ6VNYo/eeHZjov5JZARMl2XNSjqXw
         irknvmof/3KmJjkHAwAJiz5dhNsfjhlbc/qzYVDRzw0PL0sd1qYIRv1OM1G/96msi5VA
         cBcVGXiyrB6UjaNXUgb0a3Cnp4oLjDWGwzUeEKXu2hWBl/rrCmmeLSXgSNavg/FbxHda
         9mTP46q++xtB2ls5kdxjNUn4XTJslWf6BGsWdNw1MqHbWL9oLX/ii3loQ9OiWMMY3ynF
         b5pA==
X-Gm-Message-State: AOAM531Hdj87yHYrw6rroUX8lA3IJ3vr7k4Ks6pYFAalyEhtIu6pceAu
        onGTi3msSpN30nTqzXf5tABQGmAN0sY=
X-Google-Smtp-Source: ABdhPJzL+lKK5xkx8OJp5KwHUz8NOmvOUiedYXCIu6JiUO9YErSES2Olp5JeIlKltfni2gdAQOYY8Q==
X-Received: by 2002:a05:6000:1448:: with SMTP id v8mr4887006wrx.57.1643029411400;
        Mon, 24 Jan 2022 05:03:31 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
        by smtp.gmail.com with ESMTPSA id g4sm16543554wrd.12.2022.01.24.05.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 05:03:30 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     thomas.hellstrom@linux.intel.com, sumit.semwal@linaro.org,
        gustavo@padovan.org, daniel.vetter@ffwll.ch, zackr@vmware.com,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org
Subject: Add WARN_ON nested dma_fence containers
Date:   Mon, 24 Jan 2022 14:03:17 +0100
Message-Id: <20220124130328.2376-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi guys,

as previously discussed only dma_fence_chain with its previous fence is actually made to build up larger dma_fence structures. Everything else should either flatten all fences into a single dma_fence_array or just add each fence separately to the dma_resv object.

Please review and/or comment,
Christian.


