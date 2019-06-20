Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39D354CBA1
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2019 12:17:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726635AbfFTKRv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jun 2019 06:17:51 -0400
Received: from retiisi.org.uk ([95.216.213.190]:37036 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726081AbfFTKRu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jun 2019 06:17:50 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id CBB81634C7B;
        Thu, 20 Jun 2019 13:17:17 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.89)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1hdu85-0002Az-Qx; Thu, 20 Jun 2019 13:17:17 +0300
Date:   Thu, 20 Jun 2019 13:17:17 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Robert Jarzmik <robert.jarzmik@free.fr>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: mt9m111: fix fw-node refactoring
Message-ID: <20190620101717.7h2hczachuk2rjr6@valkosipuli.retiisi.org.uk>
References: <20190603200155.24358-1-robert.jarzmik@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190603200155.24358-1-robert.jarzmik@free.fr>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Robert,

On Mon, Jun 03, 2019 at 10:01:55PM +0200, Robert Jarzmik wrote:
> In the patch refactoring the fw-node, the mt9m111 was broken for all
> platform_data based platforms, which were the first aim of this
> driver. Only the devicetree platform are still functional, probably
> because the testing was done on these.
> 
> The result is that -EINVAL is systematically return for such platforms,
> what this patch fixes.
> 
> Fixes: 98480d65c48c ("media: mt9m111: allow to setup pixclk polarity")
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
> ---
>  drivers/media/i2c/mt9m111.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9m111.c b/drivers/media/i2c/mt9m111.c
> index 168a5c74f368..d65c23301498 100644
> --- a/drivers/media/i2c/mt9m111.c
> +++ b/drivers/media/i2c/mt9m111.c
> @@ -1209,7 +1209,7 @@ static int mt9m111_probe(struct i2c_client *client,
>  {
>  	struct mt9m111 *mt9m111;
>  	struct i2c_adapter *adapter = to_i2c_adapter(client->dev.parent);
> -	int ret;
> +	int ret = 0;
>  
>  	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_WORD_DATA)) {
>  		dev_warn(&adapter->dev,
> @@ -1221,7 +1221,8 @@ static int mt9m111_probe(struct i2c_client *client,
>  	if (!mt9m111)
>  		return -ENOMEM;
>  
> -	ret = mt9m111_probe_fw(client, mt9m111);
> +	if (client->dev.of_node)
> +		ret = mt9m111_probe_fw(client, mt9m111);
>  	if (ret)
>  		return ret;
>  

This didn't quite apply with the i2c adapter cleanups. I applied it,
reworking the ret check, and the patch became:

diff --git a/drivers/media/i2c/mt9m111.c b/drivers/media/i2c/mt9m111.c
index bd3a51c3b081..9761a6105407 100644
--- a/drivers/media/i2c/mt9m111.c
+++ b/drivers/media/i2c/mt9m111.c
@@ -1263,9 +1263,11 @@ static int mt9m111_probe(struct i2c_client *client,
 	if (!mt9m111)
 		return -ENOMEM;
 
-	ret = mt9m111_probe_fw(client, mt9m111);
-	if (ret)
-		return ret;
+	if (dev_fwnode(client->dev)) {
+		ret = mt9m111_probe_fw(client, mt9m111);
+		if (ret)
+			return ret;
+	}
 
 	mt9m111->clk = v4l2_clk_get(&client->dev, "mclk");
 	if (IS_ERR(mt9m111->clk))

I hope this is fine.

-- 
Kind regards,

Sakari Ailus
