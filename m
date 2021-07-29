Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 025043D9FFD
	for <lists+linux-media@lfdr.de>; Thu, 29 Jul 2021 11:02:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235017AbhG2JCg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Jul 2021 05:02:36 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:52365 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234972AbhG2JCf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Jul 2021 05:02:35 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 91vvmQ8uzXTlc91vwmW2qU; Thu, 29 Jul 2021 11:02:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1627549350; bh=Q7FrPaxICtEbloappFQf85NcaadXsp+cwwXQ0ECeko0=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=qXFad112155ZVNcTJxnGkm2tf+eCPfq8KlQF3AhaWQe+U4koJUP3iN/gTJEashugq
         iyZx/rTsPjrgsKWScMcLGkm0PxuTwSI7LjQwoifQ3322u68IMA2KtoDRPYXw8iJ2CY
         i6ae0BsefPcytFql5ZbRH9GW7Qq0pjg6iID9FbWim54dI9cYCoaKl941cLidhKNugz
         fu3ki2O1DmBCF3cm4uinEIe7b6W6Z7x4rYWcleNmKChv4L0nXyOAfFTzn/nA0hiIby
         k4dPI1mGmthFza8yiKjFtAJ5yDciDdjlTJm9HWdzJms3B9KlCfE7aCtvBDrj7C+C06
         W0ia0AcsF7ppw==
Subject: Re: [PATCH] media: atmel: atmel-isc: fix build failures after split
To:     Arnd Bergmann <arnd@kernel.org>,
        Eugen Hristev <Eugen.Hristev@microchip.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nicolas Ferre <Nicolas.Ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <Ludovic.Desroches@microchip.com>,
        Arnd Bergmann <arnd@arndb.de>, tomi.valkeinen@ideasonboard.com,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20210722090509.1054249-1-arnd@kernel.org>
 <BN9PR11MB5514AA62DD0F2A65828E62D6E8E49@BN9PR11MB5514.namprd11.prod.outlook.com>
 <CAK8P3a0xp9BxwSt9+WTngsb1K12NGkroBwEf9p5Wg0Knf5umNQ@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <8b601ccc-2697-7d5e-aee1-763d3575582b@xs4all.nl>
Date:   Thu, 29 Jul 2021 11:02:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a0xp9BxwSt9+WTngsb1K12NGkroBwEf9p5Wg0Knf5umNQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfFSL7ezfVHJ6YjElfu187+UW63loemXLUHLveX1Mv0MJIgDWb2QSSbxnk17LTUz+zl5W6o7PFgGqiOROMAPVD5nz2WOXbtxrYt4uEYQFQqFAijOVUUBG
 yl40O6bR8yMGIBRY0zylHf3Or7mBjeaTkH8J4Pam6N3Sw7s8EGZTzCEB9hI6sMmqILfyJe0PzuU18obTgozc2CZeHM1+7iNOuubq+v/GLUtrHZSobMEm9uEA
 6qL7X1hOdJf+3oPnLeai++wMwxZfkbBi9/dcHXwFyV8impRYS8L53N7taBDlLG51fT+ovF8mVMUeuSG+oWbdeMuiLCpvNJ3ulYP8eSkJexxb/e426yTnEC8X
 3QQkRkuKdGCwjIhywKHLw0MmSVXd9iQ3lnhNT+Rqjq8+4oJxn0hCspzfPy1av9LJRbtIFtHaLgbuf3zPUcHwfsKuPlG8zh5Nqx3ZQWnXL49eV+cIlHWEAxpn
 oYDYIsb6tyQvIKyrVMGNb73yRDBXqgdcrkAB/yWw+knXKz5tdtrKUOR7Yt2XVPZAuKeG8k5DtoQoiB52f6G0pAPIpHO3aQAA+fpXnejyq7Hd/kn79Dx/SZV6
 Y/7sW8XUxEkCUi2E3+9Pq0hblp25alyYgVHVY8vx1GbHZUV/3fhPfW4i9s76xxQ8urkLuaDutk2ICR0JT9jl/i7xL4R9o9GEUtsVx1JdHa2EQw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22/07/2021 13:45, Arnd Bergmann wrote:
> On Thu, Jul 22, 2021 at 11:22 AM <Eugen.Hristev@microchip.com> wrote:
>>
>> Thanks for the patch but I already posted a fix some weeks ago :
>>
>> https://lore.kernel.org/linux-arm-kernel/20210705125708.121902-1-eugen.hristev@microchip.com/
> 
> Ok, good. Is that going to make it into v5.14?
> 
>         Arnd
> 

I'm preparing a PR for v5.14 for today.

Regards,

	Hans
