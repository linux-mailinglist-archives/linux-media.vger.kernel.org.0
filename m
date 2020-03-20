Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5204B18D500
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2020 17:54:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727532AbgCTQyl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Mar 2020 12:54:41 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:57073 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726983AbgCTQyl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Mar 2020 12:54:41 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MXp1O-1ilWR12zEq-00Y6LY for <linux-media@vger.kernel.org>; Fri, 20 Mar
 2020 17:54:39 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id 8471F650318
        for <linux-media@vger.kernel.org>; Fri, 20 Mar 2020 16:54:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id WyBUWWRFwAg4 for <linux-media@vger.kernel.org>;
        Fri, 20 Mar 2020 17:54:39 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 4496064C07F
        for <linux-media@vger.kernel.org>; Fri, 20 Mar 2020 17:54:39 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.41) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 20 Mar 2020 17:54:39 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 6E020804FB; Fri, 20 Mar 2020 17:15:39 +0100 (CET)
Date:   Fri, 20 Mar 2020 17:15:39 +0100
From:   Alex Riesen <alexander.riesen@cetitec.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        driverdevel <devel@driverdev.osuosl.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 07/10] dt-bindings: adv748x: add information about
 serial audio interface (I2S/TDM)
Message-ID: <20200320161539.GM4344@pflmari>
Mail-Followup-To: Alex Riesen <alexander.riesen@cetitec.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        driverdevel <devel@driverdev.osuosl.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <cover.1584639664.git.alexander.riesen@cetitec.com>
 <c9ff553f804f178a247dca356306948e971432fb.1584639664.git.alexander.riesen@cetitec.com>
 <20200319180125.GJ14585@pendragon.ideasonboard.com>
 <20200320084406.GB4344@pflmari>
 <CAMuHMdUdVb0LwZDx-MH2FLYYPvgq=uj_3Nrzo9obWAi-Q-2ZnA@mail.gmail.com>
 <20200320090339.GD4344@pflmari>
 <20200320095907.GB5193@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200320095907.GB5193@pendragon.ideasonboard.com>
X-Originating-IP: [10.8.5.41]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6D7660
X-Provags-ID: V03:K1:2D8QMGGdtLfVHu9ghC8uDkD3ntZCMA02R+fc80xqQ0EAHIGWu/K
 Iqq3bnVTz+Y2FOlWvUTt7usIpppdfvvA9JGHJFdc3Ysmb7w9NiIc5+6YeF/bdhl+bV1wjQc
 037xgRixtivU8KNAcLZkS2RkNO6MCjtOLkDOu5PLCqglU+ky/2g4DQaTQhTj3ehdTEwCPn9
 hVijjf5WFh+kKhRD8DZ9g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:YmFeKhpVW1I=:PZHxyZJgHPRrwwG/CGfXB2
 piL/LXELjkPbQ0Tc1DX/RP9lSf5HQ9Z7WkgbBLRrzOK3K8/nCq7BVUMue9F9yCNGBy1YrAgL/
 Lax2tLxbasjflSQ3b0fvoWUnU/LC1kZPZm2kVL/ClR08LUdR3tND0kDalhZkL7Q0Gbg+7MsTY
 tpuHsICIu2hpzaR0iXcCjyu2dKh2kwVKbh/oPzmntNc33QWMutdhPMdDRG3A0wGhDUuwxoclm
 4v6bALlmbQHY+dA042WT8XXpLThg7CCbwnFVG6ijkMSpsYXtKeHJ5rOfv9zJBBpgIDXFIS05A
 ZZCyfTWToYQHsEFfiXCodWiO3zAaRNXqTRlH9jQdQzkZX5vY742rjnCs2ht4DGcGgiL3k4M+U
 SrcLuu58euYhbGpNeWPMo1dgLwxJuFRHUtkAfNZE5xhGB6bmUhLRUqim4jpFM1dplkAjFQyX4
 /T2yDqLwzVsVrkrF4vzvhgSPMZ+FHmSwYvwpC6DF5UHmDVMAPLykPD27QKjWuop5YIuC/quwU
 uYBAk/QVHnmpqhTLKl19+Y1+e9sfNf9vVTGKy+yFJsa5mQM7L/9UJVrLt3Pm5VZEQL9MCoPel
 a5Cstix+CmQvVoJ9uXOj32gR180h+WwCitHeIU67HOFPesO6OnkGQ9POlwEI1mPEwei5Denu0
 Qsiraeci0u/vveyBJ/u6+RtqHKu1YBoLiUb5J/NHMzFydjnM3/b+SzALWhyjPadLAB9BTZmP7
 iK/M81FBcDYzhBiZLVqaWxLZtq/3Pd1lAbc9GJ0ueRScF+vJ/TvTHgxXWCXEkHD4h6dzOk9Kk
 1PMg10CJABGpHOO2/ZKlMB23HuExjIQBfXY3Eu0NyubK81aGwldOV2a7ZZFHPbi61ADZ/87
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Laurent Pinchart, Fri, Mar 20, 2020 10:59:07 +0100:
> On Fri, Mar 20, 2020 at 10:03:39AM +0100, Alex Riesen wrote:
> > Geert Uytterhoeven, Fri, Mar 20, 2020 09:48:14 +0100:
> > > 
> > > You'd be surprised how many board designers would consider this a cheap
> > > 12.288 MHz clock source, without using the I2S port ;-)
> > 
> > Well, I am :-)
> > 
> > Especially considering that the driver will not switch the MCLK pin aktive
> > (all I2S-related pins are tristate by default).
> 
> If the MCLK can't be output without enabling the I2S then I don't mind
> if we make the #clock-cells optional, although, as Geert mentioned,
> someone may still want to use it.

So I settled on just removing the option.

> > And how do I require it to be set unconditionally? By just removing the
> > "if ..." part of the statement?
> 
> Yes. For YAML it's easy too, the hard part is making properties
> conditional :-)

Converting it into YAML turned out a bit more than just reformatting:
some of the explicit bindings schema is only implied in the text format :-(

Takes a while to find out what is what.

Regards,
Alex
