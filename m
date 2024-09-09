Return-Path: <linux-media+bounces-17991-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BFE9718A7
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 13:52:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C4EEB260AE
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 11:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E9C51B6551;
	Mon,  9 Sep 2024 11:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="En+U8aFH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8191B5ED8
	for <linux-media@vger.kernel.org>; Mon,  9 Sep 2024 11:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725882651; cv=none; b=dXAAx73TjJxadqvTofWi1j/9+5VKQEkUDdfCqDtIeIZbmFEyy0ABDF5CeclY57it3UsMo0qVKAnPizDlS0R1eoRNx00JjOhfhWVnuZ2qAH0THaJ/oA5J/wQT0uuQK13bRUt+67enRID4dtmpdMv/hY3KX8/I5rW8iW6zgf+il0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725882651; c=relaxed/simple;
	bh=/vKv9O8BsKkayN5wsuBGzTwsSij/2e4p+gU9sM/ZVY8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qN1FccYDjvM+ohQpIllj691QdAwdW9471zyJprRS8TGnHAsA4p6EmWZA87TFguUr3w9L+AFQAg2wXOaI0RHEaRXhXOC54FHvptsP4UjDwNRSvsCe4oLylT8IKKRPVQDoG1eVnnbXUqO07IulgouTumdoIH0fOL5/zbadTgCSKLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=En+U8aFH; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6b6b9867f81so36421347b3.1
        for <linux-media@vger.kernel.org>; Mon, 09 Sep 2024 04:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725882648; x=1726487448; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PAz7CwHNVqz/dlCK7NR0kL8RetmLQ1f1T0LwcpAIkgI=;
        b=En+U8aFHm5W7Y08lSDYK5nnTkSIkrGMP5tgKpANsAM8KRUY+8Md9KIoxvhKJ0/IFMN
         uNXTs0y6JhJaW2Umi1Q2i+cFnXCaticnkYkaWETbWZeML7BebkgZn1H1DaB9q6bZpQ+e
         knL91Wh/yAOjcMwQmcSRpW62pJCx/DPnAeBjseob9Vvvut21kmVCzJc/bFuRtFmxvjeA
         tbXUPav3yWbx50UpxyezZUsdXlE5/BgIaU61sBRdSGCIYChahSPIXFijo24GFzOUHqa3
         vMvNY8DLbODwvYqEm3citVwfzXtVGH3nBBNu6QgV8A7oL+o9Zqi5J41pEp0L2QkOvZRs
         Cq5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725882648; x=1726487448;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PAz7CwHNVqz/dlCK7NR0kL8RetmLQ1f1T0LwcpAIkgI=;
        b=fo7nNU6wogvBFpN741cjdzWM1QYZk7ndj/2IcT/5XwMo79xLYtYYqvEgQ552FI8Pea
         +upCZA1vbkGIzidwywqdXU+zNfd2NHqL1jUh4kOEu3eDyyRBNcrjlALiDRd/o2jCK/I7
         ksQcMkur4CPjFNiG6M1Ld2uEVK77Gk9gKfwlT/CU/4Lgwnd6OeaA9lbBKIXeyAiHlgJD
         yM7Yil1wDjzw9dyp0vtN3LohpAyEggIqWZzTSxQZSqZgbio9fi+S1ygpJubR5l+9ELBx
         nCfsb8Mdaw4qh1vwFNYWts1RRCXGDn2ssXQLCJ6MIusWQJaF7TR60ObtcxjPqPr6Jn+E
         x+aQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSQM/8n7EuIEsgohkdjCgCE52chInAccRZog9rE1A5VZ6cgkiowpsu+EedKOaXpJ5bX5ywFhSscq0hwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2dYG7C2K9tXuqHpO3GpEsoNeRfcsmqI0BL9G3Mcjxj9sF5wds
	jQ8nLkD4ARTaRNV387gndERkjkZcpg6UOgfKIrYmifm1HG7K3rBFjuYt/PPVcRYA2cDHU3YK/2D
	+icwheou5fRWyDE5HWipYVL1wryboxAhQ1WyZ9w==
X-Google-Smtp-Source: AGHT+IFUTF0tj16jDoNeu3TE1nUleDa4pxpe3llpbtyBW8vJVSu1PZ3LjFNbLZtUj574g9rzI+6oQpQx8q8WiPN3NeY=
X-Received: by 2002:a05:690c:82:b0:6d3:b708:7b19 with SMTP id
 00721157ae682-6db44f2f0ccmr121030987b3.27.1725882647637; Mon, 09 Sep 2024
 04:50:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240905064817.3885953-1-quic_miaoqing@quicinc.com>
 <d6mt6i4a6xa3juvn4gzytuhsot2kx7dn4wmm3kmgwywfj2hcau@leecyxx36wql>
 <87a1a50f-f485-4a4f-91fc-34fa19312519@quicinc.com> <6to5p2dgsu6pvebkmkliojv5kfhnairigd46tmbraimxij7ddu@h6ziv7uwjeeq>
 <871q1tgj1f.fsf@kernel.org>
In-Reply-To: <871q1tgj1f.fsf@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 9 Sep 2024 14:50:37 +0300
Message-ID: <CAA8EJpp9=tm1WAEc22-DZtTZsErqAiZM-0Cu-kc18E92frdYYA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p-ride: add WiFi/BT nodes
To: Kalle Valo <kvalo@kernel.org>
Cc: Miaoqing Pan <quic_miaoqing@quicinc.com>, ath11k@lists.infradead.org, 
	Dmitry Baryshkov <dbaryshkov@gmail.com>, linux-arm-msm@vger.kernel.org, 
	linux-media@vger.kernel.org, agross@kernel.org, andersson@kernel.org, 
	linux-kernel@vger.kernel.org, konrad.dybcio@linaro.org, mchehab@kernel.org, 
	quic_vgarodia@quicinc.com, stanimir.k.varbanov@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Sept 2024 at 14:31, Kalle Valo <kvalo@kernel.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>
> > On Fri, Sep 06, 2024 at 08:19:28AM GMT, Miaoqing Pan wrote:
> >
> >>
> >>
> >> On 9/5/2024 8:49 PM, Dmitry Baryshkov wrote:
> >> > On Thu, Sep 05, 2024 at 02:48:17PM GMT, Miaoqing Pan wrote:
> >> > > Add a node for the PMU module of the WCN6855 present on the sa8775p-ride
> >> > > board. Assign its LDO power outputs to the existing WiFi/Bluetooth module.
> >> > >
> >> > > Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
> >> > > ---
> >> > >   arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 119 +++++++++++++++++++++
> >> > >   arch/arm64/boot/dts/qcom/sa8775p.dtsi      |   2 +-
> >> > >   2 files changed, 120 insertions(+), 1 deletion(-)
> >> > >
> >> > > @@ -837,3 +939,20 @@ &usb_2_hsphy {
> >> > >   &xo_board_clk {
> >> > >          clock-frequency = <38400000>;
> >> > >   };
> >> > > +
> >> > > +&pcieport0 {
> >> > > +        wifi@0 {
> >> > > +                compatible = "pci17cb,1101";
> >> > > +                reg = <0x10000 0x0 0x0 0x0 0x0>;
> >> > > +
> >> > > +                vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> >> > > +                vddaon-supply = <&vreg_pmu_aon_0p59>;
> >> > > +                vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> >> > > +                vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
> >> > > +                vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> >> > > +                vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> >> > > +                vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
> >> > > +                vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
> >> > > +                vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
> >> >
> >> > Please add
> >> >
> >> > qcom,ath11k-calibration-variant = "name";
> >>
> >> No need, here the WiFi node is for 'drivers/pci/pwrctl', not ath11k driver.
> >
> > NAK, nodes describe hardware, not drivers. And we have had enough issues
> > with the WCN wifi having collisions on the board-id / chip-id / etc.
> >
> > Maybe we should make calibration-data required for the DT-based systems?
> > Kalle, WDYT?
>
> I don't know exactly what hardware you are referring so this is just a
> quick and vague answer, take all this as grain of salt.
>
> I don't have any numbers but I'm assuming most of the
> ath10k/ath11k/ath12k devices have the calibration data stored in OTP
> inside the chip. There are also devices which store the calibration
> outside the chip, for example in DT, but my understanding is that they
> are a minority.

Please excuse me, the comment was about the
qcom,athNk-calibration-variant, the property used to identify the BDF
within board-2.bin. Currently it is optional, which leads to
developers omitting it.
I think it's worth making it a required property for new DT devices,
making sure that we don't have an issue with the plenty of boards
programmed to use 0xff as the board_id. Or just using the same ID, but
different BDF files.

-- 
With best wishes
Dmitry

