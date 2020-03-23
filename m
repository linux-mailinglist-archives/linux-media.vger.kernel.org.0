Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8B7A18F05D
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2020 08:38:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727488AbgCWHiY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Mar 2020 03:38:24 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:47627 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727441AbgCWHiY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Mar 2020 03:38:24 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MMoXE-1iziBQ06k8-00InuR for <linux-media@vger.kernel.org>; Mon, 23 Mar
 2020 08:38:16 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id C76A26503EB
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2020 07:38:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 1bfVfd3ZqxDr for <linux-media@vger.kernel.org>;
        Mon, 23 Mar 2020 08:38:15 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 7AEB264CE94
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2020 08:38:15 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.4) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 23 Mar 2020 08:38:15 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id A763D804FB; Mon, 23 Mar 2020 08:35:57 +0100 (CET)
Date:   Mon, 23 Mar 2020 08:35:57 +0100
From:   Alex Riesen <alexander.riesen@cetitec.com>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Hans Verkuil" <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        "Mark Rutland" <mark.rutland@arm.com>,
        <devel@driverdev.osuosl.org>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 08/10] arm64: dts: renesas: salvator: add a connection
 from adv748x codec (HDMI input) to the R-Car SoC
Message-ID: <20200323073557.GA4298@pflmari>
Mail-Followup-To: Alex Riesen <alexander.riesen@cetitec.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devel@driverdev.osuosl.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <cover.1584639664.git.alexander.riesen@cetitec.com>
 <ebda055ae4c898b4ca29e518f89d8f3f4be4d27c.1584639664.git.alexander.riesen@cetitec.com>
 <87fte0lyjz.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87fte0lyjz.wl-kuninori.morimoto.gx@renesas.com>
X-Originating-IP: [10.8.5.4]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6D7066
X-Provags-ID: V03:K1:AfnzSDuaOpnyOlRxvphHFi7dFOAqfmPMphOtyGnWrkSXZ99qhRn
 22IazMIzZs3GUqw7ZouUmdzAI4NLiUIG1t6+ptc1SFZY0aLmrtjLXSXARlBCh/SudyDrJue
 pB7tZtdaxlu9guF4TUs8YR2yjBjoagH+tt5ijx2FbzxZ8Uwk/NwBpMYr0ecKU3ivxaO8w3k
 qNoUk+9vTbAOUdh20n45g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:RJLJMeJ5M44=:7AW48KnQduabwC86NQv/+M
 e+lFIx8ch8g3rOOpAnstN31yNXGnl4m9uDD+dFpSB6OengLH4AruLzsHgpYjAo5uCHoHeVhwP
 jTI4vVnFJShSnU8MUWhNJb9UHVCgxkPI4Ona4jx6KBsbABkG2RcJxnBxYe3gSbN1JKrurQI9G
 Riqx/0vIQERusV8tXa3Ws3uTnS7LOMVqff8KOus4qqBhgt551zIUvaA//6dHeEoTsRI4iiuUb
 NIaWKykTm94PVgby9NxgQu/e8ul4n7yy1flmT8W078P+jASiAVdzOMi/OTm/B9le8fiSF63PE
 En2oe+Ohrg9sWkhPdoGemtfWLFzA2q/WGSdAPDxRw9/Bzw0e0mHssY+RDQWwoRLP68vGBSfHP
 PD1EXl5LQFPqc+grb0zAneeCJHq3orSIHKyvqkKzRCiLLabtwt31b8XEDOtImzKKu1PI4xkb9
 vS3ftcmXYBZtCT4rWMJiYPhb0jpMApB3QZvlhJim2TnKJRjTih/hjItC3BeVHfGGqzPB3oAgT
 BBSIZZoVAWiYJhAHGM4TFvqwjzab46JXqVw5Vq859SkcLxaIVjSjrNP0zPisRoe0a4dth5V8g
 OQJ/+UN82iG/cwg8FvT2FLeTzbgt2QpGEfMr+u/tAu6C2g+VJanc+I+hCjbzlGXu232yHORsb
 wtmn6kuNx6QNFey2xDuj5aBj8VbxadsJjwIo1g7GFWJPhc4a1Yw/A1QR1SLogHaW9LBha67Wa
 zKPyYAGLK9fvhJy4E4CFvnhFEpPCzWNFPLHHolOkPJPxgSHK545mv3Hq0lgpP7uMm+r5dsdlI
 NfGU/Xj1Uc5njwE5FHqHqUHE3vr/woDqH+p7chLEa+c2QBF1jN4EKGL9hK3mx+B1iBcmNq9
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Morimoto-san,

Kuninori Morimoto, Mon, Mar 23, 2020 01:12:00 +0100:
> > As all known variants of the Salvator board have the HDMI decoder
> > chip (the ADV7482) connected to the SSI4 on R-Car SoC, the ADV7482
> > endpoint and the connection definitions are placed in the common board
> > file.
> > For the same reason, the CLK_C clock line and I2C configuration (similar
> > to the ak4613, on the same interface) are added into the common file.
> > 
> > Signed-off-by: Alexander Riesen <alexander.riesen@cetitec.com>
> > Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> (snip)
> > @@ -758,8 +769,19 @@ &rcar_sound {
> >  		 <&cpg CPG_MOD 1020>, <&cpg CPG_MOD 1021>,
> >  		 <&cpg CPG_MOD 1019>, <&cpg CPG_MOD 1018>,
> >  		 <&audio_clk_a>, <&cs2000>,
> > -		 <&audio_clk_c>,
> > +		 <&adv7482_hdmi_in>,
> >  		 <&cpg CPG_CORE CPG_AUDIO_CLK_I>;
> > +	clock-names = "ssi-all",
> > +		      "ssi.9", "ssi.8", "ssi.7", "ssi.6",
> > +		      "ssi.5", "ssi.4", "ssi.3", "ssi.2",
> > +		      "ssi.1", "ssi.0",
> > +		      "src.9", "src.8", "src.7", "src.6",
> > +		      "src.5", "src.4", "src.3", "src.2",
> > +		      "src.1", "src.0",
> > +		      "mix.1", "mix.0",
> > +		      "ctu.1", "ctu.0",
> > +		      "dvc.0", "dvc.1",
> > +		      "clk_a", "clk_b", "clk_c", "clk_i";
> 
> I think you don't need to overwrite clock-names here in this case ?

I vaguely remember something using the names and failing to enable clk_c
without the list spelled out...

I shall re-test though, perhaps it was my own code (since removed) using it.

Regards,
Alex

