Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA76C35F44E
	for <lists+linux-media@lfdr.de>; Wed, 14 Apr 2021 14:54:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350972AbhDNMy2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Apr 2021 08:54:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351000AbhDNMyX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Apr 2021 08:54:23 -0400
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A429FC061574;
        Wed, 14 Apr 2021 05:54:01 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id h13so2570642qka.2;
        Wed, 14 Apr 2021 05:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=jlBCNsKvfBi7veyM4BL9NZbwtWHgYxGRX4dSVfblSNo=;
        b=fN+hxWgj8eADtHckIAH/XYZ20ZkcHUgU1+yAZgE+OGm2N/fNjOiEoJIq34+61XH/D4
         eOJD+z/oNqotFpnmZtqg19Z99TF3XL1L/QH9efTnQ1y8e2YmMHqKIQaWjD8XmCzpFcNO
         Pyg6rHgrjecDHNM3a3dLiE3IVEo8+H98ccPDUZCr2HAtdOcpd2HaQ20Q6zk2mfdPnoJM
         9qZZqpW6DJb4mWTmOV1cDc9mE4sYy3QsQNgFAgWSctUGMGoageKBvUDMaTAXTjiz/U7b
         38ugvwu7xDr5bQVNCIBLlm0NL+opyipJ8iH9eQ+SEt1BELiO40cdM2YL3fYdwVw11vd8
         UYEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=jlBCNsKvfBi7veyM4BL9NZbwtWHgYxGRX4dSVfblSNo=;
        b=GSTtb3L6lkbktTqwDkgrv3aVPIueWYEqV0RfAM2Kz02PeQY01XwRVCvWeqIOJe+Z6r
         ibwAS6goSjiY91YPHIIAhw2cNVI8rJ3oGrktEpXiQp8bzbwT3So5jOCsbgDLU1Q3hCQD
         dTlhE36fomoa2wUY3pV+ZyYZc9wFbQDq6/iPmx9hXn+qyPvIsAZzvUmBwNincn3UuDE7
         gPhSANcUmytwjZav7WWYeXRBBPj52KvefzV9t996jhBPQ5EebQWETR7cBOvGS4UfdaVw
         5ffwbxWHCrJ3ykcrhDJkKXUePN/5qMBfdXdcQB0IpVpiTSqOwSq4veGl0V+UAUSR2Fmf
         pM0Q==
X-Gm-Message-State: AOAM530R/daw5BatqwqOW702EL9ZzYP1bZRdnPHdndrHVvcc1nHPLfIm
        N+9ItI/hOIlSAkuq6DiuXAo=
X-Google-Smtp-Source: ABdhPJyIpRsaj7QJwaR7PwS3OIeRH8EVgZEPlm8/xomg8OoXYkF7JxrzqzZmH7vFYHgNi+7dqT/naQ==
X-Received: by 2002:a37:4389:: with SMTP id q131mr24259247qka.255.1618404840937;
        Wed, 14 Apr 2021 05:54:00 -0700 (PDT)
Received: from focaruja ([2001:1284:f016:a037:7038:c088:ae60:452d])
        by smtp.gmail.com with ESMTPSA id j129sm12197652qkf.110.2021.04.14.05.53.59
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Wed, 14 Apr 2021 05:54:00 -0700 (PDT)
Date:   Wed, 14 Apr 2021 09:53:57 -0300
From:   Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: [PATCH v2] staging: media: omap4iss: Remove unused macro function
Message-ID: <20210414125357.GA13767@focaruja>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove unused macro function "v4l2_dev_to_iss_device(dev)".

Signed-off-by: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
---
 drivers/staging/media/omap4iss/iss.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/media/omap4iss/iss.h b/drivers/staging/media/omap4iss/iss.h
index b88f952..3f587e0 100644
--- a/drivers/staging/media/omap4iss/iss.h
+++ b/drivers/staging/media/omap4iss/iss.h
@@ -119,9 +119,6 @@ struct iss_device {
 	unsigned int isp_subclk_resources;
 };
 
-#define v4l2_dev_to_iss_device(dev) \
-	container_of(dev, struct iss_device, v4l2_dev)
-
 int omap4iss_get_external_info(struct iss_pipeline *pipe,
 			       struct media_link *link);
 
-- 
2.7.4

