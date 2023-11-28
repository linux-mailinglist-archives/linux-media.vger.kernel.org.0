Return-Path: <linux-media+bounces-1268-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C719D7FB97B
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 12:32:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E08EE1C21464
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 11:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CDDB4F88B;
	Tue, 28 Nov 2023 11:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="lfriMwoi"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80D72DE
	for <linux-media@vger.kernel.org>; Tue, 28 Nov 2023 03:32:21 -0800 (PST)
Received: from hillosipuli.retiisi.eu (185-9-10-242.cust.suomicom.net [185.9.10.242])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4SfgKY3pYnz49Q0d;
	Tue, 28 Nov 2023 13:32:14 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1701171138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MI0GeVp0nWKI/NOugLNQDPYWXbCAF3sed+WteK5iIwA=;
	b=lfriMwoiFVain+MwnmpGk2WbdjhW6mdA/9bXf7TkvAyzul4wfS9AQm/bWlr0fByaBUa/RY
	PdDkKMtGwNUosccDbxyrGDlNDrAED9kyOieoEB9awQinW4zi6MV1Iri9c7Wxw6/SAJuTqM
	gJiYg77Dg5vRQUyq4wN8ZBYjlpoG29XESm+zNmMTjsu8azBJ7kOtqtgdwLatY/d8AY5stV
	M7SwflQIgJX4C2UsVNkB/Lmjw8DfIsO5HUiTV1ATrKr+Kjj6IkhAM/rPwz2c1PRFdzuhfJ
	T/wye4+BXIqCS3ACi5TMe8DaBGJUxBl4YCeYA4dJ1qB3wTgSz3Hz+D/i6dzflw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1701171138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MI0GeVp0nWKI/NOugLNQDPYWXbCAF3sed+WteK5iIwA=;
	b=nxJDP+GJGUexsMtnIknBS8D5Dw2myzqRnN0XOfKuWQbp9Sx+JNfO3XlYXW6EXidEuDlFqg
	3u0+S8r2KxCy+VCu4RDjj2PYsvcThy4hZyOF52q+B6AdnLTmOQtZIRknh5v4sKQvxca6EX
	BD9CYpoX4YzwZcpSzgsGyTGOKE1oPXC2tRPskRrD1+QN2YYZ2cYNO/OSvPekXxOTM07OWq
	VUbcO11S2B5KcU9/qf8AkJbx34Yuzr9JZMooDM1bBqIHvmQvztxR193x2jkTxcOl4jbhta
	6S8jf5qfu2GLzP7dhcSbw7XRSEOgPc28e4TLmZG8a0nBsCovclZQdc8/sZp+ag==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1701171138; a=rsa-sha256;
	cv=none;
	b=e5L/zCoXfSsMoWTVm2VEAOAiHF3HccpjiR6fCUidlF0AYk63Iro8v1MHXEexwfOGyXhkqP
	MXTAVfcB9gu4V8e98ahDSMC9qau//KWbfEw6F4lJL9t0vUhNa/eYGoFPrKe/nzosYYG6mX
	EynDcA+qr1PzCFxrhlHsKcXRDyvNEw0hxnKPmaJ1QkvQ3opzNdk6Fz2/wPCrAiBqdv8RW+
	x1VIOB1k5rhGNAHKp1pO1Jj1XRYTyNdzxsnYvrb82UnsuVsB1BIEmAc6x9WiFLpMi8+VI3
	tlxxpTfCVdpZo7isMo+1Gg8CQbLjLi2QKGa1YVAkUd57/Y+KeLdv2cUrBwO8QQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 6BBAF634C93;
	Tue, 28 Nov 2023 13:32:14 +0200 (EET)
Date: Tue, 28 Nov 2023 11:32:14 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
	hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v7 00/31] Generic line based metadata support, internal
 pads
Message-ID: <ZWXPvvTA2SdyXoSj@valkosipuli.retiisi.eu>
References: <20231106122539.1268265-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231106122539.1268265-1-sakari.ailus@linux.intel.com>

On Mon, Nov 06, 2023 at 02:25:08PM +0200, Sakari Ailus wrote:
> <URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=metadata>

I've updated this, the patches are on top of the soon-to-be-merged
sub-device kAPI changes.

-- 
Sakari Ailus

