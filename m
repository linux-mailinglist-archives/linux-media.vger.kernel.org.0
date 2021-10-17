Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A9B9430A92
	for <lists+linux-media@lfdr.de>; Sun, 17 Oct 2021 18:21:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344110AbhJQQXc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Oct 2021 12:23:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344085AbhJQQX3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Oct 2021 12:23:29 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC2B9C061768;
        Sun, 17 Oct 2021 09:21:19 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id t21so1572938plr.6;
        Sun, 17 Oct 2021 09:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ckrUwHLOukwoUB/hFCfgkrZjXpKJdUb5PQzUAqzB0DM=;
        b=k1eH1OhyCCff9xIzkyBRVKg0zAOMdQZ40bFur0QFNYuR7/LJNh7HZC1nJnorXRwgzP
         8tK9+V6diClLVZTJrh0k5ech1aDHjbdwZzBSygAhnYIKbmF5wWauJCQ2RqQqh85rR3A8
         GUrAWSPdDAkDBp30Qo+TpocbKh/Q/4VdMw9nLC5l95ThHxIpztXh4IvQltFzHhbfuTzv
         qPo/jPDaqEBEvu3F3iz2ap8LZrChh4GiojQ6/NpNDBO+dHP4ZShs8b42zkdRzG8VVydE
         siMT6zMf2EcSSKGNn26uoK48wDQqBtx3SwrzpTjmXN4rV+zZ8FjRLgWm+P87ARTApFyS
         GAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ckrUwHLOukwoUB/hFCfgkrZjXpKJdUb5PQzUAqzB0DM=;
        b=VUm8RjYL0tCy4wreKS9SwikPkqwmAt8q2GRuyBZhMjj0w/ZSFO/vlju2pT/nyEZTIy
         7rgKSsy8+rG3bde8UbHq6HudOazt3QF79/CtWG2EOBRzAU/ByJiVWhtX4Js71QG3l9yG
         4UMlWYEf32okYgD0siXx8KPpdVeKtSoOdpcDMIyeD8eSlx7cGOA9Xbu49PuUokSZ8AJk
         BbQn7I4GxyVtLX+UD7o8vOOmlYTKtNCEO+7WFkVvpExhNsjb3ly0OvrwG3K6Fn1sRHvF
         ZbErG/qzCNUqFBvZUnLnbIrUhQ6u/iizYYJA9Mp9RX+Pzyu7e5JN/7TYVBEeQy2yhVtt
         lodA==
X-Gm-Message-State: AOAM530l0fAnlidgtZfM9QByWVehpcW9V+erf8+csvKbELvofHLJV0PN
        Whiao3z0A8n2CrvLWFvbX14=
X-Google-Smtp-Source: ABdhPJwNreFIIsKAxO7uA6IYRA1CYtWsWDd1nWy3NKWm6R3GxxKZQxz/93NizNpnxtujFFZnGg9qjg==
X-Received: by 2002:a17:90b:17c3:: with SMTP id me3mr15557010pjb.70.1634487679400;
        Sun, 17 Oct 2021 09:21:19 -0700 (PDT)
Received: from sbwpb-arch.flets-east.jp ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id mu11sm5155444pjb.20.2021.10.17.09.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 09:21:19 -0700 (PDT)
From:   Tsuchiya Yuto <kitakar@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        Alan <alan@linux.intel.com>,
        Martiros Shakhzadyan <vrzh@vrzh.net>,
        Kees Cook <keescook@chromium.org>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 07/17] media: atomisp: pci: fix ifdefs in sh_css.c
Date:   Mon, 18 Oct 2021 01:19:47 +0900
Message-Id: <20211017161958.44351-8-kitakar@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211017161958.44351-1-kitakar@gmail.com>
References: <20211017161958.44351-1-kitakar@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

 ## `if (pipe->stream->config.mode == IA_CSS_INPUT_MODE_TPG) {` case

The intel-aero atomisp has `#if defined(IS_ISP_2400_SYSTEM)` [1]. It is
to be defined in the following two places [2]:

  - css/hive_isp_css_common/system_global.h
  - css/css_2401_csi2p_system/system_global.h

and the former file is to be included on ISP2400 devices, too. So, it
is to be defined for both ISP2400 and ISP2401 devices.

Because the upstreamed atomisp driver now supports only ISP2400 and
ISP2401, just remove the ISP version test again. This matches the other
upstream commits like 3c0538fbad9f ("media: atomisp: get rid of most
checks for ISP2401 version").

While here, moved the comment for define GP_ISEL_TPG_MODE to the
appropriate place.

[1] https://github.com/intel-aero/linux-kernel/blob/a1b673258feb915268377275130c5c5df0eafc82/drivers/media/pci/atomisp/css/sh_css.c#L552-L558
[2] https://github.com/intel-aero/linux-kernel/search?q=IS_ISP_2400_SYSTEM

  ## `isys_stream_descr->polling_mode` case

This does not exist on the intel-aero atomisp. This is because it is
based on css version irci_stable_candrpv_0415_20150521_0458.

On the other hand, the upstreamed atomisp is based on the following css
version depending on the ISP version using ifdefs:

  - ISP2400: irci_stable_candrpv_0415_20150521_0458
  - ISP2401: irci_master_20150911_0724

The `isys_stream_descr->polling_mode` usage was added on updating css
version to irci_master_20150701_0213 [3].

So, it is not a ISP version specific thing, but css version specific
thing. Because the upstreamed atomisp driver uses irci_master_20150911_0724
for ISP2401, re-add the ISP version check for now.

I say "for now" because ISP2401 should eventually use the same css
version with ISP2400 (i.e., irci_stable_candrpv_0415_20150521_0458)

[3] https://raw.githubusercontent.com/intel/ProductionKernelQuilts/cht-m1stable-2016_ww31/uefi/cht-m1stable/patches/cam-0439-atomisp2-css2401-and-2401_legacy-irci_master_2015070.patch
    ("atomisp2: css2401 and 2401_legacy-irci_master_20150701_0213")
    Link to Intel's Android kernel patch.

 ## `coord = &me->config.internal_frame_origin_bqs_on_sctbl;` case

it was added on commit 4f744a573db3 ("media: atomisp: make
sh_css_sp_init_pipeline() ISP version independent") for ISP2401. Because
the upstreamed atomisp for the ISP2401 part is based on
irci_master_20150911_0724, hence the difference.

Because the upstreamed atomisp driver uses irci_master_20150911_0724
for ISP2401, revert the test back to `if (IS_ISP2401)`.

Fixes: 27333dadef57 ("media: atomisp: adjust some code at sh_css that could be broken")
Signed-off-by: Tsuchiya Yuto <kitakar@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 27 +++++++++-------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index c4b35cbab373..ba25d0da8b81 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -522,6 +522,7 @@ ia_css_stream_input_format_bits_per_pixel(struct ia_css_stream *stream)
 	return bpp;
 }
 
+/* TODO: move define to proper file in tools */
 #define GP_ISEL_TPG_MODE 0x90058
 
 #if !defined(ISP2401)
@@ -573,12 +574,8 @@ sh_css_config_input_network(struct ia_css_stream *stream)
 		vblank_cycles = vblank_lines * (width + hblank_cycles);
 		sh_css_sp_configure_sync_gen(width, height, hblank_cycles,
 					     vblank_cycles);
-		if (!IS_ISP2401) {
-			if (pipe->stream->config.mode == IA_CSS_INPUT_MODE_TPG) {
-				/* TODO: move define to proper file in tools */
-				ia_css_device_store_uint32(GP_ISEL_TPG_MODE, 0);
-			}
-		}
+		if (pipe->stream->config.mode == IA_CSS_INPUT_MODE_TPG)
+			ia_css_device_store_uint32(GP_ISEL_TPG_MODE, 0);
 	}
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
 			    "sh_css_config_input_network() leave:\n");
@@ -1009,16 +1006,14 @@ static bool sh_css_translate_stream_cfg_to_isys_stream_descr(
 	 * ia_css_isys_stream_capture_indication() instead of
 	 * ia_css_pipeline_sp_wait_for_isys_stream_N() as isp processing of
 	 * capture takes longer than getting an ISYS frame
-	 *
-	 * Only 2401 relevant ??
 	 */
-#if 0 // FIXME: NOT USED on Yocto Aero
-	isys_stream_descr->polling_mode
-	    = early_polling ? INPUT_SYSTEM_POLL_ON_CAPTURE_REQUEST
-	      : INPUT_SYSTEM_POLL_ON_WAIT_FOR_FRAME;
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "sh_css_translate_stream_cfg_to_isys_stream_descr() leave:\n");
-#endif
+	if (IS_ISP2401) {
+		isys_stream_descr->polling_mode
+		    = early_polling ? INPUT_SYSTEM_POLL_ON_CAPTURE_REQUEST
+		      : INPUT_SYSTEM_POLL_ON_WAIT_FOR_FRAME;
+		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
+				    "sh_css_translate_stream_cfg_to_isys_stream_descr() leave:\n");
+	}
 
 	return rc;
 }
@@ -1433,7 +1428,7 @@ static void start_pipe(
 
 	assert(me); /* all callers are in this file and call with non null argument */
 
-	if (!IS_ISP2401) {
+	if (IS_ISP2401) {
 		coord = &me->config.internal_frame_origin_bqs_on_sctbl;
 		params = me->stream->isp_params_configs;
 	}
-- 
2.33.1

