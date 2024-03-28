Return-Path: <linux-media+bounces-7528-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A80E4885F50
	for <lists+linux-media@lfdr.de>; Thu, 21 Mar 2024 18:10:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F22628374B
	for <lists+linux-media@lfdr.de>; Thu, 21 Mar 2024 17:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3D3A224D7;
	Thu, 21 Mar 2024 17:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="EdwYnDAl"
X-Original-To: linux-media@vger.kernel.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02C0175A4;
	Thu, 21 Mar 2024 17:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711040974; cv=none; b=Ngzvho/SrFkHDs8XbLD1qSqdI4XUm+prMMRGAlCqHZ53lVS8huwj3ILEETjZhblov1WcLsyxKJwNZehlhh9zGCYcJFehgA2tmdrIvJq0ObH+g/WYhlQw3ffc9EOed6sbPA/6ZCbKEBHySCkoKxHfZUDiQMGYpcz/GUBZ/BkIW6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711040974; c=relaxed/simple;
	bh=Itl5t62VHxEo3mqgfTNF4UiHOLoYAOVanKZ2RDJLp+Y=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MpIMEPVdS1Pwjsn1ZicKZzoazT8fYtx89Qx9dEwkiqgPBMWa+0kCpocziOyD8nHiFTyfj4bO1sJgpB7Lh/xPx0xsa83eOlaD18SxzQT526UwONmrHrO6Unhg2ylpWDQAUKvfVAJDBflZkqweBlLV6GQk0Pc9S3yl7sR5CFaUr+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=EdwYnDAl; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42LH9AQb099118;
	Thu, 21 Mar 2024 12:09:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1711040950;
	bh=dOXRqIfkke312VoFk6XHnKmgUXr0Jw4458ZL4pf0KpU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=EdwYnDAl+A773T5iPCLhrhaazjJsdroMTAA+QXXobITs/C9t8rSDrfbxcYf/o1QXu
	 nH9sahySYBILR0a+5rKXhCVM2tMAIUKniZBFHJefbZpgTPKiCBl8IXNYOyJ7hYt6gC
	 353KW4P71YxSQAYvC1SRa09W+/qtd7/pQbHmcJvw=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42LH9ANQ009307
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 21 Mar 2024 12:09:10 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 21
 Mar 2024 12:09:09 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 21 Mar 2024 12:09:09 -0500
Received: from localhost (udba0500997.dhcp.ti.com [128.247.81.249])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42LH99m8076614;
	Thu, 21 Mar 2024 12:09:09 -0500
Date: Thu, 21 Mar 2024 12:09:09 -0500
From: Brandon Brnich <b-brnich@ti.com>
To: Ivan Bornyakov <brnkv.i1@gmail.com>
CC: Nas Chung <nas.chung@chipsnmedia.com>,
        Philipp Zabel
	<p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "jackson.lee"
	<jackson.lee@chipsnmedia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 5/6] media: chips-media: wave5: refine SRAM usage
Message-ID: <20240321170909.efjyfjx3gno5yc5e@udba0500997>
References: <20240318144225.30835-1-brnkv.i1@gmail.com>
 <20240318144225.30835-6-brnkv.i1@gmail.com>
 <SL2P216MB1246F7FA7E95896AA2409C90FB2C2@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
 <hpqhbksvyfbqjumopk2k2drxri2ycb6j2dbdo74cfymcd7blgx@kzomazfosfwg>
 <20240319210106.awn33cm7ex33g65b@udba0500997>
 <SL2P216MB12468C7256CE2468EE088E7CFB322@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
 <tg32tsfnj3pmboaaeslvrmf7wtvznagio3vtqot42iflz5lvh7@25s5ykv3dfuz>
 <20240321161405.i3xnyuqnfwzyomex@udba0500997>
 <mhh25et5r36zr332iselgtmwuynl644zggw2h66ypjy5wyov5t@heve5x2z4njz>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <mhh25et5r36zr332iselgtmwuynl644zggw2h66ypjy5wyov5t@heve5x2z4njz>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

On 19:41-20240321, Ivan Bornyakov wrote:
> On Thu, Mar 21, 2024 at 11:14:05AM -0500, Brandon Brnich wrote:
> > Hi Ivan, 
> > 
> > On 13:52-20240321, Ivan Bornyakov wrote:
> > > Hi!
> > > 
> > > On Thu, Mar 21, 2024 at 09:29:04AM +0000, Nas Chung wrote:
> > > > Hi, Ivan and Brandon.
> > > > 
> > > > >-----Original Message-----
> > > > >On 14:24-20240319, Ivan Bornyakov wrote:
> > > > >> Hello, Nas
> > > > >>
> > > > >> On Tue, Mar 19, 2024 at 10:56:22AM +0000, Nas Chung wrote:
> > > > >> > Hi, Ivan.
> > > > >> >
> > > > >> > >
> > > > >> > >Allocate SRAM memory on module probe, free on remove. There is no
> > > > >need
> > > > >> > >to allocate on device open, free on close, the memory is the same
> > > > >every
> > > > >> > >time.
> > > > >> >
> > > > >> > If there is no decoder/encoder instance, driver don't need to
> > > > >allocate SRAM memory.
> > > > >> > The main reason of allocating the memory in open() is to allow other
> > > > >modules to
> > > > >> > use more SRAM memory, if wave5 is not working.
> > > > >
> > > > >I have to agree with this statement. Moving allocation to probe results
> > > > >in wasting SRAM when VPU is not in use. VPU should only be allocating
> > > > >SRAM
> > > > >when a stream instance is running and free that back once all instances
> > > > >close.
> > > > >
> > > > >> > >
> > > > >> > >Also use gen_pool_size() to determine SRAM memory size to be
> > > > >allocated
> > > > >> > >instead of separate "sram-size" DT property to reduce duplication.
> > > > >> > >
> > > > >> > >Signed-off-by: Ivan Bornyakov <brnkv.i1@gmail.com>
> > > > >> > >---
> > > > >> > > .../platform/chips-media/wave5/wave5-helper.c |  3 ---
> > > > >> > > .../platform/chips-media/wave5/wave5-vdi.c    | 21 ++++++++++-------
> > > > >--
> > > > >> > > .../chips-media/wave5/wave5-vpu-dec.c         |  2 --
> > > > >> > > .../chips-media/wave5/wave5-vpu-enc.c         |  2 --
> > > > >> > > .../platform/chips-media/wave5/wave5-vpu.c    | 12 +++++------
> > > > >> > > .../platform/chips-media/wave5/wave5-vpuapi.h |  1 -
> > > > >> > > 6 files changed, 16 insertions(+), 25 deletions(-)
> > > > >> > >
> > > > >> > >diff --git a/drivers/media/platform/chips-media/wave5/wave5-helper.c
> > > > >> > >b/drivers/media/platform/chips-media/wave5/wave5-helper.c
> > > > >> > >index 8433ecab230c..ec710b838dfe 100644
> > > > >> > >--- a/drivers/media/platform/chips-media/wave5/wave5-helper.c
> > > > >> > >+++ b/drivers/media/platform/chips-media/wave5/wave5-helper.c
> > > > >> > >@@ -29,9 +29,6 @@ void wave5_cleanup_instance(struct vpu_instance
> > > > >*inst)
> > > > >> > > {
> > > > >> > > 	int i;
> > > > >> > >
> > > > >> > >-	if (list_is_singular(&inst->list))
> > > > >> > >-		wave5_vdi_free_sram(inst->dev);
> > > > >> > >-
> > > > >> > > 	for (i = 0; i < inst->fbc_buf_count; i++)
> > > > >> > > 		wave5_vpu_dec_reset_framebuffer(inst, i);
> > > > >> > >
> > > > >> > >diff --git a/drivers/media/platform/chips-media/wave5/wave5-vdi.c
> > > > >> > >b/drivers/media/platform/chips-media/wave5/wave5-vdi.c
> > > > >> > >index 3809f70bc0b4..ee671f5a2f37 100644
> > > > >> > >--- a/drivers/media/platform/chips-media/wave5/wave5-vdi.c
> > > > >> > >+++ b/drivers/media/platform/chips-media/wave5/wave5-vdi.c
> > > > >> > >@@ -174,16 +174,19 @@ int wave5_vdi_allocate_array(struct vpu_device
> > > > >> > >*vpu_dev, struct vpu_buf *array,
> > > > >> > > void wave5_vdi_allocate_sram(struct vpu_device *vpu_dev)
> > > > >> > > {
> > > > >> > > 	struct vpu_buf *vb = &vpu_dev->sram_buf;
> > > > >> > >+	dma_addr_t daddr;
> > > > >> > >+	void *vaddr;
> > > > >> > >+	size_t size;
> > > > >> > >
> > > > >> > >-	if (!vpu_dev->sram_pool || !vpu_dev->sram_size)
> > > > >> > >+	if (!vpu_dev->sram_pool || vb->vaddr)
> > > > >> > > 		return;
> > > > >> > >
> > > > >> > >-	if (!vb->vaddr) {
> > > > >> > >-		vb->size = vpu_dev->sram_size;
> > > > >> > >-		vb->vaddr = gen_pool_dma_alloc(vpu_dev->sram_pool, vb->size,
> > > > >> > >-					       &vb->daddr);
> > > > >> > >-		if (!vb->vaddr)
> > > > >> > >-			vb->size = 0;
> > > > >> > >+	size = gen_pool_size(vpu_dev->sram_pool);
> > > > >> > >+	vaddr = gen_pool_dma_alloc(vpu_dev->sram_pool, size, &daddr);
> > > > >> > >+	if (vaddr) {
> > > > >> > >+		vb->vaddr = vaddr;
> > > > >> > >+		vb->daddr = daddr;
> > > > >> > >+		vb->size = size;
> > > > >> > > 	}
> > > > >> > >
> > > > >> > > 	dev_dbg(vpu_dev->dev, "%s: sram daddr: %pad, size: %zu, vaddr:
> > > > >> > >0x%p\n",
> > > > >> > >@@ -197,9 +200,7 @@ void wave5_vdi_free_sram(struct vpu_device
> > > > >*vpu_dev)
> > > > >> > > 	if (!vb->size || !vb->vaddr)
> > > > >> > > 		return;
> > > > >> > >
> > > > >> > >-	if (vb->vaddr)
> > > > >> > >-		gen_pool_free(vpu_dev->sram_pool, (unsigned long)vb->vaddr,
> > > > >> > >-			      vb->size);
> > > > >> > >+	gen_pool_free(vpu_dev->sram_pool, (unsigned long)vb->vaddr, vb-
> > > > >> > >>size);
> > > > >> > >
> > > > >> > > 	memset(vb, 0, sizeof(*vb));
> > > > >> > > }
> > > > >> > >diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-
> > > > >dec.c
> > > > >> > >b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> > > > >> > >index aa0401f35d32..84dbe56216ad 100644
> > > > >> > >--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> > > > >> > >+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> > > > >> > >@@ -1854,8 +1854,6 @@ static int wave5_vpu_open_dec(struct file
> > > > >*filp)
> > > > >> > > 		goto cleanup_inst;
> > > > >> > > 	}
> > > > >> > >
> > > > >> > >-	wave5_vdi_allocate_sram(inst->dev);
> > > > >> > >-
> > > > >> > > 	return 0;
> > > > >> > >
> > > > >> > > cleanup_inst:
> > > > >> > >diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-
> > > > >enc.c
> > > > >> > >b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> > > > >> > >index 8bbf9d10b467..86ddcb82443b 100644
> > > > >> > >--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> > > > >> > >+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> > > > >> > >@@ -1727,8 +1727,6 @@ static int wave5_vpu_open_enc(struct file
> > > > >*filp)
> > > > >> > > 		goto cleanup_inst;
> > > > >> > > 	}
> > > > >> > >
> > > > >> > >-	wave5_vdi_allocate_sram(inst->dev);
> > > > >> > >-
> > > > >> > > 	return 0;
> > > > >> > >
> > > > >> > > cleanup_inst:
> > > > >> > >diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> > > > >> > >b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> > > > >> > >index f3ecadefd37a..2a0a70dd7062 100644
> > > > >> > >--- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> > > > >> > >+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> > > > >> > >@@ -178,16 +178,11 @@ static int wave5_vpu_probe(struct
> > > > >platform_device
> > > > >> > >*pdev)
> > > > >> > > 		return ret;
> > > > >> > > 	}
> > > > >> > >
> > > > >> > >-	ret = of_property_read_u32(pdev->dev.of_node, "sram-size",
> > > > >> > >-				   &dev->sram_size);
> > > > >> > >-	if (ret) {
> > > > >> > >-		dev_warn(&pdev->dev, "sram-size not found\n");
> > > > >> > >-		dev->sram_size = 0;
> > > > >> > >-	}
> > > > >> > >-
> > > > >> >
> > > > >> > Required SRAM size is different from each wave5 product.
> > > > >> > And, SoC vendor also can configure the different SRAM size
> > > > >> > depend on target SoC specification even they use the same wave5
> > > > >product.
> > > > >> >
> > > > >>
> > > > >> One can limit iomem address range in SRAM node. Here is the example of
> > > > >> how I setup Wave515 with SRAM:
> > > > >>
> > > > >> 	sram@2000000 {
> > > > >> 		compatible = "mmio-sram";
> > > > >> 		reg = <0x0 0x2000000 0x0 0x80000>;
> > > > >> 		#address-cells = <1>;
> > > > >> 		#size-cells = <1>;
> > > > >> 		ranges = <0x0 0x0 0x2000000 0x80000>;
> > > > >>
> > > > >> 		wave515_vpu_sram: wave515-vpu-sram@0 {
> > > > >> 			reg = <0x0 0x80000>;
> > > > >> 			pool;
> > > > >> 		};
> > > > >> 	};
> > > > >>
> > > > >> 	wave515@410000 {
> > > > >> 		compatible = "cnm,wave515";
> > > > >> 		reg = <0x0 0x410000 0x0 0x10000>;
> > > > >> 		clocks = <&clk_ref1>;
> > > > >> 		clock-names = "videc";
> > > > >> 		interrupt-parent = <&wave515_intc>;
> > > > >> 		interrupts = <16 IRQ_TYPE_LEVEL_HIGH>;
> > > > >> 		resets = <&wave515_reset 0>,
> > > > >> 			 <&wave515_reset 4>,
> > > > >> 			 <&wave515_reset 8>,
> > > > >> 			 <&wave515_reset 12>;
> > > > >> 		sram = <&wave515_vpu_sram>;
> > > > >> 	};
> > > > >>
> > > > >> gen_pool_size() returns size of wave515_vpu_sram, no need for extra
> > > > >> "sram-size" property.
> > > > 
> > > > Thanks for sharing the example.
> > > > I agree that the "sram-size" property is not needed.
> > > > 
> > > > >
> > > > >"sram-size" property does need to be removed, as this was the consensus
> > > > >gathered from my patch[0]. However, I think your method is still taking
> > > > 
> > > > I missed the previous consensus for the sram-size property.
> > > > Thanks for letting me know.
> > > > 
> > > > >a more static approach. One of the recommendations in my thread[1] was
> > > > >making a list of known SRAM sizes given typical resolutions and
> > > > >iterating through until a valid allocation is done. I don't think this
> > > > >is the correct approach either based on Nas's comment that each Wave5
> > > > >has different SRAM size requirement. It would clutter up the file too
> > > > >much if each wave5 product had its own SRAM size mapping.
> > > > >
> > > > >Could another approach be to change Wave5 dts node to have property set
> > > > >as "sram = <&sram>;" in your example, then driver calls
> > > > >gen_pool_availble to get size remaining? From there, a check could be
> > > > >put in place to make sure an unnecessary amount is not being allocated.
> > > > 
> > > > Ivan's approach looks good to me.
> > > > It is similar to your first patch, which adds the sram-size property
> > > > to configure different SRAM sizes for each device.
> > > > And, Driver won't know unnecessary amount is allocated before parsing
> > > > bitstream header.
> > 
> > I am aware of this, I should have been more specific. By unnecessary
> > amount, I meant something greater than the max use case for device.
> > Could we populate some macros that have max SRAM required for 4K stream?
> > There's never a need to allocate more SRAM than that for a particular
> > instance. If the amount available is less than that, then fine. But it
> > should never be greater.
> > 
> > > > 
> > > 
> > > To sum up, there is 2 favourable approaches:
> > > 
> > > 1) to have dedicated SRAM partition for Wave5 VPU as suggested in this
> > > patchset. In this approach SoC vendor can setup address range of said
> > > partition to their needs, but other devices won't be able to use SRAM
> > > memory reserved for Wave5 VPU, unless other device's SRAM memory needs
> > > don't exceed the size of reserved partition.
> > > 
> > > Therefore it is sensible to substitute alloc/free on open/close with
> > > alloc/free on open/close.
> > 
> > Not sure what you mean here. Were you trying to refer to your
> > substitution of alloc/free from open/close to probe/remove?
> > 
> > If that is what you mean, and the decision is a specific carveout for
> > SRAM, then I don't see a point in having allocation in open and close
> > either since Wave5 would be the only IP that could use the pool.
> > 
> > > 
> > > Advantages: driver code is simpler, no need for platform-specific defines
> > > or DT properties. Wave5 is guaranteed to get SRAM memory.
> > > 
> > > Disadvantage: waste of SRAM memory while VPU is not in use
> > > 
> > > 2) allocate all available SRAM memory on open (free on close) from the
> > > common SRAM pool, but limit maximum amount with SoC-specific define.
> > > 
> > 
> > Why does it have to be on SoC specific define?
> 
> Well, if I understood correctly, in [1] Nas said that SRAM usage is
> SoC-specific even with same Wave5 IP.
>

I interpreted this as different Wave5 variants have varying SRAM
requirements. For ex, Wave521lc vs Wave515. If two SoCs have same
variant, the required SRAM won't change from Wave5 perspective. The size
would only really change based on how much SRAM is available on that
particular SoC. 
 
> [1] https://lore.kernel.org/linux-media/SL2P216MB1246F7FA7E95896AA2409C90FB2C2@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM/
> 
> > Max size required for SRAM in a 4K case is known.
> 
> From docs I have for Wave515 it's _seems_ to be about 64K, but it's not
> too clear.

I will let Nas comment on this, but 64K also sounds familiar to me.

> 
> > A call can be made to get the size of the
> > pool and from there the driver can take a portion. Just make sure that
> > portion is less than known value for 4K. 
> > 
> 
> Yeah, I did exactly that in v2, was about to send, until I got
> "Ivan's approach looks good to me" :)
> 
> > > Advantage: less memory waste
> > > 
> > > Disadvantages: still need SoC-specific define or DT property, not much
> > > differ from current state. Wave5 is not guaranteed to get SRAM memory.
> > > 
> > 
> > Wave5 does not need SRAM to function properly so it doesn't have to be
> > guaranteed. 
> > 
> 
> True.
> 
> > > Which of these approaches would be preferable?
> > > 
> > > > >
> > > > >
> > > > >[0]:
> > > > >https://lore.kernel.org/lkml/99bf4d6d988d426492fffc8de9015751c323bd8a.cam
> > > > >el@ndufresne.ca/
> > > > >[1]: https://lore.kernel.org/lkml/9c5b7b2c-8a66-4173-dfe9-
> > > > >5724ec5f733d@ti.com/
> > > > >
> > > > >Thanks,
> > > > >Brandon
> > > > >>
> > > > >> > Thanks.
> > > > >> > Nas.
> > > > >> >
> > > > >> > > 	dev->sram_pool = of_gen_pool_get(pdev->dev.of_node, "sram", 0);
> > > > >> > > 	if (!dev->sram_pool)
> > > > >> > > 		dev_warn(&pdev->dev, "sram node not found\n");
> > > > >> > >+	else
> > > > >> > >+		wave5_vdi_allocate_sram(dev);
> > > > >> > >
> > > > >> > > 	dev->product_code = wave5_vdi_read_register(dev,
> > > > >> > >VPU_PRODUCT_CODE_REGISTER);
> > > > >> > > 	ret = wave5_vdi_init(&pdev->dev);
> > > > >> > >@@ -259,6 +254,8 @@ static int wave5_vpu_probe(struct
> > > > >platform_device
> > > > >> > >*pdev)
> > > > >> > > err_clk_dis:
> > > > >> > > 	clk_bulk_disable_unprepare(dev->num_clks, dev->clks);
> > > > >> > >
> > > > >> > >+	wave5_vdi_free_sram(dev);
> > > > >> > >+
> > > > >> > > 	return ret;
> > > > >> > > }
> > > > >> > >
> > > > >> > >@@ -275,6 +272,7 @@ static void wave5_vpu_remove(struct
> > > > >platform_device
> > > > >> > >*pdev)
> > > > >> > > 	v4l2_device_unregister(&dev->v4l2_dev);
> > > > >> > > 	wave5_vdi_release(&pdev->dev);
> > > > >> > > 	ida_destroy(&dev->inst_ida);
> > > > >> > >+	wave5_vdi_free_sram(dev);
> > > > >> > > }
> > > > >> > >
> > > > >> > > static const struct wave5_match_data ti_wave521c_data = {
> > > > >> > >diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
> > > > >> > >b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
> > > > >> > >index fa62a85080b5..8d88381ac55e 100644
> > > > >> > >--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
> > > > >> > >+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
> > > > >> > >@@ -749,7 +749,6 @@ struct vpu_device {
> > > > >> > > 	struct vpu_attr attr;
> > > > >> > > 	struct vpu_buf common_mem;
> > > > >> > > 	u32 last_performance_cycles;
> > > > >> > >-	u32 sram_size;
> > > > >> > > 	struct gen_pool *sram_pool;
> > > > >> > > 	struct vpu_buf sram_buf;
> > > > >> > > 	void __iomem *vdb_register;
> > > > >> > >--
> > > > >> > >2.44.0
> > > > >> >
> > > > >>

