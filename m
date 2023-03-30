Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DCA86D08A2
	for <lists+linux-media@lfdr.de>; Thu, 30 Mar 2023 16:48:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231977AbjC3Osl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Mar 2023 10:48:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231384AbjC3Osj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Mar 2023 10:48:39 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EA08976D
        for <linux-media@vger.kernel.org>; Thu, 30 Mar 2023 07:48:36 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id h8so77514916ede.8
        for <linux-media@vger.kernel.org>; Thu, 30 Mar 2023 07:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112; t=1680187714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iLAWPKXoUympMZat+BBCQ+FxQRdpcVURmNHlKdeMUUo=;
        b=OvBUfxnk0HXmY5SwAKV7i+AqA+18ykI41gFHp+3nKIk5BrAF/YkmRLtmPZrweSUW5b
         LbXdODGY10fYx8Q0AtlxrhHnv/2pQXgRU7OY2u/mkDiz1cGHby1UewgYSmhoeHNwOm02
         BNWxDs1X/pK0Sb+fWQnzEGybckE3UEfzrBdibNVjadivrsUfX3PxxgoW2k5ErkcazkLs
         lORRpl1s0C9NWYcp1uuflKa707+rs8Mwu/M7JXgRmqq8wouekuneIc/FSWxtw+YEOttZ
         w2m66IZDr5GzLv+uI1/GZuPfvP0vbiHTR/6iKFLLSZmXEeMcve5XPOmL1CGtAYawqJbh
         bpOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680187714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iLAWPKXoUympMZat+BBCQ+FxQRdpcVURmNHlKdeMUUo=;
        b=YqmjXvAoVoEVFhf9qogzU6mXq8L4xkjbNihQBam9ZlKVmdxrE/1B6rrhQBEukqY6Et
         H84SKJ9hcrnAUAUfzWAOddXnV7AtuqTzjp8GjHiiimzPNJSiWWrAGCEj3dfD42V2fQDb
         VegMafv9gkOZFGbjLtd/aBisddkRevyBNczo/uGjrvbbnQv7IQsSyHmPfaQ82lMiJvIp
         7s3H51vIhEF8dLCJgOGbW70cJ/pN4zzJTJTHAZeP6C0bj+F4L2g5PjxM0HnXPD1KuZtg
         R/4Vv9NqQe5kCufEQg8pxZYnyyPx9WryX0fWexrHYHY0gjs4rNufRu3vQeqU9P85IEv0
         oEzQ==
X-Gm-Message-State: AAQBX9c+1i201s4nIIKIwLLe3JnDP+DauR0uV870Z6EvXi0XGb1b5JyD
        em9l/GMGEiaGK9RqF78c4Uf0PQ==
X-Google-Smtp-Source: AKy350YVMEmYJ1iSc64j7pNlmeRt95qrBSvjZ04UNzAnkVaLsB3Qc3SiRAFJpoVzqYWteqMHnYearA==
X-Received: by 2002:a05:6402:26d5:b0:4af:7bdc:188e with SMTP id x21-20020a05640226d500b004af7bdc188emr6638252edd.16.1680187714584;
        Thu, 30 Mar 2023 07:48:34 -0700 (PDT)
Received: from sleipner.berto.se (p54ac5f91.dip0.t-ipconnect.de. [84.172.95.145])
        by smtp.googlemail.com with ESMTPSA id vq2-20020a170907a4c200b0093e9fb91837sm7830426ejc.76.2023.03.30.07.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 07:48:34 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 1/3] media: dt-bindings: media: renesas,isp: Add binding for V4H
Date:   Thu, 30 Mar 2023 16:47:29 +0200
Message-Id: <20230330144731.3017858-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230330144731.3017858-1-niklas.soderlund+renesas@ragnatech.se>
References: <20230330144731.3017858-1-niklas.soderlund+renesas@ragnatech.se>
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

Document support for the ISP module in the Renesas V4H (r8a779g0) SoC.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
* Changes since v1
- Add tags from Rob and Geert.
---
 Documentation/devicetree/bindings/media/renesas,isp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,isp.yaml b/Documentation/devicetree/bindings/media/renesas,isp.yaml
index 514857d36f6b..33650a1ea034 100644
--- a/Documentation/devicetree/bindings/media/renesas,isp.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,isp.yaml
@@ -21,6 +21,7 @@ properties:
     items:
       - enum:
           - renesas,r8a779a0-isp # V3U
+          - renesas,r8a779g0-isp # V4H
   reg:
     maxItems: 1
 
-- 
2.40.0

