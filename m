Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84BEE7AA257
	for <lists+linux-media@lfdr.de>; Thu, 21 Sep 2023 23:16:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232348AbjIUVPs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Sep 2023 17:15:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232969AbjIUVPG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Sep 2023 17:15:06 -0400
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B78F15FFE
        for <linux-media@vger.kernel.org>; Thu, 21 Sep 2023 10:09:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695292746; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=IKmv+uVyPDCXNNfztfed3Fdh3fMfPsdovRhi2UDuv4DIVplvp58k1anX0e7CwvOuFo
    7oy+mEST3wE8k2fTR9hDQhhN5P/Z6XjFPO7u+UiNAgO/r7bGcPLfnTSNosfGMjgZlAZR
    5umv6509KxaeOxWyAiLEM9NQJQVf0kihHYH7mhsIuE+fuq13NVVs3Lqsc5nLFr/mj5Us
    JJrXW+NvyE65pguRpMRJNhcayRLfHxhk4EPsuiVvQq5iXfOkfU4HY0usHWQCq9BifzAo
    YTB2HEPEPdP8K86dOuaKl0i04Os10SoaRFpEKiTJVF4IM6gZM/vAjnTPzwwJTL5ciyJz
    UPtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1695292746;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=rxb+23p0XNCAatukZbXt7qOrtjlXcBgXArbK5R9Oq+w=;
    b=creuaXnWw67G+zYhVf36xhaW+FvpD43h3CY8LZrb+najbthbAIwcVEkS2cb7fHS94c
    unzioF7zkpbuoJql7nZHvDmDrCbWYgAwybUVqllycIAGIfKTpdJE2A2d3MknM3fThEaJ
    Hsn01TGbJf2/w7GjcXgVzBIxA66tKynzD1YApjBY+0zEVpw2xJpNJz/7WZ0ytBmFDULr
    RQdrzluWFEz+KFv9RShbkVun0sur9WFljsKwKR2kQVbMbNewxYy50pYc19HsysV2fBtP
    djn4YHf78+Rb0omp6BnCV3D4Av1oEzVlPMRclY4fIVWFA7LJ0Hh03lHo9Z5huZ0+8XHD
    5wZA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1695292746;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=rxb+23p0XNCAatukZbXt7qOrtjlXcBgXArbK5R9Oq+w=;
    b=Z1n1PEsXoDdczX293bzsRFl1SBwKjVZFBPP5AGLjZ0fg8TGuTmRBNU/xNf8+6teOWJ
    UIk+Bb5wPbKf4vBRciGJ5soZaRCtA4vd1MjydL8JdQMX4xy1sdHfWkL8o4PT8iP/gTa1
    KfI3AWX85GHy3d6DjZQAlVxtlFxLHq++NUcLE5cCreIjis37l2MILYbIVPpGpaCFjabH
    gLuL6g2g+IIkPqTKQQQcO2o9QaDyVQkbwh0mMG4V5wRbpKzUuMQWAy8KecHPla9iY4C5
    +113fECcn4U+mccXWp6I41QZHNk6W2lr4BqHrXqFcn4s0BZRtkLyh51QQe/4bZ62PNTQ
    te6w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1695292746;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=rxb+23p0XNCAatukZbXt7qOrtjlXcBgXArbK5R9Oq+w=;
    b=L0S79Wt3io6hM1tzTYpvG2ZY7rszVu4QTL7oN9lxi6MM+ZcxZh7cVN5LM7ER9NYT2H
    7xbAfoxK3QKQK9EHr/CA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBfio0GngadwiA7QoPhxvAQuuD/2u3dWiwq26LKQ=="
Received: from [IPV6:2a02:8109:8980:4474:e40e:6344:a5cd:676b]
    by smtp.strato.de (RZmta 49.8.2 AUTH)
    with ESMTPSA id w03f88z8LAd5Bps
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Thu, 21 Sep 2023 12:39:05 +0200 (CEST)
Message-ID: <5a184393-69de-4820-b411-f8494898634d@xenosoft.de>
Date:   Thu, 21 Sep 2023 12:39:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for v6.6] media: bt8xx: bttv_risc_packed(): remove field
 checks
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Deborah Brouwer <deborahbrouwer3563@gmail.com>,
        mad skateman <madskateman@gmail.com>,
        "R.T.Dickinson" <rtd2@xtra.co.nz>,
        Darren Stevens <darren@stevens-zone.net>
References: <015ad590-979a-4815-b60a-7506c70e9ee7@xs4all.nl>
Content-Language: de-DE
From:   Christian Zigotzky <chzigotzky@xenosoft.de>
In-Reply-To: <015ad590-979a-4815-b60a-7506c70e9ee7@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11 September 2023 at 12:05 pm, Hans Verkuil wrote:
> Do not turn on the vcr_hack based on the btv->field value.
>
> This was a change in the bttv vb2 conversion that caused
> green lines at the bottom of the picture in tvtime.
>
> It was originally added to the vb2 conversion based on
> faulty information that without this there would be glitches
> in the video. However, later tests suggest that this is a
> problem in the utilities used to test this since tvtime
> behaves fine.
>
> This patch reverts the bttv driver to the original pre-vb2
> behavior w.r.t. vcr_hack.
>
> Fixes: b7ec3212a73a ("media: bttv: convert to vb2")
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>   drivers/media/pci/bt8xx/bttv-risc.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/media/pci/bt8xx/bttv-risc.c b/drivers/media/pci/bt8xx/bttv-risc.c
> index 436baf6c8b08..241a696e374a 100644
> --- a/drivers/media/pci/bt8xx/bttv-risc.c
> +++ b/drivers/media/pci/bt8xx/bttv-risc.c
> @@ -68,9 +68,7 @@ bttv_risc_packed(struct bttv *btv, struct btcx_riscmem *risc,
>   	sg = sglist;
>   	for (line = 0; line < store_lines; line++) {
>   		if ((line >= (store_lines - VCR_HACK_LINES)) &&
> -		    (btv->opt_vcr_hack ||
> -		    (V4L2_FIELD_HAS_BOTH(btv->field) ||
> -		     btv->field == V4L2_FIELD_ALTERNATE)))
> +		    btv->opt_vcr_hack)
>   			continue;
>   		while (offset && offset >= sg_dma_len(sg)) {
>   			offset -= sg_dma_len(sg);
It works! Thank you!

Tested-by: Christian Zigotzky <chzigotzky@xenosoft.de>
