Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B84B822B758
	for <lists+linux-media@lfdr.de>; Thu, 23 Jul 2020 22:15:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727060AbgGWUP0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jul 2020 16:15:26 -0400
Received: from mout.web.de ([217.72.192.78]:39569 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725979AbgGWUPZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jul 2020 16:15:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1595535318;
        bh=b1AvnC06VM7aUJGtKbMoB55rYPYUl0G9rhzVR5GIJfQ=;
        h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
        b=OtX/HYesZLApJ/a+AJZhPSt+WlRqdXG7j0BHvJlCWagLALA2SfKJNL4kpD0XgUhIJ
         dAKSpx2FEB/FyBpBfu28hg70KmSR3G6PFb3nvtIvglJtnUV0Kxmv0wrZZak+QZr1BB
         aXr16BCX5c5ycEXADMQNRv/vgqwXCKP0GMCfLYEQ=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.133.132.31]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0M7KR8-1kmYLY1Wp4-00x1js; Thu, 23
 Jul 2020 22:15:18 +0200
To:     Evgeny Novikov <novikov@ispras.ru>, ldv-project@linuxtesting.org,
        linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Prabhakar Lad <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH] media: davinci: vpif_capture: fix potential double free
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <b179ad63-b895-39f7-dc18-23636f77e1e4@web.de>
Date:   Thu, 23 Jul 2020 22:15:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:b1rKugsqEgf/leaAql7uJUiF0Wo5HXiMQAf6yhcX4VhTj6QsABb
 2VmHMNYBaMMOzH4j+nLOJYjMKDX/+oEX5BnMl/VM0TR7R7jZh1P9hqh/OUXkvUFWtalgi/v
 ta0ukEtj7PC4Ptu4gYgggk7rZBjGIPq9uwrVzq77bUu+o6ILWwKbFvo3rMVv0Yui8gLyJP7
 sUuy747D54TpH4XUoFbLw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:0L7CMis4AJQ=:FM8srXvXy/hLtExondqQQB
 JG/+NX5BS6ftADe9/3l992m/0QUltuzvSlyX+FoVmdA1Vqbw5FGl9gAsB0vPRfmJTyCDkmka8
 ljMMBjriNlyEFMga/bZ+0gx1RFcwmLa+3MPxUp5ryrO8JxqYuzja5iZKQHrXaFNlTZYt5IZod
 CbHG6Fn5C1sGyVG9t6MDSKyOgIDOkXBtEXoPAJyAZ+3oBDBlXf4CoPVaBGI/hiLjRMF5VEp5v
 p7Ncwf4NEiR2i75UMwVoz5qXBktKbfttkCt6EEhETtqpbRb5e287c/l+Bl3Ks8tb9IZv1VCH5
 OYiOwkQhLOhQ53NV312OmeTQZkun7NPHZV25ErZ3cyBnQzBDvqCfx2+rxJ/h82ioItJYdE2z9
 MotDYMWELFValMnDzINnBRGsOmPUfA/9CEdcpjG27dg17Z0+oP0UUYg49bGCD5y2xNzadRYsN
 Xz4sjNf6ugjLutHfDPUODaW8tWqFjPS8+gEso9TaYHHsSmQQCzmMItEHamackX6KBlupyQ7BM
 dC+j3KAZ0ZNZ7YlKbYW7QXku/CtOV50SCwm4NGkowgBTMrpK9RbcpeUQgka1TcDU621EdCt/n
 iZp493/GXSvUlozR9ZyurbjNYy/YS+iq+EMiFY8WBvcZSbQfUN82XaFG4ZbyvrtxigoubJJPw
 wcdO5a80/Q7qy+59etvEeS4YPe+hXIqazl4GkcwvKC/x2gOx4344s2Xnu0Ll0hIrQFfR2DLRk
 Prc1npMRKHezM3DjAi4iOL0zLYzgHDNRoS8n9LEFkvm7SMkxtFgaI4q94eu//Q0LEdsqZRxA2
 +S06L2G8EQ1KRqxGt3J51mSKhvFaoOttxtdOqnz2pCcsdT/lWyQ7tqb3AMKX5C+GSO45C6lbc
 SxnzBnZUvXIZ2Z4komuzytIG5t9/T/4IMSf83dMmj977xnTsbsKzXjXGT4jk5ZvusuFQRHXer
 MRdQh9l/+mfyxuC3YTEA/fIk/rMHxKEkqwkP5QJ5sfIMGoRdLGFk+l9NgSrnIF1mTbO2XmMAq
 LuekbJb+OJWrZQyumllNE1w7ft1ibVqT4n0lyLBz2qETXr1kIanNLzVPI956DC1wYx06xtjdy
 79qtlHT2uMiZbyOs7GenCTZjxRj8E4wL9RnKzGWve2zlhh6zAyuJc8KKgBzBPrMFK5y+u3Qcd
 3WixhhHOH0bUrbsJF2Id8Obvt/8hSfZTzfxyVnRav3FnAuOEucgW9YNgi9KnBu0QjPEsdqN7g
 MZtcuoONq5lU90rmLvY8c/Fa8fhxcCIkl4bIAPw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> In case of errors vpif_probe_complete() releases memory for vpif_obj.sd
> and unregisters the V4L2 device. But then this is done again by
> vpif_probe() itself. The patch removes the cleaning from
> vpif_probe_complete().

* An imperative wording can be preferred for the change description,
  can't it?

* Would you like to add the tag =E2=80=9CFixes=E2=80=9D to the commit mess=
age?

Regards,
Markus
