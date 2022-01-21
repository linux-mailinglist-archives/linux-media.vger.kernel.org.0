Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C668C496736
	for <lists+linux-media@lfdr.de>; Fri, 21 Jan 2022 22:17:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233176AbiAUVRu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Jan 2022 16:17:50 -0500
Received: from mout.gmx.net ([212.227.17.20]:42589 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232971AbiAUVRt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Jan 2022 16:17:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1642799868;
        bh=iGmYZIqWAKnKoIOYDwGIKZjktLKBzUwZpfPSjAROdLM=;
        h=X-UI-Sender-Class:From:To:Subject:Date;
        b=MfIxkYpRUlgZmCucakMdEn2Pkieu833ykUbxJUS3XaDCQC0IUiLbvYDf5sQVKZdzP
         EnAW1QJ+GD4T1dim+5wh7JekV3jqxHtQtdtB9CIMBJIkXMCmTCEzx0YUxYXx7G9c6g
         P3VRszH9IIjgbcCwsjTsGOylqGfg9V6nGPeITEXc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [91.65.109.130] ([91.65.109.130]) by web-mail.gmx.net
 (3c-app-gmx-bap04.server.lan [172.19.172.74]) (via HTTP); Fri, 21 Jan 2022
 22:17:47 +0100
MIME-Version: 1.0
Message-ID: <trinity-e74a4d07-b411-42cb-a763-c6d6828776da-1642799867846@3c-app-gmx-bap04>
From:   Robert Schlabbach <robert_s@gmx.net>
To:     linux-media@vger.kernel.org
Subject: [PATCH 0/1] media: dvb-core: Enhance shared multi-frontend support
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 21 Jan 2022 22:17:47 +0100
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:BqSACeEyhvzOrTfkN2F5dr/BJ54PHHtr2nQUEDHMQswWs/ddaK1prF2kLaV/DEpk1ecaB
 W/9ChNYvZrRsyL/qFAq90tjSVM751i7C7NLxd8hzOgodgbMxkGtqj29kwKB6RYvvHJ/YBHEQ3En7
 xIO3Au7mkMCMjcr8jHW60go0cvmEbT4ErQnzAcpqo9DgGNLBWm3NI8AF7XOoVXFsClPvddVfsC3T
 RUX/mwS/Oaicn0X8TO3UzypPVpL7PCmxYhtHb+lYc+JC8FWHR8SilsXry+PfHzPEN21Qd92wnPL0
 U8=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/vUEE+zt6lg=:n+wrGgaoUkBjVgNM0OSSLN
 NezygcKXxXQ/vXBdw69vuvqa1MkoQqEVhlkXPaHO8JX/tMlrEKA3gWsSGdMrvgmYcfzxJVTSh
 zQ8xAkH7i/bdZI8H501/hi6+7Leu3wwrtTudLNstJ1aps6AX8Jqp566AIBgNgG0VF1hdKgKau
 njWNoTysoFUSIZY9NE5ZI2rSaF6QAeNr5yK3IvF9aOBz7pLwm42B9salnfZwYdCXBwTtDxfeW
 XnDjqUt3GxM0Tn25+osoJeebxFLArShwmEQFpKJ5YtyC8bFnowp96EuGuRYP2rLNACVahj+ZK
 nJ6KpFOaslCSN8mfAdInu9T1AsEz/7ejCErOIk8Cf7ti61aXCvVR4YeZPGLjJNyB0J8dAAS4s
 d7Lv/PU87M5Ta6luis97yVdlKOf4bMA78v8iBzhu64g/5Tdxhh5xfX6EHL7owKGdmh41+ZO+c
 lm1eZpGEtYRGW4fhcq8bFgA6/JEP4+vKinOSgBTzWlSeUNylcJhLqlXgQOAOzZMl1EtL56VJ9
 U9j1k/zouxRLAhAfRgynMlUvurCSy1MmjTD9Y8evFYcrenE4+vtqwuKXNhTRtc5H4pM0dKaGu
 djpXMorQRxQQOFPG8+58Bf6RD46qCJjbBmEuO8+t5wktqGVXAigaKSuDk7IwkdnzQBE1uFl6f
 dS+EZH1eJzRQWh2bFy6w2plfkXJ+TvxL2t9cwtBc05P6+TEK9P4RYdRy/PfL4ufKUjXU7fwj5
 qNhD832ivaPt6huOPLytBW3t+0lspyIYy4xjOpNy8HWpvbEO5qsmPLwScQPIos8WG/fWZsTqR
 oR0cLsX
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I'm currently developing a driver for a receiver with multiple frontends w=
hich
cannot be used simultaneously, and found that employing the mfe_shared fie=
ld to
exhibit that restriction leads to terrible behavior towards applications:

- the unavailable frontend device cannot be opened at all, not even in rea=
d-
  only mode to just query information about the frontend
- and really terrible: the open() call is blocked for a whopping 5 seconds=
!

The user experience ended up being this (/dev/dvb/adapter0/frontend0 was
already in use):

$ robscan
[5 seconds delay]
Could not open /dev/dvb/adapter0/frontend1, device is busy
Available Frontends and Supported Delivery Systems:
1: /dev/dvb/adapter0/frontend0: Silicon Labs Si2183 (DVB-T/T2)
2: /dev/dvb/adapter0/frontend0: Silicon Labs Si2183 (DVB-C)
[shared frontend is missing]
Select Frontend: 1
ERROR: Could not select frontend Silicon Labs Si2183: Device or resource b=
usy

The actually busy frontend /dev/dvb/adapter0/frontend0 could be queried
for its name and supported delivery systems and the error when trying to
use it came back immediately, so I thought I want the shared frontend to
exhibit the same behavior, i.e. allow it being queried for its name and
supported delivery systems, and reject write access with -EBUSY without
delay.

So I developed the attached patch for dvb_core.c which allows setting the
mfe_shared field to 2 to achieve this behavior. Using this setting in my
driver yielded the desired result:

$ robscan
Available Frontends and Supported Delivery Systems:
1: /dev/dvb/adapter0/frontend0: Silicon Labs Si2183 (DVB-T/T2)
2: /dev/dvb/adapter0/frontend0: Silicon Labs Si2183 (DVB-C)
3: /dev/dvb/adapter0/frontend1: Silicon Labs Si2183 (DVB-S/S2)
Select Frontend: 3
ERROR: Could not select frontend Silicon Labs Si2183: Device or resource b=
usy

No delays, the unavailable frontend can be shown with name and supported
delivery systems, and trying to use it gives the same result as for the
frontend device currently in use.

I left the existing uses of the mfe_shared field untouched so that existin=
g
drivers continue to function as before. Maybe some would already work by j=
ust
setting the field to 2, but I did not take the time to thoroughly review t=
heir
code, nor do I have those devices available to do regression testing with.

So for now, only my driver would take advantage of this. I intend to submi=
t
my device driver once it is finished.

Signed-off-by: Robert Schlabbach <robert_s@gmx.net>
Tested-by: Robert Schlabbach <robert_s@gmx.net>
