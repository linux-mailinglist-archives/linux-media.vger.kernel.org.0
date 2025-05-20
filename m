Return-Path: <linux-media+bounces-32915-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 30310ABD6C9
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 13:28:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 571984A0A02
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 11:28:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D40E27B517;
	Tue, 20 May 2025 11:28:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from ni.piap.pl (ni.piap.pl [195.187.100.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22FC27815B;
	Tue, 20 May 2025 11:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.187.100.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747740510; cv=none; b=fE8mvdZQqmfZQ3MaJ2c5fhYpmnECiAPjPl29ST3zUwfUEEnSnHihgfUa0j08rMprEx4tBb3psaECXAb9OKEeAXISWJL1IO9BIy8nYe1u9ouZlPYkDuJb1x4HrlgnZs0xDfruwWUbe/rYC22k2M+rl19giCReVzi1pru0tYO0pDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747740510; c=relaxed/simple;
	bh=rh9L2o/yrA2qFrgP2BkiU/biAuRHzdA3ItNyQQZiNHY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WprgwAzOBmG2BGBsJht9zPHu77D8wUotxiSRbIEaqTHp6tb+dzxcglSw/t98zAZ/dv2BO44TErJNiGAuevb8HN0hLL2zlS6mie8NO1JWUUzCXIdopT4KSrahne3AMYgt+OUaa9pFlPDWBd70obs9n/MCQvN0bJP694NRHOGlvZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl; spf=pass smtp.mailfrom=piap.pl; arc=none smtp.client-ip=195.187.100.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=piap.pl
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id 6D479C405A49;
	Tue, 20 May 2025 13:19:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 6D479C405A49
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,  Shawn Guo
 <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,  Fabio Estevam
 <festevam@gmail.com>,  linux-media@vger.kernel.org,  imx@lists.linux.dev,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i.MX8 ISI crossbar: simplify a couple of error messages
In-Reply-To: <20250509091549.GD28896@pendragon.ideasonboard.com> (Laurent
	Pinchart's message of "Fri, 9 May 2025 11:15:49 +0200")
References: <m3plgi9pwu.fsf@t19.piap.pl>
	<20250509091549.GD28896@pendragon.ideasonboard.com>
Sender: khalasa@piap.pl
Date: Tue, 20 May 2025 13:19:12 +0200
Message-ID: <m3sekz8r7z.fsf@t19.piap.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

Laurent Pinchart <laurent.pinchart@ideasonboard.com> writes:

> The goal was indeed to save memory.
>
>> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
>> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
>> @@ -352,9 +352,8 @@ static int mxc_isi_crossbar_enable_streams(struct v4=
l2_subdev *sd,
>>                                                sink_streams);
>>               if (ret) {
>>                       dev_err(xbar->isi->dev,
>> -                             "failed to %s streams 0x%llx on '%s':%u: %=
d\n",
>> -                             "enable", sink_streams, remote_sd->name,
>> -                             remote_pad, ret);
>> +                             "failed to enable streams 0x%llx on '%s':%=
u: %d\n",
>> +                             sink_streams, remote_sd->name, remote_pad,=
 ret);
>>                       mxc_isi_crossbar_gasket_disable(xbar, sink_pad);
>>                       return ret;
>>               }
>> @@ -392,9 +391,8 @@ static int mxc_isi_crossbar_disable_streams(struct v=
4l2_subdev *sd,
>>                                                 sink_streams);
>>               if (ret)
>>                       dev_err(xbar->isi->dev,
>> -                             "failed to %s streams 0x%llx on '%s':%u: %=
d\n",
>> -                             "disable", sink_streams, remote_sd->name,
>> -                             remote_pad, ret);
>> +                             "failed to disable streams 0x%llx on '%s':=
%u: %d\n",
>> +                             sink_streams, remote_sd->name, remote_pad,=
 ret);

It appears the current code saves (in my default build) 8 bytes of
memory, at the cost of readability and inability to search with grep:

Current:
Name          Size      File off
.text         00000bf4  00000040
.data         00000000  00000c34
.rodata.str1.8 000001b8 00000c38
__jump_table  00000030  00000df0
.rodata       000001b8  00000e20

With patch:
Name          Size      File off
.text         00000bd4  00000040
.data         00000000  00000c14
.rodata.str1.8 000001e0 00000c18
__jump_table  00000030  00000df8
.rodata       000001b8  00000e28

Built as a module it doesn't even save that - the number of pages stays
the same.

Just FYI.
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

