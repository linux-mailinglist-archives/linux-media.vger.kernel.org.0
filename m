Return-Path: <linux-media+bounces-17995-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 108FF971A29
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 14:57:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 60812B22B38
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 12:57:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B2191B9B4A;
	Mon,  9 Sep 2024 12:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kQzRz1gJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46A41B9B43
	for <linux-media@vger.kernel.org>; Mon,  9 Sep 2024 12:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725886632; cv=none; b=Yws2kW0Zr0z5SYKsLDmnXihZYMcvgfVmcW9DYf/Kig2DMMAbBulVFWEGE8KHWqMurYaxUUV/hr5Hv7JmKasvlj1eb4JOCniaVAmaPQuZ5QKPy/5DPklX0acyOY27lSe2efx75pOz9jcB+M19v6Nwx+OmJsKcFUmWW23DjFhpvpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725886632; c=relaxed/simple;
	bh=VJrDj21vOIS62JlQsT0v0+UaclTuE4zpD/NzqT9l+xA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S4Td5p3ZMlxdV3IszmbOZ+jFCUVwQbfjB7bNdI2xaKh2Ezbg2PNhtU6fAEn7r8VjmzmJHadqZFBFWdUxpej/oSgphn0TaF/iIXc5gi1oEieRUtisUa2QbQ6mUJzdF6OIjQppf+fuiwmQIghUAlPT9fCEPmmKv48sIUgEhxsWMhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kQzRz1gJ; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53658f30749so3384220e87.3
        for <linux-media@vger.kernel.org>; Mon, 09 Sep 2024 05:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725886629; x=1726491429; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NdmWO/y6gEncx0yc/KC1ZIgIx6TLjxCgyEgLMmNM1FU=;
        b=kQzRz1gJtuaDoUuZCDWXVo1RLgWTeZPeLr841Le/PBOGCvzGNnUNcL51dQs5zShCP4
         YyNIACLuNg0Rie2LLMecj474nY+h0+Bp5ay/08FlQQ/7NYkKVQWEiQtUBl/uk0025Bjo
         ulj0KlkQduawJS1CEFlHTw9a0ytB95jF+kTYwFrThda2t75M9g4PMM/A0xLAkUexu4uL
         4x4Zyi7PjMH+eGHo3BSw+FTBP0bDrB/7hMisVIRD3hu3Tfizye7kD8D56+LnfG3xUHdm
         hli+QOqde2W42z86xhcz7tvDOqqaeT7pdWAeDXL5Z5PVqeeoBPuqNIwKIH+J+C1LdvWv
         1i1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725886629; x=1726491429;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NdmWO/y6gEncx0yc/KC1ZIgIx6TLjxCgyEgLMmNM1FU=;
        b=HPjMcs2y0PnZskcarYka+kFSC522uS7gcnnGgCUX+XIjKEG0+l5lX6+kAH+n6g4NEd
         grvkJsVenBnhaLlzj7y1Ckjqrbj+TzoR5X4zryqij1NLGORn+zuwK2AkUhXfqJJGTLpb
         5aLaAo6ADgG+9k5l+kozyltXq7H1t/dy0IaH0XtrsFKOjKTpHQNr/1pT+a0XBFL88Cis
         kWSpGEn965EjS7t20eWrtNKdPP+a5pZJCM7YL+EZ2k6WXLKDsKTk8mwxVfN40iFOT6VH
         59PG641kUgMaEW5OJQE3SkCsC9ipmycMX0gMNVEehlHpKus9a7lcpOdZReWLfOeu3i3A
         aYow==
X-Forwarded-Encrypted: i=1; AJvYcCUGgXuwbkc+BZhHfXnuOxHuHnmCzh0G+Vz8NfEfhFkLs0rUa0qK7cXJmw5DaSHRUMfmiru3KP2U7yRh1w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9T+kko2OO4alOd/ffBThbBQs+umZR3JSBBi50cXgux0yvJ+CN
	XbzwjXp5eqUVxxkFoJCegGniMvvJhfe3iMlkCpgLr6BqteNLhN4F0KUN0gOJoL8=
X-Google-Smtp-Source: AGHT+IGg6lD6GrF9orDPwQmF2EnUQWjg+tjIcVSrbmI3BFu/hSrE5+5/oRxQV8ihfoTz1okFEZmoYw==
X-Received: by 2002:a05:6512:2313:b0:533:40dc:8248 with SMTP id 2adb3069b0e04-536587a5453mr8033269e87.11.1725886628058;
        Mon, 09 Sep 2024 05:57:08 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5365f90d44asm749391e87.247.2024.09.09.05.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 05:57:07 -0700 (PDT)
Date: Mon, 9 Sep 2024 15:57:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: Miaoqing Pan <quic_miaoqing@quicinc.com>, ath11k@lists.infradead.org, 
	Dmitry Baryshkov <dbaryshkov@gmail.com>, linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
	agross@kernel.org, andersson@kernel.org, linux-kernel@vger.kernel.org, 
	konrad.dybcio@linaro.org, mchehab@kernel.org, quic_vgarodia@quicinc.com, 
	stanimir.k.varbanov@gmail.com
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p-ride: add WiFi/BT nodes
Message-ID: <5mz7b4tou6iohqkdt5igt4cajt4hzvibvphcyo7bzk3uf7jg45@unijiusqdpga>
References: <20240905064817.3885953-1-quic_miaoqing@quicinc.com>
 <d6mt6i4a6xa3juvn4gzytuhsot2kx7dn4wmm3kmgwywfj2hcau@leecyxx36wql>
 <87a1a50f-f485-4a4f-91fc-34fa19312519@quicinc.com>
 <6to5p2dgsu6pvebkmkliojv5kfhnairigd46tmbraimxij7ddu@h6ziv7uwjeeq>
 <871q1tgj1f.fsf@kernel.org>
 <CAA8EJpp9=tm1WAEc22-DZtTZsErqAiZM-0Cu-kc18E92frdYYA@mail.gmail.com>
 <87wmjlf1vf.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wmjlf1vf.fsf@kernel.org>

On Mon, Sep 09, 2024 at 03:27:48PM GMT, Kalle Valo wrote:
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
> 
> > On Mon, 9 Sept 2024 at 14:31, Kalle Valo <kvalo@kernel.org> wrote:
> >
> >>
> >> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
> >>
> >> > On Fri, Sep 06, 2024 at 08:19:28AM GMT, Miaoqing Pan wrote:
> >> >
> >> >>
> >> >>
> >> >> On 9/5/2024 8:49 PM, Dmitry Baryshkov wrote:
> >> >> > On Thu, Sep 05, 2024 at 02:48:17PM GMT, Miaoqing Pan wrote:
> >> >> > > Add a node for the PMU module of the WCN6855 present on the sa8775p-ride
> >> >> > > board. Assign its LDO power outputs to the existing WiFi/Bluetooth module.
> >> >> > >
> >> >> > > Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
> >> >> > > ---
> >> >> > >   arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 119 +++++++++++++++++++++
> >> >> > >   arch/arm64/boot/dts/qcom/sa8775p.dtsi      |   2 +-
> >> >> > >   2 files changed, 120 insertions(+), 1 deletion(-)
> >> >> > >
> >> >> > > @@ -837,3 +939,20 @@ &usb_2_hsphy {
> >> >> > >   &xo_board_clk {
> >> >> > >          clock-frequency = <38400000>;
> >> >> > >   };
> >> >> > > +
> >> >> > > +&pcieport0 {
> >> >> > > +        wifi@0 {
> >> >> > > +                compatible = "pci17cb,1101";
> >> >> > > +                reg = <0x10000 0x0 0x0 0x0 0x0>;
> >> >> > > +
> >> >> > > +                vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> >> >> > > +                vddaon-supply = <&vreg_pmu_aon_0p59>;
> >> >> > > +                vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> >> >> > > +                vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
> >> >> > > +                vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> >> >> > > +                vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> >> >> > > +                vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
> >> >> > > +                vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
> >> >> > > +                vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
> >> >> >
> >> >> > Please add
> >> >> >
> >> >> > qcom,ath11k-calibration-variant = "name";
> >> >>
> >> >> No need, here the WiFi node is for 'drivers/pci/pwrctl', not ath11k driver.
> >> >
> >> > NAK, nodes describe hardware, not drivers. And we have had enough issues
> >> > with the WCN wifi having collisions on the board-id / chip-id / etc.
> >> >
> >> > Maybe we should make calibration-data required for the DT-based systems?
> >> > Kalle, WDYT?
> >>
> >> I don't know exactly what hardware you are referring so this is just a
> >> quick and vague answer, take all this as grain of salt.
> >>
> >> I don't have any numbers but I'm assuming most of the
> >> ath10k/ath11k/ath12k devices have the calibration data stored in OTP
> >> inside the chip. There are also devices which store the calibration
> >> outside the chip, for example in DT, but my understanding is that they
> >> are a minority.
> >
> > Please excuse me, the comment was about the
> > qcom,athNk-calibration-variant
> 
> Ah :) In case you were wondering, I was talking above about
> qcom,ath10k-calibration-data property which is the full calibration
> data, board files are not used at all in that case. So please ignore all
> that I said.
> 
> > the property used to identify the BDF within board-2.bin. Currently
> > it is optional, which leads to developers omitting it. I think it's
> > worth making it a required property for new DT devices, making sure
> > that we don't have an issue with the plenty of boards programmed to
> > use 0xff as the board_id. Or just using the same ID, but different BDF
> > files.
> 
> This is also a quick answer, the merge window is getting close and we
> are finalising the ath12k MLO support so not much free time right now.
> 
> Some chipsets do provide unique information for the ath10k/ath11k/ath12k
> driver to choose the correct board file, but I guess they are mostly
> mobile chipsets. Though not even all mobile chipsets provide that, as
> you are painfully aware. For AP chipsets it seems to be a rule that they
> don't provide unique information to choose the board file and a variant
> field is always needed. So I think there is a point in your proposal.

Ack, thanks :-)

> 
> Backward compatibility is important but I think we already handle that,
> at least in ath11k, as it's first try with variant field and then
> without variant. But this needs more investigation on both ath11k and
> ath12k. I hope for ath10k we would not need to touch the driver anymore.
> 
> Can we revisit this in few weeks, after MLO is in better shape, and
> maybe you could start a new thread?

Sure. Let's agree that I'll send a patch after -rc1, if I don't forget
about it.

-- 
With best wishes
Dmitry

