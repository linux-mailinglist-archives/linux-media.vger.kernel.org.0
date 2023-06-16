Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3D37733390
	for <lists+linux-media@lfdr.de>; Fri, 16 Jun 2023 16:27:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345501AbjFPO1M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Jun 2023 10:27:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343743AbjFPO1L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Jun 2023 10:27:11 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0266D35A7
        for <linux-media@vger.kernel.org>; Fri, 16 Jun 2023 07:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686925581;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wp8HRHHm+Qn70LUCredeFksL7ZN6f6i0xsEQFSmU0Ok=;
        b=XssopmOYdwi8el5Mn/NI9hRFKZ7Ak6eGyliTLTvTXDdKOnjIQuRtcdmBdcezn5AQr6Y7mM
        r95EPwvxqsCniBrrJWz/7GzeVIJBiUi6dSLY0BaPh0K6Ty4n6OcBa+eiqIusJ3iequ5WZz
        TVgucw4mWdutMeR8rXkdJ9DFcCH61W4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-620-VXzIHadUMs64MUMo_t5HbQ-1; Fri, 16 Jun 2023 10:26:19 -0400
X-MC-Unique: VXzIHadUMs64MUMo_t5HbQ-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-513f337d478so451160a12.3
        for <linux-media@vger.kernel.org>; Fri, 16 Jun 2023 07:26:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686925578; x=1689517578;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wp8HRHHm+Qn70LUCredeFksL7ZN6f6i0xsEQFSmU0Ok=;
        b=RdXDy80Vk3/rVimIe2O1eKKfBxmfEYOYf++BmsI63J2GojvTJNjUTF+dtDgel8oRkV
         IouQQ5vT4El4KPwc+UEJb7LjS63NFPyyitHGzFHnsJ6jfnDmMwDsT/+UZe+Agza1hchA
         86W8n53eAop+OhvQ2vjHHqs3xt4xN+lYcUzPCcYXgnxw1bHLZkk0Kfd+C6EN+/niIaGv
         AnQihZShPQmP0zt2x4wN+lxlgxPXC1AcF16NAdz1lCHn6YAY6WsSMaEVIU56ALxn5HDC
         e5iDB8NscD+spWKF0zOWbWJaq1GFkhMlfhUMQ2uXWdC7atKiJzoh2N6012WOQ1Ec+DMw
         pn6Q==
X-Gm-Message-State: AC+VfDwEan96aFzAPGL9ufYNfKQUUFU0yXRpt5cExKQA4oslVgZfYISY
        37xBa5TOgJl//ICXhDhhjLHF4IBZsH2t9ruhM5K+7V+urci3AAYcy+JapN896CYfY94JaOCUV6t
        rnQHuj0UeCZ2tb90ALNagbZI=
X-Received: by 2002:a17:907:7fa6:b0:970:1b2d:45bf with SMTP id qk38-20020a1709077fa600b009701b2d45bfmr2492040ejc.61.1686925578524;
        Fri, 16 Jun 2023 07:26:18 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5/VU6J7+vXqdB4wcZ8PPthvDgkfqQa1ebYwILLTANZ7YK+ZRkA+ctnrQvm+qEnPQckF8Bi2Q==
X-Received: by 2002:a17:907:7fa6:b0:970:1b2d:45bf with SMTP id qk38-20020a1709077fa600b009701b2d45bfmr2492016ejc.61.1686925578075;
        Fri, 16 Jun 2023 07:26:18 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id u3-20020a17090617c300b009788dfde0b2sm10918345eje.12.2023.06.16.07.26.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jun 2023 07:26:16 -0700 (PDT)
Message-ID: <d22dae42-d544-b891-6708-cf476151ea90@redhat.com>
Date:   Fri, 16 Jun 2023 16:26:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/3] media: atomisp: sh_css_internal: Unifying
 sh_css_sp_group to remove #ifdef ISP2401
To:     Kate Hsuan <hpa@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230612055718.453554-1-hpa@redhat.com>
 <20230612055718.453554-2-hpa@redhat.com>
 <33242ae0-848a-f264-3809-91b55fa1405b@redhat.com>
 <CAEth8oFnhPDamxHzBth6eAYD6fLZANmKwV022CpDR0Cf7n6wGA@mail.gmail.com>
 <CAEth8oGpMN0K23UAN-J1OJLAy5Zr0RfP706X6PBE2zAN0a3FQQ@mail.gmail.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAEth8oGpMN0K23UAN-J1OJLAy5Zr0RfP706X6PBE2zAN0a3FQQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kate,

On 6/16/23 08:18, Kate Hsuan wrote:
> On Fri, Jun 16, 2023 at 2:08 PM Kate Hsuan <hpa@redhat.com> wrote:
>>
>> Hi Hans
>>
>> Thank you for reviewing.
>>
>>
>> On Tue, Jun 13, 2023 at 5:34 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>
>>> Hi Kate,
>>>
>>> Thank you for the new version.
>>>
>>> It seems that this is a mismatch of multiple previous v1 patches
>>> squashed into 1, so I'm afraid that this is going to need
>>> a version 3 to fix this.
>>>
>>> I see bits of both:
>>>
>>> [PATCH 1/3] media: atomisp: sh_css_internal: Unifying sh_css_sp_group to remove #ifdef ISP2401
>>> [PATCH 3/3] media: atomisp: ia_css_debug: remove unused codes
>>>
>>> from v1 of the series in here. Where I think this should be only patch 3/3,
>>> removing the unused ia_css_debug code as a prep patch for further changes.
>>>
>>> See below for details.
>>>
>>> On 6/12/23 07:57, Kate Hsuan wrote:
>>>> Since some parts of the data scructure elements are determined in compile
>>>> time, the configuration data structure should be compiled for both two
>>>> ISP models. In order to set the configuration for both ISP model in
>>>> runtime, Thesh_css_sp_group is unified to one data structure for the
>>>> configuration to ensure the data structure can be used for both ISP2400
>>>> and 2401. Some of the unsed codes from ia_css_debug.c are also removed.
>>>
>>> It seems that when squashing patches you have ended up re-using the wrong
>>> commit message for this one.
>>>
>>> Instead the commit msg of the v1:
>>> "[PATCH 3/3] media: atomisp: ia_css_debug: remove unused codes"
>>>
>>> patch should be used here.
>>>
>>>
>>>> Signed-off-by: Kate Hsuan <hpa@redhat.com>
>>>> ---
>>>>  .../runtime/debug/interface/ia_css_debug.h    |  6 --
>>>>  .../pci/runtime/debug/src/ia_css_debug.c      | 76 +------------------
>>>>  .../media/atomisp/pci/sh_css_internal.h       | 35 +++------
>>>>  3 files changed, 13 insertions(+), 104 deletions(-)
>>>>
>>>> diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h b/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h
>>>> index fff89e9b4b01..3a3d72c6eaaa 100644
>>>> --- a/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h
>>>> +++ b/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h
>>>> @@ -141,12 +141,6 @@ static inline void __printf(2, 0) ia_css_debug_vdtrace(unsigned int level,
>>>>  __printf(2, 3) void ia_css_debug_dtrace(unsigned int level,
>>>>                                       const char *fmt, ...);
>>>>
>>>> -/*! @brief Dump sp thread's stack contents
>>>> - * SP thread's stack contents are set to 0xcafecafe. This function dumps the
>>>> - * stack to inspect if the stack's boundaries are compromised.
>>>> - * @return   None
>>>> - */
>>>> -void ia_css_debug_dump_sp_stack_info(void);
>>>>
>>>>  /*! @brief Function to set the global dtrace verbosity level.
>>>>   * @param[in]        trace_level     Maximum level of the messages to be traced.
>>>> diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
>>>> index bb6204cb42c5..bb30146c5fe7 100644
>>>> --- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
>>>> +++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
>>>
>>> The patch-hunk starting here:
>>>
>>>> @@ -105,7 +105,8 @@
>>>>   * TODO:SH_CSS_MAX_SP_THREADS is not the max number of sp threads
>>>>   * future rework should fix this and remove the define MAX_THREAD_NUM
>>>>   */
>>>> -#define MAX_THREAD_NUM (SH_CSS_MAX_SP_THREADS + SH_CSS_MAX_SP_INTERNAL_THREADS)
>>>> +#define MAX_THREAD_NUM_2400 (SH_CSS_MAX_SP_THREADS + SH_CSS_MAX_SP_INTERNAL_THREADS_2400)
>>>> +#define MAX_THREAD_NUM_2401 (SH_CSS_MAX_SP_THREADS + SH_CSS_MAX_SP_INTERNAL_THREADS_2401)
>>>>
>>>>  static struct pipe_graph_class {
>>>>       bool do_init;
>>>
>>> And ending here, does not belong in this patch. Instead it should be squashed into patch 2/3
>>> which will result in patch 2/3 simply removing the original lines.
>>>
>>>> @@ -147,79 +148,6 @@ void ia_css_debug_dtrace(unsigned int level, const char *fmt, ...)
>>>>       va_end(ap);
>>>>  }
>>>>
>>>> -static void debug_dump_long_array_formatted(
>>>> -    const sp_ID_t sp_id,
>>>> -    hrt_address stack_sp_addr,
>>>> -    unsigned int stack_size)
>>>> -{
>>>> -     unsigned int i;
>>>> -     u32 val;
>>>> -     u32 addr = (uint32_t)stack_sp_addr;
>>>> -     u32 stack_size_words = CEIL_DIV(stack_size, sizeof(uint32_t));
>>>> -
>>>> -     /* When size is not multiple of four, last word is only relevant for
>>>> -      * remaining bytes */
>>>> -     for (i = 0; i < stack_size_words; i++) {
>>>> -             val = sp_dmem_load_uint32(sp_id, (hrt_address)addr);
>>>> -             if ((i % 8) == 0)
>>>> -                     ia_css_debug_dtrace(IA_CSS_DEBUG_VERBOSE, "\n");
>>>> -
>>>> -             ia_css_debug_dtrace(IA_CSS_DEBUG_VERBOSE, "0x%08x ", val);
>>>> -             addr += sizeof(uint32_t);
>>>> -     }
>>>> -
>>>> -     ia_css_debug_dtrace(IA_CSS_DEBUG_VERBOSE, "\n");
>>>> -}
>>>> -
>>>> -static void debug_dump_sp_stack_info(
>>>> -    const sp_ID_t sp_id)
>>>> -{
>>>> -     const struct ia_css_fw_info *fw;
>>>> -     unsigned int HIVE_ADDR_sp_threads_stack;
>>>> -     unsigned int HIVE_ADDR_sp_threads_stack_size;
>>>> -     u32 stack_sizes[MAX_THREAD_NUM];
>>>> -     u32 stack_sp_addr[MAX_THREAD_NUM];
>>>> -     unsigned int i;
>>>> -
>>>> -     fw = &sh_css_sp_fw;
>>>> -
>>>> -     ia_css_debug_dtrace(IA_CSS_DEBUG_VERBOSE, "sp_id(%u) stack info\n", sp_id);
>>>> -     ia_css_debug_dtrace(IA_CSS_DEBUG_VERBOSE,
>>>> -                         "from objects stack_addr_offset:0x%x stack_size_offset:0x%x\n",
>>>> -                         fw->info.sp.threads_stack,
>>>> -                         fw->info.sp.threads_stack_size);
>>>> -
>>>> -     HIVE_ADDR_sp_threads_stack = fw->info.sp.threads_stack;
>>>> -     HIVE_ADDR_sp_threads_stack_size = fw->info.sp.threads_stack_size;
>>>> -
>>>> -     if (fw->info.sp.threads_stack == 0 ||
>>>> -         fw->info.sp.threads_stack_size == 0)
>>>> -             return;
>>>> -
>>>> -     (void)HIVE_ADDR_sp_threads_stack;
>>>> -     (void)HIVE_ADDR_sp_threads_stack_size;
>>>> -
>>>> -     sp_dmem_load(sp_id,
>>>> -                  (unsigned int)sp_address_of(sp_threads_stack),
>>>> -                  &stack_sp_addr, sizeof(stack_sp_addr));
>>>> -     sp_dmem_load(sp_id,
>>>> -                  (unsigned int)sp_address_of(sp_threads_stack_size),
>>>> -                  &stack_sizes, sizeof(stack_sizes));
>>>> -
>>>> -     for (i = 0 ; i < MAX_THREAD_NUM; i++) {
>>>> -             ia_css_debug_dtrace(IA_CSS_DEBUG_VERBOSE,
>>>> -                                 "thread: %u stack_addr: 0x%08x stack_size: %u\n",
>>>> -                                 i, stack_sp_addr[i], stack_sizes[i]);
>>>> -             debug_dump_long_array_formatted(sp_id, (hrt_address)stack_sp_addr[i],
>>>> -                                             stack_sizes[i]);
>>>> -     }
>>>> -}
>>>> -
>>>> -void ia_css_debug_dump_sp_stack_info(void)
>>>> -{
>>>> -     debug_dump_sp_stack_info(SP0_ID);
>>>> -}
>>>> -
>>>>  void ia_css_debug_set_dtrace_level(const unsigned int trace_level)
>>>>  {
>>>>       dbg_level = trace_level;
>>>
>>> All the sh_css_internal.h changes below should be
>>> squashed into / moved to:
>>>
>>> [PATCH v2 3/3] atomisp: sh_css_params: write the sp_group config according to the ISP model
>>
>> Sorry for the mistakes.
>> I'll start over again and all the fixes will be based on v1 patch.
>>
>> Here is my plan for the v3 patch.
>> patch 1/3 will squash the changes of  sh_css_params.c and
>> sh_css_internal.h into one patch.
>> patch 2/3 will remove the unused code and remove the unused variable
>> in sh_css_internal.h.
>> patch 3/3 will remove the debug code for HAS_WATCHDOG_SP_THREAD_DEBUG.
>>
> 
> It should be
> patch 1/3 will remove the unused code and remove the unused variable
> in sh_css_internal.h.
> patch 2/3 will remove the debug code for HAS_WATCHDOG_SP_THREAD_DEBUG.
> patch 3/3 will squash the changes of  sh_css_params.c and
> sh_css_internal.h into one patch.

That sounds good to me.

Note instead of starting over you could also split the existing
patches into multiple patches and the apply those in the right
order.

E.g. turn v2 set into .patch files:

git format-patch HEAD~3

and then reset your tree to before the patches:

git reset --hard HEAD~3

Then start a new temp.patch file with:

--- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c

In there and then *move* the troublesome block modifying ia_css_debug.
from 0001-....patch to temp.patch, resulting in a temp.patch with just:

--- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
@@ -105,7 +105,8 @@
  * TODO:SH_CSS_MAX_SP_THREADS is not the max number of sp threads
  * future rework should fix this and remove the define MAX_THREAD_NUM
  */
-#define MAX_THREAD_NUM (SH_CSS_MAX_SP_THREADS + SH_CSS_MAX_SP_INTERNAL_THREADS)
+#define MAX_THREAD_NUM_2400 (SH_CSS_MAX_SP_THREADS + SH_CSS_MAX_SP_INTERNAL_THREADS_2400)
+#define MAX_THREAD_NUM_2401 (SH_CSS_MAX_SP_THREADS + SH_CSS_MAX_SP_INTERNAL_THREADS_2401)
 
 static struct pipe_graph_class {
 	bool do_init;

In there. Likewise take all of the changes in 0001-...patch starting with:

--- a/drivers/staging/media/atomisp/pci/sh_css_internal.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_internal.h

All the way to the end of 0001-...patch and move that entire block
to a new temp2.patch file.

Then do:

patch -p1 < 0001....patch

To apply the remaining changes in 0001....patch, which should now
just be the changes to "remove the unused code and remove the
unused variable > in sh_css_internal.h."

do "git diff" to check the results + test build and the do:

git commit -as

To get your first v3 commit without needing to actually re-write
anything.

Then do:

patch -p1 < temp.patch

To apply the changes moved there, which are needed as a base
for patch 0002 to apply cleanly and then do:

patch -p1 < 0002-....patch

do "git diff" to check the results + test build and the do:

git commit -as

To get your second v3 commit removing
the HAS_WATCHDOG_SP_THREAD_DEBUG stuff.

Last do:

patch -p1 < temp2.patch
patch -p1 < 0003....patch

to get the actual Unifying sh_css_sp_group to remove #ifdef ISP2401
changes applied and then again do:

do "git diff" to check the results + test build and the do:

git commit -as


This moving around hunks of patch files can be a good skill to
have when reviewers ask you to split a patch, or re-order
some things in a patch series.

I think there also is a way to do stuff (like committing
staged changed) in git on a hunk by hunk basis. But I'm
old-school and just edit .patch files when I need to do
this kinda stuff.

If you want to just redo all the changes that is fine too,
but learning how to move hunks of patches around is a good
skill to have.

Regards,

Hans















> 
>>>
>>>> diff --git a/drivers/staging/media/atomisp/pci/sh_css_internal.h b/drivers/staging/media/atomisp/pci/sh_css_internal.h
>>>> index d98f1323441e..2fa0b3e45fe0 100644
>>>> --- a/drivers/staging/media/atomisp/pci/sh_css_internal.h
>>>> +++ b/drivers/staging/media/atomisp/pci/sh_css_internal.h
>>>> @@ -22,9 +22,7 @@
>>>>  #include <platform_support.h>
>>>>  #include <linux/stdarg.h>
>>>>
>>>> -#if !defined(ISP2401)
>>>>  #include "input_formatter.h"
>>>> -#endif
>>>>  #include "input_system.h"
>>>>
>>>>  #include "ia_css_types.h"
>>>> @@ -95,19 +93,20 @@
>>>>   *    these threads can't be used as image pipe
>>>>   */
>>>>
>>>> -#if !defined(ISP2401)
>>>> -#define SH_CSS_SP_INTERNAL_METADATA_THREAD   1
>>>> -#else
>>>> -#define SH_CSS_SP_INTERNAL_METADATA_THREAD   0
>>>> -#endif
>>>> +#define SH_CSS_SP_INTERNAL_METADATA_THREAD_2400      1
>>>> +#define SH_CSS_SP_INTERNAL_METADATA_THREAD_2401      0
>>>>
>>>>  #define SH_CSS_SP_INTERNAL_SERVICE_THREAD            1
>>>>
>>>>  #define SH_CSS_MAX_SP_THREADS                5
>>>>
>>>> -#define SH_CSS_MAX_SP_INTERNAL_THREADS       (\
>>>> -      SH_CSS_SP_INTERNAL_SERVICE_THREAD +\
>>>> -      SH_CSS_SP_INTERNAL_METADATA_THREAD)
>>>> +#define SH_CSS_MAX_SP_INTERNAL_THREADS_2400  (\
>>>> +     SH_CSS_SP_INTERNAL_SERVICE_THREAD +\
>>>> +      SH_CSS_SP_INTERNAL_METADATA_THREAD_2400)
>>>> +
>>>> +#define SH_CSS_MAX_SP_INTERNAL_THREADS_2401  (\
>>>> +     SH_CSS_SP_INTERNAL_SERVICE_THREAD +\
>>>> +      SH_CSS_SP_INTERNAL_METADATA_THREAD_2401)
>>>>
>>>>  #define SH_CSS_MAX_PIPELINES SH_CSS_MAX_SP_THREADS
>>>>
>>>> @@ -357,14 +356,12 @@ struct sh_css_sp_debug_command {
>>>>       u32 dma_sw_reg;
>>>>  };
>>>>
>>>> -#if !defined(ISP2401)
>>>>  /* SP input formatter configuration.*/
>>>>  struct sh_css_sp_input_formatter_set {
>>>>       u32                             stream_format;
>>>>       input_formatter_cfg_t   config_a;
>>>>       input_formatter_cfg_t   config_b;
>>>>  };
>>>> -#endif
>>>>
>>>>  #define IA_CSS_MIPI_SIZE_CHECK_MAX_NOF_ENTRIES_PER_PORT (3)
>>>>
>>>> @@ -377,7 +374,7 @@ struct sh_css_sp_config {
>>>>            frames are locked when their EOF event is successfully sent to the
>>>>            host (true) or when they are passed to the preview/video pipe
>>>>            (false). */
>>>> -#if !defined(ISP2401)
>>>> +
>>>>       struct {
>>>>               u8                                      a_changed;
>>>>               u8                                      b_changed;
>>>> @@ -385,15 +382,13 @@ struct sh_css_sp_config {
>>>>               struct sh_css_sp_input_formatter_set
>>>>                       set[SH_CSS_MAX_IF_CONFIGS]; /* CSI-2 port is used as index. */
>>>>       } input_formatter;
>>>> -#endif
>>>> -#if !defined(ISP2401)
>>>> +
>>>>       sync_generator_cfg_t    sync_gen;
>>>>       tpg_cfg_t               tpg;
>>>>       prbs_cfg_t              prbs;
>>>>       input_system_cfg_t      input_circuit;
>>>>       u8                      input_circuit_cfg_changed;
>>>>       u32             mipi_sizes_for_check[N_CSI_PORTS][IA_CSS_MIPI_SIZE_CHECK_MAX_NOF_ENTRIES_PER_PORT];
>>>> -#endif
>>>>       u8                 enable_isys_event_queue;
>>>>       u8                      disable_cont_vf;
>>>>  };
>>>> @@ -409,7 +404,6 @@ enum sh_css_stage_type {
>>>>  #define SH_CSS_PIPE_CONFIG_SAMPLE_PARAMS_MASK \
>>>>       ((SH_CSS_PIPE_CONFIG_SAMPLE_PARAMS << SH_CSS_MAX_SP_THREADS) - 1)
>>>>
>>>> -#if defined(ISP2401)
>>>>  struct sh_css_sp_pipeline_terminal {
>>>>       union {
>>>>               /* Input System 2401 */
>>>> @@ -442,7 +436,6 @@ struct sh_css_sp_pipeline_io_status {
>>>>       u32     running[N_INPUT_SYSTEM_CSI_PORT];       /** configured streams */
>>>>  };
>>>>
>>>> -#endif
>>>>  enum sh_css_port_dir {
>>>>       SH_CSS_PORT_INPUT  = 0,
>>>>       SH_CSS_PORT_OUTPUT  = 1
>>>> @@ -641,10 +634,8 @@ struct sh_css_sp_stage {
>>>>  struct sh_css_sp_group {
>>>>       struct sh_css_sp_config         config;
>>>>       struct sh_css_sp_pipeline       pipe[SH_CSS_MAX_SP_THREADS];
>>>> -#if defined(ISP2401)
>>>>       struct sh_css_sp_pipeline_io    pipe_io[SH_CSS_MAX_SP_THREADS];
>>>>       struct sh_css_sp_pipeline_io_status     pipe_io_status;
>>>> -#endif
>>>>       struct sh_css_sp_debug_command  debug;
>>>>  };
>>>>
>>>> @@ -922,13 +913,11 @@ sh_css_frame_info_set_width(struct ia_css_frame_info *info,
>>>>                           unsigned int width,
>>>>                           unsigned int aligned);
>>>>
>>>> -#if !defined(ISP2401)
>>>>
>>>>  unsigned int
>>>>  sh_css_get_mipi_sizes_for_check(const unsigned int port,
>>>>                               const unsigned int idx);
>>>>
>>>> -#endif
>>>>
>>>>  ia_css_ptr
>>>>  sh_css_store_sp_group_to_ddr(void);
>>>> @@ -971,11 +960,9 @@ sh_css_continuous_is_enabled(uint8_t pipe_num);
>>>>  struct ia_css_pipe *
>>>>  find_pipe_by_num(uint32_t pipe_num);
>>>>
>>>> -#ifdef ISP2401
>>>>  void
>>>>  ia_css_get_crop_offsets(
>>>>      struct ia_css_pipe *pipe,
>>>>      struct ia_css_frame_info *in_frame);
>>>> -#endif
>>>>
>>>>  #endif /* _SH_CSS_INTERNAL_H_ */
>>>
>>>
>>>
>>> Regards,
>>>
>>> Hans
>>>
>>>
>>
>>
>> --
>> BR,
>> Kate
> 
> 
> 

