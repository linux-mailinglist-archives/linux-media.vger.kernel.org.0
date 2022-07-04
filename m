Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1CCD5658AB
	for <lists+linux-media@lfdr.de>; Mon,  4 Jul 2022 16:34:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234125AbiGDOeH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Jul 2022 10:34:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231759AbiGDOeE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Jul 2022 10:34:04 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 988981136
        for <linux-media@vger.kernel.org>; Mon,  4 Jul 2022 07:34:03 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id r18so11934622edb.9
        for <linux-media@vger.kernel.org>; Mon, 04 Jul 2022 07:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XU/si2OudxpMibSqn9Lq87kwtqlJQ7SnogcNrsl/AzA=;
        b=s3JEtG3oAnSlkTIpUvw6vEj9MvtOwSM36hPU7p5U/iuLa3b6fNXdjMkbfEPMWZhDaN
         jMEGBmArVuiaVrm8Lx46W/RlGVi19F8hgWk8dxVw5gwy3yGTyUDAI1Hs+iEaMkSO9b2j
         xzQlzfNeysJAAt/VYnmGqdqelXqUORmtciut3ho3+hkttcgBzEuc888ur+ZZF94Hlpdg
         WdI3bE9G0aWPuAwf7yVThGJ3uppgUzk5i+B/ZmgKRWjlYwLyZg1Yrk+Nw4q0kR4n55If
         H7efuUmbfI06/MqWk24amtyaJlgxmUi/azxOPST1xleLmhaMIQyu+5Y1J5TLMJPyL5QP
         LYug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XU/si2OudxpMibSqn9Lq87kwtqlJQ7SnogcNrsl/AzA=;
        b=m4TAXx6093fHQKUFBu4cvPL2NFhU7rlNJ6ftBtkz6gINk5YmecLd3uTZB8PxeIAci/
         qGQJeaaKMpgWjfZmJ0nuox8synwu92a646sXE2cbEs/7VgeenyLqWCoQOaAuhthWRdNP
         6N+gCis9PgvgdYR49AoD6yqhyY03rLNILf5ARsAoAvQAG7/Kl6MwGJwqa1oSkZv+xUMc
         +JjRA8/wIF4RCmH5ebraNE6EzTxlsWusnFb5oKulYaizLE6Z9opBDL9iPjFHec4g1eco
         wIAKY92lWqaX8x1MC2w38L9eg9Nvkf1M8msAnGXuOgcM/7nBLKtwTKyQeqSuudE/qhPK
         +2eQ==
X-Gm-Message-State: AJIora/yTIi2b308edyvQoX1qSzIt0sYownW2YgNPpJXhQDQQ8hbFqsS
        vO7qGgyMMz47PiX2rBmMLM//kiIia139XdGQaz8Q7IpcCC6pMw==
X-Google-Smtp-Source: AGRyM1sU+Y9dvWotDYGXP/0592qT4wzBpkL3CvYygXrxfJoDl4SvJKYJ07VrM7r4EGGqL2jdL80dhFXvm35WO9uZAMs=
X-Received: by 2002:a05:6402:2789:b0:435:ac82:e8c3 with SMTP id
 b9-20020a056402278900b00435ac82e8c3mr39093288ede.250.1656945242166; Mon, 04
 Jul 2022 07:34:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220704094437.468395-1-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20220704094437.468395-1-vladimir.zapolskiy@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Mon, 4 Jul 2022 16:33:50 +0200
Message-ID: <CAG3jFyvD+0Q4sYWZ69sF8AG+mQ5Ytjj+ND9-Hi4ZjzWN-Vq+Ng@mail.gmail.com>
Subject: Re: [PATCH] media: camss: Clean up received buffers on failed start
 of streaming
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Todor Tomov <todor.too@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 4 Jul 2022 at 11:44, Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> It is required to return the received buffers, if streaming can not be
> started. For instance media_pipeline_start() may fail with EPIPE, if
> a link validation between entities is not passed, and in such a case
> a user gets a kernel warning:
>
>   WARNING: CPU: 1 PID: 520 at drivers/media/common/videobuf2/videobuf2-core.c:1592 vb2_start_streaming+0xec/0x160
>   <snip>
>   Call trace:
>    vb2_start_streaming+0xec/0x160
>    vb2_core_streamon+0x9c/0x1a0
>    vb2_ioctl_streamon+0x68/0xbc
>    v4l_streamon+0x30/0x3c
>    __video_do_ioctl+0x184/0x3e0
>    video_usercopy+0x37c/0x7b0
>    video_ioctl2+0x24/0x40
>    v4l2_ioctl+0x4c/0x70
>
> The fix is to correct the error path in video_start_streaming() of camss.
>
> Fixes: 0ac2586c410f ("media: camss: Add files which handle the video device nodes")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  drivers/media/platform/qcom/camss/camss-video.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
> index b5f12ec5c50c..d272ffa02112 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -495,7 +495,7 @@ static int video_start_streaming(struct vb2_queue *q, unsigned int count)
>
>         ret = media_pipeline_start(&vdev->entity, &video->pipe);
>         if (ret < 0)
> -               return ret;
> +               goto flush_buffers;
>
>         ret = video_check_format(video);
>         if (ret < 0)
> @@ -524,6 +524,7 @@ static int video_start_streaming(struct vb2_queue *q, unsigned int count)
>  error:
>         media_pipeline_stop(&vdev->entity);
>
> +flush_buffers:
>         video->ops->flush_buffers(video, VB2_BUF_STATE_QUEUED);
>
>         return ret;
> --
> 2.33.0
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
