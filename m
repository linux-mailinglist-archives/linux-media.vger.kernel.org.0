Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAE3010FC32
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2019 12:09:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725907AbfLCLJV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Dec 2019 06:09:21 -0500
Received: from mout.gmx.net ([212.227.17.20]:35669 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725838AbfLCLJU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 3 Dec 2019 06:09:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1575371359;
        bh=CvKFpD+uGLGD5auhNGN5tEo8kpqR0OI6uSFoU4Z0+c0=;
        h=X-UI-Sender-Class:Subject:From:To:References:Date:In-Reply-To;
        b=Tv6hOPcepdjpQh+B9c4n73A73sc0TcfZ5C4TuLvVGUK4zqWwopko/qODKkmvsGDkX
         hbmY6Dt7W11HS3E4DqDDL91wXQC/R/b1PH0yVvZBXOeCX12LGOf/wvE4mBREJzHW8V
         yVPn8lwEsGwY2otfHmplcUuUnOZwRiurnsO1IYOI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [0.0.0.0] ([149.28.201.231]) by mail.gmx.com (mrgmx104
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MBlxM-1iURcY1IOS-00C8Cd for
 <linux-media@vger.kernel.org>; Tue, 03 Dec 2019 12:09:18 +0100
Subject: Re: Unsupported format MFVideoFormat_P010 for Elgato HD60S+
From:   Qu Wenruo <quwenruo.btrfs@gmx.com>
To:     linux-media@vger.kernel.org
References: <bb2b6834-c8a4-9a3a-9549-b8c6e7f7120b@gmx.com>
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
Message-ID: <84ce6a64-d168-8ac8-3f12-7d67677dd8c2@gmx.com>
Date:   Tue, 3 Dec 2019 19:09:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <bb2b6834-c8a4-9a3a-9549-b8c6e7f7120b@gmx.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="PX2A0tdwri2e6wfp5sKRsjD7L7TNczVpb"
X-Provags-ID: V03:K1:gMOjFHI+XNpAxzQMSsqtHV/+phT6jCSdvcxUedRiS7VS29K6u1p
 SbiKIpzGsJ+H96ka+fGbKGK94nYMkvrsDGzxEoVS3vY077T5c+0z8CswJiOWl4kuogTGDqe
 l3U6Irn0ZE66nZf4I+4riTCT7xMQ5YNRtRYEN7Ho9Cr61WjfhZ5z5bPDpCc98DSiuvrmElO
 g2AkagxU2PI6wwwRRAgwQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:rK4dNK39Usw=:18jmlELDtjbyTvFaDFWvJb
 kcg1baK8xPYKEzuzj530gbm14t65Cpr3jcpBA1q9VuzhoXYssfqPc1LYNdrOOGt5FdOenQGP5
 XznJh3jjJKJLRA5ksE9u1eXyVc2GbIzcJrQfidG9/Da9e1tTiXl4P6S3F8G8fo8mz0YlaABCh
 WrWDI2TNJJgIwAHMZAYT+afmsDTLA21v92RB4XS7qYVD+wZYF2TJsMQNxz5r2VxauOzpCdiL6
 nQL6PTJrKXCzK56VZ1pprTyGYiZ6ePtNGPlZykwX9fTGo+1nRMI1TVXc4nKbUfIXqNpGfDYFv
 v4PihL3RphN9nzWlqz5UeeNE12e0O6Gr5Kiwdm3KSL/4z+rlYE1y6wlvD48BZM3iYPMFFPkB8
 SYkzAvbTQ4cVaAV8VvzF4jSpaPGj3fyn4lgTmYE3HfsAi5o1VVlFsyPvYzeD44AYOMNx+rri6
 LjYMiNgJAXNJi0OAnjUZKfdl0P+wzONsqcwr5HCLQ5lvMejkl8K4SdK1TcHGTXj6gtXMiVrfh
 XdD7rB86QPsUeXMIMeAL+r754FYk7iCKqhu7+AhkUZpyPbhH8KdkjxghvUWewjxdFnCcz12Tx
 ZbBk1uyGbfSsTltk/Uu1+PtMDvC1RdLfbDUa+30T9sfkB9gCaQQLQyaHWXGUPLVlJ42ApipnM
 OncvCRBvSWM0r7f1dQ3lyhQVlRB9d5e7TMThw2o5ZKC7Ohy4vrfFBfwKSy2BzWyYGEk7K1zEA
 tXQ54KROFMa6nWZmW2gayuS9nsbrEWfjKi1TTaxfQPiYUn+ZIUx/R1M38vW+fNrYv5q1tri8S
 /lK5vv5gC9u7etYohMRV/zgx3wAwccPEr3JT9qiZ/EvVuSJQcUHHrPwgobnwAw9+tJHqyBZ2Y
 lwyjG14T66jD51CT5egPe5hfDAssUetBBBrnq6Jw1FhLlULfbxg++Pme+7Nv/H5k0uhaHS4lt
 M5sNxgv7niM6HbfCULdrJwe1A6RTMQ58+EEjIbruGKc9tzWn8/2kPGCaf+toTDA2T32Gj3yxM
 XVV+Fhziik+73kf0BJSbrZP8zps9LqkH39TgkGCT9TPsHY09qpP94+bhWbB8SpI/+YYD7PZtw
 utC9PypYuc+L4JrWJ/P7J/y5KLxzPw9iLE/zpMuLuY4tlC/69pKKHlPEjs24xW+xGmfZMD5ul
 6eUx+EBBDeGU27wMw0d5IL1hSGEqLHmK6m6o7Zig9UOK83pza1mVcHOV0dRcQtQN1hZkzendF
 YXZTtNLgvlHOAwQau7bAZctvDe3gKtnHa+Tob+QUHZShHgp0lPos6PykeIOA=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--PX2A0tdwri2e6wfp5sKRsjD7L7TNczVpb
Content-Type: multipart/mixed; boundary="gCCOfyvKN6PxtHeEucY2bkUf1Y2RMNGYM"

--gCCOfyvKN6PxtHeEucY2bkUf1Y2RMNGYM
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 2019/12/3 =E4=B8=8B=E5=8D=886:44, Qu Wenruo wrote:
> Hi,
>=20
> Just got my capture card, Elgato HD60S+.
>=20
> Although it supports UVC, Linux still doesn't support it (yet?)
>=20
> [34381.339277] uvcvideo: Unknown video format
> 30313050-0000-0010-8000-00aa00389b71
>=20
> After a little search, that GUID looks like MFVideoFormat_P010, which
> looks like a 10bit YUV format, and ffmpeg looks supporting it.
>=20
> Any idea on the Linux support of that card?

And the probing log:

uvcvideo: Probing generic UVC device 2
uvcvideo: Found format YUV 4:2:2 (YUYV).
uvcvideo: - 1920x1080 (60.0 fps)
uvcvideo: Found format YUV 4:2:0 (NV12).
uvcvideo: - 1920x1080 (60.0 fps)
uvcvideo: Found format YUV 4:2:0 (I420).
uvcvideo: - 1920x1080 (60.0 fps)
uvcvideo: Unknown video format 30313050-0000-0010-8000-00aa00389b71
uvcvideo: Found format 30313050-0000-0010-8000-00aa003.
uvcvideo: - 1920x1080 (60.0 fps)
uvcvideo: Found a Status endpoint (addr 82).
uvcvideo: Found UVC 1.10 device Game Capture HD60 S+ (0fd9:006a)
uvcvideo: Added control 00000000-0000-0000-0000-000000000101/2 to device
2 entity 2
uvcvideo: Adding mapping 'Brightness' to control
00000000-0000-0000-0000-000000000101/2.
uvcvideo: Added control 00000000-0000-0000-0000-000000000101/3 to device
2 entity 2
uvcvideo: Adding mapping 'Contrast' to control
00000000-0000-0000-0000-000000000101/3.
uvcvideo: Added control 00000000-0000-0000-0000-000000000101/6 to device
2 entity 2
uvcvideo: Adding mapping 'Hue' to control
00000000-0000-0000-0000-000000000101/6.
uvcvideo: Added control 00000000-0000-0000-0000-000000000101/7 to device
2 entity 2
uvcvideo: Adding mapping 'Saturation' to control
00000000-0000-0000-0000-000000000101/7.
uvcvideo: Scanning UVC chain: OT 3 <- PU 2 <- IT 1
uvcvideo: Found a valid video chain (1 -> 3).

It looks like there are still supported format, but guvcview can't
detect the device.

But OBS can utilize the device.

So it's a user-space problem...
>=20
> Thanks,
> Qu
>=20


--gCCOfyvKN6PxtHeEucY2bkUf1Y2RMNGYM--

--PX2A0tdwri2e6wfp5sKRsjD7L7TNczVpb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEELd9y5aWlW6idqkLhwj2R86El/qgFAl3mQlwACgkQwj2R86El
/qiVOwf+Ju8y3ZSH/mXM0E2yauZH0+Q7UDp2DeLMJIXhcmQhKScR6NgPhjifwlZU
d2XS4zzLwmZ9on5IkXhb7GBY5RgFZlOROFOEZK+LdjIUy8kQpkupfR4hvRrD5nCB
Rt2/BbTsTUDucSLLrqWKRWW7TMbW2OJ6KGHcXn3ZJJ9B9Wqq6O2JmvN/LBrReGbc
eG+tqzyqR96e5GzL4wILyiS2VjNuzDotsqUsOw3LiFbv2kfqLp7CKKkit8+5yRzk
/XsgUyvFi146yB+QRbcp3BFZ/pwBH5lI7yoXrdIsAjbYoJ8+c7uNAbq5J1TOiR/9
VKpomqUfN7oYuVJT2kfJq9s8s1IWog==
=s4kJ
-----END PGP SIGNATURE-----

--PX2A0tdwri2e6wfp5sKRsjD7L7TNczVpb--
