Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 860197D21BD
	for <lists+linux-media@lfdr.de>; Sun, 22 Oct 2023 09:57:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229472AbjJVH5O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 22 Oct 2023 03:57:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjJVH5M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 22 Oct 2023 03:57:12 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBE869E
        for <linux-media@vger.kernel.org>; Sun, 22 Oct 2023 00:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=s31663417; t=1697961428; x=1698566228; i=j-p-t@gmx.net;
        bh=3Rq9RHYr2JD87Qf/6UMwwq0b7Gr/NAYxkm279yKiFZE=;
        h=X-UI-Sender-Class:Date:To:Cc:From:Subject;
        b=LLBPWEl1notBNs85KPNg6zFiXbv5DQBmbwJT2T2oyzaF2ygl96E1vJVm9ttJcmQH
         F/ZmDmvAAs8QfNZmqmVkkPYFP76qYAuXEo5wLy3Om+r5iVRD1E4/gPIjN9uuqQ421
         M7JRyn94+KfQfWFjpJRZrzFY+j2dUrQG1nSsYQHSyrii3kjIw9WHwh/MkXgDAwlXX
         +Ciri16sJv09HCvKTFBOrR8MEDBg1QByHrbZJ45sCceCPmPoqJ1iOXSgNBfRnd21u
         NmCHnTQ5aGTHsXaJBjizngJtFq6+iuVx7DfBlpXVE2KZGW54Bn3bIqihFYVEry179
         fXwZOJd0E8+3zg4zGQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.178.58] ([45.14.97.35]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MAfYw-1qnupf3PzM-00B2D5; Sun, 22
 Oct 2023 09:57:07 +0200
Message-ID: <08125fef-3cb4-4f01-975c-d7c409153c4a@gmx.net>
Date:   Sun, 22 Oct 2023 09:57:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE, en-US
To:     linux-media@vger.kernel.org
Cc:     j-p-t@gmx.net
From:   JPT <j-p-t@gmx.net>
Subject: si2157 not working at all?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:b5NyIZoguszaL7kjTUsDoTYeuIBnGdG8RuqfkGFMvJRkBj64FHE
 /nxZ37EeZZ9pxjNdsjH3lKRuO9eqGxdWVRCt3COyfyY3tjW47oBXjzTnqcqDWGogju0HvEs
 lY6MBdQZaibSFXz91PQeiXoK0TAWycqjhesydOvgTQ4hB0RS9fZC/XbfrDhJ0QE9gJsJySt
 p8xTXJfT3G4+acrV9mLwA==
UI-OutboundReport: notjunk:1;M01:P0:E2j9CONnUtU=;FdCztNyodhfvWqbcj96lH2m8dcE
 RHqdl/+y1qJ1EM+C7UBhe5f4wmnz+EOp7dnLlTrb/UKFCHIYsjR9R74B44HaBG4PFDeRXWdQl
 v2hHCrn5knbIxdXoHMSwkaCuYNTxKidp8bAg3L12gElwSO851+mtbdqGx7rm1BI+nAm1kdmc4
 aOQL2HmGjA5cIYXikaphdaUUvf67+c4q+ydS9JHVz58KTqBeVPdmEw76gftsBrECLxIyOhDyT
 UlzuvMAFxnoN0WPaylJ+6UFz0cxXODHwprb7grfY55P8OdAH3HvRlaPjP6PLN9v0nFlR9TRv4
 qTBphHQl47GDiyoEh434nNWGuf/hV2tBLsqH7CrRVCZmxTmXcqCJVRyF80tDq7xV4ySP/YrgV
 XHaR9IdcXVeuqACGdH8GLg0JycjmnV/5PNHqhXzbT1zbVJ5FHJwWpjdYgq+w5lWTalQ59rnlx
 nATa1XnvyUjrxgsuDUlz6+/RneDBAz7CU8ZRMRdxLqkvk3RNXOORR9cYuzr2P3ZGwtRaxcIyJ
 JBLGA0M0AuZFMHQizPOT0VEGJYmcWuZ2FpN7DzDZ4/kn7VbeH0ZER2MPrHL6m0kjuqrqpOYWT
 U1hZ5s+xKwe0ZypY0IRZN42HhWSJMPS7W1XLLyUTa3MH1w2aluoLxG53CmMs7um1/soPVZDI6
 51TkI/ZXoI5ABw033/S3OrBfdjaHcU1VBEV0fJpPqJKxY9wWCFhnmb1Vhkz5c6BdNwSFLoKEO
 cbzNgwibJ+Xb/E9uqmzP/t5v2j5PoswdIfLMPoXIVwyyD1zfswUU+LzyUEZLBUQ8jEpgCy4R+
 2M7+H9B5U65WE157KN3UDCGMz5hoerEQjYXmm9c0BJkfUJ+ZXnOU8ryhFKz0tbbbp00HgwFq0
 Rdrw7c7gleIuvfiP/NPo//CPkAocM0FOuTkNAwpQdi1aSudpUVPgG5y52LtDZa9+QmK6IT1Yk
 oLQdFw==
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,RCVD_IN_SBL_CSS,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

I've got a
	TerraTec Cinergy TC2 Stick / Terratec Cinergy H6 rev. 2
DVB-T2/DVB-C USB stick using chips:
	IT9306, Si2157, Si2168-B40

Is there a way to make it work?
Or is the si2157 chip just not supported?

si2157 7-0063: device is buggy, skipping firmware download
si2157 7-0063: firmware version: =EF=BF=BD.=EF=BF=BD.255

This patch added the "skipping firmware download":
https://patchwork.kernel.org/project/linux-media/patch/20191010095103.3803=
-3-gonsolo@gmail.com/

is there a way to tell the module to force load the firmware?
Or do I have to patch the kernel?

I tried on Kubuntu 23.4, kernel 6.2.0-35-generic
and on Libreelec 9.2@raspberry 3B,  kernel 4.19.127? , where it failed
differently.

libreelec log see http://ix.io/4JBp

thank you very much

Jan
