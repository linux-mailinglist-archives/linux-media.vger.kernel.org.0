Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 536E56AC07C
	for <lists+linux-media@lfdr.de>; Mon,  6 Mar 2023 14:13:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231153AbjCFNNg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Mar 2023 08:13:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230032AbjCFNNf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Mar 2023 08:13:35 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A57129437
        for <linux-media@vger.kernel.org>; Mon,  6 Mar 2023 05:13:30 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1F72260EEE
        for <linux-media@vger.kernel.org>; Mon,  6 Mar 2023 13:13:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78C40C433D2
        for <linux-media@vger.kernel.org>; Mon,  6 Mar 2023 13:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678108409;
        bh=c1/PkYQJFzuTDFjpkgl5i1HEQUXSgPFfa0wleHHxPtw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=eiGMV00tgURLStN3zlJYKcMsBGN09Ib0QE0oZ5GLbN/jXxFpapceaG+L2yvjF/req
         MPvjeVPF+gf3vxJK8DCFWxWBlcn5a9OrS9+bngkmwzdHvrfpGKCnC5+4dlspbZIujw
         c8nQc4ghWvdlomX42o2F1vtT0oiHpzpczG8mExDjL19eNi1EHGfywEGq6jVNd8oNrP
         orIPK+FPRrWQ6ymPFO02rkjuOoj1SMX80/XVECHPMXG2Ci+agyKrb+0OtkQhhA0jZj
         muZAUCzqdWRfb405bNY4Q4lxxPYAAHrXrzakhgSnyWW7z5oJATnRYDpwHLASqr3RB6
         IW62cZKS/Wa+A==
Received: by mail-pg1-f174.google.com with SMTP id 132so5460647pgh.13
        for <linux-media@vger.kernel.org>; Mon, 06 Mar 2023 05:13:29 -0800 (PST)
X-Gm-Message-State: AO0yUKWlD09MNOTOBRju2pZ5Lc+I4gFA9tH+ryuwRX9z88RQSEoi89pm
        3Hql1iY6TvlSxcuvKZBUEAF2q5tjagXw/cpCjaRrAw==
X-Google-Smtp-Source: AK7set/csFkXt7yaspS+ia4wUJLHYUEqUnkqvAa+fGtX7XlJRt1POR5G7jC9fvxpdTnaBi4LsBGYhkAjjG8mgItZukA=
X-Received: by 2002:a05:6a00:225a:b0:593:c9dd:9069 with SMTP id
 i26-20020a056a00225a00b00593c9dd9069mr4809418pfu.5.1678108409079; Mon, 06 Mar
 2023 05:13:29 -0800 (PST)
MIME-Version: 1.0
References: <20230302155353.3361129-1-bryan.odonoghue@linaro.org>
In-Reply-To: <20230302155353.3361129-1-bryan.odonoghue@linaro.org>
From:   Robert Foss <rfoss@kernel.org>
Date:   Mon, 6 Mar 2023 14:13:17 +0100
X-Gmail-Original-Message-ID: <CAN6tsi6H3X5owut3QvniTs-yt-jRomPxB_vYfrJCKzTbvrja1Q@mail.gmail.com>
Message-ID: <CAN6tsi6H3X5owut3QvniTs-yt-jRomPxB_vYfrJCKzTbvrja1Q@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add myself as CAMSS maintainer
To:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc:     todor.too@gmail.com, andersson@kernel.org,
        konrad.dybcio@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, alex.elder@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Mar 2, 2023 at 5:03=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> I discussed with Robert a few ago lending a hand with CAMSS. Following up
> on that discussion, I'm happy to help.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Robert Foss <rfoss@kernel.org>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 409eadfba007a..ebb0228eb4ea1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17156,6 +17156,7 @@ F:      drivers/net/wwan/qcom_bam_dmux.c
>  QUALCOMM CAMERA SUBSYSTEM DRIVER
>  M:     Robert Foss <rfoss@kernel.org>
>  M:     Todor Tomov <todor.too@gmail.com>
> +M:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>  L:     linux-media@vger.kernel.org
>  S:     Maintained
>  F:     Documentation/admin-guide/media/qcom_camss.rst
> --
> 2.39.2
>
