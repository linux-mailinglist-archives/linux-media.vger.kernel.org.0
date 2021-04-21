Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0ED7366AE6
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 14:37:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238930AbhDUMiD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 08:38:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234216AbhDUMiC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 08:38:02 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DC2BC06174A;
        Wed, 21 Apr 2021 05:37:28 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id z25so8344609qtn.8;
        Wed, 21 Apr 2021 05:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=Kp9j2ssncbR9fiPGXbEXBPrYNKseNHOrZVSY8FEsHgA=;
        b=a9dQg5DXj1A1Hg4NBdqacQGGr3YkObBj3LP8mTP6akWFNWDCQ+tLT2jj6zSm1Ti4jw
         CQJGo+kqZf9luljyUVMbMK2vQ6CE2dGd259DJ8gSHVRw2/Hkcug2CgcFH8Or6ZaXW/Bm
         bTej0E4YkztxWqIkXr+78rPt2fln/MOm5s+pmd2x8buqUb6E5AL4obtipg2Sgruq4oTp
         e/dTQqi69eC/ABh1q0Xy5WljMbPpkisuW0h6W9o5ttqv7hiy+nrlhLApBbLdL4Nj6JOY
         TxmaaY22xJxZZ7K2R+Mf2eXRCCLIlX7gKNySolxHABf5MHKbaU+hYZOqsv1v/0UHn5jN
         bIsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=Kp9j2ssncbR9fiPGXbEXBPrYNKseNHOrZVSY8FEsHgA=;
        b=qCtn1JQzstOI6hY+q/WZGmpVRAlcpne6bZGPvNisYSMTqiM20A5OgORSAhFP8Wj+On
         uUBx6zPNLAz6ETJgAoZhOYI0VuEl/DEg7JqKqFpLR4zNFtkrixmb/AS+QsuRGLIMbiI4
         QXU+OM4fSnOJXVQd3bROBJpI8xsAhRlebFpGKG4eh+OuGgqIOyr2XKU0mfYNfsKaG5VD
         QK+fFWEtdu5saxr4JniGyo4oTc6u25jKDBnt/X48M7njj+vk2J7oVnGz01mkjI7SGQac
         bjmwWKpPgr34sGrwbwu1GEkaVrJ71Ec0WX02B9MkiKQadn3un96UEua81Y/hbsem5hEp
         +baQ==
X-Gm-Message-State: AOAM530YTbGiLK69hulttJhu+zhhPK73wn+s+QLBPNmC8kB5OyJ623YA
        hIYg9zgNwdD+AawV7yoEVi3NrKKAt/M3g5ax
X-Google-Smtp-Source: ABdhPJzZTeXG22W9ZDZ7cHoVIsnptTrJnW/1bWDreQmAdhVtnEqfv81Z07I4p96JVWmXibeyMRdoyA==
X-Received: by 2002:ac8:5ad5:: with SMTP id d21mr21891858qtd.198.1619008641105;
        Wed, 21 Apr 2021 05:37:21 -0700 (PDT)
Received: from focaruja ([2001:1284:f016:d487:66ec:5db5:e8ff:edf2])
        by smtp.gmail.com with ESMTPSA id x22sm1969101qki.21.2021.04.21.05.37.20
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Wed, 21 Apr 2021 05:37:20 -0700 (PDT)
Date:   Wed, 21 Apr 2021 09:37:18 -0300
From:   Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: [PATCH v3] staging: media: atomisp: pci: Change line break to avoid
 an open parenthesis at the end of the line
Message-ID: <20210421123718.GA4597@focaruja>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Change line break to avoid an open parenthesis at the end of the line.
It consequently removed spaces at the start of the subsequent line.
Both issues detected by checkpatch.pl.

Signed-off-by: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
---

Changes since v2:
 - Insert a space between the function type and pointer

Changes since v1:
 - Keep the pointer with the function return type
   instead of left it with the function name
    
 drivers/staging/media/atomisp/pci/atomisp_cmd.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
index 1c0d464..639eca3 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
@@ -75,8 +75,8 @@ void atomisp_wdt(struct timer_list *t);
 void atomisp_setup_flash(struct atomisp_sub_device *asd);
 irqreturn_t atomisp_isr(int irq, void *dev);
 irqreturn_t atomisp_isr_thread(int irq, void *isp_ptr);
-const struct atomisp_format_bridge *get_atomisp_format_bridge_from_mbus(
-    u32 mbus_code);
+const struct atomisp_format_bridge *
+get_atomisp_format_bridge_from_mbus(u32 mbus_code);
 bool atomisp_is_mbuscode_raw(uint32_t code);
 int atomisp_get_frame_pgnr(struct atomisp_device *isp,
 			   const struct ia_css_frame *frame, u32 *p_pgnr);
@@ -381,9 +381,9 @@ enum mipi_port_id __get_mipi_port(struct atomisp_device *isp,
 
 bool atomisp_is_vf_pipe(struct atomisp_video_pipe *pipe);
 
-void atomisp_apply_css_parameters(
-    struct atomisp_sub_device *asd,
-    struct atomisp_css_params *css_param);
+void atomisp_apply_css_parameters(struct atomisp_sub_device *asd,
+				  struct atomisp_css_params *css_param);
+
 void atomisp_free_css_parameters(struct atomisp_css_params *css_param);
 
 void atomisp_handle_parameter_and_buffer(struct atomisp_video_pipe *pipe);
-- 
2.7.4

