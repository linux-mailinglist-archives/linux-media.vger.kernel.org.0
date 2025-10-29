Return-Path: <linux-media+bounces-45943-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D1DC1AC74
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 14:38:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E163628540
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 13:13:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 050EA325710;
	Wed, 29 Oct 2025 13:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="jk5xCZs2"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4F2325709;
	Wed, 29 Oct 2025 13:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761743332; cv=pass; b=sYRcpMbN1iWfynIIZBig3w5F0OS9cmoJCcNm19qg0UY0l18W/5qm9CJZc7CUNU/PSRBXXv3Ld4sw2WHqoj5uku4UwAhcX6QEzvmKKUfzXCnXf6wfyfmfjTPyOzDJJpqsv/HAynRi+OUxuFv9eHtXftd4JJdqWkgOCZaMYYXWzRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761743332; c=relaxed/simple;
	bh=GbgKFbM23FJf40EYp3wxJOdmysbQkt83nRPhacGu1eA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M4OKU1ZBtS4AeQq/JKkeOMm5owun848jpz1HJGOuBGHOu5X6OGOuOwbYOHs4G3srn9hMpgeH49Bj5J/kC8klFX3zrxABL9b7IHl/ePuPGKoN7p7fr3sJZACg0ZtIPj4jdVO7wGXGy/CX61NpACbRa5JkltsPL3nNn9VqF3WBCls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=jk5xCZs2; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4cxSH81sV3z49Q8y;
	Wed, 29 Oct 2025 15:08:36 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1761743318;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9fpXvJaxUezX/qrHlm1Wc2qpJNkfgp6lz8sBDtu/HNk=;
	b=jk5xCZs2MhJ6YV0WbgnrB6KrYUYYgRll8qz+FZ0cYkqAiYwipqdWCnAi6lyXbGAZcJXqkE
	KzDf7WdkZ4Iil8qEkO9Rz/rPuLBO6YvqlFb56rpGJMSJq+/15HEcSsgVSBnaQewQF6j/YD
	9Vs2D2q2ZrW4d9BFtKP7GhX41Z0ogUZ3jDjgyeZGOV5w7qhB4VQOATBWZxVgKuEqDCRbbr
	v/YbFWdKeJw2aelyObzMQcIhHElcISRvozrd/pMfl2NAWfFn06fZvCFmg48TdXV1myVQsD
	Z2rU78zR5OPZvPkt/jnSj3MPAbvf62u7dQn4Jcq3iEY8Hu6LQy5PPOhZX1T8xQ==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1761743318; a=rsa-sha256;
	cv=none;
	b=tp2biwcG6TD4/1R1UJK1dPWB2mg9cHYaQB4U6s/t9jQe6+JFUsF4XZJblE6aur/0DJZcwm
	sxHFlwGztav721qoQBihahfdm/bprdIKl0SsWrzjp4p2vC768v7P6WcZX8iPqlEg9PTpoe
	AdnWDL/aA779EiDbvnxlFXmArGpmdeoC20MUXO8YP/GNZTN090o8SfrfT8oJjMQYnI2rgw
	QjuIwNcT1W6Zw5HV6w67EFWLpNrgr6FxjQddSzH4aMhF0MCDivo54T4BcOw90I/ov+WEhf
	rPwboAeQbaeJQUckruhackPuZIzNAououq6TDhhZR3kAA/8Uh5FRR6q60M2mgQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1761743318;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9fpXvJaxUezX/qrHlm1Wc2qpJNkfgp6lz8sBDtu/HNk=;
	b=ZvkgpX/FQ74zH8z7fM/WHCxsFU2vxWamDQJB/eW9eTWdtg1Psy+HGlAbjiCL0YMI4te1Td
	bgPPKLFWpKUpicreBmdu8Q42vBg+DsQm9nbe36xlwTxxtenKkyvDdmIsOIvVAX5Tj1bWjW
	NHqvQoEGys9BagIJhTLOr90fNNaodI+5ZIPvTuJYyzNRcteEGqVIlaY/ptmbb0PNMLPP4I
	jUdut+KtbNgnKmFmqfDwxDUjmqNQjujY3sbIe2lQhng9SOJocg6gIYnkn2pP6AREw74YJ6
	3dko+PeZACZS5t4NZa8q+Z0d8qWegf7KCwZp7CmDpwOawFYioXLbd8y1XknteA==
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id B6E39634C50;
	Wed, 29 Oct 2025 15:08:35 +0200 (EET)
Date: Wed, 29 Oct 2025 15:08:35 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Frank Li <Frank.li@nxp.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Alice Yuan <alice.yuan@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 03/31] media: v4l2-common: Add helper function
 media_bus_fmt_to_csi2_(bpp|dt)()
Message-ID: <aQIR03RD0BekWkmX@valkosipuli.retiisi.eu>
References: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
 <20250821-95_cam-v3-3-c9286fbb34b9@nxp.com>
 <aP81s4FDhj0-3WFh@valkosipuli.retiisi.eu>
 <aP+isGnWmJ4tLXcs@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aP+isGnWmJ4tLXcs@lizhi-Precision-Tower-5810>

Hi Frank,

On Mon, Oct 27, 2025 at 12:49:52PM -0400, Frank Li wrote:
> On Mon, Oct 27, 2025 at 11:04:51AM +0200, Sakari Ailus wrote:
> > > +/* DT value ref to MIPI Camera Serial Interface 2 Spec Ver4.1 section 9.4 */
> >
> > I'm not sure if I'd add such a reference here. At least it shouldn't be in
> > this patch.
> 
> Still not in v6.18-rc3. I add comments in this patch because try to add
> media_bus_fmt_to_csi2_dt().
> 
> If dt define is not standard, media_bus_fmt_to_csi2_dt() don't make sense.
> the difference vendor choose difference dt values.
> 
> I am fine create patch for it before this one.

Sounds good to me.

-- 
Sakari Ailus

