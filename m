Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BA6118C916
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2020 09:44:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726892AbgCTIo1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Mar 2020 04:44:27 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:49081 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726840AbgCTIo1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Mar 2020 04:44:27 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MybCV-1jTkX62qwH-00z0Lk; Fri, 20 Mar 2020 09:44:09 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id 2A43D64EDB5;
        Fri, 20 Mar 2020 08:44:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Fqynkc17UHyF; Fri, 20 Mar 2020 09:44:06 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id C8C3B64E62D;
        Fri, 20 Mar 2020 09:44:06 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.41) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 20 Mar 2020 09:44:06 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 2D04680524; Fri, 20 Mar 2020 09:44:06 +0100 (CET)
Date:   Fri, 20 Mar 2020 09:44:06 +0100
From:   Alex Riesen <alexander.riesen@cetitec.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Hans Verkuil" <hverkuil-cisco@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>,
        "Mark Rutland" <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        <devel@driverdev.osuosl.org>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 07/10] dt-bindings: adv748x: add information about
 serial audio interface (I2S/TDM)
Message-ID: <20200320084406.GB4344@pflmari>
Mail-Followup-To: Alex Riesen <alexander.riesen@cetitec.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <cover.1584639664.git.alexander.riesen@cetitec.com>
 <c9ff553f804f178a247dca356306948e971432fb.1584639664.git.alexander.riesen@cetitec.com>
 <20200319180125.GJ14585@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200319180125.GJ14585@pendragon.ideasonboard.com>
X-Originating-IP: [10.8.5.41]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6D7764
X-Provags-ID: V03:K1:rFcvTXOoLPYDRbVfFhT22Wt62I5VihsPzi6zafn0stRiM5xLY76
 +AmIxAt8zqRtowTPqJutb56ipBxb0u1ffxpbaoql1qwWluCMjqYUHAw5RyHWIlJHLh4Rirm
 bH53ZT+MXduf2IE1ITBu/MU0ENlcMkBY99/mTklAwFjmnOEi4T7KVhSNt0mJYs7DfCO13y6
 Di5yPEOdV8krpN3bdU5/g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:mswBXOQ5PT4=:U77oJltjJGtDj65s1Tgwzg
 M3TllGTuE/rZEnt6V9I4MaktxU9j/lO1NhRmAuuRu9o0JqkP8T4WU49dDa/SDBHL1f9N4i1+S
 q4Zft5iFsabCqPFrQBktEhUBMYFXj4t0k+y5aBUke0yI6R2jaERvT2wkCtnfSeBmj42uJ9RxY
 5VoLY0QGEfqN/XLy3Br6GwZlP0f5pienPJQW3gHiA0mD2PJGv1WbnVVvPYVN2gAwgoNJpPA7w
 8YE5AX1FQO7J4HEaeh/X4Vx0xDgnlojc0LCvHVNxbUttQkcmu0A/DBAniHCBSN+1mF/XLqVra
 L/ZwoB0qnInUMZgTBC+ABRV15DxDP/aBNlLbYQs274x4DjiS8qsEIroP0XN/HP/7YVLuYCGTF
 Mknu/NZnibCNOg/Obp2d+Hn4x9efHhVmGQjhU8PQ09Czs64Rd5AhK4Wj+iuRaLJWD2VBdh6ya
 Ka4Y0a5y18Cd18iurKH+TW0LU9r3JOM9wL9mad8PvMsT+yfJIcAbf8uyB66Eiu8HV+udv9p2p
 vdjWoGVr8LpiAKVzx4xc5RuykSR9TME0BjCxjpu0mLv3AUNRBGnQ37/XfdggvCrcynif4H48g
 BaJvsSpZhO7EJ+jWGU+z/ZuQGl/KwFwIg2A1MZjOqLBrbwMeBzu3PtHJzclg5NK13JtMjsyLl
 BdGmVqfBFFoidRYZZb6Tfc2CTpChcX2REbVMSZYlaKrmhH5ODgPNhL25ZtjkZ4VXa3I3OU5Eq
 jGBD1nRHMCdbS93AmLIsl2yc/hlhWeGOh+PWPJ0aqPepL0kJBEp7BtlN/ufRmI8KjuCW53jFa
 ODiumUxlrp4zotTl8Ac89ns8GBmPR0yrmEN4vDCv84c5A5DPuuvl/cdfCkV/Qg3VJCkX98p
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Laurent Pinchart, Thu, Mar 19, 2020 19:01:25 +0100:
> On Thu, Mar 19, 2020 at 06:42:36PM +0100, Alex Riesen wrote:
> > As the driver has some support for the audio interface of the device,
> > the bindings file should mention it.
> 
> While at it, how about converting the bindings to YAML ? :-) It can of
> course be done on top.

Of course. I shall take a look at that.

> >  The ADV7481 and ADV7482 are multi format video decoders with an integrated
> >  HDMI receiver. They can output CSI-2 on two independent outputs TXA and TXB
> > -from three input sources HDMI, analog and TTL.
> > +from three input sources HDMI, analog and TTL. There is also support for an
> > +I2S compatible interface connected to the audio processor of the HDMI decoder.
> 
> s/I2S compatible/I2S-compatible/ ?

Done.

> > +The interface has TDM capability (8 slots, 32 bits, left or right justified).
> >  
> >  Required Properties:
> >  
> > @@ -16,6 +18,8 @@ Required Properties:
> >      slave device on the I2C bus. The main address is mandatory, others are
> >      optional and remain at default values if not specified.
> >  
> > +  - #clock-cells: must be <0> if the I2S port is used
> 
> Wouldn't it be simpler to set it to 0 unconditionally ?

Would it? If the port itself is optional, shouldn't the clock be an option
too?

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks!

Regards,
Alex

