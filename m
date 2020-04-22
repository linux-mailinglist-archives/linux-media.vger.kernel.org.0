Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BF1B1B33FD
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2020 02:37:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726359AbgDVAhl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Apr 2020 20:37:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726012AbgDVAhl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Apr 2020 20:37:41 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16948C0610D5
        for <linux-media@vger.kernel.org>; Tue, 21 Apr 2020 17:37:41 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id r4so218583pgg.4
        for <linux-media@vger.kernel.org>; Tue, 21 Apr 2020 17:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=5PoFrS16GeUJcA8IoSCQPJL46iqD0Bx67xO3NpMV9Ms=;
        b=rKUHj8CSntW3SAbVdEHIMPBJmbb7lKiL79vRAjwEg498Px/pCPZwDaw7GiQvvOHdL+
         aDYQ03TK4JwCTRiDXMqbYHp/JekwrwKlxK6mk0/dDgMHuUz6YK2cd1Jz0Fb9JT+2HNVE
         c1Wy78a+cHrqovFAjuOU+TQFTQBj55WrwSYV7ivBq8pG9IoY28mWbMJrwX+tSEQ2h19Y
         3sC1MYiUrpo8icpoJwZDP+blyBOoYBVpI0nKJj196y8Bi1CM9HbO4QT+b3qip6iX0NKa
         lmPP4kpoczmxyF4WJ5NWSY1rn/dijdDDnzORbTwIbZnfIW4M1HFV0/CTu7e1iuvmprnR
         rREQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5PoFrS16GeUJcA8IoSCQPJL46iqD0Bx67xO3NpMV9Ms=;
        b=Pi2eufxRwz+9p9VLNKb5b81bAZPwI4QRaW52b5dBavG/106p+dnMETOQnI0tqVyDW9
         oPgLKbicFjoTAQpgTdHEr54HORtcak7SWRZLIm7j8FbVN0GCZ1lAvNoyhIr1drdABkMs
         1/444ISkQFOLu0Z92RQTIuvcbrt66CHBjYcXloRLdvTTlLgSegRPjInVq68dOeV6t/5z
         WgBr7Xg/U6XyRfVO6abTJHSUTRKCeBOBQkItaVPslnpM7KFsTcaiiuV6NkQ51aFAMQxD
         7CSfC6FJeSERKF20IPM4UPSPTm9aYsZ2zX82A13oX5RINMZ7Q0tmKXWZJyUfPKREjnxS
         6Jig==
X-Gm-Message-State: AGi0PuZashVKcedWw7h8ebdzXa78oBEmhuBdLylwrx+ieOjn8zHwrHvZ
        Fyq6UQt3sUV5P6NSbDDAGs0oPOG5
X-Google-Smtp-Source: APiQypK+H9mDKpWWzO84qW80AOWNO0EDtsCLeNFRphdHfZB2YQAyKjp+WmzbaJTB2jxj1647X+4thQ==
X-Received: by 2002:a63:1a1e:: with SMTP id a30mr23153562pga.368.1587515860326;
        Tue, 21 Apr 2020 17:37:40 -0700 (PDT)
Received: from localhost.localdomain (76-14-109-232.rk.wavecable.com. [76.14.109.232])
        by smtp.gmail.com with ESMTPSA id y16sm1359676pfp.45.2020.04.21.17.37.39
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 17:37:39 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 03/12] utils: fix float equal warning
Date:   Tue, 21 Apr 2020 17:37:26 -0700
Message-Id: <20200422003735.3891-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200422003735.3891-1-rosenp@gmail.com>
References: <20200422003735.3891-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Found with -Wfloat-equal

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/v4l2-ctl/v4l2-ctl-streaming.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
index 663d0254..066a336a 100644
--- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
@@ -154,7 +154,7 @@ void fps_timestamps::determine_field(int fd, unsigned type)
 
 bool fps_timestamps::add_ts(double ts_secs, unsigned sequence, unsigned field)
 {
-	if (ts_secs == 0) {
+	if (ts_secs <= 0) {
 		struct timespec ts_cur;
 
 		clock_gettime(CLOCK_MONOTONIC, &ts_cur);
-- 
2.25.2

