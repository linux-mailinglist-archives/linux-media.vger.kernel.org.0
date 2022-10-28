Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F330611799
	for <lists+linux-media@lfdr.de>; Fri, 28 Oct 2022 18:36:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229460AbiJ1Qf1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Oct 2022 12:35:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbiJ1QfL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Oct 2022 12:35:11 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6866736098
        for <linux-media@vger.kernel.org>; Fri, 28 Oct 2022 09:35:08 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id d25so8734028lfb.7
        for <linux-media@vger.kernel.org>; Fri, 28 Oct 2022 09:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dDdem09UvQC6RtPh9eP/fPIosZi0f2DCCtFcOfni9E0=;
        b=iVRKB99bCuGg75YHK5Jin6eKXNVe9XeG9Wu8TuxvOpZO8X9g0HtdOKXe+lJnotbapy
         yY1d/TS43YunRmZBAdM4kiS1Sb8vvY1JzgsNRODuo9qg+niv7CXg1LdbK/MFiVHVTCVh
         uZZlAnEomqAMCPuV5LXMWtWwirMKSIYACBgbeq/QvJ2NTjC6iw3aocNENCpW3yfSF+VF
         h4Np4qcUKUFrsMntcE0udkLz1iH8nhF4d+Vl8ryBfkZ1woIlFqAplaVWyTnQlJUeIlwr
         w9vUx8zv8jyRRFHooTylzter5G7/0iRYvFvfCgrWmJ1KX4Ui/6vhhI2pxLyUISlF4kgT
         PF/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dDdem09UvQC6RtPh9eP/fPIosZi0f2DCCtFcOfni9E0=;
        b=2oBm88lhnXwNqpHb/F7NE1FwWMaSZKXYU5EP6qqViTn6q4xh0ZVUp8jKIE63UgbCsd
         izxFSeMu/iRmLGOTmc7j4hmd7HpaMEqYba+kc0tfPOxsnEQzXAIZHNBpxUtNHqKpAuOn
         fLU5YhrqffqIUWN6ghmFe2xRSOXD8vpC2TA5GimxFzSQ0zQFMpab6r1cLV10/tUkXF85
         kTui4X8cJa4uorRpdP8K2VqyUzAEadC4vh9iJKEzIzXF8gQcYkXuaSb2sx07tds9JJmm
         LwwdlheGXcZeG2bkXdVFcXYi2Eo2sJKIYzhf8TVIFhvzJgLTqyMUBM4LSX2vI0y1zZS7
         XfdQ==
X-Gm-Message-State: ACrzQf1om0VCiy14w5uI+yJLseWWkgi4o/x+hDnCRWe1Fixfir53feNk
        aH8Z/6jHozqil60tmU+oOwgxkxtO8rq0EKewCF1q
X-Google-Smtp-Source: AMsMyM4GCKg+Wc/lMbvqmo5qiLQjfqMXoXH+QadR3RXEfZMfTqJByvQ611ruQrIRULNKM67OA8DPiAstRGkRDG9JZno=
X-Received: by 2002:a05:6512:2616:b0:4a2:1723:cf40 with SMTP id
 bt22-20020a056512261600b004a21723cf40mr80364lfb.354.1666974906701; Fri, 28
 Oct 2022 09:35:06 -0700 (PDT)
MIME-Version: 1.0
References: <20221028065533.23856-1-mark-pk.tsai@mediatek.com>
In-Reply-To: <20221028065533.23856-1-mark-pk.tsai@mediatek.com>
From:   John Stultz <jstultz@google.com>
Date:   Fri, 28 Oct 2022 09:34:55 -0700
Message-ID: <CANDhNCpWcfMfXKHU7rHSUXd8e0JcAnD+qJABWCs9rWTC_J3h6g@mail.gmail.com>
Subject: Re: [PATCH v3] dma-buf: cma_heap: Remove duplicated 'by' in comment
To:     Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@redhat.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        yj.chiang@mediatek.com, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 27, 2022 at 11:55 PM Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:
>
> Remove duplicated 'by' from comment in cma_heap_allocate().
>
> Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>

Thanks for sending this and going through a few iterations!

Acked-by: John Stultz <jstultz@google.com>

-john
