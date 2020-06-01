Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECD951EA01A
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2020 10:31:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728162AbgFAIbn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Jun 2020 04:31:43 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:42991 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725999AbgFAIbn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Jun 2020 04:31:43 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id ffr7jYVmtnv5nffrBjmzZ7; Mon, 01 Jun 2020 10:31:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1591000301; bh=FPgi8skndYa3qQMqUunZhM5UrRolNIv8NENdRLO7R24=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=bxNFUoUQHz15Ntyie6LP6ZaFNMeAZ/UNFWaMoOEqkwRJfATAK0Y3B+FTOAJU2EkwT
         UhMg1+aEcsq19L/zYYEPJV8EqxjAu8PwkZuFeyBaIh9UkypovGnxv67PllknIpV6u+
         InvAfuZ+84/IFN05HCM7dAohrmA6iI4LnG5GUDskrIb+dTWwy3Id3j/A3RZsdvZKe/
         GZMYNbExhoij9JWfiywuJgsqlL7soQYg/dUugpi8MCSee5wLrUsP7jwPiptuLpb5ZT
         Af+rdjfPaHcwH4/+tqNPd1soukHsGWGjFNZ0tZQ6rMjkABVoxeJ5aTJYPcsm7BE2d+
         1gfININ0aGRYg==
Subject: Re: IMX274 driver
To:     Luca Ceresoli <luca@lucaceresoli.net>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Frank Chen <frankc@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        linux-media@vger.kernel.org
References: <4184f80b-eab3-c512-dd99-d24c7af4b45c@nvidia.com>
 <afd8fdb8-e359-5aee-ba3e-54a5217b2aee@lucaceresoli.net>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <d81c6fec-e7de-1282-9e17-1fc0f5dea9eb@xs4all.nl>
Date:   Mon, 1 Jun 2020 10:31:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <afd8fdb8-e359-5aee-ba3e-54a5217b2aee@lucaceresoli.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfA5/uyH9DxjvaDcEXtZMJDUhVH1gPXID100ymPqi+I54qTyTELhcfK+t3kmDQBgOJYmWxgLpbd8x0ZQ7Geosr/3KSqtMLtDSOINRzDLLHVwdmzBM5zR+
 UWsxfyIuDm/vrJt5xzVC/GG3zXESJGzvHU8s4t4sLW4ePQ4Je8DpZvmjuGPowVvCd/W6ja28Xf6T3qBj8agJuS7fr+74cgt9zNx61dyv5I69xq388nLqenjL
 1aDblx+VZQB3AlieBwRrs39pEWO5fsg29CpPAr6jtaQh+iauU+3+PMj/OSUBHRenBgEGsjQCi/aysMrqNattpw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Luca,

On 31/05/2020 23:56, Luca Ceresoli wrote:
> Hi Sowjanya,
> 
> On 29/05/20 04:07, Sowjanya Komatineni wrote:
>> Hi Luca,
>>
>> Quick question regarding IMX274 driver that was up streamed by you.
> 
> Well, to be fair I only added cropping and made some improvements.
> 
>> Upstream IMX274 driver programs Y_OUT_SIZE correctly based on IMX274
>> datasheet and register mode table for Y_OUT_SIZE where it includes 6
>> ignored area of effective pixels + 8 effective margin for color
>> processing pixels.
>>
>> So, Y_OUT_SIZE register value = height + 14
>>
>> But somehow with this we are not seeing full frame on CSI.
>>
>> In our internal NVIDIA IMX274 driver, we are programming Y_OUT_SIZE to
>> exact height  Y_OUT_SIZE = height
>>
>> So for debug, followed the same and updated upstream IMX274 driver to
>> program Y_OUT_SIZE = crop.height locally and I see all resolutions
>> working fine with this.
>>
>> Checking with Sony on whats causing sensor not to send full frame when
>> Y_OUT_SIZE is set to height + 14.
>>
>> But thought to check with you in parallel if there are any known issues
> 
> That's strange. Unfortunately I'm not using imx274 anymore since a long
> time and don't remember the details, but definitely I did test it and if
> there had been 14 missing lines I'm pretty sure I would have noticed.
> 
> I'll see if I can remember anything useful, and in case I'll update you.
> I would be glad if you can update me on any findings too, maybe they
> will help in understanding the problem better.

The '+ 14' makes no sense. I wonder if this was perhaps to compensate for
some problem in the bridge driver that this sensor was connected to.
Which bridge driver did you use for testing? Do you remember where you got
the '+ 14' from?

Regards,

	Hans
