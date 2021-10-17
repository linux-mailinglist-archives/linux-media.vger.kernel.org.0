Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B2C3430A99
	for <lists+linux-media@lfdr.de>; Sun, 17 Oct 2021 18:21:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344150AbhJQQYA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Oct 2021 12:24:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344141AbhJQQX7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Oct 2021 12:23:59 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63881C06161C;
        Sun, 17 Oct 2021 09:21:49 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id m26so12844885pff.3;
        Sun, 17 Oct 2021 09:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mBvO4nQ+BAFAe5zffkplq2kww5VGhkJonMlWH4MfSDg=;
        b=BfD5M6f+Tsx2kmeO0W3YIQ4HRFAwh9ZeFJnN9JTKHYJE9xTioaUSHNW4q+FgNojk/8
         yKx0LYs4vT6qKVIwUDKrh35rfUC1I//ODWaRpuJQav1l46r5FIiktvBwPUvXD06nKuGE
         XVDTc9mKVUkkAUYXnTWdq1kizwiY7kwHMxwlbt0+ao6DxKZBz/FWOY3G/QHtIshwhIbV
         5rpLAJB6wWQynqJPuoaCX0401iVhNc2ESpvH++oQZUC2R2BcSRolv+HmKuLLSsaBegRw
         K1BazLLyK4GTUuXIC4Lz79oQzez+WHGbJNy+J/APf+TmLXkkoqKsjUzBloP/VXM7ovO5
         7OAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mBvO4nQ+BAFAe5zffkplq2kww5VGhkJonMlWH4MfSDg=;
        b=oDE44UZFIxgoHlo1lWJW5EZ4TfLhIZZKQ0zA7bCi2BBEjeqwc3j2upV0HOgtfdjcTD
         dCW5XWW791maZZ1bQxdkfMrx9eP/2Flo4YnRtwLjof03svnsJvngdIZofE+ATb6GqWnY
         EYFSBrDQzcz+iv4G5GvD0Hef8sL29dSFPu78Qi10cMMQZcE96ABL8teFDr2W0nsCIm6B
         A7IbInce1qV3oIJMCbxGrPLYjmZqdA/d+C1SULDmw8YS86lkVURryRa5TM82JUXk97U+
         8iNC8Bju56+/IeH8mNv6rYgL7Q0wAp6EmgCIcds4FmSSfayAdwWsfMPfWDgkWSJWJ0Dt
         x9MQ==
X-Gm-Message-State: AOAM531vlUh8AhuRRVLywzhwq7JgxN9jnOZVkkN2rEjbYdHObitXBwSD
        JSHmUg+fwwg/rIE1FTSWeN8=
X-Google-Smtp-Source: ABdhPJw8E2F2t4ZNkzjK6WFOqT25HaBX7xYgwP30IA34H8YKwVrHS4YxBBZru8LNsWJIdfXA8OiooA==
X-Received: by 2002:a65:6187:: with SMTP id c7mr18771665pgv.317.1634487708860;
        Sun, 17 Oct 2021 09:21:48 -0700 (PDT)
Received: from sbwpb-arch.flets-east.jp ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id mu11sm5155444pjb.20.2021.10.17.09.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 09:21:48 -0700 (PDT)
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
        Alan <alan@linux.intel.com>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 10/17] media: atomisp: pci: make fw ver irci_stable_candrpv_0415_20150521_0458 work - 3/5
Date:   Mon, 18 Oct 2021 01:19:50 +0900
Message-Id: <20211017161958.44351-11-kitakar@gmail.com>
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

This patch removes `struct ia_css_isp_parameter xnr3` from
`struct ia_css_memory_offsets` as well as its usage [1].

[1] added on updating css version to irci_master_20150701_0213
    https://raw.githubusercontent.com/intel/ProductionKernelQuilts/cht-m1stable-2016_ww31/uefi/cht-m1stable/patches/cam-0439-atomisp2-css2401-and-2401_legacy-irci_master_2015070.patch
    ("atomisp2: css2401 and 2401_legacy-irci_master_20150701_0213")

Signed-off-by: Tsuchiya Yuto <kitakar@gmail.com>
---
 .../css_2401_system/hive/ia_css_isp_params.c  | 23 -------------------
 .../media/atomisp/pci/ia_css_isp_params.h     |  3 ---
 2 files changed, 26 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/hive/ia_css_isp_params.c b/drivers/staging/media/atomisp/pci/css_2401_system/hive/ia_css_isp_params.c
index d9c672d8904e..503ac65da69b 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/hive/ia_css_isp_params.c
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/hive/ia_css_isp_params.c
@@ -1721,29 +1721,6 @@ ia_css_process_xnr3(
 					    "ia_css_process_xnr3() leave:\n");
 		}
 	}
-	{
-		unsigned int size   =
-		    stage->binary->info->mem_offsets.offsets.param->vmem.xnr3.size;
-
-		unsigned int offset =
-		    stage->binary->info->mem_offsets.offsets.param->vmem.xnr3.offset;
-
-		if (size) {
-			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-					    "ia_css_process_xnr3() enter:\n");
-
-			ia_css_xnr3_vmem_encode((struct sh_css_isp_xnr3_vmem_params *)
-						&stage->binary->mem_params.params[IA_CSS_PARAM_CLASS_PARAM][IA_CSS_ISP_VMEM].address[offset],
-						&params->xnr3_config,
-						size);
-			params->isp_params_changed = true;
-			params->isp_mem_params_changed[pipe_id][stage->stage_num][IA_CSS_ISP_VMEM] =
-			    true;
-
-			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-					    "ia_css_process_xnr3() leave:\n");
-		}
-	}
 }
 
 /* Code generated by genparam/gencode.c:gen_param_process_table() */
diff --git a/drivers/staging/media/atomisp/pci/ia_css_isp_params.h b/drivers/staging/media/atomisp/pci/ia_css_isp_params.h
index 6e3082b39ed6..c2de689877d1 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_isp_params.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_isp_params.h
@@ -121,9 +121,6 @@ struct ia_css_memory_offsets {
 		struct ia_css_isp_parameter sdis_vertcoef;
 		struct ia_css_isp_parameter sdis2_horicoef;
 		struct ia_css_isp_parameter sdis2_vertcoef;
-
-		/* ISP2401 */
-		struct ia_css_isp_parameter xnr3;
 	} vmem;
 	struct {
 		struct ia_css_isp_parameter bh;
-- 
2.33.1

