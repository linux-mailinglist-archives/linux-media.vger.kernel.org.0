Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1DDF23F438
	for <lists+linux-media@lfdr.de>; Fri,  7 Aug 2020 23:28:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726787AbgHGV2i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Aug 2020 17:28:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726688AbgHGV2h (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Aug 2020 17:28:37 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9522AC061A27
        for <linux-media@vger.kernel.org>; Fri,  7 Aug 2020 14:28:37 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id i26so2238658edv.4
        for <linux-media@vger.kernel.org>; Fri, 07 Aug 2020 14:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bdNucF0koSppcU0GmU9pSl6fM9HVcxNoH43SdcmhMo4=;
        b=WRZkwZaLt55Y2h276GQIL0EwY8JZgUt+nO04eGdR+5coh476ORbcDKISCIzllLYqgr
         7pXl9SAv+kRl9cT8mG/IIezkcnD/mOK8BF31NyqErmOkrd2TjVOko70lECZRwmQMlz1Y
         b8cFcuQo1C617FdhnPXZESL8OsSbpCtiVGg/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bdNucF0koSppcU0GmU9pSl6fM9HVcxNoH43SdcmhMo4=;
        b=mgZ9nV+GpRxZ2JUfuRIq7RUhTo91zcNWHok1jqwpiXR50rtxENJ3YUs/WpIvhnLKnW
         rhOPU7U+PdlkYM1aGhpKM63fFu8XmNAxzhfmiGGrdw0ZdpwDLAR6MhTsMWQD90LOSKR/
         TyecyJmefR62tfahGinXp22FktNfSsqLcEpHmYFB5TCcpOncq+HvLzD50QzyTKlAG3Yl
         byLTWv/Qu2hMpPN3TcIFmeiQLpxoNE1aBawLLv02DasAVn8dXkBmsRjnDJxbZoxOrek5
         TLc9DBzrxQxH7ZMuhsx4R9/90tTYNAzFg6ENpu64gRdM2eQfYsm9qCudAIiKURT336pP
         Ewew==
X-Gm-Message-State: AOAM530KVxzvBn7R2EUy+H0CFzXpMQMWKnIrdPjD0g44MlkdxCUyCY+2
        rV3ZTktbV39MB9y8taN3ag1bv49V3GI=
X-Google-Smtp-Source: ABdhPJxFM2kRsYw26jxVepI/vVACUjZby5VukNK166N2ylY51VQVOBgKOdvPTJEL14pJIdNTU7RfUQ==
X-Received: by 2002:a05:6402:1f0:: with SMTP id i16mr10476202edy.309.1596835716012;
        Fri, 07 Aug 2020 14:28:36 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id gl20sm6749741ejb.86.2020.08.07.14.28.35
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2020 14:28:35 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id f7so2891966wrw.1
        for <linux-media@vger.kernel.org>; Fri, 07 Aug 2020 14:28:35 -0700 (PDT)
X-Received: by 2002:adf:fdce:: with SMTP id i14mr13480967wrs.273.1596835714967;
 Fri, 07 Aug 2020 14:28:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200730114632.6717-1-stanimir.varbanov@linaro.org> <20200730114632.6717-2-stanimir.varbanov@linaro.org>
In-Reply-To: <20200730114632.6717-2-stanimir.varbanov@linaro.org>
From:   Fritz Koenig <frkoenig@chromium.org>
Date:   Fri, 7 Aug 2020 14:28:22 -0700
X-Gmail-Original-Message-ID: <CAMfZQbx36rZc=9p8a=mGSqwvtfQ-KRO+5=8yEuo-NA+eeoBBNg@mail.gmail.com>
Message-ID: <CAMfZQbx36rZc=9p8a=mGSqwvtfQ-KRO+5=8yEuo-NA+eeoBBNg@mail.gmail.com>
Subject: Re: [PATCH 1/3] venus: parser: Prepare parser for multiple invocations
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jul 30, 2020 at 4:47 AM Stanimir Varbanov
<stanimir.varbanov@linaro.org> wrote:
>
> Presently the hfi_parser has been called only once during driver
> probe. To prepare the parser function to be called multiple times
> from recovery we need to initialize few variables which are used
> during parsing time.
>
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/hfi_parser.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
> index 7f515a4b9bd1..363ee2a65453 100644
> --- a/drivers/media/platform/qcom/venus/hfi_parser.c
> +++ b/drivers/media/platform/qcom/venus/hfi_parser.c
> @@ -239,6 +239,9 @@ u32 hfi_parser(struct venus_core *core, struct venus_inst *inst, void *buf,
>
>         parser_init(inst, &codecs, &domain);
>
> +       core->codecs_count = 0;
> +       memset(core->caps, 0, sizeof(core->caps));
> +
>         while (words_count) {
>                 data = word + 1;
>
> --
> 2.17.1
>

Reviewed-by: Fritz Koenig <frkoenig@chromium.org>
