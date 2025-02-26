Return-Path: <linux-media+bounces-27020-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE20A45B0B
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 11:01:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE41E173126
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 10:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4A22226D02;
	Wed, 26 Feb 2025 10:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="cAnjvOIA"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A954258CE0
	for <linux-media@vger.kernel.org>; Wed, 26 Feb 2025 10:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740564060; cv=none; b=qaPyQeobO8mBNbsOmp84bAKEp3akaEVu8kmDaFtM3fFGbjQz+Oul0FUFY88p8e3Q5TI3ipSz6zETsOvSPY9VB+APTtcQj8SFpxcoo/6JMvteADdruQbzNqPc8CjOkzM55nwleLGEi0eZ/44cCCf+bLyi4Kqwguh7Ca8TUXinlaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740564060; c=relaxed/simple;
	bh=UqZUfNi2AtJfMzOqXdhWx3+0PelnNqh5/jCaXB4xY9s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZD8HvuZz4e70vVcmzOylAABRIVMAESc6Au0njaZ6d1cH5OwZ2xb65yszgPzel7k0HTCDWqBZ/JvMxHhUrxs4PY7N/TJ5huRt9DZU6QwZ4HI5vvz1QB1vsWtW1GfhuUkJL+ihFrLV4aob4Rl8Pj5GUkggBVMw7YVk1qQL+c6qwzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=cAnjvOIA; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4Z2qjX46BDz9spt;
	Wed, 26 Feb 2025 11:00:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1740564048; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q9xCLAcYoiUol3PhYc6UAFBaBflhmInzYl/+vopfCtU=;
	b=cAnjvOIA35w8M+SMutq7jVi8JtGIfy0qbSSuuKD4/iKcf+nU9K6n3UvmsYsWggs4X+smBF
	sdsbpwDQ3PEytMARF+2KwEds48XLgyqbBFYHkQZu5434j5pub+fe5hQvA92SWwUHZV91JD
	259Pmto4fJmzTG4bwwpt1U5UqphBJwQa8FUC2tbYzKNNnL/o5hgvzZ7MTUY29kxWuFGU8H
	ASMbCkpwC9HtR+GxZn8Ld5gGHsj+E5FGrC+38BOg6xa8g7dJkhwaCcC6IvKikNHD9K2Tf3
	mLKxUnxMq4gcqUJHsXcy+wi+xzAhZrCDHDJRKV6WDqB34bP066E/ibeTD0bp4g==
Message-ID: <5d9f9a8a877bc86e6780f3357c01e1e92150d19d.camel@mailbox.org>
Subject: Re: [RFC PATCH 2/7] media: ipu7: add Intel IPU7 PCI device driver
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: bingbu.cao@intel.com, linux-media@vger.kernel.org, 
	sakari.ailus@linux.intel.com, hdegoede@redhat.com
Cc: hans@hansg.org, stanislaw.gruszka@linux.intel.com, jerry.w.hu@intel.com,
  tian.shu.qiu@intel.com, daxing.li@intel.com, hao.yao@intel.com, 
 bingbu.cao@linux.intel.com
Date: Wed, 26 Feb 2025 11:00:44 +0100
In-Reply-To: <20250221075252.3347582-3-bingbu.cao@intel.com>
References: <20250221075252.3347582-1-bingbu.cao@intel.com>
	 <20250221075252.3347582-3-bingbu.cao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: eb8d57423091f4fd135
X-MBO-RS-META: koi4ymnkgc7xrwcenqim4mzxe4upjxmb

On Fri, 2025-02-21 at 15:52 +0800, bingbu.cao@intel.com wrote:
> +

[SNIP]

> +static int ipu7_pci_probe(struct pci_dev *pdev, const struct
> pci_device_id *id)
> +{
> +	struct ipu_buttress_ctrl *isys_ctrl =3D NULL, *psys_ctrl =3D
> NULL;
> +	struct fwnode_handle *fwnode =3D dev_fwnode(&pdev->dev);
> +	const struct ipu_buttress_ctrl *isys_buttress_ctrl;
> +	const struct ipu_buttress_ctrl *psys_buttress_ctrl;
> +	struct ipu_isys_internal_pdata *isys_ipdata;
> +	struct ipu_psys_internal_pdata *psys_ipdata;
> +	unsigned int dma_mask =3D IPU_DMA_MASK;
> +	struct device *dev =3D &pdev->dev;
> +	void __iomem *isys_base =3D NULL;
> +	void __iomem *psys_base =3D NULL;
> +	void __iomem *const *iomap;
> +	phys_addr_t phys, pb_phys;
> +	struct ipu7_device *isp;
> +	u32 is_es;
> +	int ret;
> +
> +	if (!fwnode || fwnode_property_read_u32(fwnode, "is_es",
> &is_es))
> +		is_es =3D 0;
> +
> +	isp =3D devm_kzalloc(dev, sizeof(*isp), GFP_KERNEL);
> +	if (!isp)
> +		return -ENOMEM;
> +
> +	dev_set_name(dev, "intel-ipu7");
> +	isp->pdev =3D pdev;
> +	INIT_LIST_HEAD(&isp->devices);
> +
> +	ret =3D pcim_enable_device(pdev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Enable PCI device
> failed\n");
> +
> +	dev_info(dev, "Device 0x%x (rev: 0x%x)\n",
> +		 pdev->device, pdev->revision);
> +
> +	phys =3D pci_resource_start(pdev, IPU_PCI_BAR);
> +	pb_phys =3D pci_resource_start(pdev, IPU_PCI_PBBAR);
> +	dev_info(dev, "IPU7 PCI BAR0 base %llx BAR2 base %llx\n",
> +		 phys, pb_phys);
> +
> +	ret =3D pcim_iomap_regions(pdev, BIT(IPU_PCI_BAR) |
> BIT(IPU_PCI_PBBAR),
> +				 pci_name(pdev));

Oh and btw, since I just recognized this:
PCI request functions must always get the *driver's* name as their last
parameter.

This string will be printed if there is a collision, i.e., when another
driver tries to request the same resource. The output is only useful
when the print contains the name of the party who actually stole your
PCI region. Saying on which PCI device the region is won't be helpful.


btw, did you watch my Fosdem talk before or after I answered to this
RFC? ;)


Thx
P.

> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 "Failed to I/O memory remapping
> (%d)\n",
> +				=C2=A0=C2=A0=C2=A0=C2=A0 ret);
> +
> +	iomap =3D pcim_iomap_table(pdev);
> +	if (!iomap)
> +		return dev_err_probe(dev, -ENODEV, "Failed to iomap
> table\n");
> +


