Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9003244119F
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 01:11:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230487AbhKAAOK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 31 Oct 2021 20:14:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230484AbhKAAOK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 31 Oct 2021 20:14:10 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FBEEC061714
        for <linux-media@vger.kernel.org>; Sun, 31 Oct 2021 17:11:37 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id y84-20020a1c7d57000000b00330cb84834fso6757965wmc.2
        for <linux-media@vger.kernel.org>; Sun, 31 Oct 2021 17:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1n8iLSsdmHQDyOZdyj1jMWnsuvmlHh+nf2NgpfdMpFQ=;
        b=jjIjDT4bY1IJMusL1TwjDnNxj5Rt420BzP+tm3mOfSKNq5GFYrxTkRjML6/JBalitH
         YbE59cX7zY9Yl8od9WEz5kkKTg6xXpPVSeY2p6GjaNZEqsTwS00V6ELa0S22D4lcPn24
         Ua5AesYeiqiHxMCBY4UnCztDXtTkqL2qB2dtuUfrp9m5zjc71Og4YFK+vg+o5lvBqbBD
         S7NGFmiuQJn+MGYf3erXJAW0FK/U8Wt8UkG3hoxhmgOlfZXOmRjpLydt9djRKIyVCEeH
         YniOOSOQI0I/cyyE8qEAU98BmgbX1sBM2VgwicRp3rW6IYTRcdhSFxq9HnotA6FY4kRt
         Vn+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1n8iLSsdmHQDyOZdyj1jMWnsuvmlHh+nf2NgpfdMpFQ=;
        b=NAhyCDQ3GTeCK91vwiGlWcrAAxgQ1Qqwy07aN8Z5OQ/GBrY8eMVxJxMsLwt3+yIDQ6
         pTCR7FCnC1wVtBIJB/z8eGGdX//eIZFUXxw25KPjiWtA7e2eRFDA/UedCgCzLymIf0Ym
         Z1AG63Iz2hX15oMDzkYmvh7mQGGWNOy1aLElnAqYKjW/M40k4hO//sjmjsheix0WhlY3
         uNYOmwcUtl9r4LkQoPxIlSgkJ4R8faj0fl62gxN9J1c89J/xSyKjwqhEYxpZWdHq7vWJ
         ViPhnVj3hBwhxWoimqzvR0VAt0fK/IGlO0y9vwipjjTYExyJkviD9piOcEBhmqvkzqqT
         oUjg==
X-Gm-Message-State: AOAM530aOMvqpGl9VAdvZkcZyJqSBhpqcjMX7r9YDuFvnN+wECLbXlKi
        IizMChREitbBFSzuLFryzlk=
X-Google-Smtp-Source: ABdhPJxvW8IN3wx5HUrrAiT92UebrIdh4pKwuskJQ8Db4z8pPcA48LeuvzqwofQbZ3vJ8IzWXzbGfw==
X-Received: by 2002:a1c:a984:: with SMTP id s126mr35913770wme.156.1635725496293;
        Sun, 31 Oct 2021 17:11:36 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id k6sm12557678wri.83.2021.10.31.17.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 17:11:35 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Daniel Scally <djrscally@gmail.com>,
        linux-media@vger.kernel.org
Cc:     Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v4 12/16] media: i2c: Switch exposure control unit to lines
Date:   Mon,  1 Nov 2021 00:11:15 +0000
Message-Id: <20211101001119.46056-13-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101001119.46056-1-djrscally@gmail.com>
References: <20211101001119.46056-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ov8865 driver currently has the unit of the V4L2_CID_EXPOSURE control
as 1/16th of a line. This is what the sensor expects, but isn't very
intuitive. Switch the control to be in units of a line and simply do the
16x multiplication before passing the value to the sensor.

The datasheet for this sensor gives minimum exposure as 2 lines, so take
the opportunity to correct the lower bounds of the control.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
 drivers/media/i2c/ov8865.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index dfb5095ef16b..5f19d82554df 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -2125,6 +2125,9 @@ static int ov8865_exposure_configure(struct ov8865_sensor *sensor, u32 exposure)
 {
 	int ret;
 
+	/* The sensor stores exposure in units of 1/16th of a line */
+	exposure *= 16;
+
 	ret = ov8865_write(sensor, OV8865_EXPOSURE_CTRL_HH_REG,
 			   OV8865_EXPOSURE_CTRL_HH(exposure));
 	if (ret)
@@ -2525,8 +2528,8 @@ static int ov8865_ctrls_init(struct ov8865_sensor *sensor)
 
 	/* Exposure */
 
-	ctrls->exposure = v4l2_ctrl_new_std(handler, ops, V4L2_CID_EXPOSURE, 16,
-					    1048575, 16, 512);
+	ctrls->exposure = v4l2_ctrl_new_std(handler, ops, V4L2_CID_EXPOSURE, 2,
+					    65535, 1, 32);
 
 	/* Gain */
 
-- 
2.25.1

