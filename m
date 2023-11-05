Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62A9F7E13F5
	for <lists+linux-media@lfdr.de>; Sun,  5 Nov 2023 15:49:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230048AbjKEOtO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 5 Nov 2023 09:49:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbjKEOtM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 5 Nov 2023 09:49:12 -0500
X-Greylist: delayed 344 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 05 Nov 2023 06:49:09 PST
Received: from mx.kolabnow.com (mx.kolabnow.com [212.103.80.154])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35D56C6
        for <linux-media@vger.kernel.org>; Sun,  5 Nov 2023 06:49:09 -0800 (PST)
Received: from localhost (unknown [127.0.0.1])
        by mx.kolabnow.com (Postfix) with ESMTP id B567B300D3C3;
        Sun,  5 Nov 2023 15:43:22 +0100 (CET)
Authentication-Results: ext-mx-out013.mykolab.com (amavis);
 dkim=pass (4096-bit key) reason="pass (just generated, assumed good)"
 header.d=kolabnow.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
        content-transfer-encoding:content-type:content-type:in-reply-to
        :from:from:content-language:references:subject:subject
        :mime-version:date:date:message-id:received:received:received;
         s=dkim20160331; t=1699195401; x=1701009802; bh=7P9axsPQX2jakGQA
        VdPSGFY02OuqAq/xbAw9QzlIumI=; b=yuCrVAKq4K5C2ghKogTQRM4H8nl0hdBX
        m0msy+LlNCL1GTmWjTGcdSvdd6WaX8w7D7tPU4aUODTxbD+/zlKd5rLElrM585s9
        AMDaotW/xxqSKIBsOErhG4vxDgmeSniXNQFK0bDTwSYy62dkZixrXFbbgKvSwgnF
        AEviPDV7JajI6gfPYSPMBGlJ7dyr9CbsIBFknd86VqR5XWyTZSIhTlTOQIzzsACp
        YLhfUs/jgPdre8uRI6HiHkkwnXwEAJo0qe2Dj4Cyu6Glgm5AzpwmL/+x4zIgMj/u
        r2ukuc7gw09eMC1QgW+T5udsHUmwVwMK7oHedlYbDl5gQ7bKP6RX69VNl5F4jcKl
        kocLbgLHMU9Mrt6ElQ/0aB6/+iJqACDP+QdZduAT1Rawcm/5PdBfK5rSEchZuQwQ
        IQbzbaRqVeChmp6Biwb+96tSWcszMQTJSRfY17d/CF2OH7pND8q8jsMprAJEGZrY
        5zNNBHDwbXlw0LGPpRB77H9HUMAi3ZBGaGnOuQhp0ocZFch5ZJRlLvk9iz1IdIk3
        75doPnz6EDK0w1yhLDE78ERWa7i/4VoQtfnxy9LC6w/4hLRcoKGohdKhaHQK86Ps
        274I5oKWiAnGWN52BK/hY8d5kGJUaTzEvHvVJSU1rZep9UtlxtCCxNoHfkeezsqR
        NMoJK1ZQvkY=
X-Virus-Scanned: amavis at mykolab.com
X-Spam-Score: -1
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
Received: from mx.kolabnow.com ([127.0.0.1])
 by localhost (ext-mx-out013.mykolab.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id 3wBR2uu76H6v; Sun,  5 Nov 2023 15:43:21 +0100 (CET)
Received: from int-mx011.mykolab.com (unknown [10.9.13.11])
        by mx.kolabnow.com (Postfix) with ESMTPS id 229DE300D371;
        Sun,  5 Nov 2023 15:43:19 +0100 (CET)
Received: from ext-subm010.mykolab.com (unknown [10.9.6.10])
        by int-mx011.mykolab.com (Postfix) with ESMTPS id 742BC30C48BA;
        Sun,  5 Nov 2023 15:43:19 +0100 (CET)
Message-ID: <9c567345-43a4-c79f-cbbd-6f13a55a0b3c@hansg.org>
Date:   Sun, 5 Nov 2023 15:43:18 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v2 01/15] media: intel/ipu6: add Intel IPU6 PCI device
 driver
To:     bingbu.cao@intel.com, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc:     andriy.shevchenko@linux.intel.com, hdegoede@redhat.com,
        ilpo.jarvinen@linux.intel.com, andreaskleist@gmail.com,
        claus.stovgaard@gmail.com, tfiga@chromium.org,
        senozhatsky@chromium.org, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@linux.intel.com, tian.shu.qiu@intel.com,
        hongju.wang@intel.com
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
 <20231024112924.3934228-2-bingbu.cao@intel.com>
Content-Language: en-US, nl
From:   Hans de Goede <hans@hansg.org>
In-Reply-To: <20231024112924.3934228-2-bingbu.cao@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,


On 10/24/23 13:29, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> Intel Image Processing Unit 6th Gen includes input and processing systems
> but the hardware presents itself as a single PCI device in system.
> 
> IPU6 PCI device driver basically does PCI configurations and load
> the firmware binary, initialises IPU virtual bus, and sets up platform
> specific variants to support multiple IPU6 devices in single device
> driver.
> 
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> Reported-by: Hans de Goede <hdegoede@redhat.com>
> Suggested-by: Andreas Helbech Kleist <andreaskleist@gmail.com>

Thank you. Just one small remark, not a full review:

<snip>

> diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
> new file mode 100644
> index 000000000000..84960a283daf
> --- /dev/null
> +++ b/drivers/media/pci/intel/ipu6/ipu6.c

<snip>

> +static struct ipu6_bus_device *
> +ipu6_isys_init(struct pci_dev *pdev, struct device *parent,
> +	       struct ipu6_buttress_ctrl *ctrl, void __iomem *base,
> +	       const struct ipu6_isys_internal_pdata *ipdata)
> +{
> +	struct fwnode_handle *fwnode = dev_fwnode(&pdev->dev);
> +	struct ipu6_bus_device *isys_adev;
> +	struct ipu6_isys_pdata *pdata;
> +	int ret;
> +
> +	/* check fwnode at first, fallback into bridge if no fwnode graph */
> +	ret = ipu6_isys_check_fwnode_graph(fwnode);
> +	if (ret) {
> +		if (fwnode && !IS_ERR_OR_NULL(fwnode->secondary)) {
> +			dev_err(&pdev->dev,
> +				"fwnode graph has no endpoints connection\n");
> +			return ERR_PTR(-EINVAL);
> +		}
> +
> +		ret = ipu_bridge_init(&pdev->dev, ipu_bridge_parse_ssdb);
> +		if (ret) {
> +			if (ret != -EPROBE_DEFER)
> +				dev_err_probe(&pdev->dev, ret,
> +					      "IPU6 bridge init failed\n");

dev_err_probe() already silences logging of -EPROBE_DEFER errors itself,
so this "if (ret != -EPROBE_DEFER)" guard here is not necessary.

Regards,

Hans




