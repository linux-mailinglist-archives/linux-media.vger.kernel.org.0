Return-Path: <linux-media+bounces-17542-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 244B796B5CE
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 11:02:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C15321F2236E
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 09:02:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4907C1CF7A4;
	Wed,  4 Sep 2024 09:00:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3E71CF5D3
	for <linux-media@vger.kernel.org>; Wed,  4 Sep 2024 09:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725440445; cv=none; b=F8YyvMO6QSeCHiLczyseSEri3Dzo6x+XfN6HTd0fBohL/Dh5XsyQz3iPttxXp1NRI4a+5BzpcUWeP9KhhZO3Enn6UKsBgrK5jAhQw1eHjE8/0D72DcsE44HHgRo0jRJQ2BPBmMI1T/sTn1NpHulYljSb5fehIBV7ib73B6BjbgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725440445; c=relaxed/simple;
	bh=kKpbV7T5jUPtXTxocZYWVKGYgF7sZOsNV8TjbJGjq+4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=o4+CZmEyuVh9V4qAZG7oPWzxgmsNXSVwx3PHIixiBF6m5VYPsFzbjWw+L5ZSE/ZoI14W/tqZHMbwtnXNY+20YqbIGPVdh118oqWPzkE4GfM/KIL4L7kZb3kRdBtIFSuakbUuVgnTMr0RdLLZFVo3Ox5SQ8FJFVgCbXC4Dpvjr4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sllsR-0002wJ-AE; Wed, 04 Sep 2024 11:00:35 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sllsQ-005PYH-Jb; Wed, 04 Sep 2024 11:00:34 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sllsQ-0005LZ-1g;
	Wed, 04 Sep 2024 11:00:34 +0200
Message-ID: <d4d8746a388e9f939e3fac73b5b51044b53c02ee.camel@pengutronix.de>
Subject: Re: [PATCH] gpu: ipu-v3: image-convert: Drop unused single
 conversion request code
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Marek Vasut <marex@denx.de>, linux-media@vger.kernel.org
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Fabio
 Estevam <festevam@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo
 <shawnguo@kernel.org>,  Steve Longerbeam <slongerbeam@gmail.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org, 
 linux-staging@lists.linux.dev
Date: Wed, 04 Sep 2024 11:00:34 +0200
In-Reply-To: <20240713153524.107019-1-marex@denx.de>
References: <20240713153524.107019-1-marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

On Sa, 2024-07-13 at 17:35 +0200, Marek Vasut wrote:
> Neither ipu_image_convert_sync() nor ipu_image_convert() is used or call
> from anywhere. Remove this unused code.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>

Thank you,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

