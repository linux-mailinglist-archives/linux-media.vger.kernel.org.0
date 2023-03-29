Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D473C6CF132
	for <lists+linux-media@lfdr.de>; Wed, 29 Mar 2023 19:34:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229825AbjC2ReJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Mar 2023 13:34:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjC2ReH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Mar 2023 13:34:07 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8010340CF
        for <linux-media@vger.kernel.org>; Wed, 29 Mar 2023 10:34:06 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-544f7c176easo306077637b3.9
        for <linux-media@vger.kernel.org>; Wed, 29 Mar 2023 10:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680111245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FkhSHYXGUkelGLddLL9XxpvQOEW/tExrcv6+2UzDYDE=;
        b=n0OywWT13KnixyTrL6xWwL/YCYs3pAn4NIXv/vJLeUEmB3MmVqpKHPXmlGZf5ULv3L
         4umQgIlsCE9BnmxT4CA8x5UxyVE40FaJTiIQ1mK4hrBleVL8KsAKqXYcbsIMA06Tfb5w
         Lp8g8rSiPxmM11mj5lF9khSmyGA4JDw/Oq9STyD6GWTic2wFUFvWnk8jCGuUCkWDe+27
         MTo3xPt/5+Vsy/t222qaUVtwNi4NmL3uENWpQWMYlAgDIx8a02YgrPG5V6tvRoztj67b
         ssIKQtr4wdBqYDQLGbaQE6pE/wr8zK9fAYYKgUK8yFswZB4D465oyCgzA7EYe4cFWjJL
         0Rag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680111245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FkhSHYXGUkelGLddLL9XxpvQOEW/tExrcv6+2UzDYDE=;
        b=luXEcCA1kMZ+hPhBnoC5jmisv9znvR2heHTnCtEyAKhQGVgZBDzAE0wKyTXOpwH1KP
         6prdE0zUIQc84KAzF6IeV1ob2E+IXgMo9PVhTNpBOOaVO26SsgepeFul5tNlP0WHYSUG
         bwXYReEbxP+ve4qEavEvaL0KX//xiMCSdts+++PS52yxif5ATvtbwKmaPHm995tbdSUM
         4RxnsgoRHY8Etopu87IClGi0BDkbI+Ocmlr//OsxDPhCGdm+rCP0j+uqmeLPYwHJXVr/
         Qgt2PVkzky0vNZai0ffdjf1VJ48i37Gr5kWvbnlLJv9Q/N+zOg0SsH25Rns6O8pzMNyz
         CLgw==
X-Gm-Message-State: AAQBX9dNB5LUBuoIlY9ZzaTFHzI7EHAYEJPqEBp4KFJx5XUL2nRSZHtA
        Bpqtnsih8/CYlLGbbIw9nKO4aplCykEpMX4/mhlVGQ==
X-Google-Smtp-Source: AKy350YSAiJVafWtSYuOVU/LPqdMmXdDZ6HnyVg9UY77oBkynTdOACK4jIBqjOvpQYqYtA8u/oBQ0c6lKWosKHziNRw=
X-Received: by 2002:a05:690c:b94:b0:541:698b:7bdb with SMTP id
 ck20-20020a05690c0b9400b00541698b7bdbmr1851456ywb.2.1680111245693; Wed, 29
 Mar 2023 10:34:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230323130153.8229-1-quic_vboma@quicinc.com> <c611c390-2cf3-2abe-82aa-67538b823d62@linaro.org>
 <9f5bce7e-2b8a-0b71-3a80-0b4f86d9f908@quicinc.com> <E98548DB-5085-4036-9F6C-DC22A604A0C2@linaro.org>
 <b2e16887-bc35-c933-2107-6e8faa439770@quicinc.com>
In-Reply-To: <b2e16887-bc35-c933-2107-6e8faa439770@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 29 Mar 2023 20:33:54 +0300
Message-ID: <CAA8EJpotBtz8Dw9QsLX5Li2ON=QuxWFGZkaiYw9Ac-XerNEEag@mail.gmail.com>
Subject: Re: [PATCH v4] venus: Enable sufficient sequence change support for
 sc7180 and fix for Decoder STOP command issue.
To:     Vikash Garodia <quic_vgarodia@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stanimir.k.varbanov@gmail.com,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        quic_dikshita@quicinc.com, Viswanath Boma <quic_vboma@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 29 Mar 2023 at 20:16, Vikash Garodia <quic_vgarodia@quicinc.com> wr=
ote:
>
>
> On 3/29/2023 7:06 PM, Dmitry Baryshkov wrote:
> > 29 =D0=BC=D0=B0=D1=80=D1=82=D0=B0 2023 =D0=B3. 10:48:23 GMT+03:00, Vika=
sh Garodia <quic_vgarodia@quicinc.com> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >> On 3/29/2023 3:49 AM, Dmitry Baryshkov wrote:
> >>> On 23/03/2023 15:01, Viswanath Boma wrote:
> >>>> For VP9 bitstreams, there could be a change in resolution at interfr=
ame,
> >>>> for driver to get notified of such resolution change,
> >>>> enable the property in video firmware.
> >>>> Also, EOS handling is now made same in video firmware across all V6 =
SOCs,
> >>>> hence above a certain firmware version, the driver handling is
> >>>> made generic for all V6s
> >>> Having "Do abc. Also do defgh." is a clear sign that this patch shoul=
d be split into two.
> >> I agree, it could have split into patches. The patch introduces way to=
 store venus firmware
> >>
> >> version and take some decision for various version. For ex. here STOP =
handling and enabling
> >>
> >> DRC event for specific firmware revision and onwards. Since both the h=
andling was primarily
> >>
> >> dependent of firmware version, and since the handlings were smaller, i=
t was combined as single
> >>
> >> patch. Let me know, if you have any further review comments, else, wil=
l raise a new version with
> >>
> >> 2 patches probably.
> > Thanks!
> >
> >>>> Signed-off-by: Vikash Garodia <vgarodia@qti.qualcomm.com>
> >>>> Signed-off-by: Viswanath Boma <quic_vboma@quicinc.com>
> >>>> Tested-by: Nathan Hebert <nhebert@chromium.org>
> >>>> ---
> >>>> Since v3 : Addressed comments to rectify email address.
> >>>>
> >>>>    drivers/media/platform/qcom/venus/core.h       | 18 +++++++++++++=
+++++
> >>>>    drivers/media/platform/qcom/venus/hfi_cmds.c   |  1 +
> >>>>    drivers/media/platform/qcom/venus/hfi_helper.h |  2 ++
> >>>>    drivers/media/platform/qcom/venus/hfi_msgs.c   | 11 +++++++++--
> >>>>    drivers/media/platform/qcom/venus/vdec.c       | 12 +++++++++++-
> >>>>    5 files changed, 41 insertions(+), 3 deletions(-)
> >>>>
> > (Skipped)
> >
> >
> >
> >>>> @@ -671,6 +671,16 @@ static int vdec_set_properties(struct venus_ins=
t *inst)
> >>>>                return ret;
> >>>>        }
> >>>>    +    /* Enabling sufficient sequence change support for VP9 */
> >>>> +    if (of_device_is_compatible(inst->core->dev->of_node, "qcom,sc7=
180-venus")) {
> >>> Let me repeat my question from v3:
> >>>
> >>> Is it really specific just to sc7180 or will it be applicable to any
> >>> other platform using venus-5.4 firmware?
> >> The HFI "HFI_PROPERTY_PARAM_VDEC_ENABLE_SUFFICIENT_SEQCHANGE_EVENT" is=
 implemented
> >>
> >> only for sc7180. Calling this for any other venus-5.4 would error out =
the session with error as
> >>
> >> unsupported property from firmware.
> >
> > How can we be sure that other platforms do not end up using sc7180 firm=
ware? Or that sc7180 didn't end up using some other firmware?
> >
> > I see generic  qcom/venus-5.4/venus.mbn in Linux firmware. It's version=
 is VIDEO.VE.5.4-00053-PROD-1. It can be used with any unfused device which=
 uses firmware 5.4
>
> Driver defines resources for every platforms and there it specifies the
> firmware to be used for that platform. For ex, for sc7180, the firmware
> is specified at [1].

And note that the firmware doesn't have an SoC name in it. This file
will be used by all unfused devices that use 5.4 firmware family.

> The various firmware supported by different platforms are also available
> in linux firmware.
>
> [1]
> https://elixir.bootlin.com/linux/v6.3-rc4/source/drivers/media/platform/q=
com/venus/core.c#L765

And in that file sc7180 is the only platform having firmware 5.4.

I think that the check for sc7180 is redundant. Just check that the
firmware is from 5.4 family and it is 5.4.51 or newer.

> >>>> +        if (is_fw_rev_or_newer(inst->core, 5, 4, 51)) {
> >>>> +            ptype =3D HFI_PROPERTY_PARAM_VDEC_ENABLE_SUFFICIENT_SEQ=
CHANGE_EVENT;
> >>>> +            ret =3D hfi_session_set_property(inst, ptype, &en);
> >>>> +            if (ret)
> >>>> +                return ret;
> >>>> +        }
> >>>> +    }
> >>>> +
> >>>>        ptype =3D HFI_PROPERTY_PARAM_VDEC_CONCEAL_COLOR;
> >>>>        conceal =3D ctr->conceal_color & 0xffff;
> >>>>        conceal |=3D ((ctr->conceal_color >> 16) & 0xffff) << 10;



--=20
With best wishes
Dmitry
