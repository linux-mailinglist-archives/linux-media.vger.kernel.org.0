Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 949BB693191
	for <lists+linux-media@lfdr.de>; Sat, 11 Feb 2023 15:42:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229560AbjBKOmC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 11 Feb 2023 09:42:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229631AbjBKOmB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 11 Feb 2023 09:42:01 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0158144B6
        for <linux-media@vger.kernel.org>; Sat, 11 Feb 2023 06:41:58 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id co8so4183512wrb.1
        for <linux-media@vger.kernel.org>; Sat, 11 Feb 2023 06:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=co8qjcyAfva4C9Kz6MryDMkFI1R96ChagGxAD7VsPjQ=;
        b=OKHMUVunF8ln2sKHa4rQhtaKqKBJHvwNFrvl0A5Yy/roJimXRWI14hiiwF+UanEU4r
         YSkg8Tb8t9JM29tj5akgEeWgYfH8mh+dOjIz4hw6C9mqAIB0iUO94lb9R4PQp+RhYxgo
         4a3HlfrSvZ76PjfKggXiwNj7DTYSpypqlScYGuYAXKTyZ73BlcJU7EXvG+klIfsNspTa
         CIf0L/3CtLu9/m2GZRjGjblQVo8niuq0FDejD87ZHIOfi8RZk7kNM1EdJLtKi89k7yI7
         qx8Lgaq0RH4HGiv/5jad99UwjegFMeE61LMpFNUWtiaXhRxzI2aq9/NyplX+wK46ObCs
         le0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=co8qjcyAfva4C9Kz6MryDMkFI1R96ChagGxAD7VsPjQ=;
        b=SR5WM1x6Ljw4yobyqIiYg2KmsK4zYxngR7EPtvl8HY/VPV7WB/PjpSJ7dcXzNze5qe
         sPKEYyPaFz6T2mnXnB+MLHy+oazxFtv2cF1B1FLtKOo68HP5g7B+Byy9qTkoeQ7q9GKO
         MThHY0gNpdn1+QRhCkfv5UsJZzPaIfcq/eUIomIADqsqdalm4+9JYqcnoNwsmZWMkamF
         EaYkAoqGFHLJy+DuUHT3sHUd6AOfK0RE7XYRhCOxdOuJ7VCkpiqgMbdUmoocW7sOJ75O
         WNoEMeA8rb9vNJijyb5OnXm828LSeQ/SUGaIP7M6iQ6k58nb0TgDXOfrbkw9pDDvXDUO
         KS7w==
X-Gm-Message-State: AO0yUKXQovMfWyhpQCI5i5foOIYDcpymBUsTfawtShP2BB0g9ADLFByL
        rYr+O9f8ZLjY+3JHVP7AzDoCk2s6X5OionInkjg=
X-Google-Smtp-Source: AK7set/FUzwC2XGcGhDSg88v9Z+HB3UQICNa08kuXU1WqTHFTDcjL0TOB/QR0R7aBBnWaVqqI9GI7w==
X-Received: by 2002:a5d:595f:0:b0:2c3:d8f0:547a with SMTP id e31-20020a5d595f000000b002c3d8f0547amr15888824wri.1.1676126517538;
        Sat, 11 Feb 2023 06:41:57 -0800 (PST)
Received: from sleipner.berto.se (p54ac5802.dip0.t-ipconnect.de. [84.172.88.2])
        by smtp.googlemail.com with ESMTPSA id i8-20020a5d4388000000b002c5493a17efsm4202510wrq.25.2023.02.11.06.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 06:41:57 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/3] media: dt-bindings: media: Add bindings for video capture on R-Car V4H
Date:   Sat, 11 Feb 2023 15:41:44 +0100
Message-Id: <20230211144147.3812388-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This small series and bindings for all modules involved in video capture 
on Renesas R-Car V4H.

Niklas Söderlund (3):
  media: dt-bindings: media: renesas,isp: Add binding for V4H
  media: dt-bindings: media: renesas,csi2: Add binding for V4H
  media: dt-bindings: media: renesas,vin: Add binding for V4H

 Documentation/devicetree/bindings/media/renesas,csi2.yaml | 1 +
 Documentation/devicetree/bindings/media/renesas,isp.yaml  | 1 +
 Documentation/devicetree/bindings/media/renesas,vin.yaml  | 1 +
 3 files changed, 3 insertions(+)

-- 
2.39.1

