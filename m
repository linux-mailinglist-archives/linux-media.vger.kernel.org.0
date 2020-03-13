Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE883184300
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 09:54:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726557AbgCMIya (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Mar 2020 04:54:30 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:60139 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726365AbgCMIya (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Mar 2020 04:54:30 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N3Kc8-1jL1qx1tbO-010J8x; Fri, 13 Mar 2020 09:54:21 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id 9C7CE65014C;
        Fri, 13 Mar 2020 08:54:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id vFMdboZuqIZV; Fri, 13 Mar 2020 09:54:20 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 4FC9864BDD0;
        Fri, 13 Mar 2020 09:54:20 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.10.2.141) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 13 Mar 2020 09:54:20 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id F103B804F8; Fri, 13 Mar 2020 09:54:19 +0100 (CET)
Date:   Fri, 13 Mar 2020 09:54:19 +0100
From:   Alex Riesen <alexander.riesen@cetitec.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <devel@driverdev.osuosl.org>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 0/8] media: i2c: adv748x: add support for HDMI audio
Message-ID: <20200313085419.GC3832@pflmari>
Mail-Followup-To: Alex Riesen <alexander.riesen@cetitec.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devel@driverdev.osuosl.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20200113141459.GA3606@pflmari>
 <e93e6e1e-11dc-d505-7287-46b115a4a609@xs4all.nl>
 <20200313083107.GB3832@pflmari>
 <4ab3dd9f-26fb-ce38-170c-bba4b3777455@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4ab3dd9f-26fb-ce38-170c-bba4b3777455@xs4all.nl>
X-Originating-IP: [10.10.2.141]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A627063
X-Provags-ID: V03:K1:ABHMpytBP6kLhQ1RrmfVmUIgQJnz+Fwtg6cGiLq4Rbk2Qp95sSF
 TY64/2qV9uD8jhraYuFCX2DWXrYORoVF2y1EC6DBmtPRJmzgricgIbg6D0+dxPid8Y80wV3
 XUfxC01hoKIaaRo8yIx138tQoe4vJqz+UnCNXV8hPzk60zsIj0qYn1T0N0f5nSv1Wc/hA3Y
 VW6TPfKaPQLT3Ov/jpqfQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:TZMq4/37hds=:8nOIIWjn3kD4J2O66muj4a
 VXq1Wm51s5ZQlkSVn3t7I7wqPcd77u/ElLl4hUKtlrqFmVGFySjre8kn2KP0oCv8UXDZBYVFq
 /Zw+4OLl101HlY0JUkddXIo8ORmz4VUDN6UE5IUEaWlPtqGy68i67jkIljT7e56cqJ+FjW6yE
 GfU2LUXsY/M0IPt2f/jiT1LLYNCRuv44Br4sUwTdnaUeXz5V0pbthUhtzP+olHMMVPBkKB4nb
 Wn37aZO8riFfVTNGfXRkMO7DgMuMloK3qBuypXpT2Ivc4Tp/PvD5zHBcMRlQLTt7qL+yPyZ0X
 ojGfQ8RcUaSlhyjKej/pNKT+ZHhCCi+bsqd7z2A+44aVe4P1AeAGovgnv2aJY895jL4ucmimm
 mK2iR3gzXiSnDgO3ec1UG66odQlKMlX0hgLb9nsxcsYGrETqtIoYAkpb53C3jlzrYaaBLNHk3
 kylIykwrvphcMzxBKzx70Emgyea3/p7ZjLndGVtK6yT4caI5BWQIpHpSVRUf4SAIMh5UHfKNH
 RR3qUpouf6cHRR7gs2Qz9WpgYokj8OjrHC6Ok3/ku/Ls0Rrixnqj81eXt7P3ug5ZuYcuiGhud
 CqOjStaajqJurdxfG0Sk1MyKB3k6Vd02RMpf8bN42KyRK9w54MyXSdC3PAA7mPjYErFhcqNwn
 lRdEwTWaY2KbHPWf03Lb5Im73JaH4g6pjQPU10ZK41JX4oK/Z8As+3WMzG7ta3YF1vaZyJW1l
 QNjlvcHitlXC4zsMEtZdeoNARFQBlLDp0TZ9Cs5M9cSikZaIIM60ITm1aBI8UmFo7c46vBOYI
 S5TP3mSUEXSQuyQQTUmL406aJYUIiQD2hOfK1HEad2EpgEJ6Zf4o2I765bntUIGS8KOo7KO
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hans Verkuil, Fri, Mar 13, 2020 09:37:18 +0100:
> On 3/13/20 9:31 AM, Alex Riesen wrote:
> > Shall I submit the log-status separately?
> 
> Yes please. In my experience, log status is a very nice and very useful feature.
> 
> If you have other sensible cleanups, then feel free to add those as well.

Noted. I shall send it after the DAI series: less inter-series dependencies
this way (the log-status needs a new routine used by the DAI code).

Regards,
Alex
