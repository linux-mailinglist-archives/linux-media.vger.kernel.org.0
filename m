Return-Path: <linux-media+bounces-15438-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2819993F282
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 12:22:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 82261B235F2
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 10:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F02E0143892;
	Mon, 29 Jul 2024 10:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="G9rHyDzx"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA74874055;
	Mon, 29 Jul 2024 10:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722248532; cv=none; b=r4hEdYbLJP2uBHkxY1K3zgtxqPzRClr4DfsNAggihWXGkC9NOZQuTJ7P2hs/ENpjZ8xgl4ZlsvrlrHFuD/lAKUulCUo6duURB7KvD7Veohbu4M9bw/LMbAF/nelmxvhxKUVHd9lG+QrR/fePADXhSBacSDYqHmhzmGt02BVWPzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722248532; c=relaxed/simple;
	bh=T/+I5gioquNPAl2GPXRSBKGt8H1nP3eq4MMZh0WDOm0=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=De5Zm0yVhhsVzZ30NxodknmxSeMykYgC5tysadtJlDx+eDDNAEBKr+OMLPfU8Aey/chiEWwc/ehw2DB70vjld8olFQe8PKRlObTqa8CFqFfCkPnktPJGLM6z/Z+vd+KUpUSH2rStDn8uYCg3yD7RmFaFKDcWhOHLzd5R3z3aETk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=G9rHyDzx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B013145A;
	Mon, 29 Jul 2024 12:21:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722248482;
	bh=T/+I5gioquNPAl2GPXRSBKGt8H1nP3eq4MMZh0WDOm0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=G9rHyDzxEH4D8CEfFEDs7pLMHsxBnd2wjoSz0lcS/Vz4KONSObU3WZkeDgCnDlD/l
	 XzYq1u44uw38W1rywRIIxHurHJlCsDUpWlICQOudPtqMR0B2YpXmNsxlwW/hAlPN1B
	 7DdPtegNFGvkvlX0QqYSsDBgia9rxsFfSYsCGOqY=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ZqdYqaMDWjHrNXPh@kekkonen.localdomain>
References: <20240729060535.3227-1-umang.jain@ideasonboard.com> <ZqdHpx7k6gzf-jSb@kekkonen.localdomain> <2dc31ed8-ad83-4051-8de3-6efaf1538714@ideasonboard.com> <ZqdYqaMDWjHrNXPh@kekkonen.localdomain>
Subject: Re: [PATCH] media: imx335: Fix reset-gpio handling
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-media@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, Tommaso Merciai <tomm.merciai@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Umang Jain <umang.jain@ideasonboard.com>
Date: Mon, 29 Jul 2024 11:22:06 +0100
Message-ID: <172224852603.392292.14437094530843053506@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Sakari Ailus (2024-07-29 09:54:01)
> Hi Umang,
>=20
> On Mon, Jul 29, 2024 at 02:19:32PM +0530, Umang Jain wrote:
> > Hi Sakari
> >=20
> > On 29/07/24 1:11 pm, Sakari Ailus wrote:
> > > Hi Umang,
> > >=20
> > > Thanks for the patch.
> > >=20
> > > On Mon, Jul 29, 2024 at 11:35:35AM +0530, Umang Jain wrote:
> > > > The imx335 reset-gpio is initialised with GPIO_OUT_LOW during probe.
> > > Should it be initialised to high instead, to enable reset?
> >=20
> > This initialization matches the physical line status, which is low in t=
his
> > case.
>=20
> Documentation/driver-api/gpio/consumer.rst:
>=20
>         * GPIOD_OUT_LOW to initialize the GPIO as output with a value of =
0.
>=20
> ...
>=20
>         Note that the initial value is *logical* and the physical line
>         level depends on whether the line is configured active high or
>         active low (see :ref:`active_low_semantics`).
>=20

Yes, I think this patch should also update/fix the call in
imx335_parse_hw_config()

	/* Request optional reset pin */
	imx335->reset_gpio =3D devm_gpiod_get_optional(imx335->dev, "reset",
-						     GPIOD_OUT_LOW);
+						     GPIOD_OUT_HIGH);

To make sure it starts off in reset until it's set accordingly in
imx335_power_{on,off}()

--
Kieran


> --=20
> Sakari Ailus

