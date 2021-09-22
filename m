Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D59B414494
	for <lists+linux-media@lfdr.de>; Wed, 22 Sep 2021 11:10:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234170AbhIVJMU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Sep 2021 05:12:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234243AbhIVJMR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Sep 2021 05:12:17 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FFA0C061574
        for <linux-media@vger.kernel.org>; Wed, 22 Sep 2021 02:10:48 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id t8so4779527wri.1
        for <linux-media@vger.kernel.org>; Wed, 22 Sep 2021 02:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QPaZIA3OXheGq7H12t8v9AcLQzxM/IY6gpIxbQ9NIBU=;
        b=HRcjuNmtQ4dQCHzxiGyBFlz1o6ZIpqHFAJn9cSrSLn0hZTX6aD5UG1NC2wwnL9lW83
         lMYhp13/0ku4zCP5lIwxCiL8K2SVl7MQuQZUeoKuvi5U0jFCrxj1Ib8aqERCnwd5rb03
         wpm7porZmDT6b8347w/vFSGIvriPPXKJm6FfpiT3wVOnW4pg4kc4b7W8E5gnDeSeuXHk
         /Ojsw0ybbotcHCHTvbU5cNuN8jXmr2peThQfgIwvuEAQGpMkHa99wb9Hhz3Q10T/k0LG
         gNMKPqaT24m34a4Ex2qsZccF8y1YdpbiOAPqKboRzc/P+odMXwSqLm21hB+1ObMSm9Ld
         KvfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QPaZIA3OXheGq7H12t8v9AcLQzxM/IY6gpIxbQ9NIBU=;
        b=c819e/EYlFQGRFI3Kd72lxFT20vk8h4HCpD+hoewSeQ7eVqdF3OhMx3g/yEhdwoXsr
         +IzjLb20jwmHjakImknMI5kzHz1ab2tFVFPCX8j+GEc56TtJbwptXqsbTrhEtA+cnKu6
         WR8IlMYb6QQOTSHeaQzdMsa4WZ+0xpVFO1HjM44SJ1XFu8D2xukP+nIboL+0iEMZbEGW
         EtA8z7VCNNupeN7dFamj/zUinoej6BaoEFc9BS368bZvwIFLIdv1nA3tIBthqBSjpIVs
         WjejLBjx0sYuk+SAg/wyic+9Rx+jaaVee1AzFR0g/qUMu+NbdhlsqOdnEo32oMqOC32k
         UV0Q==
X-Gm-Message-State: AOAM533wYEJv/KnGlU4N7KRntFmVHKxsGCZsryONmKD1BkZVVmQFAQPW
        FaTkeVLl4rL68cHbG2ZDDk8eJpJSpYw=
X-Google-Smtp-Source: ABdhPJwz9tdHs2Dqxbtq5mgu3pKD03j1gaYVtgUGe+HEoIn8RvQgu8P5MxeqyaGJXezpZ6uHsic2rg==
X-Received: by 2002:a05:6000:156e:: with SMTP id 14mr29311279wrz.393.1632301846902;
        Wed, 22 Sep 2021 02:10:46 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id r25sm1535515wra.76.2021.09.22.02.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 02:10:46 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: Deploying new iterator interface for dma-buf
Date:   Wed, 22 Sep 2021 11:10:18 +0200
Message-Id: <20210922091044.2612-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi guys,

The version I've send out yesterday had a rather obvious coding error and I honestly forgot the cover letter.

This one here is better tested and will now hopefully not be torn apart from the CI system immediately.

I tried to address all review and documentation comments as best as I could, so I'm hoping that we can now considering pushing this.

Cheers,
Christian.


