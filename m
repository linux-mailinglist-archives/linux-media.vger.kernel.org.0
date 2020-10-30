Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBF1A2A0F36
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 21:09:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727154AbgJ3UJm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 16:09:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:44754 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727044AbgJ3UJY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 16:09:24 -0400
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A3C8A20723;
        Fri, 30 Oct 2020 20:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604088562;
        bh=dsb2fGpwSeCxaqOUaIEQtAt8Ev0KBIXRf/w3waNhKws=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=C7kxkKrxR6DMsZCWkCPW2z3xH1cj5sJoA50H0JjBsmJ5y+NZkzIscLRN8uh9+LmvV
         rC5P1iFjJTq9PMYwOq6pLF4EksuZ9zTcv/WO0lE4JKrT+5pwQPfHId9AoRgXB1u1AJ
         qyx82wFKRb9ICX5wZkT44IM9eVY6IWMXRzsQqGHk=
Received: by mail-oi1-f178.google.com with SMTP id j7so7841421oie.12;
        Fri, 30 Oct 2020 13:09:22 -0700 (PDT)
X-Gm-Message-State: AOAM530GXqa8PqEBfmITeCu9GjzdWEpL8aO8zreuvqXoxNBnNaNEBHW2
        8qLHqMTSyIhVXeXHzlY2mt7qACZZuqpez+/8ug==
X-Google-Smtp-Source: ABdhPJxMveXb1QdoW8X4k60f8AsyuwhhjJRLNbCCb75J76E+r24ilhIfqWLz6ySjO7R/sD1GTdxpf4/zJ14/IGJYpM0=
X-Received: by 2002:aca:5dc2:: with SMTP id r185mr2849061oib.106.1604088561838;
 Fri, 30 Oct 2020 13:09:21 -0700 (PDT)
MIME-Version: 1.0
References: <1603188889-23664-1-git-send-email-hugues.fruchet@st.com>
 <1603188889-23664-3-git-send-email-hugues.fruchet@st.com> <20201021130033.GI2703@paasikivi.fi.intel.com>
 <657634eb-690a-53a6-2ac1-de3c06a1cec4@st.com> <20201021214058.GJ2703@paasikivi.fi.intel.com>
 <327ae9d5-8683-488f-7970-4983e2fec51d@st.com> <20201026141714.GA83693@bogus> <20201030174236.GV26150@paasikivi.fi.intel.com>
In-Reply-To: <20201030174236.GV26150@paasikivi.fi.intel.com>
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 30 Oct 2020 15:09:10 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+po4grPDJH6=ayFWrO5J=GzmSHNsgRjQ=ERsVCYzVXQg@mail.gmail.com>
Message-ID: <CAL_Jsq+po4grPDJH6=ayFWrO5J=GzmSHNsgRjQ=ERsVCYzVXQg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] media: dt-bindings: media: st,stm32-dcmi: Add
 support of BT656
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hugues FRUCHET <hugues.fruchet@st.com>,
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 30, 2020 at 12:42 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Rob,
>
> On Mon, Oct 26, 2020 at 09:17:14AM -0500, Rob Herring wrote:
> > On Thu, Oct 22, 2020 at 02:56:17PM +0000, Hugues FRUCHET wrote:
> > > Hi Sakari,
> > >
> > > + Jacopo for his work on ov772x binding related to BT656
> > >
> > > On 10/21/20 11:40 PM, Sakari Ailus wrote:
> > > > Hi Hugues,
> > > >
> > > > On Wed, Oct 21, 2020 at 02:24:08PM +0000, Hugues FRUCHET wrote:
> > > >> Hi Sakari,
> > > >>
> > > >> On 10/21/20 3:00 PM, Sakari Ailus wrote:
> > > >>> Hi Hugues,
> > > >>>
> > > >>> On Tue, Oct 20, 2020 at 12:14:49PM +0200, Hugues Fruchet wrote:
> > > >>>> Add support of BT656 parallel bus mode in DCMI.
> > > >>>> This mode is enabled when hsync-active & vsync-active
> > > >>>> fields are not specified.
> > > >>>>
> > > >>>> Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
> > > >>>> ---
> > > >>>>    .../devicetree/bindings/media/st,stm32-dcmi.yaml   | 30 ++++++++++++++++++++++
> > > >>>>    1 file changed, 30 insertions(+)
> > > >>>>
> > > >>>> diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> > > >>>> index 3fe778c..1ee521a 100644
> > > >>>> --- a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> > > >>>> +++ b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> > > >>>> @@ -44,6 +44,36 @@ properties:
> > > >>>>          bindings defined in
> > > >>>>          Documentation/devicetree/bindings/media/video-interfaces.txt.
> > > >>>>
> > > >>>> +    properties:
> > > >>>> +      endpoint:
> > > >>>> +        type: object
> > > >>>> +
> > > >>>> +        properties:
> > > >>>> +          bus-width: true
> > > >>>> +
> > > >>>> +          hsync-active:
> > > >>>> +            description:
> > > >>>> +              If both HSYNC and VSYNC polarities are not specified, BT656
> > > >>>> +              embedded synchronization is selected.
> > > >>>> +            default: 0
> > > >>>> +
> > > >>>> +          vsync-active:
> > > >>>> +            description:
> > > >>>> +              If both HSYNC and VSYNC polarities are not specified, BT656
> > > >>>> +              embedded synchronization is selected.
> > > >>>> +            default: 0
> > > >>>
> > > >>> Should I understand this as if the polarities were not specified, BT.656
> > > >>> will be used?
> > > >>
> > > >> Yes, this is what is documented in video-interfaces.txt:
> > > >> "
> > > >>     Note, that if HSYNC and VSYNC polarities are not specified, embedded
> > > >>     synchronization may be required, where supported.
> > > >> "
> > > >> and
> > > >> "
> > > >>                          /* If hsync-active/vsync-active are missing,
> > > >>                             embedded BT.656 sync is used */
> > > >>                          hsync-active = <0>;     /* Active low */
> > > >>                          vsync-active = <0>;     /* Active low */
> > > >> "
> > > >> and I found also this in
> > > >> Documentation/devicetree/bindings/media/renesas,vin.yaml
> > > >> "
> > > >>             hsync-active:
> > > >>               description:
> > > >>                 If both HSYNC and VSYNC polarities are not specified,
> > > >> embedded
> > > >>                 synchronization is selected.
> > > >>               default: 1
> > > >>
> > > >>             vsync-active:
> > > >>               description:
> > > >>                 If both HSYNC and VSYNC polarities are not specified,
> > > >> embedded
> > > >>                 synchronization is selected.
> > > >>               default: 1
> > > >
> > > > Having the defaults leads to somewhat weird behaviour: specifying the
> > > > default value on either property changes the bus type.
> > > >
> > > >> "
> > > >>
> > > >> In the other hand I've found few occurences of "bus-type"
> > > >> (marvell,mmp2-ccic.yaml), it is why I asked you if "bus-type" is the new
> > > >> way to go versus previous way to signal BT656 (without hsync/vsync) ?
> > > >> As explained previously, I prefer this last way for backward compatibility.
> > > >
> > > > If you have a default for bus-type (BT.601), this won't be a problem.
> > > >
> > > > The old DT bindings were somewhat, well, opportunistic. The v4l2-of
> > > > framework-let did its best and sometimes it worked. The behaviour is still
> > > > supported but not encouraged in new bindings.
> > > >
> > >
> > > OK, so let's go for the new way.
> > > I've found an interesting patch from Jacopo that is of great help:
> > > https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20200910162055.614089-4-jacopo+renesas@jmondi.org/
>
> I wonder if Jacopo tested it. The idea seems interesting nonetheless.
>
> > >
> > > Here is a draft proposal before I push a new version, please comment:
> > >
> > >          properties:
> > >            bus-type:
> > >              enum: [5, 6]
> > >              default: 5
> > >
> > >            bus-width:
> > >              enum: [8, 10, 12, 14]
> > >              default: 8
> > >
> > >            hsync-active:
> > >              enum: [0, 1]
> >
> > For common properties, you can assume there's a common schema. As 0 and
> > 1 are the only possible values, you don't need to define them here
> > unless only a subset is valid for this device.
> >
> > >              default: 0
> > >
> > >            vsync-active:
> > >              enum: [0, 1]
> > >              default: 0
> > >
> > >            pclk-sample:
> > >              enum: [0, 1]
> > >              default: 0
> > >
> > >            remote-endpoint: true
> > >
> > >          allOf:
> > >            - if:
> > >                properties:
> > >                  bus-type:
> > >                    const: 6
> >
> > To fix the error, you need:
> >
> > required:
> >   - bus-type
> >
> > The problem is the above schema is also true if the property
> > is not present.
>
> Hmm. The idea was that we could keep this consistent with old bindings that
> only documented parallel mode, and thus didn't need bus-type. This is
> actually quite common --- adding support for something that wasn't known or
> cared for during the original review.

TBC, the 'required' here is required for the 'if' in the if/then
schema to work as you want. It's not making 'bus-type' a required
property.

Rob
