Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 923FA15D747
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2020 13:21:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729122AbgBNMVJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Feb 2020 07:21:09 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:50655 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728036AbgBNMVJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Feb 2020 07:21:09 -0500
Received: from [IPv6:2001:983:e9a7:1:bd23:d5c7:5f0e:7bef]
 ([IPv6:2001:983:e9a7:1:bd23:d5c7:5f0e:7bef])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 2ZxvjNQoMP9a92ZxwjGslZ; Fri, 14 Feb 2020 13:21:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1581682866; bh=PhqMFnmd2aN7gDvxtHkHxo9Tjtd5wgCucdPCv1i4je8=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=OQo8YW+mO7BFRmxx/32cK6cyemqRC7sP4WY0IJMROX2Kh7DdsRbCUEqbKbTSjNZV1
         is5nwLB+zhtMjClvL4mHf7J6nBS2xed5y7c/GW9spW9SWS1OwjOKLzvCYirNZFkUwa
         /P2ROepldLmMM2mJX+9p5vyxlWoagzBc2wv1zo+fjdD9nVHT9ndZ8UeBrzEIsNIm5R
         hfqMOP7IPulZyu/zjjARdAjZugDBoyn7RkSNm56eJ819DtDeuaiIlDGGgFtg9Yk7X8
         RAAml0sjGDOKweFt8/351drXbkWouMFH39pLhjS6Ob5MlGB+bltUj9DWoBeAPJgrkV
         /ji1nhlRVUJTw==
Subject: Re: [PATCH] media: usbvision: Fix a use after free in v4l2_release()
To:     Hillf Danton <hdanton@sina.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        syzbot <syzbot+75287f75e2fedd69d680@syzkaller.appspotmail.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Allison Randal <allison@lohutok.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Souptick Joarder <jrdr.linux@gmail.com>, andreyknvl@google.com,
        bnvandana@gmail.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        mchehab@kernel.org, syzkaller-bugs@googlegroups.com
References: <20200124141356.365bgzg2lp3tjedm@kili.mountain>
 <d8663b81-e920-3e1d-11d0-f636ea52c6ef@xs4all.nl>
 <20200214112239.GC4831@pendragon.ideasonboard.com>
 <20200214121447.13612-1-hdanton@sina.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <ddc06d75-2f9f-fb91-a73f-b5b2125b036d@xs4all.nl>
Date:   Fri, 14 Feb 2020 13:21:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200214121447.13612-1-hdanton@sina.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJZ3v3yOtuJD/iTQkXKATl0BqWT6ctGJCU2m9B9Wi30fNB5Ua8uXkmdX1pPt5CoZBnUxGdqk1Alo+C4IotpAO/JITMtDcNRCCatVhDefVMh6tWXOqlz5
 DVLzQApUvH4GGBwWCK+7sDrmzlKUWSp5btTET+ikWdIPYQARC8XPEtUypTGlpsXC7th/3moghrE4IebhC1lZVeXMaaDkTBEOS23ZvHjkWfcpyGs4MhxUrFxp
 QcKE4zpLV0Ed+aym+BFXaqXLY1nUVQQ6s0HvZqL64nwIlglF+BBiNQr6DZ4mo5QZ1eX1cYil0jXkkxYBTMUMz05Bb1hrX4+UiRndAOhQvoDd9yfznq0q2P0d
 adCxqbqncGVs4APbVfeLC02eLciwg9W5KNEfFqgazh0euNVorRAFHuulEaKf/5e1CfX7AhoUoBlMwDwI+j2SzLfTBKv10B5OJWwaRvVdfA5VGs/nAM/snyFt
 +4qBhEzTL/b4g46kY7Si03jk0Y1WZTSPqmMNnjl0Lx0aFb0cC2gAxEPq40nNeG2hOUbC2M531t75/BbmE/PWdNCau+OLPCaRG8GNT3bnNZwLpKkvDnixYJ6m
 0YW0jb5THMBPyD035vwHM/jnw2znJ5OmIJiq6sAWyKNNbX3BgS9WD8HGq/DgPCXrU1pZYz10fr7V/RqXpKnpuYAyQZYH51NhePegN28XqsEQxnfDCt74Lb1w
 NzmHH3mcqsykSD1oUo6tRIdjtu3gfyftSHtaXbYrGV+QSbTQsdSviE+APsKgovKABG9xsZU7QRdkEhuWajpXs3ZHjaUy2lif05iGlaFfA4ktvSD4HEcj/g==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2/14/20 1:14 PM, Hillf Danton wrote:
> 
> On Fri, 14 Feb 2020 12:30:29 +0100 Hans Verkuil wrote:
>>
>> Hillf, if you want your patch to be merged, then make sure it is CC-ed to
>> linux-media as well.
> 
> Please pick it up if it makes a sense to you and it was sent with
> linux-media added on the Cc list as it is known for a while that
> my mail agent is rejected @vger.kernel.org for what I am not clear
> about. It makes my day occasionally :P

I don't I ever received the full patch, only replies to your patch.

Please mail your patch directly to me so I have a clean version.

Regards,

	Hans

> 
> Thanks
> Hillf
> 

