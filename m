Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F94724BC78
	for <lists+linux-media@lfdr.de>; Thu, 20 Aug 2020 14:47:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729191AbgHTMrP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 08:47:15 -0400
Received: from grey-smtp-cloud7.xs4all.net ([194.109.24.45]:48629 "EHLO
        grey-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729024AbgHTMqp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 08:46:45 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 8jxokHUFgywL58jxpkZelb; Thu, 20 Aug 2020 14:46:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1597927601; bh=ArVEHdPnQIlpY0xbeErCyEhTjixeuBAbXbfO6EPbZKY=;
        h=Subject:From:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=e3Z90B0u3PNIN2obsqvix0lSwJvaWYMphegQieCr9ebg9PDFPxGvLKSh3r5M0O9Wk
         Toab4tkwpsAjDAdAw33xgIw+k+p2F2hcW02DU9jyTgomEhrs2h7mWKAVZJjH6VIL6q
         mJcQq9TG543SrGFmurW7MnDgn6edOfFRHRuJhBqRj/DFoaOxdq8mxCPKIW6IRa/dtN
         WIje1HwlI16siktdRN/Yap+w8emkVu2Kf9jAJmYSSyFeNGqrVPYrCOrS1Bdt2yoDWq
         r5EpQ3UmB+sA/Opwi+GAHAZ44E1XXYSIiy1LqDOwjiK0oCTsRjXwonx4QnI0+9qcQb
         ASjljziooZk1g==
Subject: Re: [PATCH v4l-utils v3 2/2] Add support for meson building
From:   Hans Verkuil <hverkuil@xs4all.nl>
To:     Ariel D'Alessandro <ariel@vanguardiasur.com.ar>,
        linux-media@vger.kernel.org
Cc:     sean@mess.org, p.zabel@pengutronix.de,
        laurent.pinchart@ideasonboard.com, ezequiel@collabora.com,
        nicolas@ndufresne.ca, kieran.bingham@ideasonboard.com,
        gjasny@googlemail.com, xavier.claessens@collabora.com,
        nicolas.dufresne@collabora.com, user.vdr@gmail.com
References: <20200806155519.79748-1-ariel@vanguardiasur.com.ar>
 <20200806155519.79748-3-ariel@vanguardiasur.com.ar>
 <c5c1859a-34b2-bdb2-c3ac-3a0c96d7c019@xs4all.nl>
Message-ID: <e25c5b95-bfd8-2598-d079-722aac2055ba@xs4all.nl>
Date:   Thu, 20 Aug 2020 14:46:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c5c1859a-34b2-bdb2-c3ac-3a0c96d7c019@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfI7ozjXhG4JPsiXp0/ydraGmIfNG8HZEtsbCuc2C1Eu9+Au6QyxqskFbZM5aQqqrUsqebcSjFepvuVveF/+GjRxGtkkzwQ4snMQ1r6DJMhmI1ul4y0Wn
 YZvMFGBqRegNiYyDQWUB/GeK6iKDGPKvK7+4E3mZ57PBjhhTgSSIstpGqaONQLwFUndT41OAp8KY3Iz9cDzohQrDnMklb8Acy8dyqBOD8nh77RO9zasrwzry
 C48vNqOzoSmrtA6SH3uJI2Ijo4taIqQyj5RZy4muaFxhAr6/0Pebzon6eDsBKJtMWBpKCbpK+ZVnYeHsVmr58Sb+fhqSE9BAxoTiib741yawzRY21uRiTwML
 S1syL+3x4f6Ms+GfHQLNRLIdkk9+Ngv50Ep3wTYWre+Y3RQmTgcacxeubXR2ro4rM5JmoK4OtirClA1e+2dYcYAsTv3Oyq94bNbLBJYJN0UrrWDbJJGvyruB
 WNnkLB5LqBpLzR2wNDAOXu+l/sFmpYNuWr4ofi6AQPoLDlkNr1wgwymSnONimwfRthFgvz6/GolS5Xd1OyUC6E8+veqMQTJ2ubFhhYuktB+SkjUB+egwxJtZ
 /OorKyGSu9TbJL4t5Tt12sFNwOKo66MYPIHLVDq+HG8AFY2ED9ZcZTpMgBycRrK44qUYaWLY0DS808AdsAGttdFw7YiOX8rTFGa2FCUjSsgdUg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 20/08/2020 14:42, Hans Verkuil wrote:
> On 06/08/2020 17:55, Ariel D'Alessandro wrote:
>> Supports building libraries and tools found in contrib/, lib/ and
>> utils/ directories, along with the implemented gettext translations.
>>
>> Also supports generating plain HTML documentation and manual pages using
>> Doxygen.
>>
>> Co-developed-by: Ezequiel Garcia <ezequiel@collabora.com>
>> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
>> Acked-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>> Acked-by: Gregor Jasny <gjasny@googlemail.com>
>> [Gregor: Control symbol visibility]
>> Signed-off-by: Gregor Jasny <gjasny@googlemail.com>
>> Signed-off-by: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
>> ---
>>  .gitignore                                    |    1 +
>>  Makefile.am                                   |    3 +-
>>  README.md                                     |   85 +-
>>  contrib/Makefile.am                           |    3 +-
>>  contrib/cobalt-ctl/Makefile.am                |    2 +

I would also suggest that all the Makefile.am changes are split off into another
patch as well. Those make it harder to review as well since most (all?) of those
changes just add meson.build.

Regards,

	Hans

>>  contrib/cobalt-ctl/meson.build                |    8 +
>>  contrib/decode_tm6000/Makefile.am             |    2 +
>>  contrib/decode_tm6000/meson.build             |   14 +
>>  contrib/gconv/Makefile.am                     |    2 +-
>>  contrib/gconv/meson.build                     |   44 +
>>  contrib/meson.build                           |   13 +
>>  contrib/rds-saa6588/Makefile.am               |    2 +
>>  contrib/rds-saa6588/meson.build               |    7 +
>>  contrib/test/Makefile.am                      |    3 +-
>>  contrib/test/meson.build                      |  143 +
>>  contrib/xc3028-firmware/Makefile.am           |    2 +-
>>  contrib/xc3028-firmware/meson.build           |   11 +
>>  doc/Doxyfile.in                               | 2351 +++++++++++++++++
> 
> 2351 lines to add this file?!
> 
> Is this really needed? And if so, please add this in a separate patch in the
> next version. This huge file pollutes the diff, making it very hard to review.
> 
> Regards,
> 
> 	Hans
> 

