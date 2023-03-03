Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CAFC6AA1D3
	for <lists+linux-media@lfdr.de>; Fri,  3 Mar 2023 22:43:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232195AbjCCVnV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Mar 2023 16:43:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232166AbjCCVmz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Mar 2023 16:42:55 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF3E04B806;
        Fri,  3 Mar 2023 13:42:01 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2ED3261923;
        Fri,  3 Mar 2023 21:41:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2029C43323;
        Fri,  3 Mar 2023 21:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677879716;
        bh=WQ/AFTgJmQr/mPiSgZxL3KFvJ3Y/Dj8btyJ8583Tz6Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=poGMy3zDZMMWDPKvjnFobfAdvRxS4ay8Pcm1yxEKXJWSBuR7DCojvJ3SwK0swDSHK
         MJTeRevR2xdZWLH2HwpSKKIUMnulMrmYrP48Ok9zfzmOL6Au/nU9kacKXTgKZJaHdD
         tIuhI2J2gAWAAionGXIcJuCXjMxB3fHB6f/UL4rh8nGvf4Ah3mqKLrePKy4GieDtyN
         EPQJsfuP9jk508HXuGT+4+D0okUgzWXeiJjK2+BuRug4QcrKpwDQVcO3cRWpo8Ydrf
         tIvDQVBqfc0utayxgDmjK+RREiDG9+Qxhif5GbQqHPEYuTIG7LIKNewiAIEpu1g/lc
         j+DZJOgAGZ8zg==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ricardo Ribalda <ricardo@ribalda.com>,
        Michael Grzeschik <m.grzeschik@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>, mchehab@kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.2 24/64] media: uvcvideo: Add GUID for BGRA/X 8:8:8:8
Date:   Fri,  3 Mar 2023 16:40:26 -0500
Message-Id: <20230303214106.1446460-24-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303214106.1446460-1-sashal@kernel.org>
References: <20230303214106.1446460-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Marek Vasut <marex@denx.de>

[ Upstream commit 015d44c2b700ba9639dd29672ba362796cc0be54 ]

The Cypress EZUSB FX3 UVC example can be configured to report pixel
format "e436eb7e-524f-11ce-9f53-0020af0ba770". This is its GUID for
BGRA/X 8:8:8:8.

The UVC 1.5 spec [1] only defines GUIDs for YUY2, NV12, M420 and I420.
This seems to be an extension documented in the Microsoft Windows Media
Format SDK[2]. This Media Format SDK defines this GUID as corresponding
to `MEDIASUBTYPE_RGB32`, which is confirmed by [4] as `MEDIASUBTYPE_ARGB32`
has different GUID.

Note that in my case, the FX3 UVC can output either channel order,
BGR or RGB or any other mix for that matter. Since Linux commit
1b8dc32286a1a ("[media] uvcvideo: Add GUID for BGR 8:8:8")
defined a GUID for `MEDIASUBTYPE_RGB24` channel order as BGR, keep
this change consistent and define `MEDIASUBTYPE_RGB32` as BGR as well.
Document [3] also indicates the channel order is BGR.

[1] https://www.usb.org/document-library/video-class-v15-document-set
[2] https://learn.microsoft.com/en-us/windows/win32/wmformat/media-type-identifiers
[3] https://learn.microsoft.com/en-us/windows/win32/directshow/uncompressed-rgb-video-subtypes
[4] https://gix.github.io/media-types/

Signed-off-by: Marek Vasut <marex@denx.de>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Ricardo Ribalda <ricardo@ribalda.com>
Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
Link: https://lore.kernel.org/r/20230126231456.3402323-2-m.grzeschik@pengutronix.de
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 include/media/v4l2-uvc.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/media/v4l2-uvc.h b/include/media/v4l2-uvc.h
index f83e31661333b..b010a36fc1d95 100644
--- a/include/media/v4l2-uvc.h
+++ b/include/media/v4l2-uvc.h
@@ -99,6 +99,9 @@
 #define UVC_GUID_FORMAT_BGR3 \
 	{ 0x7d, 0xeb, 0x36, 0xe4, 0x4f, 0x52, 0xce, 0x11, \
 	 0x9f, 0x53, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70}
+#define UVC_GUID_FORMAT_BGR4 \
+	{ 0x7e, 0xeb, 0x36, 0xe4, 0x4f, 0x52, 0xce, 0x11, \
+	 0x9f, 0x53, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70}
 #define UVC_GUID_FORMAT_M420 \
 	{ 'M',  '4',  '2',  '0', 0x00, 0x00, 0x10, 0x00, \
 	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
@@ -266,6 +269,11 @@ static struct uvc_format_desc uvc_fmts[] = {
 		.guid		= UVC_GUID_FORMAT_BGR3,
 		.fcc		= V4L2_PIX_FMT_BGR24,
 	},
+	{
+		.name		= "BGRA/X 8:8:8:8 (BGR4)",
+		.guid		= UVC_GUID_FORMAT_BGR4,
+		.fcc		= V4L2_PIX_FMT_XBGR32,
+	},
 	{
 		.name		= "H.264",
 		.guid		= UVC_GUID_FORMAT_H264,
-- 
2.39.2

