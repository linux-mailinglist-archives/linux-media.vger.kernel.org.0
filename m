Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 108AB363B39
	for <lists+linux-media@lfdr.de>; Mon, 19 Apr 2021 08:02:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230038AbhDSGDJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Apr 2021 02:03:09 -0400
Received: from mout01.posteo.de ([185.67.36.65]:44655 "EHLO mout01.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229630AbhDSGDI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Apr 2021 02:03:08 -0400
Received: from submission (posteo.de [89.146.220.130]) 
        by mout01.posteo.de (Postfix) with ESMTPS id CFD3A24002D
        for <linux-media@vger.kernel.org>; Mon, 19 Apr 2021 08:02:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
        t=1618812157; bh=3IN80IYONT6oAz2dlhNOkGlr8EfsfOZFECs2S2AKsJg=;
        h=From:To:Cc:Subject:Date:From;
        b=rPwC4RDcNqCuiOofcG/79NlQKGoDDBtfC+lGAIFqi9rsXZYOgAfZcdmq8nNfYGYfH
         Ilao7AHbMankLe0IrQbOu6cX6WP7vlandH2cEbOXq035gnJ+/QOAx34s8Gd0QXOrFC
         MSl3g+9QJFQgTWrA7r8sBJnlhS6FZnoAOZZdnyqTeZF92m8r9PgWt+PhAoAEs43gh9
         wpoOUXqn2XcnWAD/PorqZeVWVu+waFG/TksfyzXmKJ2USu51/m/UIvaPeu2q0sa/Rj
         DrUIUXWbOJpvCByFstlrj52XoFHRUuJW3TsUgvRH9Vs9z3DkaUB8whMq0IWkU0LmIm
         nEZ7HfQKyjl5Q==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4FNx703jlqz9rxG;
        Mon, 19 Apr 2021 08:02:36 +0200 (CEST)
From:   Sebastian Fricke <sebastian.fricke@posteo.net>
To:     linux-media@vger.kernel.org
Cc:     Sebastian Fricke <sebastian.fricke@posteo.net>,
        Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: rkisp1: rkisp1-params.c: Fix typos
Date:   Mon, 19 Apr 2021 06:02:25 +0000
Message-Id: <20210419060224.44353-1-sebastian.fricke@posteo.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

s/when the camera active/when the camera is active/
s/thus not isr protection/thus no ISR protection/

Signed-off-by: Sebastian Fricke <sebastian.fricke@posteo.net>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index b6beddd988d0..ead948a2d01e 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -1258,7 +1258,7 @@ void rkisp1_params_configure(struct rkisp1_params *params,
 	rkisp1_params_config_parameter(params);
 }
 
-/* Not called when the camera active, thus not isr protection. */
+/* Not called when the camera is active, thus no ISR protection. */
 void rkisp1_params_disable(struct rkisp1_params *params)
 {
 	rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_DPCC_MODE,
-- 
2.25.1

