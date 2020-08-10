Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FC6C2401A4
	for <lists+linux-media@lfdr.de>; Mon, 10 Aug 2020 07:07:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725849AbgHJFHu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Aug 2020 01:07:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725763AbgHJFHu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Aug 2020 01:07:50 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBA71C061756;
        Sun,  9 Aug 2020 22:07:49 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id c12so5891897qtn.9;
        Sun, 09 Aug 2020 22:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aPHXTL52nZ8TnYruo+TUHBbc33RfRH/y9aR6NOzaRVo=;
        b=UxHPO6Ru8IFAHFgMeMWp54jGqzTiCihLYmV0zJhgBUaAyfmPsEx2LJAwXw2fLA0KG5
         D6OBIvkJn0g+qtixsVSWnsCjzrD17UtQ2vDuWxkusNN8VNYdgH97X2zs0vSgRxY+vWw3
         tMSsgwW2UHXCGWh/Puol387O+IctIO//VkkPqRZO3JICdKshwUwWUnmnANxLqsyLekQl
         gsknh7pR3vmTc8F3jfQ9r6mVvmf23C+Y5fCPZpE1CshJsxvNrp7uScL24EwAEc7WWBFI
         yePF2V597Y8LZKSPYmP+DUJIFgT+djJL7a+ax7YwAIu6SUfPHDI05nrBN57WQE4Wgw8h
         KNzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aPHXTL52nZ8TnYruo+TUHBbc33RfRH/y9aR6NOzaRVo=;
        b=Iru/vfuF21vxDMS2u2lBNwWmQjA9iZ8oQOC+FAhHuaff+/ep5SDgx9kE24X89dmcqv
         rjJEcfJd4BkEeSP0ulA6upi/1gucCBnYmu5/KpaclYXb0tHIw/Im65ISdrMNEdX+bXQU
         NvEquE/cBRLh2Mjv5EBxfbHClib7OwIk272zUrpnU5MXnyTverpemQohr0cC2WsKuJPg
         LY81iQ1x9MR23QWLV7ns5H0sNViOnuEdrh29lPt/fUd8LqGNfyD9s8vmy2HSPqtEa3ej
         bQ55unWDiNPZAdbLXSo+famSwZB2H3Mr9Ma0QipsTJFttL8bmGN7GCJL/al0EXIrgc5X
         mKXA==
X-Gm-Message-State: AOAM531BzRwh0L5e6X+h9oX7UqJoOtFv+orLI3oVOKLNS41O8g5wL933
        Sjl3U6hxUUKbz+xuYAOmug==
X-Google-Smtp-Source: ABdhPJxeZ9jmhF6jSAkll2vnf9FoWW3KrIT9DdSlTQiwoFC7RC0e4phvSPS3a0ljAS4WeWvC0RiN9A==
X-Received: by 2002:ac8:1382:: with SMTP id h2mr25882364qtj.228.1597036068667;
        Sun, 09 Aug 2020 22:07:48 -0700 (PDT)
Received: from localhost.localdomain (146-115-88-66.s3894.c3-0.sbo-ubr1.sbo.ma.cable.rcncustomer.com. [146.115.88.66])
        by smtp.gmail.com with ESMTPSA id w20sm13125325qki.108.2020.08.09.22.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2020 22:07:48 -0700 (PDT)
From:   Peilin Ye <yepeilin.cs@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Peilin Ye <yepeilin.cs@gmail.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH] v4l2-tpg: Fix global-out-of-bounds read in precalculate_color()
Date:   Mon, 10 Aug 2020 01:05:32 -0400
Message-Id: <20200810050532.640075-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

precalculate_color() is reading out of `sin` since `tpg->hue` is not being
properly checked. Fix it. `cos` is safe, as long as `tpg->hue` is higher
than or equal to -192.

Fixes: 63881df94d3e ("[media] vivid: add the Test Pattern Generator")
Reported-and-tested-by: syzbot+02d9172bf4c43104cd70@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?id=db50123c788e2cc5a9d90de569c398b66293ee48
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
 drivers/media/common/v4l2-tpg/v4l2-tpg-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c b/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
index 50f1e0b28b25..52205fe096f7 100644
--- a/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
+++ b/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
@@ -930,6 +930,9 @@ static void precalculate_color(struct tpg_data *tpg, int k)
 		/* Implement these operations */
 		int tmp_cb, tmp_cr;
 
+		if (tpg->hue < -128 || tpg->hue > 128)
+			return;
+
 		/* First convert to YCbCr */
 
 		color_to_ycbcr(tpg, r, g, b, &y, &cb, &cr);
-- 
2.25.1

