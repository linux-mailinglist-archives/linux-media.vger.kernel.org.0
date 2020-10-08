Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDE822879BE
	for <lists+linux-media@lfdr.de>; Thu,  8 Oct 2020 18:13:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730125AbgJHQNX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Oct 2020 12:13:23 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:33447 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725802AbgJHQNW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 8 Oct 2020 12:13:22 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id QYXbkXXdw4gEjQYXfk7Lq8; Thu, 08 Oct 2020 18:13:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1602173599; bh=a/fzkl1Em2rMKkC68ZYHexDtBGbDFFvQNltWRY8waX0=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=bU5VmWYhHL4PSIGmqqs0hwnfR+METy9ap2qbOOWsMqCI7PBwW4DZONKcpzg1L6Rlx
         hhr5EKy49Mlgcn4LZ75ZXigbKa61KqE/gWSS9cKwmRZTqdtc6y+dlovJHSYk4J1PJT
         I6h/9gqfUI51Uv4S4zTtbq+a/TS0vqbDBMf7voqTSbUVgbI8i8xk/o9GocWm3Pp98f
         s0HKyE5+ENRUbPBnd75tPOr8Zd93m/7/p2c4B0itI3ctu2+92x4b4bo7L8WAd1ygj+
         zzHxeAh/UYDyKNrH094NTNIh33IefIrsTDKJiuOfEV0ptZ4aLymZprr+/j2q6OnZba
         FcGoB5G4tQtiQ==
Subject: Re: [PATCH v2] media: mtk-vcodec: fix builds when remoteproc is
 disabled
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>
References: <20201004122234.802044-1-acourbot@chromium.org>
 <c3e1c20a-7729-9f48-ce66-41e67f195fc7@xs4all.nl>
 <cda40a8e-4dd2-5fd7-c5ff-8b048475164b@xs4all.nl>
 <CAPBb6MX8rFZU=9Pd5o0mqQ6pf+1oQYzk=D0WiR93_S3FUG7jJw@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <1bb71c21-0f03-5d8f-be2c-fdcb13dadcd6@xs4all.nl>
Date:   Thu, 8 Oct 2020 18:13:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAPBb6MX8rFZU=9Pd5o0mqQ6pf+1oQYzk=D0WiR93_S3FUG7jJw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNJuX+ervZ+LktO6bk5zejJpaK9Qquwwb9WreR4+7gljJpWsuSP478RbXSzBHjKIkiR8RR+5Q9sbcTwx8Q6mW9JPtOx8XJJcd40h8Elx4yfgvgCfQfO+
 mKFfoZKkLLjhVnlfhIaW3yP7Z/5ZYiBkKBPsiNxoDZ20OcE0OgJ5ybeklNlEM3yyFBy2QvmJT6jwMkO1jkFkwjpiq79W/mwbdAgMPjHIT7BLpO4zun1QDD1E
 GWxYy5oDIBXqpduZwsu39ubEPDV7BjgSC/TIqWL3IcYdGeqL0tJSHDVEucLJXVcPLAEA8JVoeFW6PdeyndXN2RPqmEJg8KYvnHOBPo38qdxIGdcLkiblqDIn
 NoDzqNEv3wewwzHJk8S+JZ1cMPmlpkHBm9LO05PieEYFy211LZhBZ2qKMpEzS4JKgSdFPaJgS9w5fuTpGLqKSWtKattFFCEDVHSpWGTOfrXJlGNH0CFfX5Ki
 t/70NzgLs//0WqxuKPzZ45z+ZrTUs1bap5w7hw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 08/10/2020 16:02, Alexandre Courbot wrote:
> Hi Hans, thanks for taking the time to look at this!
> 
> On Thu, Oct 8, 2020 at 10:12 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>
>> On 08/10/2020 15:07, Hans Verkuil wrote:
>>> Hi Alexandre,
>>>
>>> On 04/10/2020 14:22, Alexandre Courbot wrote:
>>>> The addition of MT8183 support added a dependency on the SCP remoteproc
>>>> module. However the initial patch used the "select" Kconfig directive,
>>>> which may result in the SCP module to not be compiled if remoteproc was
>>>> disabled. In such a case, mtk-vcodec would try to link against
>>>> non-existent SCP symbols. "select" was clearly misused here as explained
>>>> in kconfig-language.txt.
>>>>
>>>> Replace this by a "depends" directive on at least one of the VPU and
>>>> SCP modules, to allow the driver to be compiled as long as one of these
>>>> is enabled, and adapt the code to support this new scenario.
>>>>
>>>> Also adapt the Kconfig text to explain the extra requirements for MT8173
>>>> and MT8183.
>>>>
>>>> Reported-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>>> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
>>>> Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
>>>> ---
>>>>  drivers/media/platform/Kconfig                | 10 +--
>>>>  .../media/platform/mtk-vcodec/mtk_vcodec_fw.c | 72 ++++++++++++-------
>>>>  2 files changed, 54 insertions(+), 28 deletions(-)
>>>>
>>>> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
>>>> index a3cb104956d5..98eb62e49ec2 100644
>>>> --- a/drivers/media/platform/Kconfig
>>>> +++ b/drivers/media/platform/Kconfig
>>>> @@ -253,14 +253,16 @@ config VIDEO_MEDIATEK_VCODEC
>>>>      depends on MTK_IOMMU || COMPILE_TEST
>>>>      depends on VIDEO_DEV && VIDEO_V4L2
>>>>      depends on ARCH_MEDIATEK || COMPILE_TEST
>>>> +    depends on VIDEO_MEDIATEK_VPU || MTK_SCP
>>>
>>> Close, but no cigar.
>>>
>>> If VIDEO_MEDIATEK_VPU=y and MTK_SCP=m, then VIDEO_MEDIATEK_VCODEC can be configured
>>> to y, and then it won't be able to find the scp_ functions.
>>>
>>> To be honest, I'm not sure how to solve this.
>>
>> Found it. Add this:
>>
>>         depends on MTK_SCP || !MTK_SCP
>>         depends on VIDEO_MEDIATEK_VPU || !VIDEO_MEDIATEK_VPU
>>
>> Ugly as hell, but it appears to be the correct incantation for this.
> 
> But doesn't it mean that the driver can be compiled if !MTK_SCP and
> !VIDEO_MEDIATEK_VPU? That's the one case we want to avoid.

No, because you still have:

	depends on VIDEO_MEDIATEK_VPU || MTK_SCP

So at least one of these must be set.

Just try it :-)

Regards,

	Hans
