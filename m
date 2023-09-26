Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF6E17AE925
	for <lists+linux-media@lfdr.de>; Tue, 26 Sep 2023 11:27:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234201AbjIZJ1l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Sep 2023 05:27:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234302AbjIZJ10 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Sep 2023 05:27:26 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 925F7CD9
        for <linux-media@vger.kernel.org>; Tue, 26 Sep 2023 02:27:12 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 953E9C433C9;
        Tue, 26 Sep 2023 09:27:11 +0000 (UTC)
Message-ID: <d102a389-af14-45fd-a304-d2458c06cca3@xs4all.nl>
Date:   Tue, 26 Sep 2023 11:27:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] media: atomisp: fix 'read beyond size of field'
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If CONFIG_FORTIFY_SOURCE=y, then this warning is produced:

In file included from ./include/linux/string.h:254,
                 from ./include/linux/bitmap.h:11,
                 from ./include/linux/cpumask.h:12,
                 from ./arch/x86/include/asm/cpumask.h:5,
                 from ./arch/x86/include/asm/msr.h:11,
                 from ./arch/x86/include/asm/processor.h:23,
                 from ./arch/x86/include/asm/cpufeature.h:5,
                 from ./arch/x86/include/asm/thread_info.h:53,
                 from ./include/linux/thread_info.h:60,
                 from ./arch/x86/include/asm/preempt.h:9,
                 from ./include/linux/preempt.h:79,
                 from ./include/linux/spinlock.h:56,
                 from ./include/linux/mmzone.h:8,
                 from ./include/linux/gfp.h:7,
                 from ./include/linux/slab.h:16,
                 from ./drivers/staging/media/atomisp//include/hmm/hmm.h:26,
                 from drivers/staging/media/atomisp/pci/sh_css_params.c:26:
In function ‘fortify_memcpy_chk’,
    inlined from ‘sh_css_store_sp_group_to_ddr’ at drivers/staging/media/atomisp/pci/sh_css_params.c:3736:3:
./include/linux/fortify-string.h:592:25: warning: call to ‘__read_overflow2_field’ declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()?
[-Wattribute-warning]
  592 |                         __read_overflow2_field(q_size_field, size);
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The reason is that the memcpy copies two fields (each a u8), when the source
pointer points to the first field. It's a bit unexpected, so just make this
explicit.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
Hans, can you verify that it is indeed the intention of the original code
to write both bytes?

Note that I think that the initial memcpy is equally dubious. I think that
should be replaced by '*buf_ptr++ = ...' lines as well, rather than just
copying the first three fields with a memcpy. If you want I can make a v2
that does that.
---
diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index 5667e855da76..232744973ab8 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -3733,8 +3733,8 @@ ia_css_ptr sh_css_store_sp_group_to_ddr(void)
 	if (IS_ISP2401) {
 		memcpy(buf_ptr, &sh_css_sp_group.config, 3);
 		buf_ptr += 3;
-		memcpy(buf_ptr, &sh_css_sp_group.config.enable_isys_event_queue, 2);
-		buf_ptr += 2;
+		*buf_ptr++ = sh_css_sp_group.config.enable_isys_event_queue;
+		*buf_ptr++ = sh_css_sp_group.config.disable_cont_vf;
 		memset(buf_ptr, 0, 3);
 		buf_ptr += 3; /* Padding 3 bytes for struct sh_css_sp_config*/
 	} else {
