Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E677318F10B
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2020 09:42:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727618AbgCWIme (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Mar 2020 04:42:34 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:50375 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727477AbgCWImd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Mar 2020 04:42:33 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MKKd7-1iyMPH0aFT-00LmdS for <linux-media@vger.kernel.org>; Mon, 23 Mar
 2020 09:42:32 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id EC4356503F9
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2020 08:42:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id bGTGHF5WWY-G for <linux-media@vger.kernel.org>;
        Mon, 23 Mar 2020 09:42:31 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 9D6AF64F3C4
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2020 09:42:31 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.4) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 23 Mar 2020 09:42:31 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id C14E8804FB; Mon, 23 Mar 2020 09:40:11 +0100 (CET)
Date:   Mon, 23 Mar 2020 09:40:11 +0100
From:   Alex Riesen <alexander.riesen@cetitec.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        driverdevel <devel@driverdev.osuosl.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v3 09/11] arm64: dts: renesas: salvator: add a connection
 from adv748x codec (HDMI input) to the R-Car SoC
Message-ID: <20200323084011.GC4298@pflmari>
Mail-Followup-To: Alex Riesen <alexander.riesen@cetitec.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        driverdevel <devel@driverdev.osuosl.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <cover.1584720678.git.alexander.riesen@cetitec.com>
 <077a97942890b79fef2b271e889055fc07c74939.1584720678.git.alexander.riesen@cetitec.com>
 <CAMuHMdXiG1upHQrCcuZgNLFOEoeDVcb0zWxh1BZZST5TOURDBQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXiG1upHQrCcuZgNLFOEoeDVcb0zWxh1BZZST5TOURDBQ@mail.gmail.com>
X-Originating-IP: [10.8.5.4]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6D7066
X-Provags-ID: V03:K1:RZe+rp3zw2pfIUtcnZnO9zaLxjWqGkWbxjqSBR1V5fro7a7d+df
 Z3p2P1QIqYmANXjmR+rZzT/CYR9VqJ7ut0iU6CUyb8FMBxPcNvy2jk5pQvcaVVzgPKVj66M
 b99gqQf8K4ButBmdseDhZy4MJLlq8+BrU2sFRIZQyz06Rb+k+Qwajk9uuwoeDuOiekevGyD
 ehiMQ65b5yII994xW+poA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:N1XXNqsN11I=:1GhIADnywdsd5HHUpedawr
 l0NNykrBA+0xF/qVy8WtkmBzw4CFN5quP3suZnMtB/1nhRsNSLczy1FR4qc81FXJ/OWbgjrnP
 CZYYWjQYomyNurIuIQd5TLbq/ZyQ7F4VJSUewnHwLS53P/5bHNTSsRhRvl8mSFBCeytn8Osr2
 4LMkgj1pJxRjb4Z+J57W6/xXlBXa7QN2CGPczciUZHpiK2Z9L4LMYnosC5e+LPMBa4Dgbb0jF
 XXOvIChL/nYWkFw/jYCloWx69boGxTj83V4U0NQeV0yeRpfa5V2QrRHImnDK8lxr24wiSVw32
 L7m5ott9YBFJb8TJrgHycngrdSQaKRLsUEE651q0pIhHn8N6O/7n7mCMzmWa+NYJT9X7IgK47
 g8km3oyxbeaQi3WT5jj1x6jkvCVAQofnKQM6zMCOCE45A5XQzcS/jTWKSWhRzTuG8Maw1ldhN
 huRyJ+/ma7ceIjHnOUMTE5cAKdNXdVyWVseQqDqBckNA/MItRIaO7L+R/ge1c1ercC9JpGxGk
 u2JO1v57s/juYzU7o23yurJExxJ8TB3sPSN2nagI2Z5YrQanys+uSzAZudsBtrsDMpoEBnwtm
 OW5hwZ6PZaKa9Nu3/04XVI82F6j93SU0mvs95T9GmdH6dr2IBp8EDYkrEnr7D+T8OOpbWCPxX
 WLEQaVkjAufxWjd3OQxArBvfNAQHlBID0jOfHeg+KZ4pUCYNI/Z+ncHhFHXhe5PPRbM7fhFvu
 g0ThEQuaYLFmhuAkODqdBCyI7jLTmQfjqc0/1sck+Kn9TNTmPb9MCk9wHH5G6XZ7AxMlmL3vK
 JArUOLsic5yfKGUjZACPPc4XkZOHXeHEG6/G+d7AVLqh1W0kJROJrjwqd3CoI2SF6eED2Qm
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Geert Uytterhoeven, Mon, Mar 23, 2020 09:34:45 +0100:
> On Fri, Mar 20, 2020 at 5:43 PM Alex Riesen <alexander.riesen@cetitec.com> wrote:
> > As all known variants of the Salvator board have the HDMI decoder
> > chip (the ADV7482) connected to the SSI4 on R-Car SoC, the ADV7482
> > endpoint and the connection definitions are placed in the common board
> > file.
> > For the same reason, the CLK_C clock line and I2C configuration (similar
> > to the ak4613, on the same interface) are added into the common file.
> >
> > Signed-off-by: Alexander Riesen <alexander.riesen@cetitec.com>
> > Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> 
> Did I provide a Reviewed-by?
> 
> > The driver provides only MCLK clock, not the SCLK and LRCLK,
> > which are part of the I2S protocol.
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Perhaps you mixed it up with Laurent's?

Sorry. I actually did: he did provded Reviewed-by in his email, and you
did not. I was ... a little overwhelmed.

But you really did provide a lot of very useful information and it did help
to improve the code. Shall I remove the tag still?

Regards,
Alex


