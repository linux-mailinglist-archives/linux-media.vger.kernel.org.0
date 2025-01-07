Return-Path: <linux-media+bounces-24356-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF28A04729
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 17:52:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 400C47A0F62
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 16:52:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B9DD16F0FE;
	Tue,  7 Jan 2025 16:52:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CCD189BB3
	for <linux-media@vger.kernel.org>; Tue,  7 Jan 2025 16:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736268767; cv=none; b=UflhSjhEznwNPJhVhVr72SVIKrNKN7TybwJXnY1opTFfzjkGHw9tnC3dKz4ZjrVncRfZF6r1ZLUSdWXtC3oJJPP8r8SXypnP1QJTtPWHSSip/Sqmwcqp0UNcCaWw18itZJBcQfTumztN8KkM4R6ccgmVk4xypAOXMWbNIoKd5eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736268767; c=relaxed/simple;
	bh=/KAIwBwIGm47eBcQhTyrRSdCbiKPhxyxYD8Aktgyp9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ogbRa5XFvOI5UAXLh/FIq3/N+sxP+f5fzT0l/1DRlAKH1b3IzmKzAU8cbeHgoksq+CgqePcnJbCKpt7jOUEBm2G+/6ouEBFf2FQyaowmyjIArtAGAuH8hHikXVeKbdNzc1maZ8ERKMlSP17QXl1bqILrE28r8dITKTm8XussZOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1tVCoo-0003zK-Kt; Tue, 07 Jan 2025 17:52:38 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tVCon-007NO4-29;
	Tue, 07 Jan 2025 17:52:38 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tVCoo-009cgO-18;
	Tue, 07 Jan 2025 17:52:38 +0100
Date: Tue, 7 Jan 2025 17:52:38 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Matthias Fend <matthias.fend@emfend.at>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: tc358746: improve calculation of the D-PHY timing
 registers
Message-ID: <20250107165238.vyuzjbzz6yn3cdxs@pengutronix.de>
References: <20250107160702.641703-1-matthias.fend@emfend.at>
 <20250107160702.641703-2-matthias.fend@emfend.at>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107160702.641703-2-matthias.fend@emfend.at>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

On 25-01-07, Matthias Fend wrote:
> When calculating D-PHY registers, using data rates that are not multiples
> of 16 can lead to precision loss in division operations. This can result in
> register values that produce timing violations against the MIPI standard.
> 
> An example:
> cfg->hs_clk_rate = 294MHz
> hf_clk = 18
> 
> If the desired value in cfg->init is 100us, which is the minimum allowed
> value, then the LINEINITCNT register is calculated as 1799. But since the
> actual clock is 18.375MHz instead of 18MHz, this setting results in a time
> that is shorter than 100us and thus violates the standard. The correct
> value for LINEINITCNT would be 1837.
> 
> Improve the precision of calculations by using Hz instead of MHz as unit.
> 
> Signed-off-by: Matthias Fend <matthias.fend@emfend.at>

Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>

