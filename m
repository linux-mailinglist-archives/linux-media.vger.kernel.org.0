Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E533298EF7
	for <lists+linux-media@lfdr.de>; Mon, 26 Oct 2020 15:17:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1781082AbgJZORS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Oct 2020 10:17:18 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:36399 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1776173AbgJZORS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Oct 2020 10:17:18 -0400
Received: by mail-ot1-f65.google.com with SMTP id 32so8129123otm.3;
        Mon, 26 Oct 2020 07:17:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Dc1ciPuMA7ubdROI7zF7CaERUaIteiAuLeWwB2ABFhk=;
        b=TPTpx5HsTSIz5tDK9k9/3P2VGzqB62pRyB0C22PWYOB0ZS5jRnET0n8d+YeuzCMHcc
         rVzvHjW6NcmV1jsO3KEXrIvvxsmboupVaRqIValI3Hq4pj9MoMN2RtOs5sspDR8quXkn
         CmQPa6gRcV0cgmKyXfCb6CRqSeHM7JWlVZLH5lbJNlY7q335z0HQMYAPmGjTGZEbo1IV
         /OIfe868dLeg/8Um7mkxXBEeTx/DrsLHAmLtsHnJnM1mIGKpfKDROk34ygv208o2WPbc
         P+/R89IZ4sOHqokusAPjlpEzbnZY5ijO7eWyZYwdvDJz4taElRSQ9tPLwtWCyWrFEzek
         3Xhw==
X-Gm-Message-State: AOAM531b4SWVIO+du/3LRNUK+gkeWrw2pviJWrdk5zzGLzVqrmElsaKb
        55tDAbgVxV/rTwH5/BmoEA==
X-Google-Smtp-Source: ABdhPJxeX9H8Aa3GCK1uZXLbFTHOGdVKHTEc5BetlCh0FzS1zdLK28AWaEUXI4q9MeI/bigvCpyeWw==
X-Received: by 2002:a9d:645:: with SMTP id 63mr11055273otn.182.1603721836759;
        Mon, 26 Oct 2020 07:17:16 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y8sm3963281oon.16.2020.10.26.07.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 07:17:15 -0700 (PDT)
Received: (nullmailer pid 94983 invoked by uid 1000);
        Mon, 26 Oct 2020 14:17:14 -0000
Date:   Mon, 26 Oct 2020 09:17:14 -0500
From:   Rob Herring <robh@kernel.org>
To:     Hugues FRUCHET <hugues.fruchet@st.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        Alain VOLMAT <alain.volmat@st.com>,
        Yannick FERTRE <yannick.fertre@st.com>,
        Philippe CORNU <philippe.cornu@st.com>
Subject: Re: [PATCH v4 2/2] media: dt-bindings: media: st,stm32-dcmi: Add
 support of BT656
Message-ID: <20201026141714.GA83693@bogus>
References: <1603188889-23664-1-git-send-email-hugues.fruchet@st.com>
 <1603188889-23664-3-git-send-email-hugues.fruchet@st.com>
 <20201021130033.GI2703@paasikivi.fi.intel.com>
 <657634eb-690a-53a6-2ac1-de3c06a1cec4@st.com>
 <20201021214058.GJ2703@paasikivi.fi.intel.com>
 <327ae9d5-8683-488f-7970-4983e2fec51d@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <327ae9d5-8683-488f-7970-4983e2fec51d@st.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 22, 2020 at 02:56:17PM +0000, Hugues FRUCHET wrote:
> Hi Sakari,
> 
> + Jacopo for his work on ov772x binding related to BT656
> 
> On 10/21/20 11:40 PM, Sakari Ailus wrote:
> > Hi Hugues,
> > 
> > On Wed, Oct 21, 2020 at 02:24:08PM +0000, Hugues FRUCHET wrote:
> >> Hi Sakari,
> >>
> >> On 10/21/20 3:00 PM, Sakari Ailus wrote:
> >>> Hi Hugues,
> >>>
> >>> On Tue, Oct 20, 2020 at 12:14:49PM +0200, Hugues Fruchet wrote:
> >>>> Add support of BT656 parallel bus mode in DCMI.
> >>>> This mode is enabled when hsync-active & vsync-active
> >>>> fields are not specified.
> >>>>
> >>>> Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
> >>>> ---
> >>>>    .../devicetree/bindings/media/st,stm32-dcmi.yaml   | 30 ++++++++++++++++++++++
> >>>>    1 file changed, 30 insertions(+)
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> >>>> index 3fe778c..1ee521a 100644
> >>>> --- a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> >>>> +++ b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> >>>> @@ -44,6 +44,36 @@ properties:
> >>>>          bindings defined in
> >>>>          Documentation/devicetree/bindings/media/video-interfaces.txt.
> >>>>    
> >>>> +    properties:
> >>>> +      endpoint:
> >>>> +        type: object
> >>>> +
> >>>> +        properties:
> >>>> +          bus-width: true
> >>>> +
> >>>> +          hsync-active:
> >>>> +            description:
> >>>> +              If both HSYNC and VSYNC polarities are not specified, BT656
> >>>> +              embedded synchronization is selected.
> >>>> +            default: 0
> >>>> +
> >>>> +          vsync-active:
> >>>> +            description:
> >>>> +              If both HSYNC and VSYNC polarities are not specified, BT656
> >>>> +              embedded synchronization is selected.
> >>>> +            default: 0
> >>>
> >>> Should I understand this as if the polarities were not specified, BT.656
> >>> will be used?
> >>
> >> Yes, this is what is documented in video-interfaces.txt:
> >> "
> >>     Note, that if HSYNC and VSYNC polarities are not specified, embedded
> >>     synchronization may be required, where supported.
> >> "
> >> and
> >> "
> >> 				/* If hsync-active/vsync-active are missing,
> >> 				   embedded BT.656 sync is used */
> >> 				hsync-active = <0>;	/* Active low */
> >> 				vsync-active = <0>;	/* Active low */
> >> "
> >> and I found also this in
> >> Documentation/devicetree/bindings/media/renesas,vin.yaml
> >> "
> >>             hsync-active:
> >>               description:
> >>                 If both HSYNC and VSYNC polarities are not specified,
> >> embedded
> >>                 synchronization is selected.
> >>               default: 1
> >>
> >>             vsync-active:
> >>               description:
> >>                 If both HSYNC and VSYNC polarities are not specified,
> >> embedded
> >>                 synchronization is selected.
> >>               default: 1
> > 
> > Having the defaults leads to somewhat weird behaviour: specifying the
> > default value on either property changes the bus type.
> > 
> >> "
> >>
> >> In the other hand I've found few occurences of "bus-type"
> >> (marvell,mmp2-ccic.yaml), it is why I asked you if "bus-type" is the new
> >> way to go versus previous way to signal BT656 (without hsync/vsync) ?
> >> As explained previously, I prefer this last way for backward compatibility.
> > 
> > If you have a default for bus-type (BT.601), this won't be a problem.
> > 
> > The old DT bindings were somewhat, well, opportunistic. The v4l2-of
> > framework-let did its best and sometimes it worked. The behaviour is still
> > supported but not encouraged in new bindings.
> > 
> 
> OK, so let's go for the new way.
> I've found an interesting patch from Jacopo that is of great help:
> https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20200910162055.614089-4-jacopo+renesas@jmondi.org/
> 
> Here is a draft proposal before I push a new version, please comment:
> 
>          properties:
>            bus-type:
>              enum: [5, 6]
>              default: 5
> 
>            bus-width:
>              enum: [8, 10, 12, 14]
>              default: 8
> 
>            hsync-active:
>              enum: [0, 1]

For common properties, you can assume there's a common schema. As 0 and 
1 are the only possible values, you don't need to define them here 
unless only a subset is valid for this device.

>              default: 0
> 
>            vsync-active:
>              enum: [0, 1]
>              default: 0
> 
>            pclk-sample:
>              enum: [0, 1]
>              default: 0
> 
>            remote-endpoint: true
> 
>          allOf:
>            - if:
>                properties:
>                  bus-type:
>                    const: 6

To fix the error, you need:

required:
  - bus-type

The problem is the above schema is also true if the property 
is not present. 

>              then:
>                properties:
>                  hsync-active: false
>                  vsync-active: false
>                  bus-width:
>                    enum: [8]
> 
>          required:
>            - remote-endpoint
> 
>          unevaluatedProperties: false
> 
> 
> Unfortunately, the "default: 5" for bus-type is not working !!
> If we don't specify "bus-type" in example, dt_binding_check is failing 
> as if default was 6, it's hardly understandable (see below) !
>          port {
>               dcmi_0: endpoint {
>                     remote-endpoint = <&ov5640_0>;
>                     bus-width = <10>;
>                     hsync-active = <0>;
>                     vsync-active = <0>;
>                     pclk-sample = <1>;
>               };
> => this should be OK but error claimed:
>    DTC 
> Documentation/devicetree/bindings/media/st,stm32-dcmi.example.dt.yaml
>    CHECK 
> Documentation/devicetree/bindings/media/st,stm32-dcmi.example.dt.yaml
> Documentation/devicetree/bindings/media/st,stm32-dcmi.example.dt.yaml: 
> dcmi@4c006000: port:endpoint:vsync-active: False schema does not allow [[0]]
> dcmi@4c006000: port:endpoint:hsync-active: False schema does not allow [[0]]
> dcmi@4c006000: port:endpoint:bus-width:0:0: 10 is not one of [8]
> 	From schema: Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> 
> => if "bus-type" is explicitly set to 5, all is fine (see below) !
>          port {
>               dcmi_0: endpoint {
>                     remote-endpoint = <&ov5640_0>;
>                     bus-type = <5>;
>                     bus-width = <10>;
>                     hsync-active = <0>;
>                     vsync-active = <0>;
>                     pclk-sample = <1>;
>               };
>          };
> 
>   DTC 
> Documentation/devicetree/bindings/media/st,stm32-dcmi.example.dt.yaml
>    CHECK 
> Documentation/devicetree/bindings/media/st,stm32-dcmi.example.dt.yaml
> ~/.../media_tree$
> 
> 
> >>
> >>
> >> The bindings previously documented BT.601 (parallel) only, so
> >>> it was somewhat ambigious to begin with. Is there a risk of interpreting
> >>> old BT.601 bindings as BT.656?
> >> I don't think so.
> >>
> >> With bus-type property, I believe you could
> >>> avoid at least that risk.
> >> yes but as explained, I'll prefer not to amend current boards device
> >> tree files.
> > 
> > I don't think it matters from this point of view --- you can have a
> > default bus-type.
> > 
> >>
> >>>
> >>> Also not specifying at least one of the default values leads to BT.656
> >>> without bus-type. That could be addressed by removing the defaults.
> >>>
> >> I'm new to yaml, I've taken that from renesas,vin.yaml. Should I just
> >> drop the "default: 1" lines ?
> > 
> > That's one option, yes. Then you have to have those for BT.601 and it's no
> > longer ambiguous.
> > 
> 
> BR,
> Hugues.
