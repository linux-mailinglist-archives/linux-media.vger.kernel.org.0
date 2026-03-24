Return-Path: <linux-media+bounces-56822-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLGrKXdMwmnvbAQAu9opvQ
	(envelope-from <linux-media+bounces-56822-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 09:33:59 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0214B304B48
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 09:33:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 06FEB319FF31
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 08:18:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48FA336494E;
	Tue, 24 Mar 2026 08:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="wc0OwZ6q"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09702363095;
	Tue, 24 Mar 2026 08:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774340328; cv=pass; b=or91nhCnTnNKLENJtP4LahQmiXBipTQY36hxyTzuhKCCl0d5QcpaPUaD+vYrafNA+zJIq4MLgARktTtKur4j4DSkms+HhsHebZvvO89E7cdhvyG7HKy+XnyIIU28G43VhhgPW+xjeIVl1aPyQPH5t8GBrTEcqCqtByorCgjdWEY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774340328; c=relaxed/simple;
	bh=Q1dKR70HQFgxVCWflFpqcIFdbSxaqVVjYmsWy1/Btgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mAVCwjEZFPuCSFBbRFDr+FUZjNu08fwqjQEsG0cyNIStHuo6UI23z7ii6z6U/z8rCpzVAvG1LNEjDI3VgmEu1PCPR6OrfIPbkLpXEzneBBGy4KyrcoPxrHaKzzoj2vVMVAhku/s+s+Re1aBjCh7ABUlMUnKX54OAHj3NcLrKf54=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=wc0OwZ6q; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4fg2xC733NzyWD;
	Tue, 24 Mar 2026 10:18:39 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1774340320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VEtrtkfyr8g0UIJm7Rk/FT+do/iltAPNcZDSilZOzpU=;
	b=wc0OwZ6qUi2qFmuP56crqFkhDLm1ywwTsQRGDriZ/Fd1YQ3dfHqSa2Ij7f95gEw8RDQTwE
	DO36EaMd6AiFhrPG0tXoUdmYlUoHs0NXev+2e4GDKJNZruESR5E15iiY1mwyOPgRtaaATP
	B5D8DsSk/PGqtdKuiquyXdZN2OMt+DQ=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1774340320;
	b=KT6yMSh66+xRPt7l/BFGCaEJUIQynlX+I+aitukMPpfq1OkmZqWU8VXq5NmCq+O9BvvQn5
	uVhusQE5bLktcFNk9hndjoRk2FO2YyA/basH3QDLzOU9JBR3fps7nJR+ygm+WnvgxLRlMH
	1xK3mMitTfM//OSCwUS0mDeRoZkfCys=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1774340320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VEtrtkfyr8g0UIJm7Rk/FT+do/iltAPNcZDSilZOzpU=;
	b=NGss1c/cyEdX4OVc9iJZz6MElux3sZiAavXeToOMlYUUgP9I+h8GI1uoZph/Jq/vDJKjn4
	I+HG3C4CKCtziZ+1I3K5aSq/AM5FXkY/h8gYAlphfL7NbTtKs1Vp+xn6KjEB0lFcfnpDuh
	Kuw2UtSBTI087BVskBXOmJ5Vgq9FXbY=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 8D704634C4E;
	Tue, 24 Mar 2026 10:18:39 +0200 (EET)
Date: Tue, 24 Mar 2026 10:18:39 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Frank Li <Frank.li@nxp.com>
Cc: Michael Riesch <michael.riesch@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Guoniu Zhou <guoniu.zhou@oss.nxp.com>, imx@lists.linux.dev
Subject: Re: [PATCH 0/6] media: synopsys: Add imx93 support
Message-ID: <acJI3wYnl8_g4WpO@valkosipuli.retiisi.eu>
References: <20260210-imx93-dw-csi2-v1-0-69667bb86bfa@nxp.com>
 <acGQNIUKqfh8eWNB@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acGQNIUKqfh8eWNB@lizhi-Precision-Tower-5810>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_DKIM_ALLOW(-0.20)[iki.fi:s=meesny];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56822-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[iki.fi];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[iki.fi:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@iki.fi,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iki.fi:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,valkosipuli.retiisi.eu:mid]
X-Rspamd-Queue-Id: 0214B304B48
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 03:10:44PM -0400, Frank Li wrote:
> On Tue, Feb 10, 2026 at 12:11:07PM -0500, Frank Li wrote:
> > This 3rd time try to support DW CSI2RX support for imx93.
> >
> 
> Laurent Pinchart and Sakari Ailus:
> 
> 	I am not who will take care this patch?
> 	original drivers/media/platform/synopsys/dw-mipi-csi2rx.c picked
> by Sakari Ailus

Michael seems to have questions on the last patch, too.

-- 
Sakari Ailus

