Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2676244414
	for <lists+linux-media@lfdr.de>; Fri, 14 Aug 2020 06:03:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726151AbgHNEDm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Aug 2020 00:03:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725787AbgHNEDm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Aug 2020 00:03:42 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52639C061757
        for <linux-media@vger.kernel.org>; Thu, 13 Aug 2020 21:03:42 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id x25so3927828pff.4
        for <linux-media@vger.kernel.org>; Thu, 13 Aug 2020 21:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zOBQDJ9xl341pTXD7Smxbfk4in9KY3X0zaEyUxaJ9qg=;
        b=RaUG6WJ/LSc39iBYmTuEdJtwQm31viHAd5dsVGeekaRlvaqspNoT79oDQENUVy/Dhl
         in0tCMNgA4UAAXuGQTMDQbvvSJJVGmu+SAo1+KR2exDkGm0tlYt9zZ/JrwTiDNCTEjY8
         Mm0IadiEBBNe6EiCRWs+Vn4nuZwxnC8ytH19p19+YzBDgTpYegEh6o60thiF5nA6nc4v
         1u7zfxft3h9cxLQ6KmCUe2gnwFYJJZRmesc3m4BOSlALbCFiFZOBNKL/+RGSfJXTVwT4
         iCzEzG51FyLfshKbQ6UvcqWjCV0K5F4AnlOT5MRKmWCtI9f0FbOv9uGXh3tjLZ792fES
         DHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zOBQDJ9xl341pTXD7Smxbfk4in9KY3X0zaEyUxaJ9qg=;
        b=So7QHoSGvAHafcPtnUAw+SM0EkitW/l9qarKYk91vqdnAIK7PTLhy1eJcd0Cp1BFsA
         B3XkM0FfLi8uONc13GIUsInGa/3jwO8pC1leihSZGJ+7HqPP7BhpZ1Gldjo7mxw+JtqK
         tTOT3kRpRWMcbynVNrHLAGp/Zfmm9amacfriR6aOBRBeaCf18dPd2LqnGMYZ+8o+NdAm
         X+ML0BWyYaAT/aYn3cHGcXddqhiIcosXMVR5gRSILNUJ8TprQRC+wgsHNmRC+KzpRqiW
         mPdN5pdLkT8BVVwegfSmEaza88hzTKUbA8TWXY+1SGqACb9+dCIiY6jiTAjAjAnzD80f
         P8vw==
X-Gm-Message-State: AOAM530V7oPgHLeBNux+fwMYLRhdL4WE8qDiy0Ko93ei82XLADnEgM0P
        SgOvmwlkGKZ2X5Wy0d5WUeK9c8OXNFo=
X-Google-Smtp-Source: ABdhPJwM0Kfk3+tFDip5Hb6NyHJG5vZVrbemkNuvnBHpLXToa36i21qIKFnUww7RuhBuqMaYnl0P0w==
X-Received: by 2002:a62:1d1:: with SMTP id 200mr448269pfb.161.1597377821664;
        Thu, 13 Aug 2020 21:03:41 -0700 (PDT)
Received: from mangix-trapnet.lan ([2001:470:1f05:79e::a89])
        by smtp.gmail.com with ESMTPSA id a24sm7371597pfg.113.2020.08.13.21.03.40
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 21:03:40 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH] fix mismatching declaration
Date:   Thu, 13 Aug 2020 21:03:40 -0700
Message-Id: <20200814040340.218452-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When compiling with GCC 10 and meson, it errors on this function as it
is declared with V4LCONTROL_COUNT later on.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 lib/libv4lconvert/control/libv4lcontrol.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/libv4lconvert/control/libv4lcontrol.c b/lib/libv4lconvert/control/libv4lcontrol.c
index 0b0a346e4..7296de1d0 100644
--- a/lib/libv4lconvert/control/libv4lcontrol.c
+++ b/lib/libv4lconvert/control/libv4lcontrol.c
@@ -262,7 +262,7 @@ static const struct v4lcontrol_flags_info v4lcontrol_flags[] = {
 	{ 0x1046, 0x9967, 0,    NULL, NULL, V4LCONTROL_FORCE_TINYJPEG },
 };
 
-static const struct v4l2_queryctrl fake_controls[];
+static const struct v4l2_queryctrl fake_controls[V4LCONTROL_COUNT];
 
 static const char *asus_board_vendor[] = {
 	"ASUSTeK Computer Inc.",
-- 
2.26.2

