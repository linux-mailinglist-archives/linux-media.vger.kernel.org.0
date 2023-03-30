Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 168DA6D089F
	for <lists+linux-media@lfdr.de>; Thu, 30 Mar 2023 16:48:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231787AbjC3Osj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Mar 2023 10:48:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230458AbjC3Osi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Mar 2023 10:48:38 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ABCE900D
        for <linux-media@vger.kernel.org>; Thu, 30 Mar 2023 07:48:35 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id i5so77699809eda.0
        for <linux-media@vger.kernel.org>; Thu, 30 Mar 2023 07:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112; t=1680187714;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MbBZmiUq2SewGcB1WQ+odX7aRajPGQ6kWC2rF4Mgtf0=;
        b=Nc1Hr4zJ2vyjsAlR1T1xygY7Kxe1+rOnyI09qThvo1i8qN8V9YBdAB+BBuFHfxwmry
         r+x+2S3VtqKOe6cwUmKc6cQFEb0Ev1h26bAjeMlZfx91hbSUO0JXFmFMCRPeCiYM7gMB
         +q80FXNXgmqMy6nwfVM+zpKtQ1wQoA4KzHiMZ+fdqw68FORQPDzxPWxBvpufUc5R3emx
         IhKqb9RnGWdNHMH5clEGKGbNasoqv2SDZiYLIMx9t0i3l/FV9702vTavwHepDK5iwFhw
         LyLNdj0FAVNL0fwGOp484mgbG/ysf9MSGhFssjvOtJ/RRmS5lbFhuEFd9JcAFw8NcI3Y
         4wvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680187714;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MbBZmiUq2SewGcB1WQ+odX7aRajPGQ6kWC2rF4Mgtf0=;
        b=wtuq941IvmowSaUtdEv6Aa7XV5Faw05gqrUVCVrja1lzTJJ3wbKIdyGe0tSg5i1xH6
         OVLEaNm5nud1WeBwtgLw8xGP6/kPKa17vROjvObFr0+/8hNNaIzCPqF985xHjlhfWZ2b
         pKvetfRlINqk3nMZ+s6RoKESErLQsLoayaFJOP+0cPJNdaYqk68dv1A5Bswu0X0aJlFx
         8YEHaEHnnCjNbAcNxFJlpsploYLLOhwTy4nGET9snbFODuMwB0hOahXQ/OaxtySy1i9d
         PyGsKW7UrkZc5Jli1aHD/sqin+SwkagerdYsd9m67nkP/fzIh+nMa5avrWqkdLOjxP1K
         DaeQ==
X-Gm-Message-State: AAQBX9dfAvqEL0m+BJlqUg5UYaJBefz3iIitPLFHJ1wWwxrFlubcEeSZ
        N8+2+eL8DI1bA4Z4T8OLcNxj6w==
X-Google-Smtp-Source: AKy350YgGVveoKiwxdvAXb7x4ZQpu4bN4K0kADwQ0U5BBvXLwkgwalT41WFx3DIBZt95Obg1RD5Wog==
X-Received: by 2002:a17:906:b28c:b0:931:baf:259 with SMTP id q12-20020a170906b28c00b009310baf0259mr25192648ejz.63.1680187713837;
        Thu, 30 Mar 2023 07:48:33 -0700 (PDT)
Received: from sleipner.berto.se (p54ac5f91.dip0.t-ipconnect.de. [84.172.95.145])
        by smtp.googlemail.com with ESMTPSA id vq2-20020a170907a4c200b0093e9fb91837sm7830426ejc.76.2023.03.30.07.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 07:48:33 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 0/3] media: dt-bindings: media: Add bindings for video capture on R-Car V4H
Date:   Thu, 30 Mar 2023 16:47:28 +0200
Message-Id: <20230330144731.3017858-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
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
2.40.0

