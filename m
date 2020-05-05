Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F2D51C596A
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 16:26:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729503AbgEEO0L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 May 2020 10:26:11 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:38801 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729148AbgEEO0L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 May 2020 10:26:11 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id VyWKjGNQGtKAsVyWNjRtf7; Tue, 05 May 2020 16:26:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1588688768; bh=OCdsoHO5fXEuaYHDLoiI9Nul6s8coH4F1q+1CxVz2ho=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=hWNl1hMYq5TVCTxGpzIQEHhQgRHHmxbhZecdI8ijNxGjU1JGiMIxxM4/ctYHtttO2
         rGH6kwFZKnbL/z7TDSbTEFGskzdTHuD6R2IokohPPzDsU8VroIpajpFnqFMrpxKlEo
         TXdiYNRsqAvh6ULWWwrKqfQQrpCk/BdnVMdjgGelhRnVFk4sHkUHShWNmRvcCr/miQ
         6km9oPgvgy+JmyJAshSXDZDCsy52F+Gv57y8SxRTg3E0527UoG0YpUobQURNhukSiA
         O+DlI9K1dW+P8NzuLkB2fNl1G++OQEQZJQZylqRiD6pERYI3tqItPbwHzx5w1pjQoa
         PGxaVj0S2c1Ng==
Subject: Re: [GIT PULL FOR v5.8] Add Tegra210 Video input driver
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Rob Herring <robh@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
References: <c95abf33-bfd4-489f-2c20-536e76b848ce@xs4all.nl>
 <20200505141735.53526ede@coco.lan>
 <fa23e434-6a04-aa11-ad0d-ca546914a328@xs4all.nl>
 <20200505161555.2c4ddfcc@coco.lan>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <3c9e6a28-fc6e-0e4d-b7a0-57e3f2e1b206@xs4all.nl>
Date:   Tue, 5 May 2020 16:26:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200505161555.2c4ddfcc@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfP6KjAUfTyM17u0cz/Efxb8Oc7ykBuA7miKx9U+BewqCzBL9wo46Di5l3JfxfxVMM1BWH3jbsr7UHcDNYtYdgN8ib7MEhOdmvXfa62pUvkGp9ZkrPt98
 dfjwzx7Wmyx111Ep3u0m0DYODamCyHKR6Sh8fVPRAbNkLGrOEJCIXOcD+wQdYxu8a4qzu547WODDIf28ZdXU8hq30xtgkQh0YBhBGPZu4X7BKrGiHurow2Kj
 WHpiUVUepImQyzaCH5TPmMNFj9XeOdFDQZoJ4dL43ImGAs2jnNUOFe9jfuDOgJblcCAr4+eXIalNPZyL6LpVXw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/05/2020 16:15, Mauro Carvalho Chehab wrote:
> Em Tue, 5 May 2020 14:24:22 +0200
> Hans Verkuil <hverkuil@xs4all.nl> escreveu:
> 
>> On 05/05/2020 14:17, Mauro Carvalho Chehab wrote:
>>> Em Tue, 5 May 2020 10:33:00 +0200
>>> Hans Verkuil <hverkuil@xs4all.nl> escreveu:
>>>   
>>>> The following changes since commit e51759f56d314d28c25be7606b03791f048e44c7:
>>>>
>>>>   media: v4l2-ctrls.h: clarify the p_def argument of v4l2_ctrl_new_std_compound (2020-04-29 12:04:58 +0200)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>   git://linuxtv.org/hverkuil/media_tree.git tags/br-tegra
>>>>
>>>> for you to fetch changes up to 0bba0154ded02babccd59e21c6a27c5ad7d50faf:
>>>>
>>>>   MAINTAINERS: Add Tegra Video driver section (2020-05-05 10:26:05 +0200)
>>>>
>>>> ----------------------------------------------------------------
>>>> Tag branch
>>>>
>>>> ----------------------------------------------------------------
>>>> Sowjanya Komatineni (2):
>>>>       media: tegra: Add Tegra210 Video input driver
>>>>       MAINTAINERS: Add Tegra Video driver section  
>>>
>>>
>>> As pointed by checkpatch:
>>>
>>> 	WARNING: DT compatible string "nvidia,tegra210-csi" appears un-documented -- check ./Documentation/devicetree/bindings/
>>> 	#628: FILE: drivers/staging/media/tegra-video/csi.c:521:
>>> 	+	{ .compatible = "nvidia,tegra210-csi", .data = &tegra210_csi_soc },
>>>
>>> 	WARNING: DT compatible string "nvidia,tegra210-csi" appears un-documented -- check ./Documentation/devicetree/bindings/
>>> 	#3238: FILE: drivers/staging/media/tegra-video/video.c:106:
>>> 	+	{ .compatible = "nvidia,tegra210-csi", },
>>>
>>> and double-checked with:
>>>
>>> 	$ git grep "nvidia,tegra210-csi"
>>> 	drivers/staging/media/tegra-video/csi.c:        { .compatible = "nvidia,tegra210-csi", .data = &tegra210_csi_soc },
>>> 	drivers/staging/media/tegra-video/video.c:      { .compatible = "nvidia,tegra210-csi", },
>>>
>>> The DT specs for this driver are missing. I even checked at linux-next:
>>> there's no DT bindings for this.  
>>
>> Sorry, I should have mentioned this in the cover letter: the binding file
>> is here: https://patchwork.linuxtv.org/patch/63576/
>>
>> But it will be merged via the tegra subsystem (Thierry Reding) since it is
>> part of the display bindings, not media bindings. Also, Thierry was planning
>> to convert it to yaml, so he offered to merge it instead.
> 
> Ok. Please re-send the pull request (or just mark it as New on patchwork) 
> once the bindings arrive linux-next.

It's still marked as New in patchwork :-) (https://patchwork.linuxtv.org/patch/63596/)

> 
> Alternatively, I don't mind if those patches would also be merged via
> Tegra's tree, together with the bindings. On such case, feel free to 
> add, for both patches:
> 
> Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Thierry, let us know what you want to do. It might not be a bad idea to merge
the whole series through your tree, as Mauro suggested. It keeps everything
together.

Regards,

	Hans
