Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D8793753EA
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 14:35:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231512AbhEFMgu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 08:36:50 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:60061 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229777AbhEFMgt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 May 2021 08:36:49 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id edEFlv0CwyEWwedEIl0zd8; Thu, 06 May 2021 14:35:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1620304549; bh=WOR19envAlRRRl8TIK3qpcWJWZjCtwsC2mEH2Fdqy/I=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=GlViP6PDykjVIhbawEFdOMy0C4z3wXUEfsM7pAn3f+HNIW7lq/shfDgvZHMc75WE9
         +EeRlLeOaAJPAFxziFYufCGeRXI7NnHVMEIsdokhyJaHbtmCazBIVfzReDTZUQMA6E
         LNTChQm0NMDiEVF9ZNxOB3m67IPK+6iTfqYLd9SQ3+qulJt71gvqC9Z8TQD0ULc2Ic
         MiBDWNY9ch7v3QheM2VOiL27/lvbpJcL160VjJnR0zjGyI2SGLSlf+gTH4ftfIK6om
         C8kZ2B3M4dZTJxr7FGApY1qipJRmoovkB5gwHjOusiH9j3Xd+4fbSrS49pMLi55m38
         +2S/Ed1to38Yg==
Subject: Re: [PATCH v4 9/9] ARM: dts: sama5d4: enable Hantro G1 VDEC
To:     Emil Velikov <emil.l.velikov@gmail.com>
Cc:     kernel@collabora.com, Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-media@vger.kernel.org,
        linux-rockchip <linux-rockchip@lists.infradead.org>,
        Frank Rowand <frowand.list@gmail.com>
References: <20210401144336.2495479-1-emil.l.velikov@gmail.com>
 <20210401144336.2495479-10-emil.l.velikov@gmail.com>
 <a9829af1-f4e9-5835-9a74-15a0fce6b1eb@xs4all.nl>
 <CACvgo53L-3kN6WGn6VqkpZTRcVnrnLeCxRPxcGks0TR+VQuXbQ@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <4b22a35f-5599-799e-9887-8ccd5a550af3@xs4all.nl>
Date:   Thu, 6 May 2021 14:35:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CACvgo53L-3kN6WGn6VqkpZTRcVnrnLeCxRPxcGks0TR+VQuXbQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfPQLXgmw3TGPOc4mJIm5s24EQtla8xjWuiul4+Zab4VWAYHBR33TdRxTpxrlo3azmc23Fo/ROG1fEr1jIhNkPA0jYb82UU3L6n5YmwjAPCxF7LPOj5Ts
 +LzNcwGfm+M2UhreTZTObltyByiJvGVEDFBxhhsX3C2TaUTgewariZhudBc8mt73oPSlTypRbUBQtBclgTZmTBX47yWQd3Sx/ySbd/qUqViM+V3GbQGvdwI3
 SLmRK/SyO3PmxgPSlvZYVKXAEzWm+2GsIAPTCws4H1C3VheZr/LptI5AniZJxGTOujhJLhw8mGAh472POLl0k2lSpNcN2IetFx6O0WCoei1phTP3i7kqBR0y
 8cqyy5RTXaiPCsrWYxmATpCntsrH7tXIt5FvPOPeSbbHUOVpBfw7/IOf6RRhWiydIuVI6xJOEjmXgw50POZD1qOm7TUpRiyS7vq6wUgYRCmIrmfAtB/oSScd
 qWaEyvSvba08qrM7
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 06/05/2021 14:31, Emil Velikov wrote:
> Hi Hans,
> 
> On Wed, 5 May 2021 at 15:31, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> On 01/04/2021 16:43, Emil Velikov wrote:
>>> From: Emil Velikov <emil.velikov@collabora.com>
>>>
>>> Add the SAMA5D4 VDEC module which comprises Hantro G1 video decoder
>>> core.
>>
>> I've accepted parts 1-8 of this series for 5.14, so this remaining patch
>> can be merged by whoever handles such dts patches.
>>
> Can you please include this patch as well. As you can see it has been
> Acked by Nicolas, one of the AT91 maintainers so it can go with the
> media tree.

OK, I'll do that. Usually these dts patches go through a different
subsystem...

Regards,

	Hans

> 
>> Regards,
>>
>>         Hans
>>
>>>
>>> Cc: Rob Herring <robh+dt@kernel.org>
>>> Cc: Frank Rowand <frowand.list@gmail.com>
>>> Cc: devicetree@vger.kernel.org
>>> Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
>>> Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> 
> Thanks
> Emil
> 

