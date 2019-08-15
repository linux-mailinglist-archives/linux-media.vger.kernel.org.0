Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63DC08EC3D
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 15:02:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732042AbfHONCe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 09:02:34 -0400
Received: from gofer.mess.org ([88.97.38.141]:40135 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726109AbfHONCd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 09:02:33 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id AED2B6078C; Thu, 15 Aug 2019 14:02:30 +0100 (BST)
Date:   Thu, 15 Aug 2019 14:02:30 +0100
From:   Sean Young <sean@mess.org>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Brad Love <brad@nextdimension.cc>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v3] media: dvb: Provide 4 devm variants
Message-ID: <20190815130230.nhetv5zj4pqjxqj7@gofer.mess.org>
References: <068836c7-a116-7e6f-cbb2-f2176fbb9a38@free.fr>
 <c7a7798b65e38355230d9ee235a3f8aa331123ca.camel@collabora.com>
 <64344008-4077-9948-4482-0878279b50e8@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64344008-4077-9948-4482-0878279b50e8@free.fr>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 22, 2019 at 10:13:56AM +0200, Marc Gonzalez wrote:
> On 21/07/2019 17:02, Ezequiel Garcia wrote:
> 
> > On Thu, 2019-07-18 at 15:03 +0200, Marc Gonzalez wrote:
> >
> >> Provide devm variants for automatic resource release on device removal.
> >> Makes error-handling in probe() simpler, thus less error-prone.
> >> Once all resources are devmanaged, remove() is no longer needed.
> > 
> > I think it would be better to add this API as part of a series
> > that also uses it.
> 
> I have an outstanding RFC for a new driver:
> 
> 	https://patchwork.kernel.org/patch/11040435/
> 
> Locally, I've updated the probe function to use the proposed devm functions.
> 
> I was mainly hoping to get initial feedback from the maintainers.
> 1) See if they're OK with devm APIs

devm_ has some lifetime issues, wrt to disconnect. However, for a platform
device it is fine.

> 2) See if they're OK with the way I implemented devm APIs

Looks good to me.

> 3) See what's missing to get an Ack

Please submit both this patch and a the driver as a series.

Thanks,

Sean

> 
> static int tsif_probe(struct platform_device *pdev)
> {
> 	int err, virq;
> 	struct tsif *tsif;
> 	struct resource *res;
> 	struct dvb_frontend *fe;
> 	struct dvb_adapter *adap;
> 	struct device *dev = &pdev->dev;
> 	short num = DVB_UNSET;
> 
> 	fe = dvb_get_demod_fe(dev->of_node);
> 	if (!fe)
> 		return -ENXIO;
> 
> 	tsif = devm_kzalloc(dev, sizeof(*tsif), GFP_KERNEL);
> 	if (!tsif)
> 		return -ENOMEM;
> 
> 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "tsif0");
> 	tsif->base = devm_ioremap_resource(dev, res);
> 	if (IS_ERR(tsif->base))
> 		return PTR_ERR(tsif->base);
> 
> 	virq = platform_get_irq_byname(pdev, "tsif0");
> 	err = devm_request_irq(dev, virq, tsif_isr, IRQF_SHARED, "tsif", tsif);
> 	if (err)
> 		return err;
> 
> 	tsif->clk = devm_clk_get(dev, "iface");
> 	if (IS_ERR(tsif->clk))
> 		return PTR_ERR(tsif->clk);
> 
> 	err = devm_clk_prepare_enable(dev, tsif->clk);
> 	if (err)
> 		return err;
> 
> 	adap = &tsif->adapter;
> 	err = devm_dvb_register_adapter(dev, adap, "tsif", THIS_MODULE, &num);
> 	if (err) return err;
> 
> 	/* Not sure the diff between filter and feed? */
> 	tsif->demux.filternum = 16; /*** Dunno what to put here ***/
> 	tsif->demux.feednum = 16;	/*** Dunno what to put here ***/
> 	tsif->demux.start_feed = noop;
> 	tsif->demux.stop_feed = noop;
> 	err = devm_dvb_dmx_init(dev, &tsif->demux);
> 	if (err) return err;
> 
> 	/* What relation to dvb_demux.filternum??? */
> 	/* Do I need this object?? */
> 	tsif->dmxdev.filternum = 16;
> 	tsif->dmxdev.demux = &tsif->demux.dmx;
> 	err = devm_dvb_dmxdev_init(dev, &tsif->dmxdev, adap);
> 	if (err) return err;
> 
> 	err = devm_dvb_register_frontend(dev, adap, fe);
> 	if (err) return err;
> 
> 	writel_relaxed(TSIF_START + ENABLE_IRQ, tsif->base + TSIF_STS_CTL);
> 	devm_add_action(dev, stop_tsif, tsif);
> 	INIT_WORK(&tsif->work, handle_pkt);
> 
> 	return 0;
> }
