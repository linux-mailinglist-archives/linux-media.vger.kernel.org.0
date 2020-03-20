Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 865B918C8EB
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2020 09:23:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726726AbgCTIXw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Mar 2020 04:23:52 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:44171 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726527AbgCTIXw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Mar 2020 04:23:52 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N3bCH-1jOrq90Hlz-010fJp; Fri, 20 Mar 2020 09:23:34 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id ADF0C64F8DA;
        Fri, 20 Mar 2020 08:23:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id dUkY0kNg4MH8; Fri, 20 Mar 2020 09:23:32 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 62EDA64E0DE;
        Fri, 20 Mar 2020 09:23:32 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.41) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 20 Mar 2020 09:23:32 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id BC6AC80524; Fri, 20 Mar 2020 09:23:31 +0100 (CET)
Date:   Fri, 20 Mar 2020 09:23:31 +0100
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
Subject: Re: [PATCH v2 02/10] media: adv748x: include everything adv748x.h
 needs into the file
Message-ID: <20200320082331.GA4344@pflmari>
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
 <fe109d58eaa34d68cad0f34bb048f827b336e024.1584639664.git.alexander.riesen@cetitec.com>
 <20200319174802.GH14585@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200319174802.GH14585@pendragon.ideasonboard.com>
X-Originating-IP: [10.8.5.41]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6D7764
X-Provags-ID: V03:K1:33L9iXlJrVAggt8Qr9tzFofSe8801Fe853bNzSP0wXiHIM5BDd+
 ycYFhci0saF/hRiVg9z3D6spodni5WsR06QZvTtkt3mUd6/7A22KIDkjkY4RqWKSzR/1byL
 YvrPoyjlKlvOgFppmYEqZ6xwFexNcSXyQxrO8D1x2CL2ftDnRx1WUPVNWydn0+5WLFftewx
 ZYgEWKIXTHmnguyZx3cJg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:nc81whusC54=:fwlSM1iQLjay0uUJ5eWU3Q
 b+jrVseEx9QTc34P/74chQufQiB8rgPH8uUYdUqWOpnYsuChGEdeiqr9iQ8xqt2rAvboTE1r7
 c5UX8BivJbScplA88regWkoGtzK5DqhRLne43IJopTRMKluhf7hPQ5Ft7D8fxIT+0aDcbX+Rv
 Hff9H4R3u5J5/euBGShbUdKYQ0U7yuV7KXFg1QrJ7EDaoiVBIkwIdyTNSwaXatbcWqlTwKUNd
 O1nqE76x/SaxlUwC0aKdT8Icm3muNWQBAesNIOFeOyKUDOkvoogz8Kn+SJgi3PtZNaN1+D9mV
 TBTbAzbzWaLVqcDPOAAhnJpUgoYWFP0C3TtO0p6NnwgVwe2tOLFyoBIc5S0dK/EbQqdKdPFir
 6Qc5AWEQXwlkYWdhsZWn8orpSWd7DFliVWn8Iv3lqXtoNq+Ai3H7+gkwYQf40Do6u9LFfXfBz
 zS4pIuDkzqWdh2gxFrsYJiEyThu2nv6HyhKgXr+lnmUnVeSMJyo2TJJInxgMRWhGRsyf7lTnk
 GXPvV2xVo2+DALI5Qq9We6cu7qjTmzcxW4wRZ14LBvvmr9uF5tHETCxYHrI+EGPGoS1xTxaMf
 T+edlaDLFeDP1qmYjtbBXfy7V5yzMKiZJM7i0x1SYlvtXI8aXq/Hl+5U/yjeqRJNGW9hmSSBz
 aGEZiAXtTgaCJTKEEIPoIVJTV/2lq1/jMMPPPeNC2V+lfH39MXzdDut74rh0i++vov5wuJNQo
 9RCqp7qmGjymWOrqFgAk4/k9mP5iovsRLYDxnxlop6m363qljYutiOLQe0YrC5ap3dfA1Ogju
 bOBQtvFMymsbxR4W5SgSI0+0svPWYjggEP50RU69bro1EgPYqAEGSvwc9DDMSVCmAKYS2cX
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Laurent Pinchart, Thu, Mar 19, 2020 18:48:02 +0100:
> On Thu, Mar 19, 2020 at 06:41:48PM +0100, Alex Riesen wrote:
> > To follow the established practice of not depending on others to
> > pull everything in.
> 
> Good idea. While at it, could you include "adv748x.h" as the very first
> header in at least one of the C files ? That will help ensuring the
> header stays self-contained in the future.

Done.

