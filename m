Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C2C96F8505
	for <lists+linux-media@lfdr.de>; Fri,  5 May 2023 16:43:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232259AbjEEOn0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 May 2023 10:43:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232006AbjEEOnZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 May 2023 10:43:25 -0400
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96B1816353
        for <linux-media@vger.kernel.org>; Fri,  5 May 2023 07:43:20 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-555e853d3c5so17329537b3.2
        for <linux-media@vger.kernel.org>; Fri, 05 May 2023 07:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683297800; x=1685889800;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Eu6eL08NchUT642Hp5qhJBGhptDmxp6xfW7MUBFuQ/8=;
        b=eTaQZAanmEnfqwzawalPHzva0BgnqxkRtrTIqkNtelZAkHwJ1Nl0c80NhIX8Uo2CcP
         AsFCcwSthgVdQZlrxnIlz6To8un2DXmK22XMeKB42kqzOvIL4chdIJk1Jjrc+zEue90D
         WPkBMgcbqc6HV3JN/h0u58r53OnbroMIGEg1A1ML2T0S6F2XM9jHrXXy7hPlQcpfDKPM
         kq25eDu5SGGWNowD53dUcZBk0c2g86LFyVZNPFhTg3UsU5kCkREsWRdqtW6ideD9hn0C
         Sr/nL3w6XAqEogkAW1E5YN53fT+Basnj9/TJ9FCMrbYAoKnRbHo0D6gh7YBpkTxGpwTD
         HgtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683297800; x=1685889800;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Eu6eL08NchUT642Hp5qhJBGhptDmxp6xfW7MUBFuQ/8=;
        b=ZUMp4DBGq5de4PwnZ9+HBk8569zvMeDX5l/lMxZmYPLLo3GOQqnzIfv7gBAhM1EPEA
         akU6Aq6H5qk1fvwD2+ZwV5UTRgGHSg5EQLCAs/biAZkWnJcyMNHvPt67O1Pwfo0y+qER
         xslHonoVFBuaPqwsOtJDxxcxJLD+cm+6NE/nrUxhdMI2qUQEnm3mOcOvjxDebOPht2Cb
         llK5QhebjX0k5uMINkea9vxLyWu3oncvEeCsLqMABB/nNcj5wOErV0P6NdWBiuyUleNn
         WMcjgFcVQicYCvUp7Zn0moR6Iv8Qv0Mrw6fCgOeAQrrqYZFC85rx6BOhozSGeSTSNxJT
         Y28A==
X-Gm-Message-State: AC+VfDwvgS3VlOu0POTz8ZkoCkFboNG/nfXmjbg+XdUmU/zKbYaBbzPG
        +N9lFIyJeACv5X/GJxoJWSxGzst09cuy2yXHNkUMYQ==
X-Google-Smtp-Source: ACHHUZ7XS3VPNCTTJ9YG2TAtzygsHQSk7xF+mi2fhol46QTF/QHIfxtaUEJ+CkreSoYNiKXBhXO7lzAUf8+JViCobQI=
X-Received: by 2002:a05:6902:120c:b0:b96:29d0:dc3c with SMTP id
 s12-20020a056902120c00b00b9629d0dc3cmr2022126ybu.25.1683297799813; Fri, 05
 May 2023 07:43:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230228-topic-venus-v2-0-d95d14949c79@linaro.org>
 <20230228-topic-venus-v2-9-d95d14949c79@linaro.org> <4a95547d-916a-3875-7752-f815429182e5@quicinc.com>
In-Reply-To: <4a95547d-916a-3875-7752-f815429182e5@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 5 May 2023 17:43:09 +0300
Message-ID: <CAA8EJpqBn9odiEfUak0OQUkMU2aSKc6rf07joYOKML0EhM-JKA@mail.gmail.com>
Subject: Re: [PATCH v2 09/18] media: venus: hfi_venus: Fix version checks in venus_halt_axi()
To:     Vikash Garodia <quic_vgarodia@quicinc.com>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 5 May 2023 at 16:22, Vikash Garodia <quic_vgarodia@quicinc.com> wrote:
>
>
> On 5/4/2023 1:31 PM, Konrad Dybcio wrote:
> > Only IRIS2(_1) should enter the until-now-IS_V6() path and the
> > condition for skipping part of it should be IS_IRIS2_1 and not the
> > number of VPP pipes. Fix that.
>
> Do not see any issue with existing code. IRIS2 with single pipe is
> IRIS2_1. This does not
>
> quality as a fix to earlier implementation. Since this series introduces
> VPU versions,
>
> IRIS2 with 1 pipe is being replaced with IRIS2_1.

Could you please fix the line wrapping of your emails. It becomes hard
to read them otherwise.


-- 
With best wishes
Dmitry
