Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F5DAF3798
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2019 19:51:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728214AbfKGSvp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Nov 2019 13:51:45 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:39275 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727825AbfKGSvi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Nov 2019 13:51:38 -0500
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=bjornoya.blackshift.org)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mkl@pengutronix.de>)
        id 1iSmsU-0005I1-NH; Thu, 07 Nov 2019 19:51:30 +0100
Received: from [IPv6:2a03:f580:87bc:d400:591d:c131:e96:905c] (unknown [IPv6:2a03:f580:87bc:d400:591d:c131:e96:905c])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256
         client-signature RSA-PSS (4096 bits) client-digest SHA256)
        (Client CN "mkl@blackshift.org", Issuer "StartCom Class 1 Client CA" (not verified))
        (Authenticated sender: mkl@blackshift.org)
        by smtp.blackshift.org (Postfix) with ESMTPSA id E9A5D4778BE;
        Thu,  7 Nov 2019 18:51:26 +0000 (UTC)
Subject: Re: INFO: task hung in vivid_stop_generating_vid_cap
To:     Dmitry Vyukov <dvyukov@google.com>,
        syzbot <syzbot+06283a66a648cd073885@syzkaller.appspotmail.com>,
        linux-can@vger.kernel.org
Cc:     andy@greyhouse.net, David Miller <davem@davemloft.net>,
        Hans Verkuil <hverkuil@xs4all.nl>, j.vosburgh@gmail.com,
        LKML <linux-kernel@vger.kernel.org>, linux-media@vger.kernel.org,
        Mahesh Bandewar <maheshb@google.com>, mchehab@kernel.org,
        netdev <netdev@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        vfalico@gmail.com
References: <00000000000080601805795ada2e@google.com>
 <000000000000e626290584a983c0@google.com>
 <CACT4Y+YVNA6aYe-Ai-ZnU+EhNSNAFhjvXPT0oA+i4rCFpQThcg@mail.gmail.com>
 <CACT4Y+aVXJuaBsvwM-7UcpDzvPZG8HaFHPnHQMX1ZzE1Emd-Tg@mail.gmail.com>
From:   Marc Kleine-Budde <mkl@pengutronix.de>
Openpgp: preference=signencrypt
Autocrypt: addr=mkl@pengutronix.de; prefer-encrypt=mutual; keydata=
 mQINBFFVq30BEACtnSvtXHoeHJxG6nRULcvlkW6RuNwHKmrqoksispp43X8+nwqIFYgb8UaX
 zu8T6kZP2wEIpM9RjEL3jdBjZNCsjSS6x1qzpc2+2ivjdiJsqeaagIgvy2JWy7vUa4/PyGfx
 QyUeXOxdj59DvLwAx8I6hOgeHx2X/ntKAMUxwawYfPZpP3gwTNKc27dJWSomOLgp+gbmOmgc
 6U5KwhAxPTEb3CsT5RicsC+uQQFumdl5I6XS+pbeXZndXwnj5t84M+HEj7RN6bUfV2WZO/AB
 Xt5+qFkC/AVUcj/dcHvZwQJlGeZxoi4veCoOT2MYqfR0ax1MmN+LVRvKm29oSyD4Ts/97cbs
 XsZDRxnEG3z/7Winiv0ZanclA7v7CQwrzsbpCv+oj+zokGuKasofzKdpywkjAfSE1zTyF+8K
 nxBAmzwEqeQ3iKqBc3AcCseqSPX53mPqmwvNVS2GqBpnOfY7Mxr1AEmxdEcRYbhG6Xdn+ACq
 Dq0Db3A++3PhMSaOu125uIAIwMXRJIzCXYSqXo8NIeo9tobk0C/9w3fUfMTrBDtSviLHqlp8
 eQEP8+TDSmRP/CwmFHv36jd+XGmBHzW5I7qw0OORRwNFYBeEuiOIgxAfjjbLGHh9SRwEqXAL
 kw+WVTwh0MN1k7I9/CDVlGvc3yIKS0sA+wudYiselXzgLuP5cQARAQABtCZNYXJjIEtsZWlu
 ZS1CdWRkZSA8bWtsQHBlbmd1dHJvbml4LmRlPokCVAQTAQoAPgIbAwIeAQIXgAULCQgHAwUV
 CgkICwUWAgMBABYhBMFAC6CzmJ5vvH1bXCte4hHFiupUBQJcUsSbBQkM366zAAoJECte4hHF
 iupUgkAP/2RdxKPZ3GMqag33jKwKAbn/fRqAFWqUH9TCsRH3h6+/uEPnZdzhkL4a9p/6OeJn
 Z6NXqgsyRAOTZsSFcwlfxLNHVxBWm8pMwrBecdt4lzrjSt/3ws2GqxPsmza1Gs61lEdYvLST
 Ix2vPbB4FAfE0kizKAjRZzlwOyuHOr2ilujDsKTpFtd8lV1nBNNn6HBIBR5ShvJnwyUdzuby
 tOsSt7qJEvF1x3y49bHCy3uy+MmYuoEyG6zo9udUzhVsKe3hHYC2kfB16ZOBjFC3lH2U5An+
 yQYIIPZrSWXUeKjeMaKGvbg6W9Oi4XEtrwpzUGhbewxCZZCIrzAH2hz0dUhacxB201Y/faY6
 BdTS75SPs+zjTYo8yE9Y9eG7x/lB60nQjJiZVNvZ88QDfVuLl/heuIq+fyNajBbqbtBT5CWf
 mOP4Dh4xjm3Vwlz8imWW/drEVJZJrPYqv0HdPbY8jVMpqoe5jDloyVn3prfLdXSbKPexlJaW
 5tnPd4lj8rqOFShRnLFCibpeHWIumqrIqIkiRA9kFW3XMgtU6JkIrQzhJb6Tc6mZg2wuYW0d
 Wo2qvdziMgPkMFiWJpsxM9xPk9BBVwR+uojNq5LzdCsXQ2seG0dhaOTaaIDWVS8U/V8Nqjrl
 6bGG2quo5YzJuXKjtKjZ4R6k762pHJ3tnzI/jnlc1sXzuQENBFxSzJYBCAC58uHRFEjVVE3J
 31eyEQT6H1zSFCccTMPO/ewwAnotQWo98Bc67ecmprcnjRjSUKTbyY/eFxS21JnC4ZB0pJKx
 MNwK6zq71wLmpseXOgjufuG3kvCgwHLGf/nkBHXmSINHvW00eFK/kJBakwHEbddq8Dr4ewmr
 G7yr8d6A3CSn/qhOYWhIxNORK3SVo4Io7ExNX/ljbisGsgRzsWvY1JlN4sabSNEr7a8YaqTd
 2CfFe/5fPcQRGsfhAbH2pVGigr7JddONJPXGE7XzOrx5KTwEv19H6xNe+D/W3FwjZdO4TKIo
 vcZveSDrFWOi4o2Te4O5OB/2zZbNWPEON8MaXi9zABEBAAGJA3IEGAEKACYWIQTBQAugs5ie
 b7x9W1wrXuIRxYrqVAUCXFLMlgIbAgUJAeKNmgFACRArXuIRxYrqVMB0IAQZAQoAHRYhBJrx
 JF84Dn3PPNRrhVrGIaOR5J0gBQJcUsyWAAoJEFrGIaOR5J0grw4H/itil/yryJCvzi6iuZHS
 suSHHOiEf+UQHib1MLP96LM7FmDabjVSmJDpH4TsMu17A0HTG+bPMAdeia0+q9FWSvSHYW8D
 wNhfkb8zojpa37qBpVpiNy7r6BKGSRSoFOv6m/iIoRJuJ041AEKao6djj/FdQF8OV1EtWKRO
 +nE2bNuDCcwHkhHP+FHExdzhKSmnIsMjGpGwIQKN6DxlJ7fN4W7UZFIQdSO21ei+akinBo4K
 O0uNCnVmePU1UzrwXKG2sS2f97A+sZE89vkc59NtfPHhofI3JkmYexIF6uqLA3PumTqLQ2Lu
 bywPAC3YNphlhmBrG589p+sdtwDQlpoH9O7NeBAAg/lyGOUUIONrheii/l/zR0xxr2TDE6tq
 6HZWdtjWoqcaky6MSyJQIeJ20AjzdV/PxMkd8zOijRVTnlK44bcfidqFM6yuT1bvXAO6NOPy
 pvBRnfP66L/xECnZe7s07rXpNFy72XGNZwhj89xfpK4a9E8HQcOD0mNtCJaz7TTugqBOsQx2
 45VPHosmhdtBQ6/gjlf2WY9FXb5RyceeSuK4lVrz9uZB+fUHBge/giOSsrqFo/9fWAZsE67k
 6Mkdbpc7ZQwxelcpP/giB9N+XAfBsffQ8q6kIyuFV4ILsIECCIA4nt1rYmzphv6t5J6PmlTq
 TzW9jNzbYANoOFAGnjzNRyc9i8UiLvjhTzaKPBOkQfhStEJaZrdSWuR/7Tt2wZBBoNTsgNAw
 A+cEu+SWCvdX7vNpsCHMiHtcEmVt5R0Tex1Ky87EfXdnGR2mDi6Iyxi3MQcHez3C61Ga3Baf
 P8UtXR6zrrrlX22xXtpNJf4I4Z6RaLpB/avIXTFXPbJ8CUUbVD2R2mZ/jyzaTzgiABDZspbS
 gw17QQUrKqUog0nHXuaGGA1uvreHTnyBWx5P8FP7rhtvYKhw6XdJ06ns+2SFcQv0Bv6PcSDK
 aRXmnW+OsDthn84x1YkfGIRJEPvvmiOKQsFEiB4OUtTX2pheYmZcZc81KFfJMmE8Z9+LT6Ry
 uSS5AQ0EXFLNDgEIAL14qAzTMCE1PwRrYJRI/RSQGAGF3HLdYvjbQd9Ozzg02K3mNCF2Phb1
 cjsbMk/V6WMxYoZCEtCh4X2GjQG2GDDW4KC9HOa8cTmr9Vcno+f+pUle09TMzWDgtnH92WKx
 d0FIQev1zDbxU7lk1dIqyOjjpyhmR8Put6vgunvuIjGJ/GapHL/O0yjVlpumtmow6eME2muc
 TeJjpapPWBGcy/8VU4LM8xMeMWv8DtQML5ogyJxZ0Smt+AntIzcF9miV2SeYXA3OFiojQstF
 vScN7owL1XiQ3UjJotCp6pUcSVgVv0SgJXbDo5Nv87M2itn68VPfTu2uBBxRYqXQovsR++kA
 EQEAAYkCPAQYAQoAJhYhBMFAC6CzmJ5vvH1bXCte4hHFiupUBQJcUs0OAhsMBQkB4o0iAAoJ
 ECte4hHFiupUbioQAJ40bEJmMOF28vFcGvQrpI+lfHJGk9zSrh4F4SlJyOVWV1yWyUAINr8w
 v1aamg2nAppZ16z4nAnGU/47tWZ4P8blLVG8x4SWzz3D7MCy1FsQBTrWGLqWldPhkBAGp2VH
 xDOK4rLhuQWx3H5zd3kPXaIgvHI3EliWaQN+u2xmTQSJN75I/V47QsaPvkm4TVe3JlB7l1Fg
 OmSvYx31YC+3slh89ayjPWt8hFaTLnB9NaW9bLhs3E2ESF9Dei0FRXIt3qnFV/hnETsx3X4h
 KEnXxhSRDVeURP7V6P/z3+WIfddVKZk5ZLHi39fJpxvsg9YLSfStMJ/cJfiPXk1vKdoa+FjN
 7nGAZyF6NHTNhsI7aHnvZMDavmAD3lK6CY+UBGtGQA3QhrUc2cedp1V53lXwor/D/D3Wo9wY
 iSXKOl4fFCh2Peo7qYmFUaDdyiCxvFm+YcIeMZ8wO5udzkjDtP4lWKAn4tUcdcwMOT5d0I3q
 WATP4wFI8QktNBqF3VY47HFwF9PtNuOZIqeAquKezywUc5KqKdqEWCPx9pfLxBAh3GW2Zfjp
 lP6A5upKs2ktDZOC2HZXP4IJ1GTk8hnfS4ade8s9FNcwu9m3JlxcGKLPq5DnIbPVQI1UUR4F
 QyAqTtIdSpeFYbvH8D7pO4lxLSz2ZyBMk+aKKs6GL5MqEci8OcFW
Message-ID: <d4f03b02-29c6-3479-d5a4-baae86879e13@pengutronix.de>
Date:   Thu, 7 Nov 2019 19:51:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CACT4Y+aVXJuaBsvwM-7UcpDzvPZG8HaFHPnHQMX1ZzE1Emd-Tg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="NeIZlyowumXtqXLNOZErcBk1aZbUuvacE"
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--NeIZlyowumXtqXLNOZErcBk1aZbUuvacE
Content-Type: multipart/mixed; boundary="4FKKqhxBizYnGAZ3YsXRzhsPWgt6jD1Xg";
 protected-headers="v1"
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Dmitry Vyukov <dvyukov@google.com>,
 syzbot <syzbot+06283a66a648cd073885@syzkaller.appspotmail.com>,
 linux-can@vger.kernel.org
Cc: andy@greyhouse.net, David Miller <davem@davemloft.net>,
 Hans Verkuil <hverkuil@xs4all.nl>, j.vosburgh@gmail.com,
 LKML <linux-kernel@vger.kernel.org>, linux-media@vger.kernel.org,
 Mahesh Bandewar <maheshb@google.com>, mchehab@kernel.org,
 netdev <netdev@vger.kernel.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>, vfalico@gmail.com
Message-ID: <d4f03b02-29c6-3479-d5a4-baae86879e13@pengutronix.de>
Subject: Re: INFO: task hung in vivid_stop_generating_vid_cap
References: <00000000000080601805795ada2e@google.com>
 <000000000000e626290584a983c0@google.com>
 <CACT4Y+YVNA6aYe-Ai-ZnU+EhNSNAFhjvXPT0oA+i4rCFpQThcg@mail.gmail.com>
 <CACT4Y+aVXJuaBsvwM-7UcpDzvPZG8HaFHPnHQMX1ZzE1Emd-Tg@mail.gmail.com>
In-Reply-To: <CACT4Y+aVXJuaBsvwM-7UcpDzvPZG8HaFHPnHQMX1ZzE1Emd-Tg@mail.gmail.com>

--4FKKqhxBizYnGAZ3YsXRzhsPWgt6jD1Xg
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable

On 3/22/19 9:06 AM, Dmitry Vyukov wrote:
> On Fri, Mar 22, 2019 at 9:00 AM Dmitry Vyukov <dvyukov@google.com> wrot=
e:
>>
>> On Fri, Mar 22, 2019 at 8:08 AM syzbot
>> <syzbot+06283a66a648cd073885@syzkaller.appspotmail.com> wrote:
>>>
>>> syzbot has bisected this bug to:
>>>
>>> commit 4493b81bea24269df898339dee638d7c5cb2b2df
>>> Author: Mahesh Bandewar <maheshb@google.com>
>>> Date:   Wed Mar 8 18:55:54 2017 +0000
>>>
>>>      bonding: initialize work-queues during creation of bond
>>
>> +linux-can
>>
>> I think I will disable CONFIG_CAN before v4.12. It causes too many
>> false results for v4.12..v4.11 range. It always leads to a wrong
>> decision for first 3 steps, then no chances of correct bisection
>> anymore.
>=20
> The same seems to show up for v4.12..v4.13:
> all runs: crashed: INFO: trying to register non-static key in can_notif=
ier
> https://syzkaller.appspot.com/text?tag=3DLog&x=3D1555b12b200000
>=20
> This was fixed by 74b7b490886852582d986a33443c2ffa50970169 right?

ACK

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |


--4FKKqhxBizYnGAZ3YsXRzhsPWgt6jD1Xg--

--NeIZlyowumXtqXLNOZErcBk1aZbUuvacE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEmvEkXzgOfc881GuFWsYho5HknSAFAl3EZ6oACgkQWsYho5Hk
nSBtBAgAllvi9XlOwEQqlRCgEviA4PZ9wDRj16b0XhPl+82RiA9fXyPRHcCj2Owa
sNnNCF+nHA3Vq/N64n9snPpWz0mXuzUO6NGCTbB3rqY+mK/U6mq+KnVJwvjHq2D6
y9sHCDOMn1VLFlw+Ek3m95fUAi72i/6YCfVcRg2ArY35aDATtlrGTjWt0G+8YyuN
YqyIiueOYaiIyev99lVpwExKcRwZHVK27c1WMl0o/oXXv/0ZcK/q0vbD42RyT3NJ
5kHPKHxKOdSzbQ/xw+oLBJB+xhW4RJnKJmMIjITz6lHJ0Uep2KYarg00JjNGNtr4
/VqJZlN4hWKyPTRBu5aI1Bef0JpmEA==
=xA/S
-----END PGP SIGNATURE-----

--NeIZlyowumXtqXLNOZErcBk1aZbUuvacE--
