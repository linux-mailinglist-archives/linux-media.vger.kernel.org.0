Return-Path: <linux-media+bounces-24260-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E99EA0208E
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 09:22:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF7C11882B17
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 08:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22A871D63CF;
	Mon,  6 Jan 2025 08:22:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211961D5140
	for <linux-media@vger.kernel.org>; Mon,  6 Jan 2025 08:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736151747; cv=none; b=se3z/0jVOCuJlTHwXa+ypj+dws5SPxBd+UJ1181t2JndxnC7FWDk+5dHEwWTwOhSOjlCwZio6HsYOAEzqopwkafAevsZ8ExRK9bKmwolTE9eXOE7Xl8ER2u4o5yESOQdbwFcWdLQ5lEIqK9B8Fs9mLiyvlHVdULeLdDcn/nAdxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736151747; c=relaxed/simple;
	bh=xdUrKTXcAQCzx9FGKqSbwAY6SnvTnUfa1AcSbc7VMVg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TxC6COqju+h0PmCbB+qcCd9jrxOMS6GNHLs+JDwELNyMGkl4r0fZmyv+gi3gJLsOLrnUaE2/cK6cgzyIzIYXaCxagxyJoLhPsB+52uJVkpLYp68nRowEqPpui4vQMk7fm7ns75LEsjMp66lYAgZqw612h2saHStvhkBnYuZQfkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tUiNP-0001SK-BO; Mon, 06 Jan 2025 09:22:19 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tUiNM-0078HI-1n;
	Mon, 06 Jan 2025 09:22:17 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tUiNN-0008ei-0p;
	Mon, 06 Jan 2025 09:22:17 +0100
Message-ID: <ae47018fd7e1eb4be685040c74d32475741a45dc.camel@pengutronix.de>
Subject: Re: [PATCH] staging: media: imx: fix OF node leak in
 imx_media_add_of_subdevs()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, slongerbeam@gmail.com, 
	mchehab@kernel.org, gregkh@linuxfoundation.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com
Cc: linux-media@vger.kernel.org
Date: Mon, 06 Jan 2025 09:22:17 +0100
In-Reply-To: <20241224035411.2220404-1-joe@pf.is.s.u-tokyo.ac.jp>
References: <20241224035411.2220404-1-joe@pf.is.s.u-tokyo.ac.jp>
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

On Di, 2024-12-24 at 12:54 +0900, Joe Hattori wrote:
> imx_media_add_of_subdevs() calls of_parse_phandle() and passes the
> obtained node to imx_media_of_add_csi(). The passed node is used in
> v4l2_async_nf_add_fwnode(), which increments the refcount of the node.
> Therefore, while the current implementation only releases the node when
> imx_media_of_add_csi() fails, but should always release it. Call
> of_node_put() right after imx_media_of_add_csi().
>=20
> Fixes: dee747f88167 ("media: imx: Don't register IPU subdevs/links if CSI=
 port missing")
> Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>

Thank you,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

