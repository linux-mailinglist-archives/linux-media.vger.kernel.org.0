Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C19A767616
	for <lists+linux-media@lfdr.de>; Fri, 28 Jul 2023 21:13:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230409AbjG1TNE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jul 2023 15:13:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229977AbjG1TND (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jul 2023 15:13:03 -0400
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B6EB3588
        for <linux-media@vger.kernel.org>; Fri, 28 Jul 2023 12:13:02 -0700 (PDT)
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-348f5193c12so8561015ab.2
        for <linux-media@vger.kernel.org>; Fri, 28 Jul 2023 12:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690571581; x=1691176381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T0cSKCDsFec9jKF2AJ3nQ86wH77574GnfwY7SlwGKHo=;
        b=MPg+sN7VWGdi6B95aY+IzD+qUtm9q2ELjcef4VPjTXa8Rk4gaJWNAnoZPhubyvFaKY
         u9EqqfvVuM0c8Lu2oVcbmaJp19N8892/bv5GOGu9emHbiAfGxipCuk1KxZlsexrcoArG
         pNI80wRAxIATsKIkVtQJgqKJN+t0OwOWuB47Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690571581; x=1691176381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T0cSKCDsFec9jKF2AJ3nQ86wH77574GnfwY7SlwGKHo=;
        b=UEEYCxVaqVKqlQB83M/vdKyYkK+fCKylk4hYqz3wJVlyl9gaJInSmYjVus9+nLY5Rl
         USosRgD3C4/J7PzQjv+GE+V0lk+kFzrQ7kpKrE5QOO5qGFaGnMU35rhXzlM6V7P5HqAb
         xRwNmbDvwaU5Exvnr1plk88zjvwXnCy2hgjJREKfQUJcXqGNlYU59HSiZ6INl8264nRl
         d0Uwn/ezEuwjws5k5M2PNxMTgQ06bZ1y1PyqGJ9rrdr1yHFvlvBv8i0lPUdWPgA/d28c
         +qfO8SHL5pVkOJ8ooZlY+tKbWAteOOs3bqZ7LULBG6N1iVwUPZr25Vtfx0giDAiQ2efC
         8HiQ==
X-Gm-Message-State: ABy/qLbHFynh6kvAfVtjCqJY4TyO8LfKo7GFXbxiyPLYVm+PIWZ1tZT0
        MjmMk7hw7liWUGMc2FBe1tsJnD9aTgcM9Bi9JEtnIA==
X-Google-Smtp-Source: APBJJlFlsvP5vNrHkLf6/gTIb7z8HrEClm/PeQ2X7vaKRhyl882D6829LPVg7T7J3o6TRA6KMMJk9IenW7jecPztm5A=
X-Received: by 2002:a05:6e02:20ee:b0:349:191:af05 with SMTP id
 q14-20020a056e0220ee00b003490191af05mr516334ilv.16.1690571581582; Fri, 28 Jul
 2023 12:13:01 -0700 (PDT)
MIME-Version: 1.0
References: <1690432469-14803-1-git-send-email-quic_vgarodia@quicinc.com> <1690432469-14803-3-git-send-email-quic_vgarodia@quicinc.com>
In-Reply-To: <1690432469-14803-3-git-send-email-quic_vgarodia@quicinc.com>
From:   Nathan Hebert <nhebert@chromium.org>
Date:   Fri, 28 Jul 2023 12:12:50 -0700
Message-ID: <CANHAJhFhT1EAL1hE7FdZU9sgxaaGoSjPar4ruEEhfz8Qa1YRwg@mail.gmail.com>
Subject: Re: [PATCH 2/4] venus: hfi: fix the check to handle session buffer requirement
To:     Vikash Garodia <quic_vgarodia@quicinc.com>
Cc:     stanimir.k.varbanov@gmail.com, bryan.odonoghue@linaro.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mchehab@kernel.org, hans.verkuil@cisco.com, tfiga@chromium.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jul 26, 2023 at 9:35=E2=80=AFPM Vikash Garodia
<quic_vgarodia@quicinc.com> wrote:
>
> Buffer requirement, for different buffer type, comes from video firmware.
> While copying these requirements, there is an OOB possibility when the
> payload from firmware is more than expected size. Fix the check to avoid
> the OOB possibility.
>
> Cc: stable@vger.kernel.org
> Fixes: 09c2845e8fe4 ("[media] media: venus: hfi: add Host Firmware Interf=
ace (HFI)")
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
>  drivers/media/platform/qcom/venus/hfi_msgs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/venus/hfi_msgs.c b/drivers/media=
/platform/qcom/venus/hfi_msgs.c
> index 3d5dadf..3e85bd8 100644
> --- a/drivers/media/platform/qcom/venus/hfi_msgs.c
> +++ b/drivers/media/platform/qcom/venus/hfi_msgs.c
> @@ -398,7 +398,7 @@ session_get_prop_buf_req(struct hfi_msg_session_prope=
rty_info_pkt *pkt,
>                 memcpy(&bufreq[idx], buf_req, sizeof(*bufreq));
>                 idx++;
>
> -               if (idx > HFI_BUFFER_TYPE_MAX)
> +               if (idx >=3D HFI_BUFFER_TYPE_MAX)
>                         return HFI_ERR_SESSION_INVALID_PARAMETER;
>
>                 req_bytes -=3D sizeof(struct hfi_buffer_requirements);
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum=
,
> a Linux Foundation Collaborative Project
>
The fix makes sense to me.
Reviewed-by: Nathan Hebert <nhebert@chromium.org>

Best regards,
Nathan Hebert
