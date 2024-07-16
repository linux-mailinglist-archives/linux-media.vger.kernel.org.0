Return-Path: <linux-media+bounces-15057-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFB693284A
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2024 16:25:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24C4D1F233AA
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2024 14:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0D7219D06A;
	Tue, 16 Jul 2024 14:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ITeDSib6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF9619CD01;
	Tue, 16 Jul 2024 14:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721139921; cv=none; b=UuLrPriGH7nTo4cFcnu5XKeDwV7hjYbhqHQcGID8y5DbReDCn5W1UEUDASw+pm/CBUDxoYDKOFLMCetvpgm5/dzCIxe4WJKUy41DUeW4lklb844pyPdRXI3yG+zgmfZPN/GdyEg9v2AORj9y3fDIOJcKlBUCd/FvvyEccx3+lxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721139921; c=relaxed/simple;
	bh=5Cs5/yuJS7C0LrLUUT7x3xOTTywKwe30zJ3Ar2z1pAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XOZSjPv/TxkdEOt2NH7fS2I9jo/jbeMm5g5Evnjclbl+XHl9GzE9y8rbNlauq8lFaHw3RnMS7bMq1rcBV7Z5h1UdcHgrsdCav+5hVH+or/LrBp8Zas7HBZon9IvKV75q3v/tKAnOvHLQYIDwF1RY2KL7wcTjcb5bT0o5hl5OpNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ITeDSib6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2001:b07:5d2e:52c9:72c3:346:a663:c82d])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B6A561083;
	Tue, 16 Jul 2024 16:24:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1721139878;
	bh=5Cs5/yuJS7C0LrLUUT7x3xOTTywKwe30zJ3Ar2z1pAI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ITeDSib61A2qyPWfdzpjJ95YKcGymC0431m931T25a959Xj9YNxsG/lxkx+A5E0PQ
	 ec+o903d8HfEim32WY+cEczT3olZlGV3gQnm2O6LH+6+DNSD2DZdxpfFydv9OiVceL
	 EMBQhUa6Aj6V6Zt7h+hQxeWvr1xkCDb7c49BB9wo=
Date: Tue, 16 Jul 2024 16:25:12 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Mingjia Zhang <mingjia.zhang@mediatek.com>, Jack Zhu <jack.zhu@starfivetech.com>, 
	Keith Zhao <keith.zhao@starfivetech.com>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>
Subject: Re: =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggdjUgMDIvMTRdIG1lZGlhOiBEb2N1?=
 =?utf-8?Q?mentation=3A?= Add description for StarFive ISP metadata formats
Message-ID: <v7eqp5opis3q327xgjvda37zrba32jyyfo2ny6u6i2ixq3ks2n@bp725fbn6gka>
References: <20240709083824.430473-1-changhuang.liang@starfivetech.com>
 <20240709083824.430473-3-changhuang.liang@starfivetech.com>
 <dncfjg7e7a2i6xin7kuwnxifcjpdjxcwkfcudxnqczi4lhwac7@u7jjunr7zqc6>
 <ZQ0PR01MB1302CB1DB67D3A36022B94B5F2A22@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZQ0PR01MB1302CB1DB67D3A36022B94B5F2A22@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>

Hi Changhuang

On Tue, Jul 16, 2024 at 12:31:31PM GMT, Changhuang Liang wrote:
> Hi, Jacopo
>
> >
> > Hi Changhuang
> >
> > On Tue, Jul 09, 2024 at 01:38:12AM GMT, Changhuang Liang wrote:
> > > Add description for V4L2_META_FMT_STF_ISP_PARAMS and
> > > V4L2_META_FMT_STF_ISP_STAT_3A meta data formats.
> > >
> > > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> >
> > I get this warnings when compiling documentation
> >
>
> Can you share the steps about compiling documentation?
>

From `make help`

-------------------------------------------------------------------------------
Documentation targets:
 Linux kernel internal documentation in different formats from ReST:
  htmldocs        - HTML
  texinfodocs     - Texinfo
  infodocs        - Info
  latexdocs       - LaTeX
  pdfdocs         - PDF
  epubdocs        - EPUB
  xmldocs         - XML
  linkcheckdocs   - check for broken external links
                    (will connect to external hosts)
  refcheckdocs    - check for references to non-existing files under
                    Documentation
  cleandocs       - clean all generated files

  make SPHINXDIRS="s1 s2" [target] Generate only docs of folder s1, s2
  valid values for SPHINXDIRS are: PCI RCU accel accounting admin-guide arch block bpf cdrom core-api cpu-freq crypto dev-tools devicetree doc-guide driver-api fault-injection fb filesystems firmware-guide fpga gpu hid hwmon i2c iio infiniband input isdn kbuild kernel-hacking leds livepatch locking maintainer mhi misc-devices mm netlabel networking pcmcia peci power powerpc process riscv rust scheduler scsi security sound spi staging target tee timers tools trace translations usb userspace-api virt w1 watchdog wmi
-------------------------------------------------------------------------------

To compile, in example, the userspace documentation in html:

`make $your-usual-args-here SPHINXDIRS="userspace-api" htmldocs`


> Regards,
> Changhuang

