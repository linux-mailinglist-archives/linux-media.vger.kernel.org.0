Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 751F0483657
	for <lists+linux-media@lfdr.de>; Mon,  3 Jan 2022 18:41:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233537AbiACRlT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jan 2022 12:41:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233427AbiACRlS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jan 2022 12:41:18 -0500
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB414C061761;
        Mon,  3 Jan 2022 09:41:17 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id s73so55960135oie.5;
        Mon, 03 Jan 2022 09:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PX+r/4GPJoULnjzCN3QguRNvA76vq0GHYjHcEMnDNHk=;
        b=QBo8FGPIErTnDaPOUO+V1UZUpJmBN53itHS+ssQgzOvdbuVVhdiyFARdcyeXo/lNXk
         FsBuO7Xa5qG1lzoeu6E6NSsGrc0GKKLyVN3BUAw6Fx1todd+8EEcXH9ZCxOc5F63c9KU
         GNGb6SgzpoUivRh3RuufBcjEI17yqA7sLo5x8fDmpzma1isfHjID4qbqZOaO+2x6Ddl2
         rSLjF1m4/LfZ/OJsXQCd7SHO2klLD4MGu16fA/EoHCfijEpSoDbR9nGFGZR1Qd3ywzU1
         /cBbukM6edQ4rFOSXyoYrSD8/DV8q80HTQhV6phUTZzMfMKMaHr7UD8uLQ4WkoW+bBYC
         0iOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PX+r/4GPJoULnjzCN3QguRNvA76vq0GHYjHcEMnDNHk=;
        b=3hc2Lvdr7IzEN6JUnp18ZR/7UUZOVdmAQ0HQsRFH8suO0dCfpCUKDkSp1T/a6/Nj99
         VERPsGMi5wZ1ZijDsllsADBuwPeFwoIxRH2BDWVt4RHVR0UJbJAQMi1ufvVscgRSt/kT
         B8f7HjQ+KnIJp+JlGU0y8HCiDK3gaVjrIpFbRf3Fzc/TokJepkK35zpQ1JzZGV8bWdbP
         MwJuvoJQz/DXiiRt0jYbdmqcRIEACgBI3D/a8CAGUQXCmgL1VrhvNVxuNHmcwwshR//G
         wz69zWmVdekTtgxXe5UqhMQNPrJhw/PkM3Ctdm5vYuqOsXpzpxdBD8FS94YNMZpEetiJ
         xP7Q==
X-Gm-Message-State: AOAM533F0AfXUVrta740ECPwY868MLG4V5PHbJF5+vUYh7eNuB3zq7I7
        K5Q7u3ve6REcv9ornBzzVFfgV5IURTk=
X-Google-Smtp-Source: ABdhPJwvw6H+cCKImuwiy6SfQz3ArlRSXHygzeGhqXXrh+/vi/d0nJ/jRgUGZ2x8fh5iIJfMbwmkAQ==
X-Received: by 2002:aca:44c5:: with SMTP id r188mr38082488oia.177.1641231676809;
        Mon, 03 Jan 2022 09:41:16 -0800 (PST)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com. [76.183.134.35])
        by smtp.gmail.com with ESMTPSA id s6sm9368864ois.3.2022.01.03.09.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 09:41:16 -0800 (PST)
From:   Chris Morgan <macroalpha82@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     devicetree@vger.kernel.org, thierry.reding@gmail.com,
        sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, mchehab@kernel.org, emma@anholt.net,
        mripard@kernel.org, linux-media@vger.kernel.org,
        Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 5/5] drm/vc4: dpi: Support DPI interface in mode3 for RGB565
Date:   Mon,  3 Jan 2022 11:41:06 -0600
Message-Id: <20220103174106.907-6-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220103174106.907-1-macroalpha82@gmail.com>
References: <20220103174106.907-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the VC4 DPI driver to utilize DPI mode 3. This is
defined here as xxxRRRRRxxGGGGGGxxxBBBBB:

https://www.raspberrypi.com/documentation/computers/raspberry-pi.html#parallel-display-interface-dpi

This mode is required to use the Geekworm MZP280 DPI display.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/gpu/drm/vc4/vc4_dpi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index c180eb60bee8..3c58ade2549e 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -173,6 +173,10 @@ static void vc4_dpi_encoder_enable(struct drm_encoder *encoder)
 			dpi_c |= VC4_SET_FIELD(DPI_FORMAT_16BIT_565_RGB_3,
 					       DPI_FORMAT);
 			break;
+		case MEDIA_BUS_FMT_RGB565_1X24_CPADHI:
+			dpi_c |= VC4_SET_FIELD(DPI_FORMAT_16BIT_565_RGB_2,
+					       DPI_FORMAT);
+			break;
 		default:
 			DRM_ERROR("Unknown media bus format %d\n", bus_format);
 			break;
-- 
2.25.1

