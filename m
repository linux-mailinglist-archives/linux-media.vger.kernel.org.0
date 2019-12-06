Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EF79115602
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2019 18:01:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726314AbfLFRA7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Dec 2019 12:00:59 -0500
Received: from mout.web.de ([212.227.17.11]:44389 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726271AbfLFRA7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 6 Dec 2019 12:00:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1575651626;
        bh=jHy+WwSP1rQPOht3wnYngUgoOzWL1aIVHp4Zik7CKKk=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=bjarmmsrKD8V/S9KAFqqOOg2KO2GgW5J05LJLUzSiyEaZ1R15lkYMnKwKjf+zPjpy
         JGA9jtrkqlfurJfGcpFRlOEWv+0YeFg1CWp+pDAIwZ2HeuVvxTXjDgtttE8jXOsRQA
         7l8npThRWhancto8GDsbAco9kpdw3wcBgO5P7HE0=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([2.243.146.60]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LZedc-1hu4JB4C2W-00lRc1; Fri, 06
 Dec 2019 18:00:26 +0100
Subject: Re: media: go7007: fix a miss of snd_card_free
To:     Chuhong Yuan <hslester96@gmail.com>, linux-media@vger.kernel.org
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
References: <20191206120735.21873-1-hslester96@gmail.com>
 <f6fcd441-e92d-0fff-e488-9507999b1682@web.de>
 <CANhBUQ2p4hkSUgW8ZpA6+M_RsuN72E+v-XN=1a=m-Xf_++ZkdQ@mail.gmail.com>
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <aa5555c7-48fb-11f9-d79b-5d72bee55ff9@web.de>
Date:   Fri, 6 Dec 2019 18:00:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CANhBUQ2p4hkSUgW8ZpA6+M_RsuN72E+v-XN=1a=m-Xf_++ZkdQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:mWfLrG321FRf3AeEwF1BbjZV/GIONsllTHM9gbOYJhHTBr4YIS3
 zMgJ8JBPP1SPIOzXhQfHmhUIhZdMo4dYrZSYZ3ktireotQFsg1/x0DJKRw9qto3iBk/tpqO
 iNmTWcS87gn/J6N1O6CwnvoRJrSxzsVsVG6Cd9noJA390VFVyUr+qUdRgMMOJvFQXzXSPjM
 wOjhHdd/4fCbF+IzXG7sQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:TWxykEahltc=:gvXMmKM/pE9a3ZWe1j7GB5
 IOpNjE8Z69hfKFgoTnYiOV7ITtYJNCGlZR5Y7k427OlhbUdTjv3h5tHHmzbE3adYJtdB8ghPk
 Xgvu++dQFFnWH7w5WS1F46z2Ane48LaP7bGOFSwrdFHobdSlJhapktxpS3kioIFRGtwAY3caZ
 +qyTW8yp6RlMcbsf7jM1ahPR1I1FyeOtJ48yN7dmtVBhAwSDgVutYmYXwIJ/CfavK8gbf0rJy
 j3a7U4EjIPNd5jP8PA713xnUqmrHw/TfwyHsFswiCrCTjWiOZHApM4IgCGOlsvFIvFwVB1kGo
 UiljViSeJN2zDrXAkOyBYJy21IkWQ/eTxQC3hKMUPSQ9UndthtNonLcktG2GAqVqZa4P7+nns
 Zxg+LNjlVxrWPWXxcaVu9zVOiEy60qigCnG1iFxXz2g8xRvvLG9behTfY5Rq+THt/1Bln5y+i
 4PRsZlfxOntVlNJ1z5hujYfwDk5yvTfeL976aIejb5RsqpvtAnPMehJKjxjEVLDejwDonOEdt
 7YEgOVG/WQYBY8baprmoL3uvi+hwG+t+dZjZb1g39qRZReRT2l9f38asWOpFBNu9LwuwX2drp
 udym0QhP4m0kk26rtWjBOXn/9YIztZ0VVSXIsPy+cfUTg6VjDNL2DwvfDfuT8P/BujujKT11D
 nZ2CySU0QTqD/IlNXZ4EDOHDCSpt0FVAQ48RLAeaDUSwyAZb/1kW5E6801S4r7J28DxesrUd/
 d+ZVEBgvfUEBPmudAQeH89XV71p2cBfjIiya8UOwbPVq9ZDgMMU1+Br7uWtyCUNw/Qk0zqN+r
 9rRo4hZcSSAA3GacfQo3CYexn6zY1Gf7oey6x1mTVgbrOpAElmj+Ps5aYJbkY6fcmRXKUatZC
 GN5kAK35u3urPQ2o7LGbVQbkRRDyMr/JEEwCLurFiUrbIJADjqjSy6W9cWAdm54j74TtWklq0
 SokO2MzvMxBdq3kPKvBUjMepGTIRgFQow1+UaQsdy03+BZASMQ6o8BwK4C4cmwnLiTmNjSwZ0
 3Ze8WtQyGybRsUGaPyeqWIK3A58kathomGmMZGqy2pd4xd4NPpktkpPY8uEf81y/fn7vwQLew
 vRkvyRhdVSK2QJlxPdXU2i2BabPZ6npBkDEYHp+Qw8n+kBdVTYWDAHV4jX8+kJnC5M/OOsUdA
 tlmQppzdlhz3unF7myDTPlC7ZR71sAxi+yDW/AxoUmcoGl1/522+HWSKZx8caf8UvxMJlmQHW
 qQqkLxtu98qYZf6Dvc/3PBoJ73jA/UlvJZjtu9ZlMiUr9E4a9B3tYWaiNdN8=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> I think using goto is really much better than freeing after every error.

Thanks for your positive feedback.


> I will send a new version if others also agree with this pattern.

* The error handling pattern would be supported by the Linux coding style.
  The agreement on corresponding changes can occasionally become more chal=
lenging.

* I would interpret Dan Carpenter's review comment (from 2017-09-19) in th=
e way
  that he should be mentioned by the tag =E2=80=9CReported-by=E2=80=9D in =
a subsequent patch.
  https://lkml.org/lkml/2017/9/19/115

Regards,
Markus
