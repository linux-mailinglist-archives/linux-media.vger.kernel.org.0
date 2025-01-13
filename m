Return-Path: <linux-media+bounces-24670-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FB2A0B1E3
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 09:58:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 455181886377
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 08:58:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37444238743;
	Mon, 13 Jan 2025 08:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Cd3ZP5WH"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9B1234977;
	Mon, 13 Jan 2025 08:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736758693; cv=none; b=esn5CGhxDpuGqpPRpe3zeHnMakelj41eMt1r9TabwA/qJaR+eA0cE/Hp5A+mrEsIsMHL5QYCI6qrsQm/pWsc49YnrMC3mTSYvWIJ3jsoaVx7CYEtLI7C2OEYB4mTVhlnBRLH0Z2i0L/vUY40Eb+SkPpDMCwFMADlaCY//i76bU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736758693; c=relaxed/simple;
	bh=wMaGapJaMN5Tcb3urEG5gUTDGthBO2xya3yIW/VUf6c=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H8ZobtNO8nyo6V+OJjl8jg+tnQM9uvb644gNyKxmmKfcfOy8XzglD9F53bxWJsxi5omxg02COl9MZ92zpXK1m2rb/eguwu8FfpJxnq53Wb5IkokaDyxtxKg0i0CKF0bjpH5x0kcWBbLrmhXG8p0Tc0L1B1p+ZmRY+Zq42YJZAaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Cd3ZP5WH; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D2hToA027841;
	Mon, 13 Jan 2025 09:57:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=selector1; bh=NA98flkcRX3iZq22t3Nzla7Q
	gw0N/tZv3BerTN5QpRs=; b=Cd3ZP5WHPIQx17atCrPy4B0yuH3aCTB4x4xT3QZ2
	y2hx9rillYCNvM1vjOshKXxouzn/wIGNNDXIr1bUD52EPzolT23JsMA6VBd9w/6G
	0tY1E+YycgCIF9p5L/rsGy7CM4otx1Gx1YSfdG09Pg/WDecm+q8Z4Az5pFCCNTex
	cVolpq/52va72AkJbslde9nauF99o8D6zc5gDS+seijPYufoyqNEfUJhMmWq4rcq
	zm9On8B+okBsTK3rA9cc2yaRiQ86T0dVWtwNv9Wr2XeqaqHnQgzxqttXvO4L5IXG
	OdfyaSeGyrelFUN0MRY0G3Gxcjk1zVHV239DawKgy/mbBQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 444t9x1530-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 09:57:55 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2E37740045;
	Mon, 13 Jan 2025 09:56:46 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B7AF4234551;
	Mon, 13 Jan 2025 09:55:58 +0100 (CET)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 13 Jan
 2025 09:55:58 +0100
Date: Mon, 13 Jan 2025 09:55:52 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 0/8] media: stm32: csi / dcmipp corrections
Message-ID: <20250113085529.GA499619@gnbcxd0016.gnb.st.com>
References: <20250108-csi_dcmipp_mp25_enhancements-v2-0-05808ce50e41@foss.st.com>
 <Z4DVj9ubGkAmkZKN@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z4DVj9ubGkAmkZKN@kekkonen.localdomain>
X-Disclaimer: ce message est personnel / this message is private
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Hi Sakari,

On Fri, Jan 10, 2025 at 08:08:47AM +0000, Sakari Ailus wrote:
> Hi Alain,
> 
> On Wed, Jan 08, 2025 at 02:16:03PM +0100, Alain Volmat wrote:
> > Various fixes within the stm32 csi bindings/drivers and
> > stm32 dcmipp driver.
> > 
> > Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> 
> Thanks for the update. I tried to apply this but it doesn't, and the
> culprit appears to be this line in dcmipp_graph_notify_bound():
> 
> 	unsigned int ret;
> 
> That appears to be a bug as such. The interesting thing is that the patch
> changing things around it presumes
> 
> 	int ret;
> 
> so it won't apply. Do you already have a patch that fixes it? It should be
> cc'd to stable, too, with a Fixes: tag.

Apologies for that, I might have made a mistake while rebase and somehow
a patch went before the b4 header commit. Pushing again a v3 with the
missing commit added.

Regards,
Alain

