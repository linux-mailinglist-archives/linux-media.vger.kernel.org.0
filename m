Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EB50660743
	for <lists+linux-media@lfdr.de>; Fri,  6 Jan 2023 20:40:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229711AbjAFTkr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Jan 2023 14:40:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbjAFTkq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Jan 2023 14:40:46 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1DAA71897
        for <linux-media@vger.kernel.org>; Fri,  6 Jan 2023 11:40:44 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id h16so2206668wrz.12
        for <linux-media@vger.kernel.org>; Fri, 06 Jan 2023 11:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=3pLrA0e7dO7LrecMN4OGEXGib4gEC2V+7dqek4qftoU=;
        b=oKfkuXTa5s6uLxxzlF+9y0X9m3c12iFCjrYupYQMqTZ+Rh7BbXZ5dDqr+Z+8w07Ko6
         Ptz/4ln8NeqvSEv9mvufpjJ9sVdCKspZYcX4QiBPTVwNId1HelbG0cj7q8dk1EWbLL1g
         Xf3OK2cLjao8Gnlllc9yCcTNLOfsiBBOY+OYAfpevV4Fq+bxgm26xmE9AL34m2MoXHrz
         TD+ADH6CUZu2+ifAKF+g0OKjotM3yFJ3H2hD4RF80JwIpy+K+Ia4BJA23uYy2Pua0Vgg
         dVqlv0jBwvLV5K/QSdsWBspmN+5WN4+JrZjoo7Zs3+6RUnNYVVMMcQhwr4Srxz6oUVgv
         Ii7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3pLrA0e7dO7LrecMN4OGEXGib4gEC2V+7dqek4qftoU=;
        b=w+eTRFi6+ij4JB2BxqOO7O+wlDB1b/01D/7uhxH1eh+NpjYKWy2/S414/8pKg4ZGaX
         frALmhl3KERXaKVt5gF0ReNensaRu1i8CK3eQ00ZVdRrHqIesnJxCp7I7GBQZCWW77Nk
         Zx7OdlhOUSXdDYUpH5Ufuqu8ogm8zYxcBPT0lgFck0rXWCUDpz5DTEySZw880+MCIil9
         ekZyA6vkAPwTyOrq9bYyZ6/hXEFg3mUaLgN5rrDBCO1IImKMHczz6fi/QSIgXKrT5YKo
         3BwMRTpC1Q8hx19I/gZUf37mUuSMJ7+EZ2FskhS/cYZXLillBvB8l+IYEuiRF8IFJnoG
         YZHg==
X-Gm-Message-State: AFqh2koejnjN/LjIlfZwMTtJ/spjHAwynjeMua741wHJU4ZNtbp4P1cT
        7YGXWAk4bZ3zXho8f7o9WV2q301MNbYcRA==
X-Google-Smtp-Source: AMrXdXv9SgWICruHOFPKbZPr2dFwm8ciXKTkrOmjA1B8aLDnDi2DU+NsKsS03ziq/Z/1Nu4FCajxWQ==
X-Received: by 2002:adf:de04:0:b0:29a:f48:770a with SMTP id b4-20020adfde04000000b0029a0f48770amr13167781wrm.40.1673034043184;
        Fri, 06 Jan 2023 11:40:43 -0800 (PST)
Received: from localhost.localdomain ([90.242.19.250])
        by smtp.gmail.com with ESMTPSA id bx9-20020a5d5b09000000b0023662245d3csm1968650wrb.95.2023.01.06.11.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 11:40:42 -0800 (PST)
Sender: Adam Pigg <piggz1@gmail.com>
From:   adam@piggz.co.uk
To:     linux-media@vger.kernel.org
Cc:     yong.deng@magewell.com, mchehab@kernel.org,
        linux-sunxi@lists.linux.dev, paul.kocialkowski@bootlin.com,
        laurent.pinchart@ideasonboard.com, Adam Pigg <adam@piggz.co.uk>
Subject: [PATCH 0/3] suns6-csi changes to support libcamera
Date:   Fri,  6 Jan 2023 19:40:35 +0000
Message-Id: <20230106194038.16018-1-adam@piggz.co.uk>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Adam Pigg <adam@piggz.co.uk>

This 3 patch set adds V4L2_CAP_IO_MC and vidioc_enum_framesizes support
to the sun6i-csi driver, allowing the Pinephone rear camera (ov5640) to
be supported.

These have been developed with the guidance of Laurent Pinchart, and
been tested by capturing frames from the libcamera cam utility.

In addition to these, a patch to change the v4l gain mode in the ov5640
driver, and the 2 format propagation patches all by Laurnet are
required.

Adam Pigg (3):
  media: sun6i-csi: merge sun6i_csi_formats and sun6i_csi_formats_match
  media: sun6i-csi: implement V4L2_CAP_IO_MC
  media: sun6i-csi: implement vidioc_enum_framesizes

 .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 215 +++++++++---------
 .../sunxi/sun6i-csi/sun6i_csi_capture.h       |   6 +-
 2 files changed, 103 insertions(+), 118 deletions(-)

-- 
2.39.0

