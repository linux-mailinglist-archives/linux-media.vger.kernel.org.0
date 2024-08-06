Return-Path: <linux-media+bounces-15869-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B86A949B5F
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 00:38:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB55A283705
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2024 22:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76093173336;
	Tue,  6 Aug 2024 22:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="VCyE9X62"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp-fw-80008.amazon.com (smtp-fw-80008.amazon.com [99.78.197.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A31777F08;
	Tue,  6 Aug 2024 22:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=99.78.197.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722983911; cv=none; b=KKpO2BQfptfshomOu63uxIvzgY+7+TS4lMsX6Qi9+B+8IzHucXWTBCSCGRURb/hLhy/mNrm6IE75KXNqi4+wd4xr7lGXFcUeocAHIDgPsq5Gi2+ztjJ4aVvKJm8cEExRvgAwOQb2usqRiJY+DtanG88aKKk2OpbOUa54YFOQ540=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722983911; c=relaxed/simple;
	bh=aw2hedcbbQ15LOAsTM/yoeU9d3cY/k87+1xCMRhafE0=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KsYeyUdcmX3KgVg/fsOBp60nQj6C7TZBQ9YfssY/QMIkk1bViu0nAJqHicX+82/BrV3mdJN3nIaZNQfIVTvFTwFPF7g4aSQKju46X84Tecv00quLE0mMiGKOn8W9OoHfbGj0rGCse2MsDwif6h6gb3NW8PDyViqs862IKH5HPg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b=VCyE9X62; arc=none smtp.client-ip=99.78.197.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1722983910; x=1754519910;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=alT17QHgXA3/bEpwdaU1TeEystIV2QUhqeiAIwN2gs0=;
  b=VCyE9X62RHgFjfYO+Xhw2tYRDVkGuJu9xtU86XLngWCEIIAehsQCxI6y
   6Y+cNkhpINK+SP9BpzF+K3m8yK2+KEKZ1g9yXm2IfRE8eCGuQiWwLtJ8B
   awM5dK7UqFb2vuq9rY/zFIlW2JaPvBTw5/S6kqzOQVuwvA/cO/pwUzEU8
   4=;
X-IronPort-AV: E=Sophos;i="6.09,268,1716249600"; 
   d="scan'208";a="113089742"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.25.36.214])
  by smtp-border-fw-80008.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 22:38:29 +0000
Received: from EX19MTAUEC001.ant.amazon.com [10.0.44.209:10650]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.87.234:2525] with esmtp (Farcaster)
 id a6747138-ef4c-4899-80c8-33a03505f3b8; Tue, 6 Aug 2024 22:38:28 +0000 (UTC)
X-Farcaster-Flow-ID: a6747138-ef4c-4899-80c8-33a03505f3b8
Received: from EX19MTAUEA001.ant.amazon.com (10.252.134.203) by
 EX19MTAUEC001.ant.amazon.com (10.252.135.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Tue, 6 Aug 2024 22:38:27 +0000
Received: from dev-dsk-jorcrous-2c-c78924fd.us-west-2.amazon.com
 (172.23.179.86) by mail-relay.amazon.com (10.252.134.102) with Microsoft SMTP
 Server id 15.2.1258.34 via Frontend Transport; Tue, 6 Aug 2024 22:38:26 +0000
Received: by dev-dsk-jorcrous-2c-c78924fd.us-west-2.amazon.com (Postfix, from userid 14178300)
	id AF5B92EA; Tue,  6 Aug 2024 22:38:26 +0000 (UTC)
Date: Tue, 6 Aug 2024 22:38:26 +0000
From: Jordan Crouse <jorcrous@amazon.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
CC: <linux-media@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	<linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 2/2] media: camss: Avoid overwriting vfe clock rates
 for 8250
Message-ID: <20240806223822.GA24117@amazon.com>
References: <20240802152435.35796-1-jorcrous@amazon.com>
 <20240802152435.35796-3-jorcrous@amazon.com>
 <cc737b05-4476-4ded-9d1c-5924cfbce316@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cc737b05-4476-4ded-9d1c-5924cfbce316@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)

On Fri, Aug 02, 2024 at 11:20:17PM +0100, Bryan O'Donoghue wrote:
> 
> On 02/08/2024 16:24, Jordan Crouse wrote:
> >On sm8250 targets both the csid and vfe subsystems share a number of
> >clocks. Commit b4436a18eedb ("media: camss: add support for SM8250 camss")
> >reorganized the initialization sequence so that VFE gets initialized first
> >but a side effect of that was that the CSID subsystem came in after and
> >overwrites the set frequencies on the shared clocks.
> >
> >Empty the frequency tables for the shared clocks in the CSID resources so
> >they won't overwrite the clock rates that the VFE has already set.
> >
> >Signed-off-by: Jordan Crouse <jorcrous@amazon.com>
> >---
> >
> >  drivers/media/platform/qcom/camss/camss.c | 21 +++++++++++++++------
> >  1 file changed, 15 insertions(+), 6 deletions(-)
> >
> >diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> >index 51b1d3550421..d78644c3ebe9 100644
> >--- a/drivers/media/platform/qcom/camss/camss.c
> >+++ b/drivers/media/platform/qcom/camss/camss.c
> >@@ -915,6 +915,15 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
> >      }
> >  };
> >
> >+/*
> >+ * Both CSID and VFE use some of the same vfe clocks and both
> >+ * should prepare/enable them but only the VFE subsystem should be in charge
> >+ * of setting the clock rates.
> >+ *
> >+ * Set the frequency tables for those clocks in the CSID resources to
> >+ * be empty so the csid subsystem doesn't overwrite the clock rates that the
> >+ * VFE already set.
> >+ */
> >  static const struct camss_subdev_resources csid_res_8250[] = {
> >      /* CSID0 */
> >      {
> >@@ -922,8 +931,8 @@ static const struct camss_subdev_resources csid_res_8250[] = {
> >              .clock = { "vfe0_csid", "vfe0_cphy_rx", "vfe0", "vfe0_areg", "vfe0_ahb" },
> >              .clock_rate = { { 400000000 },
> >                              { 400000000 },
> >-                             { 350000000, 475000000, 576000000, 720000000 },
> >-                             { 100000000, 200000000, 300000000, 400000000 },
> >+                             { 0 },
> >+                             { 0 },
> >                              { 0 } },
> >              .reg = { "csid0" },
> >              .interrupt = { "csid0" },
> >@@ -939,8 +948,8 @@ static const struct camss_subdev_resources csid_res_8250[] = {
> >              .clock = { "vfe1_csid", "vfe1_cphy_rx", "vfe1", "vfe1_areg", "vfe1_ahb" },
> >              .clock_rate = { { 400000000 },
> >                              { 400000000 },
> >-                             { 350000000, 475000000, 576000000, 720000000 },
> >-                             { 100000000, 200000000, 300000000, 400000000 },
> >+                             { 0 },
> >+                             { 0 },
> >                              { 0 } },
> >              .reg = { "csid1" },
> >              .interrupt = { "csid1" },
> >@@ -956,7 +965,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
> >              .clock = { "vfe_lite_csid", "vfe_lite_cphy_rx", "vfe_lite",  "vfe_lite_ahb" },
> >              .clock_rate = { { 400000000 },
> >                              { 400000000 },
> >-                             { 400000000, 480000000 },
> >+                             { 0 },
> >                              { 0 } },
> >              .reg = { "csid2" },
> >              .interrupt = { "csid2" },
> >@@ -973,7 +982,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
> >              .clock = { "vfe_lite_csid", "vfe_lite_cphy_rx", "vfe_lite",  "vfe_lite_ahb" },
> >              .clock_rate = { { 400000000 },
> >                              { 400000000 },
> >-                             { 400000000, 480000000 },
> >+                             { 0 },
> >                              { 0 } },
> >              .reg = { "csid3" },
> >              .interrupt = { "csid3" },
> 
> Hi Jordan.
> 
> Thanks for your patch. Just looking at the clocks you are zeroing here,
> I think _probably_ these zeroized clocks can be removed from the CSID
> set entirely.
> 
> Could you investigate that ?

I think that will work. It will cement the need for to VFE always run
first but we can add documentation warnings about that. It looks like
we can do this optimization for 845, sm8250 and sm2850xp.
> 
> Also please add
> 
> Fixes: b4436a18eedb ("media: camss: add support for SM8250 camss") and
> cc stable@vger.kernel.org

Will do.

Jordan

