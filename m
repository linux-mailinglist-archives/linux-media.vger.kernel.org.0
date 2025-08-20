Return-Path: <linux-media+bounces-40428-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E30CB2DE8A
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 16:02:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 70AC57B769E
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 14:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E313A262815;
	Wed, 20 Aug 2025 14:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="clcud02i"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E72525A341;
	Wed, 20 Aug 2025 14:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755698521; cv=none; b=j+wTHDhcDm2EKhc6/McUfm8cb+uJjjM10yGIlReJavwGl5pfvRN+nAeJtI++AwIAOKzgXLpMy50duDh5WzoAI8IG/oV2HNC6bFIBSzVNi75jd9+F9yrRF6Uaqp2+hJdkVddJrqFyoMudKqCU/eauvU5SyNxWXAyVdfn9KNgHdTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755698521; c=relaxed/simple;
	bh=Z176GSQLSegavImp3En2033NP/ktqan4wx0wmAMGZXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KBJYC5BVSUq6EQfbzdYDwPBMgdY4tynVjkS0JfQiCpyh6PDrPeoMcGyBtK6tazyODmF4mVtYzpHniB22zSr+16lS95p/QToU8OMOIcrs9CEsgQbVWoWDn4Qf281DM0rdVfKVNpRm/AZ+GIA9wGroDQrW9qzJWPGOKN9MnlUXe18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=clcud02i; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 1D7016AF;
	Wed, 20 Aug 2025 16:00:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755698459;
	bh=Z176GSQLSegavImp3En2033NP/ktqan4wx0wmAMGZXk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=clcud02inuNkyRl4ngZzWp5wKICyIAFK6bn5DZCZxqzkyQRTM/i6Lshq9oICXC8xF
	 I01mZ5IQpT7NVy4HJuy8eeAICMdXUey/XXnXONZ+ARfSpnctHclxYeddS4OA02+3NL
	 UzN0JESW/9NEQTxUqClkUklyGcuMZns50ga3NGxo=
Date: Wed, 20 Aug 2025 17:01:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Martin Kepplinger <martink@posteo.de>
Cc: mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: nxp: imx8-isi: check return value of
 media_pad_remote_pad_first()
Message-ID: <20250820140135.GA6190@pendragon.ideasonboard.com>
References: <20250205172957.182362-1-martink@posteo.de>
 <1f4b4e707762c0926c0acece18cb9cc3ecc242bc.camel@posteo.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1f4b4e707762c0926c0acece18cb9cc3ecc242bc.camel@posteo.de>

Hi Martin,

On Thu, Feb 06, 2025 at 08:49:37AM +0000, Martin Kepplinger wrote:
> Am Mittwoch, dem 05.02.2025 um 17:29 +0000 schrieb Martin Kepplinger-
> Novaković:
> > media_pad_remote_pad_first() return NULL if "no enabled link has been
> > found".
> > Check for that.
> > 
> > backstory
> > =========
> > While trying to get a (Y10 grey) sensor working on imx8mp (v6.12.12
> > now and
> > I know the hardware works on an ancient nxp-kernel),
> > I tried to enable the sensor link, set formats and stream:
> 
> btw, that's roughly the
> driver: https://github.com/VC-MIPI-modules/vc_mipi_nxp/tree/master/src
> that might need additions to with recent mainline kernels. Will the
> sensor be the reason for the link not being found here?

I've submitted
https://lore.kernel.org/linux-media/20250820140021.8026-1-laurent.pinchart@ideasonboard.com,
which should fix this issue in a more generic way.

-- 
Regards,

Laurent Pinchart

