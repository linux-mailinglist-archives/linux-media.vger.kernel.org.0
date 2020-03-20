Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A9C318C98F
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2020 10:08:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727093AbgCTJIo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Mar 2020 05:08:44 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:38943 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726602AbgCTJIo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Mar 2020 05:08:44 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MjBNV-1jj4si1s7J-00f7hk; Fri, 20 Mar 2020 10:08:29 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id 980C964FD3A;
        Fri, 20 Mar 2020 09:08:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id EbSnlHvf-AW5; Fri, 20 Mar 2020 10:08:27 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 306B264C7C8;
        Fri, 20 Mar 2020 10:08:27 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.41) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 20 Mar 2020 10:08:27 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 8E5AA8051E; Fri, 20 Mar 2020 10:08:26 +0100 (CET)
Date:   Fri, 20 Mar 2020 10:08:26 +0100
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
Subject: Re: [PATCH v2 03/10] media: adv748x: reduce amount of code for
 bitwise modifications of device registers
Message-ID: <20200320090826.GE4344@pflmari>
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
 <099ebaa317156ec8edab973d0445851337139e6b.1584639664.git.alexander.riesen@cetitec.com>
 <20200319180614.GL14585@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200319180614.GL14585@pendragon.ideasonboard.com>
X-Originating-IP: [10.8.5.41]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6D7764
X-Provags-ID: V03:K1:GyfE3ge5dmMuJn+E68M2Bvu+1hVUKfBccN31Q0J8lSRwpfZtuoi
 4VOjT4n+AMeUJmDaIqgbbDEMXYrE6u60hxfOSDKQfqmTaxyp22ykfgbHYpriPMkRjmPMUS3
 PGiZjHQ0EflMC3YfvPOnCUfKS0X00CrYtBbnyZIrSziijPOCAh3Ap+TOxh5z1B9XyK0Uk5v
 Txuvu8681A+Kp41klS7Sw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:wpgr3zQ1hOI=:CrXtxd9Io/+n37h8ZS8OCW
 mIcXBISOpY6MvadLKr3exW8jmSn5ikIDxZmGYFS1IQnGXgzcbRtagRXYybYIM5dACzitlRmRw
 uQxQ5y41G3TIYdCSeg5mhNy5LQGGobA9RxJyLxA3KUy2QMBq6ZVgs6Y95UNu2ZpPmA3eaK1BS
 3yXTmDKin9vF7WXC88SzIBgBZqnZTcnVmAQClV3tX5M74e8ZMH/0QKNnh9h+tabEU7ZNLyZGo
 Tn83JhUhvZiCOE5QVL6ok5ddIUEjPD/FBqxBZdIO4n0R/aU2h9BACQaN/zzcY0mNX0t4ha8H+
 C65h2fmsrt877FiWugLd7NyqtuDUXBEFz5crPcNAVlr3wHPsL9C0Qt0jXX5G+pv6yIfvvKHVM
 dxWWXXeBWU9gfi5ctBt6/+lIExlimA0TlrTXc8hrLwn2qbO1ud6AzF8b56JZoWdarNRgNpXI0
 5uKRXH9a7IxD1djb6IuvZhxjLrWQqiMWTYkRD/sbT1Qtuy7lfnugc42+9ZWwCgxwLVhIqc9Z7
 V98PQsHC3hKShSVZ0pJKWH/qFrLexQX9lEUS2izfTWSc0RM0bD7rZOsId7vjLKI4VFfTb5Xl4
 Ra7XEnRX+5qIvXPHsUsMVMBJrDmQvVPMu/IcryAqL2w8LBKYwfoGToeSaOtsLTlm81urNMoqy
 D2Wm0auDbIqTD9LHh3LVjCOB5ME83WnOi3DOf4MLNEgOYw8UefMVwJifVswmr2T9WSm1pO7Hd
 ibMIWzTZ37oHIU2w6vlMIIoK6phSX8nc3RML2kJntVjmeYl8ZewWxMgz5BAqHQCJSfIMV7URt
 DyoH3XpYYfTerofP2Tsn919N0X9VA8Bjo526SF7gCYSIgbJcrOANbYOmkCmpbYkH1IdvxpU
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Laurent Pinchart, Thu, Mar 19, 2020 19:06:14 +0100:
> On Thu, Mar 19, 2020 at 06:41:53PM +0100, Alex Riesen wrote:
> >  #define io_read(s, r) adv748x_read(s, ADV748X_PAGE_IO, r)
> >  #define io_write(s, r, v) adv748x_write(s, ADV748X_PAGE_IO, r, v)
> > -#define io_clrset(s, r, m, v) io_write(s, r, (io_read(s, r) & ~(m)) | (v))
> > +#define io_clrset(s, r, m, v) adv748x_update_bits(s, ADV748X_PAGE_IO, r, m, v)
> > +#define io_update(s, r, m, v) adv748x_update_bits(s, ADV748X_PAGE_IO, r, m, v)
> 
> Those two are identical. Do we need both ? I would standardize on either
> *_update or *_clrset for all the functions here. Apart from that,

Shame on me. *_clrset that is (it was there before me).

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks!

Regards,
Alex
