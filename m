Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFB131DF6F4
	for <lists+linux-media@lfdr.de>; Sat, 23 May 2020 13:50:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387782AbgEWLuj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 May 2020 07:50:39 -0400
Received: from mout.web.de ([212.227.15.14]:49343 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728749AbgEWLuj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 May 2020 07:50:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1590234627;
        bh=8Gkj/3YjLEY7uQYXC/gpf96dAamqoYM4LMCHyUAX5RY=;
        h=X-UI-Sender-Class:Cc:Subject:To:From:Date;
        b=Zj4DEb1/RVGP/Wj5ZQj5ATP3WP2GOHIgGksqpj3SGoNqnXhlKx5UCzrNzzw5VXDUi
         m1UbO0Bi0RE9Lx+e44wh3m9a1u3sX91CNa12NK7cNHfrvm6ir0gBSBFn9r8RPhuHfx
         QYktNDfQ+/IqQklP5MvGzpmZfshA+3cEtB4yXgBc=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.52.63]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MXYjm-1jZpGn2QsA-00WVJq; Sat, 23
 May 2020 13:50:27 +0200
Cc:     linux-kernel@vger.kernel.org, Kangjie Lu <kjlu@umn.edu>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH] media: s3c-camif: fix missing disable in
 tegra_adma_probe()
To:     Qiushi Wu <wu000273@umn.edu>, linux-media@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <373518bb-d89f-295f-3b4a-cb48e5861ad0@web.de>
Date:   Sat, 23 May 2020 13:50:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qHuVWPTWNX3AZTu8/gG7jruAPhTMJgGt3oVjuzhQhIvY+o2w7TS
 XPAj/Zi15t7PlNfFI8o5VmvA23yDZip0EwRpPKghGKEUUwOfIgAzSO4H1kNukaBITrwdmEQ
 Cu8d0L+sYixnr2A3JhliGaLM5vHNMg8zgFbPQ8t1ApHWr1QY0sZC0xTFRvyCTbDKBbD2h0p
 1m2UGR+zFRgoK1BsRuTmw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:UHu7T7gdkGk=:IXNcYSI6rURMpXCyGekRm/
 KOqq9kH+JtRE9GXYATgkXmuR3lYkKHqYcBxbVTKsJqHQtEw7qquW5ME3lk37K6vXYXUKfj+Wu
 In1pGX9Jb0e98ggF0u5gEiFTh4GMHrZTaoCc4DdLG221DwYPkb3k28PlcUlVvs5Yqdzpi9qam
 1R2DnQBj3UboompATK3yFmrZlbOim6m0xKG6kpUKmk3cq0hZlTXwDPyju5QNk+LRrCP+J2eL6
 3BbuH2hQm1LYiJjuRJx5w9Al6rcS1YU+dMDEsvBdDNi4/u4M6w+RjmLRygVqnDu0wGkpjYNlq
 42+sjopfT3/CZPodzx9UFS8g7TJdga7ySFkYbB/Hn+Eyhua27fKg/K/6wzkXLjbMsjOz0Yfvm
 AcXiQMLEDQ6ou1CnyHmEL3ObHDqotoODIBFOV07mEXb2WmhhrnZ0uKzhoHButMIwuRQhRjkpR
 fZkwKgtgpf0XOHTC59A2crhMJx6W3c0LkRUuJ6PB+xYfy/gNC9bv2hjQONPqkj4+BlMuLXy4b
 tVcL2vEErEcPgHi3CY+5vAGdIjKfoP94/AH3Dj4ciVxl+MmniOnd5bhxr/4StL6YSwDgK/6Uf
 C8sxyF+TifOnW93fBtnnzwi4VD+ULNYzB0j72UiLO6PXkz2GEkmLGiSBTLiY6lYy/6In1nxWI
 YcwGZGzMpIpMlWChTvZF85MSIpO0X0fiPaDDvGg31nFOAnspMusp/l4ekTC/lzAKzJCuGS4pj
 gTOsje+FO0MccaE/OTeccJGda4JYNIQjeOTEBOwUjxJ9yqppboVQKH/B9sNxqNwiLZI+jD/FG
 iIn3359RuoU3DuCTRwgmrXZyCA+7145ZDz5+gAZYPBuWHpNYGp6xJVR20Dzx9YO4abBBWhAuc
 oYcVcGqENF2aMH86cMUrCos7JvBAgMtadni9u44PolVopq7uMDxuMIkCZnzjh0lIYXXfeJoKT
 fChlz3npuC4MWWx2HlW57bl1Rs+H49yRd31H+/1AgNj/9zknxv2hOz51Pyv/WvJJv/vAzJPZr
 dxVPV9i0OOsoTohhgwGU4i6zWK4cdGMH991La9LiQh9yQnMu7tycvWAj8mr0Znj+VJT0hl6mP
 WoTVgc/wdjFc9EY32DsiE9EACwT2PKan9M0IzufUEkTaZiuYbsdoDzUt5j2WGuTdAHIhJ9FQO
 z4YWx7yptCCVtHiDoM51K+iSD+oOU5fYbkJnYC0U6I4LBFrHpj4LPqkENuNiejgTTCgjQ3ZwX
 vZRuVHQv3eh2xS28S
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> "pm_runtime_enable()" was not handled by "pm_runtime_disable()"
> after a call of the function =E2=80=9Cpm_runtime_get_sync=E2=80=9D faile=
d.

How do you think about to use typographic quotation characters
in a consistent ways for the final commit message?

Regards,
Markus
