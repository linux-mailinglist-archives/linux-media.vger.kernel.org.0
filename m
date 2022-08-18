Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD0ED598E14
	for <lists+linux-media@lfdr.de>; Thu, 18 Aug 2022 22:33:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245675AbiHRUdn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Aug 2022 16:33:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230331AbiHRUdl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Aug 2022 16:33:41 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 000E9E034
        for <linux-media@vger.kernel.org>; Thu, 18 Aug 2022 13:33:35 -0700 (PDT)
Received: from whitebuilder.lan (192-222-136-102.qc.cable.ebox.net [192.222.136.102])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: nicolas)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 0BCE06601B46;
        Thu, 18 Aug 2022 21:33:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1660854813;
        bh=tJ3R/WFg5/1Nu1xM45QmBOyXSzMAGRIV8mbBpXXZ27U=;
        h=From:To:Cc:Subject:Date:From;
        b=XSfKfeTZ0RXCfhxs0R+J591A3ylyx8VAJUERCqv2m+/PZcIWtmPOOmmcdV4Y6Fyqe
         0+ZMlTox0c1o349fsWjnC5n/DLUW+Gk4kELaWH5v3UjcowH9PUFzJjX3Pi4k2kJbD4
         4oDHyJG7lRAcpMlIYrOWrl0XnxZjybeD9Pu00srp4R0jhEAP5YuOaf43bG9FpmLFFk
         7ssAgXGvmlbkkLerXIF/ZFpKSqjTK4Dq3QJtUpbGZZ+Szai8IF5+TIzgNX/SxylhHW
         liiiGRo67CbSr6ZaJV0upSb9BLhKiu6kd9kRQYfVbUHcbf9mhreqij/QUzM2o6FoHV
         ZL0YILspzR9TA==
From:   Nicolas Dufresne <nicolas.dufresne@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH v1 0/3] cedrus: Various bug fixes
Date:   Thu, 18 Aug 2022 16:33:05 -0400
Message-Id: <20220818203308.439043-1-nicolas.dufresne@collabora.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patchset addresses different bugs in cedrus driver. The first
patch address a possible NULL dereference in the probe function, the
second a possible infinite loop when passed invalid offsets and the
last one fixes a race condition in the watchdog implementation.

As of writing this cover later, fluster score remains unaffected
and score is 132/147 with GStreamer.

Dmitry Osipenko (2):
  media: cedrus: Set the platform driver data earlier
  media: cedrus: Fix endless loop in cedrus_h265_skip_bits()

Nicolas Dufresne (1):
  media: cedrus: Fix watchdog race condition

 drivers/staging/media/sunxi/cedrus/cedrus.c      | 4 ++--
 drivers/staging/media/sunxi/cedrus/cedrus_dec.c  | 4 ++--
 drivers/staging/media/sunxi/cedrus/cedrus_h265.c | 6 ++++--
 3 files changed, 8 insertions(+), 6 deletions(-)

-- 
2.37.2

