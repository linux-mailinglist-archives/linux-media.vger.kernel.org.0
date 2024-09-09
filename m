Return-Path: <linux-media+bounces-17992-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EC85D971947
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 14:28:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 158911C22DBA
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 12:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F269E1B7902;
	Mon,  9 Sep 2024 12:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ls4ZGG5f"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5680C1779B8;
	Mon,  9 Sep 2024 12:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725884873; cv=none; b=i4xjICeM1LLoFqlwP/+8/9giuR4wlysHQCMvBxJLlKIHbTzk4cGI2cnKw2DtaRVArXN3q0ZU/joIEIElT/UD296/fN4KM093+Lh2mZKj0jUDN6d0ZoZF0J/sI5oT7e4RFw+02KScMioGCuTWh+JtBxNF+laNsYCpcMY4s5zQXQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725884873; c=relaxed/simple;
	bh=xihG0F0Xe4bZ2zim7d5M+oeu6XOY3nQcYYkTkt/ZXUQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 MIME-Version:Content-Type; b=qKbKleuch9xtBfyUi0KDbVdGM/nyj2JiF/Wd9MXDMT4R2IGAp2X/tlHkPCaoXWdOBD/8jvuFZdZz1zu9Zd7Kz7GdtaRkD7jxvEZYMwd8qPR/WyMbNvF8qWdkcKjCmoN/wNSvn8eb/fnaRpmtNHB0Ep2mKMpaLGTQahNnImA4t58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ls4ZGG5f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C855C4CEC5;
	Mon,  9 Sep 2024 12:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725884873;
	bh=xihG0F0Xe4bZ2zim7d5M+oeu6XOY3nQcYYkTkt/ZXUQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=ls4ZGG5fA8Ih3onoFraGLSA1GzuZ17O6rcRViOa7hFrNZtf8ORiuSKW79VXfAcvau
	 mVS8t/3cyXVIhZfOs0F/MKZ0izqvlc5HieTLsQVm6+cw216r3hInFAbARRZkm9CsqO
	 r4oDvsRFbGx1N6E0a7Rf1UazOuHwY11Y751XICWyqYST9fXg+L9KOj2i81i9gtt1tR
	 8UIqG1bwlXj39cN0ingW4O3a5rfYGkI3BI8+BNPf1OB6JdjCV8kIShRJtSAlxU4D/4
	 UqB3IfF31cbHABsoMxnV1IgYJVPmXPZEEbd/0f6vp5CxXXoxektzqepdkN51BOAxqF
	 5QJUx9GnmlX1g==
From: Kalle Valo <kvalo@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Miaoqing Pan <quic_miaoqing@quicinc.com>,  ath11k@lists.infradead.org,
  Dmitry Baryshkov <dbaryshkov@gmail.com>,  linux-arm-msm@vger.kernel.org,
  linux-media@vger.kernel.org,  agross@kernel.org,  andersson@kernel.org,
  linux-kernel@vger.kernel.org,  konrad.dybcio@linaro.org,
  mchehab@kernel.org,  quic_vgarodia@quicinc.com,
  stanimir.k.varbanov@gmail.com
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p-ride: add WiFi/BT nodes
References: <20240905064817.3885953-1-quic_miaoqing@quicinc.com>
	<d6mt6i4a6xa3juvn4gzytuhsot2kx7dn4wmm3kmgwywfj2hcau@leecyxx36wql>
	<87a1a50f-f485-4a4f-91fc-34fa19312519@quicinc.com>
	<6to5p2dgsu6pvebkmkliojv5kfhnairigd46tmbraimxij7ddu@h6ziv7uwjeeq>
	<871q1tgj1f.fsf@kernel.org>
	<CAA8EJpp9=tm1WAEc22-DZtTZsErqAiZM-0Cu-kc18E92frdYYA@mail.gmail.com>
Date: Mon, 09 Sep 2024 15:27:48 +0300
In-Reply-To: <CAA8EJpp9=tm1WAEc22-DZtTZsErqAiZM-0Cu-kc18E92frdYYA@mail.gmail.com>
	(Dmitry Baryshkov's message of "Mon, 9 Sep 2024 14:50:37 +0300")
Message-ID: <87wmjlf1vf.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:

> On Mon, 9 Sept 2024 at 14:31, Kalle Valo <kvalo@kernel.org> wrote:
>
>>
>> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>>
>> > On Fri, Sep 06, 2024 at 08:19:28AM GMT, Miaoqing Pan wrote:
>> >
>> >>
>> >>
>> >> On 9/5/2024 8:49 PM, Dmitry Baryshkov wrote:
>> >> > On Thu, Sep 05, 2024 at 02:48:17PM GMT, Miaoqing Pan wrote:
>> >> > > Add a node for the PMU module of the WCN6855 present on the sa8775p-ride
>> >> > > board. Assign its LDO power outputs to the existing WiFi/Bluetooth module.
>> >> > >
>> >> > > Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
>> >> > > ---
>> >> > >   arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 119 +++++++++++++++++++++
>> >> > >   arch/arm64/boot/dts/qcom/sa8775p.dtsi      |   2 +-
>> >> > >   2 files changed, 120 insertions(+), 1 deletion(-)
>> >> > >
>> >> > > @@ -837,3 +939,20 @@ &usb_2_hsphy {
>> >> > >   &xo_board_clk {
>> >> > >          clock-frequency = <38400000>;
>> >> > >   };
>> >> > > +
>> >> > > +&pcieport0 {
>> >> > > +        wifi@0 {
>> >> > > +                compatible = "pci17cb,1101";
>> >> > > +                reg = <0x10000 0x0 0x0 0x0 0x0>;
>> >> > > +
>> >> > > +                vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
>> >> > > +                vddaon-supply = <&vreg_pmu_aon_0p59>;
>> >> > > +                vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
>> >> > > +                vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
>> >> > > +                vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
>> >> > > +                vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
>> >> > > +                vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
>> >> > > +                vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
>> >> > > +                vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
>> >> >
>> >> > Please add
>> >> >
>> >> > qcom,ath11k-calibration-variant = "name";
>> >>
>> >> No need, here the WiFi node is for 'drivers/pci/pwrctl', not ath11k driver.
>> >
>> > NAK, nodes describe hardware, not drivers. And we have had enough issues
>> > with the WCN wifi having collisions on the board-id / chip-id / etc.
>> >
>> > Maybe we should make calibration-data required for the DT-based systems?
>> > Kalle, WDYT?
>>
>> I don't know exactly what hardware you are referring so this is just a
>> quick and vague answer, take all this as grain of salt.
>>
>> I don't have any numbers but I'm assuming most of the
>> ath10k/ath11k/ath12k devices have the calibration data stored in OTP
>> inside the chip. There are also devices which store the calibration
>> outside the chip, for example in DT, but my understanding is that they
>> are a minority.
>
> Please excuse me, the comment was about the
> qcom,athNk-calibration-variant

Ah :) In case you were wondering, I was talking above about
qcom,ath10k-calibration-data property which is the full calibration
data, board files are not used at all in that case. So please ignore all
that I said.

> the property used to identify the BDF within board-2.bin. Currently
> it is optional, which leads to developers omitting it. I think it's
> worth making it a required property for new DT devices, making sure
> that we don't have an issue with the plenty of boards programmed to
> use 0xff as the board_id. Or just using the same ID, but different BDF
> files.

This is also a quick answer, the merge window is getting close and we
are finalising the ath12k MLO support so not much free time right now.

Some chipsets do provide unique information for the ath10k/ath11k/ath12k
driver to choose the correct board file, but I guess they are mostly
mobile chipsets. Though not even all mobile chipsets provide that, as
you are painfully aware. For AP chipsets it seems to be a rule that they
don't provide unique information to choose the board file and a variant
field is always needed. So I think there is a point in your proposal.

Backward compatibility is important but I think we already handle that,
at least in ath11k, as it's first try with variant field and then
without variant. But this needs more investigation on both ath11k and
ath12k. I hope for ath10k we would not need to touch the driver anymore.

Can we revisit this in few weeks, after MLO is in better shape, and
maybe you could start a new thread?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

