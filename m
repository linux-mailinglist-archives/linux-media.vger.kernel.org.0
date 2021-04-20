Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C2F4365EC3
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 19:45:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233431AbhDTRqB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 13:46:01 -0400
Received: from mout02.posteo.de ([185.67.36.66]:55551 "EHLO mout02.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232473AbhDTRqA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 13:46:00 -0400
Received: from submission (posteo.de [89.146.220.130]) 
        by mout02.posteo.de (Postfix) with ESMTPS id 24AB7240103
        for <linux-media@vger.kernel.org>; Tue, 20 Apr 2021 19:45:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
        t=1618940727; bh=Y+3vP2qSfKuw36N6bxNiacbL2Ml26/86eq2z9cSuI7s=;
        h=From:To:Cc:Subject:Date:From;
        b=eo500J9OA4efSluC4LsPcX1jl9efIMF3JaCPXvr7qAkckahTV7gXEUw9kwawf4uMf
         alQXqwglxBRdWw3sqlYI9SfveN3dmZtqP+KXmSKF8g/+0t0Xab/rS6vSU9Jha/uiAp
         cJ3bQyjQE5KJxyEKH1lphkYhBLV1dKK+6jmTujV2gRte3+RKtYPQMmiFVwaDQGcibr
         9tnEKqF39/VDqYusiW77Y/b568SW14omHXf9KHFEbJHyWjniisdAhevtFrNPAHyYU7
         MuHfze+leaId7+ubHLkFpzDeCpmswmrQ5shYdw5D9tSsVZhJIVLyrbr4fiE/kRjWyU
         H11xB2Z0FUeSw==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4FPrgT1sGGz9rxB;
        Tue, 20 Apr 2021 19:45:24 +0200 (CEST)
From:   Sebastian Fricke <sebastian.fricke@posteo.net>
To:     linux-media@vger.kernel.org
Cc:     Sebastian Fricke <sebastian.fricke@posteo.net>,
        Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: rkisp1: rkisp1-params.c: Fix typos
Date:   Tue, 20 Apr 2021 17:45:22 +0000
Message-Id: <20210420174522.9618-1-sebastian.fricke@posteo.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

s/when the camera active/when the camera is active/
s/thus not isr protection/therefore there is no need to acquire a lock/

Signed-off-by: Sebastian Fricke <sebastian.fricke@posteo.net>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index b6beddd988d0..529c6e21815f 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -1258,7 +1258,10 @@ void rkisp1_params_configure(struct rkisp1_params *params,
 	rkisp1_params_config_parameter(params);
 }
 
-/* Not called when the camera active, thus not isr protection. */
+/*
+ * Not called when the camera is active, therefore there is no need to acquire
+ * a lock.
+ */
 void rkisp1_params_disable(struct rkisp1_params *params)
 {
 	rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_DPCC_MODE,
-- 
2.25.1

