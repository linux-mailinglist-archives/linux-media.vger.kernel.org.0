Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB87910FBEB
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2019 11:44:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725954AbfLCKow (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Dec 2019 05:44:52 -0500
Received: from mout.gmx.net ([212.227.15.15]:37745 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725829AbfLCKow (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 3 Dec 2019 05:44:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1575369890;
        bh=5XMltVvBY8WyBBsDg6f3ydY03dzZZn4pBfPrfCkGHoE=;
        h=X-UI-Sender-Class:To:From:Subject:Date;
        b=WSO6UygZwAUzfVHWFDkZ62ux5l4WQ54jmvjcK8i6eFhJM0l8T7EegVPWMEeFEiJZg
         18DrGpcsDFNGxOSmMQNNclOIGXa8UX5BKbA8gBBZJMskdyvdkmEy1OyClQyRRmu/mS
         ETfZ57KikLdOUzJnrECnElplb+cx9+n0Rm/6b/Ww=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [0.0.0.0] ([149.28.201.231]) by mail.gmx.com (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MEUzA-1iZHaK0jAQ-00G2DV for
 <linux-media@vger.kernel.org>; Tue, 03 Dec 2019 11:44:50 +0100
To:     linux-media@vger.kernel.org
From:   Qu Wenruo <quwenruo.btrfs@gmx.com>
Subject: Unsupported format MFVideoFormat_P010 for Elgato HD60S+
Autocrypt: addr=quwenruo.btrfs@gmx.com; prefer-encrypt=mutual; keydata=
 mQENBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAG0IlF1IFdlbnJ1byA8cXV3ZW5ydW8uYnRyZnNAZ214LmNvbT6JAU4EEwEIADgCGwMFCwkI
 BwIGFQgJCgsCBBYCAwECHgECF4AWIQQt33LlpaVbqJ2qQuHCPZHzoSX+qAUCXZw1oQAKCRDC
 PZHzoSX+qCY6CACd+mWu3okGwRKXju6bou+7VkqCaHTdyXwWFTsr+/0ly5nUdDtT3yEVggPJ
 3VP70wjlrxUjNjFb6iIvGYxiPOrop1NGwGYvQktgRhaIhALG6rPoSSAhGNjwGVRw0km0PlIN
 D29BTj/lYEk+jVM1YL0QLgAE1AI3krihg/lp/fQT53wLhR8YZIF8ETXbClQG1vJ0cllPuEEv
 efKxRyiTSjB+PsozSvYWhXsPeJ+KKjFen7ebE5reQTPFzSHctCdPnoR/4jSPlnTlnEvLeqcD
 ZTuKfQe1gWrPeevQzgCtgBF/WjIOeJs41klnYzC3DymuQlmFubss0jShLOW8eSOOWhLRuQEN
 BFnVga8BCACqU+th4Esy/c8BnvliFAjAfpzhI1wH76FD1MJPmAhA3DnX5JDORcgaCbPEwhLj
 1xlwTgpeT+QfDmGJ5B5BlrrQFZVE1fChEjiJvyiSAO4yQPkrPVYTI7Xj34FnscPj/IrRUUka
 68MlHxPtFnAHr25VIuOS41lmYKYNwPNLRz9Ik6DmeTG3WJO2BQRNvXA0pXrJH1fNGSsRb+pK
 EKHKtL1803x71zQxCwLh+zLP1iXHVM5j8gX9zqupigQR/Cel2XPS44zWcDW8r7B0q1eW4Jrv
 0x19p4P923voqn+joIAostyNTUjCeSrUdKth9jcdlam9X2DziA/DHDFfS5eq4fEvABEBAAGJ
 ATwEGAEIACYCGwwWIQQt33LlpaVbqJ2qQuHCPZHzoSX+qAUCXZw1rgUJCWpOfwAKCRDCPZHz
 oSX+qFcEB/95cs8cM1OQdE/GgOfCGxwgckMeWyzOR7bkAWW0lDVp2hpgJuxBW/gyfmtBnUai
 fnggx3EE3ev8HTysZU9q0h+TJwwJKGv6sUc8qcTGFDtavnnl+r6xDUY7A6GvXEsSoCEEynby
 72byGeSovfq/4AWGNPBG1L61Exl+gbqfvbECP3ziXnob009+z9I4qXodHSYINfAkZkA523JG
 ap12LndJeLk3gfWNZfXEWyGnuciRGbqESkhIRav8ootsCIops/SqXm0/k+Kcl4gGUO/iD/T5
 oagaDh0QtOd8RWSMwLxwn8uIhpH84Q4X1LadJ5NCgGa6xPP5qqRuiC+9gZqbq4Nj
Message-ID: <bb2b6834-c8a4-9a3a-9549-b8c6e7f7120b@gmx.com>
Date:   Tue, 3 Dec 2019 18:44:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="jUNTX8n7UkO28fpfFPtpQt8i1TQbFbNsv"
X-Provags-ID: V03:K1:RS0sVyvJFLBMIA//vEVTrMSGMgCYLsIhSxdEafNx4DhKcSO3gsN
 X50nsYOsOs6mVC48c13ue+SOvSw2LuGo9x6y7eWPhsbjF7Zo+DC3vMZg7oabGROEicStdc7
 8vTMi1UBUudl5fOaWzj1aP5zc4x00S8D2a1R9nqjD2VM6ncKDnVbku+CUzIZXTBlEcgsZjc
 cyp/5IN4no6vpt1dKM9LQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:01K3bKVuO34=:pqSn0yJK8A2lD7OfT3GVOz
 2GMSPjN0Eoqkxlwb5PvfH26fJetigtGSGL6cCam7390ExcaQA9YfT8bxCwKSU/LqIm1GaaK2r
 GwHZ6bMvIg3iNgStpsXLzRqOtQmaMFaavqi7YNRJ2jYK+53X3Z426p3nSttf/eC50yYLPXkfm
 6WB2nBKL6PqdQ0fsEkSklCFtURljkHY6BYmPFlRuSP9VIUhpKeS56VgVT3Yy2RpoZM8iYYZ79
 fAnU0poW8vhP7ns6M33dnrm1RGwZzvVpjfj0raWj/0koG6JrSiGR8wd91mBpZnmrowJSlf1oq
 V2e3yGiypSWiBw6O7HbR630YNTpwq/kV1acel9RLCFHwUjAi+nguwUKvdL74S54u5vA0yicd6
 20eQRyAc1WTnmSeaTvl/rXhRIrw5KBtnJ/9M5qEzbGGYAYUyqsB1dTBtYEMNZcYsWkTuWLVt3
 5BvTTO8yTzkFCoGq5/FO5P6lNEthzevkcdelMvMniXwfV1uarc+zLaeIJoFiX9qAFpc3qtDag
 NPOO0r7FGVIHT8XOK0NzO+xfotEP/7iZQe6ZHOM0buRO06viLn/sfte5qIu+HmA66f3DMG1Qp
 fQ3TJwTCIRirXTAWT1f4gdte8XO7AC+DNiRacvKW4kUzbwvrnPhu0F9OJ2iBmgrS5WUKA3aOE
 dkQHvELJMzsF3enrqquayoOQykRbBqFbVmEeXoqgxWcCb987qd/hbAo5xPAkJCMFqweAlDaTd
 MJIzusIrNgcQA3KCQQEqiUPL0j67xCsKL4MH5g1lux9VjHCrwqi0VHzWjwZ82uP/Mm2QI0/mq
 j1CGwpaFB90n0DHoyMtoR6o7YJIXlkN9g+VoX/794stJRDVEwnIttlBeeLe8+6l7676cMaEj2
 qwrlbc8GX8y0Zf9TbtIxIHNahC7hCpSu5e58WZaD2Gpp+5+Ff1UjhxXWP3qUwQ3DwUusMmV4E
 DJHGD9EjeJD2dJ0Zirukorh9IyGGEVFRvAeBMJesdikMoNy35PN8kAmabGPevfvaEV4erN2Bx
 oByLTGFS/KT4Tn35uQTIZJRasQH04fChScPs7scpPS+6ChuPi+DCrafTlwmdtA5qiuOmyIECM
 pv05eFoFfSxJFZVb/DwJDBCn42aG4WYGbTtZU5+7YUX2co9KzbPUmCYUyLsEr2TISLgnlz7eJ
 xVSuX3/d9jPWQR3cUYFCyHA6tYVHcyjH6mE5/t63EYNGsk1Kh6HRKNSrpBcFVwqEJbf2qvECZ
 oLsCAo2HOW7v01USUnEi7Ks780hz8KCEMq61Mq9UxWGT5buAYL/XuRPsQFtE=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--jUNTX8n7UkO28fpfFPtpQt8i1TQbFbNsv
Content-Type: multipart/mixed; boundary="Ija7jbMzzxZ6OKQGFLehRdgsH0pS23pP2"

--Ija7jbMzzxZ6OKQGFLehRdgsH0pS23pP2
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

Just got my capture card, Elgato HD60S+.

Although it supports UVC, Linux still doesn't support it (yet?)

[34381.339277] uvcvideo: Unknown video format
30313050-0000-0010-8000-00aa00389b71

After a little search, that GUID looks like MFVideoFormat_P010, which
looks like a 10bit YUV format, and ffmpeg looks supporting it.

Any idea on the Linux support of that card?

Thanks,
Qu


--Ija7jbMzzxZ6OKQGFLehRdgsH0pS23pP2--

--jUNTX8n7UkO28fpfFPtpQt8i1TQbFbNsv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEELd9y5aWlW6idqkLhwj2R86El/qgFAl3mPKAACgkQwj2R86El
/qhrZAf/ZrSemJ2JXn2VUj8xDNgZoHxXf2I9hbLA5m9MXzbX9Hys5Et9WxW+dgpd
hIz9f4Rq/SxXWhxIBtlKKfyeZ8QxzP4Ki41Gn5dAjgP3+wSgZvRAFMD0RsaaSlZh
WiNKYEi3dHxDaeMvtpUNl5jWOe3ZVXhFvMyKGijlho56JAByEsj72f1ighgc5zSd
sYd0M9vBCKHC8xMn7bslrmHiEPOPzHTxgkRtsmYc67d9v3wXIwbMjKcDHVhOcgqo
9GBcUHPi3pl57PE33lYwHVEYDmJyn5rrAVDmQaZfpKiD9+m/t1WI4h7WgvTrVJDg
0BIGP8GGhCAodlr1wtUrWehVZMVm6w==
=ChmW
-----END PGP SIGNATURE-----

--jUNTX8n7UkO28fpfFPtpQt8i1TQbFbNsv--
