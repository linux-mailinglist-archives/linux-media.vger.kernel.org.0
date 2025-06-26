Return-Path: <linux-media+bounces-35946-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A1CAE9C42
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 13:11:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1F5B176889
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 11:11:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0A622750F3;
	Thu, 26 Jun 2025 11:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZnkzJSjQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0302673B9;
	Thu, 26 Jun 2025 11:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750936295; cv=none; b=iztVfrxRF2pgXTB5PB/sTegwb6FROABKpXEBpOLJUEfLU2MUQpq/ZreRiX8lHeAC+tQ+d47NdVK+cKs4MB/h/UCzIBwdNCuu/u7mx4jO6iAl9a3hhwzl8Alq2YIX7usUut+QckCe3Bel1ga9cge2jaAOagrGKv1A62gxnxNqOzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750936295; c=relaxed/simple;
	bh=uYvThIeaKeJUiPpgcm2sjBtMIfpTK2d0un/v9h/EY38=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Ga+hO0mwHZCYmxJjypTmq33+tO49oK4exBOkPAmRixXBJrLnIH4coiZlg9waRfAX3Aa9e1eGeeOwFwTbKr1f24SxNVp9Eq4EY8CMSLBzMNOPlfD4P65KLm/xAyHmAFUzZp8XvLcFrUXxrS+f+es4NrKSihClqwiHm6ItiJWhSFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZnkzJSjQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 311806AE;
	Thu, 26 Jun 2025 13:11:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750936272;
	bh=uYvThIeaKeJUiPpgcm2sjBtMIfpTK2d0un/v9h/EY38=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ZnkzJSjQJ7JFvoj1vLbt6jYni1Su1fruuR9irFxYD4vNiWd9KhzcQTRqajrjZfhjK
	 mF91QoMGs3sqgtkGLCOJ6TozePOnOLcgxVyYO4hdUQrp5UVb19nqt6BMAisAse874c
	 nEggoUxLjngMdd2N85j1U7YYGJMLBbRhwV/g3Qko=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <fb719113-513f-44d9-82ae-63ff6aaca142@amd.com>
References: <20250609194321.1611419-1-pratap.nirujogi@amd.com> <6a49eb11-d434-4315-8ee9-0f8aa7347de2@intel.com> <aEygCdk-zEqRwfoF@kekkonen.localdomain> <3e8364e8-22e4-42ad-a0f0-017f86fd6bf9@amd.com> <20250623120929.GE826@pendragon.ideasonboard.com> <aFlU-E_GCHWBXErq@kekkonen.localdomain> <20250623134200.GB29597@pendragon.ideasonboard.com> <b6425dbe-44e6-47b4-a06b-b9a172a8cac4@amd.com> <fb719113-513f-44d9-82ae-63ff6aaca142@amd.com>
Subject: Re: [PATCH v3 RESEND] media: i2c: Add OV05C10 camera sensor driver
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Hao Yao <hao.yao@intel.com>, Pratap Nirujogi <pratap.nirujogi@amd.com>, mchehab@kernel.org, hverkuil@xs4all.nl, bryan.odonoghue@linaro.org, krzk@kernel.org, dave.stevenson@raspberrypi.com, hdegoede@redhat.com, jai.luthra@ideasonboard.com, tomi.valkeinen@ideasonboard.com, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, benjamin.chan@amd.com, bin.du@amd.com, grosikop@amd.com, king.li@amd.com, dantony@amd.com, vengutta@amd.com, dongcheng.yan@intel.com, jason.z.chen@intel.com, jimmy.su@intel.com, Svetoslav.Stoilov@amd.com, Yana.Zheleva@amd.com
To: "Nirujogi, Pratap" <pnirujog@amd.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Thu, 26 Jun 2025 12:11:27 +0100
Message-ID: <175093628786.4005407.10292502794888309807@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting Nirujogi, Pratap (2025-06-25 23:06:01)
> Hi Sakari, Hi Laurent,
>=20
> On 6/23/2025 5:55 PM, Nirujogi, Pratap wrote:
> [...]
> >>>> I think it can live in the driver for now. Given that the device uses
> >>>> only 8 bits of register address, I would store the page number in bi=
ts
> >>>> 15:8 instead of bits 31:24, as the CCI helpers do not make bits 27:24
> >>>> available for driver-specific purpose.
> >>>
> >>> I'd use the CCI private bits, the driver uses page numbers up to 4 so=
 4
> >>> bits are plenty for that. If we add pages to CCI later, this may be
> >>> refactored then.
> >>
> >> That works too.
> >>
> > Thanks for your support. We will add the page number in the register=20
> > address 15:8 or 11:8 and will update the implementation accordingly in =

> > the next version.
> >=20
> I would like to share the approach we are taking to implement the CCI=20
> helpers that support page value. Could you please review the steps and=20
> let us know if they make sense or if any adjustments are needed?
>=20
> 1: Add new macros to embed page value into the register address.
>=20
> Ex:
> #define CCI_PAGE_REG8(x, p)             ((1 << CCI_REG_WIDTH_SHIFT) | (p =
<<=20
> CCI_REG_PRIVATE_SHIFT) | (x))
> #define CCI_PAGE_REG16(x, p)            ((2 << CCI_REG_WIDTH_SHIFT) | (p =
<<=20
> CCI_REG_PRIVATE_SHIFT) | (x))
>=20
> 2: Create V4L2 CCI context. Initialize page control reg, current_page,=20
> regmap etc.
>=20
> Ex:
> struct v4l2_cci_ctx {
>         struct mutex lock;
>         struct regmap *map;
>         s16 current_page;
>         u8 page_ctrl_reg;
> }
>=20
> 3: Introduce new CCI helpers - cci_pwrite() and cci_pread() to handle=20
> register read-writes updating the page control register as necessary.

Out of curiosity - but couldn't the existing cci_write and cci_read
already be used by the users - and then the default behaviour is that
the page isn't modified if there is no page_ctrl_reg - and by default
CCI_REG() will simply have (initilised) as page 0 - so the pages will
never change on those calls?

Then the users can indeed define

#define TEST_PATTERN_PAGE 5
#define TEST_PATTERN_COLOUR_BARS BIT(3)

#define MY_TEST_PATTERN_REG CCI_PAGE_REG8(0x33, TEST_PATTERN_PAGE)

and can call=20
 cci_write(regmap, MY_TEST_PATTERN_REG, TEST_PATTERN_COLOUR_BARS, &ret);

with everything handled transparently ?


Or do you envisage more complications with the types of pages that might
be supportable ?

(I perfectly understand if I'm wishing for an unreachable utopia -
because I haven't considered something implicit about the page handling
that I haven't yet used :D)

--
Kieran


> int cci_pwrite(void *data, u32 reg, u64 val, int *err)
> {
>         /* get v4l2_cci_ctx context from data */
>=20
>         /* get page value from reg */
>=20
>         /* acquire mutex */
>=20
>         /* update cci page control reg, save current page value */
>        =20
>         /* do cci_write */
>=20
>         /* release mutex */
> }
>=20
> Similar steps for cci_pread() as well.
>=20
> Thanks,
> Pratap

