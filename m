Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF22918F13E
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2020 09:52:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727641AbgCWIwW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Mar 2020 04:52:22 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:41561 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727617AbgCWIwW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Mar 2020 04:52:22 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1Mnq8Y-1jajLb00qY-00pOSm for <linux-media@vger.kernel.org>; Mon, 23 Mar
 2020 09:52:21 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id D1E5264F3A8
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2020 08:52:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id J7sbFpWFJ_BX for <linux-media@vger.kernel.org>;
        Mon, 23 Mar 2020 09:52:20 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 6BDDC64C271
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2020 09:52:20 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.4) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 23 Mar 2020 09:52:20 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id ED162804FB; Mon, 23 Mar 2020 09:50:00 +0100 (CET)
Date:   Mon, 23 Mar 2020 09:50:00 +0100
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
Message-ID: <20200323085000.GE4298@pflmari>
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
 <CAMuHMdXa96P+boX9HgGMBKEXLKK91t3Jgu-Sy8mP5A5--EeP=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXa96P+boX9HgGMBKEXLKK91t3Jgu-Sy8mP5A5--EeP=A@mail.gmail.com>
X-Originating-IP: [10.8.5.4]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6D7066
X-Provags-ID: V03:K1:MQiz45dckA7fKy4kq4OqCA1Mfyj48cqMjwh+nX8GuN96BTWUoB4
 xm1//A51TbAL6BlmMB7ZiH8Xsc4DssodRFFCILa7QyniTn3C2FISc+vCZ7tnOp+FeCxZ4sK
 AY2kzCO0TrY1iOxczjG4U5DTeCoXPb2CC/iSckDXXLm3qReozJL3TGcFemW/AHPIRG1Mel7
 ccT2eGT3lKKZcFVaNplxQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:DObehqcLXds=:8995IHVlrwdf7/mh8iM7NI
 3dquYHpjUY2x9cWVa3Bry76UUlaYIp1GIsOyZ8lUBFTo5nfIMcgpEdxuVGI6LGghnMqyzjv3y
 W91KBsdgjCI3NmTseBkCcBT9iABS4Jo7kANpsTACqraLrFkyU5TrN0+InUTwNt2YLmiwTmGrP
 ymgyIycia7Kcy1t3tmswiwU6EFnKRCJ7cwXAI3sqso/80H2g3Yc1xsmq6HjxnXDJHUytoiSVA
 ObmxbsAaX1vlEfBfUrVLiawxhEhtr0xpDvHgmJT9a5f2v6nV1sj4GUq1ewC4EhV9UY0aT1RoO
 M5W9aq03aPm2v7cSqPAPO/scnZK4N0QvJR1afPLjBv9V28bLS4o3PbLsCVzvaE3NOwWolDh8A
 RF7X23wV9t8ql6MUnh97lxUtBMGVF9Y2g0FX7FdBGZcwjDvBKQFJFna9PNvRWm/zp6+AOU+dN
 5+Q0dnRoJdMTGMi+sjCC6RyBxQE5nYFsuneC7PMqEafKeegBu9YoXMr3yCKQfbDL6au8l5ORJ
 7M8ov0apXYXBpxi9lpZZZ2/j34GMgXZ10H9JuFnv1rwVR0kkJTOcnkj3v1LJXnmDNMD5BaZEe
 fKp+UYhX7p5obk7WVNikqr35bD2XhhSf1WzGvj8lPQRvlkVO0ZnTkyN4ay7teBfMWzjcn9jEp
 iJdFO7Fyc71dNQMRO9VBY1GNi3lReBelSvCbQvDNhoiu/wQ62Okef9yI+sC360C1fyjCvXgzk
 q5y8bKPIKo35jefnvk5bYTb8d5ehZbAa1UA3WwPc7EyHxCd2+z6iD/uZ4K+9Bj6XIxtDS1T4j
 lWe2AKBPTIb4nHql3sj3t54QlFqOik8PYgGUacHXXo2pGduI1ODFvPs+Ja0Tu1YtdWYZQpJ
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Geert,

Geert Uytterhoeven, Mon, Mar 23, 2020 09:48:00 +0100:
> On Mon, Mar 23, 2020 at 9:41 AM Alex Riesen <alexander.riesen@cetitec.com> wrote:
> > Geert Uytterhoeven, Mon, Mar 23, 2020 09:34:45 +0100:
> > > On Fri, Mar 20, 2020 at 5:43 PM Alex Riesen <alexander.riesen@cetitec.com> wrote:
> > > > Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > >
> > > Did I provide a Reviewed-by?
> > >
> > But you really did provide a lot of very useful information and it did help
> > to improve the code. Shall I remove the tag still?
> 
> Please do so.
> 
> While I can point out issues in audio patches, my audio-foo is not strong
> enough to provide an R-B, and I'll rely on the R-bs provided by others.

Done. I left the suggested-bys in the trailer. Hope those are alright.

Regards,
Alex

