Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C0A7412AAC
	for <lists+linux-media@lfdr.de>; Tue, 21 Sep 2021 03:44:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235186AbhIUBqL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Sep 2021 21:46:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232577AbhIUBjo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Sep 2021 21:39:44 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0BFCC04709C;
        Mon, 20 Sep 2021 13:02:16 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id b15so54023393lfe.7;
        Mon, 20 Sep 2021 13:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DA2UKuLK2u92CFl87mNPANcMsuKDJqU2qIFoERzDd/w=;
        b=BhK92otjhD3xaxoPKxq8dGARgg4mm1Yl/hJdJw4FaYlMMMUDh8XYYkLIXLlRrUcvEa
         SpiIDnHHH2Ts8FQYlgNsK31m5lrpwXsD7w3YX+67a320Ssw9eVrDeE3yDFLOm2qsbiuc
         nOUcfuxp7d/0tJuU9ufuJTd4soHpkSLMMumM4rTCSfo3GixbMtiMqQ5qrjmRQLglj21Z
         rZNEu0yyPj3f1tmgHCaFD1BxhRfUz93JIe2BAwANsdzvZOrKd86sRxAzwK3Afqwu22Ql
         9as/7e5rXVAyoPUA97+wwxJzBDvZq0x+slm1de5IDNIHUDJ6H101EDmLTLenOdFcaV8j
         IElw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DA2UKuLK2u92CFl87mNPANcMsuKDJqU2qIFoERzDd/w=;
        b=xNOp/QSnUiHkEjHrmSgQbSs/OE4O93OF8P+cHDM4JOR2Wyd4zVbV/vdUFzte5zCQ/f
         2DC2t+j3WZvCjyBqPr5jK8VUyDVsS8AFYEcDaTXX5QF9IzfJVn1TNbzk56CT0vlN61/4
         4pyEew7riyj6e0lZsQiZZX5f7q3hbEeAuaKL0jYhAKY2iuFVbU4W/UOrPFnAoTTgxT72
         W9DTBU0oeKFi8LGKOC5lIJVRe6QIIrHNhq86biLKXrW49nFjQCmiwBVgGaQm3+uylyoR
         DJcE0tFRdjT+rNrRLmK47HNltukZt4rnvpy/IDU8bBbmPhzODVTCDKbk8+qw2iWBq3fC
         IqSA==
X-Gm-Message-State: AOAM5331TreQ4iUeNHf2Xgbqsn4XDuSL22cBuHEXsh26gJxXrrVSJzaU
        h5doCE3vvH9v3DjI49QNXgq8uw/QW5w=
X-Google-Smtp-Source: ABdhPJzzUtG5jeCmlfMAoFe1F0K0Lo3jMvKyIPC3Q9gD9Q2yW5gij6hetl6DT3481fOrP1F4wLtLSw==
X-Received: by 2002:a2e:5442:: with SMTP id y2mr22916242ljd.436.1632168135294;
        Mon, 20 Sep 2021 13:02:15 -0700 (PDT)
Received: from localhost.localdomain (h-98-128-228-193.NA.cust.bahnhof.se. [98.128.228.193])
        by smtp.gmail.com with ESMTPSA id u3sm1350862lft.149.2021.09.20.13.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 13:02:14 -0700 (PDT)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH] media: hantro: Constify static struct v4l2_m2m_ops
Date:   Mon, 20 Sep 2021 22:02:10 +0200
Message-Id: <20210920200210.18935-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The only usage of vpu_m2m_ops is to pass its address to v4l2_m2m_init()
which has a pointer to const struct v4l2_m2m_ops as argument. Make it
const to allow the compiler to put it in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/staging/media/hantro/hantro_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index f23fc14b3562..fb82b9297a2b 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -179,7 +179,7 @@ static void device_run(void *priv)
 	hantro_job_finish_no_pm(ctx->dev, ctx, VB2_BUF_STATE_ERROR);
 }
 
-static struct v4l2_m2m_ops vpu_m2m_ops = {
+static const struct v4l2_m2m_ops vpu_m2m_ops = {
 	.device_run = device_run,
 };
 
-- 
2.33.0

