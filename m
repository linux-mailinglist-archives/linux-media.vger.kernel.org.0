Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAEE511871A
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2019 12:49:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727786AbfLJLs5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Dec 2019 06:48:57 -0500
Received: from mout.web.de ([212.227.15.14]:50681 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727223AbfLJLs5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Dec 2019 06:48:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1575978525;
        bh=TcXsyM430rLokcMgJz3JT71LQv2XDjoMdjzkQs6limU=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=PIOI9z6MnpshUpZfPat6XEd1RsM+pDq1QsnnLXTvywDmszPAdCPeegBBn/Ug0ktMl
         4SeuHwyL7Up083kPZzxbwqARnCt1jNNi9YG9ftgIU4v+VjozUR8ynfbmF3yzSFHKzn
         nluZG6xDhVgfHaiTsvkvdPLYalTby3OPlIoIQyuY=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([93.133.39.15]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0M7blv-1hqGZW0Iy7-00xHQQ; Tue, 10
 Dec 2019 12:48:45 +0100
Subject: Re: [PATCH v2] media: go7007: fix a miss of snd_card_free
To:     Chuhong Yuan <hslester96@gmail.com>, linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        linux-kernel@vger.kernel.org
References: <20191210031548.18659-1-hslester96@gmail.com>
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <57851e6b-4cd6-af1b-4b62-4db3b2673b8a@web.de>
Date:   Tue, 10 Dec 2019 12:48:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191210031548.18659-1-hslester96@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:s3NBZ1/XSW0BsZt+yWSKpM8z+KTD5Z6Ic5X+pQHkD44xG+yG2Dm
 82WV7F4rHT+IrjXr09hBIIpli2UFPdz0Fi4/LaJ454uMNm/3oL6bVfmOc44GzP2TIF9xYPr
 iuBvCCg5obDEWt0rAi3/a8SXCfPFr61e6AaP4BkKQSCht1ijj2bmuJ4II3Dz8Ny/arXYQYy
 x2+4iJTPqXJT8EtrXyK2Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:abML3yro8v4=:RvUI3+bYBXb0Bnz8+bJsQL
 Mvb0ZL/ApyG8Orxq85i9dHE9jkF/ogpb7SuQFECzODIgzUvsEjvFnQu8l3AHgLlRfp8fvRbPZ
 FdcKlxWyB8A4g2PcRKQhaUW7rsCvu6w8urSlV2Fj4h2J0iKlUS2mS5A/lgvMHAy7EGrbKmcCB
 yc0perMuoAUlp2/2mKs9Igbp1hinNmYhAZ8/pAepGdnWlLKMWUyL4sZriblNSNY6FqVf2yZ7s
 wc0bNuFLUvhryeQfzyik21mQiahQAtioLA4pJHJYjnymdABuqEncph08wQy+XXnf9wbWF+p77
 KQHak84Uxhc3l3PlJ8S9fgUUYQSgnFbU+P0Zz5k9LDFHagNeokO41xLdCpzmiwYcxldjA7T3j
 HPXvzSutL7vreva2A+DTiHSaeZT3dIUcnFZZcyDFgEl2roO3zEzUmfLLbzHsuEj12D/IdO0Gi
 8GefWS49QmkNbADPYCcBe5OXg0gOtulRyx+irvWpnYoEbX7GaECiFfurkX+vnzFEoeceZ+z6y
 pl4VcPerAAE4v3v6v28SrocdCa4Pv3me3DXJaYdzkNRlLUo49TJj5fKBEmrfJtFftfv8YgQYU
 LMy4tP+R99E22T3CiEkAPHWWj0bUliiQkaLs70yDLM2fvZIa20Ty22iuc8u8SuZfd1wH8bUeE
 V6bXDEE4tSx/o3emjUz8AEhsL431YzVSoHtrmGpaF6dILXr29v5Befb23EyUoP516pIYQ2eUW
 fRp8dGqS1XFv0nGqESKpgQLLh+vWxHYXhdQLthCagPhDD1Dhf7qtZhpYbCk/wEmUr3wxRj9BL
 JNF/xFVLUWAUw1aSqq1WMecPyA7KpxSpFKJUS3Lug93R9IiE4diirAVDdQdgjW63HeMR+5aj6
 vd/dgs100G+3OEXkeVH6oknSveyU6PhZR3Gd+oRHi6CrFStB2WHD9G7z6QXU5za1NMi1qUM77
 szejXRiNndiAPRZ2wY+7fKT+ziCfbkJY+dE7XIAUWHv2DKeuITL18MnZSwjYePVxTxnHEt8yU
 PDufjUZ4zlUOOpVRh/bnwEUAzLzqGjVVH+XCaJPrsK0eP3iv+0nfALH4I+PqqRgtD60PrxnVP
 wEQgTHpZTmomxh5ALJgpn0FaFPumIAt6CZG0fq+H/maajZAd8Sh39p5GUJmaFB0rXzCerrxij
 b2gf48zvgNxDARsU1m+MdpI8LTE4km3dA1NAO8vNyNiLz6u0449zLflP91/NmvXgQpoZld+Hp
 wMrSQWD2FDzE58jyhkXgSpa4u3xVwfLGtL7aA2Ub3BSutO+RecLF6+pYrJWE=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> go7007_snd_init() misses a snd_card_free() in an error path.
> Add the missed call to fix it.

Can the tag =E2=80=9CReported-by=E2=80=9D be appropriate according to a re=
view comment
from 2017-09-19?
https://lkml.org/lkml/2017/9/19/115
https://lore.kernel.org/patchwork/comment/1026462/


> Changes in v2:
>   - Use goto to simplify the code.

Thanks for your improvement of the exception handling.

Regards,
Markus
