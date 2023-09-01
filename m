Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B07FC78FED7
	for <lists+linux-media@lfdr.de>; Fri,  1 Sep 2023 16:19:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349937AbjIAOTf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Sep 2023 10:19:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231482AbjIAOTe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Sep 2023 10:19:34 -0400
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FC9C10FC
        for <linux-media@vger.kernel.org>; Fri,  1 Sep 2023 07:19:25 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 501)
        id 93DF9100051; Fri,  1 Sep 2023 15:19:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
        t=1693577963; bh=1+AS8VgTF0D8Fb2qH/JEjjvHZ/Tb2Ldqs3q8XHRnqGs=;
        h=From:To:Subject:Date:From;
        b=odpbeRl9r14O3JnZZmgROHdm/7Ov9KyrJBXTvFgXM+pFHCagb0rRFrkk1g3y4ijXx
         LFAdQaMn3BJlGRfmXptw0O/eGTySfXkbjs3+k4sJtUeCOzF11z50/oVPfMJwe+tfzW
         NXCi5XlpNiG1moAzGPzwWnWBoiH4yntFgPr3LNkdITY4q7FHB6qPRVPfCgt69NmfJS
         qhWC2ythZJTaq6e5EbSvHEH0R/y1U96NkkYkXgBniPeFVZFf5BEiwsx0b+AZ47JwU/
         NCg8YfTCJqsvMHrQ3qFFLLpNdM5vZZ0bq/p2mol8gbgEnG3laUD48WnCqrKhE3mEnf
         djb2DioLZIODg==
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
Received: from localhost.localdomain (bigcore.mess.org [IPv6:2a02:8011:d000:212:44e0:1480:5a2d:d8ed])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by gofer.mess.org (Postfix) with ESMTPSA id 80E2D100051
        for <linux-media@vger.kernel.org>; Fri,  1 Sep 2023 15:19:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
        t=1693577962; bh=1+AS8VgTF0D8Fb2qH/JEjjvHZ/Tb2Ldqs3q8XHRnqGs=;
        h=From:To:Subject:Date:From;
        b=AAyw6SNcDih/Q7srZwaervXq6m7hymfVHmryeWboPTHFpv1uXoXYniagvVMcugpgi
         M1cz9j0nZjh6KBuDOnGsHzeaJxrQ1Zk4ro4mw/FH04HWHGQtRIy8Ni48kzp51frHW0
         MP8rsGDk1k6FkgRJM2XPz+K7d7oCeaSMuj73P+75KM/fqWXkuFX8QensI6v7G6vJAT
         +u7FwqY99yEDRKdyK79wCwCxerKV0YDPgH4lYAYJYpjfS4Eo/1wJYdKVQ9bgai8CXd
         4Hk1y9ZQxd+1LphK2i8RoS6RBUgWyATDuldYcZTyA9oHSSlf2cqZzejswkvlCahPfN
         2IZ5lXwPzOUVg==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH v5 0/2] Remove ir-rx51 driver
Date:   Fri,  1 Sep 2023 15:18:54 +0100
Message-ID: <cover.1693577725.git.sean@mess.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ir-rx51 driver is no longer necessary, pwm-ir-tx does the same job
and is more generic.

changes:
 v5:
  - Fix cc/to lists
 v4:
  - Fixed issues with pwm-ir-tx.yaml and did some more testing

 v3:
  - Fixed issues with pwm-ir-tx.yaml

 v2:
  - Made pwm-ir-tx compatible with nokia,n900-ir rather than changing
    the n900 devicetree


Sean Young (2):
  dt-bindings: media: remove nokia,n900-ir as pwm-ir-tx is compatible
  media: rc: remove ir-rx51 in favour of generic pwm-ir-tx

 .../bindings/leds/irled/pwm-ir-tx.yaml        |   5 +-
 .../devicetree/bindings/media/nokia,n900-ir   |  20 --
 arch/arm/configs/omap2plus_defconfig          |   1 -
 drivers/media/rc/Kconfig                      |  10 -
 drivers/media/rc/Makefile                     |   1 -
 drivers/media/rc/ir-rx51.c                    | 285 ------------------
 drivers/media/rc/pwm-ir-tx.c                  |   1 +
 7 files changed, 5 insertions(+), 318 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/nokia,n900-ir
 delete mode 100644 drivers/media/rc/ir-rx51.c

-- 
2.42.0

