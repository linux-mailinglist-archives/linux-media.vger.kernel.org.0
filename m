Return-Path: <linux-media+bounces-5565-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B601085DBD7
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 14:46:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 22B43B27330
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 13:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C93DA7BAFB;
	Wed, 21 Feb 2024 13:45:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B829F77A03
	for <linux-media@vger.kernel.org>; Wed, 21 Feb 2024 13:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708523140; cv=none; b=l/N4/RViL/ktyqgTgr++7GM6cTE4qoEEt7+rXdusyJsbtsobLDycgPwClWANyEeaoSWMKDNVRl+7aq/ZdG96bLExLRFUZtgZLYslKV6mbKWx7XJcNszzEkt+aQlCV0BCiGjxXSXuUWAB5Kuv8MWJLy4ltTzNmWNG9xlm8ZCu+ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708523140; c=relaxed/simple;
	bh=juEouuUJ136A2uRyt4uiuxJPTi66X9k73J4uyYTWJ0A=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lptkG79EJn080bPNeCZ128LE/quKlXfN9+iVVJyBg5RBuRLqnrmEE4Kt7nuT17KhR7O9Wbinl+tF9159TrmEQkFU/WuG+H7Q8Q0rr+NeaHsabxwHf17ZVwr/t/uNBsaSdm0H7w42vebV0VTohoEqm59E9R5rmy+llV+BuKrZSSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rcmud-0006fc-1G; Wed, 21 Feb 2024 14:45:27 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rcmub-0023Ct-Qm; Wed, 21 Feb 2024 14:45:25 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rcmub-0009z1-2Q;
	Wed, 21 Feb 2024 14:45:25 +0100
Message-ID: <8598dea60afa80effd7fad2650dc045bc36d0f0e.camel@pengutronix.de>
Subject: Re: [PATCH v2 20/20] media: venus: pm_helpers: Use reset_bulk API
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Stanimir Varbanov
 <stanimir.k.varbanov@gmail.com>, Vikash Garodia
 <quic_vgarodia@quicinc.com>,  Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>, Andy Gross <agross@kernel.org>, Bjorn
 Andersson <andersson@kernel.org>,  Mauro Carvalho Chehab
 <mchehab@kernel.org>, Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, Stanimir Varbanov
	 <stanimir.varbanov@linaro.org>, Mauro Carvalho Chehab
	 <mchehab+huawei@kernel.org>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Wed, 21 Feb 2024 14:45:25 +0100
In-Reply-To: <466efa71-bd42-46b7-b81f-2a70d80e3f03@linaro.org>
References: <20230911-topic-mars-v2-0-3dac84b88c4b@linaro.org>
	 <20230911-topic-mars-v2-20-3dac84b88c4b@linaro.org>
	 <a25224f5d28aa65e8bfd14fe0a8f599b9f9e3f40.camel@pengutronix.de>
	 <ad20b872-0b50-4a16-b342-582d2f33eeca@linaro.org>
	 <1cf19cf23ffd88d9ffb673e8f382f3b1d24545bb.camel@pengutronix.de>
	 <466efa71-bd42-46b7-b81f-2a70d80e3f03@linaro.org>
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

On Mi, 2024-02-21 at 14:37 +0100, Konrad Dybcio wrote:
> On 21.02.2024 14:34, Philipp Zabel wrote:
> > On Mi, 2024-02-14 at 22:20 +0100, Konrad Dybcio wrote:
> > > On 14.02.2024 14:31, Philipp Zabel wrote:
> > > > Hi Konrad,
> > > >=20
> > > > On Fr, 2024-02-09 at 22:10 +0100, Konrad Dybcio wrote:
> > > > > All of the resets are toggled together. Use the bulk api to save =
on some
> > > > > code complexity.
> > > > >=20
> > > > > The delay between resets is now correctly determined by the reset
> > > > > framework.
> > > >=20
> > > > If this is a recent change, could you reference the commit?
> > >=20
> > > It's a series that recently landed in -next [1]
> >=20
> > Missing link?
>=20
> Yes, sorry!
>=20
> Konrad
>=20
> [1] https://lore.kernel.org/linux-arm-msm/20240105-topic-venus_reset-v2-0=
-c37eba13b5ce@linaro.org/

Thank you. With that,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

