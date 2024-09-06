Return-Path: <linux-media+bounces-17724-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DB596E6F5
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 02:49:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F9D31F23AFF
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 00:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 958131A270;
	Fri,  6 Sep 2024 00:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wYldyxlu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863D516415
	for <linux-media@vger.kernel.org>; Fri,  6 Sep 2024 00:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725583754; cv=none; b=Y3vxJkwsq79bFWUwmoScwI/sTvcx8VkC2Lbh3sizympIuPN8SdS6cCp0CPYBkN5b+AnwXOgEhztt1QVZ4qIjAWHQqckmoVTo5lo3VRmWwIUgr9ByaGuECYIWQraDdNxh4rrhmFuDVV2feWp+pSIMQb4lMjhGztbvLPowSJI9MPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725583754; c=relaxed/simple;
	bh=8b8IYCkGQC/U+G9zPL3oCOJFnnNaMUYOlSPyqHtd5Q8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RscfZa1wyCayrvY9IHJdOForkYbfDbLrLYgkWrf+gMavtHFBH2r30a8LWKruNSosl00JEH4y9VZ48YaHJ1128BPJSvxEEjeGTuwsbm0I02rsNMQYNIgJgzAmesqPYxc+xfmb8duzRayK23lVbx63BRLvXkqHoqQDceNKkZ327hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wYldyxlu; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53345dcd377so1763282e87.2
        for <linux-media@vger.kernel.org>; Thu, 05 Sep 2024 17:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725583750; x=1726188550; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AmfjfcKndugulugA7EAwTHkPQhPDlb23XTWYgaDDGF0=;
        b=wYldyxluIZz4Q6tZBlBErG6iuXCZaFxgOROXa4QgeP6yEFWFmg5xPhSV2qCSDJdirI
         FltMs3/WwFNtW4qPSPFm8OZ3/Ot383LRbogmCDEoJRhGeUUxOrZuthuhsG1G4k9jJYjT
         XHoYZ4WPMR+3eI7clM3GoZBUHdbhcCu5svO9hWAadU1JEx3tE1bmcKRvjv0T/B1S0Xby
         I4T8iV9KkfbbPOCTZsjoTDcL1ao64yNYELW0dHSUdFAYZJa8SLoDcb0HLkaWbKFONj1K
         JdXvv0YmBHyKDC7R0twPPIFgizXffb5t+QPlR/IJclUU1sm4sZCeEayCzTdmbzYwbAPd
         NPrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725583750; x=1726188550;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AmfjfcKndugulugA7EAwTHkPQhPDlb23XTWYgaDDGF0=;
        b=Op7wsOpJCbrco3RAgGhng0VliZKq/VDaihNLKYlEtr778UOj8En4m4sB0WRu9QHKr7
         ISwBqvc2FsD1zft95R09WdlJ4ZsMOVqYA/QRn4C+uJZGdiwrcJFrJTv86joInJ0Afa05
         2FtYuJDT2yKcqawovdAYnd1ziB/jJTWX1alqhLLMF8drHBmb9lj32H60/8opGzFld9mB
         CVmBTF05X1/Dl+7G2BdiBvnqj2JPdu/t2/PvImAcqblYT9rPGONJOxlRad419nMBLOr7
         4k4L8UtTyFEFPAF+dJF7xMI3mJ83V68unFTgdIyTw8zGAEaosF7WkY5R482zrkiN3BFe
         ZU/w==
X-Forwarded-Encrypted: i=1; AJvYcCVfYurbOA+cm+NmrubMWmQMTA/f00hi4X9toNDhgwwT8HTUz1TJdTNNh/DoS30B91PPS31G7aHy94xZzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvfyFe+RXNElNhAoEM69ePTDCtgk9CwD8i+Q6pDjyTIxbGWS2y
	VfH8pWGx6BiJr4M+2y23s20iieJkt27AYeOeCxz3Uy3o38vUygggUcZYy5mxio8=
X-Google-Smtp-Source: AGHT+IHIffC63U9mjEj2zVgbFJlFMy6oAWzMOiRekHkT67HeuZh2MpHA/BdRyQn6y5VmaPvlk2BXQg==
X-Received: by 2002:a05:6512:3ba1:b0:530:ae4a:58d0 with SMTP id 2adb3069b0e04-536587a40c6mr385814e87.8.1725583748976;
        Thu, 05 Sep 2024 17:49:08 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53568959814sm544349e87.251.2024.09.05.17.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 17:49:08 -0700 (PDT)
Date: Fri, 6 Sep 2024 03:49:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Miaoqing Pan <quic_miaoqing@quicinc.com>, ath11k@lists.infradead.org
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>, linux-arm-msm@vger.kernel.org, 
	linux-media@vger.kernel.org, agross@kernel.org, andersson@kernel.org, 
	linux-kernel@vger.kernel.org, konrad.dybcio@linaro.org, mchehab@kernel.org, 
	quic_vgarodia@quicinc.com, stanimir.k.varbanov@gmail.com, Kalle Valo <kvalo@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p-ride: add WiFi/BT nodes
Message-ID: <6to5p2dgsu6pvebkmkliojv5kfhnairigd46tmbraimxij7ddu@h6ziv7uwjeeq>
References: <20240905064817.3885953-1-quic_miaoqing@quicinc.com>
 <d6mt6i4a6xa3juvn4gzytuhsot2kx7dn4wmm3kmgwywfj2hcau@leecyxx36wql>
 <87a1a50f-f485-4a4f-91fc-34fa19312519@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a1a50f-f485-4a4f-91fc-34fa19312519@quicinc.com>

On Fri, Sep 06, 2024 at 08:19:28AM GMT, Miaoqing Pan wrote:
> 
> 
> On 9/5/2024 8:49 PM, Dmitry Baryshkov wrote:
> > On Thu, Sep 05, 2024 at 02:48:17PM GMT, Miaoqing Pan wrote:
> > > Add a node for the PMU module of the WCN6855 present on the sa8775p-ride
> > > board. Assign its LDO power outputs to the existing WiFi/Bluetooth module.
> > > 
> > > Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 119 +++++++++++++++++++++
> > >   arch/arm64/boot/dts/qcom/sa8775p.dtsi      |   2 +-
> > >   2 files changed, 120 insertions(+), 1 deletion(-)
> > > 
> > > @@ -837,3 +939,20 @@ &usb_2_hsphy {
> > >   &xo_board_clk {
> > >   	clock-frequency = <38400000>;
> > >   };
> > > +
> > > +&pcieport0 {
> > > +	wifi@0 {
> > > +		compatible = "pci17cb,1101";
> > > +		reg = <0x10000 0x0 0x0 0x0 0x0>;
> > > +
> > > +		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> > > +		vddaon-supply = <&vreg_pmu_aon_0p59>;
> > > +		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> > > +		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
> > > +		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> > > +		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> > > +		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
> > > +		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
> > > +		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
> > 
> > Please add
> > 
> > qcom,ath11k-calibration-variant = "name";
> 
> No need, here the WiFi node is for 'drivers/pci/pwrctl', not ath11k driver.

NAK, nodes describe hardware, not drivers. And we have had enough issues
with the WCN wifi having collisions on the board-id / chip-id / etc.

Maybe we should make calibration-data required for the DT-based systems?
Kalle, WDYT?

-- 
With best wishes
Dmitry

