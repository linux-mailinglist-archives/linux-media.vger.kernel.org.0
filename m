Return-Path: <linux-media+bounces-17988-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC009716EF
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 13:32:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B67CD1C21847
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 11:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7258F1B654B;
	Mon,  9 Sep 2024 11:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bJSU0K86"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F5F1B5EAD;
	Mon,  9 Sep 2024 11:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725881505; cv=none; b=oglrhjAZwq8ZQ60vO/RURZcFwJ4r+TNfODZsmjAwog2VHi4JUywOuEJK22mqssX6ir1K2xbqP7fQvhTBY4W9IwFOAimR46GaJAx2vCRlzPfLdj863ledBs9AmzBPl4cP+Iqje0C7wwa9w/FzKWcOSvf6bK8ZkcE+tw6YMz4IyqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725881505; c=relaxed/simple;
	bh=HvvAyacZkn5TCe7k5z6EOZtDMR/W7YSYa3SHtYybxLo=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 MIME-Version:Content-Type; b=NzA8Bo8zR+0Jegxo8boxFgx7jf1jgzl+vZH39+nj8jjZZ4luFFREi8N0TP3SygaQrB0fYe4/mTyLlahTDl5QOm7YHJv6bdSdjyvQvCLGwQBw4S9FYxH34Vk5bflx6gsWXu/hiIJs6DOoTtDYvrsRQqLPldHcQczs5hsfZZjxOoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bJSU0K86; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B566C4CEC5;
	Mon,  9 Sep 2024 11:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725881505;
	bh=HvvAyacZkn5TCe7k5z6EOZtDMR/W7YSYa3SHtYybxLo=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=bJSU0K86tbXHFaOETav+onIb6a0vugOVYhnP9TM7CttSHk09o+CorYU+LcsSuV/aY
	 UDCK5svUr7dYXv+030BfKYZ2XQ4TginIqotHIseX2nsgzpGJe7g+9XbUQAo52sxhFB
	 +2DNKfgSWJQV259lHyOPmPIMmTC8k3odbhd0iApQuF8lvm+3A0bjMwdWvkrQhF9F2Y
	 oyBPHUkMaF9eM3FKqFTPcjWSJ9lpMJlQc8YZjWQMO0ddh4Tw4k0rSpmbHshajO4yLE
	 MR/dcYsZyW4rk6MoUv1LlGlmrzitOY1uhR7t8J5YPmNBb3vW7zrn4NANCGv9/t8LNU
	 d9Qv7Mx95seCA==
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
Date: Mon, 09 Sep 2024 14:31:40 +0300
In-Reply-To: <6to5p2dgsu6pvebkmkliojv5kfhnairigd46tmbraimxij7ddu@h6ziv7uwjeeq>
	(Dmitry Baryshkov's message of "Fri, 6 Sep 2024 03:49:06 +0300")
Message-ID: <871q1tgj1f.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:

> On Fri, Sep 06, 2024 at 08:19:28AM GMT, Miaoqing Pan wrote:
>
>> 
>> 
>> On 9/5/2024 8:49 PM, Dmitry Baryshkov wrote:
>> > On Thu, Sep 05, 2024 at 02:48:17PM GMT, Miaoqing Pan wrote:
>> > > Add a node for the PMU module of the WCN6855 present on the sa8775p-ride
>> > > board. Assign its LDO power outputs to the existing WiFi/Bluetooth module.
>> > > 
>> > > Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
>> > > ---
>> > >   arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 119 +++++++++++++++++++++
>> > >   arch/arm64/boot/dts/qcom/sa8775p.dtsi      |   2 +-
>> > >   2 files changed, 120 insertions(+), 1 deletion(-)
>> > > 
>> > > @@ -837,3 +939,20 @@ &usb_2_hsphy {
>> > >   &xo_board_clk {
>> > >   	clock-frequency = <38400000>;
>> > >   };
>> > > +
>> > > +&pcieport0 {
>> > > +	wifi@0 {
>> > > +		compatible = "pci17cb,1101";
>> > > +		reg = <0x10000 0x0 0x0 0x0 0x0>;
>> > > +
>> > > +		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
>> > > +		vddaon-supply = <&vreg_pmu_aon_0p59>;
>> > > +		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
>> > > +		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
>> > > +		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
>> > > +		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
>> > > +		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
>> > > +		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
>> > > +		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
>> > 
>> > Please add
>> > 
>> > qcom,ath11k-calibration-variant = "name";
>> 
>> No need, here the WiFi node is for 'drivers/pci/pwrctl', not ath11k driver.
>
> NAK, nodes describe hardware, not drivers. And we have had enough issues
> with the WCN wifi having collisions on the board-id / chip-id / etc.
>
> Maybe we should make calibration-data required for the DT-based systems?
> Kalle, WDYT?

I don't know exactly what hardware you are referring so this is just a
quick and vague answer, take all this as grain of salt.

I don't have any numbers but I'm assuming most of the
ath10k/ath11k/ath12k devices have the calibration data stored in OTP
inside the chip. There are also devices which store the calibration
outside the chip, for example in DT, but my understanding is that they
are a minority.

If we were to require that the calibration data needs to be in DT, and
not use OTP at all, that would limit the on types of devices ath11k can
be used. And I don't even know how we could easily extract the
calibration data from OTP and it would be extra work for everyone.
Honestly I don't really see any benefits from this, only negatives.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

