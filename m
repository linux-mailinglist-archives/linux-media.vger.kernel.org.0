Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2270F430A9B
	for <lists+linux-media@lfdr.de>; Sun, 17 Oct 2021 18:22:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241455AbhJQQYJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Oct 2021 12:24:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344149AbhJQQYI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Oct 2021 12:24:08 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B282FC06161C;
        Sun, 17 Oct 2021 09:21:58 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id np13so10590073pjb.4;
        Sun, 17 Oct 2021 09:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c0uj44wPnm4Y8EmOSQ7wX2rnL2hUC4B+oFq2A5I3XW8=;
        b=gHW/xdCf4O5ataZNMASb4FqO5OtZLEAfMXLgvb3KfA8G9Wb8SifR2tqO3HnRBGUTMX
         Bzjn8HBva1HmJ4tI/yZ9fL+P4AfMWcGIkIR8vY16mA/IT+2sLF9dW1/qBhiuzygmnCBO
         /jP3EMYkNpWT41zbAixcQEtWR8VtlrtVXn4N6VpP3fUDJ2hNvf/9ZK4ulRj7pMfnZlmB
         qB5p7mlorxxe0Hg0zwnZU3TVM08eYgA7XpYJ7eghRmqPentgtSDygwvXAAKuHp8Wb5Ah
         mCj3qpyQPPbyfV2Yk5X6uTQ5JYB5jM5XPxavSRhMGL9saZXS6I6FBNyP/VaGKGrL9hZ8
         r1LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c0uj44wPnm4Y8EmOSQ7wX2rnL2hUC4B+oFq2A5I3XW8=;
        b=KYFiUEENbAkMDCkalKJM49FmnIiLyPfhKqznbq6P40eA6fFiI/wzdNjHuvYZBYE0pC
         BiIQ2auqdA4RaojAYtt+BS3akaW2LbgJXIkRhVI6lnbKlJlsVg2rHiIl1ntaSc1eFP50
         6LaT5feRGom8FRaKH9KX69T31ZShVle1whapwwaKfghkUnPAYxiDeInEnV2gvMXl9y6i
         bu/2lRqKy1tqZ8zQJFBog3z1tmN9KT0cuJa+ITIYP/OZoQws64p7/UyrzDf7B8ynBgIk
         vHIbqPoCWDijgpGBMqE/pha0KQudxvBoLw+TpBPYfJqTo81AC8mo5RglXsYtDcTYklRI
         DbPQ==
X-Gm-Message-State: AOAM531ZAjQZsqw+6wsejGjlGQqel3nWdyMnOTPZUTPxwVsEjS3Emt8T
        ebz9cUSosQBvdAqqzr2hwBA=
X-Google-Smtp-Source: ABdhPJzefsfYf8SoqkFHZLPasa2qVn76OAgJBgiN4KjzWniBOMnfJzQkZ/8wAmf5Pbg4IcPBsbMiAQ==
X-Received: by 2002:a17:90a:a386:: with SMTP id x6mr27461650pjp.56.1634487718185;
        Sun, 17 Oct 2021 09:21:58 -0700 (PDT)
Received: from sbwpb-arch.flets-east.jp ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id mu11sm5155444pjb.20.2021.10.17.09.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 09:21:57 -0700 (PDT)
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
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        Alan <alan@linux.intel.com>,
        Aditya Srivastava <yashsri421@gmail.com>,
        Martiros Shakhzadyan <vrzh@vrzh.net>,
        Kees Cook <keescook@chromium.org>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 11/17] media: atomisp: pci: make fw ver irci_stable_candrpv_0415_20150521_0458 work - 4/5
Date:   Mon, 18 Oct 2021 01:19:51 +0900
Message-Id: <20211017161958.44351-12-kitakar@gmail.com>
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

This patch removes polling_mode and subscr_index from
`struct virtual_input_system_stream_s` as well as its usage [1]. Note
that for subscr_index, only the definition were removed because it was
not used anywhere.

[1] added on updating css version to irci_master_20150701_0213
    https://raw.githubusercontent.com/intel/ProductionKernelQuilts/cht-m1stable-2016_ww31/uefi/cht-m1stable/patches/cam-0439-atomisp2-css2401-and-2401_legacy-irci_master_2015070.patch
    ("atomisp2: css2401 and 2401_legacy-irci_master_20150701_0213")

Signed-off-by: Tsuchiya Yuto <kitakar@gmail.com>
---
 .../atomisp/pci/isp2401_input_system_global.h      | 12 ------------
 .../atomisp/pci/runtime/isys/src/virtual_isys.c    | 11 -----------
 drivers/staging/media/atomisp/pci/sh_css.c         | 14 ++------------
 3 files changed, 2 insertions(+), 35 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp2401_input_system_global.h b/drivers/staging/media/atomisp/pci/isp2401_input_system_global.h
index f38773842646..e3c86069b390 100644
--- a/drivers/staging/media/atomisp/pci/isp2401_input_system_global.h
+++ b/drivers/staging/media/atomisp/pci/isp2401_input_system_global.h
@@ -44,11 +44,6 @@ typedef enum {
 	N_INPUT_SYSTEM_SOURCE_TYPE
 } input_system_source_type_t;
 
-typedef enum {
-	INPUT_SYSTEM_POLL_ON_WAIT_FOR_FRAME,
-	INPUT_SYSTEM_POLL_ON_CAPTURE_REQUEST,
-} input_system_polling_mode_t;
-
 typedef struct input_system_channel_s input_system_channel_t;
 struct input_system_channel_s {
 	stream2mmio_ID_t	stream2mmio_id;
@@ -111,9 +106,6 @@ struct isp2401_input_system_cfg_s {
 
 	input_system_source_type_t	mode;
 
-	/* ISP2401 */
-	input_system_polling_mode_t	polling_mode;
-
 	bool online;
 	bool raw_packed;
 	s8 linked_isys_stream_id;
@@ -165,10 +157,6 @@ struct virtual_input_system_stream_s {
 	u8 online;
 	s8 linked_isys_stream_id;
 	u8 valid;
-
-	/* ISP2401 */
-	input_system_polling_mode_t	polling_mode;
-	s32 subscr_index;
 };
 
 typedef struct virtual_input_system_stream_cfg_s
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
index 82f3c19dc455..8fc7746f8639 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
@@ -189,17 +189,6 @@ ia_css_isys_error_t ia_css_isys_stream_create(
 		return false;
 	}
 
-#ifdef ISP2401
-	/*
-	 * Early polling is required for timestamp accuracy in certain cause.
-	 * The ISYS HW polling is started on
-	 * ia_css_isys_stream_capture_indication() instead of
-	 * ia_css_pipeline_sp_wait_for_isys_stream_N() as isp processing of
-	 * capture takes longer than getting an ISYS frame
-	 */
-	isys_stream->polling_mode = isys_stream_descr->polling_mode;
-
-#endif
 	/* create metadata channel */
 	if (isys_stream_descr->metadata.enable) {
 		rc = create_input_system_channel(isys_stream_descr, true,
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index ba25d0da8b81..79003077f390 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -1000,20 +1000,10 @@ static bool sh_css_translate_stream_cfg_to_isys_stream_descr(
 	isys_stream_descr->raw_packed = stream_cfg->pack_raw_pixels;
 	isys_stream_descr->linked_isys_stream_id = (int8_t)
 		stream_cfg->isys_config[isys_stream_idx].linked_isys_stream_id;
-	/*
-	 * Early polling is required for timestamp accuracy in certain case.
-	 * The ISYS HW polling is started on
-	 * ia_css_isys_stream_capture_indication() instead of
-	 * ia_css_pipeline_sp_wait_for_isys_stream_N() as isp processing of
-	 * capture takes longer than getting an ISYS frame
-	 */
-	if (IS_ISP2401) {
-		isys_stream_descr->polling_mode
-		    = early_polling ? INPUT_SYSTEM_POLL_ON_CAPTURE_REQUEST
-		      : INPUT_SYSTEM_POLL_ON_WAIT_FOR_FRAME;
+
+	if (IS_ISP2401)
 		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
 				    "sh_css_translate_stream_cfg_to_isys_stream_descr() leave:\n");
-	}
 
 	return rc;
 }
-- 
2.33.1

