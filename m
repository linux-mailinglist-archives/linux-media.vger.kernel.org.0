Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3DCF75C176
	for <lists+linux-media@lfdr.de>; Fri, 21 Jul 2023 10:24:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229936AbjGUIYG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Jul 2023 04:24:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229891AbjGUIYF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Jul 2023 04:24:05 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0DE2ED
        for <linux-media@vger.kernel.org>; Fri, 21 Jul 2023 01:24:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 676946162C
        for <linux-media@vger.kernel.org>; Fri, 21 Jul 2023 08:24:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65551C433C7
        for <linux-media@vger.kernel.org>; Fri, 21 Jul 2023 08:24:03 +0000 (UTC)
Message-ID: <7621f179-5720-e77c-d117-fb4392739a50@xs4all.nl>
Date:   Fri, 21 Jul 2023 10:24:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] media: pci: saa7164: replace BUG with error return
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It was completely unnecessary to use BUG in saa7164_s_frequency,
just return an error instead. This also solves a smatch error:

drivers/media/pci/saa7164/saa7164-encoder.c:388 saa7164_s_frequency() error: potentially dereferencing uninitialized 'tsport'.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/pci/saa7164/saa7164-encoder.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/saa7164/saa7164-encoder.c b/drivers/media/pci/saa7164/saa7164-encoder.c
index c1b6a0596801..bf73e9e83f52 100644
--- a/drivers/media/pci/saa7164/saa7164-encoder.c
+++ b/drivers/media/pci/saa7164/saa7164-encoder.c
@@ -383,7 +383,7 @@ int saa7164_s_frequency(struct saa7164_port *port,
 	else if (port->nr == SAA7164_PORT_ENC2)
 		tsport = &dev->ports[SAA7164_PORT_TS2];
 	else
-		BUG();
+		return -EINVAL; /* should not happen */

 	fe = tsport->dvb.frontend;

-- 
2.40.1

