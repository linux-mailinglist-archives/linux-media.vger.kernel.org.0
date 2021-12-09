Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33EAC46F5EF
	for <lists+linux-media@lfdr.de>; Thu,  9 Dec 2021 22:30:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232248AbhLIVdn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Dec 2021 16:33:43 -0500
Received: from mout.gmx.net ([212.227.17.22]:57503 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229505AbhLIVdm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 9 Dec 2021 16:33:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1639085403;
        bh=nA2YXEvqkFpbueXCD48tWlgA43nzota5ObmX2fSQ1Ik=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Ucv+m4dygxevUwWtjzRJo3P3kARjy8KzLwvM6eavM4F9NX0qp0YqgpnuK1uWbpZ5v
         YZwv+Qo2W0qyUmUW8imzp7P/1QdjjVwXllure1HLDC4aulP8HcLqP/sQMwJNIcRrA0
         thLRJrzetEu4SuTxl5WiwdpayrXLZbkOd8Y95uAI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [91.65.60.26] ([91.65.60.26]) by web-mail.gmx.net
 (3c-app-gmx-bap23.server.lan [172.19.172.93]) (via HTTP); Thu, 9 Dec 2021
 22:30:03 +0100
MIME-Version: 1.0
Message-ID: <trinity-bb680ebb-853c-44e5-9457-1e66e3bd1791-1639085403130@3c-app-gmx-bap23>
From:   Robert Schlabbach <Robert.Schlabbach@gmx.net>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH v2 4/4] media: si2157: use a different namespace for
 firmware
Content-Type: text/plain; charset=UTF-8
Date:   Thu, 9 Dec 2021 22:30:03 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <c06c7806247557daffa999d15cf090437d346747.1639049865.git.mchehab+huawei@kernel.org>
References: <cover.1639049865.git.mchehab+huawei@kernel.org>
 <c06c7806247557daffa999d15cf090437d346747.1639049865.git.mchehab+huawei@kernel.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:gl2hGEtbfqzMjq4zDpevT8E8hSgTyknNCcGJr8589EaugtSGa+Uxq//XpyR2D4YfuGYe8
 +RPMR2in+V8zV5UQbhX/TRgevIbto0CZN0cWYIgrXQqX3IRnkFp6gc8RL0T2/3eg00dmYjSIbDq3
 yTKjUWRLkhVcLaHPDZ66WJ9j1NUw43sC2+XHiLmWcJgoriOZCPnKsv+FpGrLEL7hF7wZxImqnxh4
 dCMbsX6yoLYr3gEzbECIbQCVVo3fPipzhaP3DNV52OOyAD9GmOs5gpsK/FgQ11p7h+gRYMperW6T
 gY=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:6rJhihegRLg=:PsTD5HOj00uUCQoQx81yHN
 J0Z4WBXHCsWbl+RPEJQ1b5iE8bNOtT2HwcIsMuJjuAjaa7fbeG8w0OAWlHaBzBUU6CO2HV5Ph
 fCcCpal/lIUWFNUulo5d2Pnqh/RKOehBNFV4RpbtjHkvEsEHMXWJEaygnPzLsaed/5isxbRiG
 VTYZjLND7j/zl3JWRnOx4H+4rseAK0xjiKJ/3LK8kaGIwXDGS8fCtqvUnwWjxxHE4WwqimJdi
 maDzoKr/A2z4PxPum0sUOAZgDkLAP4B5h2f5n8GlVXeoi4yKv9e6jeEyM6TcMzc2rOkHduEX/
 I23PrwLmP2YJOR/mV2eJZEPCEff0iKjLGNRSBsEfX4L6KPjrJV8P2pDKH/zcoNnQsyKyYW/sN
 MRnY25jhRiCiHRfiKwXjXEzB33be/AOwdDk0+MaHcRB2gWQpYpqTRrgeGOdlNatLAW4OFz6j+
 TEaMpDG9sVI+dG17ywpG9tlEZDU67s3QxCD6NWRLPsPh5k7fSr4oGkJdRbZzMZCtNabbleuFK
 hXY4XbaTii7qneN0+KA1w096wu/QNtTGSfxgljM6+RHwKPOp/XyzEzoWApcOneRaYJo7wshRa
 hs69erA0LpR9nTBm4sp7wIY1X2YMc9f7HKQs4+wgM5qj7o9hoYxQAwWcxIoJHvaUYD0wZZYbH
 7N/20w/jC4bvvrw6uofEmpAIyRXi/g1OTQwUFGHRukN3WbOuIApg7WYzPmliPYIQWfd40KY79
 wYmKRgmml27kgRYpBOi3icD9qYbyQQ+7sh1uBaySZr1/65hOjjRWnzREGXiQm7UDvVpUn8vf5
 QIVOv4J
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Just wondering: You keep stacking new commits on top, rather than fixing
issues found in the earlier commits. Do you plan to squash these into
a single commit in the end? Because I would not feel well submitting the
"bad"/untested in-between commits into the code...

> Rework the code in orde to use different firmware files depending
> at the chip ID and rom ID.

"order" (r missing) and "depending on" not "at".

> +enum si2157_chip_type {

SiLabs calls this "part", and I would stick to that name to avoid
confusion. We should not invent new names for things that the know
the original name of.

> +struct si2157_firmware {

My original idea was that this struct array would be the one-stop shop
where the driver would obtain ALL its information about the tuners it
supports from, i.e. it would be used to:

- provide a list of the supported parts, with all the constants
  needed for identification
- provide the firmware filenames
- provide further information, e.g. "quirks"

In fact, you already use it for all that, but do not reflect that in
the name. Maybe "struct si2157_tuner_info" and then name the list
"si2157_supported_tuners[]"?

As to the #defines for the part numbers, I actually see not much use
in that, if each define will only be used in exactly one place - the
table. Why not have the table be the "single source of truth",
containing _all_ identifiers in one place, rather than needlessly
scattering them over the source code?

> + enum si2157_chip_type chip_id;
> + unsigned char rom_id;
> + bool required;
> + const char *fw_name, *fw_alt_name;

Before this patch, the driver determined whether it supported the
tuner by comparing more/other fields from the PART_INFO response.
I suppose it is ok to expand the support, but the newly introduced
comparison of the rom_id could theoretically remove support for
tuners that were previously supported by this driver. Is this an
acceptable risk?

> + const char *fw_name, *fw_alt_name;

This might not suffice. Theoretically, there could be newer firmware
patches in the future which we would want to support. Would we then
throw out support for the older patches?

I would suggest, e.g.:

#define MAX_SUPPORTED_FIRMWARE_VERSIONS 4

const char *fw_name[MAX_SUPPORTED_FIRMWARE_VERSIONS];

and then sort the filenames from newest to oldest, and put the
"legacy" names at the bottom.

> +static int si2157_find_and_load_firmware(struct dvb_frontend *fe)

Hmm, I would prefer to cut the functionality in a different way:

- query the part information (it's not "chip revision" - Antti did
  not have the SiLabs source code available and had to guess what
  this was called) and determine whether this part is supported by
  the driver (and if we do not want to take the risk mentioned
  above, maybe even pick one when there is no matching rom_id,
  but the other values from the part information match?). I think
  this would be compact enough to remain in the init() function.

- have a download_and_start_firmware() function that is passed the
  matched struct si2157_tuner_info * and iterates over the contained
  firmware filenames, and if it finds an available one, downloads
  that into the tuner. Either way, the EXIT_BOOTLOADER command
  (commented in the code as "reboot the tuner with new firmware?",
  because, again, Antti could not know what the command was
  called) should be part of THIS function, and not be in the init()
  function. That is also the way it is cut in the SiLabs sources,
  and it makes sense to me.

Best Regards,
-Robert Schlabbach
