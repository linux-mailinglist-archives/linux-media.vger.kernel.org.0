Return-Path: <linux-media+bounces-15355-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FFC93CF60
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2024 10:14:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 020E1281C94
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2024 08:14:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C26F5176AD6;
	Fri, 26 Jul 2024 08:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="o9qLQSb/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8927D45009;
	Fri, 26 Jul 2024 08:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721981684; cv=none; b=JOBzTEeKl9z2nKE8wUCwzfUjDMg9EZCmDsKb4PxI/YbdwTojCJq6+BfM1n7yuxDXREiD73OADsxVe8zeOslhUMiL7/40HSWmfGEjKmtYPz32zPWVTcn61c1Y1LqXM48sYxLLAhAOIDO/PeLxeDJgq25upD68GHYQ8/p4FLMQCHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721981684; c=relaxed/simple;
	bh=SaWF+4KJQU0XUGHZ2RnknEncK0bztWKxjR5PTu+Y7hE=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T9yH/vRaBdvJiC1kbDg7KL6KyW9DYp6xsgzDoV+PurPHBPoXE8zTVO8V8tkM3/fgXf5R+Yve+TBGmzkma0ROmWscNg3YCp10TlZtLtuRAF93m7XToXhpqLNQonky5oXGoN9vNYqj9afFrfCoQkK6kF0xmwXN0kDyUwYXvwn5PC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=o9qLQSb/; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46Q6nlm2014217;
	Fri, 26 Jul 2024 03:13:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=Fsrg6RkL3ljELUDbdF
	raOMnuDGBzLzBG9berJqeS99w=; b=o9qLQSb/6FYQi/W15D8/Q6B22hsutkg88J
	mNvNh/AZ9dtqrOtTI2R79TLXpy8lg1lRKFhIl6wq6uiLWlhJxh1WDOawKX7VlaCO
	eU4rIuRfd03jDKIDXA77BqwjD/sjpjlrViwwSQ4PT0Lh9y7BbLCx3sB5ScZRuZYJ
	vNZcORfK21t/q+SSA5prVTMc95eHtVjvLmZqXGyBKNQbnzb9vRk/fzqO4TR9DyPL
	kzPctMSGrBR/TxYyv0GJbep/oRCXMW0g49lRFREAm4X4hdll9PMJyP+uXK1OcV7U
	L5pHZHo0u48Al18wep6LoWHV38jlkQySIDlmkNZa06BVjUwfSSdg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 40m1mdr9bp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jul 2024 03:13:56 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 26 Jul
 2024 09:13:54 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Fri, 26 Jul 2024 09:13:54 +0100
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 8AA4D820244;
	Fri, 26 Jul 2024 08:13:54 +0000 (UTC)
Date: Fri, 26 Jul 2024 09:13:53 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
CC: Tim Harvey <tharvey@gateworks.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden
	<sbranden@broadcom.com>,
        Broadcom internal kernel review list
	<bcm-kernel-feedback-list@broadcom.com>,
        David Rhodes
	<david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu
	<baojun.xu@ti.com>,
        Olivier Moysan <olivier.moysan@foss.st.com>,
        "Arnaud
 Pouliquen" <arnaud.pouliquen@foss.st.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu
	<mhiramat@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>,
        <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [PATCH 2/2] ASoC: constify snd_soc_component_driver struct
Message-ID: <ZqNawRmAqBRLIoQq@opensource.cirrus.com>
References: <20240725-const_snd_soc_component_driver-v1-0-3d7ee08e129b@gmail.com>
 <20240725-const_snd_soc_component_driver-v1-2-3d7ee08e129b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240725-const_snd_soc_component_driver-v1-2-3d7ee08e129b@gmail.com>
X-Proofpoint-GUID: 5Vy4Ky4wKTO8OiKMKMdLcpITcmsfQPPw
X-Proofpoint-ORIG-GUID: 5Vy4Ky4wKTO8OiKMKMdLcpITcmsfQPPw
X-Proofpoint-Spam-Reason: safe

On Thu, Jul 25, 2024 at 12:31:40PM +0200, Javier Carrasco wrote:
> The instances of the `snd_soc_component_driver` struct are not modified
> after their declaration, and they are only passed to
> `devm_snd_soc_register_component()`, which expects a constant
> `snd_soc_component_driver`.
> 
> Move all instances of `snd_soc_component_driver` to read-only sections
> by declaring them const.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
>  sound/soc/codecs/cs43130.c           | 2 +-

> -static struct snd_soc_component_driver soc_component_dev_cs43130 = {
> +static const struct snd_soc_component_driver soc_component_dev_cs43130 = {
>  	.probe			= cs43130_probe,
>  	.controls		= cs43130_snd_controls,
>  	.num_controls		= ARRAY_SIZE(cs43130_snd_controls),

This won't work for cs43130, whilst what the driver does is
clearly slightly sketch it directly modifies this struct before
registering it with ASoC. That would need fixed first before this
change can be made.

Thanks,
Charles

