Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60A16571A1B
	for <lists+linux-media@lfdr.de>; Tue, 12 Jul 2022 14:35:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232803AbiGLMfi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jul 2022 08:35:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233210AbiGLMfd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jul 2022 08:35:33 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBF8D8AB32
        for <linux-media@vger.kernel.org>; Tue, 12 Jul 2022 05:35:30 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id s206so7438268pgs.3
        for <linux-media@vger.kernel.org>; Tue, 12 Jul 2022 05:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wq+tRz/z60AyYxjlzSCjqpr8slf2ieYOF7qhQfnM49w=;
        b=H7aoz2BpPuEiEjmhyWBfJsMEhSVEJ/rTVYib1b7q9DOiC4teWsd+G6HwpyuShZ1F/q
         rP1sNegFzzkgJkGZkZUmdTXqgltyvjaVd7NH2nhGMv1CjPgXPn4A+yDUs83MZmL1Re+j
         L9DYd/aJLVzQKy1RHs3Frol6AIvAKdAwu562xBeTU1OLiYQBs0a1PDTMC+auuGR9Zezi
         cm3Tac4itdtGJFqYNO0wxu71eCNaeGjwJPanP3fzNbtz8UuG6AYtBcwG1H5VCiYReFg5
         ZeX5jxDW7OR6k9mw97GR6j/ZKmI2j9UQhGAF2EdtUpNZOdirIg6poUvwhGQYECPCG4qW
         lFyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wq+tRz/z60AyYxjlzSCjqpr8slf2ieYOF7qhQfnM49w=;
        b=mjF9daHuyj3QTpDAaTX8eeVdMr3n4jXlG03i9US1iYt2tHDPyhUaa/AEtP0ixqeXNU
         blCeF/EO2l8F6vBN3RSOIermW20UeYwEiYo7wvQPomYbuVXjsg1FfeELdcsGgDtKOKyn
         bB+2y2X4v43N96AbBLl03CWFHWu7Bf193EXN25x20b4DgU2viqKTZ3e1JwSdaFRNbX0P
         lPCmro3sZ+ydQNZrD7cxmCZgSbeoEOebUv5t6i5dXdObI2toTRvMgf5F0vTALl4XtXEk
         30NZbr9C8HL1gCF78AojhczdVvP8UpLFcvBArBJwtiHirLYWOoMHh2wXrctsQzbA1obw
         KF7Q==
X-Gm-Message-State: AJIora9Kd68y78T1iVa5QIKs6iNTwpAif88k26ql5YGXJctyz035gLvk
        GT1GQUOsWoOF9tdyJuX/nDaI
X-Google-Smtp-Source: AGRyM1sNZHFIMY4Dzq9RBL0SS7eXXoxMnPCyucvyemVSa8WvgtCAFI+9AQjDuC4cCaXKbC3U0nM6pw==
X-Received: by 2002:a63:560d:0:b0:419:759a:6653 with SMTP id k13-20020a63560d000000b00419759a6653mr1280622pgb.219.1657629330227;
        Tue, 12 Jul 2022 05:35:30 -0700 (PDT)
Received: from workstation ([117.207.31.14])
        by smtp.gmail.com with ESMTPSA id k8-20020a170902c40800b00163ffbc4f74sm6802074plk.49.2022.07.12.05.35.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jul 2022 05:35:29 -0700 (PDT)
Date:   Tue, 12 Jul 2022 18:05:23 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Viswanath Boma <quic_vboma@quicinc.com>
Cc:     video.upstream.external@qti.qualcomm.com,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] venus : Add default values for the control
 V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY
Message-ID: <20220712123523.GB21746@workstation>
References: <20220712122347.6781-1-quic_vboma@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220712122347.6781-1-quic_vboma@quicinc.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 12, 2022 at 05:53:41PM +0530, Viswanath Boma wrote:
> From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> 
>  V4l2 encoder compliance expecting default values of colormetry for the control.
> 
> Change-Id: I1db0d4940b54e033d646ce39d60dc488afba8d58

What does this represent here? I'm pretty sure it is meaningless to the
upstream kernel, so please get rid of it.

> Signed-off-by: Viswanath Boma <quic_vboma@quicinc.com>

Since Stan is the original author of this and following patches, there
should be a s-o-b tag from him. After that you should add yours
indicating that you are carrying the patches from Stan.

Also, please add a cover letter stating the purpose of this series, how
it is tested, and with any other relevant information.

Thanks,
Mani

> ---
>  drivers/media/platform/qcom/venus/venc_ctrls.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
> index ea5805e71c143..37ba7d97f99b2 100644
> --- a/drivers/media/platform/qcom/venus/venc_ctrls.c
> +++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
> @@ -352,6 +352,8 @@ static const struct v4l2_ctrl_ops venc_ctrl_ops = {
>  int venc_ctrl_init(struct venus_inst *inst)
>  {
>  	int ret;
> +	struct v4l2_ctrl_hdr10_mastering_display p_hdr10_mastering = { {34000, 13250, 7500 },
> +	{ 16000, 34500, 3000 }, 15635,	16450, 10000000, 500 };
>  
>  	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 58);
>  	if (ret)
> @@ -580,7 +582,7 @@ int venc_ctrl_init(struct venus_inst *inst)
>  
>  	v4l2_ctrl_new_std_compound(&inst->ctrl_handler, &venc_ctrl_ops,
>  				   V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY,
> -				   v4l2_ctrl_ptr_create(NULL));
> +				   v4l2_ctrl_ptr_create((void *)&p_hdr10_mastering));
>  
>  	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
>  			  V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD, 0,
> -- 
> 2.17.1
> 
