Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 675229C6FE
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2019 03:32:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726254AbfHZBcC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 25 Aug 2019 21:32:02 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:40985 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726215AbfHZBcC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 25 Aug 2019 21:32:02 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 9612039E;
        Sun, 25 Aug 2019 21:32:00 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute4.internal (MEProxy); Sun, 25 Aug 2019 21:32:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm3; bh=GQy9HXGKBleVZguowV/+z3W+P9jSPkD
        lUZyUbUOI3MQ=; b=ArrOsJbq1b1aUx1WRMwKSoeZtJW1HmVpiiDf6P773HnPNyS
        cnXrvx7M0QFUG591al+NS4RD/jyl/I15ZbAqIoFdvlsSXh8Lw5GUVM3BsXSuAuI8
        h1PI0zhNozJHSAhyy2cZkYWY1hOHYg5OyvMpM5/973YxNEEcxKDoe5hndNL3o4Tw
        nmJk8nPfJgJNNH0EusawWmmgSa3OuinCzIje7N2bmaM2QTxjKSC9Fh1Tumg+klQC
        Bib1Sqr6NAJ34bS5wA8HPMkQZhoUwhl5Uew7zz7DAYDOfcelxCENwAUYu2j+vXWu
        pIyjeowXHJIIXBaERukCSUolZEUTofhpvTZ/FsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=GQy9HX
        GKBleVZguowV/+z3W+P9jSPkDlUZyUbUOI3MQ=; b=AbT9WAIJKJpiYR/fWC3eiD
        FFNskaxsxJXacirhFwmeANOQ11K0HyoO5UslpymcdnFd7AjXt3qr/pn+YsBNKht9
        O0Nzh184cFZ0GWGLbWXh2lXTGW47LuJhwiG4dXJB02LBxiPK+FMOBF0bapeqLCqr
        iRmvbgis5Dm/gvjEYqA1+jiAcdhxtaLhZm7hawvepZCbczZQfsOjbhXfRwmJ9wDx
        WDvtPFkjKyoAz5LEvNb29dUTrlGTigtf1ZGIzueMeLBnpzHFJcc07okjUlCmgvHC
        BrC0Vc0lmx2UAf/FcmPYdA64/exI6MdRPeoOPgbtQWIDYITv4YjzBGOVlvqpN9TA
        ==
X-ME-Sender: <xms:jjZjXQaQoAKLZtRZpOcz71-Kz-rmHzSd8kA4Oc3-FFk4-Q_wlBTb9Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudehfedggeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
    rhfuihiivgeptd
X-ME-Proxy: <xmx:jjZjXRYuTTIg_vp0l4bq8Fy1NHLyytS7OiQwPF0RqdIURjRdtYMw4g>
    <xmx:jjZjXVzMTOb6vHjfuvx0tEvjjNF9ZZDq5PVz8aiq8oGmKO3y0frygQ>
    <xmx:jjZjXde7j_0jZdm--XMEXaGE4gEU0H9DbQIyUZsGLLNPq2zv0GEWtQ>
    <xmx:kDZjXfKz5t6OblkKf3AJy3PvdFtm26e1vjvP1qD1_Vl9JYX85c_HlQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 5EA86E00A3; Sun, 25 Aug 2019 21:31:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-916-g49fca03-fmstable-20190821v7
Mime-Version: 1.0
Message-Id: <588f6cbd-b6ca-4f43-8034-80956ee56bb8@www.fastmail.com>
In-Reply-To: <20190823212957.26043-1-jae.hyun.yoo@linux.intel.com>
References: <20190823212957.26043-1-jae.hyun.yoo@linux.intel.com>
Date:   Mon, 26 Aug 2019 11:02:19 +0930
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Jae Hyun Yoo" <jae.hyun.yoo@linux.intel.com>,
        "Eddie James" <eajames@linux.ibm.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        "Joel Stanley" <joel@jms.id.au>,
        "Benjamin Herrenschmidt" <benh@kernel.crashing.org>
Cc:     linux-aspeed@lists.ozlabs.org, linux-media@vger.kernel.org,
        openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH]_media:_aspeed:_fix_an_incorrect_return_code_on_buf?=
 =?UTF-8?Q?fer_allocation_failure?=
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On Sat, 24 Aug 2019, at 07:00, Jae Hyun Yoo wrote:
> It returns '0' even when a failure happens on jpeg buffer allocation
> so this commit fixes the issue.
> 
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  drivers/media/platform/aspeed-video.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/aspeed-video.c 
> b/drivers/media/platform/aspeed-video.c
> index f899ac3b4a61..94f97d96dabc 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -1624,6 +1624,7 @@ static int aspeed_video_init(struct aspeed_video 
> *video)
>  	if (!aspeed_video_alloc_buf(video, &video->jpeg,
>  				    VE_JPEG_HEADER_SIZE)) {
>  		dev_err(dev, "Failed to allocate DMA for JPEG header\n");
> +		rc = -ENOMEM;
>  		goto err_release_reserved_mem;
>  	}
>  
> -- 
> 2.7.4
> 
>
