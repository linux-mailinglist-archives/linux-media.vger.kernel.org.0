Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7C8625298F
	for <lists+linux-media@lfdr.de>; Wed, 26 Aug 2020 10:56:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727877AbgHZI4W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Aug 2020 04:56:22 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:49603 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727793AbgHZI4V (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Aug 2020 04:56:21 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id ArE6khYrcuuXOArE7kCRkV; Wed, 26 Aug 2020 10:56:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1598432179; bh=x6wKwund8vujBlhYWtYze2X1CVI6otF0Q+licNXwwb8=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=AWHVY5joI3rLmfvY+he9RnN7WxUDyVCxvwc6lQ+96pXBUmMY9IdHTb5oG8xUADAdV
         jQJcVt6hKdltk0q++A0f09QOWR6iKGibc5uw2YNGPFlBqFrxbaMW33HUTotIcOwmiH
         HGN2b16RPBboxulvYvqiLHpuwbDhRgccBEHyenj7X9Ns5Ye/m+CUciE9Z56SEV0LZF
         tUcGEacLK9JbKP90dM8vvEtdVlzEyrNVEpYefYUayGrJud0L2zNTad/RoFjU3223PP
         XMISGefPErEsJw4/R0txQvM0U5Xq6HH2oc9KpWr0XmPZXTeHnaRO5R2ntxP1AWip9R
         +8h90xYbUZVhg==
Subject: Re: [PATCH] media: mx2_emmaprp: Fix memleak in emmaprp_probe
To:     Dinghao Liu <dinghao.liu@zju.edu.cn>, kjlu@umn.edu
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200825093934.10585-1-dinghao.liu@zju.edu.cn>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <72bb447e-f888-6182-7328-316551b50a24@xs4all.nl>
Date:   Wed, 26 Aug 2020 10:56:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200825093934.10585-1-dinghao.liu@zju.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJ5RARcUHhzsVzGmvj/f1Gqc3Fu41xhhPBTY3whx6BG8llK5IpZZE2He612Ufopi80lRPjRXyC50G6Hg2WWSjT8UnydeFP0DsFg5sGD2/gRyJaY7/X2K
 9BFZINId72aj6bOAcqnMAG362l9ndHZv4U4wbT3vMheSRifIb7hIV3fwbvLZaGDhv2dtdoDK2K3HtS2SKIx14+IARPPTZOCtky955cdedDeoVMp8qOQFx5uS
 Nxunox7IPLNFDVGbn89Epa8jhRkS0fCsFy8fDQYtHs0ZjmkLFzah2d7K6wn0I5C/m9Aizb0isGkhkiuV73STs8xDN0iTzpv2Td4eIrmxYv8pPlqyJ0W1RrG1
 cAfrpV19CN1P4mRRHby1pJCOV/oYRCoTHgKQHEX9tcpmo6MYqFMTHZbu7z1OL3clgCeWNDB5T/me3vlp4dYAJa0Vt0Rp+Q==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 25/08/2020 11:39, Dinghao Liu wrote:
> When platform_get_irq() fails, we should release
> vfd and unregister pcdev->v4l2_dev just like the
> subsequent error paths.
> 
> Fixes: d4e192cc44914 ("media: mx2_emmaprp: Check for platform_get_irq() error")
> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> ---
>  drivers/media/platform/mx2_emmaprp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/mx2_emmaprp.c b/drivers/media/platform/mx2_emmaprp.c
> index df78df59da45..2fd31ed86005 100644
> --- a/drivers/media/platform/mx2_emmaprp.c
> +++ b/drivers/media/platform/mx2_emmaprp.c
> @@ -853,7 +853,7 @@ static int emmaprp_probe(struct platform_device *pdev)
>  
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq < 0)
> -		return irq;
> +		goto rel_vdev;

You need to add 'ret = irq;' here, otherwise the platform_get_irq error code
is not correctly propagated.

Looks good otherwise.

Regards,

	Hans

>  	ret = devm_request_irq(&pdev->dev, irq, emmaprp_irq, 0,
>  			       dev_name(&pdev->dev), pcdev);
>  	if (ret)
> 

