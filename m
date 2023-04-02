Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D7756D3ACD
	for <lists+linux-media@lfdr.de>; Mon,  3 Apr 2023 00:25:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230200AbjDBWZO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 2 Apr 2023 18:25:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjDBWZN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 2 Apr 2023 18:25:13 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96ACC76B6
        for <linux-media@vger.kernel.org>; Sun,  2 Apr 2023 15:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nurfuerspam.de;
        s=s31663417; t=1680474300; i=herdler@nurfuerspam.de;
        bh=1GweAsWzAwMp9CUEE1q8P9dlAUPT+CRm6Yb2MY020B4=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=CJusBI6tCM5mD9XyLZ35XlyXecfUDrymNwuy7unv2DEQp0oNxcQTpFY2Gout+Agjf
         Pl5WULeQ7ok6Oo0tuRmar1OuTwcxKQ4xcaWjaeg7flZceKIABHISHEV7asHbVn2dc9
         oGBGyzcRiczS1tZFmNmyiBLxXvKIKy72k/H0b1ihgCnnqsrxGZv+fKHSwMMP5fzwSg
         kR7XDflfGLNgy27CFXL9rHCS75VTemHsVt7AYJMZ2aUOBSn7sVoCyU15hOfDOCQAjn
         /z5WIxarFeXAxTsupZDcgKQqz4ItA5SOxJepgyCkkYj+mbgX+90YX0lyO85yJ+sEFW
         epNJcvkl8HHKA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([217.113.187.51]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MdNcG-1qIQsm28xc-00ZLqz; Mon, 03
 Apr 2023 00:25:00 +0200
Message-ID: <5b5a1dc0-96c4-c3c4-a24b-1917b39f8292@nurfuerspam.de>
Date:   Mon, 3 Apr 2023 00:25:00 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2] Legacy DVB API: completion of documentation
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, Manu Abraham <abraham.manu@gmail.com>,
        Tomasz Maciej Nowak <tmn505@gmail.com>,
        Corinna Vinschen <vinschen@redhat.com>,
        Soeren Moch <smoch@web.de>
References: <c78a2740-1b80-2ea2-dc5c-4ead440ff9ed@nurfuerspam.de>
 <c093e775-e863-f886-e819-e8a929775a89@xs4all.nl>
 <a24d4645-ac78-9990-92c3-7c04282f190e@nurfuerspam.de>
 <20ceeb7f-336a-b51c-8cc8-128cc9ebcd2e@xs4all.nl>
 <014db0ee-55fe-2966-a531-b8c23e97b402@web.de>
 <d9197b80-335c-ee70-eccc-ad04c026cbc9@xs4all.nl>
 <8fb1799b-5ed1-9d26-54fc-b47abe0c13cf@nurfuerspam.de>
 <df796e6c-c82f-8734-3de6-8446bd0b48ab@web.de>
 <014a6ade-dddb-6c0d-a59a-186e0b0aa3c2@nurfuerspam.de>
 <44cc2154-9224-510d-1f9c-34ae49f01c73@nurfuerspam.de>
 <c735aadc-80cd-9332-6661-638cad63afa2@xs4all.nl>
 <026b1342-2b0f-f61d-ea33-63f3992d1473@nurfuerspam.de>
 <20230208100847.3ec87576@coco.lan>
 <99397771-409b-e487-e429-d5c9feb82209@nurfuerspam.de>
 <50f69514-abbb-2dfb-6060-889aa2c6e02c@nurfuerspam.de>
 <decd5d71-f06e-5873-5ebf-7028107f65ee@nurfuerspam.de>
 <20230327192826.65ae299d@sal.lan>
Content-Language: en-US
From:   Stefan Herdler <herdler@nurfuerspam.de>
In-Reply-To: <20230327192826.65ae299d@sal.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:N40m6VvzA1OlSsvLYo7aGRo6yYY1JyR+uqpl5dZAa/hORyRinn1
 HxqZjl+WDdWEp72A/byn+obuZMW7MqM5LIPZdga41pq0ldpFhW4KhUHt3v6mKYZe5Qa3xCP
 tm/V+nRyIkNQLoz1xHfV9NwJucVnBsBfu7y11GSXszvHK9hyDbP3X5z5uDSMcLlfYyhm0B+
 YwBRr8X6hAXB/WXVVhKBA==
UI-OutboundReport: notjunk:1;M01:P0:YSMyJjCbgMQ=;hruIH/SucvOQHJ2zaUlKfv+A1CC
 1uqPbdX3TUIehAFqho8xUo1Ynk/1LtualkTWp6V96sf8ZSjEKXfyhGb5y6tR5NPX4woxKiC2E
 dSoRuVLZux0PaHO1/EbTkzskBkpGoTW6Gg7kZhOcr4hLHysUynu9zM+Le3ydDyB9sKheHx5yX
 p8CQixfzb2wQY78C6oXN/jA80i6ZoK5KOBGQXwkF/l+TX9drkycWf+RnWCBWhxT95KLUPlPOR
 WvvhmHyLsNCCW4npWBCh+Ktz4RoS1yC6hM98HWFqRXcOJa5OrFVatasW2LBLExvNJbN6/icVE
 Zd2Lm5idRdC4mtiR7i3/oBRrz19jTmY6gSuvW2A81yMWGbSgw+cBRkRwnkzj0rAt2L/iq5n3Y
 ai0R7EVgF0/anUSY2bVh7pXU+6QI+9qqpG7+TFX2Q/3wrXER/LLB7yrXoHTJjIGzwfh5dE7jZ
 zWc7Vxx9tC9ywowljUpYZTxCX1DpFoKd+RLEUyWwvr1jRkRRfBoL+8kVSadc26SF72YvQWjNA
 rwBTBrfRrK1guStP7vS5kHi2WGAbC6NtkdhpsHvdENK9q3McA/96eRkYjEXghxuYIz96WLdrJ
 FikuS3nmikxXgemuLmVS5k7rTm/LZ+eqOG+25WAqp/FU3A3KMULNebWY0rZJHLCM5utlgQQ4t
 sUA+9ZJqGCZUKWLXr8d1mNFknG3TdxLLm3jlIThCYJa3J+6gb+Tbh97USA78Ac2Iea8VXcK5+
 VRgODhxLsAOe7rCDVYnUvR1zaKvT9LVSaUZU462qh8A5TZ3UP3uim28xAp0QLrkgyQmcXs9Bd
 RZg7MntyQSpdTyPc8KFKFue3P1Lx3wao728XQDdDofapihmk3yrPyFVbDnZ5MjyBHAQzvhVpc
 8KpHVT1lO0nk3gXZa+1gDLXjhRy04rD218ninhmETed6c4iOzDIcvucLXtu+YQoP3WMLxA7R6
 OtQLCg==
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,URIBL_ABUSE_SURBL autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

I just want to say thank you, for your very detailed review. It helps me a=
 lot.
Now I know for sure which kind details have been missed.
Reading and writing such a documentation is definitely a different thing.

On 27/03/23 20:28, Mauro Carvalho Chehab wrote:
[...]
>
>>> At least everything in the header-files is in the documentation now. I=
 hope, I have done it sufficiently.
>
> Good! It took me quite a while to read everything... At the end, as was
> a little tired, so I probably missed things.
>
> Next time, please split this on a patch series, in order to make
> easier for the poor reviewers to look into it ;-)

I have to apologies. I just realized, that it got that long,
while reading your answer.
I should have tried to scroll down to the end, before sending ;-).


[...]

>
>>> I haven't found any useful hint how to get rid of them.
>>> Should I switch to "code-block:: c" instead?
>>> But there are a lot of this warnings from other files too. It seems I'=
m mot the only one with this problem.
>> I switched to "code-block".
>> Now there are no warnings anymore.
>
> For things like ioctl, code-blocks are preferred. For other things,
> better to keep the warnings and not use code-block where not needed. The
> warnings are part of the Sphinx cross-reference system, which tries to
> create references to the C domain functions and data types.
>
> Unfortunately, Sphinx has a known bug that it is hit when the same symbo=
l
> name is used with different meanings e.g., on C declarations like those:
>
> 	struct foo;
> 	enum foo;
> 	typedef foo;
> 	foo() {}
>
> Each one has a different type. So, `foo` cross-references depend on
> the context. Right now, Sphinx will just consider them to be attempts
> to re-define an existing name. There's already patches fixing it
> Sphinx upstream, but (last time I checked) not applied yet as those
> would cause regressions on intersphinx.
>
>> This functions shouldn't be referenced from outside this document anywa=
y.
>
> No, we link the header files with the documentation, exactly to
> generate cross-references and detect gaps at the docsO.k., I thought thi=
s applies only to the inline-documentation generated from
source-code.
But it makes sense now.

Thanks to your tips I was able to find the solution for this problem in
minutes.
One of the versions I tried was already almost right. But I haven't seen i=
t.



I already noticed, that not everything of the API is in use by the AV7110
driver, but I forgot it in the remarks.
I will provide a list next time.

I had searched for the declarations from the header-files in the projects
including them.
Almost everything was found in the AV7110 driver, only 2 or 3 items were
missing. And this rest seems to be used elsewhere.
My first target was to make the documentation consistent to the headers.
So I kept them, at least for now.



I'll mail again when I'm finished, but it may take a while.

Regards
Stefan
