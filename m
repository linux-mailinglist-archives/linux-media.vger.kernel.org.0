Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF0815F8795
	for <lists+linux-media@lfdr.de>; Sat,  8 Oct 2022 23:54:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbiJHVx6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 8 Oct 2022 17:53:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbiJHVx5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 8 Oct 2022 17:53:57 -0400
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B86232063
        for <linux-media@vger.kernel.org>; Sat,  8 Oct 2022 14:53:56 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id D874A5C00E4;
        Sat,  8 Oct 2022 17:53:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Sat, 08 Oct 2022 17:53:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :message-id:mime-version:reply-to:sender:subject:subject:to:to;
         s=fm3; t=1665266033; x=1665352433; bh=uHw6FLeKrnDjbGOBPPzfIewGF
        Vy5B/VI4oql5ep7vBc=; b=cbf8Qd6Dv0AElGyc1PbGMtz49/npyoX3QblVuYq2h
        KaBHK/wBE36gZeIj37rWRqkBJsyW1qkI1EwfieIBsOVjq3e3G8BCQ02j43RZJq3W
        f1BjO92lNKNN59WDDLa49/ErG5U9sPdO5/iUJ+LiOasFMdwakFm9jryHSvvtdMUr
        s5aSh74MYvbrwZ+9xP4XBVc/yMYRJnl45CwxFsvMZ4L5BNucXFuWh91fppEAMSeb
        G62WYWSzF/sub7H3rRBYQCfpzSAtJu/pT9Qip8ZWwb7UmcckIQctJkGEiNqbgB2B
        2LuO8JGR4Fz6wi/PFrgxnQUR9zpN2jOAFLXhovKRLugJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:message-id
        :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1665266033; x=1665352433; bh=uHw6FLeKrnDjbGOBPPzfIewGFVy5B/VI4oq
        l5ep7vBc=; b=dqg/NlFVmQysQuNxnolxUeM7nT39OtuVE3ArfXnP+C8PwFPW+DE
        CJoRH807WIhXHUQAUOQI9Z97V4NAy2yId9MhPnSZoCPfT4VaNwtaulRROzbQm3Hq
        AB5WQnAby5Yj7sLS66Eix4KLhMQFIkf8qc/fiP/6kwQe8v75twBRKG34yfp2HiBw
        Di6PDufcMCJdYJwTkza8e9p3vye90oWHDsZ0ibDkdpBojqpjUFBW2XaGplDaoDPm
        yk7+3zOHf1KjjdwaMSAD/w4JFIU6jZT8cJFS+sSEACkH0jzwJR5rjg8RtGRQL59t
        6UJ8G7qT37DrbQrZe5W2CxhsupVQ4tzv8vQ==
X-ME-Sender: <xms:cfFBY1NO8gyiV5mWAD6aIMO2qOA9nn77Y9AZzkX1mjYFaysonC1abQ>
    <xme:cfFBY38HBKx-32pGT2liRfZPJBl0d6QH_lQoI8CZMO31UWV509HA_cOkkWusyEFPi
    lZNQHjLvEHpV3CvxL4>
X-ME-Received: <xmr:cfFBY0Sj594wr69GI_YCBgKiTLuAeljZf1dWxXaS5mE-QNzVhTTnQfo2uX1csxtzvxpPkqKQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeejtddgtdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpeffrghfnhgrucfjihhrshgthhhfvghlugcuoegurghfnhgrsehf
    rghsthhmrghilhdrtghomheqnecuggftrfgrthhtvghrnhepveeuhfejgffhkeekleelhe
    etkeevveffgfdvfeeffeefvdelffeliedtvddvgfeknecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomhepuggrfhhnrgesfhgrshhtmhgrihhlrdgtoh
    hm
X-ME-Proxy: <xmx:cfFBYxsI48Sov3NR-gp5drLCff_nZuCHKFAQdzaDRlKGB210eLFWHg>
    <xmx:cfFBY9d5Gu15babKmNiepFosyt9_EKGJ-inu32GcD6GhZn2nBAnj4A>
    <xmx:cfFBY92m1wK25Id9LYFrIKUi3VktkCAOIP9uRM8ZZVX-fTJjMbbOzg>
    <xmx:cfFBY-pK9ONcR3706Zomg21ZpUnMZipIONN1CUQ_AeL7bSagqtMRWA>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 8 Oct 2022 17:53:52 -0400 (EDT)
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     skhan@linuxfoundation.org, kieran.bingham@ideasonboard.com,
        linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>
Subject: [PATCH] media: vimc: Update device configuration in the documentation
Date:   Sun,  9 Oct 2022 00:53:46 +0300
Message-Id: <20221008215346.172559-1-dafna@fastmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since commit 9b4a9b31b9ae ("media: vimc: Enable set resolution at the scaler src pad")
the configuration in the documentation does
not work. Replace it with the configuration
described in commit 9b4a9b31b9ae

Signed-off-by: Dafna Hirschfeld <dafna@fastmail.com>
---
 Documentation/admin-guide/media/vimc.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/media/vimc.rst b/Documentation/admin-guide/media/vimc.rst
index 3b4d2b36b4f3..29d843a8ddb1 100644
--- a/Documentation/admin-guide/media/vimc.rst
+++ b/Documentation/admin-guide/media/vimc.rst
@@ -35,11 +35,11 @@ of commands fits for the default topology:
 
         media-ctl -d platform:vimc -V '"Sensor A":0[fmt:SBGGR8_1X8/640x480]'
         media-ctl -d platform:vimc -V '"Debayer A":0[fmt:SBGGR8_1X8/640x480]'
-        media-ctl -d platform:vimc -V '"Sensor B":0[fmt:SBGGR8_1X8/640x480]'
-        media-ctl -d platform:vimc -V '"Debayer B":0[fmt:SBGGR8_1X8/640x480]'
-        v4l2-ctl -z platform:vimc -d "RGB/YUV Capture" -v width=1920,height=1440
+        media-ctl -d platform:vimc -V '"Scaler":0[fmt:RGB888_1X24/640x480]'
+        media-ctl -d platform:vimc -V '"Scaler":0[crop:(100,50)/400x150]'
+        media-ctl -d platform:vimc -V '"Scaler":1[fmt:RGB888_1X24/300x700]'
+        v4l2-ctl -z platform:vimc -d "RGB/YUV Capture" -v width=300,height=700
         v4l2-ctl -z platform:vimc -d "Raw Capture 0" -v pixelformat=BA81
-        v4l2-ctl -z platform:vimc -d "Raw Capture 1" -v pixelformat=BA81
 
 Subdevices
 ----------
-- 
2.25.1

