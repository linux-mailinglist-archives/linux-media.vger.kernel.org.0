Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B22C1C5559
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 14:24:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728233AbgEEMY2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 May 2020 08:24:28 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:40409 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728180AbgEEMY1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 May 2020 08:24:27 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id VwcYjUjZnhEkrVwcbjxh45; Tue, 05 May 2020 14:24:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1588681465; bh=iz+x1HZHbuuJvR7KWXAjlRSrOiJV8OLzAgDQQOMYU+w=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=TESiILNo8gSC8apxfTV+bzEHhOXA8/Fw6+nyCyPnqX1FYi+nxOnxMp6IHhDHM6Lgj
         p9xouL3sNXNbXROfvf3zMNjPfZ56F4i0IfiL4jMojAZ1c7KbnMeQEHEZB5cMal9klz
         BYpPeyHUHCraA7vXJ4LCEEzclRBjNRDtIDWhELXvXn4gXV/KjqWwNSSjFvveXlSJZt
         0I7Hwd9bVect/DPq113ahRkZ0Iu6ggnNTxPp+TEUaYl6BFjvewO97RpNzlSccqWP2k
         CF173vD8kqaI+pCc9Cv+axjP3+EY9QDF50135RimONR/BuN9WWadSQorT/EPcACjXA
         VuUfubXiNS4cA==
Subject: Re: [GIT PULL FOR v5.8] Add Tegra210 Video input driver
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Rob Herring <robh@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
References: <c95abf33-bfd4-489f-2c20-536e76b848ce@xs4all.nl>
 <20200505141735.53526ede@coco.lan>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <fa23e434-6a04-aa11-ad0d-ca546914a328@xs4all.nl>
Date:   Tue, 5 May 2020 14:24:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200505141735.53526ede@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfHt245UiJF2ooZaHi8IrT+mvXKCoW8ccOWBJJarinyBe9eweEgceyyqhZBsr6Q0M67O/YPQItlGdCYtvUz7XtUUtwblcexyk2xOeDEYaNc+T716Rqj+Z
 jXVAGsFgYfnstTxv4OvgfGRy8ZN1advje4XsKQHbHNfUNsdP+5Fb9K6tq2TKPcETlKWWFbxR3JDlKDw5ByYAB/hf5Sti7Qps50e4p5PYT4Du9/vXPs/3qbDv
 vyzwPmG5HefRe0t8m7HhnPhJHLuP+xMZmNaoQyeJcFevCEEbH8gJrpKKTYtdwp6uRwWX9GoeBIS/L0Os6HyhYw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/05/2020 14:17, Mauro Carvalho Chehab wrote:
> Em Tue, 5 May 2020 10:33:00 +0200
> Hans Verkuil <hverkuil@xs4all.nl> escreveu:
> 
>> The following changes since commit e51759f56d314d28c25be7606b03791f048e44c7:
>>
>>   media: v4l2-ctrls.h: clarify the p_def argument of v4l2_ctrl_new_std_compound (2020-04-29 12:04:58 +0200)
>>
>> are available in the Git repository at:
>>
>>   git://linuxtv.org/hverkuil/media_tree.git tags/br-tegra
>>
>> for you to fetch changes up to 0bba0154ded02babccd59e21c6a27c5ad7d50faf:
>>
>>   MAINTAINERS: Add Tegra Video driver section (2020-05-05 10:26:05 +0200)
>>
>> ----------------------------------------------------------------
>> Tag branch
>>
>> ----------------------------------------------------------------
>> Sowjanya Komatineni (2):
>>       media: tegra: Add Tegra210 Video input driver
>>       MAINTAINERS: Add Tegra Video driver section
> 
> 
> As pointed by checkpatch:
> 
> 	WARNING: DT compatible string "nvidia,tegra210-csi" appears un-documented -- check ./Documentation/devicetree/bindings/
> 	#628: FILE: drivers/staging/media/tegra-video/csi.c:521:
> 	+	{ .compatible = "nvidia,tegra210-csi", .data = &tegra210_csi_soc },
> 
> 	WARNING: DT compatible string "nvidia,tegra210-csi" appears un-documented -- check ./Documentation/devicetree/bindings/
> 	#3238: FILE: drivers/staging/media/tegra-video/video.c:106:
> 	+	{ .compatible = "nvidia,tegra210-csi", },
> 
> and double-checked with:
> 
> 	$ git grep "nvidia,tegra210-csi"
> 	drivers/staging/media/tegra-video/csi.c:        { .compatible = "nvidia,tegra210-csi", .data = &tegra210_csi_soc },
> 	drivers/staging/media/tegra-video/video.c:      { .compatible = "nvidia,tegra210-csi", },
> 
> The DT specs for this driver are missing. I even checked at linux-next:
> there's no DT bindings for this.

Sorry, I should have mentioned this in the cover letter: the binding file
is here: https://patchwork.linuxtv.org/patch/63576/

But it will be merged via the tegra subsystem (Thierry Reding) since it is
part of the display bindings, not media bindings. Also, Thierry was planning
to convert it to yaml, so he offered to merge it instead.

Regards,

	Hans

> 
> While the code sounds ok, I'll reject this PR. Please submit a new one
> together with the DT file properly reviewed by DT maintainers.
> 
> Thanks,
> Mauro
> 

