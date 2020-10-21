Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFD17295456
	for <lists+linux-media@lfdr.de>; Wed, 21 Oct 2020 23:41:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2506310AbgJUVlF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Oct 2020 17:41:05 -0400
Received: from mga01.intel.com ([192.55.52.88]:54841 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2506305AbgJUVlF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Oct 2020 17:41:05 -0400
IronPort-SDR: iDCnjjIjotc8Pv2Za8fnFciouGGEDKAPlJgR0XthBaJMiTuahmjKNWMLflprrjETyr2SILG6CX
 9u2iPr3SmJFQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9781"; a="185110865"
X-IronPort-AV: E=Sophos;i="5.77,402,1596524400"; 
   d="scan'208";a="185110865"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2020 14:41:05 -0700
IronPort-SDR: PAoDCxdHU0d23K3I4PsydeIL0k1YJM+cza2tMcFM0R/hIMaekgzpZ4j+tb9gKWXugqKueZTl4b
 1evJguTXcycw==
X-IronPort-AV: E=Sophos;i="5.77,402,1596524400"; 
   d="scan'208";a="359031374"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2020 14:41:00 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 660D7209D9; Thu, 22 Oct 2020 00:40:58 +0300 (EEST)
Date:   Thu, 22 Oct 2020 00:40:58 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hugues FRUCHET <hugues.fruchet@st.com>
Cc:     Alexandre TORGUE <alexandre.torgue@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>,
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
Message-ID: <20201021214058.GJ2703@paasikivi.fi.intel.com>
References: <1603188889-23664-1-git-send-email-hugues.fruchet@st.com>
 <1603188889-23664-3-git-send-email-hugues.fruchet@st.com>
 <20201021130033.GI2703@paasikivi.fi.intel.com>
 <657634eb-690a-53a6-2ac1-de3c06a1cec4@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <657634eb-690a-53a6-2ac1-de3c06a1cec4@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hugues,

On Wed, Oct 21, 2020 at 02:24:08PM +0000, Hugues FRUCHET wrote:
> Hi Sakari,
> 
> On 10/21/20 3:00 PM, Sakari Ailus wrote:
> > Hi Hugues,
> > 
> > On Tue, Oct 20, 2020 at 12:14:49PM +0200, Hugues Fruchet wrote:
> >> Add support of BT656 parallel bus mode in DCMI.
> >> This mode is enabled when hsync-active & vsync-active
> >> fields are not specified.
> >>
> >> Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
> >> ---
> >>   .../devicetree/bindings/media/st,stm32-dcmi.yaml   | 30 ++++++++++++++++++++++
> >>   1 file changed, 30 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> >> index 3fe778c..1ee521a 100644
> >> --- a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> >> +++ b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> >> @@ -44,6 +44,36 @@ properties:
> >>         bindings defined in
> >>         Documentation/devicetree/bindings/media/video-interfaces.txt.
> >>   
> >> +    properties:
> >> +      endpoint:
> >> +        type: object
> >> +
> >> +        properties:
> >> +          bus-width: true
> >> +
> >> +          hsync-active:
> >> +            description:
> >> +              If both HSYNC and VSYNC polarities are not specified, BT656
> >> +              embedded synchronization is selected.
> >> +            default: 0
> >> +
> >> +          vsync-active:
> >> +            description:
> >> +              If both HSYNC and VSYNC polarities are not specified, BT656
> >> +              embedded synchronization is selected.
> >> +            default: 0
> > 
> > Should I understand this as if the polarities were not specified, BT.656
> > will be used?
> 
> Yes, this is what is documented in video-interfaces.txt:
> "
>    Note, that if HSYNC and VSYNC polarities are not specified, embedded
>    synchronization may be required, where supported.
> "
> and
> "
> 				/* If hsync-active/vsync-active are missing,
> 				   embedded BT.656 sync is used */
> 				hsync-active = <0>;	/* Active low */
> 				vsync-active = <0>;	/* Active low */
> "
> and I found also this in 
> Documentation/devicetree/bindings/media/renesas,vin.yaml
> "
>            hsync-active:
>              description:
>                If both HSYNC and VSYNC polarities are not specified, 
> embedded
>                synchronization is selected.
>              default: 1
> 
>            vsync-active:
>              description:
>                If both HSYNC and VSYNC polarities are not specified, 
> embedded
>                synchronization is selected.
>              default: 1

Having the defaults leads to somewhat weird behaviour: specifying the
default value on either property changes the bus type.

> "
> 
> In the other hand I've found few occurences of "bus-type" 
> (marvell,mmp2-ccic.yaml), it is why I asked you if "bus-type" is the new 
> way to go versus previous way to signal BT656 (without hsync/vsync) ?
> As explained previously, I prefer this last way for backward compatibility.

If you have a default for bus-type (BT.601), this won't be a problem.

The old DT bindings were somewhat, well, opportunistic. The v4l2-of
framework-let did its best and sometimes it worked. The behaviour is still
supported but not encouraged in new bindings.

> 
> 
> The bindings previously documented BT.601 (parallel) only, so
> > it was somewhat ambigious to begin with. Is there a risk of interpreting
> > old BT.601 bindings as BT.656?
> I don't think so.
> 
> With bus-type property, I believe you could
> > avoid at least that risk.
> yes but as explained, I'll prefer not to amend current boards device 
> tree files.

I don't think it matters from this point of view --- you can have a
default bus-type.

> 
> > 
> > Also not specifying at least one of the default values leads to BT.656
> > without bus-type. That could be addressed by removing the defaults.
> > 
> I'm new to yaml, I've taken that from renesas,vin.yaml. Should I just 
> drop the "default: 1" lines ?

That's one option, yes. Then you have to have those for BT.601 and it's no
longer ambiguous.

-- 
Regards,

Sakari Ailus
