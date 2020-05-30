Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B2EE1E9251
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2020 17:28:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729044AbgE3P2B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 May 2020 11:28:01 -0400
Received: from mout.web.de ([212.227.15.14]:34393 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729026AbgE3P2A (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 May 2020 11:28:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1590852469;
        bh=KnOnI1PshqBW1C2zWpQu42dVGDCs/6nesjvHt2WDEik=;
        h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
        b=RTk0+Y20rK4hnZwjbMDxjXHHERM5B9nwF8r3WnLCZ6AefDbm7F4mXB+jcYmPG+Ce8
         hx46Ztp4jaz0xwcvSnHEedB/071oDN3Ni9SlM7AzKRG/urkYCbXN2YqvNZdqPPzw0C
         HPYc8l3XtM0iH1KIt7Ie8m1U1O2Swcwcqc6+HVF0=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.133.149.250]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MRlJB-1jYcG41d7Z-00SvHd; Sat, 30
 May 2020 17:27:49 +0200
To:     Jia-Ju Bai <baijiaju@tsinghua.edu.cn>, linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sean Young <sean@mess.org>
Subject: Re: [PATCH] media: pci: ttpci: av7110: Fix possible buffer overflow
 in debiirq()
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <e9624d66-5466-7b7d-4fb9-af73b995e7f2@web.de>
Date:   Sat, 30 May 2020 17:27:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:3yS2vpcZcLAdpVa2HgZTOU8dPDUGR0ELEh/wN10LBazJwepPjLJ
 sUPb3twnILszdKQtSf2knMvkEGR6XIgAfRd6msWpmAwG2io8T+PhD+Pd8Yge4KXybITh0T3
 SwS0CSzTwMbEjBo9ItusVZ3K7kYq/RY8JjLLg/QRLyd7T23+RISp6VtpQqdMI0/b0z7kCJx
 ApxAAuMJ+owN7YzOxRgYw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:4Wz3LoZ19pA=:4SmAO1NpqndR9HJShTccaT
 zNz9H49V/DkvUfROpI8Gsr6WOijUyM4PCAsyV7Xpv4w/9M51+FWzUG8VfdlzEY4R1V4X0Fi0D
 gjPcSCzVwD0NzE9zX8zvGT1Yuak/qgtFBbCQ/1yfpwQeE2SO9OOMVX/8nbmImOVHax3+/S/M+
 jhcWQGbL9dO8OZinsaYu9f+C5q1dl5NeZQuJ0sKFgevu7fhZ/d4Y4JRoTttnqVFsyA85npA7X
 fpVC2svbPMGuplFV1UFlQYzQgUdFpMVxtx0ZQ8l54llh0P0AIKL+Q8t4/FY3TC/pMY67i3VAC
 DpTz2ZgcZ35TrK5XraUREQ8ISrA1lXgJq+qxHYWG0QfqUcpaDkS/6bI6DR3gPEIvEDh5n9UlG
 8lEDtkU5lFuPX3ayMcnVCNQ6LrBmX7mx2PkZkabCK44g4FmtJPZGMMfWZFavhEgMOm1CYvj5s
 p+3Ubb2c9sjzJ87M7YvdGxzaA9Lu1t6MZXzQpylyXsljYw9hPrmbwhbnY1TzPzMAUNSgCbIan
 ZhvUvHKcpN4Fuwe+/wTk3lUsaBvs5PaxDIpqLuhNUh20Gopuvsi114JBqm5xFS0BmJvLvQfu8
 zXfMyjIYGQJ1PMK7Of0xtvLFVjck3xttsEUupL4fSGHXNjz/ZR+Zc5eG9tlhroYJdcFL+K0sL
 TjfSLiEjbbHRZwae9PMueOyYeRek3F1GWhzjYt9NReW3rOFoNNMbuieXGZvERq1sb8u37t7QM
 2+Hgps/HFwPHj+P0U867Z8JpiUrK4HpzicSicrAF0QYfXDavjlnmvmXSb2XRBU2rjdbXSsdVH
 iDEvzjvBHUJAiKZtleTOVT7SGUrKbwFJ84JlKGhLHF4xIe6LfQQ6X8gFTIvByPGbMThX3HGkS
 zHqIrTaZAh7Y7oXRdrDQf5tec+VCwiQ9cDqNNh3CVyUonpMfRWodVZYIkjBPaHUu6srSbkJFw
 tWqNN0hFEAQpqll4eP85d9eFaMreaVeuxn4OluTBolVJZ4+xLWHXvFHgmJje3LueweYATIkJC
 feEUwM2oun0FGvuO+Z5GHyahm+FxlUsfxodsjtEi4A7ugcHuCbISj2evoqfoOlLZOoZeILNXU
 FlQzM18W/qgHB+z3NVd3fgEmeqxTp861jzoojRS3mAwEu9LFwg42QdzqBP50CXVJVkAERwMe2
 GHMPTliT4FT04Az+isfJr6mdctF4cp/diDjqmkvwTe1yYnxVp/e4zcbKuYcc5iYBwjDP6qfd4
 UaCCI/MxfhavqJt0M
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> To fix this possible bug, data[0] is assigned to a local variable, which
> replaces the use of data[0].

How do you think about a wording variant like the following?

  Thus assign the first element of the data array to a local variable
  so that it can be used as an array index together with the data structur=
e
  member =E2=80=9Cci_slot=E2=80=9D in a safer way.


Would you like to add the tag =E2=80=9CFixes=E2=80=9D to the commit messag=
e?
Are you going to take this possibility into account for any more patches?

Regards,
Markus
