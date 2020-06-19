Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1C6720054D
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2020 11:35:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731888AbgFSJe4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Jun 2020 05:34:56 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:39573 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729195AbgFSJeY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Jun 2020 05:34:24 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1Mk0a0-1j1vIw3f8i-00kQSb; Fri, 19 Jun 2020 11:34:02 +0200
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id C6E456518F7;
        Fri, 19 Jun 2020 09:34:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id imaCpHMlptGZ; Fri, 19 Jun 2020 11:34:01 +0200 (CEST)
Received: from pflmari.corp.cetitec.com (unknown [10.10.5.94])
        by mail.cetitecgmbh.com (Postfix) with ESMTPSA id 7EC9B65101C;
        Fri, 19 Jun 2020 11:34:01 +0200 (CEST)
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 39001804FB; Fri, 19 Jun 2020 11:34:01 +0200 (CEST)
Date:   Fri, 19 Jun 2020 11:34:01 +0200
From:   Alex Riesen <alexander.riesen@cetitec.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 9/9] arm64: dts: renesas: salvator: add a connection
 from adv748x codec (HDMI input) to the R-Car SoC
Message-ID: <20200619093401.GC7780@pflmari>
Mail-Followup-To: Alex Riesen <alexander.riesen@cetitec.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <cover.1585852001.git.alexander.riesen@cetitec.com>
 <90f2c14fcbe5d06eefdaeadbe8a6efc8c91523f3.1585852001.git.alexander.riesen@cetitec.com>
 <fd19ca3c-e815-499e-0c46-0a4e2684b6b9@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fd19ca3c-e815-499e-0c46-0a4e2684b6b9@ideasonboard.com>
X-Provags-ID: V03:K1:6hRrqFEh5C6YLlVBCD2cmTMQVlqVh0XZanELx8BbCR+f3axPgeL
 AN+rfxe2SLHaB2j8Jwu4tYzy8bLyyGdexHJD7SektcqP7r9CnI5bggzgkzhwtiHRS4D02+U
 xXdLbA2mHSwf8dExOEf1Qnz39giJ77pfzF9/1zkZdQEDgSu+0l9714+LBKDL5waWfQ/Vxgt
 NV5Du39Q/5WP0KXEjInIw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZUe7ElXwZOQ=:+idjBDE4aBudMjQHkAgSLK
 pAd2mOYTOnUBNpn61Otce9qCkHArtzF71ds7Kq51NdJHTDEyiGl+ajooz5KdM08ZprHjzsUmW
 2yiAOhnw72G3iskjQKp4WoaeVGZRlHePjqc8Z2MvdfRsQ6r6iP1EmsgLZVypUjU/zMxFabpSq
 oeKTrtS65tDvnKtflB8kxurmXIcNcvnGK/0FMcnB4pGzyD7tB3G3EVx+YNm4Ill/r2Pso/amS
 BBAafCnd03zSYU5JrBwhMWK+q0H5JYlDhZ7vJmIgqxnb1UorF3AprL9aop5iZBUovqJOLMLGC
 Gm2OCgfDNzOi3PCLshFL/dSNiSepkAvv7U93lUyg8NnRbSZFP7UxPmvonScL/3wC1HPBWEour
 itmUAHbsQs1eswpKu6EXQbjYpoTM3djPiXzhRF8fQmMqCX6uhDqUK01zALgd7UI+DkupKcCjU
 ro091c+uqYyPG5IwzPpOrohkw/TGJh910tAwTEsq8OUdo8DRQ0QqeyoMNTV/w6g6bS7HPjLAO
 DE8ngdZ42Kvi+JdZsVAvROJHeqvPmBSJinL1qCy9zhAUjdeELAQFH+8siWXfWa6JIXnunnOVf
 wIZN2QJ56h1pt8h23P1MgM/A3YGQm4/HP3ZQzALlbEblqrsaMe61wX60x1iiNkw2JtstO9HEv
 QJ1mmuzKCBF1sNULj6hNbn/Kxe1nuXBdfsKnbprhzgeS551wkOA4kj4Z6ShDiPp5lW9vJRogY
 lY4P/DPNyDsnSmOPNOiO6GjKDDX8o28SS2QGlYN+Mbfj4Im//GvO46gJLDvnofKYonlrFrT5y
 IlQJmvR7vuBSED58mZZSce1Li9zXGabjNuV+aPwisiTXSV2T6x9A4XxTtZ00VC2DKyxHb+u
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Kieran Bingham, Thu, Jun 18, 2020 18:32:55 +0200:
> On 02/04/2020 19:35, Alex Riesen wrote:
> > --- a/arch/arm64/boot/dts/renesas/r8a77950-salvator-x.dts
> > +++ b/arch/arm64/boot/dts/renesas/r8a77950-salvator-x.dts
> > @@ -146,7 +146,8 @@ &sata {
> >  &sound_card {
> >  	dais = <&rsnd_port0	/* ak4613 */
> >  		&rsnd_port1	/* HDMI0  */
> > -		&rsnd_port2>;	/* HDMI1  */
> > +		&rsnd_port2	/* HDMI1  */
> > +		&rsnd_port3>;	/* adv7482 hdmi-in  */
> 
> Ah - that was confusing at first... but HDMI0 and HDMI1 are *outputs*,
> where of course the adv7482 is an input ;-)

And ak4613 is both... Why? Are the "dais" of a sound_card more commonly
outputs than inputs?

> Otherwise, I can't spot anything else yet so:
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> But I fear there may have been some churn around here, so it would be
> good to see a rebase too.

Just rebased the series on top of linux-media/master and the only conflict was
in adding ssi4 node to rcar_sound,ssi in r8a77961.dtsi, as there was an
addition of ssi2 in the same line.

Thanks,
Alex

