Return-Path: <linux-media+bounces-24355-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D169A0471E
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 17:50:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 731027A15DC
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 16:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 611551E9B09;
	Tue,  7 Jan 2025 16:50:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F75219EB
	for <linux-media@vger.kernel.org>; Tue,  7 Jan 2025 16:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736268645; cv=none; b=BEz8DAH/bGJd+mAtzBGn3dgMTANSO1lR6xRBRdm6NCDQeg/+QOd+oyeMEHO/zApy+YsePb1Ak0sgJfGaseknWI/63O11tecjPUlECB90a/zBR4NTBReEXEKMD+V8anjpzv7jezh8/MZKIF6xQnmauEiv6VeG5jaq547LCswNVAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736268645; c=relaxed/simple;
	bh=PBE+r4eyi3RMY7BARGiWUYFgV0sTenu7xjI183PuecM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tnnyHtjbQCwU12lk2aJ1SNR0uYpMx6GgJPC7Yg20Mf/T5KAsKelodl3Jg5xb9th/xVZUqdwyWdGHSJbSWtRAkdVlEOUFQKwAzhF8Dig9Ad2/JjA/deIZvYjWuEY+RTP4DkvNRs+FAO0rXACXoaGYIWNpEQCUJ3OTmJHju5kmZxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1tVCmp-0003ZU-KI; Tue, 07 Jan 2025 17:50:35 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tVCmo-007NNo-29;
	Tue, 07 Jan 2025 17:50:35 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tVCmp-009cfP-18;
	Tue, 07 Jan 2025 17:50:35 +0100
Date: Tue, 7 Jan 2025 17:50:35 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Matthias Fend <matthias.fend@emfend.at>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: tc358746: add support for 8/10/12/14-bit RAW
 Bayer formats
Message-ID: <20250107165035.k72zqkyxbcrylecd@pengutronix.de>
References: <20250107160702.641703-1-matthias.fend@emfend.at>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107160702.641703-1-matthias.fend@emfend.at>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

On 25-01-07, Matthias Fend wrote:
> The TC358746 supports RAW formats with 8, 10, 12, and 14-bit depths. Since
> pixel data is transported transparently without modifying the pixel
> arrangement, all Bayer patterns (RGGB, BGGR, GRBG, GBRG) are supported.
> 
> Signed-off-by: Matthias Fend <matthias.fend@emfend.at>

Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>

