Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B71A956B5FE
	for <lists+linux-media@lfdr.de>; Fri,  8 Jul 2022 11:54:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237796AbiGHJy0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jul 2022 05:54:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237731AbiGHJyZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Jul 2022 05:54:25 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69FBD823BB
        for <linux-media@vger.kernel.org>; Fri,  8 Jul 2022 02:54:23 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id s204so4949621oif.5
        for <linux-media@vger.kernel.org>; Fri, 08 Jul 2022 02:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vEaJ5po9Za//FEsrnkPxw8yZtxSE9rhk4WCBsPOWM7o=;
        b=IKPynV5CRGV7vLXVINTPyxkKjJie+puMmQK+dPjIBcPew6KRz2RR05MmLQG9MQGwK6
         4lhKjJMDx0RhUt1VGaTH/NQvXq0/hjYiY6MaLRdMInpaOH3E8VXCXBbupYvOBIXXvfcX
         rdHsJPLSGFljCjcLKPVLBv9pO/Vj64ltNtjPloOoU0OT35mWSxBaN4rKPhcT8actbOiI
         H9G2S4h3fz0vfo/q1kc9d/xmS5Bs1U1RHp6iOmFpatIy4ZTpgvXV4LG6mhATxYpO5Zfa
         R4q1vFDGI1WVz6fOL3ckOwlc7NzapmEGuUv67cmI+GSYJIv6CcNcAPdZG/q41zI06Vwf
         59ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vEaJ5po9Za//FEsrnkPxw8yZtxSE9rhk4WCBsPOWM7o=;
        b=BqGNlbUajg8Sid3z+AguXuTHDtdkoxALnPnSeDmEA8qPR3DoDvsGkJ+oTSS1KCovqv
         HPZjQXJCNB46CmkAizz1vz67PG8ZbiNsbSGCCg2cQmUrF1ZRgYv1AFEh+P0Eqt7cXPF1
         ICU/rPAS3DuwMSXQoCQEiVxQNRFaaZ2mlZmybiEt/+EZLKj8EqTKZcu8hZHqnxuvpZNE
         6X704hqmNFq9qJ2iBSynCetvdCobpr5Cv4pkNt4K4uGrKX+6mfU3l8asBnyqm0HP6MpW
         EPTI5xDo1eKCeL4mnEksmGvm3IwG8tXy1EX87XvMJzsZc0av6LWfT8OrgYn+kV1NpF5j
         rg6w==
X-Gm-Message-State: AJIora/kDVXml3wUFd5J8M9Qs/QtqxpnadpX6bmatCs+KvUJTT3UHi1y
        mNS6eR4hRPI8JSaEPWFdPgrGuQ==
X-Google-Smtp-Source: AGRyM1v4wJ7JVr6gpnAq37NLXMjnCZVAR1q0WYYm/dBK+pZJG0d6tLmmRs6CSDsDhSuogKiYR+xGfw==
X-Received: by 2002:a05:6808:eca:b0:2f9:c581:3f76 with SMTP id q10-20020a0568080eca00b002f9c5813f76mr1328601oiv.138.1657274062762;
        Fri, 08 Jul 2022 02:54:22 -0700 (PDT)
Received: from eze-laptop ([186.13.97.246])
        by smtp.gmail.com with ESMTPSA id b11-20020a9d60cb000000b00616dfd2c859sm11916643otk.59.2022.07.08.02.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 02:54:21 -0700 (PDT)
Date:   Fri, 8 Jul 2022 06:54:13 -0300
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc:     mchehab@kernel.org, hverkuil@xs4all.nl, p.zabel@pengutronix.de,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@gmail.com, samuel@sholland.org,
        nicolas.dufresne@collabora.com, andrzej.p@collabora.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        kernel@collabora.com
Subject: Re: [PATCH v11 13/17] media: controls: Log HEVC stateless control in
 .std_log
Message-ID: <Ysf+xcbuIyYy7HIn@eze-laptop>
References: <20220706093803.158810-1-benjamin.gaignard@collabora.com>
 <20220706093803.158810-14-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220706093803.158810-14-benjamin.gaignard@collabora.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jul 06, 2022 at 11:37:59AM +0200, Benjamin Gaignard wrote:
> Simply print the type of the control.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Tested-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

> ---
>  drivers/media/v4l2-core/v4l2-ctrls-core.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> index ff8a61f24d0a..c5c5407584ff 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -307,6 +307,21 @@ static void std_log(const struct v4l2_ctrl *ctrl)
>  	case V4L2_CTRL_TYPE_VP9_FRAME:
>  		pr_cont("VP9_FRAME");
>  		break;
> +	case V4L2_CTRL_TYPE_HEVC_SPS:
> +		pr_cont("HEVC_SPS");
> +		break;
> +	case V4L2_CTRL_TYPE_HEVC_PPS:
> +		pr_cont("HEVC_PPS");
> +		break;
> +	case V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS:
> +		pr_cont("HEVC_SLICE_PARAMS");
> +		break;
> +	case V4L2_CTRL_TYPE_HEVC_SCALING_MATRIX:
> +		pr_cont("HEVC_SCALING_MATRIX");
> +		break;
> +	case V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS:
> +		pr_cont("HEVC_DECODE_PARAMS");
> +		break;
>  	default:
>  		pr_cont("unknown type %d", ctrl->type);
>  		break;
> -- 
> 2.32.0
> 
