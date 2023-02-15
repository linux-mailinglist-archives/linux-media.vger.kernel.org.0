Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6581697A50
	for <lists+linux-media@lfdr.de>; Wed, 15 Feb 2023 11:58:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234238AbjBOK6q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Feb 2023 05:58:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234258AbjBOK6n (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Feb 2023 05:58:43 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DE3B6A4B
        for <linux-media@vger.kernel.org>; Wed, 15 Feb 2023 02:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676458677;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=MmeJjSh427GKtr5aY1dE1/UGw/jLjAjyH6qeK2RMoAo=;
        b=Dk93aU6hwH/ml5xEMQVdJ5Dai0xFXrsHHAr2oQL9rxItKYHg6Rf3exo/awcDOe2gAQTIAG
        rjLiKpNzU1mIWSJhYRW69+3ph7D2jJCYYI2QZFyLMTdCLnL2Hn9yG7wyr+nN/qq55lsZTY
        n/fhWJKPrgR6DeiVKKuluPO9Y41o8tw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-637-DpDbd-JINOSZw8xlNh0u8g-1; Wed, 15 Feb 2023 05:57:50 -0500
X-MC-Unique: DpDbd-JINOSZw8xlNh0u8g-1
Received: by mail-ed1-f69.google.com with SMTP id bo27-20020a0564020b3b00b004a6c2f6a226so12356903edb.15
        for <linux-media@vger.kernel.org>; Wed, 15 Feb 2023 02:57:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MmeJjSh427GKtr5aY1dE1/UGw/jLjAjyH6qeK2RMoAo=;
        b=fe31xbQML6LTELPYzdixLKUEwf6Ngd08N1TevfZ6HRK0WQ1s5QMo4JKutMbVplvv9K
         4ooMcC1fPuLv6s+5lVx30kjGBGr5gV+CAvC9jL77rGiLCq0NQiRcJG67vmjS8E0kpEB6
         Ul6oMdCNCv9CZ/X0UX21rRJ3Vwu3QNeIVn//wx0hHWucgX/pMkXNRymyuNHuHT43Zoz/
         UGUseEDhJz5YCF5tGH/F2w8yxFK3OsqNx3O2j+2TtNkolKpiTLAI5Auq6RxzJMKsWa0g
         Yo4JFC99b2SML6MaVfeBAmOgOcGMIJaTSenZLfm0RT+SRcxkJ+z4r5QEPI5P2yuMTdMc
         vg0Q==
X-Gm-Message-State: AO0yUKX8Mk7TD4ok1yAgtGm4M4mnqIsSvIqBgfbrAnoYYeA3I1V6LepC
        u58VzOfwcBkPSQQrA5RgztmipOxi+h8PszuiET8jc5jslbNYRZYkfG3ZfKr1czEQLcx+wNPADmF
        6bts6myUaHvJiTlEE7A1/scq71qSe5rVFg9R+jaw=
X-Received: by 2002:a50:ccc2:0:b0:4ac:bebb:e5fe with SMTP id b2-20020a50ccc2000000b004acbebbe5femr831737edj.1.1676458669787;
        Wed, 15 Feb 2023 02:57:49 -0800 (PST)
X-Google-Smtp-Source: AK7set+nxXB+Yb8YV5YVO81VjVBf4VZDL30eASGa9yuof5vxNU99jL1I3nSh0NSHMQMi9N7zea0BuUiOR9pDqaaa2nw=
X-Received: by 2002:a50:ccc2:0:b0:4ac:bebb:e5fe with SMTP id
 b2-20020a50ccc2000000b004acbebbe5femr831725edj.1.1676458669643; Wed, 15 Feb
 2023 02:57:49 -0800 (PST)
MIME-Version: 1.0
References: <20230207102254.1446461-1-javierm@redhat.com> <DM8PR02MB8169809493BF2822E6C29EECF3DB9@DM8PR02MB8169.namprd02.prod.outlook.com>
 <ef09bc9f-d570-be11-238b-bd34063917fc@redhat.com> <70c01751-1dd7-c4bd-a96e-94dea437aa40@redhat.com>
 <DM8PR02MB81696369DBFE619E43F81EEFF3DE9@DM8PR02MB8169.namprd02.prod.outlook.com>
 <e87344c6-acef-7f3f-5cac-24961dbd9401@redhat.com> <6f97a117-0d9c-e21b-9adf-50f2233ba9e3@leemhuis.info>
 <ea283f0a-ca72-447e-ce87-68c1bbee793e@leemhuis.info>
In-Reply-To: <ea283f0a-ca72-447e-ce87-68c1bbee793e@leemhuis.info>
From:   Javier Martinez Canillas <javierm@redhat.com>
Date:   Wed, 15 Feb 2023 11:57:38 +0100
Message-ID: <CAFOAJEdBbzqkGVqw+vgNYNxyaTHwvjFyskTwjycP820L2tOctA@mail.gmail.com>
Subject: Re: [PATCH] Revert "venus: firmware: Correct non-pix start and end addresses"
To:     Linux regressions mailing list <regressions@lists.linux.dev>
Cc:     Vikash Garodia <vgarodia@qti.qualcomm.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "mka@chromium.org" <mka@chromium.org>,
        Albert Esteve <aesteve@redhat.com>,
        "stanimir.varbanov@linaro.org" <stanimir.varbanov@linaro.org>,
        Enric Balletbo i Serra <eballetb@redhat.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Fritz Koenig <frkoenig@google.com>,
        "Dikshita Agarwal (QUIC)" <quic_dikshita@quicinc.com>,
        "Rajeshwar Kurapaty (QUIC)" <quic_rkurapat@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Feb 15, 2023 at 11:53 AM Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> On 11.02.23 15:27, Linux regression tracking (Thorsten Leemhuis) wrote:
> > On 10.02.23 11:07, Javier Martinez Canillas wrote:
> >> On 2/10/23 10:22, Vikash Garodia wrote:
> >>
> >>>> So what should we do about this folks? Since not allowing the driver to probe on
> >>>> at least SC7180 is a quite serious regression, can we revert for now until a proper
> >>>> fix is figured out?
> >>>
> >>> I am able to repro this issue on sc7180 and discussing with firmware team on the cause
> >>> of reset failure. The original patch was raised for fixing rare SMMU faults during warm
> >>> boot of video hardware. Hence looking to understand the regressing part before we
> >>> proceed to revert.
> >>
> >> Great, if you are working on a proper fix then that would be much better indeed.
> >
> > Yeah, that's great, but OTOH: there is almost certainly just one week
> > before 6.2 will be released. Ideally this should be fixed by then.
> > Vikash, do you think that's in the cards? If not: why not revert this
> > now to make sure 6.2 works fine?
>
> Hmm, no reply. And we meanwhile have Wednesday and 6.2 is almost
> certainly going to be out on Sunday. And the problem was called "a quite
> serious regression" above. So why not quickly fix this with the revert,
> as proposed earlier?
>
> Vikash? Javier?
>

I agree with you, that we should land this revert and then properly
fix the page fault issue in v6.3.

But it's not my call, the v4l2/media folks have to decide that.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

