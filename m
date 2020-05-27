Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA2081E4EED
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2020 22:11:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728224AbgE0ULT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 May 2020 16:11:19 -0400
Received: from mout.web.de ([212.227.17.11]:60313 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726946AbgE0ULT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 May 2020 16:11:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1590610261;
        bh=CHV7SNSIIZzmGY3i8n8PgVpj3Nj1KoCxW/Gzc0jiBr8=;
        h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
        b=GfIrViUQFiikAi7Qic8g6awgl7l7e3lC9z1+ZC76F8DCKcYCwI1tm5la5Cd+z2ZAQ
         mMs/5qA+VJDno0FmtVThXZcikyGbM2bEj/Lplp7Gmr3HsJuFQhVMd0JRkfz+BhpVo/
         M2IayMrUsuloABU74SfxIx9WqeIGdpUmmOJM3ioY=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.135.185.253]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0M6mTI-1iqM8v2Gm4-00wYgX; Wed, 27
 May 2020 22:11:01 +0200
To:     Chuhong Yuan <hslester96@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Chuhong Yuan <hslester95@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] media: exynos4-is: Add missed check for
 pinctrl_lookup_state()
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <9e5330d3-9f68-2538-6bd6-cc4c688e9e85@web.de>
Date:   Wed, 27 May 2020 22:11:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:E0ncCqmnC3zi3ItR9C0IER0kl4BL2d120+xAIU464WkV7h3xbBR
 jtRpR8xK2RG9pQApzkz0BQPA85iBqNhHvDcihVDeIuWa3endfeLIg570GHvTSMSje0E7S9u
 L0K4RICfoFuLy+KsPSD2sadpJhV+us5k2WjJJy8GSHsZx76R8fLjFMI922+6hWTQcgs9DEF
 Ljvi741rMrYBCAL/KYahA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:R9sKFzu2WYk=:D+BapHhaQTTkh/HkEA5gLs
 55HI6FXMc53defQsDSwfQGmpeD6V9jHqUymC5680rmQJQF9dj+PRBtDopIbZa3WYgJMhGWou4
 ax/hTE7P8PNkTn5FG20cPS+eAZ76nuUZFViQTwTL98u5aQrVurr11xtooughAxojbbYW17921
 nNV8LVWl+yAUJJ9joRhmW+bT2d/g9OVVHuTa9moUQMZiLFpZoa+XfS1grnIwLw0LoZOLf1bx3
 XWwZYIwcQ1GHpmqBnttKTEd3y2cKP4NJIIV+UG20hgXRbkW/4JBvN51lfLiViU0ZpC4JZqo2F
 wP81brd19HULAp7I7oh1mHbmoD/zdV5W8dmdqTDdQ7GtpsjNeqCq6JEL60hAT0R+d/zBoKmve
 EEFZSaGh32Gnc5VZVhgOKU032TOhKbHXpKcJrl0CvFYbO21R68fe0j5nCELbkDf7ixvv+hS+b
 HqosIuB3IKKBFvdUwoMlZLIt8YikHH5y5c5X9K131+bxANSJQ2LLK+r7Tm7BB1zDqwmDA2VJc
 uGUeLVZfvSg1PoBtgwbrFj/xzURXmCCoNeHfkIqNqOrLpQbkLqoCVwJXU06ss48H9zHP1HWl4
 oBfzif5HLGZ80Ilog+hmILSPEngZOShnCa+obp5KmXXNHqraI4hN97ZAWtiaS88sUJpgfdjRD
 fiQ3FiWkGdclx0bETeKlttXrTcugTLAPRlMK369wr/beClx1a6fzbShnW36azvwcAwUTVA78q
 bqvqSjFw0p6rxLFA0UqmJ3OVTAsVsRq2ct/IOFka/1kHMuNKqQElnBfDxjVMNHZxw4IB/xS1K
 H4koE6T5TAY/CjAfQEUmP9Nuk1yGuNG+FDLtOjpWBvIfEu0ChO9h/qI7GWB904d98PtwIHYu7
 f0aLhzVUwwxYL8rixxgspoeyMHCa9014O8tAWyZ/dVJIVQ2eMTMWdXd/ALFJX5M+UcDSyZSbc
 leb5JOWRvrlJEB0oUr91yMZhya8PPPzsLCb4uhqb3+DcEWg37JO8xQ598HGtqhohQFZP3SFcu
 4egzmZ7UYWaNLktc57c3UUMmaDDhMV7OX//c4xXu8FSfx4CuPoOdi+4ufSqnn54ZUMA2f+aUy
 zNEZFkG5fCX7NTKeIua1xHMK+RJrpUqFpOOkQDcoqXEdxT87tA7kdnVKCaHzy7Nb7s7F0u1Qb
 9ReBdrsJxHrX2rU5Iz9OHYoYXgEm3nLL6FBKGeNfkLIEXjn9ytssWRojCFRVn9K/O0S6vRNsh
 AGhFknlT0gy+0IuYa
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> fimc_md_get_pinctrl() misses a check for pinctrl_lookup_state().
> Add the missed check

Thanks for another completion of the exception handling.


>                      to fix it.

I suggest to replace this wording by the tag =E2=80=9CFixes=E2=80=9D for t=
he commit message.

Regards,
Markus
