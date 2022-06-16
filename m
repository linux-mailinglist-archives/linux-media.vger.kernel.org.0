Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84BA754E986
	for <lists+linux-media@lfdr.de>; Thu, 16 Jun 2022 20:37:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377907AbiFPShn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jun 2022 14:37:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377818AbiFPShm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jun 2022 14:37:42 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C8D21182C
        for <linux-media@vger.kernel.org>; Thu, 16 Jun 2022 11:37:40 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id c24-20020a9d4818000000b0060c2372addeso1560894otf.11
        for <linux-media@vger.kernel.org>; Thu, 16 Jun 2022 11:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=Gyeh6+oF0wR2A8D9gteJMzDupQH8pClsR5n0gdKcTuw=;
        b=bmqTBNe7SOkMiKyUy7Hq86s5vhvrso+wDRUZ36RwT8cAxve2005wFK/t2/StVNKk9k
         FOwSnKAdvN8QRtxNFGYs9MbocxLvXNCQee5uUVbkq6mz7FR9LZXkGr/+w7BzdzM6dKQC
         uDO8dctrJ2DHRvQeNJahClCpIP2fuaQD8+amA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=Gyeh6+oF0wR2A8D9gteJMzDupQH8pClsR5n0gdKcTuw=;
        b=tdRt6Pt3fKLs4YbBlZyy0rOyK1Bql3tTKuo9B2vws5v7FJof+/ymVS6DRdqiQpf8nm
         oKKdT9AQxM6664mJlx03EhqAqp8BJvIM29SxyEjEKE56xRXB0qM+rphoCV5XR5f9GCK2
         Jr+E4as44fKx4TgAb8wtkYiN+ru16EgkGS6/RXlScFU32tKwL67M+Y6CKZTP5nw5mbl9
         tnQfrO+vD6jx76cJKt5CSnON9v4E0WnouDj8x7kcSg7YMKz1se8sRPPJ9miaEDZWYKcH
         NlXCnsF/S/n8aXXeHPxa/kCIyXArnS+2SxvaGJY5VoF2Bo0dyLK274Af/C8FO9JvcxYw
         Fo4A==
X-Gm-Message-State: AJIora/I5zja4K2pwgcAm+rBDT05is9tlIQqHQR2dcl6BipuMnPsi8bF
        Wj76JRmqW9PR0gdWD8cWKyyVc8M8bZHRlpqzc9RtCw==
X-Google-Smtp-Source: AGRyM1v+zFEDXY7aNOdc2woZwdDGQ0jThxr/SjZX3lUe2B0CEOAqhz5l6k9p92Pxn/IKmK5+MumPaokBfRzpOYOtipA=
X-Received: by 2002:a9d:6484:0:b0:60b:eb0b:4054 with SMTP id
 g4-20020a9d6484000000b0060beb0b4054mr2536734otl.159.1655404659632; Thu, 16
 Jun 2022 11:37:39 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Jun 2022 11:37:39 -0700
MIME-Version: 1.0
In-Reply-To: <1655377322-14195-1-git-send-email-quic_dikshita@quicinc.com>
References: <1655377322-14195-1-git-send-email-quic_dikshita@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 16 Jun 2022 11:37:39 -0700
Message-ID: <CAE-0n51HOy84c9osif0wXd90c5D_MQZ=9sa1g93iZHG3mWxREA@mail.gmail.com>
Subject: Re: [PATCH v3] venus: Add support for SSR trigger using fault injection
To:     Dikshita Agarwal <quic_dikshita@quicinc.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, stanimir.varbanov@linaro.org,
        quic_vgarodia@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Dikshita Agarwal (2022-06-16 04:02:02)
> Here we introduce a new fault injection for SSR trigger.
>
> To trigger the SSR:
>  echo 100 >  /sys/kernel/debug/venus/fail_ssr/probability
>  echo 1 >  /sys/kernel/debug/venus/fail_ssr/times
>
> Co-developed-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>

This line should come last and the 's' should be capitalized.

> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---

Code looks good

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
