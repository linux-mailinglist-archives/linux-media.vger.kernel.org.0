Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C4183F7175
	for <lists+linux-media@lfdr.de>; Wed, 25 Aug 2021 11:08:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239483AbhHYJIv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Aug 2021 05:08:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239389AbhHYJIu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Aug 2021 05:08:50 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36ADFC061757;
        Wed, 25 Aug 2021 02:08:04 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id A6D1A1F43274
Subject: Re: [PATCH v7 7/7] media: mtk-mdp: use mdp-rdma0 alias to point to
 MDP master
To:     houlong wei <houlong.wei@mediatek.com>,
        Eizan Miyamoto <eizan@chromium.org>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
        =?UTF-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>,
        "wenst@chromium.org" <wenst@chromium.org>,
        =?UTF-8?B?Q0sgSHUgKOiDoeS/ig==?= =?UTF-8?B?5YWJKQ==?= 
        <ck.hu@mediatek.com>,
        =?UTF-8?B?WW9uZ3FpYW5nIE5pdSAo54mb5rC45by6KQ==?= 
        <yongqiang.niu@mediatek.com>,
        =?UTF-8?B?QW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qik=?= 
        <Andrew-CT.Chen@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        =?UTF-8?B?TWluZ2hzaXUgVHNhaSAo6JSh5piO5L+uKQ==?= 
        <Minghsiu.Tsai@mediatek.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>
References: <20210825063323.3607738-1-eizan@chromium.org>
 <20210825163247.v7.7.I2049e180dca12e0d1b3178bfc7292dcf9e05ac28@changeid>
 <1629880999.12893.17.camel@mhfsdcap03>
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <0c9fa482-57dd-d4ef-c65b-01f137c57359@collabora.com>
Date:   Wed, 25 Aug 2021 11:07:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <1629880999.12893.17.camel@mhfsdcap03>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Houlong,

Thank you for following up this patchset. I have some questions to try to
understand better the hardware though.

On 25/8/21 10:43, houlong wei wrote:
> Hi Eizan,
> 
> Thanks for you patch. I have inline comment below.
> 
> Regards,
> Houlong
> 
> On Wed, 2021-08-25 at 14:33 +0800, Eizan Miyamoto wrote:
>> ... Instead of depending on the presence of a mediatek,vpu property in
>> the device node.
>>
>> That property was originally added to link to the vpu node so that the
>> mtk_mdp_core driver could pass the right device to
>> vpu_wdt_reg_handler(). However in a previous patch in this series,
>> the driver has been modified to search the device tree for that node
>> instead.
>>
>> That property was also used to indicate the primary MDP device, so that
>> it can be passed to the V4L2 subsystem as well as register it to be
>> used when setting up queues in the open() callback for the filesystem
>> device node that is created. In this case, assuming that the primary
>> MDP device is the one with a specific alias seems useable because the
>> alternative is to add a property to the device tree which doesn't
>> actually represent any facet of hardware (i.e., this being the primary
>> MDP device is a software decision). In other words, this solution is
>> equally as arbitrary, but at least it doesn't add a property to a
>> device node where said property is unrelated to the hardware present.
>>
>> Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
>> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>> ---
>>
>> (no changes since v1)
>>
>>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 56 +++++++++++++------
>>  drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 36 ++++++++----
>>  2 files changed, 64 insertions(+), 28 deletions(-)
>>
>> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
>> index 85ef274841a3..9527649de98e 100644
>> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
>> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
>> @@ -151,29 +151,50 @@ void mtk_mdp_comp_clock_off(struct mtk_mdp_comp *comp)
>>  		mtk_smi_larb_put(comp->larb_dev);
>>  }
>>  
>> -static int mtk_mdp_comp_bind(struct device *dev, struct device *master, void *data)
>> +/*
>> + * The MDP master device node is identified by the device tree alias
>> + * "mdp-rdma0".
>> + */
>> +static bool is_mdp_master(struct device *dev)
>> +{
>> +	struct device_node *aliases, *mdp_rdma0_node;
>> +	const char *mdp_rdma0_path;
>> +
>> +	if (!dev->of_node)
>> +		return false;
>> +
>> +	aliases = of_find_node_by_path("/aliases");
>> +	if (!aliases) {
>> +		dev_err(dev, "no aliases found for mdp-rdma0");
>> +		return false;
>> +	}
>> +
>> +	mdp_rdma0_path = of_get_property(aliases, "mdp-rdma0", NULL);
>> +	if (!mdp_rdma0_path) {
>> +		dev_err(dev, "get mdp-rdma0 property of /aliases failed");
>> +		return false;
>> +	}
>> +
>> +	mdp_rdma0_node = of_find_node_by_path(mdp_rdma0_path);
>> +	if (!mdp_rdma0_node) {
>> +		dev_err(dev, "path resolution failed for %s", mdp_rdma0_path);
>> +		return false;
>> +	}
>> +
>> +	return dev->of_node == mdp_rdma0_node;
> 
> 
> About how to determine the master mdp driver, we also can
> judge the component type. The component type can be gotten by calling
> of_device_get_match_data(dev). If the component is MTK_MDP_RDMA, it is
> the master driver. No matter it is mdp_rdma0 or mdp_rdma1.


I'm confused, you mean that the component type, aka MTK_MDP_RDMA is only set for
mtk_mdp_rdma0? isn't mtk_dmp_rdma1 also a MTK_MDP_RDMA type? Because looks weird
to me that two rdma have diffent types.


> http://lists.infradead.org/pipermail/linux-mediatek/2021-August/028533.html
> 
> IMO, judging it by component type is more flexible because it does not
> limit to 'mdp_rdma0'.
> 

Using an alias like Eizan did is also flexible, you only need to set mdp-rdma0
to point the mdp_rdma1 node.

What I am really interested to know is the differences between the platforms to
understand if this is really a platform hardware property or a software
configurable thing, so would help if you can give use the different use cases
for different SoCs.

For MT8173 which is the master device? is _always_ rdma0 or can also be rdma1?

Or maybe what is not clear here is what exactly means be a master device?

What about MT8183 and other SoCs?

Thanks,
  Enric


>> +}
>> +
>> +static int mtk_mdp_comp_bind(struct device *dev, struct device *master,
>> +			void *data)
>>  {
>>  	struct mtk_mdp_comp *comp = dev_get_drvdata(dev);
>>  	struct mtk_mdp_dev *mdp = data;
>> -	struct device_node *vpu_node;
>>  
>>  	mtk_mdp_register_component(mdp, comp);
>>  
>> -	/*
>> -	 * If this component has a "mediatek-vpu" property, it is responsible for
>> -	 * notifying the mdp master driver about it so it can be further initialized
>> -	 * later.
>> -	 */
>> -	vpu_node = of_parse_phandle(dev->of_node, "mediatek,vpu", 0);
>> -	if (vpu_node) {
>> +	if (is_mdp_master(dev)) {
>>  		int ret;
>>  
>> -		mdp->vpu_dev = of_find_device_by_node(vpu_node);
>> -		if (WARN_ON(!mdp->vpu_dev)) {
>> -			dev_err(dev, "vpu pdev failed\n");
>> -			of_node_put(vpu_node);
>> -		}
>> -
>>  		ret = v4l2_device_register(dev, &mdp->v4l2_dev);
>>  		if (ret) {
>>  			dev_err(dev, "Failed to register v4l2 device\n");
>> @@ -187,9 +208,8 @@ static int mtk_mdp_comp_bind(struct device *dev, struct device *master, void *da
>>  		}
>>  
>>  		/*
>> -		 * presence of the "mediatek,vpu" property in a device node
>> -		 * indicates that it is the primary MDP rdma device and MDP DMA
>> -		 * ops should be handled by its DMA callbacks.
>> +		 * MDP DMA ops will be handled by the DMA callbacks associated with this
>> +		 * device;
>>  		 */
>>  		mdp->rdma_dev = dev;
>>  	}
>> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
>> index 50eafcc9993d..6a775463399c 100644
>> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
>> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
>> @@ -150,8 +150,9 @@ static void release_of(struct device *dev, void *data)
>>  
>>  static int mtk_mdp_master_bind(struct device *dev)
>>  {
>> -	int status;
>>  	struct mtk_mdp_dev *mdp = dev_get_drvdata(dev);
>> +	struct device_node *vpu_node;
>> +	int status;
>>  
>>  	status = component_bind_all(dev, mdp);
>>  	if (status) {
>> @@ -159,15 +160,30 @@ static int mtk_mdp_master_bind(struct device *dev)
>>  		goto err_component_bind_all;
>>  	}
>>  
>> -	if (mdp->vpu_dev) {
>> -		int ret = vpu_wdt_reg_handler(mdp->vpu_dev, mtk_mdp_reset_handler, mdp,
>> -					  VPU_RST_MDP);
>> -		if (ret) {
>> -			dev_err(dev, "Failed to register reset handler\n");
>> -			goto err_wdt_reg;
>> -		}
>> -	} else {
>> -		dev_err(dev, "no vpu_dev found\n");
>> +	if (mdp->rdma_dev == NULL) {
>> +		dev_err(dev, "Primary MDP device not found");
>> +		status = -ENODEV;
>> +		goto err_component_bind_all;
>> +	}
>> +
>> +	vpu_node = of_find_node_by_name(NULL, "vpu");
>> +	if (!vpu_node) {
>> +		dev_err(dev, "unable to find vpu node");
>> +		status = -ENODEV;
>> +		goto err_wdt_reg;
>> +	}
>> +
>> +	mdp->vpu_dev = of_find_device_by_node(vpu_node);
> 
> The 'vpu_node' should be put by calling 'of_node_put(vpu_node)' when it
> is not used.
> 
>> +	if (!mdp->vpu_dev) {
>> +		dev_err(dev, "unable to find vpu device");
>> +		status = -ENODEV;
>> +		goto err_wdt_reg;
>> +	}
>> +
>> +	status = vpu_wdt_reg_handler(mdp->vpu_dev, mtk_mdp_reset_handler, mdp, VPU_RST_MDP);
>> +	if (status) {
>> +		dev_err(dev, "Failed to register reset handler\n");
>> +		goto err_wdt_reg;
>>  	}
>>  
>>  	status = mtk_mdp_register_m2m_device(mdp);
> 
