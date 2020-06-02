Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4BE71EB97F
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2020 12:24:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726782AbgFBKXp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jun 2020 06:23:45 -0400
Received: from mout.web.de ([212.227.15.4]:43949 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726110AbgFBKX3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Jun 2020 06:23:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1591093396;
        bh=PFMGEEOay+KgZ+tXV/1dnZ9aJORVzZha7g+cmHJx9K8=;
        h=X-UI-Sender-Class:Cc:Subject:To:From:Date;
        b=VRVEvddnONAMEny8KtNapxroWH7qeQ5VOn37yV9iYEfoZ5lOd0xw4WEeIwlwEEUjj
         n1jy9Jt+9K/6pkK7yzfICsI9hA5PcvOSHSeBqam9EIzUpaN3dqzGpiLx9wNyhZzHCV
         rz0AczPERVoUDM8jmaDy4ueqVVlPkTGhIjbZO584=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.243.186.246]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LyDqv-1it2MT1ThV-015Yx5; Tue, 02
 Jun 2020 12:23:16 +0200
Cc:     Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>,
        Stephen McCamant <smccaman@umn.edu>,
        Qiushi Wu <wu000273@umn.edu>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: staging: tegra-vde: add missing
 pm_runtime_put_autosuspend
To:     Navid Emamdoost <navid.emamdoost@gmail.com>,
        devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        linux-tegra@vger.kernel.org
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <248e05e2-1df9-70f2-a6ac-f1af7de59a06@web.de>
Date:   Tue, 2 Jun 2020 12:23:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zzAdO8FDlE8+3RjN3/UcNosPsDNRbO7ORKaZl8/b3LHhlFIaxvH
 7l7k/zWu8fm71fyJyKpCL1YysRM6mBTLLDGwIUqjezHjfblXLcXlJF8XQBhY1pflpDoVW7P
 yQMZj4DeNymYg1ux++5Fr3PMPg52BmVeNa+6/NSSUGz4KTBRVhQiDvqM8GDRfLrMeTfuA0k
 RMvZndltEYM6m3+idKf+Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZELtrguBuZA=:hPxfbE514D3MZieRb5wXe+
 h2JP6P2lIW4atfnN7632HFi7VbZRxzAJKNcovw8X+36zGRtefPekSHAdEuObqBmXN45InEWcV
 AmhQ6aJ45cevuXPOVDbV7JftxQ4k53IqtJkkJCiDGw9pFIGTw8KGk+pJbchkdDorNJspI4BXc
 jT/yZzACEthJ1CZOB5pD/aYOswy4F+eyDeQKcT533IA4+47yF3H1a97CEUlqZny52B5q9p8+r
 t0TGgoCc71epvXjY07TtUpFcT++3RQa4rZynCxGxNw+a2smyUqZf53tnGtPY2QyqGhutpQHU+
 xkaEy39jonT+zBL41qIa1KU5za47ywbC+SF/PZ/ovgeTn+59pk7UNFmj3IDbu0jH+MLm0Pj9B
 uD10Dbr0xp6BmaBHScSx4bryEegFkdAmf00w268izHcMk78a0ypf8lQLHLeaux521dOpRZFNB
 /0waCCJZHf9n4fzkqB1gw61Y3AUiDDhl9GLQlISrWKmLswsQ2bLLYuIhJ45z6JobveD9KDwHF
 OOx0uqWzu0hsoAqCpZCkdegwIFABJriqpHuZzxU7XbAEpHyxbjmGGjsGucPPyx9OS7dvF1mpr
 vDX4GlpCbdhsASPI4XC4KsPm94ZAgxyU2aV7LTEsLBVtpMHj/v3BEBHdKhkEQGOT9yCePDhYi
 RuZX8mKacdaKYHFbpXIg/gzl+fvcz42HXKGdjdoyAnxwKXu3dalFwgjTuI5IX+dmNpFDaOoCe
 5IHnytdcJsAiRLkNIWd6vI7V3jU0Sz+juf+g7HUbQ0eHi0Hc9+MO2b7qw9Y0O+qsaolrv2JLv
 Lb55ga+j7TBqQqtBTaOtqR3vAMZU492Eav/la5uuul7BCGcPsissNX2H/XL/tkUBWvHPy+AjA
 IjLcC33dUjcWe7MfrnmFO/E9FDJW13du+DrNKtuh9ALyjHFfkYNma5nXzse9+vPG1G5hdvw7r
 KmTbJQfHzxKTBfiZsfytA4XLtbG55istuKWU4xVVIblU0uTl8Feld/qmY7gjl8NBd6h+rOGYX
 GLE8bYvku8TVGKPTrFX/5KVjxvg8NuGsOSvsdxJyPgN1abtJ+7+NnsOzHgiFCITJQNQavtAcP
 54+m3Ur1BA5C24LbFYiGv+6nqqVuthPgVV0eIX8+bC3O68WBkc2Kd2MglLo6iV7IFVnHTUZXX
 a65eoeigeFuvx5o7MK3GL0euW4FrTRHyxbpttQ5s7z0so/JWpPSXwByBJ9dnMjk9ZnafgUTZt
 WhZSsWyn96j97T2i0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> Call to pm_runtime_get_sync increments counter even in case of
> failure leading to incorrect ref count.
> Call pm_runtime_put_autosuspend if pm_runtime_get_sync fails.

How do you think about a wording variant like the following?

   Change description:
   The PM runtime reference counter is generally incremented by a call of
   the function =E2=80=9Cpm_runtime_get_sync=E2=80=9D.
   Thus call the function =E2=80=9Cpm_runtime_put_autosuspend=E2=80=9D als=
o in one error case
   to keep the reference counting consistent.


Would you like to add the tag =E2=80=9CFixes=E2=80=9D to the commit messag=
e?

Regards,
Markus
