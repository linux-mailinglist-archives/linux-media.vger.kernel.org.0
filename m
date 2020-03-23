Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D036718F126
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2020 09:48:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727600AbgCWIsF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Mar 2020 04:48:05 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:55575 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727569AbgCWIsF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Mar 2020 04:48:05 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MKMIR-1iyMMV0RSR-00Loaa for <linux-media@vger.kernel.org>; Mon, 23 Mar
 2020 09:48:04 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id EB6A76503FF
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2020 08:48:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id UV5bfKMQnxSG for <linux-media@vger.kernel.org>;
        Mon, 23 Mar 2020 09:48:03 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 8FBDF64F4FA
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2020 09:48:03 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.4) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 23 Mar 2020 09:48:03 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id D7DA3804FB; Mon, 23 Mar 2020 09:45:43 +0100 (CET)
Date:   Mon, 23 Mar 2020 09:45:43 +0100
From:   Alex Riesen <alexander.riesen@cetitec.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
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
Message-ID: <20200323084543.GD4298@pflmari>
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
 <20200323084011.GC4298@pflmari>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200323084011.GC4298@pflmari>
X-Originating-IP: [10.8.5.4]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6D7066
X-Provags-ID: V03:K1:hedL6Mjs25xThqJlRhhpzaJz1M7bM0EXf06xKJTIq6LUJXzjmZB
 lWy8MUtG2BJg5Czz8YQxnh5BcZr4piYdtiwqPMp8poTWw1WpftO3KIqVx5awVXxbxYCjkDC
 urqld4q4g9Yk4I5jetzONFonfkRWjyrLu6GSgraNTdXaRal6YRu5FgrHl1lOvjwR3mMgmie
 EwWlU84CTd6Xl1zLWguOA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:bwd6s0rSTJw=:VfHlrsji21ZeU11AhVCdeT
 KSDcUsuMFtBjANkZAJvlRpLtqu90JFlit34xMDDW6k4JyN6KpPZk3PmP2K7huRwc8nVOvakJN
 Ea+JWSnnJgWxy2t/J4Be8OfgnVub8vT74+vHIERDMye9ifoeeOrU5L9xGRz4Hr+iJIBJfL3xM
 d+DT52KGwK+WQDXKn8Kuc0tHSEkiItkqwYNbtmXgqcRpHwu0YJ8zXumcNIwzlNk2qQexdpRm4
 lEJBb6PKoN2IxHzhLNO2GJRByMtqfsDCHk04BAB3EqjuV36TwbEgoEAMZEJcUhIST+yWIb/QL
 PH2P6NsPhCEsmm7d6KLgKF5kNir4MKzXkKGejen/UuEiV5QL1RNFQl3fp17Iokw9husx2oaJ7
 iyO5WFcanrK+nYd32Crvpmz2OtM+cXL2yyTwOcP/Nvro9kQ6jN1sAEfcoxMeQEPwCaRCEbr+v
 NDXlVJQKp+Zqcpsg82OaeO4mNAnPZ5IoR4f4LRELGiRUU86Y/O9RqwwwAV5fhIj0j/XiBsjb4
 +iXiWc4uHwjWIyA7vAJvj4o2GtkYNFQOS6egUtkbfL+PPtf5xGc6RnwkLgjpYJvSeKwpexQjk
 +BXOcRuvh3mrTkaJYTiyM9SZFPtkxe/XtIB2vKm0ZyMrjMUeqOyPF9k+jm8txHdUYFSVra324
 A0EXhkMKZGH+84QY9gB85cBeH9AP0uFhCQujWTmSa9tliB2VCoUUVvb71BhgooON7COeCph+P
 8NhBeO5VNc99nI7WsYy3j+r0mZwoHpSNpFeDlQCYBZDl63o7c0a0J9OW7kmUsFWK8NqvuKYQy
 W/JxjANp+F4T3z3fXsfHYyO4nsbq4k73hjojI52JRfqxNihsmng224jAKFMTnTIHEon43Re
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Alex Riesen, Mon, Mar 23, 2020 09:40:11 +0100:
> Geert Uytterhoeven, Mon, Mar 23, 2020 09:34:45 +0100:
> > On Fri, Mar 20, 2020 at 5:43 PM Alex Riesen <alexander.riesen@cetitec.com> wrote:
> > > As all known variants of the Salvator board have the HDMI decoder
> > > chip (the ADV7482) connected to the SSI4 on R-Car SoC, the ADV7482
> > > endpoint and the connection definitions are placed in the common board
> > > file.
> > > For the same reason, the CLK_C clock line and I2C configuration (similar
> > > to the ak4613, on the same interface) are added into the common file.
> > >
> > > Signed-off-by: Alexander Riesen <alexander.riesen@cetitec.com>
> > > Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > 
> > Did I provide a Reviewed-by?
> > 
> > > The driver provides only MCLK clock, not the SCLK and LRCLK,
> > > which are part of the I2S protocol.
> > >
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > Perhaps you mixed it up with Laurent's?
> 
> Sorry. I actually did: he did provded Reviewed-by in his email, and you
> did not. I was ... a little overwhelmed.

It's even worse: even Laurent didn't provide his Reviewed-by for this
particular patch (it was bindings). Corrected.

Regards,
Alex

