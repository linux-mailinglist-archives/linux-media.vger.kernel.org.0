Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5671640EBF
	for <lists+linux-media@lfdr.de>; Fri,  2 Dec 2022 20:48:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234838AbiLBTs4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Dec 2022 14:48:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234425AbiLBTsy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Dec 2022 14:48:54 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5777EF0F8
        for <linux-media@vger.kernel.org>; Fri,  2 Dec 2022 11:48:50 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id b3so8931163lfv.2
        for <linux-media@vger.kernel.org>; Fri, 02 Dec 2022 11:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LKRU6k6DP3+MoWkZKc6pR9Fxw8QPzYqEpMkErX9J1aI=;
        b=TJt+az+6QemYlHALrKlPXXwpeSk5LEevUf1/CUYcJbogqyVJzzaOv91evf3XQpLFAN
         wwFNcx6fxAuP8V1JJ4TYXKKIH8/H7lGHVWLSuizBUqOOwmy6NyMQc1DzDQJNQag93Fw8
         nrXx+l3XHCoJMEyWcllJ7Gx1ydav3UU0pLH0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LKRU6k6DP3+MoWkZKc6pR9Fxw8QPzYqEpMkErX9J1aI=;
        b=sWI2g7Po5k3vD2ppyCGfb6mOpl/5KeN0KeUKQHDDEGmkQVrDX0+VAG8SzWiRBcN85n
         SFWL27irfwJHOPYjVfpZF0K18aDqqdS1a6pxjG222/k0sYiRZFt6rb4CtidF1eIiIeBY
         3/IBlKSmBy/QwilPduk7YUGKP57AiUObK3VLEO773O8mcURnkn/apKRq1OSL/iCnSLkJ
         as5ZC/6hI2e7DdwfiKbagGYRDZrExvFQ13e1+dQoDKB499EAnEEZsHek4UEg/0o0O3lV
         t5bl0yewl5jCKUTpntGU54B98T8xFG5ZYzuRT0SwG0nvtleFq476CFsG3UhogQ7iSMQO
         /bpA==
X-Gm-Message-State: ANoB5pkWB41DVHpBgCgwYmFvfhTsQuyVCC+N/oFArGFTj2rU/iOnMGJC
        p5Ztqy179xFT/YEoogQNtrHrzX7n8ujQ7S61l4d2OA==
X-Google-Smtp-Source: AA0mqf7vWuXOietesbVcX1O+qubMF7A+WQ/MIHQ9UUxKQTH3AwZtVv3L8yaDU8p4H2poYaZEVGkXkn1HTBR+uXhkT4U=
X-Received: by 2002:a05:6512:a83:b0:4aa:f944:f7ec with SMTP id
 m3-20020a0565120a8300b004aaf944f7ecmr19927828lfu.467.1670010529136; Fri, 02
 Dec 2022 11:48:49 -0800 (PST)
MIME-Version: 1.0
References: <20221115121004.28197-1-quic_vboma@quicinc.com>
 <20221115121004.28197-2-quic_vboma@quicinc.com> <CANHAJhEH7qTjaVaMWk3MeuhYMnwt1qTUSKxAZ_XTfxPJObC=nQ@mail.gmail.com>
In-Reply-To: <CANHAJhEH7qTjaVaMWk3MeuhYMnwt1qTUSKxAZ_XTfxPJObC=nQ@mail.gmail.com>
From:   Nathan Hebert <nhebert@chromium.org>
Date:   Fri, 2 Dec 2022 11:48:37 -0800
Message-ID: <CANHAJhENA5ssFBBDeqfDyC8v_CwZhpiJC93B1HZnL4K+N3N35A@mail.gmail.com>
Subject: Re: [PATCH 1/1] venus : Fix for H265 decoding failure.
To:     quic_vboma@quicinc.com
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vikash Garodia <vgarodia@qti.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Dec 1, 2022 at 4:12 PM Nathan Hebert <nhebert@chromium.org> wrote:
>
> On Tue, Nov 15, 2022 at 4:10 AM <quic_vboma@quicinc.com> wrote:
> >
> > From: Viswanath Boma <quic_vboma@quicinc.com>
> >
> > Aligned the mismatch of persist1 and scratch1 buffer calculation,
> > as per the firmware requirements .
> >
> > Signed-off-by: Vikash Garodia <vgarodia@qti.qualcomm.com>
> > Signed-off-by: Viswanath Boma <quic_vboma@quicinc.com>
> > ---
> >  drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c b/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
> > index ea25c451222b..a9be31ec6927 100644
> > --- a/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
> > +++ b/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
> > @@ -93,7 +93,7 @@
> >  #define LCU_MIN_SIZE_PELS              16
> >  #define SIZE_SEI_USERDATA              4096
> >
> > -#define H265D_MAX_SLICE                        600
> > +#define H265D_MAX_SLICE                        3600
> >  #define SIZE_H265D_HW_PIC_T            SIZE_H264D_HW_PIC_T
> >  #define SIZE_H265D_BSE_CMD_PER_BUF     (16 * sizeof(u32))
> >  #define SIZE_H265D_VPP_CMD_PER_BUF     256
> > @@ -1021,7 +1021,7 @@ static u32 h264d_persist1_size(void)
> >  static u32 h265d_persist1_size(void)
> >  {
> >         return ALIGN((SIZE_SLIST_BUF_H265 * NUM_SLIST_BUF_H265 + H265_NUM_TILE
> > -                       * sizeof(u32)), HFI_DMA_ALIGNMENT);
> > +                       * sizeof(u32) + NUM_HW_PIC_BUF * SIZE_SEI_USERDATA), HFI_DMA_ALIGNMENT);
> >  }
> >
> >  static u32 vp8d_persist1_size(void)
> > --
> > 2.17.1
> >
> Hi Viswanath. I tested this patch on ChromiumOS's downstream
> 5.15-based fork. Using ITU-T HEVC test vectors [0] I am seeing
> firmware errors "qcom-venus-decoder aa00000.video-codec:video-decoder:
> VenusMed : event not sufficient resources". Does this change fix HEVC
> decoding for you?
>

Hi Viswanath. Thanks for looking at the logs offline. I re-tested
after adding Q08C (UBWC) support to my decoder client, and it fixed
the error that I was seeing. My mistake. Each of the main profile test
vectors now decodes correctly after applying your patch!

Tested-by: Nathan Hebert <nhebert@chromium.org>

> [0]: https://www.itu.int/wftp3/av-arch/jctvc-site/bitstream_exchange/draft_conformance/HEVC_v1/
>
> Best regards,
> Nathan Hebert
