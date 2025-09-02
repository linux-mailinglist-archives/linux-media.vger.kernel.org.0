Return-Path: <linux-media+bounces-41561-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A3AB3FDBB
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 13:23:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A8CEA1B2580D
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 11:24:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD6A92F7449;
	Tue,  2 Sep 2025 11:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="PV2qAiLP";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="R/6snUpu"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE72246BB4;
	Tue,  2 Sep 2025 11:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756812222; cv=none; b=P/LjOJRIxAeJA1FLu0EFCgTGRfgnNc6GQxFPaeIpZ15LlFAmn/FrDWZdkrXC/gqDjBjRPuMt7KuWdcMplvkkyRkrhSReDJhWzRiKP5eDVgP5Sj6L6cI1AGMB3ZxAZOjdLNylFXPQbDl4TPdWcKCS6RFWmKB5HPkjWPEBiqEUZyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756812222; c=relaxed/simple;
	bh=p/8ygFbEgtNV5wSQi1SEP1xqS2pYIN9T58TZ8hpdiH4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kRDuJEHgJyFeWCAEcgoa2UDTdQG0BQ0ryKxP9j5F2L6KeDP/Tiw+fGpg3nOkNMySbMtEL1tEZ6W7yTw7QLbH8xFCulKhyzUmSksAFi3EnBDr4t3buTqgAHOS3LWCroWYTFv9s5OObItE/sKkr5xypGJ3SgvEemf9NCBPH6fVmWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=PV2qAiLP; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=R/6snUpu reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1756812217; x=1788348217;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p/8ygFbEgtNV5wSQi1SEP1xqS2pYIN9T58TZ8hpdiH4=;
  b=PV2qAiLPtg2ehTwpdvb0StX4QRWLPgzYF+iGTZA43RTpbVAbRYm7Nz0K
   wf+FX1qk1+fxr/qUgTNzv7iEEJipdlMHZXpluggvss/jFaTHMGGKNdkYg
   z0TKkW5eD4k2hhNwxzoTtr8vRv+5udhtvPCmxbxvB+HFhkFtjrQ90fIEE
   hbOuMs9vaM8/oD5ZnHCXjMg/NXdmQ7wYyUB705hqEzf+nN4Dn6eP8tt4H
   Dpu36U6c4b0PQ7iXcIwGreGuG9+F/yF7w0skKpcTLuG62rShSWbLWGt57
   kRyxTFf1ERGeXNmPBCaLzHDVbcG1n4UIxGQSrgZilT1IsmbzIKP5Vziy0
   w==;
X-CSE-ConnectionGUID: /InFAUSAQBiDzQYzAB7Jhg==
X-CSE-MsgGUID: iRlDMovyTvqnQs9GRWqNCw==
X-IronPort-AV: E=Sophos;i="6.18,230,1751234400"; 
   d="scan'208";a="46028589"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 02 Sep 2025 13:23:27 +0200
X-CheckPoint: {68B6D3AF-1E-410E8DD8-CEA8F0F8}
X-MAIL-CPID: 9CBDA58469C4256730D2998464D30FAE_3
X-Control-Analysis: str=0001.0A002111.68B6D3AC.0013,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 05936164002;
	Tue,  2 Sep 2025 13:23:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1756812203;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=p/8ygFbEgtNV5wSQi1SEP1xqS2pYIN9T58TZ8hpdiH4=;
	b=R/6snUputxLjudPp2/0ad8T64Y4pm5GRb2KwnfMLVCp5LfZpqNekWLfHOny1No/XlzPB4I
	c+SEfmmfitLnJoO3RRVkFhB/t4V+lJn2Zd70ncslVuUh8X6VEp9c7av5zZbRmb8Fisgwmm
	XUXzDRq18/YnHkNkKGehYejfRuPbCoLa0GinSKWFcFDrPwM7Kny/NALHrmtXiS+1IYe9Le
	vBYpeQUA05O04JYpo9C+yr3kSmo6+Q1fsdKUM2xfiWYKaQ8dZLHlb26XucxMwh/4hdITDM
	t5NBsVIOX+V0NMqPPKbQ6ZgDMt1lfiqHpcc10nsVc8309/JGAWgCozg6jcGYtQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Adam Ford <aford173@gmail.com>,
 Krzysztof =?utf-8?B?SGHFgmFzYQ==?= <khalasa@piap.pl>
Cc: Stefan Klug <stefan.klug@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dafna Hirschfeld <dafna@fastmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Paul Elder <paul.elder@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Ondrej Jirman <megi@xff.cz>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: FYI: i.MX8MP ISP (RKISP1) MI registers corruption: resolved
Date: Tue, 02 Sep 2025 13:23:20 +0200
Message-ID: <5921855.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <m31popxjqk.fsf@t19.piap.pl>
References:
 <175308758352.3134829.9472501038683860006@localhost>
 <CAHCN7xKq_o_u7PhPMcZ2W9nzrFP8+CnhaYJOyxnjpKfbMTBCEw@mail.gmail.com>
 <m31popxjqk.fsf@t19.piap.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-Last-TLS-Session-Version: TLSv1.3

Am Dienstag, 2. September 2025, 11:54:27 CEST schrieb Krzysztof Ha=C5=82asa:
> Hi,
>=20
> summary:
>=20
> I've done a few additional tests and it seems the MEDIA_AXI clock is the
> problem. Reducing it to 400 MHz while still running MEDIA_ISP at 500 MHz
> produces no errors.
> MEDIA_ISP at 400 MHz and MEDIA_AXI at 500 MHz produces errors, though
> (register address errors while reading and writing from/to ISP MI
> (memory interface) registers, only on the secondary ISP (isp1), and
> generally only while streaming data from the ISP).
>=20
> What is driven by MEDIA_AXI clock root? MEDIAMIX: ISI, LCDIF, ISP, DWE.
>=20
> According to both datasheets (industrial and commercial), MEDIA_AXI
> is limited to 400 MHz in normal mode and 500 MHz in overdrive mode.
> All my hardware is setup for overdrive mode, though (two manufacturers,
> both using the same PMIC setup).
>=20
> Since no hardware in the official Linux kernel tree (DT) uses the second
> ISP... Should we just add a warning to the imx8mp.dtsi and be done with
> it?
> Out of tree hardware using isp1 (csi1) obviously exists.

There is also [1] which addresses normal mode and clock limits. I don't know
if there is any progress.

Best regards
Alexander

[1] https://lore.kernel.org/all/20250218-imx8m-clk-v4-2-b7697dc2dcd0@pengut=
ronix.de/


=2D-=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/



