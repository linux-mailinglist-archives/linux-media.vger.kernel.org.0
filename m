Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86D2B3AAB23
	for <lists+linux-media@lfdr.de>; Thu, 17 Jun 2021 07:37:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229816AbhFQFju (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 01:39:50 -0400
Received: from out28-97.mail.aliyun.com ([115.124.28.97]:44052 "EHLO
        out28-97.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229580AbhFQFjt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 01:39:49 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.09836061|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0163458-0.00116024-0.982494;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047204;MF=yong.deng@magewell.com;NM=1;PH=DS;RN=11;RT=11;SR=0;TI=SMTPD_---.KTblfs9_1623908259;
Received: from localhost(mailfrom:yong.deng@magewell.com fp:SMTPD_---.KTblfs9_1623908259)
          by smtp.aliyun-inc.com(10.194.98.226);
          Thu, 17 Jun 2021 13:37:40 +0800
Date:   Thu, 17 Jun 2021 13:37:40 +0800
From:   yong <yong.deng@magewell.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 04/11] media: sun6i-csi: add a missing return code
Message-ID: <20210617133740.00004d0a@magewell.com>
In-Reply-To: <525bad50008338d96fb71e724675061ffa07ff87.1623846327.git.mchehab+huawei@kernel.org>
References: <cover.1623846327.git.mchehab+huawei@kernel.org>
 <525bad50008338d96fb71e724675061ffa07ff87.1623846327.git.mchehab+huawei@kernel.org>
Organization: Nanjing Magewell Electronics Co., Ltd.
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

It does not mean there is a error. As the comment, it just check if the
csi is powered.

On Wed, 16 Jun 2021 14:28:30 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> As pointed by smatch, there's a missing return code:
> 
> 	drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c:485
> sun6i_video_open() warn: missing error code 'ret'
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
> b/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c index
> 3181d0781b61..07b2161392d2 100644 ---
> a/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c +++
> b/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c @@ -481,8
> +481,10 @@ static int sun6i_video_open(struct file *file) goto
> fh_release; 
>  	/* check if already powered */
> -	if (!v4l2_fh_is_singular_file(file))
> +	if (!v4l2_fh_is_singular_file(file)) {
> +		ret = -EBUSY;
>  		goto unlock;
> +	}
>  
>  	ret = sun6i_csi_set_power(video->csi, true);
>  	if (ret < 0)

Thanks
