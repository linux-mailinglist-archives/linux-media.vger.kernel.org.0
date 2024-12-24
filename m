Return-Path: <linux-media+bounces-24032-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 111439FBB36
	for <lists+linux-media@lfdr.de>; Tue, 24 Dec 2024 10:33:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75A721881ABB
	for <lists+linux-media@lfdr.de>; Tue, 24 Dec 2024 09:33:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC2911AF0BA;
	Tue, 24 Dec 2024 09:32:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [83.223.78.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CD4EC0;
	Tue, 24 Dec 2024 09:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.78.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735032772; cv=none; b=OFwSy54tie+Y6ogSafBwJHWwZ7kCZCjN3RZ8pHrydSLDVaO0rgsmsTulwGWPdbUgagyi9Zz9r3Ayv0MGfRDq3UzKJx+3jGFuebUjOAvvO2o8EJyMISkBx+uauDOlZWJOAW2xlt3QLDXTup35jF9QW6MOHW+/3lV5UcfO8s26YkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735032772; c=relaxed/simple;
	bh=Bq6RvVtA760UcVrhdcHkxEvnV2EU3Br7mg1fMlFXvMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=insVrX2jWweqp4FXAHLoils7BaZPUuAg8k7w218AR5+csC00tqyEGtRXdhKpynOoIEQt2sc8EtEqOgeFe2Y7W0Jghy6h55JpTe8XK1P2ySSyd8aU5hq6wLDL8Y11ZBlU+fCTC3rRwbRpHi7XuKmm4yeBEMIoMlsnbS2LEfgsLd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=83.223.78.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id 377DF2800B6ED;
	Tue, 24 Dec 2024 10:32:41 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 1F95935A1C9; Tue, 24 Dec 2024 10:32:41 +0100 (CET)
Date: Tue, 24 Dec 2024 10:32:41 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: simona.vetter@ffwll.ch, Jens Wiklander <jens.wiklander@linaro.org>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org,
	Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
Message-ID: <Z2p_ucfNOyKcbWhH@wunner.de>
References: <20241217100809.3962439-1-jens.wiklander@linaro.org>
 <Z2KsuAs-Dd4ZDaXR@phenom.ffwll.local>
 <CAFA6WYNVHu7_-bNAuTYBRBdoJwfk2VrW5M4aFVkb_UWQ=uxTvQ@mail.gmail.com>
 <Z2p-v-xjhzhPso6u@wunner.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z2p-v-xjhzhPso6u@wunner.de>

On Tue, Dec 24, 2024 at 10:28:31AM +0100, Lukas Wunner wrote:
> I did raise a concern about this to the maintainer, but to no avail:
> https://lore.kernel.org/r/Z1Kym1-9ka8kGHrM@wunner.de/

Sorry, wrong link.  This is the one I meant to copy-paste... :(

https://lore.kernel.org/r/Z0rPxCGdD7r8HFKb@wunner.de/

