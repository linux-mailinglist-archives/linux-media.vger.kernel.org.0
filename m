Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D6C82637C9
	for <lists+linux-media@lfdr.de>; Wed,  9 Sep 2020 22:48:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727075AbgIIUsn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Sep 2020 16:48:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726440AbgIIUsm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Sep 2020 16:48:42 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CA63C061573;
        Wed,  9 Sep 2020 13:48:41 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id g4so4383702wrs.5;
        Wed, 09 Sep 2020 13:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=msyTyBuqg+S9lSfyJBnZ2ellRZt6dmdc0yChx+UPxKo=;
        b=koV/+i57bGxaeWzcaR3ot72iqyXmIiat5L82lel4bkbFuylPHtkYD/RyZwOy8nHAfn
         E/ess/ZvcMgSwczW+yo3TBTUZNicVuzKtLp05CBwoHOo26gi1+SIW96AklvRX+0TeaVT
         slR0PB8woP9gDL4LqFubK5Hl+RNqE0CWnky1JJMilUg8hkh4w6pBh2xBUycFJ0uE2cr+
         i3W3j/fywmoareT5PKXr1dycWj7fFWqh88hXhygfiBLAhDkVxKEXSEn20+Hq+tjlM3PI
         vH1sasf1KXgZuKIX1Vl1Cqno6BYsaEDMEwfdA2/NhswquDG0MPGmS4Jpc8y6s8JXyepn
         6JuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=msyTyBuqg+S9lSfyJBnZ2ellRZt6dmdc0yChx+UPxKo=;
        b=tY//74sls6ZTv55H8NcG4Uuos4wGb9v5EV/4qr4HFiRfrJUzk2fZRAFRSja1imaU/U
         5S7IqJA0+8/+qv0b7F/pxdqh6kPxWFpR3Ny1KqJBrvnkNfpXuO7QsiRYslwrZrXik+Vq
         qBVO9BWMMl86nXhdKnkL4szDvegkJokL1CgwQBqEr7kCVz658jaJXHFhfZJu54wCXt5F
         BYsEAO1eouLm+XcT9HkdjAb0R/Fj9C/qEfT6eGdbfHepjXLpEAvwoQVsdA4Myh2uytP3
         x36+4p9aFbveg1XVWAocXbuJRqCGJyhVLLc0cAg8WF+hCsSp3ooOz8ZO4gAXBFUMAOft
         l9BA==
X-Gm-Message-State: AOAM531wMitRCu9WGkxt/A/IneB6qaPxJjIM3JwvHkzmQB19NE1lOLK7
        88pkvkLqOfqUIwoR4rH6DVc=
X-Google-Smtp-Source: ABdhPJzqMJb3CpQd6FD2aRtPqLCg50OLeNOC9diM0ZequY6MDGcUMHsvN30FytEWsWjy1JFN7Lyvvg==
X-Received: by 2002:a5d:4152:: with SMTP id c18mr5963823wrq.277.1599684520297;
        Wed, 09 Sep 2020 13:48:40 -0700 (PDT)
Received: from localhost.localdomain (cpc83661-brig20-2-0-cust443.3-3.cable.virginm.net. [82.28.105.188])
        by smtp.gmail.com with ESMTPSA id 189sm427103wmb.3.2020.09.09.13.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 13:48:39 -0700 (PDT)
From:   Alex Dewar <alex.dewar90@gmail.com>
Cc:     Alex Dewar <alex.dewar90@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] staging: media: atomisp: Don't do unnecessary zeroing of memory
Date:   Wed,  9 Sep 2020 21:48:00 +0100
Message-Id: <20200909204807.36501-1-alex.dewar90@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In a few places in pci/sh_css_params.c, memset is used to zero memory
immediately before it is freed. As none of these structs appear to
contain sensitive information, just remove the calls to memset.

Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css_params.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index 2c67c23b3700..24fc497bd491 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -4378,7 +4378,6 @@ ia_css_3a_statistics_free(struct ia_css_3a_statistics *me)
 	if (me) {
 		kvfree(me->rgby_data);
 		kvfree(me->data);
-		memset(me, 0, sizeof(struct ia_css_3a_statistics));
 		kvfree(me);
 	}
 }
@@ -4417,7 +4416,6 @@ ia_css_dvs_statistics_free(struct ia_css_dvs_statistics *me)
 	if (me) {
 		kvfree(me->hor_proj);
 		kvfree(me->ver_proj);
-		memset(me, 0, sizeof(struct ia_css_dvs_statistics));
 		kvfree(me);
 	}
 }
@@ -4459,7 +4457,6 @@ ia_css_dvs_coefficients_free(struct ia_css_dvs_coefficients *me)
 	if (me) {
 		kvfree(me->hor_coefs);
 		kvfree(me->ver_coefs);
-		memset(me, 0, sizeof(struct ia_css_dvs_coefficients));
 		kvfree(me);
 	}
 }
@@ -4551,7 +4548,6 @@ ia_css_dvs2_statistics_free(struct ia_css_dvs2_statistics *me)
 		kvfree(me->ver_prod.odd_imag);
 		kvfree(me->ver_prod.even_real);
 		kvfree(me->ver_prod.even_imag);
-		memset(me, 0, sizeof(struct ia_css_dvs2_statistics));
 		kvfree(me);
 	}
 }
@@ -4635,7 +4631,6 @@ ia_css_dvs2_coefficients_free(struct ia_css_dvs2_coefficients *me)
 		kvfree(me->ver_coefs.odd_imag);
 		kvfree(me->ver_coefs.even_real);
 		kvfree(me->ver_coefs.even_imag);
-		memset(me, 0, sizeof(struct ia_css_dvs2_coefficients));
 		kvfree(me);
 	}
 }
@@ -4710,7 +4705,6 @@ ia_css_dvs2_6axis_config_free(struct ia_css_dvs_6axis_config *dvs_6axis_config)
 		kvfree(dvs_6axis_config->ycoords_y);
 		kvfree(dvs_6axis_config->xcoords_uv);
 		kvfree(dvs_6axis_config->ycoords_uv);
-		memset(dvs_6axis_config, 0, sizeof(struct ia_css_dvs_6axis_config));
 		kvfree(dvs_6axis_config);
 	}
 }
-- 
2.28.0

