Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0681F75EA4B
	for <lists+linux-media@lfdr.de>; Mon, 24 Jul 2023 05:57:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230091AbjGXD50 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 23 Jul 2023 23:57:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbjGXD5Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 23 Jul 2023 23:57:25 -0400
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BA27D7
        for <linux-media@vger.kernel.org>; Sun, 23 Jul 2023 20:57:24 -0700 (PDT)
Received: by mail-vs1-xe2f.google.com with SMTP id ada2fe7eead31-4468a772490so1255531137.3
        for <linux-media@vger.kernel.org>; Sun, 23 Jul 2023 20:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690171043; x=1690775843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QQbqZRXyNeXO694NDt6W+s9kvzU+RJfmV4lzyl4Jhqs=;
        b=XLmN1dlVY3fLlD6jnXs352zFCU3oKs7vlPkwIhhKW8f16684rNtuKRsSAM1fCHGPfN
         gyu1wfaknQcbUBnOMpy2weNVBrWUt5Qwy0hXGCZNz0EULp2vEz+OdDVsGWrepfabMqxd
         9bOzvxXI8rgO06FWS/q7zDHlVfLdWcu6piVzA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690171043; x=1690775843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QQbqZRXyNeXO694NDt6W+s9kvzU+RJfmV4lzyl4Jhqs=;
        b=k2vs/7kSnoRXwl5pR/Aw6jWNOe3VDxMcECxEuYGuDGhPs3xF9Imr8Kqn9p1vK/EqGx
         HRibWIwjI18m/sGi8mtp+GGNMMF5Mqj4hpJhhe5+9WBu8xUcmyiopPMmaHURhmrO/Ucu
         oPAi0HVsDMqyV7SsPIgUJhm8HakAnPDKzh78TLmy29qBwJ3JyLLwYijUk8AolhIZHCUq
         t5Y2N3DsoishqQ2GeZU6XzAUlQh5rr396jpU10R0u9E4/Hka+G8Rg8u3lnTebRmH/WxQ
         v1uBRSRSNnLuKFHbuUV33eXYjwZYaMHVaNewcNDtniXBWFJTBrEonCp2Yn/Hle9tOJvt
         YUvA==
X-Gm-Message-State: ABy/qLZoSbXYH4gfNq2X0CII8Ro+lfPlnJKQ1DpSlB8lhCDMX51T/jm8
        1mJ0n2OYdj0aX9WEHrx6LTYHC/iAwtqpkzOsjqxZ2w==
X-Google-Smtp-Source: APBJJlHJESV0bemNAIaRlOmqqeCNR1rjLB2zvGMtMD3yvcm77xPhy6bCASb2JOcjUhV2HhqffNo/Eb9ytArDywdtzyQ=
X-Received: by 2002:a67:e21a:0:b0:443:6052:43ac with SMTP id
 g26-20020a67e21a000000b00443605243acmr1774610vsa.30.1690171043624; Sun, 23
 Jul 2023 20:57:23 -0700 (PDT)
MIME-Version: 1.0
References: <540fbe91-5dc4-1c75-379d-1ff89669ba96@xs4all.nl>
In-Reply-To: <540fbe91-5dc4-1c75-379d-1ff89669ba96@xs4all.nl>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 24 Jul 2023 11:57:12 +0800
Message-ID: <CAGXv+5EGpNTgp-cjmmdCfYps-y_7ycjwaGWCrGrBEA5=dfKvVQ@mail.gmail.com>
Subject: Re: [GIT PULL FOR v6.6] Various codec fixes/enhancements
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Juerg Haefliger <juergh@gmail.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Ming Qian <ming.qian@nxp.com>, Zheng Wang <zyytlz.wz@163.com>,
        Emma Christy <emma.t.christy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Fri, Jul 21, 2023 at 7:04=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl> w=
rote:
>
> The following changes since commit 28999781d15f94046e6c23a9a7d92ad28a436a=
bf:
>
>   media: i2c: ov01a10: Switch back to use struct i2c_driver::probe (2023-=
07-19 12:57:51 +0200)
>
> are available in the Git repository at:
>
>   git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.6e
>
> for you to fetch changes up to 9c2d629e7ea3d5c5d5c1203b3aaa9807053d0c7d:
>
>   media: amphion: ensure the bitops don't cross boundaries (2023-07-21 12=
:27:38 +0200)
>
> ----------------------------------------------------------------
> Tag branch
>
> ----------------------------------------------------------------
> Benjamin Gaignard (1):
>       media: rkvdec: increase max supported height for H.264
>
> Chen-Yu Tsai (1):
>       media: mtk-jpeg: Set platform driver data earlier

This really needs to be merged for v6.5, as I mentioned in the footer.

ChenYu
