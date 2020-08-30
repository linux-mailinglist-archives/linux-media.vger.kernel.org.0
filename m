Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF1FD256CD0
	for <lists+linux-media@lfdr.de>; Sun, 30 Aug 2020 10:31:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726284AbgH3Iam (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 30 Aug 2020 04:30:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726078AbgH3Ial (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 30 Aug 2020 04:30:41 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BCA6C061573;
        Sun, 30 Aug 2020 01:30:41 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id DFD70C63F6; Sun, 30 Aug 2020 09:30:36 +0100 (BST)
Date:   Sun, 30 Aug 2020 09:30:36 +0100
From:   Sean Young <sean@mess.org>
To:     Jia-Ju Bai <baijiaju@tsinghua.edu.cn>
Cc:     mchehab@kernel.org, pavel@ucw.cz, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: pci: ttpci: av7110: avoid compiler optimization
 of reading data[0] in debiirq()
Message-ID: <20200830083036.GA17715@gofer.mess.org>
References: <20200830082042.17462-1-baijiaju@tsinghua.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200830082042.17462-1-baijiaju@tsinghua.edu.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Aug 30, 2020 at 04:20:42PM +0800, Jia-Ju Bai wrote:
> In debiirq(), data_0 stores the value of data[0], but it can be dropped
> by compiler optimization. Thus, data[0] is read through READ_ONCE().
> 
> Fixes: 6499a0db9b0f ("media: pci: ttpci: av7110: fix possible buffer overflow caused by bad DMA value in debiirq()")
> Reported-by: Pavel Machek <pavel@ucw.cz>

Pavel reported that your patch was garbage, if you are trying to defend
against a malicious pci device. READ_ONCE() will not help here.

Sean

> Signed-off-by: Jia-Ju Bai <baijiaju@tsinghua.edu.cn>
> ---
>  drivers/media/pci/ttpci/av7110.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/pci/ttpci/av7110.c b/drivers/media/pci/ttpci/av7110.c
> index bf36b1e22b63..f7d098d5b198 100644
> --- a/drivers/media/pci/ttpci/av7110.c
> +++ b/drivers/media/pci/ttpci/av7110.c
> @@ -406,7 +406,7 @@ static void debiirq(unsigned long cookie)
>  	case DATA_CI_GET:
>  	{
>  		u8 *data = av7110->debi_virt;
> -		u8 data_0 = data[0];
> +		u8 data_0 = READ_ONCE(data[0]);
>  
>  		if (data_0 < 2 && data[2] == 0xff) {
>  			int flags = 0;
> -- 
> 2.17.1
