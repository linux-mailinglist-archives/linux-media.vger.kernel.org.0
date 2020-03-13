Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8BDA1844D3
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 11:26:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbgCMK0P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Mar 2020 06:26:15 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:43193 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726423AbgCMK0P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Mar 2020 06:26:15 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MkYsS-1jbbb229de-00m1eV; Fri, 13 Mar 2020 11:26:02 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id 67EE36501F5;
        Fri, 13 Mar 2020 10:26:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id tXMM2uOgK3Nx; Fri, 13 Mar 2020 11:26:01 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id EB9EA64FEE5;
        Fri, 13 Mar 2020 11:26:00 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.10.2.141) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 13 Mar 2020 11:26:01 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 9500F804F8; Fri, 13 Mar 2020 11:26:00 +0100 (CET)
Date:   Fri, 13 Mar 2020 11:26:00 +0100
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
Subject: Re: [PATCH 2/8] media: adv748x: add audio mute control and output
 selection ioctls
Message-ID: <20200313102600.GF3832@pflmari>
Mail-Followup-To: Alex Riesen <alexander.riesen@cetitec.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devel@driverdev.osuosl.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <cover.1578924232.git.alexander.riesen@cetitec.com>
 <20200113141521.GC3606@pflmari>
 <ff34078d-895d-08c8-c64f-768e75388038@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ff34078d-895d-08c8-c64f-768e75388038@xs4all.nl>
X-Originating-IP: [10.10.2.141]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A627061
X-Provags-ID: V03:K1:pmRc/dG1ku1hUco+cU0pJmJkIsZimoq3eyRDNsQtuHdsIPbBkC0
 4FCaHFoQiKJCY0LxHdfYTK1gYRbqBfebjsEZ1NWa81AK/HJcPe3lDMnxRIBZQXl11KLhx7z
 SD0etOc+nneciAeV9I24SK6kUDjeCXMy8a9P6dTWq9DppjM3ma11hS3SENmDP6Jm1padRlH
 Ka0SLqEinwp4UtQcH/BlQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZaxZ+24ibLo=:c1xj2HmOiiT7P0OF2k8DOW
 XaX2A2wFTELxyxbYE1tVYCvlNEsu3ed81azir53chhnbQyrwPWu5utikSlnKeHf4xu2cMRTxy
 Oyjj18HpP+dB8eW6QCm6iweyWKVcP1NTLMtJOTx8h4FPKaCgajswc03QZRxLJRwNoJGWCgtIn
 KVpNLJ9p1yCq9l4ZWbLGKwVhdOjyCWvRDnlSDlKtxxHugKbRLJv7Mvt/ec5NYwoXE5qOOuP4L
 0MQAn1IUf6HQyqDmlRW8zOwOl/dxSHL+4zFp1GvsNieo5BDRGo/UjEvSlGbSPIcPo7K+c7eqI
 IpFTCFMnVlmoFJopsAyUQye3GapWvVGshe7cIwbR54q8DiJB1tUQWtn996S2Mnd4j0C8CMDek
 0wRgcsXVYDO1bZqAa0WwkhfZzqXRAUFona7kUzUajvBZ8xbqCklN+c5ES+r7kzGyleoE2pbP5
 QfjdKLmYzC1XUDAuoFLma8D2OxvFrxJFEjXLAteYUVp0cklq10g0HceJuNlQtTeFY61gbDUJd
 7eCb4qAE137EfA+jIarEcDvJcS3UDDwq7UZRiTENCv3eUdT/0sJln8DwR/ZhWiOvxaSA8Of3q
 0piztpK/tcpiZ1f+5nZ+FHIGjGIGvso2/JxpBANut6UwCu2Xdf0A6G9JezUhgc1KTbhEhwrTo
 hR1OmvSD+dqV2M/KyJH4hmC0W2rW3ViyLNLWUUfUIRTsmqzaUQ0cVgsv9oTumkbLOyGXm+B8k
 HTn+D6XWixhHB1gDESYUKWk36vLSQhXBNifaYJckd/U6y4HXEPIlhDzLNa4mhZXRkRqXZP0mK
 7etH9sAqT59s35QgmTdHzUaYFHAVWZ3OWakuGbIvXImobhwMIMd4BH6b8nD/9jQYXAVD/a/
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Hans Verkuil, Fri, Mar 13, 2020 09:16:11 +0100:
> On 1/13/20 3:15 PM, Alex Riesen wrote:
> > This change implements audio-related V4L2 ioctls for the HDMI subdevice.
> 
> This is really where things go wrong. These V4L2 audio ioctls are meant for
> old PCI TV tuner devices where the audio was implemented as audio jack outputs
> that are typically looped back to audio inputs on a (PCI) soundcard. And when
> these ioctls were designed ALSA didn't even exist.

I see. That was before my time :)

> Generally an hdmi driver will configure the i2s audio automatically, which is
> typically connected to the SoC and controlled by the ALSA driver of the SoC,
> but there may well be missing features (audio never got a lot of attention in
> hdmi receivers). So what I would like to know is: what features are missing?

Well, the audio is missing. The current adv748x driver does not export the
audio features of the device at all. There is no code to enable the I2S audio
output and it is disabled (all clock and the data lines) by default.

But, by now it seems to be clear that implementation of ALSA SoC DAI
interfaces is the way to support the audio.

And I am already slowly working on it.

> Anything missing can likely be resolved by adding HDMI audio specific V4L2 controls,
> which would be the right approach for this.
> 
> So I would expect to see a proposal for V4L2_CID_DV_RX_AUDIO_ controls to be
> added here:
> 
> https://linuxtv.org/downloads/v4l-dvb-apis-new/uapi/v4l/ext-ctrls-dv.html

This seems to be an explicitly "digital video" control class. And it has no
control option for mute. Or did you mean a similarly structured new class for
"digital audio"?

This feels like an overkill for this particular driver...

Regards,
Alex

