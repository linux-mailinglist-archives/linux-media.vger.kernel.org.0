Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEBB35AF6E7
	for <lists+linux-media@lfdr.de>; Tue,  6 Sep 2022 23:36:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbiIFVgo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Sep 2022 17:36:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbiIFVgn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Sep 2022 17:36:43 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9A909E12F
        for <linux-media@vger.kernel.org>; Tue,  6 Sep 2022 14:36:42 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id q39-20020a056830442700b0063889adc0ddso8970495otv.1
        for <linux-media@vger.kernel.org>; Tue, 06 Sep 2022 14:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ridgerun-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date;
        bh=2rlKOlaADvn0av3XecM4/PGiqccU4rutLinsj1PGjOo=;
        b=WDPWhIaTNUGiUJcXMgqeeotp8gZx0VaFT+bG4ZdkoaPO4G/XDezhAOwGcJQHL13jqu
         +HI/lPnwwWC09G/ezIWUNj37JHP40PYtugMqR0ouLMe6FRwYSR+HIKwowAW6nTwTIS70
         nUhyN78KyHPAR6XAY5nqRKTxM/zfPthvoYkAamApHFnx0v2wuN49nqeTLiMaKueUam4j
         G32Jdu/QeMSiYbhRwCu891A10ROvzYlD4h08HH9Tu2GVcwouF9LJ0tVwcT+YCEZ65D3a
         kGwQItCWKGpPmF5tCrkUlwZaEHUPUJgsYROHQudrPkXmg0dASRI6rqJo9MzPPF+PWMAP
         BeAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=2rlKOlaADvn0av3XecM4/PGiqccU4rutLinsj1PGjOo=;
        b=6b/5ajSMtpq+A4MLrAmEWOsUg5oKHZABrTG8kEnshLL8LTtXeP+GXMsk4pLE3Etd31
         BZO3RzNQnnpVYge5hC4Mg5d6aipafDtYwcn8WBpOGkg9sY4IpkXHtH6zPN4oS5TMFl7M
         QTyDRrj1fNCsVLDVVJKMok1ZpOvR9jb3OaoskuvuhSKVRZBqQYBxboFat4VYZobtQVTy
         vpFuPh2enMyhJG+CR42Z5TA9zsy0ZRVkcsPiKndcZT3sh0iGK1E1o1W3TOGJEX4165d7
         9JpUlmbde1I9W0PXXUagzzB1s86gFtfZrM+jQGUOIBrg0vILRLFPJlShjVBUpGfDhP4g
         Um+w==
X-Gm-Message-State: ACgBeo17b8KGNXgle2uwMEwLsJrphvD0FzflNZkr8u+vtcMbLLWulNMu
        29XevCDBMMVU4Y1vmJfGAnPF8jp99ypetHl0gnjzpx3FmHtL66K/
X-Google-Smtp-Source: AA6agR7Qg1rGTyvVAwopo5cyAMhm1jIT0Yi2qM4xHevWlxBCHyuZ8AkYKkqcCFtjun5tenoKpKx5UdXOTY6Zxl0LqXY=
X-Received: by 2002:a9d:5a95:0:b0:638:977a:9d92 with SMTP id
 w21-20020a9d5a95000000b00638977a9d92mr221477oth.56.1662500201622; Tue, 06 Sep
 2022 14:36:41 -0700 (PDT)
MIME-Version: 1.0
From:   Roberto Gutierrez <roberto.gutierrez@ridgerun.com>
Date:   Tue, 6 Sep 2022 15:36:30 -0600
Message-ID: <CAG5nts=0TJ3npNE8TOWeNBHfVmXvug+5P7pQnnj819YRsSy8YA@mail.gmail.com>
Subject: [Support query] Using CMEM and Scatter Gather in composite driver
 with UVC
To:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

I have been working on supporting a composite builtin driver with UVC
using a dwc3 USB controller. At userspace I am using userptr in order
to push the buffers to the driver. Currently we are working with
scatter gather support from the videobuf2-dma-sg API, this in order to
avoid unnecessary copies that are normally used in the memcpy of
uvc_video_encode_data function inside uvc_video.c, and using
uvc_video_encode_isoc_sg instead. Everything works fine when we are
using memory coming from a malloc at userspace, but when we use the
CMEM allocated memory pointers we are getting the following error when
queueing the buffers:

Cannot allocate memory (12).

I managed to track down the issue up until the vb2_dma_sg_get_userptr
function from the videobuf2-dma-sg API, and I see that we are failing
at creating the vector of pages thus failing to create the scatterlist
for the buffer. I tried to workaround this by creating a manual
scatterlist with a mapped memory vaddr taking inspiration on how the
videobuf2-vmalloc API works (it is important to mention this works for
the CMEM pointers, but doing the memcpy), by doing this inside the
vb2_dma_sg_get_userptr function:

unsigned long *nums =3D frame_vector_pfns(vec);
buf->vaddr =3D (__force void *)
    ioremap(__pfn_to_phys(nums[0]), size + offset);
buf->num_pages =3D 1;
sg_alloc_table(buf->dma_sgt, buf->num_pages, GFP_KERNEL);
sgt =3D buf->dma_sgt;
for_each_sgtable_sg(sgt, sg, i) {
    sg_set_buf(sg, (void *)(buf->vaddr), size+offset);
}

The problem is, the buffers we are receiving at the host are
corrupted, which lets me think that we are probably reading from
another memory that has no relation with the CMEM pointer memory.

In summary, this is the current situation we have and the CMEM_alloc +
videobuf2-dma-sg  is the desired one that is not working.

  allocation \ mem ops    videobuf2-vmalloc    videobuf2-dma-sg
 -----------------------               --------------------
-------------------
  malloc                                  working              working
  CMEM_alloc                        working              not working


My question here is: Is this approach correct? Or are we trying to do
something that doesn't have support? Is there another correct way that
we should be trying in order to send the CMEM buffers without doing
any memory copy at all? As of right now, the UVC functions only
support doing the memcpy or using the scatterlist, which is why we are
using the second one. Any thoughts or insight will be very
appreciated.

Thank you in advance,

--=20

Roberto Gutierrez S=C3=A1nchez
Computer Engineer
Embedded Software Developer
RidgeRun Embedded Solutions
