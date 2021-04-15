Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8841E360B64
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 16:04:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233431AbhDOOFJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Apr 2021 10:05:09 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:46207 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233428AbhDOOFI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Apr 2021 10:05:08 -0400
Received: from [192.168.2.10] ([84.202.3.209])
        by smtp.xs4all.nl with ESMTPA
        id X2bnl3mgIsMyaX2bqlUPit; Thu, 15 Apr 2021 16:04:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1618495483; bh=KzRZVFNb/tVjZ4zVD8dN9LPR+RtfZo+UyOgJpDh0Z4s=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=TDecdCDCnvBoJTXlUHSwQF8Md5dtl6+yBQGGnhr5XIoX9KijaCJnxt9TrGkZiekpj
         eBiEXJMoTZPsS6be4+fI+xZPF6lBXLtU0bMDYJA5wTwvHvHCfnsy7PXwZxBOjGiPiu
         juPf0rMUJ7fWyjS8d/g1OwEBR8sngKtx4a55bvEi5/M7zu8dZR7PNq0Tn5XnE95XBZ
         uPGqNXzgdPK0YNG+LhEio2CQqDBca40WoJQ2IjCLD1Ps/RQ1QyEz69gM7QctVuxM1u
         wHFT6vURMtdVZo9edRhdNV6FGRGtdUDIX+s4ZU729IzPnBQvw+GrNgm6Km2CXfEepi
         818TJWQtd2zoA==
Subject: Re: [PATCH] staging: media: tegra-video: Align line break to match
 with the open parenthesis in file vi.c
To:     Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
References: <20210414130939.GA15290@focaruja>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <72418471-9cd9-e271-e125-3196ff589891@xs4all.nl>
Date:   Thu, 15 Apr 2021 16:04:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210414130939.GA15290@focaruja>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfO+qT6QUSM93GsLUJm9b5upqI50NiYAuIw6wYQFkThBjMjREGCEovLzuZoCyvenBZwSjvIvFDDYW7nBu5t947gzu89ScMktX/5dgZWcF0re6VWYHh1II
 YG5YEXGqHOpcRvg0RrlLgO2xaZIYnCPkcazYplsdBCrE0F4NPBeBTWLt/K2zqDOkVWPrNyNVIPKQnvr3llObyKUm6umX5vS15SoYT65olJSAmcOzBfgH3Bqa
 dZILwEJIKuOLLQZ1/zGfjCLldcAAHsIBR6kCA5b78Y0Y0kIv0WH0EH8zTrep+MucdNV2Nop8HJpK597kIbAznJabRoy14KyqbjQTGew4GxzlLIyrsVnXMZXL
 Jbio8qF1plTUK6RWIkYR47DuvXLmV65cBOVyI6Phla5+Ac3Y4zF/a1FIFy2grdZ8erBCgQeez9AJLIUPGfSiNCHqsFzkcHXgmemkhZUvAykuvmaSz7ecQF9/
 gZKe2cRlzY84a0zY5miuS6N2WTtXimapfues0oURDOZ7C5eeZvBwW0vJQOXjZDIQD6EUdr8yy8BkhxcJ
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/04/2021 15:09, Aline Santana Cordeiro wrote:
> Align line break to match with the open parenthesis.
> Issue detected by checkpatch.pl.
> 
> Signed-off-by: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
> ---
>  drivers/staging/media/tegra-video/vi.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
> index 7a09061c..9878d1e 100644
> --- a/drivers/staging/media/tegra-video/vi.c
> +++ b/drivers/staging/media/tegra-video/vi.c
> @@ -1813,7 +1813,8 @@ static int tegra_vi_graph_parse_one(struct tegra_vi_channel *chan,
>  		}
>  
>  		tvge = v4l2_async_notifier_add_fwnode_subdev(&chan->notifier,
> -				remote, struct tegra_vi_graph_entity);
> +							     remote,

Add this line to the previous line. That looks a bit better and is one line
shorter.

Regards,

	Hans

> +							     struct tegra_vi_graph_entity);
>  		if (IS_ERR(tvge)) {
>  			ret = PTR_ERR(tvge);
>  			dev_err(vi->dev,
> 

