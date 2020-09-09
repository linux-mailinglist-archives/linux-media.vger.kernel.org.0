Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AD362636E4
	for <lists+linux-media@lfdr.de>; Wed,  9 Sep 2020 21:54:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726414AbgIITyN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Sep 2020 15:54:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725975AbgIITyL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Sep 2020 15:54:11 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46EDEC061573;
        Wed,  9 Sep 2020 12:54:09 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id t10so4263028wrv.1;
        Wed, 09 Sep 2020 12:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gePgmXiNRPCVJ7mr+8A/94pjRWAsRsYeShr8lQ1UsyY=;
        b=tI0b1b8FnXwzjGlrjKqZgjkGXTrYiNy9g7Nt08zfZAo0Ua3JhotY+JPzQXWqr5/19e
         pr+lNZd6acc1pzfoQi3xMdjy+5HWodUMwuJAa3NtE5pbefCCQsrwVD4Sc6GBXgr/Y9to
         oTuZRdh55ZxIWv6CQfwqUGdZy630v+jNOgd6uA4Dff3eXRTwRS+3WJwT41z1Js92Xn5r
         xW6qh3tJg7qf/u+W+I4YnJQEq7BSJGt12EcAtEM9OhVQbT0q56y7cQaX7GQhkWfo4bON
         x36nLxP6SlSvHR8XoP8OID81QTELHJatCd1zfs2JadPr3uR9UIBGnTsqtACfvXlgrSuX
         A+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gePgmXiNRPCVJ7mr+8A/94pjRWAsRsYeShr8lQ1UsyY=;
        b=YRfR8CEtlSMoTo3dfEkwYxb8QYq3Tvsrc5AqCAl+lR1zhFdNfpgGm40pSXidH5Ia8o
         l2RWn+pc7wkCVrQ4XolQJPehH9amlBlC3fSbUtOphet7an5HsPRTDBizRnbjdEdpj+Qo
         M+srcR45++tSyP2yiLHxFTVLu3f3ycGbg9aBJAyEeJxW21kjiXBLFnZ/Ay5VcOZQc6h2
         Keholq9U+nnAIGNadfaeoUkmRiFbSI+1leXouF2rnRVvDy5kY/2NIjOOzeYFYjCUzud5
         ZZsFAb4XTjujcQxnfyz83RnSgMzc7+R5SMPHY5DjJ/oGRDxKiEuSZ0qo9LdZyyJjD8N5
         8Q5w==
X-Gm-Message-State: AOAM530M+Kos3tY3fQfhJQWhvgjfnLnacRNnBTvaEcScdIrdUhFarj6R
        7yuy2FOEm+0d9FYaHnSnsZaOH9PqpuBWePjx
X-Google-Smtp-Source: ABdhPJyDYjFH86wdYbV1UuramIP8zVcuwm3IHRFWB8ood813vDAm/dfqJwqb+LH1zuL1Tf+4WiIVwA==
X-Received: by 2002:adf:f34f:: with SMTP id e15mr5223399wrp.387.1599681248462;
        Wed, 09 Sep 2020 12:54:08 -0700 (PDT)
Received: from localhost.localdomain (cpc83661-brig20-2-0-cust443.3-3.cable.virginm.net. [82.28.105.188])
        by smtp.gmail.com with ESMTPSA id q18sm5715431wre.78.2020.09.09.12.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 12:54:07 -0700 (PDT)
From:   Alex Dewar <alex.dewar90@gmail.com>
Cc:     Alex Dewar <alex.dewar90@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] staging: media: atomisp: Use kvfree_sensitive in a few places
Date:   Wed,  9 Sep 2020 20:53:50 +0100
Message-Id: <20200909195403.225084-1-alex.dewar90@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In the file pci/sh_css_params.c, there are a number of places where
memset+kvfree is used, where kvfree_sensitive could be used instead. Fix
these occurrences.

Issue identified with Coccinelle.

Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>
---
 .../staging/media/atomisp/pci/sh_css_params.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index 2c67c23b3700..d1b5d6608d52 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -4378,8 +4378,7 @@ ia_css_3a_statistics_free(struct ia_css_3a_statistics *me)
 	if (me) {
 		kvfree(me->rgby_data);
 		kvfree(me->data);
-		memset(me, 0, sizeof(struct ia_css_3a_statistics));
-		kvfree(me);
+		kvfree_sensitive(me, sizeof(struct ia_css_3a_statistics));
 	}
 }
 
@@ -4417,8 +4416,7 @@ ia_css_dvs_statistics_free(struct ia_css_dvs_statistics *me)
 	if (me) {
 		kvfree(me->hor_proj);
 		kvfree(me->ver_proj);
-		memset(me, 0, sizeof(struct ia_css_dvs_statistics));
-		kvfree(me);
+		kvfree_sensitive(me, sizeof(struct ia_css_dvs_statistics));
 	}
 }
 
@@ -4459,8 +4457,7 @@ ia_css_dvs_coefficients_free(struct ia_css_dvs_coefficients *me)
 	if (me) {
 		kvfree(me->hor_coefs);
 		kvfree(me->ver_coefs);
-		memset(me, 0, sizeof(struct ia_css_dvs_coefficients));
-		kvfree(me);
+		kvfree_sensitive(me, sizeof(struct ia_css_dvs_coefficients));
 	}
 }
 
@@ -4551,8 +4548,7 @@ ia_css_dvs2_statistics_free(struct ia_css_dvs2_statistics *me)
 		kvfree(me->ver_prod.odd_imag);
 		kvfree(me->ver_prod.even_real);
 		kvfree(me->ver_prod.even_imag);
-		memset(me, 0, sizeof(struct ia_css_dvs2_statistics));
-		kvfree(me);
+		kvfree_sensitive(me, sizeof(struct ia_css_dvs2_statistics));
 	}
 }
 
@@ -4635,8 +4631,7 @@ ia_css_dvs2_coefficients_free(struct ia_css_dvs2_coefficients *me)
 		kvfree(me->ver_coefs.odd_imag);
 		kvfree(me->ver_coefs.even_real);
 		kvfree(me->ver_coefs.even_imag);
-		memset(me, 0, sizeof(struct ia_css_dvs2_coefficients));
-		kvfree(me);
+		kvfree_sensitive(me, sizeof(struct ia_css_dvs2_coefficients));
 	}
 }
 
@@ -4710,8 +4705,8 @@ ia_css_dvs2_6axis_config_free(struct ia_css_dvs_6axis_config *dvs_6axis_config)
 		kvfree(dvs_6axis_config->ycoords_y);
 		kvfree(dvs_6axis_config->xcoords_uv);
 		kvfree(dvs_6axis_config->ycoords_uv);
-		memset(dvs_6axis_config, 0, sizeof(struct ia_css_dvs_6axis_config));
-		kvfree(dvs_6axis_config);
+		kvfree_sensitive(dvs_6axis_config,
+				 sizeof(struct ia_css_dvs_6axis_config));
 	}
 }
 
-- 
2.28.0

