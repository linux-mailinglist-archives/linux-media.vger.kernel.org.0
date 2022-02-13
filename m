Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 432294B3D7E
	for <lists+linux-media@lfdr.de>; Sun, 13 Feb 2022 21:42:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238276AbiBMUmr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Feb 2022 15:42:47 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238271AbiBMUmq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Feb 2022 15:42:46 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C91E53707
        for <linux-media@vger.kernel.org>; Sun, 13 Feb 2022 12:42:40 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id k41so7384131wms.0
        for <linux-media@vger.kernel.org>; Sun, 13 Feb 2022 12:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2l8RmJhXY0Cojq1b9WyVWxynNUeeBvrbM789iym/Iys=;
        b=HDHNGRXjh9u2O9Rca5CS2OrESPM5jByCNbbwPEAcMRqCKAdLn8EDjXpnJ2v81SdnKn
         yis2ziFXEoQiD8+oFt+pO0AvB+IqPmX1y4Bi28FpMoTtOa8oUXuuFvcbl5d9CqIX5VjX
         qqs0s/diYgvBMZHa7aK1Jkiguy7WS4aMxZ3CAcHwnY4zjZiBgI3gfOipn4jTiZn6Loyn
         /fnP59RhKqgxz5RSBYUldNWPTkZQ6YPxeaO+h/v2fwV1NCIDjlsUTxBWHYKFnQJGAFGK
         gt50TUPeW856KEl20eiVL2YjlcilyTWURXDGBaqtbIM+5+sv0zc5AhoocR/FkspmmQfD
         dLnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2l8RmJhXY0Cojq1b9WyVWxynNUeeBvrbM789iym/Iys=;
        b=go7pqYjDz5pD+A7BYPyplrrl8qXFYbSJ3KDiZWCLNV/kh5Xdl6pSlpLfs7zUltiHJk
         3VMnPlBQLyfjQ/gqAl2ewsANjR0Ig13CCZedyLEHT1G6sm//ivfsmGce9rIki04BqqgA
         oLk231QWQudyWCPh+5oZQ7UmfngJsuv+cvfFx2AlYH0SFpQ7kErMNHwZ9Jwk0gMnMnD0
         /8OjgJbfooBI8ZM7uNqg0EIHtJFxSvWhPYKVXnmNvy1ux9mExNChldr2upOcF+u3Hj/a
         OCm5R7Ryub1qk85WDQ7w4VGnl8JuhOQ/gAXDhA9H71OHyRUiEkOsnpQWViQLvUosFu/S
         4vIA==
X-Gm-Message-State: AOAM532Tu6hIIKhz3T7VdvGMLpzi2KvbyJkoqPBcTr3patPq5CbYUDZV
        Usyf+Y/dnyljmdF5zJUMSrN9E+Uowo4=
X-Google-Smtp-Source: ABdhPJzsFzmJg35EN2a+FRVVkYpnfgmRzpbGQ4UJqzfOH2DhR1QvRyJEgljAvJXCfhilVjFXxeYj+A==
X-Received: by 2002:a7b:c318:: with SMTP id k24mr8643687wmj.0.1644784958730;
        Sun, 13 Feb 2022 12:42:38 -0800 (PST)
Received: from tool.localnet (static-64-238-230-77.ipcom.comunitel.net. [77.230.238.64])
        by smtp.gmail.com with ESMTPSA id q76sm10616735wme.1.2022.02.13.12.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Feb 2022 12:42:38 -0800 (PST)
From:   Daniel =?ISO-8859-1?Q?Gonz=E1lez?= Cabanelas <dgcbueu@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl
Subject: [PATCH] media: cx88-mpeg: clear interrupt status register before streaming video
Date:   Sun, 13 Feb 2022 21:40:31 +0100
Message-ID: <3650877.kQq0lBPeGt@tool>
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
to 1 from cold start. This may lead to errors like this one after=20
initializing the video card:

  cx88xx: cx88_print_irqbits: core:irq mpeg  [0x100000] ts_err?*
  cx8802: cx8802_mpeg_irq: mpeg:general errors: 0x00100000

According to CX2388x datasheet the interrupt status register should be
cleared before enabling IRQs to stream video.

=46ix it clearing the status register matching the transport stream
interrupt mask in the cx8802_start_dma function.

Signed-off-by: Daniel Gonz=C3=A1lez Cabanelas <dgcbueu@gmail.com>
=2D--
 drivers/media/pci/cx88/cx88-mpeg.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/pci/cx88/cx88-mpeg.c b/drivers/media/pci/cx88/cx=
88-mpeg.c
index 680e1e3fe..9e25fd585 100644
=2D-- a/drivers/media/pci/cx88/cx88-mpeg.c
+++ b/drivers/media/pci/cx88/cx88-mpeg.c
@@ -162,6 +162,9 @@ int cx8802_start_dma(struct cx8802_dev    *dev,
 	cx_write(MO_TS_GPCNTRL, GP_COUNT_CONTROL_RESET);
 	q->count =3D 0;
=20
+	/* clear interrupt status register */
+	cx_write(MO_TS_INTSTAT,  0x1f0011);
+
 	/* enable irqs */
 	dprintk(1, "setting the interrupt mask\n");
 	cx_set(MO_PCI_INTMSK, core->pci_irqmask | PCI_INT_TSINT);
=2D-=20
2.35.1




