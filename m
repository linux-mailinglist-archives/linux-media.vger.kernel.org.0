Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D182026D6B1
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 10:34:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726236AbgIQId7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 04:33:59 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:47209 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726106AbgIQId5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 04:33:57 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id IpMJkL7H0PTBMIpMNkl9Tx; Thu, 17 Sep 2020 10:33:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1600331632; bh=16XUzEaDqPGbj9ZPKdSKXNPfKFUiYOCU2kzIJSjyIOg=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=a3SrX882ByFRkqBq9jc/ZgOfOFP2pk5Fs1xhpaAqq5uiW5i9+m7P7C4+jmEpDCxZD
         AlObv8wTW96BPXolOGeLnqb3Qmog8fhCq4GNCFJV0zL4GDGzGpL4hvUWRA8IkoQBIE
         buICtH0MMt7UcE+IkdojU6MXorE9lFG55pqglO8zyB0Wvc8+7fRBAlKEYFgFlCvV5/
         PguZpGF/oL+iLofVMFaC0IDSit+M/uAVZiK9rBz8GmkJ8/TBmqlkvZmv94pN9D0HLr
         1Br7qjZXye+AOyJXl1IaYaDSTQs1gajNg40QrYUv3b6b442tCingIyU3NURVHQngLU
         78/5dEepeenrw==
Subject: Re: [PATCH 0/5] ARM: dts: sun8i: r40: Enable video decoder
To:     Maxime Ripard <maxime@cerno.tech>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     wens@csie.org, paul.kocialkowski@bootlin.com, mchehab@kernel.org,
        robh+dt@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-sunxi@googlegroups.com
References: <20200825173523.1289379-1-jernej.skrabec@siol.net>
 <20200827151914.copcle3xjn3ek6p4@gilmour.lan>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <e9d108ee-29c8-7a34-16c0-f9fb2b788f25@xs4all.nl>
Date:   Thu, 17 Sep 2020 10:33:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200827151914.copcle3xjn3ek6p4@gilmour.lan>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJTGm402BRM932Ez8WjMKHNh3v1XhbIPN7JDQclduO2YMTLNWxavqM4T9eK6Peswf8a1mvbQTWKYX7BrVxLX46DQX+KyEbSbJ/G5nktysxAKj58Iwz5B
 Z+YzYIkzkb6bTZzXh880sQ6Cq2qiO6YRt2TAgtSial1DZc6HUfqA30uiCloy0tEXJwj0M7PVKHEgepuU/SPkNc/oHoOYhX2LwBgvU3TT4BLPx0xnSivtkAyA
 K+6fGeJWAfyXWFTFkTI9S9taRNWAwODZ6PgtHatO6pNk4jQWwN3rQ2qU7TGdlL9Px8NUa+Rm7d4gnl1cdgqxTdGV33o5aaMfx3E+5Q6aH2flh80GYgDkTaZG
 oMJ8j6AYjZFmjbD3UXgItwQrorJGMNNZ76mcCcqHTga75iUQjzM8nGSh4mXzQ/DAWHfJb4LTewEP/8AX4j4d6lqM6eVlLHms4dt6gPxzx08DiqGbBSnajBap
 seocacVixhfVCITKs4oJPxPzihOtJIdadVzPKoIA7RcNX2vwiVRwCi/EnpyvGQpXcMREaYpwE5pRd3oHzLxlPJEv+J2aiynISsyeF004QtrLtmuW5UqB9byP
 GrfO993YRuoIky4LlARkTBAO6Z5HJQBIU5+r3x+6fgjNy765vbu6kgjhHHIyfzJNcPTVVcmw7NyPLUZnlfjOaiA6pIdzf4QEDC/dxF6N/zct2r8eL1Ad/z/i
 k3Nc8SDYPcw=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Maxime,

On 27/08/2020 17:19, Maxime Ripard wrote:
> On Tue, Aug 25, 2020 at 07:35:18PM +0200, Jernej Skrabec wrote:
>> Allwinner R40 SoC contains video engine very similar to that in A33.
>>
>> First two patches add system controller nodes and the rest of them
>> add support for Cedrus VPU.
>>
>> Please take a look.
> 
> Applied all 5 patches, thanks

Just to confirm: you've taken patches 3 and 4 as well? If so, then I can mark them as
done in patchwork.

Regards,

	Hans
