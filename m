Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 964E0430F7C
	for <lists+linux-media@lfdr.de>; Mon, 18 Oct 2021 07:05:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230102AbhJRFHZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Oct 2021 01:07:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230010AbhJRFHL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Oct 2021 01:07:11 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 671BEC061745;
        Sun, 17 Oct 2021 22:05:00 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id om14so11360228pjb.5;
        Sun, 17 Oct 2021 22:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=FZJWgTaiYSeEhu6bWJxmdjYEwT8OyFJXiJJPkL6CAvQ=;
        b=Hzh9yxSM/8JRs8DbfaAHizsy0zNY0xCSHItjV+qD+oWsjE7xKBhkmbl+PTr/UcEjq0
         mv3TiNO0gTQ55D0awmApYVKLSa00oxduGnVF0aEOiS+WeQbzCriRTHS9LSU0u0mGZPP3
         ynDrHqOi0qpKlJS+1n3UUFjAZvgV5FEe8A5Aij8re+F+MDxPylu8O8JHsUK6GzlkKxW4
         8qytYkXFwNmx6r0jD/ksr6d1BNFZP8MkhXWEUaQ28MuugYOJOlYM8nOFfEXPv/T+5ISl
         r3x67UY/hZqfG3ZazqUelKXBoeUvAd5SLaiKwCapDIMiEmUIkzxlKg9eu+kIcVq2eRZo
         3tPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=FZJWgTaiYSeEhu6bWJxmdjYEwT8OyFJXiJJPkL6CAvQ=;
        b=l9CK/Y8piyJKIsCjFad3B7YbvZYbXomhbWtgeXwqX3BOhbJWs9fgwlZnm8d41HxTUt
         us9u5nkscmOttRIMbFv1P5YxQy0X/KWKv6nEzTZFUgONHBjJvvAkICfFZbtlUwyrlgMU
         t/AzA81RTeHqNvs+qS15WvaWaUXB//+z+38w4+ZvkJV9sJEf0DkJdRdUhynM1l7zcMZc
         jMMtKxuBud1NRs/Zppdikfoc7+xx3PDEzIEZh07x7GMIKx6cYBhdC9o0N6U/ecjtvAam
         qbq6Xz/KzKoP9m2whQkjwv/Msgo3yWJRrmcQs4tam2PXa9SVpt5pXlgrl/Jf6OQGRYqm
         158g==
X-Gm-Message-State: AOAM533h2cAjbeq+3cOlWJ6AkCQuNyMWsOuA5Zr1kO20Sd7BOEYH7ROq
        RJOoKVaN7g9UeRlTnHbN7Kk=
X-Google-Smtp-Source: ABdhPJzfwIgsSqmiAdK/VfZ3thOZREi/eDqLRLRoHi6PgXtczSqv9xG7jSV/LdsdHMQcX11E89ZMWA==
X-Received: by 2002:a17:90a:b901:: with SMTP id p1mr45151841pjr.111.1634533500019;
        Sun, 17 Oct 2021 22:05:00 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id c205sm11416625pfc.43.2021.10.17.22.04.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 17 Oct 2021 22:04:59 -0700 (PDT)
From:   dillon.minfei@gmail.com
To:     mchehab@kernel.org, mchehab+huawei@kernel.org,
        hverkuil-cisco@xs4all.nl, ezequiel@collabora.com, gnurou@gmail.com,
        pihsun@chromium.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org, gabriel.fernandez@st.com,
        gabriel.fernandez@foss.st.com
Cc:     patrice.chotard@foss.st.com, hugues.fruchet@foss.st.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Dillon Min <dillon.minfei@gmail.com>
Subject: [PATCH v5 01/10] media: admin-guide: add stm32-dma2d description
Date:   Mon, 18 Oct 2021 13:04:39 +0800
Message-Id: <1634533488-25334-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634533488-25334-1-git-send-email-dillon.minfei@gmail.com>
References: <1634533488-25334-1-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dillon Min <dillon.minfei@gmail.com>

add stm32-dma2d description for dma2d driver

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
v5: no change.

 Documentation/admin-guide/media/platform-cardlist.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/admin-guide/media/platform-cardlist.rst b/Documentation/admin-guide/media/platform-cardlist.rst
index 261e7772eb3e..ac73c4166d1e 100644
--- a/Documentation/admin-guide/media/platform-cardlist.rst
+++ b/Documentation/admin-guide/media/platform-cardlist.rst
@@ -60,6 +60,7 @@ s5p-mfc            Samsung S5P MFC Video Codec
 sh_veu             SuperH VEU mem2mem video processing
 sh_vou             SuperH VOU video output
 stm32-dcmi         STM32 Digital Camera Memory Interface (DCMI)
+stm32-dma2d        STM32 Chrom-Art Accelerator Unit
 sun4i-csi          Allwinner A10 CMOS Sensor Interface Support
 sun6i-csi          Allwinner V3s Camera Sensor Interface
 sun8i-di           Allwinner Deinterlace
-- 
2.7.4

