Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 091D029E669
	for <lists+linux-media@lfdr.de>; Thu, 29 Oct 2020 09:30:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728404AbgJ2IaD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Oct 2020 04:30:03 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:33239 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725898AbgJ2IaD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Oct 2020 04:30:03 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Y3JmkJXmXAVOrY3JpkF0ZX; Thu, 29 Oct 2020 09:30:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1603960201; bh=v8+4i8qQiK6QiD3BA5ye2evdMqTvYzplo5aHG26jLxE=;
        h=Subject:From:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=UAO87skK2RbsTIdLpdiRE7nNs0cABVeyyXuI1/baxLxaQMUvqD96Lff2DV7BS1nGO
         7GhJuhK2fh1Mzd82O0SmwcVT0TOnNZDaYfZp9fL6Z17I3ko2S+7GESB+nXNLNzgPaD
         FvQ+l3/bUA/GHjVnvMz9jALSFm1nHFUfkUNj9YT5bcWpMZr2C0cTTMwfhLfqFskZEa
         lBMeArr2CT/FMrE8YiweLujs3QR5bdFrCBOPC8dPvqQk0yjMNk5zVLknxmaIg14eJM
         /o4F2cDx7E++rb5H63UIUuqbq9bDwS1g5O9XiyZpNUZ0sloADEONYNsjtdSXXlTKjl
         yg3JYaFBQ/uqQ==
Subject: Re: [PATCH 0/8] media: v4l2: simplify compat ioctl handling
From:   Hans Verkuil <hverkuil@xs4all.nl>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20200917152823.1241599-1-arnd@arndb.de>
 <cbbed130-3329-85a5-f360-3537391c1569@xs4all.nl>
 <CAK8P3a3KCxSJyfoBe40_=Qjsmc_e-yJFVE9jzaTGBz7t76GBHQ@mail.gmail.com>
 <04808d02-e919-b804-14bf-79e529cf997a@xs4all.nl>
Message-ID: <28442e5c-0146-94b2-414a-f64b5cf63423@xs4all.nl>
Date:   Thu, 29 Oct 2020 09:29:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <04808d02-e919-b804-14bf-79e529cf997a@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfLLRHvzjBIdoR6DGO6D1idzEg2AjnoUDl9thWpg2llbW/JWltWxaZDqsKaaD4F6sbPE2FHXeR2JgY6VYMBxDBT+EDDW5Jq1yGwGdruTFZsL0oSguyuV1
 nISUV+xYES8fN9hqYno38Eu64aU48ClkDysxMD9TJbqIWWdVGvcpmzNhouLnjz3VHYzIYshi0BcfZQ6bcnMSad74P3sTa4HILpHUSVQFTOn9voHD0/kTQ992
 ly+z1u1Q4ZGzG0MqQDqS3g5HEqtwuu8v7ESI86L0ODPCfrcrvFesjeWqyAPIi4Pej89dthgJ0rZUPofV9PDkjw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Arnd,

On 06/10/2020 17:28, Hans Verkuil wrote:
> Hi Arnd,
> 
> On 06/10/2020 17:14, Arnd Bergmann wrote:
>>
>> As you suggested earlier, I will resend the fixed series after -rc1
>> is out.
> 
> Looking forward to that.

FYI: v5.10-rc1 was just merged into the media_tree master branch.

Once I have the v2 of this series I'll test it and if it is OK make a PR.

Thanks!

	Hans
