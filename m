Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FB004BD0B4
	for <lists+linux-media@lfdr.de>; Sun, 20 Feb 2022 19:39:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241171AbiBTSVi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Feb 2022 13:21:38 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239990AbiBTSVg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Feb 2022 13:21:36 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40DC54507D
        for <linux-media@vger.kernel.org>; Sun, 20 Feb 2022 10:21:15 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id c192so8297810wma.4
        for <linux-media@vger.kernel.org>; Sun, 20 Feb 2022 10:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nW3zanIb89F+ZIAwtSVyu70tsp7djaryUUwhcavfZTI=;
        b=emBfwchzWz+TQ6MUDPfmQE97BJxNnq25JK9G2/qVcpAk5DqBhcLeGEuM+6Ckp86NPa
         LLnxfxHTj86ydpJjreThNN9abw/gA9/wGUAPz2DfHjaF2J458vWV/Kg1zm4zfVdP/3Uh
         g28HTDrZyWpnYEPMlvFJrmxeMO+vJxa/jfQm6hO80T+Xg7klF0aACrIMFZh4KT4x+Ip3
         x0O0l3DZLX+rou1auTtOAyLh/hPxUEAyLK/RRdLwa20r4TaNnLMls4yBP8s97OTDSYEx
         LWHjyOScSYnXFVowbRYMluMHGVtTdY97UGYyYwG7mSe619jpbwcKOApaPRVLxjK3nIKz
         3EVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nW3zanIb89F+ZIAwtSVyu70tsp7djaryUUwhcavfZTI=;
        b=PaaWJNaFW85xlN/+wuAQKnaF0fsovowi4cmxtOOowaNMiVky0aZB6uTNoTU6pVoVOv
         Fyhsqe82Y7MpHDqVbjO27w+rKWJdD48621iMnMToJRIJad7egIpPWdCdASwAZIqCuSEw
         IUqaV/d3KARpuf+qai3ueMRZU9w5bSIB78GxKnqwH0DjEmUiHO6s/is0oT7hQmgWVHLe
         TiEQm3TtSDorY046Yc8RgkqS5iu9Y1s3T95nVynu5Y127/yeyQwiNJLkgxMYnDMqTaWH
         EMuQZJR5vBzj2bLRJGeZxtxttUP41cdncfTwh6GZMm7oQb63vLyxboESEk7dV+LZS6yA
         /ROg==
X-Gm-Message-State: AOAM533wPNtnrTKWd6Gg3jlM5uP+PnHsPQtamIJBbVAP2OX4kBafPZDk
        hqGIgKnDmnKJV60mBwLSyGiSY2AltS2A7A==
X-Google-Smtp-Source: ABdhPJwCmWu9RU+zsJ9wtN30V+Afe/f1QC6WWep+suPhuvp9nyUObitnhfBhpFJmzGpWN3OOXTvCkQ==
X-Received: by 2002:a05:600c:2108:b0:34e:870:966e with SMTP id u8-20020a05600c210800b0034e0870966emr18548807wml.173.1645381273471;
        Sun, 20 Feb 2022 10:21:13 -0800 (PST)
Received: from tool.localnet (2.155.208.155.dyn.user.ono.com. [2.155.208.155])
        by smtp.gmail.com with ESMTPSA id p27sm5494215wms.39.2022.02.20.10.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 10:21:12 -0800 (PST)
From:   Daniel =?ISO-8859-1?Q?Gonz=E1lez?= Cabanelas <dgcbueu@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl, mchehab@kernel.org
Subject: [PATCH v2] media: cx88-mpeg: clear interrupt status register before streaming video
Date:   Sun, 20 Feb 2022 19:19:50 +0100
Message-ID: <5542404.DvuYhMxLoT@tool>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some cx88 video cards may have transport stream status interrupts set
to 1 from cold start, causing errors like this:

  cx88xx: cx88_print_irqbits: core:irq mpeg  [0x100000] ts_err?*
  cx8802: cx8802_mpeg_irq: mpeg:general errors: 0x00100000

According to CX2388x datasheet, the interrupt status register should be
cleared before enabling IRQs to stream video.

=46ix it by clearing the Transport Stream Interrupt Status register.

Signed-off-by: Daniel Gonz=C3=A1lez Cabanelas <dgcbueu@gmail.com>
=2D--
Changes in v2:
  - Added bits 8 and 12 to the clear operation. Now all documented
    MO_TS_INTSTAT bits are cleared.

 drivers/media/pci/cx88/cx88-mpeg.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/pci/cx88/cx88-mpeg.c b/drivers/media/pci/cx88/cx=
88-mpeg.c
index 680e1e3fe..2c1d5137a 100644
=2D-- a/drivers/media/pci/cx88/cx88-mpeg.c
+++ b/drivers/media/pci/cx88/cx88-mpeg.c
@@ -162,6 +162,9 @@ int cx8802_start_dma(struct cx8802_dev    *dev,
 	cx_write(MO_TS_GPCNTRL, GP_COUNT_CONTROL_RESET);
 	q->count =3D 0;
=20
+	/* clear interrupt status register */
+	cx_write(MO_TS_INTSTAT,  0x1f1111);
+
 	/* enable irqs */
 	dprintk(1, "setting the interrupt mask\n");
 	cx_set(MO_PCI_INTMSK, core->pci_irqmask | PCI_INT_TSINT);
=2D-=20
2.35.1




