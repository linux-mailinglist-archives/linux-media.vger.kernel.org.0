Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 565796E8A88
	for <lists+linux-media@lfdr.de>; Thu, 20 Apr 2023 08:38:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233939AbjDTGhf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Apr 2023 02:37:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233822AbjDTGhb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Apr 2023 02:37:31 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2F715244
        for <linux-media@vger.kernel.org>; Wed, 19 Apr 2023 23:36:49 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id kt6so4177749ejb.0
        for <linux-media@vger.kernel.org>; Wed, 19 Apr 2023 23:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20221208.gappssmtp.com; s=20221208; t=1681972607; x=1684564607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fGIxebizqN9Evwu7ritmtZTZgkXXATKth4F74N7YOmU=;
        b=gi7LBvVVQ+zBjJw4jme1qgAObM/ONc6qKqnRwIvm0WlZdoJGXZqUC+ufgibtiqPY1f
         4pw08FvkNLoadBoN5IUmWAnDspd4aFAMWTsl//O8UOzL9ZbNWvATSOwfQfs7A77snSnx
         gCqWk9vwDRbSPTfftItRHIN1XuL0a3Jx5LZs1dDiy8xojXnMfQaz8vmTnTnpqSW9BHLi
         y7zmIb5h6v3NB/EcacqklHog0iZ+rcVMaNlrw/BmjicDFLAGeuRE/530Vi40N/q2TrSp
         wS4pAzuh2GrdEkC7hpx8goVZKKEN+mb01gcrUFN/rXC9+GiC3c6qGHNInHJTd2hLAtmJ
         eZkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681972607; x=1684564607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fGIxebizqN9Evwu7ritmtZTZgkXXATKth4F74N7YOmU=;
        b=aTgbxC3TNyusco9po9u+PtYPKuPL4Pdh89uIxwQxgIQxOywrhUPch/BEiJQZupsWRJ
         KHxGH3HWY4O/iGxNcXL4YAlsYm8LhNTntTYE+Hb6V1SsVV1K0WwHelU+Ag/Zz5gjU2zF
         ntKQOMXxWwdzD2APKbnZeVMWyCLO+haHd4fbcyZD5gWWoqVL1pCVlh3BJCIeiQ19AddH
         Z5Hv0HofD13TszfQqP5PoK6R39jyXOkjpvalkgVQrzY6Y40jyx6zowZ+Yj46UQHASjNY
         noN3jzpXCvOScugOHHbRIFnzzYtsTJVUf/NFPwCh3+J4rghcJ69j69YzaVSeqIV+GHOE
         uGFg==
X-Gm-Message-State: AAQBX9eXREXnanpJuAMZr4FXrFEyh3p7M2qiWrQ+3vAVnJnair5BedEE
        fW9yuA7QaK/cndaBLesaC2mACrwn7M5kez/Wy5+t
X-Google-Smtp-Source: AKy350ZuCdZo3mZpgSj7RLvlirK3du10adEHs+LGaIdn5CBI5UyRP7ZvfjIwPCpE0z7H/vgULpy0lCaFXeZ3i4dRb7k=
X-Received: by 2002:a17:906:a057:b0:94f:2d5e:1909 with SMTP id
 bg23-20020a170906a05700b0094f2d5e1909mr165267ejb.7.1681972606873; Wed, 19 Apr
 2023 23:36:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230418-msm8998-hdmi-cec-v1-0-176479fb2fce@freebox.fr>
 <20230418-msm8998-hdmi-cec-v1-1-176479fb2fce@freebox.fr> <9d7f81fc-945e-9704-4eb2-d2e5cb31297e@linaro.org>
 <5797c537-fe70-27be-ef1d-f4c8b19806f5@quicinc.com> <639b264b-08e5-b84e-1933-ed768b6d1512@linaro.org>
 <5014976f-3026-9fef-e1ec-270d421df078@quicinc.com> <bfbd0ecc-342b-1321-8ead-b3e462099e51@linaro.org>
 <7de672fb-e9ac-5594-295f-ac29951c3066@quicinc.com> <fe7c7533-b918-9b47-c1c8-959d967081d5@linaro.org>
In-Reply-To: <fe7c7533-b918-9b47-c1c8-959d967081d5@linaro.org>
From:   Arnaud Vrac <avrac@freebox.fr>
Date:   Thu, 20 Apr 2023 08:36:35 +0200
Message-ID: <CAG9NU69CtB23pHLSEBszSNrbgqcZ7NCvLuYJ=n3K0QvNoy0eyA@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 1/4] drm/msm: add some cec register bitfield details
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sean Paul <sean@poorly.run>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>,
        freedreno@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le jeu. 20 avr. 2023 =C3=A0 02:30, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> a =C3=A9crit :
>
> On 20/04/2023 03:27, Abhinav Kumar wrote:
> >
> >
> > On 4/19/2023 5:21 PM, Dmitry Baryshkov wrote:
> >> On 20/04/2023 03:17, Abhinav Kumar wrote:
> >>>
> >>>
> >>> On 4/19/2023 5:11 PM, Dmitry Baryshkov wrote:
> >>>> On 20/04/2023 03:10, Abhinav Kumar wrote:
> >>>>>
> >>>>>
> >>>>> On 4/19/2023 4:53 PM, Dmitry Baryshkov wrote:
> >>>>>> On 18/04/2023 21:10, Arnaud Vrac wrote:
> >>>>>>> The register names and bitfields were determined from the downstr=
eam
> >>>>>>> msm-4.4 driver.
> >>>>>>>
> >>>>>>> Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
> >>>>>>> ---
> >>>>>>>   drivers/gpu/drm/msm/hdmi/hdmi.xml.h | 62
> >>>>>>> ++++++++++++++++++++++++++++++++++++-
> >>>>>>>   1 file changed, 61 insertions(+), 1 deletion(-)
> >>>>>>
> >>>>>> I have opened MR against Mesa at
> >>>>>> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/22588.
> >>>>>>
> >>>>>> The patch is:
> >>>>>>
> >>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>>>>
> >>>>>> Minor nit below
> >>>>>>
> >>>>>
> >>>>> Also, shouldnt the register updates be done using rnn tool instead
> >>>>> of manual edits?
> >>>>
> >>>> We usually update the rnn and ask Rob to pull it at the beginning of
> >>>> the cycle.
> >>>>
> >>>
> >>> Sorry, I didnt get this. So you are saying, we will accept manual
> >>> edits and then replace it with the tool generated xml later? I was
> >>> not aware of that, because previously I was always asked by Rob to
> >>> use the tool to generate the xml and push that.
> >>
> >> We accept manual edits for the patchset (so that one can test it), but
> >> before merging the patchset we ask Rob to pull the xml.
> >>
> >
> > Interesting, and Rob generates the xml that time or who does that?
> >
> > The MR you have created updates the freedreno/registers which is just t=
o
> > keep the XML in the driver and mesa in sync.
> >
> > But I am trying to understand who generates the updated xml to merge it
> > with the patchset if its not the developer who does that anymore.
>
> In this case I went on and created the MR as Arnaud didn't create one.
> Yes, usually we do this on our own when updating the register file (in
> other words: I usually edit the xml, then regen the xml.h, then add it
> to the patchset).

Ok thanks, I wasn't sure in which order to do this, thanks for posting
the MR on mesa. The changes in hdmi.xml.h I posted are not manually
edited, they were generated using the gen_header.py script in mesa (I
omitted the top comments changes about envytools which are not present
anymore though).

>
> >
> >>>
> >>>>>
> >>>>>>>
> >>>>>>> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.xml.h
> >>>>>>> b/drivers/gpu/drm/msm/hdmi/hdmi.xml.h
> >>>>>>> index 973b460486a5a..b4dd6e8cba6b7 100644
> >>>>>>> --- a/drivers/gpu/drm/msm/hdmi/hdmi.xml.h
> >>>>>>> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.xml.h
> >>>>>>> @@ -76,6 +76,13 @@ enum hdmi_acr_cts {
> >>>>>>>       ACR_48 =3D 3,
> >>>>>>>   };
> >>>>>>> +enum hdmi_cec_tx_status {
> >>>>>>> +    CEC_TX_OK =3D 0,
> >>>>>>> +    CEC_TX_NACK =3D 1,
> >>>>>>> +    CEC_TX_ARB_LOSS =3D 2,
> >>>>>>> +    CEC_TX_MAX_RETRIES =3D 3,
> >>>>>>> +};
> >>>>>>> +
> >>>>>>>   #define REG_HDMI_CTRL                        0x00000000
> >>>>>>>   #define HDMI_CTRL_ENABLE                    0x00000001
> >>>>>>>   #define HDMI_CTRL_HDMI                        0x00000002
> >>>>>>> @@ -476,20 +483,73 @@ static inline uint32_t
> >>>>>>> HDMI_DDC_REF_REFTIMER(uint32_t val)
> >>>>>>>   #define REG_HDMI_HDCP_SW_LOWER_AKSV                0x00000288
> >>>>>>>   #define REG_HDMI_CEC_CTRL                    0x0000028c
> >>>>>>> +#define HDMI_CEC_CTRL_ENABLE                    0x00000001
> >>>>>>> +#define HDMI_CEC_CTRL_SEND_TRIGGER                0x00000002
> >>>>>>> +#define HDMI_CEC_CTRL_FRAME_SIZE__MASK                0x000001f0
> >>>>>>> +#define HDMI_CEC_CTRL_FRAME_SIZE__SHIFT                4
> >>>>>>> +static inline uint32_t HDMI_CEC_CTRL_FRAME_SIZE(uint32_t val)
> >>>>>>> +{
> >>>>>>> +    return ((val) << HDMI_CEC_CTRL_FRAME_SIZE__SHIFT) &
> >>>>>>> HDMI_CEC_CTRL_FRAME_SIZE__MASK;
> >>>>>>> +}
> >>>>>>> +#define HDMI_CEC_CTRL_LINE_OE                    0x00000200
> >>>>>>>   #define REG_HDMI_CEC_WR_DATA                    0x00000290
> >>>>>>> +#define HDMI_CEC_WR_DATA_BROADCAST                0x00000001
> >>>>>>> +#define HDMI_CEC_WR_DATA_DATA__MASK                0x0000ff00
> >>>>>>> +#define HDMI_CEC_WR_DATA_DATA__SHIFT                8
> >>>>>>> +static inline uint32_t HDMI_CEC_WR_DATA_DATA(uint32_t val)
> >>>>>>> +{
> >>>>>>> +    return ((val) << HDMI_CEC_WR_DATA_DATA__SHIFT) &
> >>>>>>> HDMI_CEC_WR_DATA_DATA__MASK;
> >>>>>>> +}
> >>>>>>> -#define REG_HDMI_CEC_CEC_RETRANSMIT                0x00000294
> >>>>>>> +#define REG_HDMI_CEC_RETRANSMIT                    0x00000294
> >>>>>>> +#define HDMI_CEC_RETRANSMIT_ENABLE                0x00000001
> >>>>>>> +#define HDMI_CEC_RETRANSMIT_COUNT__MASK                0x000000f=
e
> >>>>>>> +#define HDMI_CEC_RETRANSMIT_COUNT__SHIFT            1
> >>>>>>> +static inline uint32_t HDMI_CEC_RETRANSMIT_COUNT(uint32_t val)
> >>>>>>> +{
> >>>>>>> +    return ((val) << HDMI_CEC_RETRANSMIT_COUNT__SHIFT) &
> >>>>>>> HDMI_CEC_RETRANSMIT_COUNT__MASK;
> >>>>>>> +}
> >>>>>>>   #define REG_HDMI_CEC_STATUS                    0x00000298
> >>>>>>> +#define HDMI_CEC_STATUS_BUSY                    0x00000001
> >>>>>>> +#define HDMI_CEC_STATUS_TX_FRAME_DONE                0x00000008
> >>>>>>> +#define HDMI_CEC_STATUS_TX_STATUS__MASK                0x000000f=
0
> >>>>>>> +#define HDMI_CEC_STATUS_TX_STATUS__SHIFT            4
> >>>>>>> +static inline uint32_t HDMI_CEC_STATUS_TX_STATUS(enum
> >>>>>>> hdmi_cec_tx_status val)
> >>>>>>> +{
> >>>>>>> +    return ((val) << HDMI_CEC_STATUS_TX_STATUS__SHIFT) &
> >>>>>>> HDMI_CEC_STATUS_TX_STATUS__MASK;
> >>>>>>> +}
> >>>>>>>   #define REG_HDMI_CEC_INT                    0x0000029c
> >>>>>>> +#define HDMI_CEC_INT_TX_DONE                    0x00000001
> >>>>>>> +#define HDMI_CEC_INT_TX_DONE_MASK                0x00000002
> >>>>>>> +#define HDMI_CEC_INT_TX_ERROR                    0x00000004
> >>>>>>> +#define HDMI_CEC_INT_TX_ERROR_MASK                0x00000008
> >>>>>>> +#define HDMI_CEC_INT_MONITOR                    0x00000010
> >>>>>>> +#define HDMI_CEC_INT_MONITOR_MASK                0x00000020
> >>>>>>> +#define HDMI_CEC_INT_RX_DONE                    0x00000040
> >>>>>>> +#define HDMI_CEC_INT_RX_DONE_MASK                0x00000080
> >>>>>>>   #define REG_HDMI_CEC_ADDR                    0x000002a0
> >>>>>>>   #define REG_HDMI_CEC_TIME                    0x000002a4
> >>>>>>> +#define HDMI_CEC_TIME_ENABLE                    0x00000001
> >>>>>>> +#define HDMI_CEC_TIME_SIGNAL_FREE_TIME__MASK            0x0000ff=
80
> >>>>>>> +#define HDMI_CEC_TIME_SIGNAL_FREE_TIME__SHIFT            7
> >>>>>>> +static inline uint32_t HDMI_CEC_TIME_SIGNAL_FREE_TIME(uint32_t v=
al)
> >>>>>>> +{
> >>>>>>> +    return ((val) << HDMI_CEC_TIME_SIGNAL_FREE_TIME__SHIFT) &
> >>>>>>> HDMI_CEC_TIME_SIGNAL_FREE_TIME__MASK;
> >>>>>>> +}
> >>>>>>>   #define REG_HDMI_CEC_REFTIMER                    0x000002a8
> >>>>>>> +#define HDMI_CEC_REFTIMER_ENABLE                0x00010000
> >>>>>>
> >>>>>> I think this should come after the REFTIMER field.
> >>>>>>
> >>>>>>> +#define HDMI_CEC_REFTIMER_REFTIMER__MASK            0x0000ffff
> >>>>>>> +#define HDMI_CEC_REFTIMER_REFTIMER__SHIFT            0
> >>>>>>> +static inline uint32_t HDMI_CEC_REFTIMER_REFTIMER(uint32_t val)
> >>>>>>> +{
> >>>>>>> +    return ((val) << HDMI_CEC_REFTIMER_REFTIMER__SHIFT) &
> >>>>>>> HDMI_CEC_REFTIMER_REFTIMER__MASK;
> >>>>>>> +}
> >>>>>>>   #define REG_HDMI_CEC_RD_DATA                    0x000002ac
> >>>>>>>
> >>>>>>
> >>>>
> >>
>
> --
> With best wishes
> Dmitry
>
