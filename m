Return-Path: <linux-media+bounces-5563-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 505C085DAED
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 14:35:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4BC11F2393A
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 13:35:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F4514D5BA;
	Wed, 21 Feb 2024 13:35:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40ECF7BAFF
	for <linux-media@vger.kernel.org>; Wed, 21 Feb 2024 13:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708522500; cv=none; b=B1HgWGilRJF4G6P1LHHpo4abQcs3FRCdOfbabQpYEnfaAeIp67nHfcSvm1q6LxvW5Maz3/pxFxWIqYp6aKW5q9NB024nkF9E8eibmv92vzuSiOSwS66EjKQB0HcpWoSFSz840RRt4Z+I9MKbtccdWD90MJNAT4wXwoXjR0n5/hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708522500; c=relaxed/simple;
	bh=zqql2sXx3i2yN008ue+WEu6k8Gl5CMT7NyPCC0UJ8ns=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RMjHlfi7DdAY1An7DwcC4XTUkRfibGCCTmyPUfFdZClUCxAcUXfGBjT8bl/Onv21nW+Vf2CEfyR9ZFfL0WWQbV30/38f3LJU224NZuKu7WRebNMTSQshSJNdxWTdwUW7BKIoFgeKAhVDXsr0Kgs3LSRwx3Qn6vmo4lKC7uonzlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rcmkJ-0004t7-E2; Wed, 21 Feb 2024 14:34:47 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rcmkH-0023Bm-UM; Wed, 21 Feb 2024 14:34:45 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rcmkH-0009YG-2o;
	Wed, 21 Feb 2024 14:34:45 +0100
Message-ID: <1cf19cf23ffd88d9ffb673e8f382f3b1d24545bb.camel@pengutronix.de>
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
Date: Wed, 21 Feb 2024 14:34:45 +0100
In-Reply-To: <ad20b872-0b50-4a16-b342-582d2f33eeca@linaro.org>
References: <20230911-topic-mars-v2-0-3dac84b88c4b@linaro.org>
	 <20230911-topic-mars-v2-20-3dac84b88c4b@linaro.org>
	 <a25224f5d28aa65e8bfd14fe0a8f599b9f9e3f40.camel@pengutronix.de>
	 <ad20b872-0b50-4a16-b342-582d2f33eeca@linaro.org>
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

On Mi, 2024-02-14 at 22:20 +0100, Konrad Dybcio wrote:
> On 14.02.2024 14:31, Philipp Zabel wrote:
> > Hi Konrad,
> >=20
> > On Fr, 2024-02-09 at 22:10 +0100, Konrad Dybcio wrote:
> > > All of the resets are toggled together. Use the bulk api to save on s=
ome
> > > code complexity.
> > >=20
> > > The delay between resets is now correctly determined by the reset
> > > framework.
> >=20
> > If this is a recent change, could you reference the commit?
>=20
> It's a series that recently landed in -next [1]

Missing link?

> [...]
>=20
> >=20
> > Since VIDC_RESETS_NUM_MAX is only 2, I don't think a separate
> > allocation is worth it.
>=20
> It's 2 today, anyway. I wanted to keep it flexible

If this is expected to grow, fine.

> [...]
>=20
> > > +	ret =3D reset_control_bulk_reset(res->resets_num, core->resets);
> > > +	if (ret)
> > > +		dev_err(core->dev, "Failed to toggle resets: %d\n", ret);
> > > =20
> > > -err:
> > >  	return ret;
> >=20
> > Could be simplified to:
> >=20
> > 	return reset_control_bulk_reset(res->resets_num, core-
> > > resets);
>=20
> I intentionally kept the if (ret) to print a specific error message
> in case the call fails, this driver doesn't go a good job of telling
> the user/developer what went wrong.

Oh, ok.

regards
Philipp

