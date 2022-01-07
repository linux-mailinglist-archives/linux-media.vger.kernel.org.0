Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17F694875C4
	for <lists+linux-media@lfdr.de>; Fri,  7 Jan 2022 11:38:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237436AbiAGKiy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jan 2022 05:38:54 -0500
Received: from mout.gmx.net ([212.227.17.21]:35437 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1346870AbiAGKin (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 7 Jan 2022 05:38:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1641551918;
        bh=6edd3ULFRvW2/vmQ7CEyfXzeRvulVLWK5gMjeggnUWk=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=eB59ScooN3hkHCBZTLpDeYAjAFPO1mePQdz/7TovRROVFa6ZaUGiBN8zeq/ZVz8t2
         Ow3G/XNFNPMPy98k7iFMlQKNhneGh3TS1zZRMz151OLqgPdQR+zSL7XYNnXWvwxiAP
         zT+jpqWZfPQnzjN/Fsd17BDYv7WJTrkTk/ecSe+c=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [91.65.60.26] ([91.65.60.26]) by web-mail.gmx.net
 (3c-app-gmx-bap54.server.lan [172.19.172.124]) (via HTTP); Fri, 7 Jan 2022
 11:38:37 +0100
MIME-Version: 1.0
Message-ID: <trinity-37466cd2-8684-4e53-a4a3-7ed406945e90-1641551917644@3c-app-gmx-bap54>
From:   Robert Schlabbach <robert_s@gmx.net>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: Aw: Re: [PATCH 2/3] media: si2157: add support for 1.7MHz and 6.1
 MHz
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 7 Jan 2022 11:38:37 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <20220107080625.00547988@coco.lan>
References: <cover.1639140967.git.mchehab+huawei@kernel.org>
 <76c2ea87882c87bd35066a85cb48292a36a79fce.1639140967.git.mchehab+huawei@kernel.org>
 <trinity-b5cc1284-ccc2-477c-ac90-56ee40da91af-1641483579446@3c-app-gmx-bs50>
 <trinity-59d726d3-993c-43c9-9e44-5be5cdfae74d-1641493525223@3c-app-gmx-bap38>
 <20220106213045.6afe5a35@coco.lan>
 <trinity-59385619-7f83-4302-a304-c5346098c3a1-1641511005761@3c-app-gmx-bs01>
 <20220107080625.00547988@coco.lan>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:mQCgeaJWNJFq6xfQGBfZT9YC2ruqX3N+vTpHXhz5B13biGmx3fUg63YQU8hrPz/hUyVjW
 aXLAJMlrMAJPzv0ILuYtrMDyF9Yr4GF+bOtqV9Euigp/pdtBunk8yS2dN/drBBCJXLiUCRkNRu2p
 cN8GOt4Z85T9mM+uf87eip+QD1JzQOEkyBAWQBFQHkYtFG0EA+pfRL8aSG0+Kz50hJ2ZkkifyT+E
 yeXmyyxAdK/dU3DBkkTgoqa7J+iDHQgCj6p1KBMsmuqdUojIcvI9xYerw96o9sitSxui2sMVYRJK
 WY=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Q9eW4VF7LbY=:aks1ftFRE2It3hYQ4yWZfk
 gNddOmJS8ev+i5glC8fvI+qP++iUFFcxSC+BK8W7XkUKFr7Y1VKW6yvvMNAbcFoyyLhtYKuyJ
 9tEN91JhUpOVFidMm/99DWX02KQkucqz39Sx2AOL2GwzTjGQlHfgW9G54RstD3uoXjHF0BlVI
 Yzovt+2Qgku1/LB9xsO3O/7SODIC5Z8gjcnBWlDPv8a1eA2jCAMKQpBHTfrKFg8ZI5cKWvES0
 VhdpzAvwjQOyX7+0Jn7X8MweUnlFOBNM2z1S2gqXbD9RFLTI/EjCHUrPzevuzL3UZ0WP63pJp
 ADPizr/wnNUab9uGPVSnCsEWT8MnJ3BVhFi/7izs5ySmdkgNAIdCDkMDhJGXauWW57x1KCqwN
 0NerrEkASzR+J2QSX6EsB9Ovv2QAzjucsvNioX2X/1IkSi63BaWfTmugECc0aBoBfwK8DpsG9
 iP2zb5dqO4k0U6Lj433zkGKOdqyTXf61EBCMZJRYnDiA4KMU6MnVM31SDoeXkJNbEE+wAHWB8
 acWWMz5xGbM2bvy+sA7am9a/Ip4kMV1XaHJ64zBFQJ5a3pH+mgPWv+OeoNOu+T1a6nktwiYav
 Re3OvhyttrOnWsk51h3TpRXuST65xlQkogQLRHMKJZCofIBj9SAfSjOJxZvYYAU3T/BHvMmGn
 FRmIdvAEcu8DnV0PqntkHF48UeJTT9nwwUy9CB6joi47Zoj7zKwKLPoTaAhzHBVHkBUryl0G5
 o7bRpXxmTHNkDp7Ah2gBkhsZE5PVVtqKlkI3tXwHTHrt9axaQO/13mAt7ZfOSwr/37XIyqEPX
 Ig3L5kK
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

"Mauro Carvalho Chehab" <mchehab@kernel.org> wrote:

> As the DVB core already stores the bandwidth used to tune at props,
> since the introduction of DVBv5 API, any get calls will return the
> tuned bandwidth.

No, not the _tuned_ bandwidth, the "requested" bandwidth, that was
estimated. I see no value in that information, as the user app can
easily calculate that by itself. This is not information that the
kernel or driver needs to provide, as it is solely derived from
the information the application has given.

Whereas the _actually applied_ bandwidth filter is an information
that only the tuner driver can deliver. For example, there are 5MHz
DVB-T2 channels, but the si2157 only offers a 6MHz bandwidth filter.

What should get_frontend() return, the requested/nominal 5MHz, or
the actually used 6MHz?

Reading the include file, the answer seems clear to me:

https://git.linuxtv.org/media_tree.git/tree/include/media/dvb_frontend.h

> * @get_frontend:	callback function used to inform the parameters
> *			actuall in use.

So following that documentation, I would say the actually used 6MHz
should be put into the property cache by that callback.

> Thanks, patches look sane on my eyes.

Thanks for your quick review.

Best Regards,
-Robert Schlabbach
