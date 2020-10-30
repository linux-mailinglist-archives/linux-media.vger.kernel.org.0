Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 647762A01B7
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 10:46:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726014AbgJ3Jqy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 05:46:54 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:56509 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725355AbgJ3Jqx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 05:46:53 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id YQzdknX7BWvjMYQzgkGtCr; Fri, 30 Oct 2020 10:46:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1604051211; bh=Pdg2BqSmMwoZQGtV1iF1NAS1Qn9FHQFDjbWGQqM5wEs=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=s28uOHgQMtVsh/PbMfcJboYch0mb5dfZ4lF48s5NIPzrSEk7Rh3UM1DLA56IcyyzI
         eERaxLiB+1UEdyS/IX6M0g+IXuDGQX8sAc3f5cx3GOnObgGFt1J+flwrefc/EuuhWk
         ioVozMuSHDq0ntEH0vANjjCq7WkB+DuVgyKSJosTBGeafFTI/v/3910KLJSBZyCCIf
         /Ui3TXWCRRZcKo4DIAMPt1qB6QRmQRg3xsD9ICvOajIo8Y8WohafKPRfxUZYre2FcM
         +QSIEpsTiGHGr5DBwq2h4dI4s2HmnL3ZwgT81ozfSDLDHMF6bSD/Q7n+NzuFWqb2CV
         stgWBd8p0ukVw==
Subject: Re: [PATCH 2/7] media: platform: add missing put_device() call in
 mtk_jpeg_probe()
To:     Yu Kuai <yukuai3@huawei.com>, rick.chang@mediatek.com,
        bin.liu@mediatek.com, mchehab@kernel.org, matthias.bgg@gmail.com,
        tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
        tfiga@chromium.org, xia.jiang@mediatek.com, jcliang@chromium.org,
        minghsiu.tsai@mediatek.com
Cc:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        yi.zhang@huawei.com
References: <20201009123804.3977562-1-yukuai3@huawei.com>
 <20201009123804.3977562-3-yukuai3@huawei.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <4644b6ca-ecc9-191f-c335-9c6d692ef38c@xs4all.nl>
Date:   Fri, 30 Oct 2020 10:46:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201009123804.3977562-3-yukuai3@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfHRSTXX2tuyjvrOe6szrQWoPECst5NygCfNPSzfWeuxB6owGDckhCYt7ROxCi6fE4GH2b/zI31EQ3ecHOlG/HAsYzCJbkBD++ECkCiZH2wC8ivZ1kvgC
 rFR1Cj+Y4LDNG4b9t2zP6ATQcGnbLn0Y53g+vlHsMUF6uk8n9p1vGsTcBHMwDvTYNUJCWNsobZI39NAfp9iqIrIxWUwOZnPMynjboXd4EucdEppyb10Z6mc9
 ErsFjjDPlgGgliU3ihqUP7zDu1iEtVgbt/tY0GQR9Tm6ppPmf/jazvLYXvi0QIxJNdZrbAtUo+X98xORM3XCJpbQ+icohzGoT9x9PQHX0ga60XkxHJz6+/Pv
 WnIwJVETnBqa6k5zGkcktsz1AS2x7boco9WAO9uioalVYyrjV4uafPdbDYoJrottRlSnwoBrijQJlsyHhDti6gny3CzyyzE/pPSUv4lssas+mOehkW+3upe4
 dmEbMv6IBKX28Hz6tgpfQXP7WoB1bx/Kls5pr5DIjfFx/ZdQl85CmNcb0pRKy+CRnig9aOb7S9IqdwPEQMWixiorejCTjxvmiWL2RQWgEvAVPGs8rvxfdeLA
 fZm+IPtCkMbB6v1NzlN/Xv0VMtvTpS7dMNrDIHyzNKRqpKFZw4Q4eBigQrSnLKizV1pRRB4ZgqatKqymeeP2X92I320AuKDtZQDigqdhiDf8OV91AKif+MzV
 ZcmfD2dAsyfqreuwYbX8mPy/UVRG8aLwOycfJ7i832ZvXPqAs7z+QA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 09/10/2020 14:37, Yu Kuai wrote:
> if mtk_jpeg_clk_init() succeed, mtk_jpeg_probe() doesn't have a
> corresponding put_device(). Thus add put_device() in jump target to fix
> the exception handling for this function implementation.
> 
> Fixes: b2f0d2724ba4 ("[media] vcodec: mediatek: Add Mediatek JPEG Decoder Driver")
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> ---
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> index 106543391c46..f0c412f96d61 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> @@ -1436,6 +1436,7 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
>  	v4l2_device_unregister(&jpeg->v4l2_dev);
>  
>  err_dev_register:
> +	put_device(jpeg->larb);
>  
>  err_clk_init:
>  
> 

This is too confusing since it is not obvious that this is the
counterpart of mtk_jpeg_clk_init. I think it would be much easier
to understand if you add a mtk_jpeg_clk_release() which does this
put_device, and call that new function both here and in mtk_jpeg_remove().

Regards,

	Hans
