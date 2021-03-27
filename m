Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A334734B5F2
	for <lists+linux-media@lfdr.de>; Sat, 27 Mar 2021 11:06:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231293AbhC0KGk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Mar 2021 06:06:40 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:50773 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231420AbhC0KGh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Mar 2021 06:06:37 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Q5oTlwoWOMxedQ5oWlVlgm; Sat, 27 Mar 2021 11:05:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616839505; bh=TQ+a8tANZ+72KNGmHrRM3uD3YjpIQRYLJTptBtx+rtg=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=o7jixV1agKLGgeAKUWLh4lEarKkd8CuDrVDehObW6h4Qo6OYOQwHO/2uVKQfcNC+o
         gwqg3cbmBELcRClgYGi7X8oMCb/8OQd17F2QzRZAafGBzgBkT8hLVfeveB07isJP32
         zmlBWLRU6KvBvFMmiq1bPZFUPJOPDTRZAb/jt06O7FS6yFIPTz7aYs62/VfROWtRmZ
         aAuRgcT2V7fBe81gBjzOmh1lO/KrvrZ/M2LaD/lBaLW53e6oEOsW8AexjmyZJc1RmA
         ktRTjp1ElaQkunFmhoMSkTMvkZ9MetAt+Ox8EJzvL6FCdPz7Kd7cC9sCrBJMmczHI8
         pAtfVAVz2tmvA==
Subject: Re: [PATCH v5 0/5] Add r8a77965 DRIF support
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Ramesh Shanmugasundaram <rashanmu@gmail.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20201021135332.4928-1-fabrizio.castro.jz@renesas.com>
 <20201021214319.GO3942@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <90cb3777-377c-84d0-9b35-8c4b15084ebd@xs4all.nl>
Date:   Sat, 27 Mar 2021 11:05:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20201021214319.GO3942@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfN+Yt1MWMaGCp7FLHOcIRM9XIgx0VI4ifq17L4jrGKeisDLRki3Re8MK1nlJNK/yzjJIk47ikGYxcXrLee7JxdY/rKR2G1Jip6K9K6KHrHFrXo3oIQ3T
 TpkpX1J96ZRYmwbaJ7EBf/ZFDL+IMgu9RxL2/FNqmC0wBznghhFF7hXITwWdx14/af/LlwfVtswMPoqUwKveSzWmo5okhH1h5f8BuFGsnfkq0F843We+qx6K
 e9h6GyhPeuo4S/EhzepOIuWWaIWM0veX9HuwsbMVXBnLYka0/tRm85+ycDn0p/dpH1ghRVcK2yOGBYz/1Vx26uJe0X593xH8oS0B9nbPSjUUwAbN1hmiBZgC
 sB3A/J/T5yWjOK4MviHA+0nPxvj6W6pFbWQYvq75Rq3+27wwxgCfTwsiC/DxBnUsM7O0BGF3DqjsfzsHcBHSnleKlbi/JNP0dJrtg7yGrASlBs28H9PHFYVX
 VTgmvM1AQ4crePxJOqnTnilb4lQ5lI4Ajtz2Rfbz6cP9RQMXvLxnUjbwbHqNI1RuLDJhF4KrXvvxhPlZmRsh08p3u2TfHqrN6UT+MABowqu6sAp+O9aAyYyi
 tgJKQ+5AuuOeowwrDM8U76XcbUzuaaQkgJRKgs4OUflvcritGjJvnQDxmeJ0C/VSeVSUWefAtx+MPdaLcV5FHVHH+4aV7E2ckQExsqoDXKoxtg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 21/10/2020 23:43, Laurent Pinchart wrote:
> Hi Fabrizio,
> 
> On Wed, Oct 21, 2020 at 02:53:27PM +0100, Fabrizio Castro wrote:
>> Dear All,
>>
>> this series is to add DRIF support for the r8a77965
>> (a.k.a. R-Car M3-N). Version 5 fixes a warning reported
>> by 'make dt_binding_check', as reported by Rob.
> 
> Patch 1/5 to 4/5 taken in my tree, I'll send a pull request to
> linux-media when the merge window closes. I expect Geert to handle 5/5.

Patch 5 has been merged, but patches 1-4 aren't. I don't think there
was a PR for it. For some reason these patches are delegated to me in
patchwork. I've now delegated them to you for further processing.

Regards,

	Hans

> 
>> Fabrizio Castro (5):
>>   MAINTAINERS: Update MAINTAINERS for Renesas DRIF driver
>>   media: dt-bindings: media: renesas,drif: Convert to json-schema
>>   media: dt-bindings: media: renesas,drif: Add r8a77990 support
>>   media: dt-bindings: media: renesas,drif: Add r8a77965 support
>>   arm64: dts: r8a77965: Add DRIF support
>>
>>  .../bindings/media/renesas,drif.txt           | 177 -----------
>>  .../bindings/media/renesas,drif.yaml          | 279 ++++++++++++++++++
>>  MAINTAINERS                                   |   4 +-
>>  arch/arm64/boot/dts/renesas/r8a77965.dtsi     | 120 ++++++++
>>  4 files changed, 401 insertions(+), 179 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/media/renesas,drif.txt
>>  create mode 100644 Documentation/devicetree/bindings/media/renesas,drif.yaml
> 

