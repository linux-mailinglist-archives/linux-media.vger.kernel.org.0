Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6364D4738B5
	for <lists+linux-media@lfdr.de>; Tue, 14 Dec 2021 00:43:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244266AbhLMXnJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Dec 2021 18:43:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244259AbhLMXnI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Dec 2021 18:43:08 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB5E8C06173F
        for <linux-media@vger.kernel.org>; Mon, 13 Dec 2021 15:43:07 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id 137so13092988wma.1
        for <linux-media@vger.kernel.org>; Mon, 13 Dec 2021 15:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=dldKQiAsH5NhCbn3AHqG5fc9Jd8QHr7SEGOiBRpzv+Y=;
        b=pZ9KPL7IqYcROTksOwvAgfewPToD7EMRIqXr835W6zFQPD30D1R+eiAxHiH2C0AV+k
         O/jzD4c2UM+/VS2UgYRfU8PHbOkkougFUpPN5BLFJVKWfN5DB/OvWkTD6TcDrKB4T99g
         eAoHwuZYH+8+bD2LfqAPAhea9yTULRfWU5YE76zgiXOtPw6Uhns62pwwzin+9wIuoBdV
         wruZ2UqFMVqbKDPFXk8hjZ6how6iJmoGH6FkA1wr6AGARhaiMwcKBMplIz1snK1Cf58c
         b8rfxLkIsm5leF1n6N/L7NgJHF8+6COgbkBxWBvktd4WSWjJZqmxfpH6br5lYZU5XYW4
         tIOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dldKQiAsH5NhCbn3AHqG5fc9Jd8QHr7SEGOiBRpzv+Y=;
        b=yi6vryjWyvyUG1gowpU3RpXXTWbcLZoY4bBvHT0dDwfwAgChr+hZLUy5vQQlY06rzP
         hQwIB+2zf4Pj34rJUPjgh0/IKTDpgldDQ2P7XEbdRCgqlrOh121eBVrcM5K7hCb55yCW
         4kP20MBPTaZEjorEairGIr9TOHX+zItiBJvLHuYEuenOcPHA8TXSxYy5SCn3tgJ0SlIG
         KMqJ5DoCbM0zvD4RdW0Yel9zCdYoh/czgYRwdVVuLVKIcujnWS73+J4TJho3+GE2Tdfr
         55EjvDyL2AHwHxzbGLmUCJ84QiZgj3S5IoEczWStTOFWT/SbvjUFQTxmz7PtSOchELiB
         Or9g==
X-Gm-Message-State: AOAM530RKkaEcWIQYjT9XvbzvoW4ZISOfR1j6Rv+oPHfHqyO+WRJwf7x
        IyJXBMPMuQZDsSmC8TTBDuEjtyG44r0=
X-Google-Smtp-Source: ABdhPJy2LnEcI1vRObLzd2Ox+j1fAU3ORgLZZCDFOKQKrUaY/p43xYEdBlgID5GEvB8b3lupNdf8Uw==
X-Received: by 2002:a1c:4d13:: with SMTP id o19mr2368799wmh.164.1639438986435;
        Mon, 13 Dec 2021 15:43:06 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id p19sm435516wmq.4.2021.12.13.15.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 15:43:06 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [v4l-utils 1/3] v4l-utils: Add MEDIA_LNK_FL_ANCILLARY_LINK macro
Date:   Mon, 13 Dec 2021 23:42:56 +0000
Message-Id: <20211213234258.41411-2-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211213234258.41411-1-djrscally@gmail.com>
References: <20211213234258.41411-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a macro to describe the new type of media link in the kernel.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
 include/linux/media.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/media.h b/include/linux/media.h
index 17432318..e3123d1a 100644
--- a/include/linux/media.h
+++ b/include/linux/media.h
@@ -222,6 +222,7 @@ struct media_pad_desc {
 #define MEDIA_LNK_FL_LINK_TYPE			(0xf << 28)
 #  define MEDIA_LNK_FL_DATA_LINK		(0 << 28)
 #  define MEDIA_LNK_FL_INTERFACE_LINK		(1 << 28)
+#  define MEDIA_LNK_FL_ANCILLARY_LINK		(2 << 28)
 
 struct media_link_desc {
 	struct media_pad_desc source;
-- 
2.25.1

