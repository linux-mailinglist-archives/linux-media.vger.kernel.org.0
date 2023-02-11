Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6EA56933D5
	for <lists+linux-media@lfdr.de>; Sat, 11 Feb 2023 21:55:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229769AbjBKUzD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 11 Feb 2023 15:55:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbjBKUzC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 11 Feb 2023 15:55:02 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 809BCBDE7
        for <linux-media@vger.kernel.org>; Sat, 11 Feb 2023 12:55:01 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id y1so8597679wru.2
        for <linux-media@vger.kernel.org>; Sat, 11 Feb 2023 12:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZWPCCehMySTWDztB7agLe09Qbsz9UHsF2BXhr7G+Z70=;
        b=ZjjidkLGgu/HB6isSKpdWyQixyK7UWv50GMPVLd8jJ+ORaJRk8YlN1OezZLy9v8yvO
         wLBIutEy7+TGaraNtvn4bTck90adECB0ewxMFhQqOFSg3S3sZUN2ey/PTnmVW7rZvTqp
         fzravZ2InDsQK8E8xT9fATdhqiyTPz8SdnwxhnxKhTs2FR3D9kfXfUvuFEefysjaUnzL
         6AYhBsyVaLTw3NwxzyAiwNfnUUzDEX+b/OH7Zf6k2fUSlCiyyA0gBr3OcxytPdn3tiw4
         56KmXeFvj9gcwK1ZJ/KKt58YOPHjPVkAd7pvkaZti5dq6T8zmP6RDSUlRlGMQ63u+q06
         GzFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZWPCCehMySTWDztB7agLe09Qbsz9UHsF2BXhr7G+Z70=;
        b=NrAkRVEbCJ7jb7bkCBBrqlpJmtXjNWyq1/RKuCDo260I7a6Letapwa9l42K06Y/AdM
         LAU63m3gfvnJaA6His24p9EYZO/EDzAdadgb/xNwWUS4hqOLzGyRoW9PNBJBWgUWoHP2
         GxHyJmQ4/U5d7FtjgES63W2W9aD+3rjAhBusaGSdNZhD9ocbQhqYOKbs0HQrrxgq1Zal
         Tw5KMtUTDWDiHJUlLnUrY5j6rxdIaIfmMWzEo2v2pHwtvwP2mVTzeAfiGDFRDaz+ch9c
         l1u2lK7IzTJiaxkf+qjxDsFHOPx2yzWGSDIoSUk0yeEP8P6doFSQYiRhWuYhlZ4hhMVp
         NsMA==
X-Gm-Message-State: AO0yUKUJiwYdq6z86se4JvKC2m0M6KPhTRVszJGDK4PYmaQOMhlXLcLS
        iuVifrMTgHxA8tg9GFOT7MtrwNmpQSIacIBgXO8=
X-Google-Smtp-Source: AK7set/wHl6/xhjWfjVXfK8rlZdfhexe22UPBfLWpG+LF/98tQ1DfVi5PtJCZIXK5Ji9IJNjTAvwrg==
X-Received: by 2002:a05:6000:c8:b0:2c3:db98:3e87 with SMTP id q8-20020a05600000c800b002c3db983e87mr15787994wrx.20.1676148900116;
        Sat, 11 Feb 2023 12:55:00 -0800 (PST)
Received: from sleipner.berto.se (p54ac5802.dip0.t-ipconnect.de. [84.172.88.2])
        by smtp.googlemail.com with ESMTPSA id q4-20020a05600000c400b002c54737e908sm5095531wrx.91.2023.02.11.12.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 12:54:59 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/2] media: rcar-vin: Fix issues with NV12 on Gen3
Date:   Sat, 11 Feb 2023 21:54:30 +0100
Message-Id: <20230211205432.493102-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This series fixes two small issues around NV12. Patch 1/2 forbids the 
use of the scaler on Gen3 if the output format is NV12. While patch 2/2 
fixes the size alignment for NV12.

Work tested on both Gen2 and Gen3 without regressions.

Niklas Söderlund (2):
  media: rcar-vin: Gen3 can not scale NV12
  media: rcar-vin: Fix NV12 size alignment

 .../media/platform/renesas/rcar-vin/rcar-dma.c  | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

-- 
2.39.1

