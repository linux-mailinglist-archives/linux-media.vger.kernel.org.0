Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04F4824B970
	for <lists+linux-media@lfdr.de>; Thu, 20 Aug 2020 13:47:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728936AbgHTLqn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 07:46:43 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:60631 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730591AbgHTLpG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 07:45:06 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 8izskGuNMywL58iztkZUl0; Thu, 20 Aug 2020 13:44:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1597923886; bh=IocCpV9atTxbqpgpHngbBHta2la2malhBL6QLL+KbMw=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=wXZYynsoXGQzHJRmmozOkGf/EqZdtHoUtsr/ExG3gSyNAJPQVlg01223NpYMx/2p0
         cym8co0f5yoFT/4yOUylgHG2WF9mlmjV4f1w5EQtJ56IhRL12hAaLZS3hG/FQZ3nLa
         Ee+qFiJHupmdw5mOphHbm9kP7JVFsZAZdcIExqXQfEdHRSfE4Vz1Cl9sKQq6NJh4Gb
         qdDsQ3Vw92+qjPV3rcN4kiY+1s7L+uysFgsLNUYTteqssRmo8jJLOZTiMplpaCNvlG
         0x4iPQD65oKwFPRjouCSjJxFl1vDSyHcWq5szCK8Xk7JhLB2OVqIP4aJLcUd4fl/py
         ORheinfat+Vvw==
Subject: Re: [PATCH v2] media: pvrusb2: fix parsing error
To:     Tong Zhang <ztong0001@gmail.com>, isely@pobox.com,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <75b8354b-362a-0215-8038-45bd68be7de5@xs4all.nl>
 <20200819212523.113973-1-ztong0001@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <aed971ed-bd8e-eaed-b2ee-80e9654f24cd@xs4all.nl>
Date:   Thu, 20 Aug 2020 13:44:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200819212523.113973-1-ztong0001@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfEhHaZWDaOurX1cn4LmZC0i1t/di2YlunFK+pliQZuPYrCIYyh5ho6JV7mVCMF7Hwd7EZK32MbBPIliMkHjTo1MIgVGORYFeOeMHXAIMg9Vc7BDXuCDj
 wAKOXUKbVDy9n7GO563eeDiQPU+EMFrd0BmsKGelRh0CZkeseQp/puARcYrNSsAxiGTwNzbyy3izpTpWPpp1SQYfZqH/tO5J5J9ngvKGX4SEOIResnWVu435
 SSUnVdy7alHFz2IqYHaDrgaXLO05Bno4a4Sy8Tibzme7zqSOOMhyb//jLURi5iPy5lXpeCDhH3nR8m7cPX3JkMjQngqcvuAwmZzJwHYGulDC5P9Vohksa84d
 M714J3ygzEM6tgdCHA9MU0cdZLtZWaUL5Lg6FjIE5pp1IcrZF34=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 19/08/2020 23:25, Tong Zhang wrote:
> pvr2_std_str_to_id() returns 0 on failure and 1 on success,
> however the caller is checking failure case using <0
> 
> Co-developed-by: Hans Verkuil<hverkuil@xs4all.nl>
> Signed-off-by: Tong Zhang <ztong0001@gmail.com>
> ---
> 
> v2: return -EINVAL as suggested by Hans Verkuil<hverkuil@xs4all.nl>.
> I also rebased the code on v5.9-rc1.
> 
>  drivers/media/usb/pvrusb2/pvrusb2-hdw.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
> index 1cfb7cf64131..6a444cb27e31 100644
> --- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
> +++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
> @@ -866,8 +866,8 @@ static int ctrl_std_sym_to_val(struct pvr2_ctrl *cptr,
>  {
>  	int ret;

This is no longer used, so can be removed.

And if I compile this patch I get this warning:

drivers/media/usb/pvrusb2/pvrusb2-hdw.c: In function ‘ctrl_std_sym_to_val’:
drivers/media/usb/pvrusb2/pvrusb2-hdw.c:867:6: warning: unused variable ‘ret’ [-Wunused-variable]
  867 |  int ret;
      |      ^~~

Always compile-test before posting a patch :-)

Regards,

	Hans

>  	v4l2_std_id id;
> -	ret = pvr2_std_str_to_id(&id,bufPtr,bufSize);
> -	if (ret < 0) return ret;
> +	if (!pvr2_std_str_to_id(&id, bufPtr, bufSize))
> +		return -EINVAL;
>  	if (mskp) *mskp = id;
>  	if (valp) *valp = id;
>  	return 0;
> 

