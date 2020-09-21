Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 576DE2721AE
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 13:00:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726454AbgIULAS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 07:00:18 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:53312 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726347AbgIULAH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 07:00:07 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08LAx6PW096803;
        Mon, 21 Sep 2020 10:59:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=mizNCetwIsKZgA064lowgkb/h+Rqt5ZeNuJvt1Lw/Qc=;
 b=De0GAbH2NmtT4kjSmbOfXRmbcK0O9EsiFRi3I7mhfvRujwArTig5lMsYA9lZomhpvzV9
 x5jjtyBhMC4O9iAUZfJ7Z6KyHw7TxwfTNjWgMjasC/LLM+B7oLzuANt3uFlILzG/R0Oc
 nPGnVTWjgIqWdBWzWNeS7Xwf3J1wXY95nJWulN6gbUBDNl62ueBZl+PdbrAg5xEfGEh8
 Jsq2N3yqZ/AyCfIdFWkL9nWWTN2VWt9OK5d/Dq1viYsPedKIe8vUnANov4Me0VxsOIMn
 oij6sA/ZVtbDQ5RBUarGf1xVLr7C5/qJEt3jRTTwaEgqgBH4reN/DKj6GgAG7tP8Sy5M 2Q== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 33n9xkmx2f-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 21 Sep 2020 10:59:57 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08LAtK6W139782;
        Mon, 21 Sep 2020 10:59:56 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3030.oracle.com with ESMTP id 33nuwvxuq9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 21 Sep 2020 10:59:56 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 08LAxruR032760;
        Mon, 21 Sep 2020 10:59:54 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 21 Sep 2020 03:59:53 -0700
Date:   Mon, 21 Sep 2020 13:59:45 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Corentin Labbe <clabbe@baylibre.com>
Cc:     gregkh@linuxfoundation.org, laurent.pinchart@skynet.be,
        mchehab@kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH RFT/RFC 37/49] staging: media: zoran: add fallthrough
 keyword
Message-ID: <20200921105945.GC4282@kadam>
References: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
 <1600683624-5863-38-git-send-email-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600683624-5863-38-git-send-email-clabbe@baylibre.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9750 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0 adultscore=0
 bulkscore=0 mlxlogscore=999 phishscore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009210081
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9750 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1011
 mlxlogscore=999 bulkscore=0 mlxscore=0 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009210081
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Sep 21, 2020 at 10:20:12AM +0000, Corentin Labbe wrote:
> This patch adds fallthrough keyword where appropriate.
> 
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> ---
>  drivers/staging/media/zoran/zoran_device.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/staging/media/zoran/zoran_device.c b/drivers/staging/media/zoran/zoran_device.c
> index 9558bafdde7d..7634d94f9359 100644
> --- a/drivers/staging/media/zoran/zoran_device.c
> +++ b/drivers/staging/media/zoran/zoran_device.c
> @@ -268,7 +268,9 @@ static void zr36057_adjust_vfe(struct zoran *zr, enum zoran_codec_mode mode)
>  		btwrite(reg, ZR36057_VFEHCR);
>  		break;
>  	case BUZ_MODE_MOTION_COMPRESS:
> +		fallthrough;
>  	case BUZ_MODE_IDLE:
> +		fallthrough;
>  	default:

Hopefully, we don't need fallthrough labels for empty switch statements
like this?

regards,
dan carpenter

