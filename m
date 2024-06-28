Return-Path: <linux-media+bounces-14317-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AE591BBA8
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 11:40:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B20E281DA3
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 09:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BFC5152E00;
	Fri, 28 Jun 2024 09:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="BQQxVLm6"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9790D153812;
	Fri, 28 Jun 2024 09:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719567518; cv=none; b=ajC5icEKoeR6LPFpKg1kCTxXQlKoCZ25iKABrgosQL75eoFxQ/7WOFKFOKNSL4SaSptXQB6Vob+4uwBzdrZFpS34rG9+T/RtoZRVeA4SbG6rt6yrMmna99YqAHxMt3VT3uyuuYP7ukBhKmt/UGZI03hWkTVPMvZfhuM8+Y3FsuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719567518; c=relaxed/simple;
	bh=5VrP6jezQkdx9rIeDjc0NEmy4MuAzKlS/DAo7HYVfRI=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NmPz+jFacM1OhCXh5ORQiJBont1Vw1138OrJzMhORJFVaTYcSnE9Dvo8QMaC3OMzAD15zOML7iaic6+jhiX9cg1D97prZjp+lNB1YaBIZ3VtWNBpAFLztbU95xBC12KuLgT3jTbjcLzLnp6Y+Kw4DzTTh82sqw+Dkrms8ePy2l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=BQQxVLm6; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45S9cOUZ041230;
	Fri, 28 Jun 2024 04:38:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1719567504;
	bh=q7LgT9uBdbOvQ5paV2bq4MgS6uNC8T27mkOMlHt/qek=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=BQQxVLm65dFR72AFFFgwV0OMPhQ5ayv1O1CFS+nMJwET3kGegB9Cq1cSjj5s6r/GU
	 0OdcHsqVN4789pJn1yeS7QHEmP0KMagaBX1EiGrj7rXP/QO2HwpOKPtO0jFJdTwzGS
	 QPI66ssFrq+nccUtBvfP7Ej9H0/OAfBN1PNlZ4Z0=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45S9cObZ021116
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 28 Jun 2024 04:38:24 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 28
 Jun 2024 04:38:24 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 28 Jun 2024 04:38:23 -0500
Received: from localhost (jluthra.dhcp.ti.com [172.24.227.116])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45S9cNvl095841;
	Fri, 28 Jun 2024 04:38:23 -0500
Date: Fri, 28 Jun 2024 15:08:22 +0530
From: Jai Luthra <j-luthra@ti.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus
	<sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Vaishnav Achath <vaishnav.a@ti.com>,
        Maxime Ripard <mripard@kernel.org>, Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Vignesh
 Raghavendra <vigneshr@ti.com>,
        Aradhya Bhatia <a-bhatia1@ti.com>, Devarsh
 Thakkar <devarsht@ti.com>,
        Changhuang Liang
	<changhuang.liang@starfivetech.com>,
        Jack Zhu <jack.zhu@starfivetech.com>,
        Julien Massot <julien.massot@collabora.com>,
        Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>
Subject: Re: Re: [PATCH v2 01/13] media: cadence: csi2rx: Support runtime PM
Message-ID: <7wi23sfb44cxtvhkhyrg634cr6lsofl7tlvvrhwmv43vgqmpz2@rrqrbevd35jn>
References: <20240627-multistream-v2-0-6ae96c54c1c3@ti.com>
 <20240627-multistream-v2-1-6ae96c54c1c3@ti.com>
 <c0e3623b-0af6-4bdc-8eb0-9072df1311de@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c0e3623b-0af6-4bdc-8eb0-9072df1311de@ideasonboard.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hi Tomi,

On Jun 28, 2024 at 11:14:50 +0300, Tomi Valkeinen wrote:
> Hi,
> 
> On 27/06/2024 16:09, Jai Luthra wrote:
> > From: Jayshri Pawar <jpawar@cadence.com>
> > 
> > Use runtime power management hooks to save power when CSI-RX is not in
> > use. Also stop/start any in-progress streams, which might happen during
> > a system suspend/resume cycle.
> > 
> > Signed-off-by: Jayshri Pawar <jpawar@cadence.com>
> > Co-developed-by: Jai Luthra <j-luthra@ti.com>
> > Signed-off-by: Jai Luthra <j-luthra@ti.com>
> > ---
> >   drivers/media/platform/cadence/cdns-csi2rx.c | 43 +++++++++++++++++++++++++++-
> >   1 file changed, 42 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
> > index 6f7d27a48eff..751eadbe61ef 100644
> > --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> > +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
> > @@ -366,6 +366,12 @@ static int csi2rx_s_stream(struct v4l2_subdev *subdev, int enable)
> >   	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
> >   	int ret = 0;
> > +	if (enable) {
> > +		ret = pm_runtime_resume_and_get(csi2rx->dev);
> > +		if (ret < 0)
> > +			return ret;
> > +	}
> > +
> >   	mutex_lock(&csi2rx->lock);
> >   	if (enable) {
> > @@ -375,8 +381,10 @@ static int csi2rx_s_stream(struct v4l2_subdev *subdev, int enable)
> >   		 */
> >   		if (!csi2rx->count) {
> >   			ret = csi2rx_start(csi2rx);
> > -			if (ret)
> > +			if (ret) {
> > +				pm_runtime_put(csi2rx->dev);
> >   				goto out;
> > +			}
> >   		}
> >   		csi2rx->count++;
> > @@ -388,6 +396,8 @@ static int csi2rx_s_stream(struct v4l2_subdev *subdev, int enable)
> >   		 */
> >   		if (!csi2rx->count)
> >   			csi2rx_stop(csi2rx);
> > +
> > +		pm_runtime_put(csi2rx->dev);
> >   	}
> >   out:
> > @@ -661,6 +671,29 @@ static int csi2rx_parse_dt(struct csi2rx_priv *csi2rx)
> >   	return ret;
> >   }
> > +static int csi2rx_suspend(struct device *dev)
> > +{
> > +	struct csi2rx_priv *csi2rx = dev_get_drvdata(dev);
> > +
> > +	mutex_lock(&csi2rx->lock);
> > +	if (csi2rx->count)
> > +		csi2rx_stop(csi2rx);
> > +	mutex_unlock(&csi2rx->lock);
> > +
> > +	return 0;
> > +}
> > +
> > +static int csi2rx_resume(struct device *dev)
> > +{
> > +	struct csi2rx_priv *csi2rx = dev_get_drvdata(dev);
> > +
> > +	mutex_lock(&csi2rx->lock);
> > +	if (csi2rx->count)
> > +		csi2rx_start(csi2rx);
> > +	mutex_unlock(&csi2rx->lock);
> > +	return 0;
> > +}
> > +
> 
> I don't think this looks correct. Afaik the runtime suspend/resume is not
> called on system suspend/resume. You could change the SET_RUNTIME_PM_OPS to
> use the same callbacks for runtime and system suspend, but I think that's a
> bad idea. Runtime suspend is not supposed to turn off the streaming. The
> driver is supposed to turn off the streaming, then call runtime_put, which
> would result in runtime suspend callback getting called.

Agreed, runtime PM should only be called once streams are stopped and 
device is not in use.

These hooks look like system suspend/resume hooks to me.

I don't think this patch makes much sense in this series anyway, I was 
carrying it to bring the drivers at parity with the vendor kernel.

I will drop this from my series and let Changhuang carry it in his 
series for overall PM support for cdns-csi2rx.

> 
>  Tomi
> 
> >   static int csi2rx_probe(struct platform_device *pdev)
> >   {
> >   	struct csi2rx_priv *csi2rx;
> > @@ -707,6 +740,7 @@ static int csi2rx_probe(struct platform_device *pdev)
> >   	if (ret)
> >   		goto err_cleanup;
> > +	pm_runtime_enable(csi2rx->dev);
> >   	ret = v4l2_async_register_subdev(&csi2rx->subdev);
> >   	if (ret < 0)
> >   		goto err_free_state;
> > @@ -721,6 +755,7 @@ static int csi2rx_probe(struct platform_device *pdev)
> >   err_free_state:
> >   	v4l2_subdev_cleanup(&csi2rx->subdev);
> > +	pm_runtime_disable(csi2rx->dev);
> >   err_cleanup:
> >   	v4l2_async_nf_unregister(&csi2rx->notifier);
> >   	v4l2_async_nf_cleanup(&csi2rx->notifier);
> > @@ -739,9 +774,14 @@ static void csi2rx_remove(struct platform_device *pdev)
> >   	v4l2_async_unregister_subdev(&csi2rx->subdev);
> >   	v4l2_subdev_cleanup(&csi2rx->subdev);
> >   	media_entity_cleanup(&csi2rx->subdev.entity);
> > +	pm_runtime_disable(csi2rx->dev);
> >   	kfree(csi2rx);
> >   }
> > +static const struct dev_pm_ops csi2rx_pm_ops = {
> > +	SET_RUNTIME_PM_OPS(csi2rx_suspend, csi2rx_resume, NULL)
> > +};
> > +
> >   static const struct of_device_id csi2rx_of_table[] = {
> >   	{ .compatible = "starfive,jh7110-csi2rx" },
> >   	{ .compatible = "cdns,csi2rx" },
> > @@ -756,6 +796,7 @@ static struct platform_driver csi2rx_driver = {
> >   	.driver	= {
> >   		.name		= "cdns-csi2rx",
> >   		.of_match_table	= csi2rx_of_table,
> > +		.pm		= &csi2rx_pm_ops,
> >   	},
> >   };
> >   module_platform_driver(csi2rx_driver);
> > 
> 

-- 
Thanks,
Jai

GPG Fingerprint: 4DE0 D818 E5D5 75E8 D45A AFC5 43DE 91F9 249A 7145

