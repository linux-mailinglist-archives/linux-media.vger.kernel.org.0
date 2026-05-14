Return-Path: <linux-media+bounces-61599-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPc8NVamBWppZQIAu9opvQ
	(envelope-from <linux-media+bounces-61599-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 12:39:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C65540793
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 12:39:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6AB683058812
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 10:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E5703845BC;
	Thu, 14 May 2026 10:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="CseaSslO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E948137FF51
	for <linux-media@vger.kernel.org>; Thu, 14 May 2026 10:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778755045; cv=pass; b=RmvBRSNrGsYQ33BwMwAx5uHDyzJios6TdwAPbBXi943DxCCckVKSMU5CDvNLvw3ZtDk4D9KNMgMNMYd+rFIGO7vYZb3cTkiky5CjkyFt5MLVTVn6mgWBVX/PQy9gmztt39ASWRKam9WOTURpD6HnQOd57i32GLSwHcYjojLIAVc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778755045; c=relaxed/simple;
	bh=E0NjQ6sLrqtu2y3b7cW8bDT8wuRFvJLBGrTK/7CjSWI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pKyQoBK0vy3f7rDZ87qJmN43HELpjhxQr8Go2Re33C23pnf+TJxoeA7VDyf/5qLgKzYLWfhEqem3hUm1bvavrdCXc4JR0dO8njgSVjwMpXc0MvTFcAAitVAlWa/ylu4nI+NMWApydLs4MK0c/zfT7t0IZZUcL7vwVzFqPo0UFdA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=CseaSslO; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-65e170f1ca5so563821d50.0
        for <linux-media@vger.kernel.org>; Thu, 14 May 2026 03:37:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778755043; cv=none;
        d=google.com; s=arc-20240605;
        b=Gd7ynJvws3lC8xnPE6+v9ZQKBGgg/KVivifFjElvvqZLyk5rQqDZHXuRmTJx6NqVae
         cfl44F3seUYtUpilRgDVNq5jnCUDaYBTbYWfW4ahXwDz2U2TvRZFdneMjjZIjYwKVinM
         GTH3gctDdB2RKKWbgy2BNobqm4b8eD+xOAW12WaMfmOPjTNqJ91cWSy52psrDnLko5ac
         vqD8d5N1HpQeXuNsOVP5HsG0ON3jFKZPzZaumEVkTBZwbu6Io+esFRB3MCiV1UwkAfS1
         s/d7RGkAUTRgiwf3eFaaf0iE84IU3qYw4HwqGKlFSpcyCqnGIZLtTiNxa7DY5tOHB5xf
         kcsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PR0NMnxb7hNJQN8iOgP8/OfZtOqSdbzOO+WU26KUku8=;
        fh=QHTeiUIFXu8Dcw1LUP5c8Oyw6uT511TdYa72rm9ufxA=;
        b=HaHWR/yM+6VPTSlv7U1DuAgZ2psr1uA7xlH+eaVDL5fTDL8tav3CK2+jI8p9Oxwcg5
         PKBAu8kGuL1bCtzKXpFBCJDq8XAyfh8CMiGhsucRv4JvdqRKoRIDOYmGa7u7JMAzm3X1
         9/SJVpHx4nru4BSTihWxSOztBnt+AV64pRjJfcQ0K9Yhi0rmDeQnW4BlaUN9chy7hbdn
         yN37VV013xj+VtmHl2+ulpmK1xCPhTWO4zrnfYNCeEvD8XgXNhP09ozST+aGKCPDs2IV
         vWThACvoaxdb8yd1xoGJcaTXISNOFQpRRA8NBy4pHzZtSIK7EjhjjHOKh7FdKrQw4xr/
         VHcQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1778755043; x=1779359843; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PR0NMnxb7hNJQN8iOgP8/OfZtOqSdbzOO+WU26KUku8=;
        b=CseaSslO4iT/Fjl0H+2LIP+2idgj3sdPCRtLSYAXxr0WOW+wOBqkAKuaZ6MXZ1TVSk
         NjK9batf/gMjS0lTaUKNFNBnZzEcDApnjZvfuL/IkkQJsyMBr41VgEqA5h3zMLRO7lXT
         SFn2VcshyK4ZwIi1A7hIzcfhywCq7k6geZoJ2feX822beFkVa/htiMXe+CF1FJbArhxT
         fbdmQuebqqhyWJCNAZ/c3L0xpGl439kbXtMGwTxWqmCTNLrb/V6ftdJBtUSpe09I51Fx
         dcHzCJASxV44Wf/XzhZ+kMSe3hhhkRKx6+JVBFVCU4qKfdQyitDqhieyTmz/rI7M5Lgo
         hREA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778755043; x=1779359843;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PR0NMnxb7hNJQN8iOgP8/OfZtOqSdbzOO+WU26KUku8=;
        b=WJMXYCfV/kTTW3nnDLwtf9zrprFaONH1YvlpaFvMcHsoYfuwNVmpEXiJRJdX6ZBbrk
         Yl2GyeO9jesz0fJ5S6ngTc9sv9D6+tKmscEiRhF4EcLzU5HXK2mKVLQdkD/fE7+O7r11
         Xi9LSpwK+h8ORKYHewCUctoSocAgIVMgSGDoDX3F5k5SOrpHW1utku64eVSA96uRz3hw
         Nei5+NAjX2vkxLiuGZHnaMaAsvyzjijNUM+Ses6MeQAap0ZuPAMm8lZkZNJoGSssTkNC
         MMdx/BhTDTpCTe7B6Rh5aGh5YVsL/AVZZH2/XK1tZl0z0NO2MrtZWDt9uAhvLrn2Rnv6
         NtBg==
X-Forwarded-Encrypted: i=1; AFNElJ86Fw+AUBFkFhy4WjjQP5FDA9GsH6fElNpp1QzIvaGgMrga5o/FI3Ljy5TqiBPkH3lR/lXgiLv5ZFMqoA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/So+SXdLcd/Bz9N1FVlzzdglxx3lA2yb/GRPaw4D0IIfeGYt4
	eRtCSfjLuREvXsHF8kISIQOElArMnLSNKEVAvXf3p03yuT5eJY5H7WAaN56ERnekdu3tFiOWkuF
	jP2eMKDHYdHlL5wyJdgUBg4Avm0DdIg8mAYyv73NvqA==
X-Gm-Gg: Acq92OF2I/wcRAb1VbJyG903TmUhUiqntZ3FB8St4JBLypTw/7Md5R9+k6TXwOcexkb
	s66hq7Lr5X3Avlq2ojwFkDZrM4CoNMo8IIbMEn5T1/9rZLOxdlHUCrKEmi3ScJpmHXOUoONvcMp
	4Q0rwCBQx/yR+n3sv4aIfSej3WRI8B1unCBx9rfKqrzyzp1mAa5ugn38f7u7VaTFPOMrRCRzBty
	tAASwkv7QE4BFNR1SFOL/TdGmMpqM3vBRsA/C8gchlYsLas1BtJ6634LAeBUdnxp/EaRFYeyX9M
	myaqaay6xEWbOnkKXhPJipEUNa9s1xhSiNfeB6mtOWup4WFA/LCKm7dcqg53aBc3K7UUmp/wK8g
	2IzjHlYAIPjSl2ULivqgqd+vyXKwyJceMn8lCKHTelHosqA==
X-Received: by 2002:a05:690c:19:b0:7bf:55b:8f95 with SMTP id
 00721157ae682-7c6d96408c0mr64757917b3.2.1778755043009; Thu, 14 May 2026
 03:37:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260506-media-imx355-v1-0-660685030455@raspberrypi.com>
 <20260506-media-imx355-v1-13-660685030455@raspberrypi.com> <agTD8L3gZczj8Eu2@rdacayan>
In-Reply-To: <agTD8L3gZczj8Eu2@rdacayan>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 14 May 2026 11:37:06 +0100
X-Gm-Features: AVHnY4KKsNRaE8mEUKS1LRy95YMxXwrkmK5zgcaMo5XYrNM4RTssAdJwlC0-Wa8
Message-ID: <CAPY8ntAXps=ES9PUJLiM1pZ=HpVQ=otsAs8VoBFaPk_pc9C-eg@mail.gmail.com>
Subject: Re: [PATCH 13/13] media: imx355: Support 2 lane readout.
To: Richard Acayan <mailingradian@gmail.com>
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
	20260414-imx355-24mhz-v1-1-9ae77bc6e7ec@ixit.cz
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 01C65540793
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61599-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,raspberrypi.com:email,raspberrypi.com:dkim]
X-Rspamd-Action: no action

Hi Richard

On Wed, 13 May 2026 at 19:32, Richard Acayan <mailingradian@gmail.com> wrote:
>
> On Wed, May 06, 2026 at 07:23:51PM +0100, Dave Stevenson wrote:
> > The sensor supports 2 or 4 lane readout, but the driver only allowed
> > for 4 lanes. Add 2 lane support.
> >
> > The clock tree was set to use single PLL mode to feed both IOP (MIPI)
> > and IVT (Pixel array).
> > 2 lane mode supports a MIPI link frequency of up to 445MHz (890Mbit/s)
> > cf 360MHz (720Mbit/s) for 4lane, but that requires switching to dual
> > PLL mode as the rates can't be achieved with simple divisors.
> > The LLP values are extended for each mode to account for the increased
> > time per line over the MIPI link.
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> >  drivers/media/i2c/imx355.c | 135 ++++++++++++++++++++++++++++-----------------
> >  1 file changed, 84 insertions(+), 51 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> > index d0e0e81d1e7c..fa1d1c86d5b0 100644
> > --- a/drivers/media/i2c/imx355.c
> > +++ b/drivers/media/i2c/imx355.c
> (snip)
> > @@ -1192,13 +1220,18 @@ static struct imx355_hwcfg *imx355_get_hwcfg(struct device *dev)
> >       if (!cfg)
> >               goto out_err;
> >
> > -     if (bus_cfg.bus.mipi_csi2.num_data_lanes != IMX355_DATA_LANES)
> > +     if (bus_cfg.bus.mipi_csi2.num_data_lanes != 2 &&
> > +         bus_cfg.bus.mipi_csi2.num_data_lanes != 4)
> >               goto out_err;
>
> Now we know that the sensor supports a configuration with 2 lanes.
> Previously, there was a question whether there was a configuration with
> a different number of data lanes (from
> https://lore.kernel.org/linux-arm-msm/3c51f9fe-9c5f-47dd-a971-5b2a9e416230@linaro.org/ ):
>
>         Does IMX355 sensor hardware support any other number of lanes?
>
>         1) If no, then it makes no practical sense to check for data lanes number
>         given by firmware, there can be any stored value, but it's known that the
>         number of sensor data lanes is 4.
>
>         2) If yes, then please return to the sensor dt bindings, and reflect any
>         other options, right now it is set strictly to 4 lanes only. In case if
>         'data-lanes' property is omitted, you can use 4 lanes as a default number
>         of data lanes, and this information shall be documented in the dt bindings.
>
> We should adjust the dt-bindings to accept a devicetree with 2 lanes.

Yes, I guess so.

The datasheet states:
"CSI-2 serial data output (selection of 4lane/2lane)"
So 2 or 4 lanes are the only supported options, and there is no
support in the sensor for lane reordering.

I don't think I've ever encountered a sensor that supports 3 lane
readout, and 1 lane is generally too limiting on data rate to be
overly useful.

  Dave

