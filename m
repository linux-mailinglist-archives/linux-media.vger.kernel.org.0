Return-Path: <linux-media+bounces-15064-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FA393379D
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2024 09:11:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69A111F23E04
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2024 07:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10DFD1BC39;
	Wed, 17 Jul 2024 07:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="n2HfgC7Y"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AA418EB1;
	Wed, 17 Jul 2024 07:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721200293; cv=none; b=pBnBjds/LDNTiXaJHfnGC7e1JySheaTms8yPAaiQ6Q1Xwyc2POD9amS8R8V/YB4nAPYkoJtihmoOjGKBV5x1XhJnPzipIVD/yuGC9SKwh+se/f+M5Fxd2aAxjPXXJLfdONW965D5ZQQllAXyUwQ+gb5CPf+SAPZnMElrfV8OabY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721200293; c=relaxed/simple;
	bh=tR3wJwyFdhNyJtUUxi/dkYFY2aD/hwTtjtR3hBxRKEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=je6yvUger/tpzjtj7TsCB4t7rIIku314kLl1hPa7rIkT9x/0guJnVd3Uqmvqfto62UBE8rmiawOwdCDHuZXlxLyoipm70+Oshnhf/QZGus3NlQcer4VGgXcRX81z4HKIN8CKv2qBzmFwNbc97Duu/KU1KwvyRVqBl+X9fpPB99A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=n2HfgC7Y; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BB5E266F;
	Wed, 17 Jul 2024 09:10:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1721200250;
	bh=tR3wJwyFdhNyJtUUxi/dkYFY2aD/hwTtjtR3hBxRKEE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n2HfgC7Y4fwNtJyT/IiqZsDz3S/k2BwvnKR6aacF5WcqGEGBRjptTNMQdTcjUpCAQ
	 uMdNbFv5q9tea4aZnExV2xsSHGTU0bVg9MDLCPctu278buxzKNql2tQ1HLNfr8hRSB
	 oSbC3clkxq5wITD5rvznvOk04RmQU7ewTV1krYgU=
Date: Wed, 17 Jul 2024 09:11:25 +0200
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
Subject: Re: =?utf-8?B?5Zue5aSNOiDlm57lpI06IFtQQVRDSCB2NSAwMi8xNF0gbWVk?=
 =?utf-8?Q?ia=3A_Documentation?= =?utf-8?Q?=3A?= Add description for StarFive
 ISP metadata formats
Message-ID: <vnxhxicsdke2jxtkexgpudjvuv2xzugsw4xjfmihrs4pa3yply@tva7yle3g2hb>
References: <20240709083824.430473-1-changhuang.liang@starfivetech.com>
 <20240709083824.430473-3-changhuang.liang@starfivetech.com>
 <dncfjg7e7a2i6xin7kuwnxifcjpdjxcwkfcudxnqczi4lhwac7@u7jjunr7zqc6>
 <ZQ0PR01MB1302CB1DB67D3A36022B94B5F2A22@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
 <v7eqp5opis3q327xgjvda37zrba32jyyfo2ny6u6i2ixq3ks2n@bp725fbn6gka>
 <ZQ0PR01MB1302B4A728A02184C65AEF2EF2A32@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZQ0PR01MB1302B4A728A02184C65AEF2EF2A32@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>

Hi Changhuang

On Wed, Jul 17, 2024 at 02:37:00AM GMT, Changhuang Liang wrote:
> Hi, Jacopo
>
> >
> > Hi Changhuang
> >
> > On Tue, Jul 16, 2024 at 12:31:31PM GMT, Changhuang Liang wrote:
> > > Hi, Jacopo
> > >
> > > >
> > > > Hi Changhuang
> > > >
> > > > On Tue, Jul 09, 2024 at 01:38:12AM GMT, Changhuang Liang wrote:
> > > > > Add description for V4L2_META_FMT_STF_ISP_PARAMS and
> > > > > V4L2_META_FMT_STF_ISP_STAT_3A meta data formats.
> > > > >
> > > > > Signed-off-by: Changhuang Liang
> > > > > <changhuang.liang@starfivetech.com>
> > > >
> > > > I get this warnings when compiling documentation
> > > >
> > >
> > > Can you share the steps about compiling documentation?
> > >
> >
> > From `make help`
> >
> > -------------------------------------------------------------------------------
> > Documentation targets:
> >  Linux kernel internal documentation in different formats from ReST:
> >   htmldocs        - HTML
> >   texinfodocs     - Texinfo
> >   infodocs        - Info
> >   latexdocs       - LaTeX
> >   pdfdocs         - PDF
> >   epubdocs        - EPUB
> >   xmldocs         - XML
> >   linkcheckdocs   - check for broken external links
> >                     (will connect to external hosts)
> >   refcheckdocs    - check for references to non-existing files under
> >                     Documentation
> >   cleandocs       - clean all generated files
> >
> >   make SPHINXDIRS="s1 s2" [target] Generate only docs of folder s1, s2
> >   valid values for SPHINXDIRS are: PCI RCU accel accounting admin-guide
> > arch block bpf cdrom core-api cpu-freq crypto dev-tools devicetree doc-guide
> > driver-api fault-injection fb filesystems firmware-guide fpga gpu hid hwmon
> > i2c iio infiniband input isdn kbuild kernel-hacking leds livepatch locking
> > maintainer mhi misc-devices mm netlabel networking pcmcia peci power
> > powerpc process riscv rust scheduler scsi security sound spi staging target tee
> > timers tools trace translations usb userspace-api virt w1 watchdog wmi
> > -------------------------------------------------------------------------------
> >
> > To compile, in example, the userspace documentation in html:
> >
> > `make $your-usual-args-here SPHINXDIRS="userspace-api" htmldocs`
> >
>
> What should $your-usual-args-here fill? Can you share your specific commands?

make -j24 ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- O=./linux-build SPHINXDIRS="userspace-api" htmldocs

Make sure to adapt it to your environment

>
> This is the result of my side run here:
>
> # make SPHINXDIRS="userspace-api" htmldocs
> /home/huang/workspace/upstream/linux/tools/net/ynl/ynl-gen-rst.py -i /home/huang/workspace/upstream/linux/Documentation/netlink/specs/rt_link.yaml -o /home/huang/workspace/upstream/linux/Documentation/networking/netlink_spec/rt_link.rst
> /home/huang/workspace/upstream/linux/tools/net/ynl/ynl-gen-rst.py -i /home/huang/workspace/upstream/linux/Documentation/netlink/specs/netdev.yaml -o /home/huang/workspace/upstream/linux/Documentation/networking/netlink_spec/netdev.rst
> /home/huang/workspace/upstream/linux/tools/net/ynl/ynl-gen-rst.py -i /home/huang/workspace/upstream/linux/Documentation/netlink/specs/ovs_vport.yaml -o /home/huang/workspace/upstream/linux/Documentation/networking/netlink_spec/ovs_vport.rst
> /home/huang/workspace/upstream/linux/tools/net/ynl/ynl-gen-rst.py -i /home/huang/workspace/upstream/linux/Documentation/netlink/specs/handshake.yaml -o /home/huang/workspace/upstream/linux/Documentation/networking/netlink_spec/handshake.rst
> /home/huang/workspace/upstream/linux/tools/net/ynl/ynl-gen-rst.py -i /home/huang/workspace/upstream/linux/Documentation/netlink/specs/fou.yaml -o /home/huang/workspace/upstream/linux/Documentation/networking/netlink_spec/fou.rst
> /home/huang/workspace/upstream/linux/tools/net/ynl/ynl-gen-rst.py -i /home/huang/workspace/upstream/linux/Documentation/netlink/specs/nftables.yaml -o /home/huang/workspace/upstream/linux/Documentation/networking/netlink_spec/nftables.rst
> /home/huang/workspace/upstream/linux/tools/net/ynl/ynl-gen-rst.py -i /home/huang/workspace/upstream/linux/Documentation/netlink/specs/ovs_datapath.yaml -o /home/huang/workspace/upstream/linux/Documentation/networking/netlink_spec/ovs_datapath.rst
> /home/huang/workspace/upstream/linux/tools/net/ynl/ynl-gen-rst.py -i /home/huang/workspace/upstream/linux/Documentation/netlink/specs/nfsd.yaml -o /home/huang/workspace/upstream/linux/Documentation/networking/netlink_spec/nfsd.rst
> /home/huang/workspace/upstream/linux/tools/net/ynl/ynl-gen-rst.py -i /home/huang/workspace/upstream/linux/Documentation/netlink/specs/dpll.yaml -o /home/huang/workspace/upstream/linux/Documentation/networking/netlink_spec/dpll.rst
> /home/huang/workspace/upstream/linux/tools/net/ynl/ynl-gen-rst.py -i /home/huang/workspace/upstream/linux/Documentation/netlink/specs/nlctrl.yaml -o /home/huang/workspace/upstream/linux/Documentation/networking/netlink_spec/nlctrl.rst
> /home/huang/workspace/upstream/linux/tools/net/ynl/ynl-gen-rst.py -i /home/huang/workspace/upstream/linux/Documentation/netlink/specs/ethtool.yaml -o /home/huang/workspace/upstream/linux/Documentation/networking/netlink_spec/ethtool.rst
> /home/huang/workspace/upstream/linux/tools/net/ynl/ynl-gen-rst.py -i /home/huang/workspace/upstream/linux/Documentation/netlink/specs/mptcp_pm.yaml -o /home/huang/workspace/upstream/linux/Documentation/networking/netlink_spec/mptcp_pm.rst
> /home/huang/workspace/upstream/linux/tools/net/ynl/ynl-gen-rst.py -i /home/huang/workspace/upstream/linux/Documentation/netlink/specs/rt_route.yaml -o /home/huang/workspace/upstream/linux/Documentation/networking/netlink_spec/rt_route.rst
> /home/huang/workspace/upstream/linux/tools/net/ynl/ynl-gen-rst.py -i /home/huang/workspace/upstream/linux/Documentation/netlink/specs/team.yaml -o /home/huang/workspace/upstream/linux/Documentation/networking/netlink_spec/team.rst
> /home/huang/workspace/upstream/linux/tools/net/ynl/ynl-gen-rst.py -i /home/huang/workspace/upstream/linux/Documentation/netlink/specs/devlink.yaml -o /home/huang/workspace/upstream/linux/Documentation/networking/netlink_spec/devlink.rst
> /home/huang/workspace/upstream/linux/tools/net/ynl/ynl-gen-rst.py -i /home/huang/workspace/upstream/linux/Documentation/netlink/specs/rt_addr.yaml -o /home/huang/workspace/upstream/linux/Documentation/networking/netlink_spec/rt_addr.rst
> /home/huang/workspace/upstream/linux/tools/net/ynl/ynl-gen-rst.py -i /home/huang/workspace/upstream/linux/Documentation/netlink/specs/ovs_flow.yaml -o /home/huang/workspace/upstream/linux/Documentation/networking/netlink_spec/ovs_flow.rst
> /home/huang/workspace/upstream/linux/tools/net/ynl/ynl-gen-rst.py -i /home/huang/workspace/upstream/linux/Documentation/netlink/specs/tc.yaml -o /home/huang/workspace/upstream/linux/Documentation/networking/netlink_spec/tc.rst
> /home/huang/workspace/upstream/linux/tools/net/ynl/ynl-gen-rst.py -o /home/huang/workspace/upstream/linux/Documentation/networking/netlink_spec/index.rst -x
> make: *** empty variable name.  Stop.
> make: *** [Makefile:122: htmldocs] Error 2
>
> Is there any special environment configuration present?
>
> Regards,
> Changhuang

