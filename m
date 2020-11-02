Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 176792A2DDD
	for <lists+linux-media@lfdr.de>; Mon,  2 Nov 2020 16:15:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726088AbgKBPP3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Nov 2020 10:15:29 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:50480 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725837AbgKBPP2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Nov 2020 10:15:28 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0A2F5Li5129914;
        Mon, 2 Nov 2020 15:14:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=hTYcM0obKnaui2L4hZ/lo0xFq2RXiRhO5eYQuYeRYSU=;
 b=agZD/ae7S4rQzhUBGcACX6IF/DFi67T5iCFByOQgmMUwBq6JFPsoIUzbkORyrbMO4r8K
 T4hHKn+m4KdbCe2QqZY3IjXWKHtRZmMGImFEIfMRAtiQxsuJAuuPQstcALb7pJdAtbR8
 OqTrspu9tIdC5b1XnNw6JT2EX+CbBoxUHoVoaOIX20e019VhnN9W4/YpYZpEifBON213
 k4Ok1a3wtKmZU9a125aOND1W9rUvN1dbo+Ezd1IH3nSG7ZMAuapi93yMtO1hNZEhP+0U
 pT9A+yX56h4cr8llEbUC6mcY0L19eBBohXD02JftdPNQyzklDygI/32cDQT/3ze16keH 2g== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 34hhvc4cm0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 02 Nov 2020 15:14:53 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0A2F6QKr052723;
        Mon, 2 Nov 2020 15:12:52 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 34hw0f6bpm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 02 Nov 2020 15:12:52 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0A2FCkBb001606;
        Mon, 2 Nov 2020 15:12:47 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 02 Nov 2020 07:12:43 -0800
Date:   Mon, 2 Nov 2020 18:12:36 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Zhang Qilong <zhangqilong3@huawei.com>, devel@driverdev.osuosl.org,
        gregkh@linuxfoundation.org, paul.kocialkowski@bootlin.com,
        wens@csie.org, mchehab@kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH -next] media: cedrus: fix reference leak in
 cedrus_start_streaming
Message-ID: <20201102151236.GD12347@kadam>
References: <20201102142622.140001-1-zhangqilong3@huawei.com>
 <20201102141838.7oicqkeqy7vy3ki3@gilmour.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201102141838.7oicqkeqy7vy3ki3@gilmour.lan>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9792 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 adultscore=0 bulkscore=0
 mlxscore=0 suspectscore=0 spamscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011020121
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9792 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=999
 bulkscore=0 phishscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011020121
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 02, 2020 at 03:18:38PM +0100, Maxime Ripard wrote:
> On Mon, Nov 02, 2020 at 10:26:22PM +0800, Zhang Qilong wrote:
> > pm_runtime_get_sync will increment pm usage counter even it
> > failed. Forgetting to pm_runtime_put_noidle will result in
> > reference leak in cedrus_start_streaming. We should fix it.
> > 
> > Fixes: d5aecd289babf ("media: cedrus: Implement runtime PM")
> > Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> 
> Shouldn't we fix pm_runtime_get_sync instead then? It seems that most of
> the callers get this wrong, and that's definitely non-obvious.
> 
> Maxime

The other bug that people run into is that pm_runtime_get_sync() can
return 1 on success.

drivers/spi/spi-img-spfi.c:734 img_spfi_resume() warn: pm_runtime_get_sync() also returns 1 on success
drivers/mfd/arizona-core.c:49 arizona_clk32k_enable() warn: pm_runtime_get_sync() also returns 1 on success
drivers/usb/dwc3/dwc3-pci.c:212 dwc3_pci_resume_work() warn: pm_runtime_get_sync() also returns 1 on success
drivers/input/keyboard/omap4-keypad.c:279 omap4_keypad_probe() warn: pm_runtime_get_sync() also returns 1 on success
drivers/gpu/drm/vc4/vc4_dsi.c:839 vc4_dsi_encoder_enable() warn: pm_runtime_get_sync() also returns 1 on success
drivers/gpu/drm/i915/selftests/mock_gem_device.c:157 mock_gem_device() warn: 'pm_runtime_get_sync(&pdev->dev)' returns positive and negative
drivers/watchdog/rti_wdt.c:230 rti_wdt_probe() warn: pm_runtime_get_sync() also returns 1 on success
drivers/media/platform/exynos4-is/mipi-csis.c:513 s5pcsis_s_stream() warn: pm_runtime_get_sync() also returns 1 on success
drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c:89 mtk_vcodec_dec_pw_on() warn: pm_runtime_get_sync() also returns 1 on success
drivers/media/platform/ti-vpe/cal.c:794 cal_probe() warn: pm_runtime_get_sync() also returns 1 on success
drivers/media/platform/ti-vpe/vpe.c:2478 vpe_runtime_get() warn: pm_runtime_get_sync() also returns 1 on success
drivers/media/i2c/smiapp/smiapp-core.c:1529 smiapp_pm_get_init() warn: pm_runtime_get_sync() also returns 1 on success

I don't really understand the point of incrementing the counter on
failure well enough to write a check for this...

regards,
dan carpenter
