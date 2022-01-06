Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AEF2486D9B
	for <lists+linux-media@lfdr.de>; Fri,  7 Jan 2022 00:16:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245416AbiAFXQv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jan 2022 18:16:51 -0500
Received: from mout.gmx.net ([212.227.17.21]:57147 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234795AbiAFXQu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 Jan 2022 18:16:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1641511005;
        bh=dtKmWOKwmhw3GyJH8aLuqusRCC79nzKh129S11UDiU4=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=N8ILPoh5QRP384xq03E21UMiEMwZzOOOE/ALfg/yr646QyNEIBjxlSIToVmDRia2V
         ybk2dzBf+ZVadVYwraOSyAd3iuavwGjULb+sRGl6F+mCcdEI+enQFqDXQaKhmAd9O+
         6+XaAV9DxaWSwEbDrILNRb6lRxcXsrA2Ii9sIT2g=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [91.65.60.26] ([91.65.60.26]) by web-mail.gmx.net
 (3c-app-gmx-bs01.server.lan [172.19.170.50]) (via HTTP); Fri, 7 Jan 2022
 00:16:45 +0100
MIME-Version: 1.0
Message-ID: <trinity-59385619-7f83-4302-a304-c5346098c3a1-1641511005761@3c-app-gmx-bs01>
From:   Robert Schlabbach <robert_s@gmx.net>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 2/3] media: si2157: add support for 1.7MHz and 6.1 MHz
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 7 Jan 2022 00:16:45 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <20220106213045.6afe5a35@coco.lan>
References: <cover.1639140967.git.mchehab+huawei@kernel.org>
 <76c2ea87882c87bd35066a85cb48292a36a79fce.1639140967.git.mchehab+huawei@kernel.org>
 <trinity-b5cc1284-ccc2-477c-ac90-56ee40da91af-1641483579446@3c-app-gmx-bs50>
 <trinity-59d726d3-993c-43c9-9e44-5be5cdfae74d-1641493525223@3c-app-gmx-bap38>
 <20220106213045.6afe5a35@coco.lan>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:xCBDe7lZdYaFckT1qv6ui/fo7meaUckuE59yOHr/72nb/yomlgVScGOOvedX04LQAFXOG
 s+GQQzUQ5s96uJxHKGyslfNdk0zf2gcWCZQm5EzsR6KZDnpZBT4vinPWAOiA8NukLqG8gl7lMxlN
 ggjZV+RwUHV9u7dYuiHRoGDAVbISIFBIyBdNbRpPwW1avVNQFNl01gCSBdIx5jVUZVWKbTPJnoo0
 JrTE+DBS8sdH6pA2hyYItWlwM37ziMRgt/nT5iLYkLFTiNCuVzY45Q12GfFyurvwDH4EKdDCE7h7
 0w=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:UpJ2rQ4DR2s=:EN88hLnZnjUflu7PCweA7c
 lWLXlg8CwN23WFV/4jB/nkYRIfzApoONehQIFEYXoQwvBeZemGsmRO2++RuofZLPvu37DcxqR
 OlYp/CeN9BVNkN3Rz/83WzdcC1rGxDVlSjMbZ6P0BYQutQSAcDZkdL/qexfR0Pi9F9ffh8wdf
 hdGmofd/Wr0vlDHpA1q7LqGi1PdKgHOhbOjLYSq9hTp0/GAMDbFzYfAyRGc77o4fkNjjjsOCX
 K6TWKEMFvk1Z6tFhgz/4TLym3+BGpeb6OOYSaFUerf9QLCu72ri4lzh4bS7lLrFCwNeBCt0dx
 SvWneWxfx4lSFJK21tPhucyNESVTnBEq496W0Xyx3LvkJUvlscETg2FIKGSLG8xkyVG5zDzxX
 g+CHwLDPEi1Ow2plUFpMGBC+UD0IvKJ8xzpJSkuWgU80anCPOi4+4A5VRkI++lKErnPvdfOq+
 lhN9E6LQFxUY0PalA5jqn4gHHWQVavbqW15TQWwg1/obuVxbbxwUbnLcRyOBmoilBeOyXJSqA
 VI8Z9jYJMjqfHYyAcmoPE5qSztgO8azWoGF96Wn4RW5cjMGcLzE7gKx003cw51zUohfb4GHUz
 HjY5J56kETQK6WVYcE68+jV3jzpi06PgCs+H0kTl2bT3pEK7AFle0PbXefL3n6/RqMcE/T6UR
 QKoN95tev25M0DIeHea+LEuWQA1Avfr6sx22+aiqPpKPAYba6uGeeFWkHI2za0esQSP1S6dEg
 d1K/vVwnboWc2S133ExCQ0HKgSwq68BvO1vqoUMZmqZ2AFl/326UnVLB98EI7iFmcJbXz3UjN
 jtw6rpr
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

"Mauro Carvalho Chehab" <mchehab@kernel.org> wrote:
> I suspect that the entire get_bandwidth() code on drivers are
> dead code, as the core doesn't call it anymore. This used to be
> needed before DVBv5 API.
>
> Probably, the right fix here would be to simply strip this function
> from all drivers.

Hmm, I am actually doing this in a frontend driver I'm currently
developing, in the get_frontend() callback function:

if (fe->ops.tuner_ops.get_bandwidth) {
	ret =3D fe->ops.tuner_ops.get_bandwidth(fe, &bandwidth);
	if (ret)
		goto err;
	props->bandwidth_hz =3D bandwidth;
}

The documentation for get_frontend() states that it should return
the parameters actually in use. And these might differ from the
requested ones. So I see some value in filling in the actually
applied bandwidth filter there.

> OK! I'll wait for your patch.

Posted. Thanks for your time and patience.

Best Regards,
-Robert Schlabbach
