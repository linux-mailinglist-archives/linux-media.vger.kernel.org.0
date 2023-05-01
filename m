Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F3406F325C
	for <lists+linux-media@lfdr.de>; Mon,  1 May 2023 16:57:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232249AbjEAO5Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 May 2023 10:57:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231229AbjEAO5Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 May 2023 10:57:24 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CF66CD
        for <linux-media@vger.kernel.org>; Mon,  1 May 2023 07:57:22 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-94f1d0d2e03so447791666b.0
        for <linux-media@vger.kernel.org>; Mon, 01 May 2023 07:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google; t=1682953041; x=1685545041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FgtHmyxyIOoiBPgHQ0GME7OcAosd5E9HojatmOIErV8=;
        b=VRZOPXcwKRw/6cSpEvJjZxR0781fJfMthKpXZsnlZIcmP07A4iGHCl5paegyIzz8CF
         KTW8ymZ1F4SE+1OzIM91k8+GtUFTlE68wMSoy+8Vd3cfWNdyk9CBfM9dcRCDMgFbJytt
         9WhpZohoh8USNuGhTAjz+4px+KJ9n5aTvmtvZEdt2UkJb43lDjQcN3LQZf+TpSnoe3nx
         nTQOaiyzpt1OsYq/R0XK7MvSMHY4n/ydr2Y9aIsAtOHpISy5XYQJ61dfBnFEAIyDwQnT
         5vqo+KOknja2yyyaslb337ghkmysGMTKyLyuPgh5tDFjmU1iFDLqNgKjXKUsWkPNHsH4
         3bdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682953041; x=1685545041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FgtHmyxyIOoiBPgHQ0GME7OcAosd5E9HojatmOIErV8=;
        b=lzRvD6zt7IBrmxORyqdBkGakSrEkBoJNMIpfUp2SHNucLf6lYKsqqM6Vr18Z1uZ9nQ
         siEvuvnUPDbqY8WfSoAChPlB+XA9H3n+f96MkbZkhK9tff6eFnh9a+oaM4rAmmjW58K5
         wE/eLrozqpLSakezcQH6rtNzX6b7U4y9Q5qyhafhayTSfIzjx+Pjr/WYXZSA87OOLOl1
         jXIxkSJH0LTZQFGbMO0C9Foge8HXnHuryCJtLQvNQoDhXMhR/XS/RWKrQrmgql5EyWqI
         WVZ620xzXm0bnuC0NScjUT7Ti+oyP3q8bZ0LUi0Uz9DHCcSjhDWn6pndwfO/Dx02NgKy
         pxZw==
X-Gm-Message-State: AC+VfDzTpn6DXynnCG9476YzAQS3R+UDTame2YhikwJxby0T21711+ay
        DDXAOOlXN96baCWHvKZpbWpxhAX/zT3csIj2wx4=
X-Google-Smtp-Source: ACHHUZ5bZ+BrJjxRwbWsCahAeCpag1vA2t3aWqmoiN236lvYJ82vdtIuQiOjpp5ffTCkbvqVkb3y/g==
X-Received: by 2002:a17:906:fd8b:b0:94f:32ed:637e with SMTP id xa11-20020a170906fd8b00b0094f32ed637emr12730924ejb.59.1682953040854;
        Mon, 01 May 2023 07:57:20 -0700 (PDT)
Received: from dlp-nixos.qtec.com (cpe.ge-3-0-8-100.ryvnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id g24-20020a50ee18000000b0050690bc07a3sm11999481eds.18.2023.05.01.07.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 07:57:20 -0700 (PDT)
From:   Daniel Lundberg Pedersen <dlp@qtec.com>
To:     mchehab@kernel.org
Cc:     linux-media@vger.kernel.org,
        Daniel Lundberg Pedersen <dlp@qtec.com>
Subject: [PATCH 0/2] media: Fix p_s32 and p_s64 pointer types
Date:   Mon,  1 May 2023 16:57:05 +0200
Message-Id: <20230501145707.4088026-1-dlp@qtec.com>
X-Mailer: git-send-email 2.38.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Unless I'm misunderstanding something then there is no reason to have
p_s32 and p_s64 in struct v4l2_ext_control be of type __u32* instead of
__s32* and __s64* respectively.

So this series fixes that and updates the documentation.

Daniel Lundberg Pedersen (2):
  media: videodev2.h: Fix p_s32 and p_s64 pointer types
  media: docs: vidioc-g-ext-ctrls.rst: Update p_s32 and p_s64 types

 Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst | 4 ++--
 include/uapi/linux/videodev2.h                               | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

--
2.38.4

