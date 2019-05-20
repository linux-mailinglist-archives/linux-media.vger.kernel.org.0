Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A8F92326E
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2019 13:31:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732864AbfETLav (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 May 2019 07:30:51 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:44465 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732850AbfETLav (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 May 2019 07:30:51 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud7.xs4all.net with ESMTPA
        id SgVBhrJ9u3qlsSgVEhjKRz; Mon, 20 May 2019 13:30:48 +0200
Subject: Re: [PATCH v6 2/3] drm/bridge: dw-hdmi: pass connector info to the
 CEC adapter
To:     Dariusz Marcinkiewicz <darekm@google.com>,
        linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org
References: <20190517154256.255696-1-darekm@google.com>
 <20190517154256.255696-2-darekm@google.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <8f2ceecd-da9e-a923-da72-cdc660eecb3a@xs4all.nl>
Date:   Mon, 20 May 2019 13:30:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190517154256.255696-2-darekm@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFpVPeIn/BZiBwm4I/6JYNDg/CHDm7A9caDxP2rg6j+8SEd3c0LwfqA7CEWxSpD9JwXEWaRRGDP5t5UEcJQit+nGOm70HDdQTjVN03MxIdL5B6QgdiR3
 av94njpBA1XO7S5FDB4/4RphpvyFRKh9dEuLTvzVDY3G6nv3AxI/23Paye5jiSmk+Mdox4S/4PVs732oy9kowMFNFzdPmCdRg7d6hNCLB1sBCCBhG94mfiI5
 NAJ5qbkodrSo7L8XIsJhgg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/17/19 5:42 PM, Dariusz Marcinkiewicz wrote:
> This patch makes dw-hdmi pass DRM connector info to a respective
> CEC adapter. In order to be able to do that it delays creation of
> the dw-hdmi-cec platform device until DRM connector is initialized.
> 
> Requires testing.

Testing this patch with the Khadas VIM2 board gives this kernel warning:

[    3.468499] meson-dw-hdmi c883a000.hdmi-tx: Detected HDMI TX controller v2.01a with HDCP (meson_dw_hdmi_phy)
[    3.473123] meson-dw-hdmi c883a000.hdmi-tx: registered DesignWare HDMI I2C bus driver
[    3.481151] WARNING: CPU: 4 PID: 66 at mm/page_alloc.c:4584 __alloc_pages_nodemask+0x7c8/0xb98
[    3.488962] Modules linked in:
[    3.491984] CPU: 4 PID: 66 Comm: kworker/4:1 Not tainted 5.1.0-rc1-arm64 #26
[    3.498965] Hardware name: Khadas VIM2 (DT)
[    3.503114] Workqueue: events deferred_probe_work_func
[    3.508197] pstate: 20000005 (nzCv daif -PAN -UAO)
[    3.512941] pc : __alloc_pages_nodemask+0x7c8/0xb98
[    3.517771] lr : alloc_pages_current+0x80/0xf0
[    3.522167] sp : ffff0000119db680
[    3.525444] x29: ffff0000119db680 x28: 0000000000000000
[    3.530705] x27: ffff000010c0d108 x26: ffff8000be900cf0
[    3.535966] x25: 0000000000000001 x24: ffff8000be93d400
[    3.541228] x23: ffff00001119cd90 x22: ffff8000be900c80
[    3.546489] x21: 0000000000000000 x20: 000000000000001a
[    3.551750] x19: 0000000000040cc0 x18: 0000000000000001
[    3.557011] x17: 0000000000000001 x16: 0000000000000019
[    3.562273] x15: ffffffffffffffff x14: ffff00001103d6c8
[    3.567534] x13: ffff8000be529e09 x12: 0000000000000018
[    3.572795] x11: 0101010101010101 x10: 7f7f7f7f7f7f7f7f
[    3.578056] x9 : 0000000000000000 x8 : ffff8000bdb4f000
[    3.583317] x7 : ffff8000bdb4ecf0 x6 : 0000000000000041
[    3.588579] x5 : 0000000000000000 x4 : ffff00001103d6c8
[    3.593840] x3 : 0000000000000000 x2 : 0000000000000000
[    3.599101] x1 : 000000000000001a x0 : 0000000000040cc0
[    3.604363] Call trace:
[    3.606781]  __alloc_pages_nodemask+0x7c8/0xb98
[    3.611264]  alloc_pages_current+0x80/0xf0
[    3.615320]  kmalloc_order+0x14/0x38
[    3.618857]  __kmalloc_track_caller+0x1c8/0x220
[    3.623341]  kmemdup+0x28/0x50
[    3.626360]  platform_device_add_resources+0x30/0x68
[    3.631275]  platform_device_register_full+0xa8/0x130
[    3.636279]  dw_hdmi_bridge_attach+0xc4/0xd0
[    3.640507]  drm_bridge_attach+0x64/0xc0
[    3.644384]  dw_hdmi_bind+0x4c/0x98
[    3.647838]  meson_dw_hdmi_bind+0x424/0x568
[    3.651975]  component_bind_all+0x110/0x238
[    3.656116]  meson_drv_bind_master+0x308/0x488
[    3.660514]  meson_drv_bind+0x10/0x18
[    3.664136]  try_to_bring_up_master+0x164/0x1c0
[    3.668621]  component_master_add_with_match+0xbc/0xf8
[    3.673710]  meson_drv_probe+0xd0/0x120
[    3.677505]  platform_drv_probe+0x50/0xa8
[    3.681472]  really_probe+0x1c8/0x2a0
[    3.685094]  driver_probe_device+0x54/0xf0
[    3.689148]  __device_attach_driver+0x80/0xb8
[    3.693463]  bus_for_each_drv+0x78/0xc8
[    3.697255]  __device_attach+0xd4/0x130
[    3.701051]  device_initial_probe+0x10/0x18
[    3.705190]  bus_probe_device+0x90/0x98
[    3.708986]  deferred_probe_work_func+0x6c/0xa0
[    3.713473]  process_one_work+0x1e0/0x330
[    3.717439]  worker_thread+0x240/0x448
[    3.721150]  kthread+0x120/0x128
[    3.724340]  ret_from_fork+0x10/0x1c
[    3.727874] ---[ end trace 729b3a53d3f3eac1 ]---
[    3.732510] meson-drm d0100000.vpu: bound c883a000.hdmi-tx (ops meson_dw_hdmi_ops)
[    3.740366] [drm] Initialized meson 1.0.0 20161109 for d0100000.vpu on minor 0
[    3.747158] [drm] Cannot find any crtc or sizes
[    3.752380] libphy: mdio_mux: probed
[    3.755243] [drm] Cannot find any crtc or sizes

If I revert this patch, then it's fine again.

I get this even if CONFIG_DRM_DW_HDMI_CEC is not set.

The Khadas VIM2 board uses dw-hdmi for the HDMI support, but it uses its own CEC
meson driver. I do have other HW that uses dw-hdmi for CEC, but won't have access
to it until next week.

Regards,

	Hans

> 
> Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c |  5 +-
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.h |  2 +
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     | 82 +++++++++++--------
>  3 files changed, 52 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
> index 84fb7b6a0a5e0..cf879629e0726 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
> @@ -232,6 +232,7 @@ static void dw_hdmi_cec_del(void *data)
>  static int dw_hdmi_cec_probe(struct platform_device *pdev)
>  {
>  	struct dw_hdmi_cec_data *data = dev_get_platdata(&pdev->dev);
> +	struct cec_connector_info conn_info;
>  	struct dw_hdmi_cec *cec;
>  	int ret;
>  
> @@ -258,10 +259,12 @@ static int dw_hdmi_cec_probe(struct platform_device *pdev)
>  	dw_hdmi_write(cec, ~0, HDMI_IH_MUTE_CEC_STAT0);
>  	dw_hdmi_write(cec, 0, HDMI_CEC_POLARITY);
>  
> +	cec_fill_connector_info(&conn_info, data->connector);
> +
>  	cec->adap = cec_allocate_adapter(&dw_hdmi_cec_ops, cec, "dw_hdmi",
>  					 CEC_CAP_LOG_ADDRS | CEC_CAP_TRANSMIT |
>  					 CEC_CAP_RC | CEC_CAP_PASSTHROUGH,
> -					 CEC_MAX_LOG_ADDRS, NULL);
> +					 CEC_MAX_LOG_ADDRS, &conn_info);
>  	if (IS_ERR(cec->adap))
>  		return PTR_ERR(cec->adap);
>  
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.h b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.h
> index cf4dc121a2c43..a2ac91ec845ed 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.h
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.h
> @@ -1,6 +1,7 @@
>  #ifndef DW_HDMI_CEC_H
>  #define DW_HDMI_CEC_H
>  
> +struct drm_connector;
>  struct dw_hdmi;
>  
>  struct dw_hdmi_cec_ops {
> @@ -13,6 +14,7 @@ struct dw_hdmi_cec_ops {
>  struct dw_hdmi_cec_data {
>  	struct dw_hdmi *hdmi;
>  	const struct dw_hdmi_cec_ops *ops;
> +	const struct drm_connector *connector;
>  	int irq;
>  };
>  
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index ab7968c8f6a29..1275cb74299a8 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -138,6 +138,8 @@ struct dw_hdmi {
>  	struct drm_connector connector;
>  	struct drm_bridge bridge;
>  
> +	int irq;
> +
>  	unsigned int version;
>  
>  	struct platform_device *audio;
> @@ -189,6 +191,7 @@ struct dw_hdmi {
>  	void (*enable_audio)(struct dw_hdmi *hdmi);
>  	void (*disable_audio)(struct dw_hdmi *hdmi);
>  
> +	bool cec_configured;
>  	struct cec_notifier *cec_notifier;
>  };
>  
> @@ -2113,6 +2116,29 @@ static const struct drm_connector_helper_funcs dw_hdmi_connector_helper_funcs =
>  	.get_modes = dw_hdmi_connector_get_modes,
>  };
>  
> +static void dw_hdmi_cec_enable(struct dw_hdmi *hdmi)
> +{
> +	mutex_lock(&hdmi->mutex);
> +	hdmi->mc_clkdis &= ~HDMI_MC_CLKDIS_CECCLK_DISABLE;
> +	hdmi_writeb(hdmi, hdmi->mc_clkdis, HDMI_MC_CLKDIS);
> +	mutex_unlock(&hdmi->mutex);
> +}
> +
> +static void dw_hdmi_cec_disable(struct dw_hdmi *hdmi)
> +{
> +	mutex_lock(&hdmi->mutex);
> +	hdmi->mc_clkdis |= HDMI_MC_CLKDIS_CECCLK_DISABLE;
> +	hdmi_writeb(hdmi, hdmi->mc_clkdis, HDMI_MC_CLKDIS);
> +	mutex_unlock(&hdmi->mutex);
> +}
> +
> +static const struct dw_hdmi_cec_ops dw_hdmi_cec_ops = {
> +	.write = hdmi_writeb,
> +	.read = hdmi_readb,
> +	.enable = dw_hdmi_cec_enable,
> +	.disable = dw_hdmi_cec_disable,
> +};
> +
>  static int dw_hdmi_bridge_attach(struct drm_bridge *bridge)
>  {
>  	struct dw_hdmi *hdmi = bridge->driver_private;
> @@ -2129,6 +2155,23 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge)
>  
>  	drm_connector_attach_encoder(connector, encoder);
>  
> +	if (hdmi->cec_configured) {
> +		struct platform_device_info pdevinfo;
> +		struct dw_hdmi_cec_data cec;
> +
> +		cec.hdmi = hdmi;
> +		cec.ops = &dw_hdmi_cec_ops;
> +		cec.irq = hdmi->irq;
> +		cec.connector = connector;
> +
> +		pdevinfo.name = "dw-hdmi-cec";
> +		pdevinfo.data = &cec;
> +		pdevinfo.size_data = sizeof(cec);
> +		pdevinfo.dma_mask = 0;
> +
> +		hdmi->cec = platform_device_register_full(&pdevinfo);
> +	}
> +
>  	return 0;
>  }
>  
> @@ -2398,29 +2441,6 @@ static int dw_hdmi_detect_phy(struct dw_hdmi *hdmi)
>  	return -ENODEV;
>  }
>  
> -static void dw_hdmi_cec_enable(struct dw_hdmi *hdmi)
> -{
> -	mutex_lock(&hdmi->mutex);
> -	hdmi->mc_clkdis &= ~HDMI_MC_CLKDIS_CECCLK_DISABLE;
> -	hdmi_writeb(hdmi, hdmi->mc_clkdis, HDMI_MC_CLKDIS);
> -	mutex_unlock(&hdmi->mutex);
> -}
> -
> -static void dw_hdmi_cec_disable(struct dw_hdmi *hdmi)
> -{
> -	mutex_lock(&hdmi->mutex);
> -	hdmi->mc_clkdis |= HDMI_MC_CLKDIS_CECCLK_DISABLE;
> -	hdmi_writeb(hdmi, hdmi->mc_clkdis, HDMI_MC_CLKDIS);
> -	mutex_unlock(&hdmi->mutex);
> -}
> -
> -static const struct dw_hdmi_cec_ops dw_hdmi_cec_ops = {
> -	.write = hdmi_writeb,
> -	.read = hdmi_readb,
> -	.enable = dw_hdmi_cec_enable,
> -	.disable = dw_hdmi_cec_disable,
> -};
> -
>  static const struct regmap_config hdmi_regmap_8bit_config = {
>  	.reg_bits	= 32,
>  	.val_bits	= 8,
> @@ -2443,7 +2463,6 @@ __dw_hdmi_probe(struct platform_device *pdev,
>  	struct device_node *np = dev->of_node;
>  	struct platform_device_info pdevinfo;
>  	struct device_node *ddc_node;
> -	struct dw_hdmi_cec_data cec;
>  	struct dw_hdmi *hdmi;
>  	struct resource *iores = NULL;
>  	int irq;
> @@ -2593,6 +2612,7 @@ __dw_hdmi_probe(struct platform_device *pdev,
>  		ret = irq;
>  		goto err_iahb;
>  	}
> +	hdmi->irq = irq;
>  
>  	ret = devm_request_threaded_irq(dev, irq, dw_hdmi_hardirq,
>  					dw_hdmi_irq, IRQF_SHARED,
> @@ -2668,18 +2688,8 @@ __dw_hdmi_probe(struct platform_device *pdev,
>  		hdmi->audio = platform_device_register_full(&pdevinfo);
>  	}
>  
> -	if (config0 & HDMI_CONFIG0_CEC) {
> -		cec.hdmi = hdmi;
> -		cec.ops = &dw_hdmi_cec_ops;
> -		cec.irq = irq;
> -
> -		pdevinfo.name = "dw-hdmi-cec";
> -		pdevinfo.data = &cec;
> -		pdevinfo.size_data = sizeof(cec);
> -		pdevinfo.dma_mask = 0;
> -
> -		hdmi->cec = platform_device_register_full(&pdevinfo);
> -	}
> +	if (config0 & HDMI_CONFIG0_CEC)
> +		hdmi->cec_configured = true;
>  
>  	/* Reset HDMI DDC I2C master controller and mute I2CM interrupts */
>  	if (hdmi->i2c)
> 

