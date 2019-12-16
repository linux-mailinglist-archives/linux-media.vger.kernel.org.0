Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F265120244
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2019 11:22:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727384AbfLPKWp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Dec 2019 05:22:45 -0500
Received: from mout.web.de ([212.227.17.12]:37281 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727311AbfLPKWp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Dec 2019 05:22:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1576491755;
        bh=XW4ppRz99iZQYIyfelvMcGJOQPe7rhgDPnBgmb3T10k=;
        h=X-UI-Sender-Class:To:Cc:References:Subject:From:Date:In-Reply-To;
        b=VxLUt1mVD58vJ48Ow5avfuS0AxqrpnBCVY0EG3C4lEh+v3bn+mEc2mfiUCCFoCzgd
         Pit328fp7xobq4O2vrTnY8lBoq0gO5sW9VMuVmi+CizUERkRjGeVCZ86O0DHWfE6ud
         UjxOsQb43NZ9Oq5kUDxo6T9Z0XZNtvWoz+q641Ww=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([78.48.181.202]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MWj2N-1iDJT60JD9-00XvDk; Mon, 16
 Dec 2019 11:22:35 +0100
To:     Aditya Pakki <pakki001@umn.edu>, linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        Kangjie Lu <kjlu@umn.edu>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20191215192133.3765-1-pakki001@umn.edu>
Subject: Re: [PATCH] media: saa7146: Avoid using BUG_ON as an assertion
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 mQINBFg2+xABEADBJW2hoUoFXVFWTeKbqqif8VjszdMkriilx90WB5c0ddWQX14h6w5bT/A8
 +v43YoGpDNyhgA0w9CEhuwfZrE91GocMtjLO67TAc2i2nxMc/FJRDI0OemO4VJ9RwID6ltwt
 mpVJgXGKkNJ1ey+QOXouzlErVvE2fRh+KXXN1Q7fSmTJlAW9XJYHS3BDHb0uRpymRSX3O+E2
 lA87C7R8qAigPDZi6Z7UmwIA83ZMKXQ5stA0lhPyYgQcM7fh7V4ZYhnR0I5/qkUoxKpqaYLp
 YHBczVP+Zx/zHOM0KQphOMbU7X3c1pmMruoe6ti9uZzqZSLsF+NKXFEPBS665tQr66HJvZvY
 GMDlntZFAZ6xQvCC1r3MGoxEC1tuEa24vPCC9RZ9wk2sY5Csbva0WwYv3WKRZZBv8eIhGMxs
 rcpeGShRFyZ/0BYO53wZAPV1pEhGLLxd8eLN/nEWjJE0ejakPC1H/mt5F+yQBJAzz9JzbToU
 5jKLu0SugNI18MspJut8AiA1M44CIWrNHXvWsQ+nnBKHDHHYZu7MoXlOmB32ndsfPthR3GSv
 jN7YD4Ad724H8fhRijmC1+RpuSce7w2JLj5cYj4MlccmNb8YUxsE8brY2WkXQYS8Ivse39MX
 BE66MQN0r5DQ6oqgoJ4gHIVBUv/ZwgcmUNS5gQkNCFA0dWXznQARAQABtCZNYXJrdXMgRWxm
 cmluZyA8TWFya3VzLkVsZnJpbmdAd2ViLmRlPokCVAQTAQgAPhYhBHDP0hzibeXjwQ/ITuU9
 Figxg9azBQJYNvsQAhsjBQkJZgGABQsJCAcCBhUICQoLAgQWAgMBAh4BAheAAAoJEOU9Figx
 g9azcyMP/iVihZkZ4VyH3/wlV3nRiXvSreqg+pGPI3c8J6DjP9zvz7QHN35zWM++1yNek7Ar
 OVXwuKBo18ASlYzZPTFJZwQQdkZSV+atwIzG3US50ZZ4p7VyUuDuQQVVqFlaf6qZOkwHSnk+
 CeGxlDz1POSHY17VbJG2CzPuqMfgBtqIU1dODFLpFq4oIAwEOG6fxRa59qbsTLXxyw+PzRaR
 LIjVOit28raM83Efk07JKow8URb4u1n7k9RGAcnsM5/WMLRbDYjWTx0lJ2WO9zYwPgRykhn2
 sOyJVXk9xVESGTwEPbTtfHM+4x0n0gC6GzfTMvwvZ9G6xoM0S4/+lgbaaa9t5tT/PrsvJiob
 kfqDrPbmSwr2G5mHnSM9M7B+w8odjmQFOwAjfcxoVIHxC4Cl/GAAKsX3KNKTspCHR0Yag78w
 i8duH/eEd4tB8twcqCi3aCgWoIrhjNS0myusmuA89kAWFFW5z26qNCOefovCx8drdMXQfMYv
 g5lRk821ZCNBosfRUvcMXoY6lTwHLIDrEfkJQtjxfdTlWQdwr0mM5ye7vd83AManSQwutgpI
 q+wE8CNY2VN9xAlE7OhcmWXlnAw3MJLW863SXdGlnkA3N+U4BoKQSIToGuXARQ14IMNvfeKX
 NphLPpUUnUNdfxAHu/S3tPTc/E/oePbHo794dnEm57LuuQINBFg2+xABEADZg/T+4o5qj4cw
 nd0G5pFy7ACxk28mSrLuva9tyzqPgRZ2bdPiwNXJUvBg1es2u81urekeUvGvnERB/TKekp25
 4wU3I2lEhIXj5NVdLc6eU5czZQs4YEZbu1U5iqhhZmKhlLrhLlZv2whLOXRlLwi4jAzXIZAu
 76mT813jbczl2dwxFxcT8XRzk9+dwzNTdOg75683uinMgskiiul+dzd6sumdOhRZR7YBT+xC
 wzfykOgBKnzfFscMwKR0iuHNB+VdEnZw80XGZi4N1ku81DHxmo2HG3icg7CwO1ih2jx8ik0r
 riIyMhJrTXgR1hF6kQnX7p2mXe6K0s8tQFK0ZZmYpZuGYYsV05OvU8yqrRVL/GYvy4Xgplm3
 DuMuC7/A9/BfmxZVEPAS1gW6QQ8vSO4zf60zREKoSNYeiv+tURM2KOEj8tCMZN3k3sNASfoG
 fMvTvOjT0yzMbJsI1jwLwy5uA2JVdSLoWzBD8awZ2X/eCU9YDZeGuWmxzIHvkuMj8FfX8cK/
 2m437UA877eqmcgiEy/3B7XeHUipOL83gjfq4ETzVmxVswkVvZvR6j2blQVr+MhCZPq83Ota
 xNB7QptPxJuNRZ49gtT6uQkyGI+2daXqkj/Mot5tKxNKtM1Vbr/3b+AEMA7qLz7QjhgGJcie
 qp4b0gELjY1Oe9dBAXMiDwARAQABiQI8BBgBCAAmFiEEcM/SHOJt5ePBD8hO5T0WKDGD1rMF
 Alg2+xACGwwFCQlmAYAACgkQ5T0WKDGD1rOYSw/+P6fYSZjTJDAl9XNfXRjRRyJSfaw6N1pA
 Ahuu0MIa3djFRuFCrAHUaaFZf5V2iW5xhGnrhDwE1Ksf7tlstSne/G0a+Ef7vhUyeTn6U/0m
 +/BrsCsBUXhqeNuraGUtaleatQijXfuemUwgB+mE3B0SobE601XLo6MYIhPh8MG32MKO5kOY
 hB5jzyor7WoN3ETVNQoGgMzPVWIRElwpcXr+yGoTLAOpG7nkAUBBj9n9TPpSdt/npfok9ZfL
 /Q+ranrxb2Cy4tvOPxeVfR58XveX85ICrW9VHPVq9sJf/a24bMm6+qEg1V/G7u/AM3fM8U2m
 tdrTqOrfxklZ7beppGKzC1/WLrcr072vrdiN0icyOHQlfWmaPv0pUnW3AwtiMYngT96BevfA
 qlwaymjPTvH+cTXScnbydfOQW8220JQwykUe+sHRZfAF5TS2YCkQvsyf7vIpSqo/ttDk4+xc
 Z/wsLiWTgKlih2QYULvW61XU+mWsK8+ZlYUrRMpkauN4CJ5yTpvp+Orcz5KixHQmc5tbkLWf
 x0n1QFc1xxJhbzN+r9djSGGN/5IBDfUqSANC8cWzHpWaHmSuU3JSAMB/N+yQjIad2ztTckZY
 pwT6oxng29LzZspTYUEzMz3wK2jQHw+U66qBFk8whA7B2uAU1QdGyPgahLYSOa4XAEGb6wbI FEE=
Message-ID: <5f75a571-c3f7-4bc1-9f43-a2d0460dab16@web.de>
Date:   Mon, 16 Dec 2019 11:22:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191215192133.3765-1-pakki001@umn.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CsfqwkCGjvqZPleVtWehdFpwljyylF/KDrnJoP15AhZZFyQTZQ6
 g9H2oddTC706EjRCOJ/8LP/+lpRdBmR2TdHR2LTSMFf28w3G+D7G6KJ1fgxUe2cr8UTeGpc
 5j8nLReixiARaXU1Gw6MpTwUXEjmiUdwplHnOkXcU3L5f0LBqERr/pOPACHt0mrf42fPGbg
 rqZW0WqGMLai/ODbFAdyA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:sQzsNtfielM=:niL/J81CQspw1wTdi8vFTZ
 vFUZlc/cptixL8s+HB1uSS/pa0TJhqT09ctQcYYAjwat5ljkFm2cdIqU9igAk3b3eHgMFjmmL
 EwsXodhv8M7xCl4MApKH2nM1KfIbN4KAIaT7LB5GeX/alriAfe4+xDctW1N9kdcDMjW/GI5Bc
 MLLvaTsYpAGzYXmsugC8CgpV6YN6GrxvWWnSSBeDQxNOjqpp7NrWNdQETjIEc67J48RKxCj3H
 qZbiilIYgNeGaon9rxn3pPklELaSgT4YZudeNKoVL+wWly2I0CeCg1Bo+IHSfYzfdRiNY+awq
 Jqxd2zFHt5RzqXFDI9n9kkhsF7ZqPUxo4XOndH5YT5SxOKCnhv8BKmAdz9/q/ly96uIoIDubf
 hHxIr0qAFtaIwMHDV7+vB1h8GyrI3l6+xH4yed0iwtzGc3fYXeZKNEkEv4Zzc2qvU/ExEs4E3
 gWpoMqUfzjR81eq/njCMttlZIssM35E45Ja83Pj8+V9RKcPWOzIGKv2uAon8dCytw/1Tv4ojL
 2Gxgx0Ml6w7lUJUwKn9yDewA7jsgp/jLeTt/9MB1CRQ5yF8F3sRc1mNx/714IuFIS8sKi/CE/
 BrZq2pX/lpYCZE+fEWCmrRr6DG92Na+uApe5I1F+4PULawiv3VX8LSNmUR96y4Y4JWpFVJtua
 RUNgd8XTa/G7/v+Z+YayEL6ZvrrEul/vhvmK4UghIswqyAjnuS4MIz51d8tmVgXWUy25czr1k
 rbWqWU1RZ2viqpAudQszFEzZOPgOU+XofER4RABKY3o+g4yx1zwb3rKOHZerjPmsSb7tRKqUB
 HUkvu+9nx2ezCF4ZeMKpQaBnGy4Wg8wFok8pbejwdz7HBM0fcux13Nc5o+TEw8IVs1iIQFXLh
 BkU6I2urGIHKBJsIsv26MB9joz/xznyKpZi9jFGjCqtCmfsSZNMWnvTiGmoACJzS+kUWVSGxq
 SyFXwcD0nSrZnTI+UyesHDraa4n82h2IcisSXoOKt38G/JrwEeDDK3xIcpbK5jLmCkURC91Fw
 VSAGXNRgBA4wuFcsd/zvQUEkupRyb2wuWDADYKb9KDSrj9PTeCqkysKv3Ork+qu6dRytlsNMM
 xzGppCq1midN1NsVJ0XfuraqTB9kq/m7RC5wQ55zNNHuWea8jjq08KGseo7isnOysO5Umk22M
 Hqz5iuYNzK01bLupn6QglAWnu1dVKXm/9QP+h3B6qI5/1bUVipUD2vNSX5kxuB/tTcjRLKlrx
 eRmZftdOpuFa+YODOt3CQZxO1noGAd8b239upY2J4So/uonzPIbom/89C0dU=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

=E2=80=A6
> +++ b/drivers/media/common/saa7146/saa7146_video.c
@@ -345,7 +345,8 @@ static int video_begin(struct saa7146_fh *fh)
=E2=80=A6
-	BUG_ON(NULL =3D=3D fmt);
+	if (NULL =3D=3D fmt)
=E2=80=A6

Would you like to express a null pointer check in a succinct way?

+	if (!fmt)


Will the tag =E2=80=9CFixes=E2=80=9D become helpful for the change descrip=
tion?

Regards,
Markus
