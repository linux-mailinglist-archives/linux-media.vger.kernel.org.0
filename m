Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6021D430A9D
	for <lists+linux-media@lfdr.de>; Sun, 17 Oct 2021 18:22:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344163AbhJQQYR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Oct 2021 12:24:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344141AbhJQQYQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Oct 2021 12:24:16 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B705C06161C;
        Sun, 17 Oct 2021 09:22:07 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id ls18so10602348pjb.3;
        Sun, 17 Oct 2021 09:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RDW1qPcMGAawLXHmgm47THBGVsh6BGW4tVw5OGbgQzw=;
        b=RA5UgqeMGTQqGE4ruXYKtsCSlgdXXh/ujrF1Ehe+txdjqx/bbKJ/u+TMmTnjO6V0/v
         o0zkRTPAh5VPRTLaG6VtYfUkxjkh8ARa5JVdAcyDGZ2Hmgblo7Kn6vlUCDZJSqar/fh1
         HTXgwpeGOrueE0iYcrJXtdUEuXxCmHL/Zr0VB/i0ZLVOxfhkrHHdigxjv5hE0iHVd2ah
         3Bc0XynN7qWoaEySzBwE8nT7G1ShRyE7ByJFCR1rRU4rOCZ4q/I/4a2cenQyMehEACWQ
         zISp/jcG2OrCLHgAM8tFazprO/mtqfZ93UL37qB0oqoLrdS0aNPXu+lbgVe2jehiOKil
         6l0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RDW1qPcMGAawLXHmgm47THBGVsh6BGW4tVw5OGbgQzw=;
        b=h8We9g9BZliOqrZximDUBYfappNN2P54xuAd8t2tVTD/4cIuV8wRGnB11l2T4rQO4r
         1bcTkHRwO942YZexnBQFkgjuQsG5RPclWhqoaKPMWM9DrvXueY7FgdZhHvKnCnh1UyIX
         BnPDsYhlLqhlkQhJrOPCZy94E1TZfVg+gC3g4eMthKn5BX9mXmEF7ou2FGn3MxjSCp0Z
         uvvPTM1v+sPGu6vTmE7fcRuNKqZwnFOTCx8KXfX8MECDjKlfmUaAgEjROrAsa/ICFgp8
         //ulfO7NP+/Flm+QTawReDUPS5zjUKy10zJDrcl5YVkf/1hw2xFseUprs8TKM50vllHh
         oICQ==
X-Gm-Message-State: AOAM530FEF9OkhbXViOq5Edx1YyaPpRUpLiF23naNkSxQNWyB1r1jb1b
        wGgGPMwmmhdicjR0ppJZrBA=
X-Google-Smtp-Source: ABdhPJzRqiG5mLXwiAbDEtxsYZI4Qydocucua6z0Dib7/APOAQWQZ0Rt8E7j7OA9PLn3LUQOwBsZMw==
X-Received: by 2002:a17:90b:e07:: with SMTP id ge7mr42525003pjb.75.1634487726433;
        Sun, 17 Oct 2021 09:22:06 -0700 (PDT)
Received: from sbwpb-arch.flets-east.jp ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id mu11sm5155444pjb.20.2021.10.17.09.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 09:22:06 -0700 (PDT)
From:   Tsuchiya Yuto <kitakar@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Alan <alan@linux.intel.com>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Deepak R Varma <drv@mailo.com>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 12/17] media: atomisp: pci: make fw ver irci_stable_candrpv_0415_20150521_0458 work - 5/5
Date:   Mon, 18 Oct 2021 01:19:52 +0900
Message-Id: <20211017161958.44351-13-kitakar@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211017161958.44351-1-kitakar@gmail.com>
References: <20211017161958.44351-1-kitakar@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is one of the patches which partially revert incompatible changes
in the current css version for ISP2401 (irci_ecr-master_20150911_0724)
back to irci_stable_candrpv_0415_20150521_0458.

Some `struct`s are `sizeof()`ed in sh_css_firmware.c file. So, I guess
issues will happen if these sizes are changed. Therefore, keep them the
same as css version irci_stable_candrpv_0415_20150521_0458 to make atomisp
work for firmware made for such css version since we don't have firmware
made for the current css version.

This patch removes the unnamed struct `shading` from
`struct sh_css_sp_pipeline` as well as its usage [1].

[1] added on updating css version to irci_master_20150701_0213
    https://raw.githubusercontent.com/intel/ProductionKernelQuilts/cht-m1stable-2016_ww31/uefi/cht-m1stable/patches/cam-0439-atomisp2-css2401-and-2401_legacy-irci_master_2015070.patch
    ("atomisp2: css2401 and 2401_legacy-irci_master_20150701_0213")

Signed-off-by: Tsuchiya Yuto <kitakar@gmail.com>
---
 .../media/atomisp/pci/sh_css_internal.h        |  8 --------
 drivers/staging/media/atomisp/pci/sh_css_sp.c  | 18 ------------------
 2 files changed, 26 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_internal.h b/drivers/staging/media/atomisp/pci/sh_css_internal.h
index 496faa7297a5..92fb7e67610c 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_internal.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_internal.h
@@ -551,14 +551,6 @@ struct sh_css_sp_pipeline {
 			u32	raw_bit_depth;
 		} raw;
 	} copy;
-
-/* ISP2401 */
-
-	/* Parameters passed to Shading Correction kernel. */
-	struct {
-		u32 internal_frame_origin_x_bqs_on_sctbl; /* Origin X (bqs) of internal frame on shading table */
-		u32 internal_frame_origin_y_bqs_on_sctbl; /* Origin Y (bqs) of internal frame on shading table */
-	} shading;
 };
 
 /*
diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/staging/media/atomisp/pci/sh_css_sp.c
index 13b15a5a33bc..fa74ac172f94 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
@@ -1308,24 +1308,6 @@ sh_css_sp_init_pipeline(struct ia_css_pipeline *me,
 	}
 #endif
 
-	if (IS_ISP2401) {
-		/* For the shading correction type 1 (the legacy shading table conversion in css is not used),
-		* the parameters are passed to the isp for the shading table centering.
-		*/
-		if (internal_frame_origin_bqs_on_sctbl &&
-		    params && params->shading_settings.enable_shading_table_conversion == 0) {
-			sh_css_sp_group.pipe[thread_id].shading.internal_frame_origin_x_bqs_on_sctbl
-			= (uint32_t)internal_frame_origin_bqs_on_sctbl->x;
-			sh_css_sp_group.pipe[thread_id].shading.internal_frame_origin_y_bqs_on_sctbl
-			= (uint32_t)internal_frame_origin_bqs_on_sctbl->y;
-		} else {
-			sh_css_sp_group.pipe[thread_id].shading.internal_frame_origin_x_bqs_on_sctbl =
-			0;
-			sh_css_sp_group.pipe[thread_id].shading.internal_frame_origin_y_bqs_on_sctbl =
-			0;
-		}
-	}
-
 	IA_CSS_LOG("pipe_id %d port_config %08x",
 		   pipe_id, sh_css_sp_group.pipe[thread_id].inout_port_config);
 
-- 
2.33.1

