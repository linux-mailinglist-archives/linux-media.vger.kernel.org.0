Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5071E1B7389
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2020 14:03:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726945AbgDXMDG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Apr 2020 08:03:06 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:54599 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726289AbgDXMDF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Apr 2020 08:03:05 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id Rx2ojFZSvlKa1Rx2sjNxSJ; Fri, 24 Apr 2020 14:03:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1587729782; bh=1z7Vrb+eIs3Q+QIWDRbo2xCq8jhibPasLV2HTZfVOog=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=ZlyPC9VQ5ff2hpccNwIL2QhGpvr2dS/KqV3UCYEs5HwOVw73ZYjPkdCDG4n2Jdrgq
         ATsCWdw/9lStxO8S5Sc3ioGQ3PzpyvdMFf4PvnuGec+2TqRPVF8YAciwKtttFczqKV
         IDQ9h6kM6GXMU+yJ+rjj4UdVUjnE7Q6+Jm34cj3BHH4LxMja05v19qdIllxQxMNtRL
         l2G7EAACZW813vsCR24MzVSpscHtB0TzDyQBvM5Exz0mGqtQTCjVw53ZC/ViqsxOHE
         HZhsQ5wELmpUztcRvcSAGWZ/E8XTalOINYm1sIOnOBPk9C47NMe5gkvtGpZv2cSp2f
         URUrRbaQXu+fw==
Subject: Re: [RFC PATCH v8 0/9] Add Tegra driver for video capture
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Sowjanya Komatineni <skomatineni@nvidia.com>, jonathanh@nvidia.com,
        frankc@nvidia.com, sakari.ailus@iki.fi, helen.koike@collabora.com,
        digetx@gmail.com, sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1587427874-3291-1-git-send-email-skomatineni@nvidia.com>
 <5c44beca-4016-6e4f-01bb-e38480bfc34b@xs4all.nl>
 <20200421205032.GD3233341@ulmo>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <928b9b1d-b977-a281-ef5e-128b63cce94d@xs4all.nl>
Date:   Fri, 24 Apr 2020 14:02:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200421205032.GD3233341@ulmo>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfP+I527Xj1o8On5xKP38GN60mxeh+SBcy8NpFGiniFnxzqcNuMRssBXZQ/3IFDm8ELdGAvqMJwNuXTa2TgFqYUsmAGImzoFCWE31tTkgvLJlZBuHwgHc
 bkpO1sgMKy2zn7y+/vBB7xIlaoflcV0TWxp6+mM6QKt4NsRXEB/MeZOzLYGE4HQhr6q7xMglkgXoP90WTwRfHJOiX4ELUxt/AYqXnysyZioKG2lOaLIwbpL8
 9Hl5ZYpVPujJxNp8fZlp/XFoQXFshrR3Wxps6eVozgTEZC1R706ccn36TP8zP4RuR8bi/RhJYdrW2VRDvySLijyiuaBYXxDd3xKdllZfdorpenBkljEjWiQp
 WOXgNvKKpI5ICo2NAfE81tD3qQTbK9HkQpjVAkY2GNOb8pJyEof5L+ph9Iwc2nQhyIYCuYunrILeO3ZoaluXoBX9MY3BX9h2EKgrRyo1eQohRPvURjL/4Ni6
 tN6ifmNYX4gpw9Ahf2EMfpyE7LCoXW7OVmkyJNouyRxZ24p9wMPIgTF241u2Pd1YrdGYdgtwMVedZnowURRMGZjitpS9fXOxnVm5rhnfQDDF7LJVLFk1ajUS
 7Yg=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Thierry,

On 21/04/2020 22:50, Thierry Reding wrote:
> On Tue, Apr 21, 2020 at 01:09:50PM +0200, Hans Verkuil wrote:
>> Hi Sowjanya,
>>
>> On 21/04/2020 02:11, Sowjanya Komatineni wrote:
>>> This series adds Tegra210 VI and CSI driver for built-in test pattern
>>> generator (TPG) capture.
>>>
>>> Tegra210 supports max 6 channels on VI and 6 ports on CSI where each
>>> CSI port is one-to-one mapped to VI channel for video capture.
>>>
>>> This series has TPG support only where it creates hard media links
>>> between CSI subdevice and VI video device without device graphs.
>>>
>>> v4l2-compliance results are available below the patch diff.
>>
>> I'm ready to merge this v8. Looking at the series I should only merge
>> patches 6 and 7, all other patches go through different subsystems, right?
> 
> You could also pick up patch 5 because it adds the bindings that are
> implemented by the driver in patch 6. But I can also pick that up into
> the Tegra tree. In fact, I do have a set of patches to convert some
> Tegra bindings to the new json-schema format and the host1x file is
> among them. If I do get around to finish those up for v5.8 it might be
> better for me to pick up patch 5 so that I can base my conversion patch
> on top of that.
> 
> Either way is fine with me, so I've acked the three patches. Take which
> ones you want and I'll pick up the rest.

I've decided to take only patches 6 and 7. Just let me know if for some
reason you want me to merge patch 5 as well, but I think it makes more
sense if you pick that one up.

> 
> Thanks again for your guidance on this patch set!

My pleasure, and it's nice to see this driver going in. Looking forward
to the next phase when sensor support is added!

Regards,

	Hans
