Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 598652CD015
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 08:08:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728504AbgLCHHE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 02:07:04 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:40451 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725912AbgLCHHD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Dec 2020 02:07:03 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id kigzkrzzXarN7kih2kqaKK; Thu, 03 Dec 2020 08:06:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1606979181; bh=60r7yuQCVwjeOaZMoxg5FKxRZuzlL40/Na8UfJKaZLM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=b5AVIdE1jrP+BT7KIxEPNqAM9t3voRUhX4h9Epm9P5bTrOQWUr64D/Tr5KUfuyoLZ
         Xs44wOgZ3QFxAcGez62YDhPeP5mNksbToAJtm202fiLx8wxnq80IhD+JKvT6616LK6
         kBGsa+Q5yY9w4rHJKF/joCt60/dUygUMSjWeI9E+FbygqhZwnwulM4aZFNzKoj5bRb
         s42ixqfSg68aQNokgMZgi6giBceYQmoK3ZD5b1mcm4ncP7SzWR2DvlcjPMRPCSfCBg
         ZsXa956H2+3XHUoD9dYY+BgC5W5iEUNL2Hd4qraHQw8D+hbnxDTLzK5lcEyfHaSlu9
         3Mqj2XbiH+pHg==
Subject: Re: [PATCH v3 0/2] media: rcar-vin: Mask access to VNCSI_IFMD
 register
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     koji.matsuoka.xm@renesas.com,
        niklas.soderlund+renesas@ragnatech.se,
        laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20201126074757.2768-1-jacopo+renesas@jmondi.org>
 <20201203075830.2701c8b5@coco.lan>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <de509dc4-c164-18e5-00e6-c4f4d39eeecc@xs4all.nl>
Date:   Thu, 3 Dec 2020 08:06:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201203075830.2701c8b5@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfHgJLC1d62Tuk8XJ8oGMLnTnWfXtk2z9HmoIvLTYSJFhfC07so0FmAx+x2wSdzYScUPYatlmUVKkJANZbNb1D4X7nw5jdTzQZeTZB44pogqTyWJQt7/Z
 044k16EjjgUD52VBRXyFFC2XP65sROdsBA8SUuSJk6d+JaU1ywwyvUyZOCia+iTIhUVPMLKA4fy+zhvwTU6r8lH/hyyrnKTzwUncvTNE+hdDZU5MnO43Qmqa
 A4KcQ1aGFukLQkvGOvMcJ1ImBpQy9K7UQbhNIW2A/UjXipnrvHZBE2PUU/voY+QHGkpmm3MIxhELgHty7R0YTLFmuLbeFBvU9Gvh2oQaxCRtLwrwybXbdD/R
 MPUncZ9cd5JospabDnbRRQPGBccrgf/kK/c3x1yNE1WgpoWzUM77XB79x5VTwrmUX1s+xGdhoqRMyJBotxIyP0LeskA0gGnznwrMDVjqogXiyuTgoNE=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 03/12/2020 07:58, Mauro Carvalho Chehab wrote:
> Em Thu, 26 Nov 2020 08:47:55 +0100
> Jacopo Mondi <jacopo+renesas@jmondi.org> escreveu:
> 
>> As reported in patch 2/2 commit message the the VNCSI_IFMD register
>> has the following limitations according to chip manual revision 2.20
>>
>> - V3M, V3H and E3 do not support the DES1 field has they do not feature
>> a CSI20 receiver.
>> - D3 only supports parallel input, and the whole register shall always
>> be written as 0.
>>
>> This patch upports the BSP change commit f54697394457
>> ("media: rcar-vin: Fix VnCSI_IFMD register access for r8a77990") from
>> Koji Matsuoka
> 
> As checkpatch warned:
> 
> 	-:22: WARNING: Unknown commit id 'f54697394457', maybe rebased or not pulled?
> 	
> There's no such commit upstream. Are you referring to an OOT patch?
> 
> If so, you should provide an URL from where the patch is stored,
> as otherwise this comment won't make any sense upstream.
> 
> If you can't provide such URL, please adjust the comment to provide
> a description that won't be dependent of such OOT commit.

Read the commit message:

>> This patch upports the BSP change commit f54697394457
>> ("media: rcar-vin: Fix VnCSI_IFMD register access for r8a77990") from
>> Koji Matsuoka

This commit is from the rcar BSP package, and does not refer to a kernel
commit. So it is correct that the commit ID is unknown.

Regards,

	Hans

> 
>>
>> Tested on r-car E3 Ebisu.
>>
>> v2 -> v3:
>> - Remove a few comments and add Niklas' tag to [2/2]
>>
>> v1 -> v2:
>> - Inspect the channel routing table to deduce the availability of DES1/DES0
>>   bits as suggested by Niklas.
>>
>> Jacopo Mondi (2):
>>   media: rcar-vin: Remove unused macro
>>   media: rcar-vin: Mask VNCSI_IFMD register
>>
>>  drivers/media/platform/rcar-vin/rcar-dma.c | 26 ++++++++++++++++++----
>>  1 file changed, 22 insertions(+), 4 deletions(-)
>>
>> --
>> 2.29.1
>>
> 
> 
> 
> Thanks,
> Mauro
> 

